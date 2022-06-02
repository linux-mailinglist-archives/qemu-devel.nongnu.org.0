Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 688EE53B15D
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jun 2022 03:58:22 +0200 (CEST)
Received: from localhost ([::1]:57566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwa6P-0003oI-He
	for lists+qemu-devel@lfdr.de; Wed, 01 Jun 2022 21:58:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwZjM-0002j1-LU
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 21:34:32 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:37439)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwZjI-0005ID-QR
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 21:34:32 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 3-20020a17090a174300b001e426a02ac5so4797994pjm.2
 for <qemu-devel@nongnu.org>; Wed, 01 Jun 2022 18:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=37l0ckMoMVGJpBF2TcV75mrqlQxEuC7DjW9Iu6LSXsQ=;
 b=cv+sXEfF3W2Hx9oQlNLC7QdpICSYeu/+RbiT8O7yV6EaOAWQkJcdjJnpwDW99qmq3s
 Lt8By4O1T7vUOWUUBI7Uuc0E5ZuKJKaJtCypVQkHehJzoZhnn3oARM4d96m2hatQAzGA
 QVFV42xw4QwQaRDpsD0JhK8pA8GFTrNM3MLKuSoAnXQK7P5g0Exyy5HNz/0v9Gjlfj9m
 iZE/yEoMuFJUJmvL40mMZnViADDagMNncpqLWVAo7sIArJMQ49QRep6xl9CYZLBYEGGg
 ayDKL9MuMvngvuU/YMCHOPJRqdpNAGT41MaZ6JzbrKMnkcoUusEkeyov5XWJ8s+LRNJ6
 2jcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=37l0ckMoMVGJpBF2TcV75mrqlQxEuC7DjW9Iu6LSXsQ=;
 b=08+ExP3dD1sO2FpCkT9l0hCynAjijLq24keKxTMsuMFBi6SOH5Y0qhtFMTZcFwSYIj
 Hm9lBJDllrxd1AYWv5ZpRng0MNp1oTwDq1q5E/AOo9DEJczMn/UTjkYj/kr/PEPkKh6P
 kYeBxEN0UrsDlqUUKmVo/N2T+DFqFEkSrrxJkvYTDL6bUSxEjv7crGTFBSYVxmAmDgHh
 b40ifbgwNm3sH7G+M6G06Gx0xVNcA7k7aGJ5ZF39fHJhn/I1LCS8m5yvP9JW32IF/Umi
 aBCZAU1tMuMq0b+gbliLSzydBCcO2ihMQNmWdHIO2i8UJCtDJQn++hWP6kVUwAP9qZ5A
 519g==
X-Gm-Message-State: AOAM533mx/rd8ZHvhwLtEqABpsTIsymF6Y3n9WXL41SqE4CkVHAdC0QI
 NAldF7cg5C2e5br6gg1Q0BD9Vu5FhPTNAw==
X-Google-Smtp-Source: ABdhPJwmn5QQy81wESeYON1pkqhyKPdYwfISDTBiTXEF6a1p5b8F9wpBHVA4IO9UYmPaDMVVE2r76A==
X-Received: by 2002:a17:902:e5c9:b0:166:34ff:72a3 with SMTP id
 u9-20020a170902e5c900b0016634ff72a3mr2299539plf.80.1654133662318; 
 Wed, 01 Jun 2022 18:34:22 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:1eca:8ee3:9269:e00c])
 by smtp.gmail.com with ESMTPSA id
 l191-20020a6391c8000000b003fc5b1db26fsm1962875pge.52.2022.06.01.18.34.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jun 2022 18:34:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v6 15/17] linux-user/strace: Use is_error in print_syscall_err
Date: Wed,  1 Jun 2022 18:33:59 -0700
Message-Id: <20220602013401.303699-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220602013401.303699-1-richard.henderson@linaro.org>
References: <20220602013401.303699-1-richard.henderson@linaro.org>
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Errors are not all negative numbers: use is_error.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/strace.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux-user/strace.c b/linux-user/strace.c
index 9fa681dea9..7d882526da 100644
--- a/linux-user/strace.c
+++ b/linux-user/strace.c
@@ -689,7 +689,7 @@ print_syscall_err(abi_long ret)
     const char *errstr;
 
     qemu_log(" = ");
-    if (ret < 0) {
+    if (is_error(ret)) {
         errstr = target_strerror(-ret);
         if (errstr) {
             qemu_log("-1 errno=%d (%s)", (int)-ret, errstr);
-- 
2.34.1


