Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C39660CD9
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Jan 2023 08:54:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pE3zV-0003lI-Ro; Sat, 07 Jan 2023 02:51:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pE3zN-0003hV-5o
 for qemu-devel@nongnu.org; Sat, 07 Jan 2023 02:51:38 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pE3zL-0004BL-KL
 for qemu-devel@nongnu.org; Sat, 07 Jan 2023 02:51:36 -0500
Received: by mail-pl1-x62b.google.com with SMTP id d15so4073487pls.6
 for <qemu-devel@nongnu.org>; Fri, 06 Jan 2023 23:51:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vYDctBbnnuLG1K5+4Hilhpo5uGZu1d13BYQ5kC+g9z4=;
 b=EVfR4sqQkR2pnJJ+wqR1wjPJRtVLPKA9B9zCvjePqzJ33LIKEaaFWc4Euwp4audB+w
 M0WYWmTzpjZf1JbkAg1ov9t7Y0TjgapuJ0SqAL9dmsInQ0lMx1iIivM44Qi/OMJqicRc
 wJd8TpPP2+rlTZY4LpbkmX96i9AVF0W/N6w2HBJFWQgq69CMj8JrXYYJnsSK4Xw/FXuc
 xgAHUBXrefgoQafrH7ep0wwGJx6pOi8oS+Ou08ZyvrNKRx7Bh9/BEYJHjJYpNDGlzGhE
 lg+JyM9NsQwGFRaP8xqqPyhYTOYQuAKJGD1vam06Z40Mlk7kD7bhj62ZYyOogxrsIPRB
 /fDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vYDctBbnnuLG1K5+4Hilhpo5uGZu1d13BYQ5kC+g9z4=;
 b=RwV2/C9AxdKZ1zHDVFxeO4G2UGr8JEPiPPTbaeUU0hQMLpt2qtHKBbRmoPa7+lTpkO
 lgtUD0NXqAGZPaTloC9TZFheGrbaKSai3TU5Fe9kIKLT/7CHbBwWRIpoT97BkHatkt+g
 Bg9MWX240M69h4SrZXaifqNpVnv5FsqHQIWWqNqsSzYgf0Jz65KyvJpfXvh5Gbxv2ube
 /CBYpG5eif3yhskATMdK1FMxt4Boioigl0hopF0VW5RZ7uBaAMwPPaYjrSNcHcEx7S9g
 Sdr5rieoKNTUWubvQvZCVQWF9HmduppTyBk3HScSl9JUQl0NkSwhpLG89ddvTgYRark0
 q1WQ==
X-Gm-Message-State: AFqh2kqDtdO6bL/8/mb97/ChnEYl/ydG3BjjkJmkIwNf18nsmcXAQVJ2
 GxB25mK/w0pixGNiVdMzQ17DnUD5A6M11eeW
X-Google-Smtp-Source: AMrXdXtBuhIWupsO6mvUAbUyQJK4deQckr3AT3I7f9jFeJG4URrIbp+YmS353h4hX8NH7ZpIWfenlA==
X-Received: by 2002:a17:90a:5b05:b0:225:d190:f16c with SMTP id
 o5-20020a17090a5b0500b00225d190f16cmr48564007pji.21.1673077894842; 
 Fri, 06 Jan 2023 23:51:34 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:9d81:5b04:51d7:acae])
 by smtp.gmail.com with ESMTPSA id
 bj5-20020a17090b088500b00212e5068e17sm1945119pjb.40.2023.01.06.23.51.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Jan 2023 23:51:34 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PULL 16/27] tcg/s390x: Issue XILF directly for xor_i32
Date: Fri,  6 Jan 2023 23:51:07 -0800
Message-Id: <20230107075118.1814503-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230107075118.1814503-1-richard.henderson@linaro.org>
References: <20230107075118.1814503-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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

There is only one instruction that is applicable
to a 32-bit immediate xor.

Reviewed-by: Ilya Leoshkevich <iii@linux.ibm.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/s390x/tcg-target.c.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index 871fcb7683..fc304327fc 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -2005,7 +2005,7 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
         a0 = args[0], a1 = args[1], a2 = (uint32_t)args[2];
         if (const_args[2]) {
             tcg_out_mov(s, TCG_TYPE_I32, a0, a1);
-            tgen_xori(s, TCG_TYPE_I32, a0, a2);
+            tcg_out_insn(s, RIL, XILF, a0, a2);
         } else if (a0 == a1) {
             tcg_out_insn(s, RR, XR, args[0], args[2]);
         } else {
-- 
2.34.1


