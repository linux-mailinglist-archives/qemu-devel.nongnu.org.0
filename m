Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C94163FFF0
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Dec 2022 06:44:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0ymj-0002i4-MS; Fri, 02 Dec 2022 00:40:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p0ymh-0002gn-Ko
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 00:40:27 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p0ymg-0003OE-53
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 00:40:27 -0500
Received: by mail-pj1-x1032.google.com with SMTP id q15so2902484pja.0
 for <qemu-devel@nongnu.org>; Thu, 01 Dec 2022 21:40:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QWswFcinaEuRXjK9FO2hUoxnBE9DXO7IESrNWEad0GY=;
 b=J03wri9jRuKRKfEVb4e7LKL7asMWrpCQGr4wnvBo633fD+NAdPtq5YVy6+Zi5mYTBR
 FJ4LtDcDsxFIUIAW1y5DaM2mAEoadJpKO4ZhmnRNZSfXEGemz++AT5SOE3wz4QtcFHJW
 2AjHjdG4NK7MvzDCJvPyVgvCoRH4RSsu/1wx1HWUS/B+FXWPey0lSJYo2Wr23p7t4quQ
 bnM90YxFS+BMYSNM717Q7MI91vaJW36p8gy+rnzAU0mVzd5lITPK5xMkOX/0gXVQZyvj
 /qKrMClb+ZKZhPVrSndF+7RdfDoWbWQb97nCzWtX8JgE1lFOSAIN1WYC0wCiDE0oNiVI
 eFHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QWswFcinaEuRXjK9FO2hUoxnBE9DXO7IESrNWEad0GY=;
 b=ABv2F3bVdd7PK1DnxfEOayoF1T0W05rp9LyFT6vxI8cT2Nt8Q95MVw8f18VWHYPHRz
 N4Y0xThCZzVe1JtifDPIQ3jQQUVlRGZqEkPeCxGcPQA3lwD4TAHx7Hhf9/eHjnGkv5iC
 n7pav580SYJGUONkYdipKh1r2ecEt6n8nudbO/txfYXm21WEmgjcAaV+OWKuqKjjcKls
 ky/bWXEhshGL+2YjYh3hmoVIbOEfgdLcVDxJDkmybPD10O0HJzpwU/QqsmrKb5MZuQ/O
 AVIoqDfFIsxxT71miiy237RfV3C61eI4IJZgHATNOASGXvj7UmyU3s/4eaEfebuY0noG
 d3sQ==
X-Gm-Message-State: ANoB5pl0EE1SHGKYrLtSgugdlDwweXYPHX7OFjo5pIOhDmKNiLO1KGwb
 E91BCgFVHgcDrY9RrjfX8LuKCx5bznSta4Fe
X-Google-Smtp-Source: AA0mqf7kJTsCslwCbY+wVOm7JfQ5jcneA6FLTVn39QLu0NjzkliV4dvmVBHYaq/qMvOmMa0qcjPJAA==
X-Received: by 2002:a17:903:234b:b0:189:ab1a:65a0 with SMTP id
 c11-20020a170903234b00b00189ab1a65a0mr11118597plh.80.1669959623960; 
 Thu, 01 Dec 2022 21:40:23 -0800 (PST)
Received: from stoup.. ([2602:47:d48a:1201:e3cc:2e37:17d4:f1d5])
 by smtp.gmail.com with ESMTPSA id
 d12-20020a170903230c00b00186f0f59c85sm4637075plh.235.2022.12.01.21.40.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Dec 2022 21:40:23 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 24/34] accel/tcg/plugin: Avoid duplicate copy in copy_call
Date: Thu,  1 Dec 2022 21:39:48 -0800
Message-Id: <20221202053958.223890-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221202053958.223890-1-richard.henderson@linaro.org>
References: <20221202053958.223890-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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

We copied all of the arguments in copy_op_nocheck.
We only need to replace the one argument that we change.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/plugin-gen.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/accel/tcg/plugin-gen.c b/accel/tcg/plugin-gen.c
index 9e359c006a..77e6823d6b 100644
--- a/accel/tcg/plugin-gen.c
+++ b/accel/tcg/plugin-gen.c
@@ -397,9 +397,7 @@ static TCGOp *copy_call(TCGOp **begin_op, TCGOp *op, void *empty_func,
 
     func_idx = TCGOP_CALLO(op) + TCGOP_CALLI(op);
     *cb_idx = func_idx;
-
     op->args[func_idx] = (uintptr_t)func;
-    op->args[func_idx + 1] = old_op->args[func_idx + 1];
 
     return op;
 }
-- 
2.34.1


