Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C936A44F8
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 15:44:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWeWd-0007LO-Te; Mon, 27 Feb 2023 09:30:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+00d7f2b94bb5c8854cf5+7127+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1pWeVQ-00059q-Ij
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:29:36 -0500
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+00d7f2b94bb5c8854cf5+7127+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1pWeVM-0004WD-PN
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:29:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=3SaJ0vXfHGj5HHQn1xN4sw8wmKBQEYe1KMoDn4SjFMg=; b=j7ObY27DQlbY3HMCyDJOPVKrSA
 VCnwB4sathrpGmvck5wCp8UkAvI8Kq8OFFPswEIVxghn8ssL058puQLXey3ej+/MZVAchoVe/2CT3
 G27z3RxDv38MM5VGAgPKCxNk0fdiWG1dVxleY0BN1bMDpSz5FrXM2jjEoUz4t0t3HzI0iXaKIIHy1
 k8tpBYheWrtJsm7hQW2KnJOF1j3dD1Uk0jWsH1Xr1dGCns/avF3zbYPO712hXjMbaf/gB8G7WIKG4
 YEAd/KtlhTX466DBcDdQKmaqXfa1b01VecEykmc5flwDRt6brh2QHF5KAQrOJ06+IkSTz4TDYMKCX
 DFlvk2fQ==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1pWeV4-000ATO-SH; Mon, 27 Feb 2023 14:29:11 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1pWeV4-0027A7-2n; Mon, 27 Feb 2023 14:29:10 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Paul Durrant <paul@xen.org>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Julien Grall <julien@xen.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, armbru@redhat.com,
 Stefano Stabellini <sstabellini@kernel.org>, vikram.garhwal@amd.com
Subject: [PATCH v14 03/60] xen: Add XEN_DISABLED mode and make it default
Date: Mon, 27 Feb 2023 14:28:11 +0000
Message-Id: <20230227142908.503517-4-dwmw2@infradead.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230227142908.503517-1-dwmw2@infradead.org>
References: <20230227142908.503517-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1236::1;
 envelope-from=BATV+00d7f2b94bb5c8854cf5+7127+infradead.org+dwmw2@casper.srs.infradead.org;
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
index 4d412fd4b2..03983939f9 100644
--- a/include/hw/xen/xen.h
+++ b/include/hw/xen/xen.h
@@ -22,8 +22,9 @@
 
 /* xen-machine.c */
 enum xen_mode {
-    XEN_EMULATE = 0,  // xen emulation, using xenner (default)
-    XEN_ATTACH        // attach to xen domain created by libxl
+    XEN_DISABLED = 0, /* xen support disabled (default) */
+    XEN_ATTACH,       /* attach to xen domain created by libxl */
+    XEN_EMULATE,      /* emulate Xen within QEMU */
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
2.39.0


