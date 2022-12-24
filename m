Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38B06655BF0
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Dec 2022 01:13:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p9EP0-0002ir-Lr; Sat, 24 Dec 2022 18:58:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p9EOk-0002OA-2m
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 18:57:50 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p9EOi-0006LB-GT
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 18:57:49 -0500
Received: by mail-pj1-x102a.google.com with SMTP id
 o1-20020a17090a678100b00219cf69e5f0so11943461pjj.2
 for <qemu-devel@nongnu.org>; Sat, 24 Dec 2022 15:57:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g+8yoDAKtbWcn6kd6zbMcipsZN6xB1eyyko6EmQwVd4=;
 b=C8zRQIqMzw5QrlC3EAHQiPRefqLPtXOX+w+24X6/H5CDFljBKm9N2RwFh/cqDKrGd6
 BWoZtPp9e8i4lNSmK/6/QYcz4fbEkSVfa7faponaZYA1GPgCjLQaD3BbrTkPVYDvAjxI
 lW81gxHBjeSijjDjeIBz4B6wQYVK3A7YMLJLS9zzKG42b8anWN1zpUCx7ekY2LVAmbXw
 Z6cI14CBnZ2xXIQ4kwTtemRC+t6BU+a/VW2+DKsm6lsJ7AjgbRGFmXRdk/yS7qrCEFyk
 TBaT8DVHMko1q+1AhJQQqPqkmh/d9bbLOpj23OuyUS1MtrMDchBibaLO6C8rlHZNTMfI
 es2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=g+8yoDAKtbWcn6kd6zbMcipsZN6xB1eyyko6EmQwVd4=;
 b=QPF8swXI6eU6KvJigPI5hnvRu3aQqLtq3azYQZcsP2kYWP/UtjTdgpSNuRbCy2t7/6
 6ncAm7B4ex1UwKisrcq9/5KiYRpl+wQx2DO4A6SLAd48KKnwq09VWZ/jVL2/4NLv3mvg
 CLNlHknXvGgJuv5oQeivEWqEGXspwVyOgVerZaAAAEYXWUB8G0gXrOGRenyH9wDm1zYL
 keB9IhohK8/Liancka7ch02NRLZAu8LrPhl/tskFA0jYfqYyvzlK1aeEFAcTGUZ3SwOj
 im3Fo7KJ9WHvaDVCHKbQCiMeiFFfN093WpPUpxWRqS5Bbo4y5E4yPF/klblRCw/38LAK
 zUSg==
X-Gm-Message-State: AFqh2kq6/KA5aJaGx9s3nxsNJf5DVZTC5IBPT+4Dgw7Nro6bs8afvh72
 kTL0sfGNXjmeldqYkBaYocdUhJPFveBgi6jF
X-Google-Smtp-Source: AMrXdXvCaYkp+l078EoQlrPvAZio04594Pp028SRZBp/4nka5qdm1AkPKd3M2CZPnocN/au9/sHUVQ==
X-Received: by 2002:a17:903:2781:b0:189:c3ef:c759 with SMTP id
 jw1-20020a170903278100b00189c3efc759mr16683115plb.68.1671926267147; 
 Sat, 24 Dec 2022 15:57:47 -0800 (PST)
Received: from stoup.. (76-14-210-194.or.wavecable.com. [76.14.210.194])
 by smtp.gmail.com with ESMTPSA id
 cp12-20020a170902e78c00b00187022627d7sm4599716plb.36.2022.12.24.15.57.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Dec 2022 15:57:46 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org,
	philmd@linaro.org
Subject: [PATCH v5 26/43] tcg: Move TCG_TYPE_COUNT outside enum
Date: Sat, 24 Dec 2022 15:57:03 -0800
Message-Id: <20221224235720.842093-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221224235720.842093-1-richard.henderson@linaro.org>
References: <20221224235720.842093-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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

The count is not itself an enumerator.  Move it outside to
prevent the compiler from considering it with -Wswitch-enum.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index afa18986b1..f2da340bb9 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -294,7 +294,8 @@ typedef enum TCGType {
     TCG_TYPE_V128,
     TCG_TYPE_V256,
 
-    TCG_TYPE_COUNT, /* number of different types */
+    /* Number of different types (integer not enum) */
+#define TCG_TYPE_COUNT  (TCG_TYPE_V256 + 1)
 
     /* An alias for the size of the host register.  */
 #if TCG_TARGET_REG_BITS == 32
-- 
2.34.1


