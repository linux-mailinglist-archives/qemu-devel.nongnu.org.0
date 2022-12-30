Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD40365982A
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Dec 2022 13:28:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pBEFy-0007pE-Pb; Fri, 30 Dec 2022 07:13:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+1132f1bfe572585e6c7f+7068+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1pBEFr-0007l4-K4
 for qemu-devel@nongnu.org; Fri, 30 Dec 2022 07:12:55 -0500
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+1132f1bfe572585e6c7f+7068+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1pBEFk-0004y6-Rc
 for qemu-devel@nongnu.org; Fri, 30 Dec 2022 07:12:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=wGz/97gerC5nTf4asngFYPOorLQA33+jjszC0xI0LQk=; b=JES5a8IlhB9KQp3gaCq0Sms8dH
 tl/vPEoJGHBVtw7ZCaUktsyvIAEUe95qVDwx/0tSR8zdrVYuz+41OIqeVmHoyAx+rd+Saheap4YX4
 B876ArVE97V6iK0ShsAk78xvEp1r6OQy4kGkJpZ0gWMht8Ul5JaG/xTxTYwxd+wy6smSfQ0lTtZ2G
 Ef4oyiqMmRUYc+VfvnL8SA4U3FyT99wUo8AnJepq4cP+ehMZ6nGTWfctjR6TC8RDoOoT3e38LEDtZ
 gdHOm00L293XvkfHlhtQ6cp+GF5SG6wPqQLvuCJWX29BjgGI5zEuuZuXN4wjfWDChZaEte2sGyeDf
 fnMvy7zw==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1pBEFk-00Ac7v-Cp; Fri, 30 Dec 2022 12:12:48 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1pBEFZ-005NvM-5h; Fri, 30 Dec 2022 12:12:37 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Paul Durrant <paul@xen.org>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Julien Grall <julien@xen.org>
Subject: [RFC PATCH v5 03/52] xen: Add XEN_DISABLED mode and make it default
Date: Fri, 30 Dec 2022 12:11:46 +0000
Message-Id: <20221230121235.1282915-4-dwmw2@infradead.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20221230121235.1282915-1-dwmw2@infradead.org>
References: <20221230121235.1282915-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1236::1;
 envelope-from=BATV+1132f1bfe572585e6c7f+7068+infradead.org+dwmw2@casper.srs.infradead.org;
 helo=casper.infradead.org
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: David Woodhouse <dwmw@amazon.co.uk>

Also set XEN_ATTACH mode in xen_init() to reflect the truth; not that
anyone ever cared before. It was *only* ever checked in xen_init_pv()
before.

Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Paul Durrant <paul@xen.org>
---
 accel/xen/xen-all.c  | 2 ++
 include/hw/xen/xen.h | 5 +++--
 softmmu/globals.c    | 2 +-
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/accel/xen/xen-all.c b/accel/xen/xen-all.c
index 69aa7d018b..2329556595 100644
--- a/accel/xen/xen-all.c
+++ b/accel/xen/xen-all.c
@@ -181,6 +181,8 @@ static int xen_init(MachineState *ms)
      * opt out of system RAM being allocated by generic code
      */
     mc->default_ram_id = NULL;
+
+    xen_mode = XEN_ATTACH;
     return 0;
 }
 
diff --git a/include/hw/xen/xen.h b/include/hw/xen/xen.h
index afdf9c436a..82347e76a4 100644
--- a/include/hw/xen/xen.h
+++ b/include/hw/xen/xen.h
@@ -12,8 +12,9 @@
 
 /* xen-machine.c */
 enum xen_mode {
-    XEN_EMULATE = 0,  // xen emulation, using xenner (default)
-    XEN_ATTACH        // attach to xen domain created by libxl
+    XEN_DISABLED = 0, // xen support disabled (default)
+    XEN_ATTACH,       // attach to xen domain created by libxl
+    XEN_EMULATE,
 };
 
 extern uint32_t xen_domid;
diff --git a/softmmu/globals.c b/softmmu/globals.c
index 527edbefdd..0a4405614e 100644
--- a/softmmu/globals.c
+++ b/softmmu/globals.c
@@ -63,5 +63,5 @@ QemuUUID qemu_uuid;
 bool qemu_uuid_set;
 
 uint32_t xen_domid;
-enum xen_mode xen_mode = XEN_EMULATE;
+enum xen_mode xen_mode = XEN_DISABLED;
 bool xen_domid_restrict;
-- 
2.35.3


