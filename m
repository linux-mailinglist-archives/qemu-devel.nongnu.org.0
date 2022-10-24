Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C18A760ACCA
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 16:15:42 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omxTJ-0003cv-1y; Mon, 24 Oct 2022 09:26:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1omxTA-0003W8-7S
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 09:26:21 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1omxT8-0004B9-A9
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 09:26:20 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 v4-20020a17090a088400b00212cb0ed97eso8848051pjc.5
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 06:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=27tU7q4skqyWhNaj53PDReLhseNs0R74OdN+/vV4qx0=;
 b=UDesVsJh2VpOjVc027a6U5SDvYLB80WN9z52DdwNRDfq77l9NrTUepEQ7gjN5ZXj33
 +NKphz+USTl4lNRIBL2i0zwStz/OedNLgegUFE1BHtkJvr2qK8a4Dtw8RF7iGe0bGI9M
 3HeSPf5JAGIumRTEBEAEahxtoHKtkqoz4r9JEQQ1bYkqdWAimeqp0SBtHDpth/aQSnH7
 iB2caxBO0NyKnhA81bpvKqsoPg3xIbecJHp3dtoKIstdyURC6f2jqOZuCHxpml+3zNsS
 X9gR3fTFPrnWXUodLqt8gOSrEtSBv3pAwrXw4aKmcVrn1Bc2agdjNFIOBdSoBSldjQD8
 GjgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=27tU7q4skqyWhNaj53PDReLhseNs0R74OdN+/vV4qx0=;
 b=lhYkrMMw7lCXthU4nnyPDfDbqjgzrNLSWQekoZfG4xOpEEWY0KzsmP/57Zm4HbX3vF
 EVKk0f/MiYcRHCcyFua4Mxn9n9M9GYne70zpVsPC8pt9ceYwpuurTJdUHvDKY1iRnBOV
 kcPZ/7fFGwmUHkhAGmVVVPaR9CLfYGoElYycCnHvutIt7BRVz+LWCyN2E/2PUxcj8Na/
 U+9rRmqWIp5tGpgoWnzLVFL87/WMa0wN6Lu2eiqpToBmPqApLeVs1V5FznZK2Gjk4ROc
 F0R9UCWli28AV/y2LSuk8I0GeZOr3BdRMHblaBKIYbIEpnjFGt5zkYsSXg/JrcKyXhkz
 Xa3A==
X-Gm-Message-State: ACrzQf1n86aqu43pGUvhPOfUECFLo7v4pwoiIKlipDwogiZ5QUK4RNlX
 fLlsYo9pzXtGhSvV/RtjMtGofjIJrC5ebQ==
X-Google-Smtp-Source: AMsMyM4Rz+aeg+Wc7hYo9y9zjX2Ombziam7y2M0KAgo9rXP5g7lgUndkIhTq6Yv1u4HibVKhRkJaEg==
X-Received: by 2002:a17:902:6a81:b0:186:7df2:340 with SMTP id
 n1-20020a1709026a8100b001867df20340mr16521310plk.120.1666617974245; 
 Mon, 24 Oct 2022 06:26:14 -0700 (PDT)
Received: from stoup.. ([103.100.225.182]) by smtp.gmail.com with ESMTPSA id
 b12-20020a1709027e0c00b00178ab008364sm17009216plm.37.2022.10.24.06.26.12
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Oct 2022 06:26:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 26/29] target/openrisc: Always exit after mtspr npc
Date: Mon, 24 Oct 2022 23:24:56 +1000
Message-Id: <20221024132459.3229709-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221024132459.3229709-1-richard.henderson@linaro.org>
References: <20221024132459.3229709-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

We have called cpu_restore_state asserting will_exit.
Do not go back on that promise.  This affects icount.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/openrisc/sys_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/openrisc/sys_helper.c b/target/openrisc/sys_helper.c
index 09b3c97d7c..a3508e421d 100644
--- a/target/openrisc/sys_helper.c
+++ b/target/openrisc/sys_helper.c
@@ -51,8 +51,8 @@ void HELPER(mtspr)(CPUOpenRISCState *env, target_ulong spr, target_ulong rb)
         if (env->pc != rb) {
             env->pc = rb;
             env->dflag = 0;
-            cpu_loop_exit(cs);
         }
+        cpu_loop_exit(cs);
         break;
 
     case TO_SPR(0, 17): /* SR */
-- 
2.34.1


