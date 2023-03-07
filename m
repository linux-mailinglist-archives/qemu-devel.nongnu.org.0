Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 655A26AED07
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 19:00:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZbao-0006RW-Ls; Tue, 07 Mar 2023 12:59:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZbaf-0006IC-5H
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 12:59:09 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZbac-0000GF-Ei
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 12:59:08 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 qa18-20020a17090b4fd200b0023750b675f5so17340082pjb.3
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 09:59:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678211944;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q9r/X/c9GiYC7RCcSDqpnpXTI301GHSQAYIf2u9Ea/M=;
 b=xkI2KKugNEeuehBvXCjary2FKeGokjYkHyaSqzgfgyJQVONlo30IvBoIR/B14wAM6e
 7pSFZGKQF258vczhYIIDj/3rYy+F0nlx8F/l1AiPXDVQilcbjYqx2BLvQm7Lu7pHILDz
 yuU3+U9e+N1brap0+GiSr7hpjLUruoMJt+DsAoZF8vClfbpN5QhsWMXGxEry5a3m3Icu
 UImgzJqlMWQG1/3nQ3J7z9ihBKhIYu2ceC1bI293rS+zhCXMnBD2Pg2sH4AEAUw5vFfY
 6esybT6QcGUgI1K2lyMg2nehq3lj/MIXfE/2lg5pGBwsACG0hhxRf9OVAruLRUNE+9HS
 GM2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678211944;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Q9r/X/c9GiYC7RCcSDqpnpXTI301GHSQAYIf2u9Ea/M=;
 b=0pKSqQzXOljIy3EThZX9GaKoWanzxqkyDkLyX9x1emuLzugDD1vKD2no5CUj4w0N6O
 PSwfuPJJQrsA1rRoX2VxQHVcLHfUQqFwb1hSvQCweAbBEDdgVIF5xbsSUmszCg5yLko8
 396N1KsExJF1OYTqbPIPTgqxvzLHzkdDXomsusnPwUbFyRLydq6/6ukfnPrxTWLbObd2
 R03XJwKb749BBFP4IsQVuKvASf5soQKFW/3iJdEJ/4M7jrBfAjyMWsocJSG1nFAL69jx
 kr9cgSi13V3u0h8P2mK7qo1kBd0n6benEzZbY35PKt8/56HUDyjOoRe2I0azr6kMqCKu
 AtFw==
X-Gm-Message-State: AO0yUKXiPolFe4Yf49slrrQzlL+0ehtys1IACljsNZE/y69XtDlNx1Mw
 YaouA7ixG083V4QF+PGceok2IIYN7c6iC75qBhY=
X-Google-Smtp-Source: AK7set/Cb3cF+Ojwu3ArFiChtPnPoJiV7DzNpSYaVWb4/x3Jyscsg+WN1nKZLScbHLoQvum89udbZA==
X-Received: by 2002:a17:903:120b:b0:19a:b092:b31a with SMTP id
 l11-20020a170903120b00b0019ab092b31amr17279714plh.8.1678211943944; 
 Tue, 07 Mar 2023 09:59:03 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:b1e0:bfd9:8b1a:efeb])
 by smtp.gmail.com with ESMTPSA id
 bd6-20020a170902830600b00198e397994bsm8661802plb.136.2023.03.07.09.59.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 09:59:03 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Anton Johansson <anjo@rev.ng>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 18/67] target/arm: Remove `NB_MMU_MODES` define
Date: Tue,  7 Mar 2023 09:57:59 -0800
Message-Id: <20230307175848.2508955-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230307175848.2508955-1-richard.henderson@linaro.org>
References: <20230307175848.2508955-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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

From: Anton Johansson via <qemu-devel@nongnu.org>

Signed-off-by: Anton Johansson <anjo@rev.ng>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230306175230.7110-4-anjo@rev.ng>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu-param.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/target/arm/cpu-param.h b/target/arm/cpu-param.h
index b7bde18986..b3b35f7aa1 100644
--- a/target/arm/cpu-param.h
+++ b/target/arm/cpu-param.h
@@ -45,6 +45,4 @@
     bool guarded;
 #endif
 
-#define NB_MMU_MODES 12
-
 #endif
-- 
2.34.1


