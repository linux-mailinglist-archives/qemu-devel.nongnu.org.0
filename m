Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC0616A828D
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 13:47:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXiB0-0006tc-QL; Thu, 02 Mar 2023 07:36:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pXi7g-0002xm-5c
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 07:33:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pXi7b-0003wn-Mw
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 07:33:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677760399;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LZLlEd2q5zhkTUrx+6jWfzGCwgP+RoKhMJpO5woz8R0=;
 b=iw5+1TR0YjNPCyK478aqN9FamFJLYeoUvQm8dILbYIQVBam6NBfRZY2U3h+lBV8LrglONy
 BKRfz5/Hf3zI7O4Zv/xIuHVU6qATPS2p3YynWriMU/7ONIJKPVcBY03lQnelU11uvn5vRY
 2lEZdMnu4ckuK3fWwR6cs7gzs2T8j0o=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-327-JYdkAySTPbe8C4xuQW6iug-1; Thu, 02 Mar 2023 07:33:18 -0500
X-MC-Unique: JYdkAySTPbe8C4xuQW6iug-1
Received: by mail-wr1-f69.google.com with SMTP id
 x3-20020a5d6503000000b002c8c421fdfaso3189532wru.15
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 04:33:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LZLlEd2q5zhkTUrx+6jWfzGCwgP+RoKhMJpO5woz8R0=;
 b=RY/K6oAXGaaVdLQ1ZEfujgVod+ZIkk1Gtbsk/JeGFgOzC2mFahToozTi3crLAbCU7H
 ws7V6UCLheIQbNoWfbTzGR4kEUDnve39apc9HtnsQXWnHTPvdnqTjwnQJkcpWPIRZlpx
 HnzhR6wQF4iEtedX5Bxp9AtTbYDJ4T1YW7O5MQuMhgxjfZEy4UB4AxMwEzAN7yD5tIzo
 KveiIzWFZpO9Xz9F/PzIGfEvL2p/kwfmHVR+LhvtWqgBQq3pxKd/5clFhQxhQrsDB5nF
 ImjAIbEH/DZ3xK+ACjmcQ1eGmagN+/fwa0LoSeH6umGlAAe9EqCwK446i3EBepAP8mnm
 iMpA==
X-Gm-Message-State: AO0yUKUXcVAnTUhg0YO9M4Nc4P04YpecCW7cExeIp/h++c1f6N0z9DUm
 KpkKYPLDIX6C4fQabZcPp0cuUHGea2nqYkgKdgnrFMEGZKMTf/yyo1C+5bx8JjlbHoA0KX/mK10
 TGe0SnpQUO6wEBpH5odZ3NwygPF6vKNnwWxqd7NsyRduROrMtvAEnQlx/Y1NnLpiN5nyYCsjTVP
 E=
X-Received: by 2002:a05:600c:1715:b0:3ea:bc08:b63e with SMTP id
 c21-20020a05600c171500b003eabc08b63emr7953384wmn.2.1677760396519; 
 Thu, 02 Mar 2023 04:33:16 -0800 (PST)
X-Google-Smtp-Source: AK7set+Z4Yx/ntjZl6wjD8Um2D52+jVyq7tLU7KtxSnBxHL1qnrjIBf2aPl7bsAfi4U9h2IHxeTDrw==
X-Received: by 2002:a05:600c:1715:b0:3ea:bc08:b63e with SMTP id
 c21-20020a05600c171500b003eabc08b63emr7953366wmn.2.1677760396080; 
 Thu, 02 Mar 2023 04:33:16 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 w23-20020a1cf617000000b003e71a6be279sm2808460wmc.37.2023.03.02.04.33.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 04:33:15 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: David Woodhouse <dwmw@amazon.co.uk>,
	Paul Durrant <paul@xen.org>
Subject: [PULL 56/62] hw/xen: Support GSI mapping to PIRQ
Date: Thu,  2 Mar 2023 13:30:23 +0100
Message-Id: <20230302123029.153265-57-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230302123029.153265-1-pbonzini@redhat.com>
References: <20230302123029.153265-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

If I advertise XENFEAT_hvm_pirqs then a guest now boots successfully as
long as I tell it 'pci=nomsi'.

[root@localhost ~]# cat /proc/interrupts
           CPU0
  0:         52   IO-APIC   2-edge      timer
  1:         16  xen-pirq   1-ioapic-edge  i8042
  4:       1534  xen-pirq   4-ioapic-edge  ttyS0
  8:          1  xen-pirq   8-ioapic-edge  rtc0
  9:          0  xen-pirq   9-ioapic-level  acpi
 11:       5648  xen-pirq  11-ioapic-level  ahci[0000:00:04.0]
 12:        257  xen-pirq  12-ioapic-edge  i8042
...

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Paul Durrant <paul@xen.org>
---
 hw/i386/kvm/xen_evtchn.c | 58 +++++++++++++++++++++++++++++++++++++++-
 hw/i386/kvm/xen_evtchn.h |  2 ++
 hw/i386/x86.c            | 16 +++++++++++
 3 files changed, 75 insertions(+), 1 deletion(-)

