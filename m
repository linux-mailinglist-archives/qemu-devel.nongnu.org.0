Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B68ED64E571
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 01:54:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5yp7-0007L6-ME; Thu, 15 Dec 2022 19:43:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+54656a84ae694b50c6d0+7054+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1p5yoI-0006Hr-RP
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 19:42:48 -0500
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+54656a84ae694b50c6d0+7054+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1p5yoG-0006qX-Ty
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 19:42:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=XOS94y+zWLXZf2qYe14xYzCnPgFXWDv3X0NFxPO3IWA=; b=bVbQXgvpfXzIgdNvwwbvIaJM8d
 MU3WvpJgGBQOcApnsDVEU2qeHatYEvTxH+J0dgyJPGP6qCzBX5HpndVvrn+EpukK1MHDevVP0k5G/
 //04XUwb/8iSnGmDQRAdo0E84WwH8RWCOzRqZ3xCa9f/CGXBW1VV9Ex3nYcZ+WUpvFwTl2NA/TKl4
 r6HAHKroltUTjRIr8Hmg95raHau5oYWDnYIQGEnf7ErI4LY0+e3QBnYsAu+urgO5/G+E3VavRhd0/
 YhTFUVKXrrDmqby1FbumYL7MPHPT24WpTIO+8WwuipIKJ1KbbMhACteHeNEdy7mAUQVqDsvBXLhZi
 5uxWTn6w==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1p5ymy-00Azyz-1g; Fri, 16 Dec 2022 00:42:28 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1p5ymw-003cQG-G3; Fri, 16 Dec 2022 00:41:22 +0000
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
 Claudio Fontana <cfontana@suse.de>
Subject: [RFC PATCH v3 34/38] hw/xen: Implement EVTCHNOP_reset
Date: Fri, 16 Dec 2022 00:41:13 +0000
Message-Id: <20221216004117.862106-35-dwmw2@infradead.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20221216004117.862106-1-dwmw2@infradead.org>
References: <20221216004117.862106-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 desiato.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05;
 envelope-from=BATV+54656a84ae694b50c6d0+7054+infradead.org+dwmw2@desiato.srs.infradead.org;
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
 hw/i386/kvm/xen_evtchn.c  | 24 ++++++++++++++++++++++++
 hw/i386/kvm/xen_evtchn.h  |  2 ++
 target/i386/kvm/xen-emu.c | 12 ++++++++++++
 3 files changed, 38 insertions(+)

diff --git a/hw/i386/kvm/xen_evtchn.c b/hw/i386/kvm/xen_evtchn.c
index 8cdc26afb7..225d984371 100644
--- a/hw/i386/kvm/xen_evtchn.c
+++ b/hw/i386/kvm/xen_evtchn.c
@@ -643,6 +643,30 @@ static int close_port(XenEvtchnState *s, evtchn_port_t port)
     return 0;
 }
 
+int xen_evtchn_reset_op(struct evtchn_reset *reset)
+{
+    XenEvtchnState *s = xen_evtchn_singleton;
+    int i;
+
+    if (!s) {
+        return -ENOTSUP;
+    }
+
+    if (reset->dom != DOMID_SELF && reset->dom != xen_domid) {
+        return -ESRCH;
+    }
+
+    qemu_mutex_lock(&s->port_lock);
+
+    for (i = 0; i < s->nr_ports; i++) {
+        close_port(s, i);
+    }
+
+    qemu_mutex_unlock(&s->port_lock);
+
+    return 0;
+}
+
 int xen_evtchn_close_op(struct evtchn_close *close)
 {
     XenEvtchnState *s = xen_evtchn_singleton;
diff --git a/hw/i386/kvm/xen_evtchn.h b/hw/i386/kvm/xen_evtchn.h
index 99d5292c1e..b93f534bee 100644
--- a/hw/i386/kvm/xen_evtchn.h
+++ b/hw/i386/kvm/xen_evtchn.h
@@ -22,6 +22,7 @@ struct evtchn_send;
 struct evtchn_alloc_unbound;
 struct evtchn_bind_interdomain;
 struct evtchn_bind_vcpu;
+struct evtchn_reset;
 int xen_evtchn_status_op(struct evtchn_status *status);
 int xen_evtchn_close_op(struct evtchn_close *close);
 int xen_evtchn_unmask_op(struct evtchn_unmask *unmask);
@@ -31,3 +32,4 @@ int xen_evtchn_send_op(struct evtchn_send *send);
 int xen_evtchn_alloc_unbound_op(struct evtchn_alloc_unbound *alloc);
 int xen_evtchn_bind_interdomain_op(struct evtchn_bind_interdomain *interdomain);
 int xen_evtchn_bind_vcpu_op(struct evtchn_bind_vcpu *vcpu);
+int xen_evtchn_reset_op(struct evtchn_reset *reset);
diff --git a/target/i386/kvm/xen-emu.c b/target/i386/kvm/xen-emu.c
index 58fa82682f..055afba627 100644
--- a/target/i386/kvm/xen-emu.c
+++ b/target/i386/kvm/xen-emu.c
@@ -854,6 +854,18 @@ static bool kvm_xen_hcall_evtchn_op(struct kvm_xen_exit *exit, X86CPU *cpu,
         err = xen_evtchn_bind_vcpu_op(&vcpu);
         break;
     }
+    case EVTCHNOP_reset: {
+        struct evtchn_reset reset;
+
+        qemu_build_assert(sizeof(reset) == 2);
+        if (kvm_copy_from_gva(cs, arg, &reset, sizeof(reset))) {
+            err = -EFAULT;
+            break;
+        }
+
+        err = xen_evtchn_reset_op(&reset);
+        break;
+    }
     default:
         return false;
     }
-- 
2.35.3


