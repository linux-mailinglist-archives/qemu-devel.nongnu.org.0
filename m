Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4525652F6A8
	for <lists+qemu-devel@lfdr.de>; Sat, 21 May 2022 02:17:57 +0200 (CEST)
Received: from localhost ([::1]:55338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nsCoe-0003Na-Bu
	for lists+qemu-devel@lfdr.de; Fri, 20 May 2022 20:17:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nsCbv-0008BA-2z
 for qemu-devel@nongnu.org; Fri, 20 May 2022 20:04:47 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:39765)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nsCbZ-00040E-6b
 for qemu-devel@nongnu.org; Fri, 20 May 2022 20:04:40 -0400
Received: by mail-pl1-x631.google.com with SMTP id bh5so8560203plb.6
 for <qemu-devel@nongnu.org>; Fri, 20 May 2022 17:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=t4HrU8aBsDXJmwDfJHBNtFc0i86kohNVifRpodC+Hr4=;
 b=QVHAOnOS0+4w2Gfmp0mHDxMMxWQgSrM7S0AyNrqBTB1E5Tvle/EJCsBOFWGOhQ7LE6
 3eMYmmtAVsh3t4t3U3PeZu9bDkQwf5gPrF1hz9nxK/5EglVlmG5Psu74QbQAW5ptonOK
 3Gf7NVhm8TdmByXw3P+36IBOokItIHkeEftQAwn8AqZ16vTv85GNenyS1XuBGjMCavXb
 xyOSYZnYmui8KQa3o9MIIowuvioDN3tjIqe6xcnTkLXTzeLJevPalm4boQ8hMtVumaUd
 rnnH2cNheS/EQrUpDW9f3vUj1thZ7tipbeLfAn8jWgyjt3fGaKzPf1YHjuxtreLdSueQ
 cZjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=t4HrU8aBsDXJmwDfJHBNtFc0i86kohNVifRpodC+Hr4=;
 b=U3gieeTtuOPXdgxDeLLqVFh5ESvrgJ0+2CO5/shfJkv0dvCBv1lkTD6he+NZVb6zQO
 zZokB7Wv5Mh30WxWaqlgnwykcKV5LgAcblW8pMUwtlKuf++0lpjsy3m5bcE/ygQ6QRo9
 niCzyd9syTzTpDiHOFixHMf2CD+EsErHK85t0t4c090kwLmM5DQbTTCTHI7dyoOHEo32
 BnYwiXU5Epx0q17TNr6KODbnn/iz31g6nMaVbXQhW59Ycvq215LamfrdKAuY4i4lUkZy
 jI5hr/9NevlMw1fxlqL6SyDX2MRELFMor2YOvYm3qVHhbAdDd5+Q+x1o5xkdGg+kafgZ
 Rl1Q==
X-Gm-Message-State: AOAM532jzWym8YL+yjKZrrSWvLzovaKsCrT6OFOdnVq+B1xe6kQ/f1kG
 TFbn/mdBuP8D9eT1moPyB6b6s805ZMecMQ==
X-Google-Smtp-Source: ABdhPJwcyuHR8aCxQTkJkNnT6J/s4GSCfGP8alWCMmPQhh2pV6ggc6u5EoCYq/jkcw6nTWmgrnyhBg==
X-Received: by 2002:a17:902:8303:b0:15f:86f:70a with SMTP id
 bd3-20020a170902830300b0015f086f070amr12216102plb.5.1653091462701; 
 Fri, 20 May 2022 17:04:22 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 h8-20020a654808000000b003f9d1c020cbsm306369pgs.51.2022.05.20.17.04.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 May 2022 17:04:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	alex.bennee@linaro.org
Subject: [PATCH v3 17/49] semihosting: Use struct gdb_stat in
 common_semi_flen_cb
Date: Fri, 20 May 2022 17:03:28 -0700
Message-Id: <20220521000400.454525-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220521000400.454525-1-richard.henderson@linaro.org>
References: <20220521000400.454525-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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

Use offsetof instead of an integer constant.
Load the entire 64-bit size while we're at it.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 semihosting/arm-compat-semi.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index 2e0e7febb1..7becc14a81 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -325,14 +325,12 @@ static void
 common_semi_flen_cb(CPUState *cs, target_ulong ret, target_ulong err)
 {
     if (!err) {
-        /*
-         * The size is always stored in big-endian order, extract
-         * the value. We assume the size always fit in 32 bits.
-         */
-        uint32_t size;
-        cpu_memory_rw_debug(cs, common_semi_flen_buf(cs) + 32,
-                            (uint8_t *)&size, 4, 0);
-        ret = be32_to_cpu(size);
+        /* The size is always stored in big-endian order, extract the value. */
+        uint64_t size;
+        cpu_memory_rw_debug(cs, common_semi_flen_buf(cs) +
+                            offsetof(struct gdb_stat, gdb_st_size),
+                            &size, 8, 0);
+        ret = be64_to_cpu(size);
     }
     common_semi_cb(cs, ret, err);
 }
-- 
2.34.1


