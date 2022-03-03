Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C497D4CB546
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 04:15:55 +0100 (CET)
Received: from localhost ([::1]:37886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPbwY-0001N0-TG
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 22:15:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPbsX-0006xA-38
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 22:11:46 -0500
Received: from [2607:f8b0:4864:20::630] (port=39660
 helo=mail-pl1-x630.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPbsU-0003Ws-76
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 22:11:44 -0500
Received: by mail-pl1-x630.google.com with SMTP id 9so3329879pll.6
 for <qemu-devel@nongnu.org>; Wed, 02 Mar 2022 19:11:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OuBdYD4t9EnJOkWc0Xx7hBPfmAgY4I+FMKGqYJBs4Ic=;
 b=IOOeYB/Og3Q6ijRzB6hBXgpmRnTs/yhzqi7JW9Le9Q1M1ygoZTMSVPsmhvM2coVLfw
 JBe9ZnnOhNVKgITqrsT0+RmE9UjHSUfu/M3tMqWwT3Y/UkHEt0JEjPCw7YW6ZLhsLgjR
 9X+KgEnoQ3J613zurpon8bd2vNLlU6gWS+8DRbZH5FjQAPHuiUM6Uvkaak4gP09B8x+t
 EiWtz6dWO9pH/PmMWH4EmcKC/BT6mZTQpjFzbmjF672C8Fi13CRw2a1Qw75uJw2laxxl
 aYOhenuHASAmlWhDAoeK0Lwa6cJfGIqhOwKlbUiwG7V+5cN/35BNjFKnEOjccjV3WjVi
 RFvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OuBdYD4t9EnJOkWc0Xx7hBPfmAgY4I+FMKGqYJBs4Ic=;
 b=B6Ha1UXBINiaPh0Z6B8AFEyIGqJcIKsdJTD5dn74aegrDdIHKqLiAL8c/fDJIlCPQ6
 9cRtXQ4cvOAjKogO3sVDqZDJIgG4dV/FKfyXHF57HDWQWR9J1mDcfIKYu/UCEaTGx9vX
 58ESfcxk8d/knLZJAQpfvCTGCYCqFKwxr/8ZScx8dh3E7criR8vH8iVzjoOkhslN3qKE
 7LNdMLA+vevwQi2pYceYlrRCPoj9IlgpmXuCRTN84pZ7EKW2IImeLJSFURyI6p67Rf7o
 DM9ctNoQ1+lM4xUhM2Qr4wCg1nFhN8Vayfn8ycWMIQvu3H1ovPPj9PhvQVWr14cSEDHy
 l9hg==
X-Gm-Message-State: AOAM530WNeiLZZhPesIv5R2P3a0vZ4Wyf3BjsiqvUQ1m/suUHSOR0mQn
 z3sokH4iJLLDOOqRteOW7WOKHxyXIWyRWA==
X-Google-Smtp-Source: ABdhPJyl2RekuWyG/DiPNkF9mvnzCJcIGR3nrU2RNOSjx0db84YEMPuAY1nC5h/t/pqhXer95s+Dgw==
X-Received: by 2002:a17:902:e5ce:b0:151:9c5a:3c87 with SMTP id
 u14-20020a170902e5ce00b001519c5a3c87mr4775233plf.59.1646277097519; 
 Wed, 02 Mar 2022 19:11:37 -0800 (PST)
Received: from localhost.localdomain
 (2603-800c-1201-c600-e819-4400-f268-c391.res6.spectrum.com.
 [2603:800c:1201:c600:e819:4400:f268:c391])
 by smtp.gmail.com with ESMTPSA id
 h7-20020a056a00170700b004e01663f59bsm605789pfc.117.2022.03.02.19.11.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Mar 2022 19:11:37 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/3] tcg/s390x: Fix INDEX_op_bitsel_vec vs VSEL
Date: Wed,  2 Mar 2022 17:11:31 -1000
Message-Id: <20220303031132.444233-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220303031132.444233-1-richard.henderson@linaro.org>
References: <20220303031132.444233-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::630
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The operands are output in the wrong order: the tcg selector
argument is first, whereas the s390x selector argument is last.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/s390x/tcg-target.c.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index 508f1bccc7..3b185b3c96 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -2868,7 +2868,7 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
         break;
 
     case INDEX_op_bitsel_vec:
-        tcg_out_insn(s, VRRe, VSEL, a0, a1, a2, args[3]);
+        tcg_out_insn(s, VRRe, VSEL, a0, a2, args[3], a1);
         break;
 
     case INDEX_op_cmp_vec:
-- 
2.25.1


