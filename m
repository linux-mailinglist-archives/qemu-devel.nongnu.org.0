Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AA4E6F45AC
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 15:59:21 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptqW0-0001D6-Ur; Tue, 02 May 2023 09:58:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ptqVt-00019f-98
 for qemu-devel@nongnu.org; Tue, 02 May 2023 09:57:53 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ptqVr-0003UM-9H
 for qemu-devel@nongnu.org; Tue, 02 May 2023 09:57:53 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-3f19ab994ccso39610875e9.2
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 06:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683035870; x=1685627870;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=w5qDudjhJlVT0hk2wNePP4bjtHx1eZvXfot3fVid5DY=;
 b=YCAyMM6axiNlgNVfi9NwYT0gn/SVu9cJ6i0Ybep4ckDaCxHZDEnuKk1xa0gz9T+pIP
 VjoqL20I2DRMU38wWecmIQgy2XZjVI76TCQdm/61Oo4NteJt4K3LpvVO5UfIoODLPzVq
 EG21EQpuaQMzqdSoT46q48Ue8vICPVz5r1BA5jnmKHDTBjU50kYJpn6bmUy6Mr6+Tnbv
 0mom3UdkHkjIW/baT5+pMIqp3WtXKEtLxH6F6WIaBhlxuooFwUC+rJM1z0oqTSdn8Jz0
 srJL1IOXkQoXb68WxlUhRL8/5iU2miiuzKhwvtOeLXWyx7QSIHLn1mM947Yfa5h8XoPu
 PZbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683035870; x=1685627870;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=w5qDudjhJlVT0hk2wNePP4bjtHx1eZvXfot3fVid5DY=;
 b=CJJmZ8ZbcyMtQqyNMVVJtiuRa35lWtjVwBrQcuYZc7ubKf1FPIghiyGhInieyJeSjY
 N7lPbykzWrfFESCHwFSUiyYnljy7pQBehFIVWXAfFpo8CvDdYM3GCGfJQqjVMziZrhPs
 hk6UzVkPrn+BUiuJqd+bltB4UJRO/F3v8u80GUbklyGmWtZQq93V5mFmUgRLUBsosiya
 lCFUNz/ZkniHW2HMKakZiVvPFFL7BA2mvehHBo4CqManY7fP7ji3wUYydiWrGgB2DvgJ
 xM3jTKpDhQ1LwGCkzbqJKtdop9/MqZkHmnDH0+SFVw8S8o1Jkzg8Ot6l++jRKwf/8VlG
 SNYg==
X-Gm-Message-State: AC+VfDx4RMAFOCjugeY5NRwe5v16GGVmOVNf7AZTIggdoVXiPb0Q6GDH
 Tr/krWZYQj5CzJYawRUo5WEG+dQGLAm4wXQQmpJTpQ==
X-Google-Smtp-Source: ACHHUZ4105GksPEQmk0T6mlpdXMbqjTn933obadYaZ4S/40HneOaqTGE/sd/qudsOTxtsqK2hE0I4w==
X-Received: by 2002:a1c:7c18:0:b0:3f1:789d:ad32 with SMTP id
 x24-20020a1c7c18000000b003f1789dad32mr12586806wmc.11.1683035869953; 
 Tue, 02 May 2023 06:57:49 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:ad29:f02c:48a2:269c])
 by smtp.gmail.com with ESMTPSA id
 j32-20020a05600c1c2000b003f173987ec2sm39461140wms.22.2023.05.02.06.57.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 06:57:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: mrolnik@gmail.com, edgar.iglesias@gmail.com, tsimpson@quicinc.com,
 ale@rev.ng, anjo@rev.ng, laurent@vivier.eu, philmd@linaro.org,
 jiaxun.yang@flygoat.com, david@redhat.com, iii@linux.ibm.com,
 thuth@redhat.com, mark.cave-ayland@ilande.co.uk, atar4qemu@gmail.com,
 jcmvbkbc@gmail.com
Subject: [PATCH 8/9] target/xtensa: Finish conversion to tcg_gen_qemu_{ld,
 st}_*
Date: Tue,  2 May 2023 14:57:40 +0100
Message-Id: <20230502135741.1158035-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230502135741.1158035-1-richard.henderson@linaro.org>
References: <20230502135741.1158035-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Convert away from the old interface with the implicit
MemOp argument.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/xtensa/translate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/xtensa/translate.c b/target/xtensa/translate.c
index 0cf3075649..728aeebebf 100644
--- a/target/xtensa/translate.c
+++ b/target/xtensa/translate.c
@@ -1549,7 +1549,7 @@ static void translate_dcache(DisasContext *dc, const OpcodeArg arg[],
     TCGv_i32 res = tcg_temp_new_i32();
 
     tcg_gen_addi_i32(addr, arg[0].in, arg[1].imm);
-    tcg_gen_qemu_ld8u(res, addr, dc->cring);
+    tcg_gen_qemu_ld_i32(res, addr, dc->cring, MO_UB);
 }
 
 static void translate_depbits(DisasContext *dc, const OpcodeArg arg[],
@@ -1726,7 +1726,7 @@ static void translate_l32r(DisasContext *dc, const OpcodeArg arg[],
     } else {
         tmp = tcg_constant_i32(arg[1].imm);
     }
-    tcg_gen_qemu_ld32u(arg[0].out, tmp, dc->cring);
+    tcg_gen_qemu_ld_i32(arg[0].out, tmp, dc->cring, MO_TEUL);
 }
 
 static void translate_loop(DisasContext *dc, const OpcodeArg arg[],
-- 
2.34.1


