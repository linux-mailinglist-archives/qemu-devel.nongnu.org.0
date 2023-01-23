Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE98F677C9C
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Jan 2023 14:38:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJwzv-00066B-Ks; Mon, 23 Jan 2023 08:36:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pJwzU-0005vR-5Z
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 08:36:14 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pJwzP-0002Lc-3m
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 08:36:02 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 f12-20020a7bc8cc000000b003daf6b2f9b9so10606305wml.3
 for <qemu-devel@nongnu.org>; Mon, 23 Jan 2023 05:35:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=yoMZ5Lhhpa4yw40aAugkzPNGIP1VZYIJaNLaSg584+0=;
 b=pubc/w3r0SHPLirgKvZ9tHunQbNO5r3h/hqejuqylpI0HP8guO9+oJPDljcEMokFWr
 QBZaE/tDjd/PCxyZP0+k0mU/saGFHCtunk+clT35B7pn6k1UmbwnUv7XqTgwFr6cONyY
 SNbRsTSj9npVgd//gsS63A+HpBwC5xDjNolMoi1I/KGl/YqYDHv2E1PZ8LCtifHjujAe
 gbyNvmgmU7lOx2m4Pojhpqf86TrIcV4SDHR302GSLoogFOzE0N26SfAsC8awTKwPTbyy
 THrsCT+KS+akKkFVgBzuQZTajJ+ITDLAxT/YcWS+Vn2Y4sHsNHSNRNscr/rLUrdNow/k
 H7CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yoMZ5Lhhpa4yw40aAugkzPNGIP1VZYIJaNLaSg584+0=;
 b=fFEXGwyf7/6LkNchnVW0rVw5b5VmG6DF+xcCZ3jqR3ql98gWdAOK701YGHrWdOsUpm
 MYRx5dVmN6H9GO0dNGVg/z9MfctEgaZQkweqeM2NqlOgkjoq9trdQUXGHP7tiRJyt4fc
 meZdjqRHcovuqC5czfnxOhUtWBtszyI7f6N59Y6pyw7EL35qZctRukTbpxbxop3Ul4di
 PoXaBemQRX/lyUJ26Ulj1fxncyDwA0qPB2Z5jVqF5FeT8M26jWT27SZEh1WRmYbCBbuD
 DWgkLZmNcrRwp9Jlg7LBuLKFTf9WFAEmWMg3FguQKl4Ee8Hv1gCP8bgsw+q9RD2YzOJB
 aw9Q==
X-Gm-Message-State: AFqh2kpDM6uqPVwWrHjdWUS5O1pUp6Kn/LnWBtXaIepV/GnTGFsBbsv5
 N3FI2jO5UlEzdfKrv9ycqoGEupCNEWK1Nz08
X-Google-Smtp-Source: AMrXdXtzuOgDZRvCoy1QGAoOy17sgxIC0fQEopdp26qgZNu3opubZxVoC7oqy1hTG6cIJZW6j69aqw==
X-Received: by 2002:a05:600c:1d05:b0:3d2:3be4:2d9a with SMTP id
 l5-20020a05600c1d0500b003d23be42d9amr22945882wms.20.1674480957198; 
 Mon, 23 Jan 2023 05:35:57 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 d19-20020a05600c34d300b003a6125562e1sm10817457wmq.46.2023.01.23.05.35.56
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 05:35:56 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 01/26] target/arm: Widen cnthctl_el2 to uint64_t
Date: Mon, 23 Jan 2023 13:35:28 +0000
Message-Id: <20230123133553.2171158-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230123133553.2171158-1-peter.maydell@linaro.org>
References: <20230123133553.2171158-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Richard Henderson <richard.henderson@linaro.org>

This is a 64-bit register on AArch64, even if the high 44 bits
are RES0.  Because this is defined as ARM_CP_STATE_BOTH, we are
asserting that the cpreg field is 64-bits.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1400
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20230115171633.3171890-1-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index bf2bce046d5..1feb63b4d73 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -479,7 +479,7 @@ typedef struct CPUArchState {
         };
         uint64_t c14_cntfrq; /* Counter Frequency register */
         uint64_t c14_cntkctl; /* Timer Control register */
-        uint32_t cnthctl_el2; /* Counter/Timer Hyp Control register */
+        uint64_t cnthctl_el2; /* Counter/Timer Hyp Control register */
         uint64_t cntvoff_el2; /* Counter Virtual Offset register */
         ARMGenericTimer c14_timer[NUM_GTIMERS];
         uint32_t c15_cpar; /* XScale Coprocessor Access Register */
-- 
2.34.1