diff --git a/hw/i386/kvm/xen_evtchn.c b/hw/i386/kvm/xen_evtchn.c
index 59eea63272d0..f2c4b4387194 100644
--- a/hw/i386/kvm/xen_evtchn.c
+++ b/hw/i386/kvm/xen_evtchn.c
@@ -148,6 +148,9 @@ struct XenEvtchnState {
     /* GSI → PIRQ mapping (serialized) */
     uint16_t gsi_pirq[IOAPIC_NUM_PINS];
 
+    /* Per-GSI assertion state (serialized) */
+    uint32_t pirq_gsi_set;
+
     /* Per-PIRQ information (rebuilt on migration) */
     struct pirq_info *pirq;
 };
@@ -246,6 +249,7 @@ static const VMStateDescription xen_evtchn_vmstate = {
         VMSTATE_VARRAY_UINT16_ALLOC(pirq_inuse_bitmap, XenEvtchnState,
                                     nr_pirq_inuse_words, 0,
                                     vmstate_info_uint64, uint64_t),
+        VMSTATE_UINT32(pirq_gsi_set, XenEvtchnState),
         VMSTATE_END_OF_LIST()
     }
 };
@@ -1510,6 +1514,51 @@ static int allocate_pirq(XenEvtchnState *s, int type, int gsi)
     return pirq;
 }
 
+bool xen_evtchn_set_gsi(int gsi, int level)
+{
+    XenEvtchnState *s = xen_evtchn_singleton;
+    int pirq;
+
+    assert(qemu_mutex_iothread_locked());
+
+    if (!s || gsi < 0 || gsi > IOAPIC_NUM_PINS) {
+        return false;
+    }
+
+    /*
+     * Check that that it *isn't* the event channel GSI, and thus
+     * that we are not recursing and it's safe to take s->port_lock.
+     *
+     * Locking aside, it's perfectly sane to bail out early for that
+     * special case, as it would make no sense for the event channel
+     * GSI to be routed back to event channels, when the delivery
+     * method is to raise the GSI... that recursion wouldn't *just*
+     * be a locking issue.
+     */
+    if (gsi && gsi == s->callback_gsi) {
+        return false;
+    }
+
+    QEMU_LOCK_GUARD(&s->port_lock);
+
+    pirq = s->gsi_pirq[gsi];
+    if (!pirq) {
+        return false;
+    }
+
+    if (level) {
+        int port = s->pirq[pirq].port;
+
+        s->pirq_gsi_set |= (1U << gsi);
+        if (port) {
+            set_port_pending(s, port);
+        }
+    } else {
+        s->pirq_gsi_set &= ~(1U << gsi);
+    }
+    return true;
+}
+
 int xen_physdev_map_pirq(struct physdev_map_pirq *map)
 {
     XenEvtchnState *s = xen_evtchn_singleton;
@@ -1621,7 +1670,14 @@ int xen_physdev_eoi_pirq(struct physdev_eoi *eoi)
         return -EINVAL;
     }
 
-    /* XX: Reassert a level IRQ if needed */
+    /* Reassert a level IRQ if needed */
+    if (s->pirq_gsi_set & (1U << gsi)) {
+        int port = s->pirq[pirq].port;
+        if (port) {
+            set_port_pending(s, port);
+        }
+    }
+
     return 0;
 }
 
diff --git a/hw/i386/kvm/xen_evtchn.h b/hw/i386/kvm/xen_evtchn.h
index a7383f760ce2..95400b7fbf7d 100644
--- a/hw/i386/kvm/xen_evtchn.h
+++ b/hw/i386/kvm/xen_evtchn.h
@@ -24,6 +24,8 @@ void xen_evtchn_set_callback_level(int level);
 
 int xen_evtchn_set_port(uint16_t port);
 
+bool xen_evtchn_set_gsi(int gsi, int level);
+
 /*
  * These functions mirror the libxenevtchn library API, providing the QEMU
  * backend side of "interdomain" event channels.
diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index c44846f47b5f..a56b10b2fb1c 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -61,6 +61,11 @@
 #include CONFIG_DEVICES
 #include "kvm/kvm_i386.h"
 
+#ifdef CONFIG_XEN_EMU
+#include "hw/xen/xen.h"
+#include "hw/i386/kvm/xen_evtchn.h"
+#endif
+
 /* Physical Address of PVH entry point read from kernel ELF NOTE */
 static size_t pvh_start_addr;
 
@@ -610,6 +615,17 @@ void gsi_handler(void *opaque, int n, int level)
         }
         /* fall through */
     case ISA_NUM_IRQS ... IOAPIC_NUM_PINS - 1:
+#ifdef CONFIG_XEN_EMU
+        /*
+         * Xen delivers the GSI to the Legacy PIC (not that Legacy PIC
+         * routing actually works properly under Xen). And then to
+         * *either* the PIRQ handling or the I/OAPIC depending on
+         * whether the former wants it.
+         */
+        if (xen_mode == XEN_EMULATE && xen_evtchn_set_gsi(n, level)) {
+            break;
+        }
+#endif
         qemu_set_irq(s->ioapic_irq[n], level);
         break;
     case IO_APIC_SECONDARY_IRQBASE
-- 
2.39.1


