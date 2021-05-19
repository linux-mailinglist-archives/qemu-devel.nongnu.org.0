Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D3683895D9
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 20:53:12 +0200 (CEST)
Received: from localhost ([::1]:43254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljRJf-0006gY-4n
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 14:53:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ljQyo-0004Mh-0s
 for qemu-devel@nongnu.org; Wed, 19 May 2021 14:31:38 -0400
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332]:39590)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ljQyX-0005kR-Lq
 for qemu-devel@nongnu.org; Wed, 19 May 2021 14:31:37 -0400
Received: by mail-ot1-x332.google.com with SMTP id
 d25-20020a0568300459b02902f886f7dd43so12620684otc.6
 for <qemu-devel@nongnu.org>; Wed, 19 May 2021 11:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GrHhxNQ2eayYuE4IBP3WlrTHRS6oVMsMWIzwFX+Pnhg=;
 b=zkE/VXXPNobvU5rkMIboe4XMjSB50f7auI7KGHmSGTjq7ehWd3DYdR8DTpqzbtxHDQ
 r6lKlXjWEfq8s0bzPGBBxSM+P7lJGORDYCYZnrHI3k0639vsfZ3qGd3RLKbo+YD3dyaZ
 e5fVdOzx5r4tbErYtHYbFV0Mxtrc82YudbOcbeN/EUQrjbNfA8iATj+BT8gbSu+kM0fX
 CoOU98m/5kdJqg1AQo49woLI4gHhemnzSQljezNy+BcP5q38DcoYAE1L/9Vz3RXP9D4g
 HLeKI55GRFVZHiEjVmd8DyTnG/W69/0qdgBBabn9V4ZPS664Nk631k2pac3PNXuhJqM+
 8mCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GrHhxNQ2eayYuE4IBP3WlrTHRS6oVMsMWIzwFX+Pnhg=;
 b=CMfn2CqbPGWuDSzm3BHWR3/YUY36q6OYV24yw20XKU9E9fslKXqM/m967fd80J2oH8
 RYI0zDjC120NDdw/Iz1sEJxp2kG1oDyvgOCSy84Kd1J70lZB7AxgPq4TrH9kY7Y17b6H
 Cw5bTqTFW4SF51idZg/5GqNhJhLP/gitWvtuiidAW2TTWdIgeR9Arh/ikwYT0jhNWNR/
 URu2cX8hs3mpDp+KNcx9SGWog0cerqDNo3zIasqBn3qPwLDiD2JTpI5Lx5SFrJckreaX
 iHgf3VcdDxZL+bZTbn9dmQ7KOEmh9kf8LmT6DcY5chHiBQl7s/qv4v4v9bsEcNSqQQyH
 IF3w==
X-Gm-Message-State: AOAM532A8cx8CV8wsuGnE9leKMty2Q6JDwZWN00RCdO5YSH+/whIu5pb
 NHj5C71Fjh08GxQEvc2dmBg5dRUk+3ZK40xU
X-Google-Smtp-Source: ABdhPJzQtdaQt13jdC3QqET7peehWRpZShEDLvY1i+UL+526W+rnX/Y/1KTLi44nXtsMfH2iaxyyag==
X-Received: by 2002:a05:6830:611:: with SMTP id
 w17mr637101oti.225.1621449076241; 
 Wed, 19 May 2021 11:31:16 -0700 (PDT)
Received: from localhost.localdomain ([45.235.253.15])
 by smtp.gmail.com with ESMTPSA id l9sm28428oou.43.2021.05.19.11.31.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 11:31:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 24/50] target/i386: Reduce DisasContext popl_esp_hack and
 rip_offset to uint8_t
Date: Wed, 19 May 2021 13:30:24 -0500
Message-Id: <20210519183050.875453-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210519183050.875453-1-richard.henderson@linaro.org>
References: <20210519183050.875453-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::332;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Both of these fields store the size of a single memory access,
so the range of values is 0-8.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20210514151342.384376-25-richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 1367e53e4e..847502046f 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -106,8 +106,8 @@ typedef struct DisasContext {
     int repz_opt; /* optimize jumps within repz instructions */
     int mem_index; /* select memory access functions */
     uint32_t flags; /* all execution flags */
-    int popl_esp_hack; /* for correct popl with esp base handling */
-    int rip_offset; /* only used in x86_64, but left for simplicity */
+    uint8_t popl_esp_hack; /* for correct popl with esp base handling */
+    uint8_t rip_offset; /* only used in x86_64, but left for simplicity */
     int cpuid_features;
     int cpuid_ext_features;
     int cpuid_ext2_features;
-- 
2.25.1


