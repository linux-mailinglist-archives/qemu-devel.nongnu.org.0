Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D14536F3C2
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 03:38:45 +0200 (CEST)
Received: from localhost ([::1]:34338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcI7A-00021K-Me
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 21:38:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcHlX-0003H5-Dj
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 21:16:23 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:38837)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcHl9-0007aI-AF
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 21:16:23 -0400
Received: by mail-pg1-x530.google.com with SMTP id i14so3864760pgk.5
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 18:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SMBeb0vvlSxkj9D6NrOhypGO0r00xMqrewSjQLWfP30=;
 b=hM4SkwkzJa2TAc4PKjFZYOi7KnoO23imm77vtTsEl5w1ZC1TN/6yzxatHEM88YECgs
 VxqW6FX8y/FvbEl7+Gzhnr2KBnLiXNkqITezh9KC9DhqbHBm2Vr/LnT5F3Xlm1VyexBX
 UG8YJm0ByYpINwUy2G91C87Q9IcHvA9I2sD/4h4LUjahf1vSaw8QgYGN8PCt4aC8lSvD
 6lC4iOoFDlnVYbVNMXOSRwmnjsDzigD1J36ziVrjmVVJTrWxH+wNhN3SnoBsnI7agD8Y
 DA7uTzza6QB0xZ2wOt6Ka8EtttVORUK9y0d17/bVyvowgCeh4Nx3OjMGJn7QVbsfJkev
 XeEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SMBeb0vvlSxkj9D6NrOhypGO0r00xMqrewSjQLWfP30=;
 b=ZFk/qJcUcYF1MnR5C41w3XID4nScdbxQkfg01yCRGlJfpL8KOKlEdsZ/QSiZqziVBe
 FUcADcI00vxkug7G53EbzLNV7kQMX7Tlz4pFBUM8kexKZZu1DjKRf6MwWv8dpfQvr0le
 txxik2gNLSgUjWOAkSzQSkMDtcr+g03PMO+sVL8wdWqA5iBmj+l8+Kqw023Nol44mIhc
 8V0taqubVxXjfApC9f785/6vznVkD4UPm8g0wS8dLEL+7LhcqdsaMQnA7XK2t08nXNyM
 9jcZrXpHZS1k2klk/1/XIo0CVKUK48aBJczusfkHc30WrV2zru8OnTzCfsLPONL1n5wW
 veKg==
X-Gm-Message-State: AOAM530hHQWFs1ljOmaHff8ZpoV+0XACv7bpeIvFhyPvV18FmJrOwF/6
 WdrqzotfcEYENXWfrQk3leMflR+6wiooqA==
X-Google-Smtp-Source: ABdhPJzlbjtpFI/7Wd4xDJDaZT63p6LnvEwiwl4hD11Z0cj/GdMq5Hz7DGGRMk1fvL2/JD0yFqF3Lw==
X-Received: by 2002:a62:f90d:0:b029:250:5397:4658 with SMTP id
 o13-20020a62f90d0000b029025053974658mr2461002pfh.48.1619745358148; 
 Thu, 29 Apr 2021 18:15:58 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id 1sm161277pjx.46.2021.04.29.18.15.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Apr 2021 18:15:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 20/30] target/ppc: Mark helper_raise_exception* as noreturn
Date: Thu, 29 Apr 2021 18:15:33 -0700
Message-Id: <20210430011543.1017113-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210430011543.1017113-1-richard.henderson@linaro.org>
References: <20210430011543.1017113-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: f4bug@amsat.org, luis.pires@eldorado.org.br, qemu-ppc@nongnu.org,
 lagarcia@br.ibm.com, bruno.larsen@eldorado.org.br,
 matheus.ferst@eldorado.org.br, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/helper.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index 6a4dccf70c..af5b3586d1 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -1,5 +1,5 @@
-DEF_HELPER_FLAGS_3(raise_exception_err, TCG_CALL_NO_WG, void, env, i32, i32)
-DEF_HELPER_FLAGS_2(raise_exception, TCG_CALL_NO_WG, void, env, i32)
+DEF_HELPER_FLAGS_3(raise_exception_err, TCG_CALL_NO_WG, noreturn, env, i32, i32)
+DEF_HELPER_FLAGS_2(raise_exception, TCG_CALL_NO_WG, noreturn, env, i32)
 DEF_HELPER_FLAGS_4(tw, TCG_CALL_NO_WG, void, env, tl, tl, i32)
 #if defined(TARGET_PPC64)
 DEF_HELPER_FLAGS_4(td, TCG_CALL_NO_WG, void, env, tl, tl, i32)
-- 
2.25.1


