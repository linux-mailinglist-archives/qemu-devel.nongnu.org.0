Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A08A36EBD03
	for <lists+qemu-devel@lfdr.de>; Sun, 23 Apr 2023 06:27:10 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqRDA-0004Iq-PE; Sun, 23 Apr 2023 00:20:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pqRD1-0004Bv-4O
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 00:20:19 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pqRCy-00015I-1M
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 00:20:18 -0400
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-1a68f2345c5so28665795ad.2
 for <qemu-devel@nongnu.org>; Sat, 22 Apr 2023 21:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1682223615; x=1684815615;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/ocFjXCC8oIvQV9/JFkQa70q0sDme/ntA+/BYDjdVPk=;
 b=4AuVBG37HdHEplUyEmvgW6gN4XoITia5TVNurW5vJYi2f6cioT9sLU50AP4aVyUqCB
 kKBns67QrCrKJR1+WmQG3Evc+4iK+uW2h4HqpkcRC3G5cqdRNjmemadqLfb4PTRrom7E
 8pZZKwB32R9u1JBFhD8MA5rxexJMWfH/k5YXE246+skjKl15RGmVVcrbMx0XcGY5dJ3z
 3Fi3XvvujpeTBkv6s/xe3FymLkjSXoF3dniAEdqqXM2mhg3HPq9W7viVntb+dJcwlyQR
 OF/OVeX59tvxVshMu98l7a2yy++4pIry45sNKNS94xgwjUizA6G0hTHRsQ/lb7GB8EEy
 wZOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682223615; x=1684815615;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/ocFjXCC8oIvQV9/JFkQa70q0sDme/ntA+/BYDjdVPk=;
 b=S1ZCDfs7/tARFwTGAM+5cELVVdNq6kwH5IZuJsT2qvwOI2bcK0eVKBDBGyIrjEpINi
 Qi8yNw45/a+sUd8DNY02Nv1uELHYuGBzrZKg3ic8n9hX+qQ42uS5CseqJfKHAmDFhOUx
 tBEiTaLpKGGLh6j78hJBWNseMrccNWU7ZeeIjSAO/Sf/33aTE2tPiekJlNI3Qvj3vjcE
 9O1bCknDmGjKJyRF1w2m758n2+diAqkbl1EeQiKikFk191Gg63mJHPqDrFmLa7eDKlpC
 Ci5FOuo4JI0TzilUEQqECOewwEENRqq2l5BB/1dnFpEw+idpyb+Xbm5EebP3BkCy54PI
 2d9g==
X-Gm-Message-State: AAQBX9dF1pRX44PtqiWdrNk84zy/+yeHzri2vf4CMaAlUVVjGi3MMkJa
 Z2tFoW5o6zXnfibGgN59mmFBzg==
X-Google-Smtp-Source: AKy350Z6S6BV62uKhT8hYzP2jJLP+nQBRteteofRA9vT4k4iQd7VlGybMb/mVLrHaG9+1tcQJ+fwqw==
X-Received: by 2002:a17:903:5c3:b0:1a6:639e:887e with SMTP id
 kf3-20020a17090305c300b001a6639e887emr9315474plb.13.1682223614929; 
 Sat, 22 Apr 2023 21:20:14 -0700 (PDT)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 f1-20020a170902ff0100b001a5059861adsm4596996plj.224.2023.04.22.21.20.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Apr 2023 21:20:14 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org, Tomasz Dzieciol <t.dzieciol@partner.samsung.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v3 27/47] igb: Clear EICR bits for delayed MSI-X interrupts
Date: Sun, 23 Apr 2023 13:18:13 +0900
Message-Id: <20230423041833.5302-28-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230423041833.5302-1-akihiko.odaki@daynix.com>
References: <20230423041833.5302-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::634;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x634.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Section 7.3.4.1 says:
> When auto-clear is enabled for an interrupt cause, the EICR bit is
> set when a cause event mapped to this vector occurs. When the EITR
> Counter reaches zero, the MSI-X message is sent on PCIe. Then the
> EICR bit is cleared and enabled to be set by a new cause event

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 hw/net/igb_core.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
index 3c1ef11afd..ef29e68096 100644
--- a/hw/net/igb_core.c
+++ b/hw/net/igb_core.c
@@ -97,23 +97,31 @@ igb_lower_legacy_irq(IGBCore *core)
     pci_set_irq(core->owner, 0);
 }
 
-static void igb_msix_notify(IGBCore *core, unsigned int vector)
+static void igb_msix_notify(IGBCore *core, unsigned int cause)
 {
     PCIDevice *dev = core->owner;
     uint16_t vfn;
+    uint32_t effective_eiac;
+    unsigned int vector;
 
-    vfn = 8 - (vector + 2) / IGBVF_MSIX_VEC_NUM;
+    vfn = 8 - (cause + 2) / IGBVF_MSIX_VEC_NUM;
     if (vfn < pcie_sriov_num_vfs(core->owner)) {
         dev = pcie_sriov_get_vf_at_index(core->owner, vfn);
         assert(dev);
-        vector = (vector + 2) % IGBVF_MSIX_VEC_NUM;
-    } else if (vector >= IGB_MSIX_VEC_NUM) {
+        vector = (cause + 2) % IGBVF_MSIX_VEC_NUM;
+    } else if (cause >= IGB_MSIX_VEC_NUM) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "igb: Tried to use vector unavailable for PF");
         return;
+    } else {
+        vector = cause;
     }
 
     msix_notify(dev, vector);
+
+    trace_e1000e_irq_icr_clear_eiac(core->mac[EICR], core->mac[EIAC]);
+    effective_eiac = core->mac[EIAC] & BIT(cause);
+    core->mac[EICR] &= ~effective_eiac;
 }
 
 static inline void
@@ -1834,7 +1842,6 @@ igb_eitr_should_postpone(IGBCore *core, int idx)
 static void igb_send_msix(IGBCore *core)
 {
     uint32_t causes = core->mac[EICR] & core->mac[EIMS];
-    uint32_t effective_eiac;
     int vector;
 
     for (vector = 0; vector < IGB_INTR_NUM; ++vector) {
@@ -1842,10 +1849,6 @@ static void igb_send_msix(IGBCore *core)
 
             trace_e1000e_irq_msix_notify_vec(vector);
             igb_msix_notify(core, vector);
-
-            trace_e1000e_irq_icr_clear_eiac(core->mac[EICR], core->mac[EIAC]);
-            effective_eiac = core->mac[EIAC] & BIT(vector);
-            core->mac[EICR] &= ~effective_eiac;
         }
     }
 }
-- 
2.40.0


