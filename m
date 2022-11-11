Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A5A462550E
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 09:17:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otOgC-0006qK-Go; Fri, 11 Nov 2022 02:42:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1otOg9-0006o4-3j
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 02:42:21 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1otOg2-00082S-R7
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 02:42:20 -0500
Received: by mail-pl1-x62a.google.com with SMTP id l2so3601547pld.13
 for <qemu-devel@nongnu.org>; Thu, 10 Nov 2022 23:42:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=tSbRzCjHlrSQSoghRByzLuEHEpXHbvdfoP5b3KIKF+c=;
 b=qUuq9QN/1GOuvvv3rdTcqjGcNENyVX9CCFSqId0unweu07cr6iEBPBros8pFwaEZYQ
 Rpi1VghcVUaNYoSLpI3nnXgddLwa9UYkUaCEkFY09t1AsHNDLIFsY8LibMG4I0SxVIbj
 2hqcdXdlX+XHWig2CJqKJ5S0NEGY0WktrQiFxdoTXm+TGoT80l63LpG0RFBqW8jOlaw/
 ks0P7h4HOkHy4HCIoTAwIP4+XUgyrFSnIEuBZv9T7MHqrY8NDqCQpTlv3r22P2Zl42kI
 OfTSfHbyviXIt9KtviN3zd+ilTbtbx+T/GsMijV4GKhb5am4b0FTp4aRrZDj4iZ86fcF
 3DRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tSbRzCjHlrSQSoghRByzLuEHEpXHbvdfoP5b3KIKF+c=;
 b=1z6q5SBnLdDNP0qV4zCLycgMaVXR/DMDsu7iHszg5lIPNUXJxAwdiT0/oY6sZjk33/
 XDorQSblkU0p68xocoOn8pcsfd+MLqtQxENSSyPQCndzR6uitBlnbciNPDY5byA+rzqf
 SFzjSsLY1yvPg3RRXAg6sE4S4kr4gJId9qp9nTPUtYW6Cqpl4US9/5ybQpSlkucBZ+jX
 ni2SvWhHaJ+8Vn6f5T3fcNyklG3K0xgpCunzsBTgLSJxkPyUnFJphktpicTuoxYqAQrP
 s2sPvIfx65bBIpp94DiK2xQk6vQxZl+WPTQaOtK1lJKEANr4KDSIfCspvr2GtS4Scbjc
 +kOA==
X-Gm-Message-State: ANoB5pnQHmDHVyjddYidrPxkPEzfeCu1tbM1mgEPyS2iCantX/BEMVPf
 NV0FpKuxWE8K6vD8BZpwjPEWid2CYRfdvVGU
X-Google-Smtp-Source: AA0mqf59PUO4acWqnv0hPRzv8sCflHmYb5HxHP7NSDLgNga9hTOfotGJLyLSVetuDaVLTYxlIkxLbw==
X-Received: by 2002:a17:902:f68c:b0:186:90a7:6b80 with SMTP id
 l12-20020a170902f68c00b0018690a76b80mr1284094plg.172.1668152530466; 
 Thu, 10 Nov 2022 23:42:10 -0800 (PST)
Received: from stoup.lan
 (2001-44b8-2176-c800-0aef-59aa-1faf-7e61.static.ipv6.internode.on.net.
 [2001:44b8:2176:c800:aef:59aa:1faf:7e61])
 by smtp.gmail.com with ESMTPSA id
 o15-20020a170902d4cf00b001754fa42065sm976069plg.143.2022.11.10.23.42.08
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Nov 2022 23:42:10 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-8.0 v3 27/45] tcg/aarch64: Merge tcg_out_callr into
 tcg_out_call
Date: Fri, 11 Nov 2022 17:40:43 +1000
Message-Id: <20221111074101.2069454-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221111074101.2069454-1-richard.henderson@linaro.org>
References: <20221111074101.2069454-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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

There is only one use, and BLR is perhaps even more
self-documentary than CALLR.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/aarch64/tcg-target.c.inc | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index 344b63e20f..1af879e6f5 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -1336,11 +1336,6 @@ static void tcg_out_goto_long(TCGContext *s, const tcg_insn_unit *target)
     }
 }
 
-static inline void tcg_out_callr(TCGContext *s, TCGReg reg)
-{
-    tcg_out_insn(s, 3207, BLR, reg);
-}
-
 static void tcg_out_call(TCGContext *s, const tcg_insn_unit *target)
 {
     ptrdiff_t offset = tcg_pcrel_diff(s, target) >> 2;
@@ -1348,7 +1343,7 @@ static void tcg_out_call(TCGContext *s, const tcg_insn_unit *target)
         tcg_out_insn(s, 3206, BL, offset);
     } else {
         tcg_out_movi(s, TCG_TYPE_I64, TCG_REG_TMP, (intptr_t)target);
-        tcg_out_callr(s, TCG_REG_TMP);
+        tcg_out_insn(s, 3207, BLR, TCG_REG_TMP);
     }
 }
 
-- 
2.34.1


