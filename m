Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F611FB4FA
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Jun 2020 16:49:40 +0200 (CEST)
Received: from localhost ([::1]:37494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jlCuB-0000iM-NV
	for lists+qemu-devel@lfdr.de; Tue, 16 Jun 2020 10:49:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <flukshun@gmail.com>)
 id 1jlCQW-0003RE-84; Tue, 16 Jun 2020 10:19:00 -0400
Received: from mail-oo1-xc41.google.com ([2607:f8b0:4864:20::c41]:43355)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <flukshun@gmail.com>)
 id 1jlCQU-0006x6-MV; Tue, 16 Jun 2020 10:18:59 -0400
Received: by mail-oo1-xc41.google.com with SMTP id i4so1365716ooj.10;
 Tue, 16 Jun 2020 07:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=fqsQVkHuoYwfKpLZIzOnVAvejP3nC+yxd70HJ1sYMdQ=;
 b=C8k5Sm2F2RjzW0oEnrcXThPDMiKat+FMkkY5HdHMMjNk03H33cjQCmbF2HzU9tRuag
 tncmRdeXpAII0z9QJ8mcIPTk42ATekVowYIkFjTHjzvcZheGeDjGA42TuI6Ptt76vTe/
 Ezegil8e/nlvfiDhZNs/sk7k9QdZ1Pn8mAdR8TNHL6Up7XoVeAcqGZEYM5W2/x80vFWR
 0nczRi0E87U3hXfH4JARCnIzTanaEGXe37HDu36xDWHqppzHay0X57oNRehWl8Lm3HJD
 NIr+kPWeUgId4fOuWGFN5DCgIk2dqVBK6xoSXL52Wve/xhcf9TdBqNDLOx79sd+aoCc3
 uKJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references;
 bh=fqsQVkHuoYwfKpLZIzOnVAvejP3nC+yxd70HJ1sYMdQ=;
 b=NZ245u0VoDg5OrKVBzzANrZJmQbJT+XQkwj45aUss4JgRCl6TQ3yWSOL0Sw4EgQndR
 m4CRy4qn1h4Cnowg1evunQ5nyu1/2jdd56K2J48k3Sb3DNzj83s1DgM6NEf3bjsTgL06
 9DEO2VdtLGUYMt0xVr5y6S3ff/11sbJHzFMkhr84frMtcKcfgcUIJGfGYkNMX2uXIfHv
 2WL37cfjGApUWxDIczToQBo0RJI732Y1D9R3Ca81YjUhAew02X/755BJeFkskBfapKAy
 GdMYQ3nZOEZ+E1dPZBZKcj9zdfEkEO5Z4cc7z//1YFV0UYZ/ukGAK3SWnCK6Pmb2UcFw
 5D4g==
X-Gm-Message-State: AOAM531DjDwVcPrt9SuGTy5CQqucp7I0zpDDJwN2kl+BAIlg9H/m5s7E
 p3/Aasssha4XcKeSKdX3K//5yLZZ
X-Google-Smtp-Source: ABdhPJyp/e5RUMVC5IQRQwBbjMsJt0uuOQF4BSGynHM13ygCx27nFmrNaIR91jYEOBtNglQ46DAqQQ==
X-Received: by 2002:a4a:d6c6:: with SMTP id j6mr2566220oot.26.1592317136824;
 Tue, 16 Jun 2020 07:18:56 -0700 (PDT)
Received: from localhost (76-251-165-188.lightspeed.austtx.sbcglobal.net.
 [76.251.165.188])
 by smtp.gmail.com with ESMTPSA id m94sm4078651otm.19.2020.06.16.07.18.55
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 16 Jun 2020 07:18:55 -0700 (PDT)
From: Michael Roth <mdroth@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 55/78] target/ppc: Fix rlwinm on ppc64
Date: Tue, 16 Jun 2020 09:15:24 -0500
Message-Id: <20200616141547.24664-56-mdroth@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200616141547.24664-1-mdroth@linux.vnet.ibm.com>
References: <20200616141547.24664-1-mdroth@linux.vnet.ibm.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::c41;
 envelope-from=flukshun@gmail.com; helo=mail-oo1-xc41.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Vitaly Chikunov <vt@altlinux.org>, qemu-stable@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vitaly Chikunov <vt@altlinux.org>

rlwinm cannot just AND with Mask if shift value is zero on ppc64 when
Mask Begin is greater than Mask End and high bits are set to 1.

Note that PowerISA 3.0B says that for `rlwinm' ROTL32 is used, and
ROTL32 is defined (in 3.3.14) so that rotated value should have two
copies of lower word of the source value.

This seems to be another incarnation of the fix from 820724d170
("target-ppc: Fix rlwimi, rlwinm, rlwnm again"), except I leave
optimization when Mask value is less than 32 bits.

Fixes: 7b4d326f47 ("target-ppc: Use the new deposit and extract ops")
Cc: qemu-stable@nongnu.org
Signed-off-by: Vitaly Chikunov <vt@altlinux.org>
Message-Id: <20200309204557.14836-1-vt@altlinux.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
(cherry picked from commit 94f040aaecf4e41cc68991b80204b1b6886bbdd0)
Signed-off-by: Michael Roth <mdroth@linux.vnet.ibm.com>
---
 target/ppc/translate.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index f5fe5d0611..f87f6eeaf7 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -1938,15 +1938,17 @@ static void gen_rlwinm(DisasContext *ctx)
         me += 32;
 #endif
         mask = MASK(mb, me);
-        if (sh == 0) {
-            tcg_gen_andi_tl(t_ra, t_rs, mask);
-        } else if (mask <= 0xffffffffu) {
-            TCGv_i32 t0 = tcg_temp_new_i32();
-            tcg_gen_trunc_tl_i32(t0, t_rs);
-            tcg_gen_rotli_i32(t0, t0, sh);
-            tcg_gen_andi_i32(t0, t0, mask);
-            tcg_gen_extu_i32_tl(t_ra, t0);
-            tcg_temp_free_i32(t0);
+        if (mask <= 0xffffffffu) {
+            if (sh == 0) {
+                tcg_gen_andi_tl(t_ra, t_rs, mask);
+            } else {
+                TCGv_i32 t0 = tcg_temp_new_i32();
+                tcg_gen_trunc_tl_i32(t0, t_rs);
+                tcg_gen_rotli_i32(t0, t0, sh);
+                tcg_gen_andi_i32(t0, t0, mask);
+                tcg_gen_extu_i32_tl(t_ra, t0);
+                tcg_temp_free_i32(t0);
+            }
         } else {
 #if defined(TARGET_PPC64)
             tcg_gen_deposit_i64(t_ra, t_rs, t_rs, 32, 32);
-- 
2.17.1


