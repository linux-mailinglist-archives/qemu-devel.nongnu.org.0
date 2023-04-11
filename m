Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A58C36DDDC3
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 16:26:18 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmEwY-0004Dk-Kn; Tue, 11 Apr 2023 10:25:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minhquangbui99@gmail.com>)
 id 1pmEwV-00049m-OC
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 10:25:55 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minhquangbui99@gmail.com>)
 id 1pmEwT-0000xY-Qs
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 10:25:55 -0400
Received: by mail-pj1-x102b.google.com with SMTP id j8so6562596pjy.4
 for <qemu-devel@nongnu.org>; Tue, 11 Apr 2023 07:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1681223152;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=daXUQhYr/lJl2shhoQ6P5QMPeeWhQkMAH/077BsEr44=;
 b=AKFn9luinAOzsJdGoHL4lI+nD0BNPbQIFPrOMbaYKUdGe0YQFdXz9q5NAHvtPt/UHq
 5Acb2dZcYP5XiwiHw6odVlOlaxVMquMTr+mpw8NysTG4egXL2qOaMZ/G4Begs3HLHxyv
 w9bAXu5zNss+ncBmjquG9trYeT5qnGfr7cJbYCZrCTGgx25nwZslGX3CYE+eoTc90QgX
 ZJKxK7fax/Vufa0WONNPWKPeuPQAwIO96vlOSY+C0sCnsbCWrvi/p7ChjEsTp04Y1Rlv
 pdx0cakJQ7OG6euEOH6YALJBLu7+1n5tqXcSD/wxCqF/CfNsR2oh/aYVDrik/Jqh+p+C
 gb2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681223152;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=daXUQhYr/lJl2shhoQ6P5QMPeeWhQkMAH/077BsEr44=;
 b=HmL4puYiKKjz5albo8OIMs3eVx/aNBxh1XJwZL+Kj1h29fMFUcXMK9/koJbTHl1bD9
 CFtqHNBPcIH4PH4T2zTXxpe8LqbZe+6D/FNAaJ9wlCT+7xxfpzM1FKnLe8sihdRxAUie
 1X4j0/F9VAYtW698IgkrX4vI4U1yqqtUCaTuQa5W154z8OBegPU1MeyKLIrbMXfzWHBG
 jCWHSW4qQI2DtrwFzF5t21ESc9LwvIHDq6bSFwoit+ML6aI/5gaFc88++uRRKLlxHqKD
 XKKfSWh5yssNyoEYVI7jX4JEKhm/yITE4DwMWNOjsfQ2YU/KTiwBzbRU7v8EyIDjdWnM
 Q0Hg==
X-Gm-Message-State: AAQBX9ciVIydmiREv+nnoWRXSkMbre5Iqhiyc4zxgWoIixuhUE4O/AE6
 eiZt3xNxpy41//fk/HHmFXDJMuTu7dJdOQ==
X-Google-Smtp-Source: AKy350ZStN0QmHc8fuI7zBQ2Z9PguMo+JSXxb5h9g6vRQ5yvJQ76oHwqVHp/FjQRzz8R9c5BTMP4/g==
X-Received: by 2002:a17:90b:1d02:b0:246:a5f3:c7e1 with SMTP id
 on2-20020a17090b1d0200b00246a5f3c7e1mr9508853pjb.42.1681223152103; 
 Tue, 11 Apr 2023 07:25:52 -0700 (PDT)
Received: from localhost.localdomain ([2001:ee0:4fb3:2ba0:dcb1:c928:97e1:ce5f])
 by smtp.googlemail.com with ESMTPSA id
 n188-20020a6340c5000000b0050bc03741ffsm8822594pga.84.2023.04.11.07.25.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Apr 2023 07:25:51 -0700 (PDT)
From: Bui Quang Minh <minhquangbui99@gmail.com>
To: qemu-devel@nongnu.org
Cc: David Woodhouse <dwmw2@infradead.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Bui Quang Minh <minhquangbui99@gmail.com>
Subject: [REPOST PATCH v3 4/5] intel_iommu: allow Extended Interrupt Mode when
 using userspace APIC
Date: Tue, 11 Apr 2023 21:24:39 +0700
Message-Id: <20230411142440.8018-5-minhquangbui99@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230411142440.8018-1-minhquangbui99@gmail.com>
References: <20230411142440.8018-1-minhquangbui99@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=minhquangbui99@gmail.com; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

As userspace APIC now supports x2APIC, intel interrupt remapping
hardware can be set to EIM mode when userspace local APIC is used.

Signed-off-by: Bui Quang Minh <minhquangbui99@gmail.com>
---
 hw/i386/intel_iommu.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
index a62896759c..fd7c16b852 100644
--- a/hw/i386/intel_iommu.c
+++ b/hw/i386/intel_iommu.c
@@ -4045,17 +4045,6 @@ static bool vtd_decide_config(IntelIOMMUState *s, Error **errp)
                       && x86_iommu_ir_supported(x86_iommu) ?
                                               ON_OFF_AUTO_ON : ON_OFF_AUTO_OFF;
     }
-    if (s->intr_eim == ON_OFF_AUTO_ON && !s->buggy_eim) {
-        if (!kvm_irqchip_is_split()) {
-            error_setg(errp, "eim=on requires accel=kvm,kernel-irqchip=split");
-            return false;
-        }
-        if (!kvm_enable_x2apic()) {
-            error_setg(errp, "eim=on requires support on the KVM side"
-                             "(X2APIC_API, first shipped in v4.7)");
-            return false;
-        }
-    }
 
     /* Currently only address widths supported are 39 and 48 bits */
     if ((s->aw_bits != VTD_HOST_AW_39BIT) &&
-- 
2.25.1


