Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B69C6F43C1
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 14:24:46 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptoux-0003uD-W6; Tue, 02 May 2023 08:15:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ptouZ-0003le-Jw
 for qemu-devel@nongnu.org; Tue, 02 May 2023 08:15:16 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ptouT-0003Bf-NG
 for qemu-devel@nongnu.org; Tue, 02 May 2023 08:15:15 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-3f196e8e2c6so36661075e9.1
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 05:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683029707; x=1685621707;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=pxJ9Pd58XttwOnYQn4nBja9BTng05lJ88RbzD5RmaRg=;
 b=REqkO0RiRhKBKFHgKalpSW6/4E+BYYPP56UoHQIiS/O81z/7xt33bk0vidmEg5xn6g
 /igVs+euA3APTuJarUefYNq2rF2UPT+f5Wb2qhIoS28emwhLdh/+hyZbFXezemh0rMHe
 XC+/wn56lrxfz7i74kmhOwuGW6B8fMFJ60UllMIHbmp95BxT4CBGsnHbI0Y5bYrbTwLT
 fYpazl5v0ApsRWCGMBq0Rh6Z7TLCt32Uhm9cAC31CUtBzx2gTtzdE9newGBt0vkqdUwF
 zToWXPeM9XJVCy6NiN8pLQt5xAEUity/LekACjw2tAdAoYRV2ioI+xVqvznWDx94/oIy
 fJGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683029707; x=1685621707;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pxJ9Pd58XttwOnYQn4nBja9BTng05lJ88RbzD5RmaRg=;
 b=Q68+cgprjzZ2P2PTgGUVPeVUrRs4S6q9H2AHgUmzfqRxeLVsc791JM0JzHJfr+l8/5
 d32AftObBEgrCEn0KBhIz3pWKaaGqZn1QyVC8jQleHpd8wiNSwj9/SghcmLopZMoK4jT
 I/JRN2eX9LgAYgGzAJtYD87OZUh2+k7Ym0iZHxnPWzYaXZ/Rp6bUE3MtmipecR6fFce7
 kxcgKfV5w3riblUX6kv1GSY/udwS3+CbbJ0CLllgJwz9fyn2LHYXRa72yo6k4bsJY02y
 vIZY7LBJveLmD6OtW/gxDtfdCVL1tyN6ADsdIqly0MO/wqXDopw/sg9Q6rbZwfLrXb3x
 jrQg==
X-Gm-Message-State: AC+VfDyqt0zG9svVKCfpAN6JztXrQdG8KBEoT5vecxzkYQV6VYJEwdB6
 099jukOrHdtLTqtA5SSK1P3JgeEX6lNFxVTiFeI=
X-Google-Smtp-Source: ACHHUZ5vbB84ZZ88gBodmrhMkoMy4NWbTCD37KpCE1k5N9qvQBfIF+EMoFfcIyB+Y5nEn7TtXqnmmw==
X-Received: by 2002:a1c:7910:0:b0:3ed:276d:81a4 with SMTP id
 l16-20020a1c7910000000b003ed276d81a4mr12236771wme.32.1683029706742; 
 Tue, 02 May 2023 05:15:06 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 g10-20020a7bc4ca000000b003f171234a08sm35040330wmk.20.2023.05.02.05.15.06
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 05:15:06 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 12/35] tests/qtest: Restrict tpm-tis-i2c-test to CONFIG_TCG
Date: Tue,  2 May 2023 13:14:36 +0100
Message-Id: <20230502121459.2422303-13-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230502121459.2422303-1-peter.maydell@linaro.org>
References: <20230502121459.2422303-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Fabiano Rosas <farosas@suse.de>

The test set -accel tcg, so restrict it to when TCG is present.

Signed-off-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20230426180013.14814-13-farosas@suse.de
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 tests/qtest/meson.build | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index cfc66ade6f6..48cd35b5b20 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -213,7 +213,8 @@ qtests_aarch64 = \
     ['tpm-tis-device-test', 'tpm-tis-device-swtpm-test'] : []) +                                         \
   (config_all_devices.has_key('CONFIG_XLNX_ZYNQMP_ARM') ? ['xlnx-can-test', 'fuzz-xlnx-dp-test'] : []) + \
   (config_all_devices.has_key('CONFIG_RASPI') ? ['bcm2835-dma-test'] : []) +  \
-  (config_all_devices.has_key('CONFIG_TPM_TIS_I2C') ? ['tpm-tis-i2c-test'] : []) + \
+  (config_all.has_key('CONFIG_TCG') and                                            \
+   config_all_devices.has_key('CONFIG_TPM_TIS_I2C') ? ['tpm-tis-i2c-test'] : []) + \
   ['arm-cpu-features',
    'numa-test',
    'boot-serial-test',
-- 
2.34.1


