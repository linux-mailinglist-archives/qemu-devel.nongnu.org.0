Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 939696969B7
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 17:34:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRyD5-0006i5-43; Tue, 14 Feb 2023 11:31:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pRyCu-0006St-CM
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 11:31:04 -0500
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pRyCs-00028X-KX
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 11:31:03 -0500
Received: by mail-pf1-x435.google.com with SMTP id bd35so5539783pfb.6
 for <qemu-devel@nongnu.org>; Tue, 14 Feb 2023 08:31:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xtIpJs6CDJTguU2qwCAmHY7gW26H1KWvwqoyvB56KYY=;
 b=evHAF1AidzM+LkqXq+fgXah0HUl9BGOPSXyS+rOef2t9j7l6bnUdAUsM2JMuV+Q3Lb
 b+nX5d4GZsdK6iqeCrGVHyiyAyQyzkbp6ElJ/qA0aOj3nsR1T0XHys6RFgzyeDpz9fPa
 Vu7DgZ3em6bvS6qZW8hlATL052OGwrdKUaH4W9HLjXcIXNfp1WGjiGI98dnA5yarShxt
 R12Edr7GAqE9akcsvWnydvvCTdBEwYsGiWU+HVd4nXR7sF+CEUCHnnPoBZNl0+58ztJu
 mBMHUPgF4xcg8JrGW8K1SfgNXym3XGrdaHUDxOaEPlz/tihU+it4XxEXCBzpZzjHVcJo
 zlWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xtIpJs6CDJTguU2qwCAmHY7gW26H1KWvwqoyvB56KYY=;
 b=4o9Y3qiZe6FMCon6iuDeYpljD5bhj8zGNYbn0LfVr9HDwi+fe2Xv4usJsd1tgpxzZ3
 yGcBeMapZBetk9MtfQ1A5z6b3+71o8cMUS77swCRayYKO7RngSolUS4Lyh4LK9sb8Xoz
 nL9XVq1j42dmwFdyHqTZKZ7yAD4fJsBUllbDOUo6koBne/zQKOunfliz9ciLa40V5ylK
 Z+v8jurII1rYQKCeapaqYteXl9SCT0eHwSU/APAO+BsqLsl/iLALpcuZttdzHhUrKeD8
 LGlQFrNCK6auHHognZX5ZOMPsI+GZjDqzLNXssfEWlFeQEfdviU5xfoSuZe7hoSi5/Jp
 nsgA==
X-Gm-Message-State: AO0yUKV/CuIuugHsazwPgtyF89QgiAsLr4bI8Dn8SeQg7bSvxP3+Vhy2
 B5Wem71Jp+nlIYlIkIKsEDJ28BCHcCha+Pg6Rt0=
X-Google-Smtp-Source: AK7set9c4CBKsIkJ4CJ4NkLvpRdQ47BNv7ek7frs8zMVsW9jwobOFEhgGlXo6fAlQtdW8zwOcu68rw==
X-Received: by 2002:aa7:9591:0:b0:5a8:4ba7:5840 with SMTP id
 z17-20020aa79591000000b005a84ba75840mr2702300pfj.26.1676392260741; 
 Tue, 14 Feb 2023 08:31:00 -0800 (PST)
Received: from stoup.. (rrcs-74-87-59-234.west.biz.rr.com. [74.87.59.234])
 by smtp.gmail.com with ESMTPSA id
 d17-20020aa78691000000b0058d99337381sm10337011pfo.172.2023.02.14.08.30.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Feb 2023 08:31:00 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 06/14] target/arm: Hoist pred_width in
 arm_gen_dynamic_svereg_xml
Date: Tue, 14 Feb 2023 06:30:40 -1000
Message-Id: <20230214163048.903964-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230214163048.903964-1-richard.henderson@linaro.org>
References: <20230214163048.903964-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/gdbstub64.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/target/arm/gdbstub64.c b/target/arm/gdbstub64.c
index 8d174ff6e0..02a0256c5c 100644
--- a/target/arm/gdbstub64.c
+++ b/target/arm/gdbstub64.c
@@ -283,6 +283,7 @@ int arm_gen_dynamic_svereg_xml(CPUState *cs, int orig_base_reg)
     GString *s = g_string_new(NULL);
     DynamicGDBXMLInfo *info = &cpu->dyn_svereg_xml;
     int reg_width = cpu->sve_max_vq * 128;
+    int pred_width = cpu->sve_max_vq * 16;
     int base_reg = orig_base_reg;
     int i;
 
@@ -319,14 +320,14 @@ int arm_gen_dynamic_svereg_xml(CPUState *cs, int orig_base_reg)
         g_string_append_printf(s,
                                "<reg name=\"p%d\" bitsize=\"%d\""
                                " regnum=\"%d\" type=\"svep\"/>",
-                               i, cpu->sve_max_vq * 16, base_reg++);
+                               i, pred_width, base_reg++);
         info->num++;
     }
     g_string_append_printf(s,
                            "<reg name=\"ffr\" bitsize=\"%d\""
                            " regnum=\"%d\" group=\"vector\""
                            " type=\"svep\"/>",
-                           cpu->sve_max_vq * 16, base_reg++);
+                           pred_width, base_reg++);
 
     /* Define the vector length pseudo-register. */
     g_string_append_printf(s,
-- 
2.34.1


