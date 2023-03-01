Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 187386A6DCC
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 15:05:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXMwu-00005d-Tw; Wed, 01 Mar 2023 08:56:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+1cb70579e185fe7dd8a8+7129+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1pXMsr-0008P5-KS
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 08:52:44 -0500
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+1cb70579e185fe7dd8a8+7129+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1pXMsn-0002nK-PT
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 08:52:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=VlOMcvbQ8wdlEiqisxSjaMtlGLJ+Qpjp9N0r/gX0p8I=; b=hbwDwR8lGETXxuFLKESv/KLtug
 +EhTC4Mjhw5ahgFuLzFThlM0vp20A7T97T2yQQipbOgDy+S2qZu86yW/+xDr+fnsnBnlB5u1NaR5Y
 pfdEaL1KoG8eMJcZWQ1VNHj5e1Q5KljKnNXB1kKVwpGI3aRVXGB8bk5HrBnlpbeYwT7L8yJLn+9rr
 X2c+zoZpnpmqYUas+gC5Fy2Hn57pcQTvfTJuk/i7dcDKsj19RkAd6muMRxc0rCyDFzUMBsW7sexbU
 iF6U5j+nDHvoPXHpcXnXWwY3wFIebY5XAybHqIUa2h4TjzlUWLlZyO8nZDKyvhCCH9DACD35jwyXe
 /xLKkeJw==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1pXMsb-00EuVU-1z; Wed, 01 Mar 2023 13:52:28 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1pXMsb-0049Tl-1b; Wed, 01 Mar 2023 13:52:25 +0000
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
Subject: [PATCH v15 03/60] xen: Add XEN_DISABLED mode and make it default
Date: Wed,  1 Mar 2023 13:51:26 +0000
Message-Id: <20230301135223.988336-4-dwmw2@infradead.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230301135223.988336-1-dwmw2@infradead.org>
References: <20230301135223.988336-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 desiato.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05;
 envelope-from=BATV+1cb70579e185fe7dd8a8+7129+infradead.org+dwmw2@desiato.srs.infradead.org;
 helo=desiato.infradead.org
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
index c1b697a8bd..e85e4aeba5 100644
--- a/accel/xen/xen-all.c
+++ b/accel/xen/xen-all.c
@@ -171,6 +171,8 @@ static int xen_init(MachineState *ms)
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


