Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36B5866D13D
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 23:03:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHXW8-0008J7-N7; Mon, 16 Jan 2023 16:59:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+491b11caf3ce55304f6a+7085+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1pHXUz-0006rl-JF
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 16:58:37 -0500
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+491b11caf3ce55304f6a+7085+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1pHXUt-0003e3-R6
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 16:58:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=13oHhGrJ3f8JF5HinfNtu4r206w6IDk1JeN+CEtp6YA=; b=HtaM1+GFeFQHgru3RIBBdSxeFI
 Or/iFKBvBZpZHrfBwcA8pN0FkSbUtVVe3h0wQg/K86zgKRu4MLYU90Mt2JrQYOTMJi+n+9ypmvMZu
 XJIlISMa0MqDhdJcJIxNOxS72sIzdjd9J/T9wORn909FXMrc3bK6PhnqqzVN2plXH/SN/0l4XoCpE
 oAEt6yC1LgG++RkY3FjTCGgCsGSR9gM8t+SNr9qVh0B6l7FDXp1StdRsy4jYY2qrsQnnnvFbVl4Zu
 BtIns0DuSR0U6Gw7ZXoNTQQESf9nMPPPrNnI3Kv3cHYYrve47H0onTksZ2h++vmd14F3govOCoYeN
 5XbcUzyg==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1pHXUO-005jRu-1V; Mon, 16 Jan 2023 21:58:04 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1pHXUX-004iQg-2q; Mon, 16 Jan 2023 21:58:09 +0000
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
 Claudio Fontana <cfontana@suse.de>, Julien Grall <julien@xen.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, armbru@redhat.com
Subject: [PATCH v7 45/51] hw/xen: Implement GNTTABOP_query_size
Date: Mon, 16 Jan 2023 21:57:59 +0000
Message-Id: <20230116215805.1123514-46-dwmw2@infradead.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230116215805.1123514-1-dwmw2@infradead.org>
References: <20230116215805.1123514-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 desiato.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05;
 envelope-from=BATV+491b11caf3ce55304f6a+7085+infradead.org+dwmw2@desiato.srs.infradead.org;
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
---
 hw/i386/kvm/xen_gnttab.c  | 19 +++++++++++++++++++
 hw/i386/kvm/xen_gnttab.h  |  2 ++
 target/i386/kvm/xen-emu.c | 16 +++++++++++++++-
 3 files changed, 36 insertions(+), 1 deletion(-)

diff --git a/hw/i386/kvm/xen_gnttab.c b/hw/i386/kvm/xen_gnttab.c
index cdcfea5be3..5e8fc0184e 100644
--- a/hw/i386/kvm/xen_gnttab.c
+++ b/hw/i386/kvm/xen_gnttab.c
@@ -217,3 +217,22 @@ int xen_gnttab_get_version_op(struct gnttab_get_version *get)
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
index fa2d3e5615..9b22209170 100644
--- a/target/i386/kvm/xen-emu.c
+++ b/target/i386/kvm/xen-emu.c
@@ -1175,7 +1175,21 @@ static bool kvm_xen_hcall_gnttab_op(struct kvm_xen_exit *exit, X86CPU *cpu,
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


