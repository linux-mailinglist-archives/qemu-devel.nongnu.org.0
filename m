Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67F444EDF60
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 19:09:05 +0200 (CEST)
Received: from localhost ([::1]:42186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZyIC-0000wq-HY
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 13:09:04 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nZyHC-0008Ps-D7
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 13:08:02 -0400
Received: from [2607:f8b0:4864:20::32a] (port=35812
 helo=mail-ot1-x32a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nZyHA-0002qG-Rb
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 13:08:02 -0400
Received: by mail-ot1-x32a.google.com with SMTP id
 d15-20020a9d72cf000000b005cda54187c3so334222otk.2
 for <qemu-devel@nongnu.org>; Thu, 31 Mar 2022 10:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BrcRweziMF1Qvz+Mx9ZEYbuyW/RKX8JLxs2siwubst4=;
 b=pkqfBcrNmmZlwTnLoIhSuypLuzscV86pD7n67VWCXpIUGVtHVYsyP3pcU5MpWwANt1
 GFZnhG4HoS/ypf5ouA7VRfQV8pxWmcVApeIkpjUFi+lIzPIedXW6WjHwp7OrrbC2ePGP
 iQZPzThJCXOE7i3LvqQSW4/XozdVpbmngT5ffmXlaJG8CXx2nXUbV2d+97bB3ycnXLiG
 mtfgO6/meH7UGKLHg6CWMuGHKA2ML48FcIZ4kDosNaVFtb9Wq+wRF2Ra0LzczT/hNF73
 GbRDubLCS8hp1kpcoVT5aefhYdNDVqO4Eor5EZJycvZ9lnnFt8v8jk95HhJzSXwisNDf
 Lt/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BrcRweziMF1Qvz+Mx9ZEYbuyW/RKX8JLxs2siwubst4=;
 b=f1ZS7bV0uG4sCRKVL4tUfgF3Z50rsr7C+5ox2vvY/e7mIOUHshaX3uyVAGJOb4gCef
 c3hQmfV6XntHyKH8RSCAoXVhxfmGURTk3jmYVvihSJY3ckPDlbi2xhGE7xCq92a4bRfT
 kkEzMQEJdwtCtzjfv0SQ/Gw7ojPP5SQWtxPcUDyR6N372FTFav1yPgM9s3clStD9FSrl
 L3C0gB0p8JwjO3Z8A3rZrxgl060Pbe4zD4pjyoW0KLSskH+K7IBjfh6FwTKjQj+bBa8C
 5+hdUjr9Uk8YRP9pVUoXMjbUNkbyIHFVsgKtnoLpEkEwVvwP2W5ciKXZ5Tk7gRZMwkG4
 VWEw==
X-Gm-Message-State: AOAM531PPJ3T0AzuuvMbh+sjEqLPmWhEims/oy8YoBUM4xZsLYmpJN5F
 1wCQR5gdSwatGf3cRJ7sHOlH0ToQg+bXwZw47YQ=
X-Google-Smtp-Source: ABdhPJwzsFJl0c/bzmhdTeqawC7sLwNk6WnG8fYX6dU8uutDJsx0xUIYnowb5ii+aBsaGsL9Woeohg==
X-Received: by 2002:a9d:5f0b:0:b0:5b2:2a88:5084 with SMTP id
 f11-20020a9d5f0b000000b005b22a885084mr6106585oti.0.1648746479731; 
 Thu, 31 Mar 2022 10:07:59 -0700 (PDT)
Received: from localhost.localdomain (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168]) by smtp.gmail.com with ESMTPSA id
 bg39-20020a056820082700b00324c8eba341sm3160oob.18.2022.03.31.10.07.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Mar 2022 10:07:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 1/1] tcg/aarch64: Use 'ull' suffix to force 64-bit constant
Date: Thu, 31 Mar 2022 11:07:54 -0600
Message-Id: <20220331170754.398913-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220331170754.398913-1-richard.henderson@linaro.org>
References: <20220331170754.398913-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::32a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::32a;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Typo used only 'ul' suffix, which is still 32-bits for windows host.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/947
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/aarch64/tcg-target.c.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index 077fc51401..5e67f881f1 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -1086,9 +1086,9 @@ static void tcg_out_movi(TCGContext *s, TCGType type, TCGReg rd,
         opc = I3405_MOVZ;
     }
     s0 = ctz64(t0) & (63 & -16);
-    t1 = t0 & ~(0xffffUL << s0);
+    t1 = t0 & ~(0xffffull << s0);
     s1 = ctz64(t1) & (63 & -16);
-    t2 = t1 & ~(0xffffUL << s1);
+    t2 = t1 & ~(0xffffull << s1);
     if (t2 == 0) {
         tcg_out_insn_3405(s, opc, type, rd, t0 >> s0, s0);
         if (t1 != 0) {
-- 
2.25.1


