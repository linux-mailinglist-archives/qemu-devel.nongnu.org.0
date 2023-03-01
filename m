Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0895F6A65F3
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 03:59:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXCea-0008If-2z; Tue, 28 Feb 2023 21:57:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXCeV-0008BO-Jh
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 21:57:11 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXCeK-00033e-4A
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 21:57:01 -0500
Received: by mail-pl1-x636.google.com with SMTP id u5so9162747plq.7
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 18:56:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yCnXoix2KCDp3dAlICLH/1Trzu0mg9DNGkDG5uPTS+4=;
 b=XWGoovEoB1Nnvj7lIj5rqTje6QNZd7+2r8RXZKpU3uPqlI2JDeTR2n5RVxJsRof0PV
 MHpWWoN9h4j4M6CA9Lh4jR5dWtS4/stHmjfqNW6Ck7K88Ct13u50Y8yl4ftP8lFUXfgj
 ogqWhmyjtbzlYfyZ++ZhYetGKahEq0MwVWrk4cTzErL8Ur6kfTVsBslPc/CTUcnwj3wT
 ucqHaUoxH17h+wDvYSM6LZ8BgGy4z7ehdA1SI1lp67tAdh6Izrld55th9b/HiA88AxLn
 89EcWvAyYVX9Vw2gTnjd5qW3xWQPty/D43BGq6ZQZ2sZA6Z6UgOCJHOM9APNFLYS3zSl
 YXEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yCnXoix2KCDp3dAlICLH/1Trzu0mg9DNGkDG5uPTS+4=;
 b=aUv0QoNx1/BMnfoOhOWq0hz3L+TBkKAA4gIu8iNKfDrKmDrtsxKkMKHF1xcmwkR6dG
 otdWqK1KP2RS0y7oIkcsQbJQ9GtX204frnysTtXRAmGyotj1R995sQnudTmjARo0qlTt
 PuAiXYdC9qjwFMmjXVJZExwZZ19pFXfKcjuasZP30ILHLcGGSv7ipF11ItnKr+UVAami
 5gsGF+1rdho/7C60yynQYbunqk39bJpFKPAskIyVjrndwNmVmIkomzhot20DBF0BKH2s
 oRDOWp6hiKqQZsEw+eLLhCV2fspX8CKe8gE3YpsF7mtPCoNMvCmzXvYn5WSOqPRl/elv
 djcw==
X-Gm-Message-State: AO0yUKW0DcYWRFpBoDFsdP6FRQY3BuNH4PJsEtYcazz2qP1I0fFV/O7j
 +DKbBcoxawvmxheicMV9Cq/FPo6kd6oLRAud7Dw=
X-Google-Smtp-Source: AK7set90TpqvQjKMIQ7du8CsRNOUkgqUtKl1Eo15BjKB7NBX7HHPqLmikEh57XcyOkECdOroZLHWeA==
X-Received: by 2002:a17:902:ea07:b0:19c:dc14:ea77 with SMTP id
 s7-20020a170902ea0700b0019cdc14ea77mr5569574plg.20.1677639418374; 
 Tue, 28 Feb 2023 18:56:58 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 jg15-20020a17090326cf00b0019adbef6a63sm7210120plb.235.2023.02.28.18.56.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 18:56:57 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Anton Johansson <anjo@rev.ng>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 07/62] target/arm: set `CF_PCREL` in `arm_cpu_realizefn`
Date: Tue, 28 Feb 2023 16:55:48 -1000
Message-Id: <20230301025643.1227244-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230301025643.1227244-1-richard.henderson@linaro.org>
References: <20230301025643.1227244-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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

From: Anton Johansson via <qemu-devel@nongnu.org>

Signed-off-by: Anton Johansson <anjo@rev.ng>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230227135202.9710-4-anjo@rev.ng>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 0b333a749f..b21d52cce7 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1557,6 +1557,11 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
     Error *local_err = NULL;
     bool no_aa32 = false;
 
+    /* Use pc-relative instructions in system-mode */
+#ifndef CONFIG_USER_ONLY
+    cs->tcg_cflags |= CF_PCREL;
+#endif
+
     /* If we needed to query the host kernel for the CPU features
      * then it's possible that might have failed in the initfn, but
      * this is the first point where we can report it.
-- 
2.34.1


