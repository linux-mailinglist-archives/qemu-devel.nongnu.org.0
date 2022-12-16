Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 592CE64E568
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 01:51:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5ynN-0005Ds-Hy; Thu, 15 Dec 2022 19:41:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+64e888c4aa1bfc596c85+7054+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1p5yn8-0005D6-Cb
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 19:41:36 -0500
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+64e888c4aa1bfc596c85+7054+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1p5yn5-0006aM-AT
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 19:41:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=cSKxzKfvouPFGYFcxXOq0p0UCfDdKppUVWOt4h+XFHk=; b=YSwfVK87gBmJE+EJ+1xYNDY/q9
 caAMNdPg2GdJRrOdI9srirUZspudLB0hOkKwW1MHKCwSCwC2dJTASqfwYIoHU/DcRU45mVpVuKRQY
 peLfuZLfkkMT78jQgrlbm+bwpE22xwdPKPczg+CBJXynHNszYJataBJwBqv4z028sFTNZyadL9ajh
 lrvN2AQvDG8RmfMmkUB0zNCHHDNSq5jowf8FH4WwABeWkrKRGW0gUJcn5fwGbSBLRmhw2qm3z6bCt
 qTZA4HsYdc7uHZ1f3RS+TJJU6Uh7u8BA78/hGuQ64yYLBCAFKELYi87+nCyCUa69BuLVpLm7BrC/e
 5E796wng==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1p5yn6-00EvV9-8C; Fri, 16 Dec 2022 00:41:33 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1p5ymw-003cPL-A8; Fri, 16 Dec 2022 00:41:22 +0000
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
Subject: [RFC PATCH v3 26/38] hw/xen: Implement EVTCHNOP_close
Date: Fri, 16 Dec 2022 00:41:05 +0000
Message-Id: <20221216004117.862106-27-dwmw2@infradead.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20221216004117.862106-1-dwmw2@infradead.org>
References: <20221216004117.862106-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1236::1;
 envelope-from=BATV+64e888c4aa1bfc596c85+7054+infradead.org+dwmw2@casper.srs.infradead.org;
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

It calls an internal close_port() helper which will also be used from
EVTCHNOP_reset and will actually do the work to disconnect/unbind a port
once any of that is actually implemented in the first place.

That in turn calls a free_port() internal function which will be in
error paths after allocation.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/i386/kvm/xen_evtchn.c  | 51 +++++++++++++++++++++++++++++++++++++++
 hw/i386/kvm/xen_evtchn.h  |  2 ++
 target/i386/kvm/xen-emu.c | 12 +++++++++
 3 files changed, 65 insertions(+)

diff --git a/hw/i386/kvm/xen_evtchn.c b/hw/i386/kvm/xen_evtchn.c
index 77acf58540..d4008e7ee1 100644
--- a/hw/i386/kvm/xen_evtchn.c
+++ b/hw/i386/kvm/xen_evtchn.c
@@ -221,3 +221,54 @@ int xen_evtchn_status_op(struct evtchn_status *status)
     qemu_mutex_unlock(&s->port_lock);
     return 0;
 }
+
+static void free_port(XenEvtchnState *s, evtchn_port_t port)
+{
+    s->port_table[port].type = EVTCHNSTAT_closed;
+    s->port_table[port].type_val = 0;
+    s->port_table[port].vcpu = 0;
+
+    if (s->nr_ports == port + 1) {
+        do {
+            s->nr_ports--;
+        } while (s->port_table[s->nr_ports - 1].type == EVTCHNSTAT_closed);
+    }
+}
+
+static int close_port(XenEvtchnState *s, evtchn_port_t port)
+{
+    XenEvtchnPort *p = &s->port_table[port];
+
+    switch (p->type) {
+    case EVTCHNSTAT_closed:
+        return -ENOENT;
+
+    default:
+        break;
+    }
+
+    free_port(s, port);
+    return 0;
+}
+
+int xen_evtchn_close_op(struct evtchn_close *close)
+{
+    XenEvtchnState *s = xen_evtchn_singleton;
+    int ret;
+
+    if (!s) {
+        return -ENOTSUP;
+    }
+
+    if (!valid_port(close->port)) {
+        return -EINVAL;
+    }
+
+    qemu_mutex_lock(&s->port_lock);
+
+    ret = close_port(s, close->port);
+
+    qemu_mutex_unlock(&s->port_lock);
+
+    return ret;
+}
diff --git a/hw/i386/kvm/xen_evtchn.h b/hw/i386/kvm/xen_evtchn.h
index 6f50e5c52d..4c00000315 100644
--- a/hw/i386/kvm/xen_evtchn.h
+++ b/hw/i386/kvm/xen_evtchn.h
@@ -14,4 +14,6 @@ void xen_evtchn_create(void);
 int xen_evtchn_set_callback_param(uint64_t param);
 
 struct evtchn_status;
+struct evtchn_close;
 int xen_evtchn_status_op(struct evtchn_status *status);
+int xen_evtchn_close_op(struct evtchn_close *close);
diff --git a/target/i386/kvm/xen-emu.c b/target/i386/kvm/xen-emu.c
index d4a35bef64..f57d99f9d6 100644
--- a/target/i386/kvm/xen-emu.c
+++ b/target/i386/kvm/xen-emu.c
@@ -640,6 +640,18 @@ static bool kvm_xen_hcall_evtchn_op(struct kvm_xen_exit *exit, X86CPU *cpu,
         }
         break;
     }
+    case EVTCHNOP_close: {
+        struct evtchn_close close;
+
+        qemu_build_assert(sizeof(close) == 4);
+        if (kvm_copy_from_gva(cs, arg, &close, sizeof(close))) {
+            err = -EFAULT;
+            break;
+        }
+
+        err = xen_evtchn_close_op(&close);
+        break;
+    }
     default:
         return false;
     }
-- 
2.35.3


