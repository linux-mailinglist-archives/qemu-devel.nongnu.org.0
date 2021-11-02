Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52086442C3C
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 12:10:46 +0100 (CET)
Received: from localhost ([::1]:50050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhrgj-00070R-FJ
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 07:10:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhrW3-0007RL-5Y
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 06:59:43 -0400
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f]:36501)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhrW1-0006ra-Pq
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 06:59:42 -0400
Received: by mail-qk1-x72f.google.com with SMTP id i9so18667574qki.3
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 03:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5cdNvFSJ5wR7JnuiQcjHWFGJQar8vceYVcWEUN+hvfs=;
 b=R0N4J02AVwpi3erHg6YVQNU7idMdJURf9oPGwOVBoRYJkR7ib0fRaMv3Jxm/S3btl2
 08J2ck3z39XEG9IedTqo11liSEbYNfAM5gGuQvbf0NiH42LVXlBOGt5wWESzOGAbD9KC
 ZlboyfRnueLfqQz7JWYb9CUllw09lHr5N15jR2gEvvQcKkYZiNeIlWfiNmYZrBeKRPSB
 wTmXrF2XkJt0WqsGgAZOgoNf6mwoLGMqYP7PWUW3Jn97w4FV5lzxCLcOy0fPfFGL//9t
 is1muJFCq7osFjoKB7xIT8MVb5SvktQ/R/HXhmUFy3PEw7LySBE2DUH+JKTRvk/WA8lP
 zN1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5cdNvFSJ5wR7JnuiQcjHWFGJQar8vceYVcWEUN+hvfs=;
 b=ctegOxrQcDhmoAfwJnY/rUkwYEruxh+HoYWOu8yvmHJxyRkdynbih2falxU7tZhoc6
 yD0p7rqnrSIvgkFWOzoLrtTO+VCn2lWQIHCbiA4vn8/emp7BTGPY9BrVtlYKf8eppFsB
 nxxlAPHbebRPBX2jVHiEs5AsoVLp60fh6JHfdla2ANdTkqafWHaLTtBauN6vK91BTXti
 Pr6XxYhSmjhvsnm3lKHpgz5BKWTYnnjSgGSbmH1qEvs9kLFc1ejJDtPiUw7WXYuWVkcK
 CMbYNt7FzP0trLJvrfs4w0KWLF8PPAqlRB+3zHOqux/uKgQri0tFqaYEXfEJ0ZHcZrul
 ogDA==
X-Gm-Message-State: AOAM533BIfZesg2q6qtMWeMud5cG3646Frs9XFTrfkGLMYF8Jy/1brwH
 6PdSGG7VVQtx2L2559SAmhZAzUxwbhI0Hg==
X-Google-Smtp-Source: ABdhPJyJTWqX0tkg7zoFxjsYPfDj0cOEoLlkWmmchGwE2oUu7ljM4DMh++641Af3+TLrMYYQjLBe9w==
X-Received: by 2002:a05:620a:318e:: with SMTP id
 bi14mr17284924qkb.439.1635850780883; 
 Tue, 02 Nov 2021 03:59:40 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id z26sm11789510qko.13.2021.11.02.03.59.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 03:59:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 07/12] target/arm: Use tcg_constant_i32() in op_smlad()
Date: Tue,  2 Nov 2021 06:59:29 -0400
Message-Id: <20211102105934.214596-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211102105934.214596-1-richard.henderson@linaro.org>
References: <20211102105934.214596-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72f;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72f.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Avoid using a TCG temporary for a read-only constant.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20211029231834.2476117-2-f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index d6af5b1b03..083a6d6ed7 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -7849,10 +7849,9 @@ static bool op_smlad(DisasContext *s, arg_rrrr *a, bool m_swap, bool sub)
         t3 = tcg_temp_new_i32();
         tcg_gen_sari_i32(t3, t1, 31);
         qf = load_cpu_field(QF);
-        one = tcg_const_i32(1);
+        one = tcg_constant_i32(1);
         tcg_gen_movcond_i32(TCG_COND_NE, qf, t2, t3, one, qf);
         store_cpu_field(qf, QF);
-        tcg_temp_free_i32(one);
         tcg_temp_free_i32(t3);
         tcg_temp_free_i32(t2);
     }
-- 
2.25.1


