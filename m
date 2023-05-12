Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1319D700BFC
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 17:36:25 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxUmy-0003JP-GJ; Fri, 12 May 2023 11:34:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pxUmw-0003IR-Vj
 for qemu-devel@nongnu.org; Fri, 12 May 2023 11:34:34 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pxUmu-00061G-Pu
 for qemu-devel@nongnu.org; Fri, 12 May 2023 11:34:34 -0400
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3063b5f32aaso6631309f8f.2
 for <qemu-devel@nongnu.org>; Fri, 12 May 2023 08:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683905670; x=1686497670;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=RnW/AUyjUxOEXR5d7HBrhpE2wftw/HzIlcz6MIiCreU=;
 b=uYM0Rd2Sq90rnDSSW1Nr9qyRXPnbAuSAxTZnzs/HCbRDbhp0MK0A+KYLyCxsQ6f6MT
 sFhR7/Bvw4IXpLLEEz/J2AX3OLp8Jdm8DeL/GKfK3Laz0ErBCmztgVemW6ZRK1E0zMVA
 LHLMxoACsR8Gl/V7inGgy4OrUBxGtkLVTj5P3vRncdktwTzbgHw5AWidXW3vLNkX9Atg
 /O9TaaXO9yXIpON+3S/WTZUHLCus0igj21SavPtmEdBMLKllpWkFXsEtEKkbec5Otxyl
 MNwyf7sjYbOlaZdUt8KUwm+057i6eACr5ikj0TnQ3AbWHIFIxLtltJJapNJasn2T91Fl
 Xctg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683905670; x=1686497670;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RnW/AUyjUxOEXR5d7HBrhpE2wftw/HzIlcz6MIiCreU=;
 b=OXucfXqqf4sUMFUSosuo6s4fc9VxJr8Ca/q0fef1L7E2g4eTzrzob8Owatyamj14TZ
 5kxEyobApTLTRhge/PF1MJdm0heFRZs6T/bIc5X+hpY8ycxg+/Rj/Yz5IrgAea+BGD+I
 paDMC1QsfjUpy/2E1TjTIawjNwyrpEVGPhp5gP0KXAdJstVlNSZpoXuawK895dPbluL6
 e5cXBRZui55yb4rRxuunzrrniD0mjs0eIXlD4D8SsOswqhpGDMB6h96d4nd/1RGyu98r
 NOGW7aEwcyecWhd/zkkw591TKTJRQrcdN3fzvUIY3XoWaQbCysfITeB1y65n0PTOTMgr
 N6UQ==
X-Gm-Message-State: AC+VfDzVaL7ipvS46ZSZ+4sVaTUqv3aNIu1aVejuPytNTVJ3ZZ0o8x3J
 imUZtJzI6619XxG0oi9cF3kqkeJIgQOJG8lwixA=
X-Google-Smtp-Source: ACHHUZ4pASZbN/Q6aRn2CtBsGs/VNGkeE1JruFbwpG0v4MucdGWKNGnhbTbBDtnpRh+WcwH4jVwJUw==
X-Received: by 2002:a1c:f313:0:b0:3f3:468c:a780 with SMTP id
 q19-20020a1cf313000000b003f3468ca780mr17727931wmq.4.1683905670555; 
 Fri, 12 May 2023 08:34:30 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 b6-20020adfee86000000b002feea065cc9sm11721297wro.111.2023.05.12.08.34.30
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 May 2023 08:34:30 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 10/12] target/arm: Select CONFIG_ARM_V7M when TCG is enabled
Date: Fri, 12 May 2023 16:34:21 +0100
Message-Id: <20230512153423.3704893-11-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230512153423.3704893-1-peter.maydell@linaro.org>
References: <20230512153423.3704893-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
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

We cannot allow this config to be disabled at the moment as not all of
the relevant code is protected by it.

Commit 29d9efca16 ("arm/Kconfig: Do not build TCG-only boards on a
KVM-only build") moved the CONFIGs of several boards to Kconfig, so it
is now possible that nothing selects ARM_V7M (e.g. when doing a
--without-default-devices build).

Return the CONFIG_ARM_V7M entry to a state where it is always selected
whenever TCG is available.

Fixes: 29d9efca16 ("arm/Kconfig: Do not build TCG-only boards on a KVM-only build")
Signed-off-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20230508181611.2621-3-farosas@suse.de
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/arm/Kconfig b/target/arm/Kconfig
index 3fffdcb61b6..5947366f6e4 100644
--- a/target/arm/Kconfig
+++ b/target/arm/Kconfig
@@ -1,6 +1,7 @@
 config ARM
     bool
     select ARM_COMPATIBLE_SEMIHOSTING if TCG
+    select ARM_V7M if TCG
 
 config AARCH64
     bool
-- 
2.34.1


