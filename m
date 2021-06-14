Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3DC73A5E7E
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 10:40:57 +0200 (CEST)
Received: from localhost ([::1]:42548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsi9Q-0004uy-Ol
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 04:40:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lsi6i-00025E-B7
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 04:38:08 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:53099)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lsi6f-0003Uz-Vh
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 04:38:08 -0400
Received: by mail-pj1-x102e.google.com with SMTP id h16so9287434pjv.2
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 01:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=czDgvGtAgl/3pReno00NuxkKPkp4f3cviydaeOt2DuE=;
 b=AmJdjpiQE/03GbrJ97n12EmYqIvppOd6KUP90GSOEioPT7yOtYGzndiFUVSlJRxXXI
 41QRlDKMt91a9RBWqOd7mNx+qhVM+7G3oGUaj3KqNNROvAy5Uw2czc6NEJS/hhP+tlpW
 lMOApwIegXuRi+CQgHmtF+SHPIfXakjWvaVfsaVKmN2s906OT2ALXvItH9LmuALVdsoL
 POMSrN4C2fUI8N8EdWTCA3H81dgucE9Ia+8+pzEHnBBY9ZVYZWVuRVyv9xT1Gk+nzUMa
 tpfw7bfQ/JZdiqmrzAs64f8qDKOBTsE/frlXRDDM7y2SkHNFHQffcrqsNxszw0cLFj2u
 wCZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=czDgvGtAgl/3pReno00NuxkKPkp4f3cviydaeOt2DuE=;
 b=ZP1d4PHWQ9L37t9gkkc7Kd/AUYroyfXQZA3z5soigBi8nJGzRMwZl//fBDm5gWF99D
 N3nZOgqrKaOQcSaK63iDMdq+w1oLnK3BixneZaxXxGl8ftcSSB26OmqtCcWCuKurB09L
 Si7SPhqht8y9oM9memol4bEJDqZ3HweYyfUQWLxfPZQc2UC5/U13Kf/jLdVgGxBiwrBg
 UIPX34qoEfr9jxm0FpilyUpxXDTIQ9/otw4wDZ5s2Yap5yZHrEcVPJlVIk4H9VxBgWWz
 wqn6SBMMyjZ2MomauRF1PxRHhQ4rqYeGgR0MLE9L/XYRuJM1I3fFH8dPpLoTLMrNkG6l
 iXaQ==
X-Gm-Message-State: AOAM532JGzDkA/QSaATrGGuo9gh1sp03TkmAidmjef1qe47Ml82X5A9z
 zDpqajs6JTF9oPUZWkyyyf41FeMQASBcQw==
X-Google-Smtp-Source: ABdhPJwOaHXfFBZ55W/9U+2q0lfP7H+mvc/oV2f3ybshJCw6V/Y2DGY5+tzgO881Wl/yy+Rzrydt5Q==
X-Received: by 2002:a17:902:e843:b029:109:4dbc:d4ed with SMTP id
 t3-20020a170902e843b02901094dbcd4edmr15772954plg.74.1623659883598; 
 Mon, 14 Jun 2021 01:38:03 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id h20sm2242022pfh.24.2021.06.14.01.38.03
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 01:38:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 03/28] tcg/aarch64: Support bswap flags
Date: Mon, 14 Jun 2021 01:37:35 -0700
Message-Id: <20210614083800.1166166-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210614083800.1166166-1-richard.henderson@linaro.org>
References: <20210614083800.1166166-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/aarch64/tcg-target.c.inc | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index 27cde314a9..f72218b036 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -2187,12 +2187,24 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         tcg_out_rev64(s, a0, a1);
         break;
     case INDEX_op_bswap32_i64:
+        tcg_out_rev32(s, a0, a1);
+        if (a2 & TCG_BSWAP_OS) {
+            tcg_out_sxt(s, TCG_TYPE_I64, MO_32, a0, a0);
+        }
+        break;
     case INDEX_op_bswap32_i32:
         tcg_out_rev32(s, a0, a1);
         break;
     case INDEX_op_bswap16_i64:
     case INDEX_op_bswap16_i32:
         tcg_out_rev16(s, a0, a1);
+        if (a2 & TCG_BSWAP_OS) {
+            /* Output must be sign-extended. */
+            tcg_out_sxt(s, ext, MO_16, a0, a0);
+        } else if ((a2 & (TCG_BSWAP_IZ | TCG_BSWAP_OZ)) == TCG_BSWAP_OZ) {
+            /* Output must be zero-extended, but input isn't. */
+            tcg_out_uxt(s, MO_16, a0, a0);
+        }
         break;
 
     case INDEX_op_ext8s_i64:
-- 
2.25.1


