Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76D7365939C
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Dec 2022 01:10:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pB2sS-0003vH-4V; Thu, 29 Dec 2022 19:04:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pB2rX-00039J-0l
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 19:03:05 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pB2rN-0002jI-Kz
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 19:03:01 -0500
Received: by mail-pj1-x102b.google.com with SMTP id
 gv5-20020a17090b11c500b00223f01c73c3so19378037pjb.0
 for <qemu-devel@nongnu.org>; Thu, 29 Dec 2022 16:02:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U5s77/HOJU835mIfYuf5JfxpCLvovCeIACqQpnTsn4Q=;
 b=WpW/d/cTIDQTjQO+HxI6YyhWQtBtpGlz0unyBbptOV1sWNAEOlsfe9np0I9m/F9z2V
 GhN9RlFDdx4zyz25q14vQY1W1jbXaGMx1YVLKWUYtAsXdGFPtwdAJzkaopNjtgxTAzEe
 BAxeGAGa+GH4OcaIcxq4hUgE+aGcThH7nIBUkui2CCqsuTlDdQgjAmjJl7jSQ5FF81RH
 S2DKIeprfmEmuVzLjA2phlMZw2nV8hiFE/0YGsFD1kaXa+HaCCJaW39+FnRa8UPVNT2t
 KJDaOh5DG7HlAMibLZsigTQg7EN6WaAq2BUrY8bhZijAzqUX9GRAkOlSpvO3PQdBXsor
 BTKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=U5s77/HOJU835mIfYuf5JfxpCLvovCeIACqQpnTsn4Q=;
 b=Z5mcikzjFlijnlsADZMr7EA8lQiJ8/u8VAiyd4TRHtETA5XMgVDhK97ALvs07kj12t
 WhnPMWHFGBJarCoNg0QX/Nj+gOMGZGtGZJRxoS3LbYK0y/vtFU4apLBJPWRGlteYxvRF
 0Zr7e8OH9It4AGehsjMHq0WX11jKrbIts7VwePZ8jo3EVeCUxoJessqTLR0YqvDT0xXU
 6qOJd2FDmTZyaQGWimIN+8d0+bm3Fpvd1jzD9npu4e84nM1Wx70rv08QvgQE2FpoZbCS
 0gjUh8rthpxo5TwdUN7iOK+YhbQnA1W0rgM62cFetV8sTGRCq1Q0X5VS0rlmGEYA5aSE
 /+3g==
X-Gm-Message-State: AFqh2kq6ag8WQ94P+9ZCJZtGqMpgs7KN4kwis6QIpsxrJ5GNuKRe83c9
 vlIZ0LaBlfTrKnmQSffFXnWYH3HWr//DIAZR
X-Google-Smtp-Source: AMrXdXurpqhd8tFncLYtFoCoDyhYpEY3tT4rGqngs8JA3nCMSDfRAlkLTz2MiGp8ebOLyPcduCM3aw==
X-Received: by 2002:a17:902:7610:b0:192:751d:b2e4 with SMTP id
 k16-20020a170902761000b00192751db2e4mr15135728pll.48.1672358564913; 
 Thu, 29 Dec 2022 16:02:44 -0800 (PST)
Received: from stoup.. (76-14-210-194.or.wavecable.com. [76.14.210.194])
 by smtp.gmail.com with ESMTPSA id
 j14-20020a170903028e00b00192849e1d0asm7343953plr.116.2022.12.29.16.02.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Dec 2022 16:02:44 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 24/47] tcg: Simplify calls to temp_sync vs mem_coherent
Date: Thu, 29 Dec 2022 16:01:58 -0800
Message-Id: <20221230000221.2764875-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221230000221.2764875-1-richard.henderson@linaro.org>
References: <20221230000221.2764875-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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

The first thing that temp_sync does is check mem_coherent,
so there's no need for the caller to do so.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index 4f2e05c69e..28ab174f1b 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -4078,12 +4078,8 @@ static bool tcg_reg_alloc_dup2(TCGContext *s, const TCGOp *op)
 
     /* If the two inputs form one 64-bit value, try dupm_vec. */
     if (itsl + 1 == itsh && itsl->base_type == TCG_TYPE_I64) {
-        if (!itsl->mem_coherent) {
-            temp_sync(s, itsl, s->reserved_regs, 0, 0);
-        }
-        if (!itsh->mem_coherent) {
-            temp_sync(s, itsh, s->reserved_regs, 0, 0);
-        }
+        temp_sync(s, itsl, s->reserved_regs, 0, 0);
+        temp_sync(s, itsh, s->reserved_regs, 0, 0);
 #if HOST_BIG_ENDIAN
         TCGTemp *its = itsh;
 #else
-- 
2.34.1


