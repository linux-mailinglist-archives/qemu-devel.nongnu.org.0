Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F04F599372
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Aug 2022 05:28:55 +0200 (CEST)
Received: from localhost ([::1]:33644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOsgo-0007Kb-76
	for lists+qemu-devel@lfdr.de; Thu, 18 Aug 2022 23:28:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oOseV-0001me-DK
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 23:26:31 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:39437)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oOseP-0002kA-Od
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 23:26:31 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 s36-20020a17090a69a700b001faad0a7a34so6404140pjj.4
 for <qemu-devel@nongnu.org>; Thu, 18 Aug 2022 20:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=PnxOd469lmAdC/RQB8O6SvRIgXAOuOZ1V4tulDNdRcM=;
 b=f4ODB/4axXqQSCyfaLKzSQnK/aQ63wY+Msg1h/Ov496F+uawNOrgmAZmhi5DJXe1BF
 qLCH4Wt/qqqEaENstN6EOomVxiawBt4OBVzw/KiykYnEeEgSHT8y4Myw50UD3NBR6F2U
 kNvsMExGgKyMOuxeHC8V/ozBDdd715LOlci0iCsk4U5pANutUwTIM05U8bu7SyONgkh+
 t8DqQ3MGPxyCXMNOE8t8HksyPw8Hp31KENnp9MS+V382+ZvOgZJblwO3XY+LuRILpO8U
 SeVjF68FwJnLiLn4TCHBxBF8HVBRUfwB2cBga8nAlQIrn14ofT1FuZCBG8UrUA2vyM2S
 kQGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=PnxOd469lmAdC/RQB8O6SvRIgXAOuOZ1V4tulDNdRcM=;
 b=v4uYL7lCabBlgkWqG1bqN+OzU4qDaxUpfZJW1NavNP+d6U/2Lwpi8SDWKKjwIF7h9P
 wBLvjW7Huq0OxVaDr6gYPRRxEaKCYE6DzwK5fgiwn8zxgeVca/9fnjTgZVhHnUj8wY6M
 d0YuvQCyrabwevnwxaTdCcrs1TvTkfpW5TuYepccwzeafNAu3dhQmwSJ7nQauhSY/tsl
 YxEOXfUqY2PGYOs9/5NrdN+BJJld1FokGiBxLYMox09dth5x3Oezt/poUn/+0fKHOtvB
 Uxu/8AyEP8b1urhw70jRISPUv/EqfJ5+rJP397HD4+CNIfgCA4IzDOiSl0vBsgM/IcTm
 DNgA==
X-Gm-Message-State: ACgBeo0kaVXjKtvBGzFIABeswdR+QPSLo2/Uu8KhOPNBGIkKQ88wh0E4
 FaHH2o0cOqlUV5lmCr6WXitvIw1Nd1WCew==
X-Google-Smtp-Source: AA6agR5/+hqrvoMCBmGT34hggxbg6txNwPB3O1oMhDki/ZAREtGSqeEFkYU+FNrCdedyRddo3Nl+JA==
X-Received: by 2002:a17:90b:4b0d:b0:1fa:e712:dd53 with SMTP id
 lx13-20020a17090b4b0d00b001fae712dd53mr517008pjb.10.1660879584451; 
 Thu, 18 Aug 2022 20:26:24 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:bbf3:9914:aa9c:3b4e])
 by smtp.gmail.com with ESMTPSA id
 g184-20020a6252c1000000b00535d19c46d7sm2199904pfb.203.2022.08.18.20.26.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Aug 2022 20:26:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu, iii@linux.ibm.com, dramforever@live.com,
 alistair.francis@wdc.com, alex.bennee@linaro.org
Subject: [PATCH v6 07/21] accel/tcg: Introduce is_same_page()
Date: Thu, 18 Aug 2022 20:26:01 -0700
Message-Id: <20220819032615.884847-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220819032615.884847-1-richard.henderson@linaro.org>
References: <20220819032615.884847-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Ilya Leoshkevich <iii@linux.ibm.com>

Introduce a function that checks whether a given address is on the same
page as where disassembly started. Having it improves readability of
the following patches.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
Message-Id: <20220811095534.241224-3-iii@linux.ibm.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
[rth: Make the DisasContextBase parameter const.]
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/translator.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/include/exec/translator.h b/include/exec/translator.h
index 7db6845535..0d0bf3a31e 100644
--- a/include/exec/translator.h
+++ b/include/exec/translator.h
@@ -187,4 +187,14 @@ FOR_EACH_TRANSLATOR_LD(GEN_TRANSLATOR_LD)
 
 #undef GEN_TRANSLATOR_LD
 
+/*
+ * Return whether addr is on the same page as where disassembly started.
+ * Translators can use this to enforce the rule that only single-insn
+ * translation blocks are allowed to cross page boundaries.
+ */
+static inline bool is_same_page(const DisasContextBase *db, target_ulong addr)
+{
+    return ((addr ^ db->pc_first) & TARGET_PAGE_MASK) == 0;
+}
+
 #endif /* EXEC__TRANSLATOR_H */
-- 
2.34.1


