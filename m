Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F6A3B5F91
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 16:05:40 +0200 (CEST)
Received: from localhost ([::1]:36506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxrtL-0003t3-UJ
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 10:05:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lxrmp-0002ys-K4
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 09:58:55 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:50885)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lxrmc-00062C-Dn
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 09:58:55 -0400
Received: by mail-wm1-x32c.google.com with SMTP id o22so10608482wms.0
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 06:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=6ECd1CqiW7oll4Lgyq4I+GHa5FBDnDyrRFiDMwgYQx4=;
 b=y5tb+hHy82XfmJgI553WqiveiC7YvZ8eXmFoj+T8j3MnZbtCGGywzoKELe37JDcTmp
 +M8g0OKVbWNI6aGNFmvhECQpi3HedOwlYFqJBphTwNf7CKZ9ScAtIwlbmluABO0MgwkB
 C3/UyQk8knJQZG7DoC3gUUoEgeUsvLonPNT1vWFqB3KZ+igyB/+lIlW49dXaJ3eCK62X
 U+7uFPVCz12l/eCSVb9zF4jDeYkGQYNdDhwJn83ngsI8KjsipK972LTGmqAhUewPv3Fn
 YsfqXMmT2m/mlgFl6UkWX4F2W6gz9v6yTWWb8fw+qZr+T/gT9BNhE5zn0sEbPLgq66zL
 3D9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6ECd1CqiW7oll4Lgyq4I+GHa5FBDnDyrRFiDMwgYQx4=;
 b=A9LVytCdAIIvHHQJGLDJk5TJ2alI1tOxS7Qj/AOgNjfK6SbxnA7YdqbHFGr7jgwABp
 KhXv9pwomtmJpJSDj6dY83PAeET9fnSIEpxxc0HVjBVKP4fTtD42tobChKMLKfjUSWBJ
 eq2u1bocmb6rVxHbhQSe/r6aNDhme4mgXPuZSYhDiS8V1QO+mv2d7hYDzqKun+o9g2dC
 OE9HkMahnIOzpQh7tQfLENuzulWd7Mjj7XLmXHbrxoZM99bayL8+trvqQJqCPDVeBsW5
 4p5ThiHgpGvcOEpifm+D6i1KOeTD9D7zn31Bp6oQ9hi1x75dB4bVjNOOGBMTViOY+FQD
 jSIQ==
X-Gm-Message-State: AOAM531/1pkMzfQlP3EylPM94FmmZkcxSIXm933Jlnxz4X2WrlvDnlit
 u2fGxym6xgU8jAu0neZU2IYaTQ==
X-Google-Smtp-Source: ABdhPJxxdjO/fLvVCa+Rtnf3Ke2PnEczNVfnzKyjKnZskE3TjGeOKK3Jg7LubUPoyeHDIggq7kj/Eg==
X-Received: by 2002:a1c:4e10:: with SMTP id g16mr14600wmh.145.1624888720848;
 Mon, 28 Jun 2021 06:58:40 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id d12sm12047627wri.77.2021.06.28.06.58.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jun 2021 06:58:40 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 05/18] target/arm: Use dup_const() instead of
 bitfield_replicate()
Date: Mon, 28 Jun 2021 14:58:22 +0100
Message-Id: <20210628135835.6690-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210628135835.6690-1-peter.maydell@linaro.org>
References: <20210628135835.6690-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use dup_const() instead of bitfield_replicate() in
disas_simd_mod_imm().

(We can't replace the other use of bitfield_replicate() in this file,
in logic_imm_decode_wmask(), because that location needs to handle 2
and 4 bit elements, which dup_const() cannot.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-a64.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 97b4a41a0c7..02730397e3d 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -8221,7 +8221,7 @@ static void disas_simd_mod_imm(DisasContext *s, uint32_t insn)
         /* FMOV (vector, immediate) - half-precision */
         imm = vfp_expand_imm(MO_16, abcdefgh);
         /* now duplicate across the lanes */
-        imm = bitfield_replicate(imm, 16);
+        imm = dup_const(MO_16, imm);
     } else {
         imm = asimd_imm_const(abcdefgh, cmode, is_neg);
     }
-- 
2.20.1


