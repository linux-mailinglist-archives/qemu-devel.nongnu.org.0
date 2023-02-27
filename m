Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 276086A3AE2
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 06:52:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWWDt-0005Uz-TD; Mon, 27 Feb 2023 00:38:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWCh-00034a-JI
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 00:37:41 -0500
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWCf-0002gU-R2
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 00:37:39 -0500
Received: by mail-pf1-x430.google.com with SMTP id n5so2774193pfv.11
 for <qemu-devel@nongnu.org>; Sun, 26 Feb 2023 21:37:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T8JhNPBurv6UPBw5+T0ptsUEofBEBgdE2LEBxrO3wBY=;
 b=NWx21CppDsL2JMOvm4QkWSZWqvIOVJF8i+WdWr6ZobSiSWHSCp9zY13AjGhHUxyeCT
 nBMQapLUSlkVuzITSDSbdu0CRyR6UEwd+VwUlnW3VXgu0Tnf3zCb67PlXEdUAaMUIgm+
 B1gBz5vfjTezfbgI4vcsmHLTpO6N4d7rVWN0Z1tf4QmmyQhLFyYXB1tlgabQmh2ph79d
 PmuOH+M/olKr3c1vTQ/JyYCKxvSi7tbRZonYJJ7j1GD6usHSJqsOTIv0X85udnY7hv9+
 QA0VdK05I6us8BWtN0fsiaDGjBTKDmW2Qo8LoD3tUn16/6dEGV/rbvyuN+4wUqkQtcJQ
 ybug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=T8JhNPBurv6UPBw5+T0ptsUEofBEBgdE2LEBxrO3wBY=;
 b=SxC99QxZIZ1zqNkC6m4O2ldeno8WQkrjBlqcN6jvL8VoVYRebqEl+SBk6wq05AvJ3V
 WuQ4bO2P5ZqNPxwKsqO6KHYP6TZ9Jdjy/jW58hxDMVGMSdjLVc0HAy/po8t7P0IJtKR4
 N4uATHjSGNFp5ifT1I30JwW/z3uGNxt3luInzMZkyPbQcXSEkd9t3eTiGDMKesUNthe4
 rueb+mk5CdBkPgysCL4K5mfuYiXA+lD00wb/tdJhrCVHpVvEWz7eVZRGwCcYp0tbdwlF
 8YCCQnd166BMQR3bga/K1O/RwOsIdkMtRTry/Y5TYoYQGJcYqEJAhq9NmKTIhUe34eft
 oteA==
X-Gm-Message-State: AO0yUKUiyi7kFnMMjDPP6PUYhBK3dyhcuiXbPKlHtQQnSfEQyPq1ceQm
 NI+K4gtztaee73Fvn2mGRjOkd8wt6TFN3TrIaxw=
X-Google-Smtp-Source: AK7set+fsSUfr0oS2RRsd0O29Ial7f7lJU9cZTbHE4JQ4Whu+mdhrzODZ31JUM8Fm2l2PX6+QJDnew==
X-Received: by 2002:aa7:9a0e:0:b0:5ef:b4e1:db0e with SMTP id
 w14-20020aa79a0e000000b005efb4e1db0emr4251081pfj.16.1677476256629; 
 Sun, 26 Feb 2023 21:37:36 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 k12-20020aa792cc000000b005a7c892b435sm3342137pfa.25.2023.02.26.21.37.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:37:36 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v4 11/31] tcg: Add tcg_gen_movi_ptr
Date: Sun, 26 Feb 2023 19:36:41 -1000
Message-Id: <20230227053701.368744-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227053701.368744-1-richard.henderson@linaro.org>
References: <20230227053701.368744-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg-op.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/tcg/tcg-op.h b/include/tcg/tcg-op.h
index 839d91c0c7..66b1461caa 100644
--- a/include/tcg/tcg-op.h
+++ b/include/tcg/tcg-op.h
@@ -1285,6 +1285,11 @@ static inline void tcg_gen_mov_ptr(TCGv_ptr d, TCGv_ptr s)
     glue(tcg_gen_mov_,PTR)((NAT)d, (NAT)s);
 }
 
+static inline void tcg_gen_movi_ptr(TCGv_ptr d, intptr_t s)
+{
+    glue(tcg_gen_movi_,PTR)((NAT)d, s);
+}
+
 static inline void tcg_gen_brcondi_ptr(TCGCond cond, TCGv_ptr a,
                                        intptr_t b, TCGLabel *label)
 {
-- 
2.34.1


