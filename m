Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F3EA3FB199
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 09:08:13 +0200 (CEST)
Received: from localhost ([::1]:54886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKbOu-0002OM-Cr
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 03:08:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mKamS-0003Eo-2w
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 02:28:29 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:33659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mKamN-0001q6-Ut
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 02:28:27 -0400
Received: by mail-pl1-x62e.google.com with SMTP id m4so7977163pll.0
 for <qemu-devel@nongnu.org>; Sun, 29 Aug 2021 23:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=rhqSCeqnPG7sF8R08a0zZ/mAbZa/eVctOehDgdTJw/w=;
 b=RfS6pm5sFXTugoB+ps1lL1znZegqkMYi14jlIQZphtzPjMm1laO/ZYnQaoT2Y32mz+
 EtKN56C6ZOT6bI5JpRoiD/pYn+2oLLpueVWwG8xihbaEPlsYXRzMS5UKAYyi1ggzubUH
 Nh27RK3ex1Twh5Ssvxp+zUpV5L4784xwy5x/MAfxaUgbNZZ3g/Fs1kKpMEefSPfN3TW8
 96brYe1Ty2M9PvSb+7A1AzbcLGsfdZmcZw9HrIHgLCpbVPtbLEEPZUwRmw0iKVyE+lDm
 +EeRvEv6XY2jPMFWtCdl5oy1u/NNjtH4wgUYO5NocvbtLuHtjsBz4es3pExC/5H71ntM
 vnmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rhqSCeqnPG7sF8R08a0zZ/mAbZa/eVctOehDgdTJw/w=;
 b=NgrZnGnuTLw0xURiVD7huzGzkCRr4Lth0HYNv5RmOVYyAuNZD4gM2Es2eOAJrzPjM9
 1cP59LnndEyX2D9FAjDokwNj/Vg/KuDcfD8H72Fby2g5F2jILxnCFo2d/i9TMgrim11L
 arHO14wYnrzbUYj7r9x9XWpZbwZsGrN4s2iiuPPt2Xna6askn7L2AvtngRUNagsliJuy
 DKx16twooZoeC+w4o0UBQ9PhYjwhK1tiRNz/E5NPPbUv+75QRgcOSHFVmVbyqu4/hgXV
 haQKG9Nf+8dtFfgaAW+f8BVCIvDUAkCYBrWiwslpKy/tJ7nxD1aWqFBnp4xWaDPtM+3N
 +OKQ==
X-Gm-Message-State: AOAM532dl8O38wZx2kenjBB9zT3jIP2iVNKuw9MjA1YFVT5xuyT8MTpG
 PB+Jkwyith1zM/+xoVOUNiriDKs/Bgtfsw==
X-Google-Smtp-Source: ABdhPJxbt0zcTZQAijgU6ofhn5g33ZyKm57A3JabfEM+G/uHhZykJMpUMHTgeboSVLHJ/tOpUQKLRw==
X-Received: by 2002:a17:902:9887:b0:138:d3ca:c36d with SMTP id
 s7-20020a170902988700b00138d3cac36dmr5054080plp.15.1630304902659; 
 Sun, 29 Aug 2021 23:28:22 -0700 (PDT)
Received: from localhost.localdomain (174-21-72-39.tukw.qwest.net.
 [174.21.72.39])
 by smtp.gmail.com with ESMTPSA id o6sm13337072pjk.4.2021.08.29.23.28.22
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Aug 2021 23:28:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 46/48] tcg/optimize: Propagate sign info for setcond
Date: Sun, 29 Aug 2021 23:24:49 -0700
Message-Id: <20210830062451.639572-47-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210830062451.639572-1-richard.henderson@linaro.org>
References: <20210830062451.639572-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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

The result is either 0 or 1, which means that we have
a 2 bit signed result, and thus 62 bits of sign.
For clarity, use the smask_from_zmask function.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index cbb5700f44..788a5acf10 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -1681,6 +1681,7 @@ static bool fold_setcond(OptContext *ctx, TCGOp *op)
     }
 
     ctx->z_mask = 1;
+    ctx->s_mask = smask_from_zmask(1);
     return false;
 }
 
@@ -1753,6 +1754,7 @@ static bool fold_setcond2(OptContext *ctx, TCGOp *op)
     }
 
     ctx->z_mask = 1;
+    ctx->s_mask = smask_from_zmask(1);
     return false;
 
  do_setcond_const:
-- 
2.25.1


