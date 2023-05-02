Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29FF76F4809
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 18:10:33 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptsYw-0002pL-UL; Tue, 02 May 2023 12:09:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ptsYg-0002lo-AT
 for qemu-devel@nongnu.org; Tue, 02 May 2023 12:09:01 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ptsYd-0000bL-QH
 for qemu-devel@nongnu.org; Tue, 02 May 2023 12:08:53 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-3f199696149so25395315e9.0
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 09:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683043730; x=1685635730;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v0deTbEGbpLLBkwrVJC8/AKUmMSe9YNlMldt/k2nv5E=;
 b=oPDDZ/tRKPvvWy1Ri3lD0bH0qo+8ZtUd4pI1J8T4eCjZLXJi/jjCrJ4SdV/C+mJSt2
 Yz7YxgSroYMFwqOgQ+48oa0vMKbZfbBDj31TnVTxxQHd2x82LfCvRvpVFHkZgSQdnOi9
 Xgd0dA5RCs+dAlk1JAZ89AyHzkShzLInIEpsJpP2hJTw8zyB6foFD2OG12juI/vUnGlT
 quY7v7WbcDDKiAQ8AI46F/YrP8RYGpxAVW7Nvp2WvTLvFCs1SF8JHoUUd6Gml02LRHCr
 zcEeZt+dd7gYxI0y9ynNuEfMuiNTeRcqG+qv08q1fuqOuxl5M7+Vs1Xa7rLJf12/RuMk
 m6jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683043730; x=1685635730;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v0deTbEGbpLLBkwrVJC8/AKUmMSe9YNlMldt/k2nv5E=;
 b=Vm5E14DZ/TQTbiDfv2iKqHG7IxmY4U9tRaUiv0vQWtpt9x3zLWkT0umdwTq7cdGwRl
 WvUibJTu7pNyp+qzhWouVN/T+gtjDsPpgogUV6oQyyKGPYN12lTEKgZqV89iD0qbFyoi
 51nLaYWhkJQal3JuSO9uOMrBy5nQ/+nmHXC5q8LAutdyVGenqBiL3ANR9uPMiStQmhA3
 4erAhwKQ14aUpKt2tC+SBEX2Pqare7gO9GJ5PQrly5KrXD1tZwG7AEs4W3+IvqfJWCxl
 ypuBLDC02+kHrM7wC8Vy6AKvXxjDEkKNFeQHhiLIbyZyqw9y8Jrfc0ZhkUkbwtN2AWIM
 1/XA==
X-Gm-Message-State: AC+VfDxYo3lCUWC+HNw4/1/ApXlEH1fs9Cj5GzQziTgscKqKUOZ6dFW6
 CQZtAC8G8XiQdshHurqx1LgkBYgIx0qrPXlW0LkrUQ==
X-Google-Smtp-Source: ACHHUZ7WWx8YnADNY4p8yliHtRF1LPAKfvhuUbbGw84ETOkIV84Y8ErWiWxo5Hbe4TxXW8Z6Uc4xxQ==
X-Received: by 2002:a5d:570f:0:b0:2ee:e47e:9014 with SMTP id
 a15-20020a5d570f000000b002eee47e9014mr10562473wrv.1.1683043730338; 
 Tue, 02 May 2023 09:08:50 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:ad29:f02c:48a2:269c])
 by smtp.gmail.com with ESMTPSA id
 v16-20020a05600c471000b003ede3f5c81fsm39918471wmo.41.2023.05.02.09.08.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 09:08:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: philmd@linaro.org, jiaxun.yang@flygoat.com, crwulff@gmail.com,
 marex@denx.de, ysato@users.sourceforge.jp, mark.cave-ayland@ilande.co.uk
Subject: [PATCH 04/16] target/hppa: Use MO_ALIGN for system UNALIGN()
Date: Tue,  2 May 2023 17:08:34 +0100
Message-Id: <20230502160846.1289975-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230502160846.1289975-1-richard.henderson@linaro.org>
References: <20230502160846.1289975-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x333.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hppa/translate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/hppa/translate.c b/target/hppa/translate.c
index 6a3154ebc6..59e4688bfa 100644
--- a/target/hppa/translate.c
+++ b/target/hppa/translate.c
@@ -271,7 +271,7 @@ typedef struct DisasContext {
 #ifdef CONFIG_USER_ONLY
 #define UNALIGN(C)  (C)->unalign
 #else
-#define UNALIGN(C)  0
+#define UNALIGN(C)  MO_ALIGN
 #endif
 
 /* Note that ssm/rsm instructions number PSW_W and PSW_E differently.  */
-- 
2.34.1


