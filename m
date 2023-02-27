Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E87E06A44D8
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 15:41:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWeYs-0002fp-Ds; Mon, 27 Feb 2023 09:33:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+6644499f1bfadfc93882+7127+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1pWeVg-0005Rj-6m
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:29:57 -0500
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+6644499f1bfadfc93882+7127+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1pWeVX-0004bN-9K
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:29:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=OYAtBBPYkBYDsXDNjyfQDnSJDNa8RCRB43PfRzQTpiI=; b=k2/C+z/aGKF+haBXIU7jdkyu+J
 NV67icQFMdQ1HMnHdKPfJ/0tOYftVwsM/XzSXLwE8Ts5zURJOg8RG1k87wlY0F5XrxeQVYk0rGji+
 2EL1C/7D2nri1B3SqWerlosQnF4QyOEE3Dbd8wjgXiJupnqywi90P4V9pCK3Iyy0ubXdupWAOwHWF
 4ixAqqtAuXrYyDE0cDaXnRiSLL0ocN2BDIhWeSsMCejSFq8DG/2N+M2vecVcjx8qYI8dHSksctZXa
 dRf9CP4/cl5/3PuncLWGuOtUFEx1te8S/BGFe5kQCw2+CHSuFazaA9/0BiYnUI6f68eqsimUlm1U5
 wVKQI9EA==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1pWeV7-00EFCP-1w; Mon, 27 Feb 2023 14:29:25 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1pWeV7-0027DK-1Y; Mon, 27 Feb 2023 14:29:13 +0000
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
Subject: [PATCH v14 46/60] hw/xen: Implement GNTTABOP_query_size
Date: Mon, 27 Feb 2023 14:28:54 +0000
Message-Id: <20230227142908.503517-47-dwmw2@infradead.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230227142908.503517-1-dwmw2@infradead.org>
References: <20230227142908.503517-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 desiato.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05;
 envelope-from=BATV+6644499f1bfadfc93882+7127+infradead.org+dwmw2@desiato.srs.infradead.org;
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

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Paul Durrant <paul@xen.org>
---
 hw/i386/kvm/xen_gnttab.c  | 19 +++++++++++++++++++
 hw/i386/kvm/xen_gnttab.h  |  2 ++
 target/i386/kvm/xen-emu.c | 16 +++++++++++++++-
 3 files changed, 36 insertions(+), 1 deletion(-)

diff --git a/hw/i386/kvm/xen_gnttab.c b/hw/i386/kvm/xen_gnttab.c
index b54a94e2bd..1e691ded32 100644
--- a/hw/i386/kvm/xen_gnttab.c
+++ b/hw/i386/kvm/xen_gnttab.c
@@ -211,3 +211,22 @@ int xen_gnttab_get_version_op(struct gnttab_get_version *get)
     get->version = 1;
     return 0;
 }
+
+int xen_gnttab_query_size_op(struct gnttab_query_size *size)
+{
+    XenGnttabState *s = xen_gnttab_singleton;
+
+    if (!s) {
+        return -ENOTSUP;
+    }
+
+    if (size->dom != DOMID_SELF && size->dom != xen_domid) {
+        size->status = GNTST_bad_domain;
+        return 0;
+    }
+
+    size->status = GNTST_okay;
+    size->nr_frames = s->nr_frames;
+    size->max_nr_frames = s->max_frames;
+    return 0;
+}
diff --git a/hw/i386/kvm/xen_gnttab.h b/hw/i386/kvm/xen_gnttab.h
index 79579677ba..3bdbe96191 100644
--- a/hw/i386/kvm/xen_gnttab.h
+++ b/hw/i386/kvm/xen_gnttab.h
@@ -17,7 +17,9 @@ int xen_gnttab_map_page(uint64_t idx, uint64_t gfn);
 
 struct gnttab_set_version;
 struct gnttab_get_version;
+struct gnttab_query_size;
 int xen_gnttab_set_version_op(struct gnttab_set_version *set);
 int xen_gnttab_get_version_op(struct gnttab_get_version *get);
+int xen_gnttab_query_size_op(struct gnttab_query_size *size);
 
 #endif /* QEMU_XEN_GNTTAB_H */
diff --git a/target/i386/kvm/xen-emu.c b/target/i386/kvm/xen-emu.c
index d49b6117f1..3b46cab1da 100644
--- a/target/i386/kvm/xen-emu.c
+++ b/target/i386/kvm/xen-emu.c
@@ -1207,7 +1207,21 @@ static bool kvm_xen_hcall_gnttab_op(struct kvm_xen_exit *exit, X86CPU *cpu,
         }
         break;
     }
-    case GNTTABOP_query_size:
+    case GNTTABOP_query_size: {
+        struct gnttab_query_size size;
+
+        qemu_build_assert(sizeof(size) == 16);
+        if (kvm_copy_from_gva(cs, arg, &size, sizeof(size))) {
+            err = -EFAULT;
+            break;
+        }
+
+        err = xen_gnttab_query_size_op(&size);
+        if (!err && kvm_copy_to_gva(cs, arg, &size, sizeof(size))) {
+            err = -EFAULT;
+        }
+        break;
+    }
     case GNTTABOP_setup_table:
     case GNTTABOP_copy:
     case GNTTABOP_map_grant_ref:
-- 
2.39.0


