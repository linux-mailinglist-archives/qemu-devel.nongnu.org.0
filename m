Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B32A36286D
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 21:14:01 +0200 (CEST)
Received: from localhost ([::1]:43344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXTui-0003Qn-JP
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 15:14:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXThm-0003qU-6A
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 15:00:38 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:41521)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXThU-0004NR-G9
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 15:00:37 -0400
Received: by mail-pg1-x52c.google.com with SMTP id f29so19813472pgm.8
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 12:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ltuTQwf3YJkQ09A/ilMOxMZEVgxXZ+bcwwZi4bHmuUg=;
 b=dnH5fpajtitNw3WFYD9LEBeUWDBw8hlrnvfVWArNxaQxStXftkCJLUzelaU2ufZziT
 t7VncRQ6Ps1wblUbqeaJnnw9oqkpCgJ3PeGqyYIo+IRp7C+xV0VMDjl0U49Arnogxl5f
 9Y+WcG7gdpVGMPJL0bhJ2P4x2VOQ/VApaJBh+HyuXQBK/GCuTjFGerUBYSfLC7WTelRF
 ofMXhwc9Eg/twkaF3l7eYF0bL8oUTTfKk4jP9P/8tb9DO1pmTPtYpRJTiqR8mze6asbR
 3QzeYi3Eg/4aiNyo2KEyQyyfJNkHt24YkFxPXxDbPANJuqpW+ymvf1j9ljAa95K5i2rm
 cPeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ltuTQwf3YJkQ09A/ilMOxMZEVgxXZ+bcwwZi4bHmuUg=;
 b=cuPJcEUM2lT5QWitclQN/yvhU5agCJ+Pz0YtUDOw2ZvP6HZKul95ay9L+1OkaDvgMf
 VgkXssqfAfFJw58xwFCoHFdq6Pgfq3sajckqfpROxwkeOH/b9m4gUxT0PlJfu/u5x4bo
 NI3OWRVVMhtseLsgwdG95qxYlanHVQ5wroBoJvOIsNx0Wntw6z6D+MiFtP9xFLyxp6qd
 CHG38vbCF/OcVxrg2hd7qMcSeSD7cd1xrFj/JYxb1zlag0eaTIYHPuCZDufZH8/N5AfC
 w5CPSEUAEgrTR9VEchbQuEeT/ES6xoNw9809aELPVhVI6K76zmm+bCWm6WlqWeZ+P9m0
 AGWw==
X-Gm-Message-State: AOAM533hfGe+QRlVvXYNXlvJ/wcqR9IxezsQH0m/Z9st86y89MIUfz5e
 kGZFBNmFhxQoU9R9JkujnVM232xVrVvKTA==
X-Google-Smtp-Source: ABdhPJxtpfEIFWqyPqgFne10PpUD/fX6DeniMftJP/u2RrUrjA1DInxSdYnbx6nBMQz2k5PIDOmZ4A==
X-Received: by 2002:aa7:989c:0:b029:253:a2c7:9b29 with SMTP id
 r28-20020aa7989c0000b0290253a2c79b29mr8994857pfl.39.1618599616406; 
 Fri, 16 Apr 2021 12:00:16 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id d7sm1988337pfv.197.2021.04.16.12.00.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 12:00:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 16/30] target/arm: Enforce alignment for LDM/STM
Date: Fri, 16 Apr 2021 11:59:45 -0700
Message-Id: <20210416185959.1520974-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416185959.1520974-1-richard.henderson@linaro.org>
References: <20210416185959.1520974-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 270b10f83a..1ddfce9dfe 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -7868,7 +7868,7 @@ static bool op_stm(DisasContext *s, arg_ldst_block *a, int min_n)
         } else {
             tmp = load_reg(s, i);
         }
-        gen_aa32_st32(s, tmp, addr, mem_idx);
+        gen_aa32_st_i32(s, tmp, addr, mem_idx, MO_UL | MO_ALIGN);
         tcg_temp_free_i32(tmp);
 
         /* No need to add after the last transfer.  */
@@ -7943,7 +7943,7 @@ static bool do_ldm(DisasContext *s, arg_ldst_block *a, int min_n)
         }
 
         tmp = tcg_temp_new_i32();
-        gen_aa32_ld32u(s, tmp, addr, mem_idx);
+        gen_aa32_ld_i32(s, tmp, addr, mem_idx, MO_UL | MO_ALIGN);
         if (user) {
             tmp2 = tcg_const_i32(i);
             gen_helper_set_user_reg(cpu_env, tmp2, tmp);
-- 
2.25.1


