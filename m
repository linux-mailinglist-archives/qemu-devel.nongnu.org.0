Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E31D06EF235
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 12:39:23 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prcYC-0003GG-3O; Wed, 26 Apr 2023 06:39:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1prcYA-0003CS-5K
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 06:39:02 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1prcY8-0003HW-J2
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 06:39:01 -0400
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-63f273b219eso3370400b3a.1
 for <qemu-devel@nongnu.org>; Wed, 26 Apr 2023 03:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1682505539; x=1685097539;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hp2InDnsuAVyTdeGynRAHIQCpujuFW2lt68SJPRTlkY=;
 b=KLqMLbuWNz63QCKBykdDWGG1xyXtKZw3lArHvwAzzJovc4LiUQME8s7OM2rgyYOiMk
 CDdkOkimqBRJsJmMVcXz+rRQQaTh+vP8HpKfrZbfD7y2dO+PIQ/K7R4bguNoNRLwwf9S
 /DRtcdhOpXy6E5bWvFPTkmqNG4ggtl/8CcFng6EgFoYM65rGHR/2dofo+TvMBo8xp3YW
 QniwcMi+wRFhVg6Y8TNm3PVB5BZ9uNLgDoPRixpbWunMxQjZanwOqmg+l5kD9tOwWcS6
 pbwbKEtCAFk1Olwc5mq7iabTLqUE6AET7zJsEo/zFGyJE1izVZeEjeTgHGsiDy9lnGDF
 4edg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682505539; x=1685097539;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hp2InDnsuAVyTdeGynRAHIQCpujuFW2lt68SJPRTlkY=;
 b=aNOBCEQaR5uhhOmJ+A6vu3IG8hPdyq/PNfN2zAxnE7e0QNagVJqVbYTrdzO3kXgOZe
 gk0lONpz1uiMnO96RkBuGgVLhaLKxaiuYJtz1eSJBhylxiPl0H0/jWaDc5/jobQX/QSb
 BmG4Jhi/hfsXq45yttBbtZlWPOoBuVSbIdOTMX/NB2yLuv3ivWioSK4J6QYanJFNNRRC
 EFW3ZcXQyc2ffUEDpXj1fI/p05u6X0EEuluXJOVwLNuzG+Sft0orwxpW/+IpEDzT8ttR
 itqTNRRonjJtd8NO0oX3zhD5+wNVOy2cfwwzhlFEH9zyz9gew6iwkEh6Us7Uxw7cTi0p
 MA7Q==
X-Gm-Message-State: AAQBX9eW2TDulIP6evIwxxu77d7uKGeSDwGy2EmUf+uFQme+hIZ5N0fV
 FNmJu4teonZmqrGx1xBbJUQeUQ==
X-Google-Smtp-Source: AKy350Z2TC7GGh732JsuGxFJBp2wPo5bY2vE0+RS6AfxuO0T33JaAPhF/a+NFExLk377gagLASvI3Q==
X-Received: by 2002:a05:6a20:c1a6:b0:e5:58e6:be37 with SMTP id
 bg38-20020a056a20c1a600b000e558e6be37mr22571232pzb.61.1682505539428; 
 Wed, 26 Apr 2023 03:38:59 -0700 (PDT)
Received: from alarm.u-tokyo.ac.jp ([157.82.194.15])
 by smtp.gmail.com with ESMTPSA id
 m11-20020a63580b000000b0051322a5aa64sm9317919pgb.3.2023.04.26.03.38.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Apr 2023 03:38:59 -0700 (PDT)
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
Subject: [PATCH v4 27/48] igb: Clear EICR bits for delayed MSI-X interrupts
Date: Wed, 26 Apr 2023 19:36:55 +0900
Message-Id: <20230426103716.26279-28-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230426103716.26279-1-akihiko.odaki@daynix.com>
References: <20230426103716.26279-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::432;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x432.google.com
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
index 20645c4764..edda07e564 100644
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


