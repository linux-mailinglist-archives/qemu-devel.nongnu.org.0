Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE2D51C843
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 20:45:16 +0200 (CEST)
Received: from localhost ([::1]:38998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmgTR-0001bq-UM
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 14:45:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nmgOO-0006xj-RQ
 for qemu-devel@nongnu.org; Thu, 05 May 2022 14:40:04 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:42605)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nmgOM-0002Ar-JW
 for qemu-devel@nongnu.org; Thu, 05 May 2022 14:39:59 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 n126-20020a1c2784000000b0038e8af3e788so3148651wmn.1
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 11:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=ZrbOgyRHel1WsxZxJsJlMGVG2H1MqvD6A/WHr3xS78s=;
 b=TWEI4nTaN5hI01MIGwiFetwiVQ7upWwssaLsscSkrX71I7jJ++xd5NTetcl8stTZOZ
 ptje5NLs+rG1i0ZhZoWyuvQSeKbBrqKtlpRx+xxx0WIN7Z8ZtX3Vs/8MO7Jbo5UwxC4r
 029OgDPSiaIVRI9QJhIHH9ZQCMKVcYSptzms1vyJM0Bi5R8UdaLzpEQ2xvEiaPyak0WS
 M0VTlNsYeQwFKj5YKDjDW5TGnfQC/MGcA9zsMHc8PEDzRZJlM3joeDDXspkA00qFTAj7
 naCNe1y7LOcjmfcmfDRAQRrs21xP2SFcSHQekD2gzO4iqHD0jb8jORI55hgy7KMK5lT0
 1kzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZrbOgyRHel1WsxZxJsJlMGVG2H1MqvD6A/WHr3xS78s=;
 b=TgvEICrcfAXOcL2wH9/qrLxw/xdD5fG14cW7w8yF0NVkSW8IoY7kt8fcf/2Ke5UnqO
 g+Mj+qNFHCIQo11Jfspj/oY49FhhMq2g35bP1JIJB2S+Ct3AVhnPisJR+6+vCplbmP2i
 RX32DB6FqdzIbrEuHntAJF7MDC4/QrqB/B9YEjd6wBhM+mvqc15cYyUS2les5zicCP6/
 zk0Z0+SCn5L87g3Jckn9fdP9tDT94Juv1yX7p8m7u0Y58Ol91OopR5Mbt+roUGzklxCb
 gYMNaC4uDYgvc/JAGKvn88CQ2JqOhurQgTsurIFB37FwyNfA+QcJU0xL+2bKIlxlenbV
 q2eQ==
X-Gm-Message-State: AOAM530eRgKt53yNqzhwxc1tKKTk8PlaQLihmg08W4i5LeNfHfPoDm3U
 uWfoNLq0iGtSPiiKOpRc2ssC3A==
X-Google-Smtp-Source: ABdhPJxrAYHDTD71Jc3T7XhEeItpGJgpKP1K6mwtoMtEAPiC0dXIdSm4GcdX2hyzPpTBfqq3vh1IAg==
X-Received: by 2002:a05:600c:3391:b0:393:fbba:3789 with SMTP id
 o17-20020a05600c339100b00393fbba3789mr6320440wmp.206.1651775995887; 
 Thu, 05 May 2022 11:39:55 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 o35-20020a05600c512300b0039454a85a9asm2302121wms.30.2022.05.05.11.39.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 11:39:55 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 4/4] target/arm: Enable FEAT_S2FWB for -cpu max
Date: Thu,  5 May 2022 19:39:50 +0100
Message-Id: <20220505183950.2781801-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220505183950.2781801-1-peter.maydell@linaro.org>
References: <20220505183950.2781801-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Enable the FEAT_S2FWB for -cpu max. Since FEAT_S2FWB requires that
CLIDR_EL1.{LoUU,LoUIS} are zero, we explicitly squash these (the
inherited CLIDR_EL1 value from the Cortex-A57 has them as 1).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/system/arm/emulation.rst |  1 +
 target/arm/cpu64.c            | 10 ++++++++++
 2 files changed, 11 insertions(+)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index c3bd0676a87..122306a99f1 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -42,6 +42,7 @@ the following architecture extensions:
 - FEAT_PMUv3p4 (PMU Extensions v3.4)
 - FEAT_RDM (Advanced SIMD rounding double multiply accumulate instructions)
 - FEAT_RNG (Random number generator)
+- FEAT_S2FWB (Stage 2 forced Write-Back)
 - FEAT_SB (Speculation Barrier)
 - FEAT_SEL2 (Secure EL2)
 - FEAT_SHA1 (SHA1 instructions)
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 2974cbc0d35..ed2831f1f38 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -769,6 +769,15 @@ static void aarch64_max_initfn(Object *obj)
     t = FIELD_DP64(t, MIDR_EL1, REVISION, 0);
     cpu->midr = t;
 
+    /*
+     * We're going to set FEAT_S2FWB, which mandates that CLIDR_EL1.{LoUU,LoUIS}
+     * are zero.
+     */
+    u = cpu->clidr;
+    u = FIELD_DP32(u, CLIDR_EL1, LOUIS, 0);
+    u = FIELD_DP32(u, CLIDR_EL1, LOUU, 0);
+    cpu->clidr = u;
+
     t = cpu->isar.id_aa64isar0;
     t = FIELD_DP64(t, ID_AA64ISAR0, AES, 2); /* AES + PMULL */
     t = FIELD_DP64(t, ID_AA64ISAR0, SHA1, 1);
@@ -841,6 +850,7 @@ static void aarch64_max_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64MMFR2, VARANGE, 1); /* FEAT_LVA */
     t = FIELD_DP64(t, ID_AA64MMFR2, TTL, 1); /* FEAT_TTL */
     t = FIELD_DP64(t, ID_AA64MMFR2, BBM, 2); /* FEAT_BBM at level 2 */
+    t = FIELD_DP64(t, ID_AA64MMFR2, FWB, 1); /* FEAT_S2FWB */
     cpu->isar.id_aa64mmfr2 = t;
 
     t = cpu->isar.id_aa64zfr0;
-- 
2.25.1


