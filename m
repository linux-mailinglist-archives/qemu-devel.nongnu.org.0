Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE665FF064
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Oct 2022 16:33:41 +0200 (CEST)
Received: from localhost ([::1]:51594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ojLkq-0005H8-K2
	for lists+qemu-devel@lfdr.de; Fri, 14 Oct 2022 10:33:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ojLe3-0005oX-JY
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 10:26:42 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:43861)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ojLe2-0008TP-0L
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 10:26:39 -0400
Received: by mail-wr1-x42d.google.com with SMTP id n12so7806719wrp.10
 for <qemu-devel@nongnu.org>; Fri, 14 Oct 2022 07:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aWAOf4PPjM+pqgttvuA5UCkcEntXj8pU+rzFsl+xr7o=;
 b=plD8mmNxfXCfBPuTs6Q91D0Aj8e70r6+mwojjDgDyE0WvqdQ5W4djNvoxPSjKK5o0B
 u765O67rgIim1r93Qcg97Qt4FZw8koceH3ZDqKYW5Mzr+bBBm6T4qdTFH2ZRkUiqZzUZ
 967xnf3B2pxDc9qGWhI/3OQZGhFlXeKFOLztotfAYOhrl4TdtFCbssOBTsCkVRlUYxg0
 9+biGxhTlCzV7PZD4Rj/QcSDvptTIDHVdopKPgDrE7FXRUez79S0sUS6255G7h3/nLO0
 1PgY+iO5+U81Se3JNekCk06fvDYlIScwcaqpPOMUj/kQ2mbLnIduUlBt2xActbDQIa8f
 /THA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aWAOf4PPjM+pqgttvuA5UCkcEntXj8pU+rzFsl+xr7o=;
 b=ANohpy9Kz5wguX5t8L481SdF8wKCipgg9sYHrU5mT+l9+7feoPUf2OomiBCtK0KJOt
 OTDp4zFWPP4W5TlzF1r6dUCjucdc4znj/NtY/wO92jqi/zwyPpMAHZl91v4HhGrK/cox
 UE6DolEs0m4CKVmGJEXtb+jX7IZc47K+AHqJ8u1LKR+zeXb2wjb7zOwD3XaSd8ISIbjh
 dz6tuqaejThPSE2S4t83fPVYWZpCVRCs6+cpWBE/DaY0OS0krpNZn+49JiW/sh6seJho
 6VahO972MXzu3HCKwSoOKda3hZHPgHFdttW2U7hvKlBz9yLjqeRA0BfsEZAJ/rt0ANBf
 PhLQ==
X-Gm-Message-State: ACrzQf17H3z3kmo4K4PYRJMib5zl74E/A09l/llTr/pxuo9EqT4JefL8
 LSuFyvRPJatpQJ/IvkK2rQvOr5DTdQEc3w==
X-Google-Smtp-Source: AMsMyM5k8nPGQgjo1NdUvaFFqCLKK+kWjuNT7fuDF7Q3KQuWGk2TJAW9Gj/3H5iv5nimGEgB3sgJcQ==
X-Received: by 2002:a05:6000:1f9e:b0:22e:61fa:3f1c with SMTP id
 bw30-20020a0560001f9e00b0022e61fa3f1cmr3509892wrb.546.1665757596276; 
 Fri, 14 Oct 2022 07:26:36 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 i3-20020adfaac3000000b0022e62529888sm2183530wrc.67.2022.10.14.07.26.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Oct 2022 07:26:35 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH 1/2] hw/audio/intel-hda: don't reset codecs twice
Date: Fri, 14 Oct 2022 15:26:31 +0100
Message-Id: <20221014142632.2092404-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221014142632.2092404-1-peter.maydell@linaro.org>
References: <20221014142632.2092404-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently the intel-hda device has a reset method which manually
resets all the codecs by calling device_legacy_reset() on them.  This
means they get reset twice, once because child devices on a qbus get
reset before the parent device's reset method is called, and then
again because we're manually resetting them.

Drop the manual reset call, and ensure that codecs are still reset
when the guest does a reset via ICH6_GCTL_RESET by using
device_cold_reset() (which resets all the devices on the qbus as well
as the device itself) instead of a direct call to the reset function.

This is a slight ordering change because the (only) codec reset now
happens before the controller registers etc are reset, rather than
once before and then once after, but the codec reset function
hda_audio_reset() doesn't care.

This lets us drop a use of device_legacy_reset(), which is
deprecated.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/audio/intel-hda.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/hw/audio/intel-hda.c b/hw/audio/intel-hda.c
index f38117057b9..38cfa20262e 100644
--- a/hw/audio/intel-hda.c
+++ b/hw/audio/intel-hda.c
@@ -516,7 +516,7 @@ static void intel_hda_notify_codecs(IntelHDAState *d, uint32_t stream, bool runn
 static void intel_hda_set_g_ctl(IntelHDAState *d, const IntelHDAReg *reg, uint32_t old)
 {
     if ((d->g_ctl & ICH6_GCTL_RESET) == 0) {
-        intel_hda_reset(DEVICE(d));
+        device_cold_reset(DEVICE(d));
     }
 }
 
@@ -1083,11 +1083,9 @@ static void intel_hda_reset(DeviceState *dev)
     intel_hda_regs_reset(d);
     d->wall_base_ns = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
 
-    /* reset codecs */
     QTAILQ_FOREACH(kid, &d->codecs.qbus.children, sibling) {
         DeviceState *qdev = kid->child;
         cdev = HDA_CODEC_DEVICE(qdev);
-        device_legacy_reset(DEVICE(cdev));
         d->state_sts |= (1 << cdev->cad);
     }
     intel_hda_update_irq(d);
-- 
2.25.1


