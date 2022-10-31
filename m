Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56AAA61404F
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 23:02:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opcqq-0005Sg-Qp; Mon, 31 Oct 2022 18:01:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1opcpx-00058i-U8
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 18:01:12 -0400
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1opcpu-00015T-En
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 18:00:53 -0400
Received: by mail-io1-xd30.google.com with SMTP id p141so10932355iod.6
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 15:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HkiTDoffwuSaTr7ke0a+7yV5MGBGA3Q19sPSnhU1cq4=;
 b=GXW5tYW3xjdpWahpZOpF0Y7SZo3/qPfBs/by5WS6sqJCrf0O9Aj/sMNFAxTI0JwZeG
 IAvq1UzINUdoJ6Gwdts63N/iovl08yuKyio9MlOA7WBzvDP2e+YVZgFvF83ty34kM60O
 9YoPW1sQnttVmV8wG295JRsAN9aE+x7vUTJmPn3+7eDHCd3MRfRKluZoOa+cXISSw+X9
 Fbqh4B2ldoNZSHsXdn2ceEiGSAdtQCuohHyKvlXYYgcDTkYjt6h5QHPNkbektEpUubSs
 Vv+2Yr3fKnk4zC7JSt0dLc2gpTBucRwd16CHWab829t0iicO0gEexCHONjinfAyRDxdj
 SbiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HkiTDoffwuSaTr7ke0a+7yV5MGBGA3Q19sPSnhU1cq4=;
 b=rHjVKD3VazCraeUCw+Ng4/uRpD/+Z4cyJqba0BlHcdFVYmwYjydxPOUP1qm72IGF9E
 yFOddsD7Gj6Rsq4dr7yA4PXioUTBTZnl2m9SB5YdRRpQId5u+AxIWMgsyboUe45FfSVr
 Wj5MkDFnrFuP/wR0Xc+fRPVw0gj0QcFPN52MOXePJcPpWGlnvABoeb/2t9Xvau1em1CT
 JTDe9dPFRknx6VpJNXhBcwXmihgqKcScb2I11JiH4R/9sUAianpz6RSMXapy4faresUi
 I+jSaPSbBxUYrag0rLWekwMontc4/xoModDaSLPmFSNIioi9ZdK1GYaR/+/ARVhwWoxW
 fjMQ==
X-Gm-Message-State: ACrzQf0ko1h5IqW73zP2+RjgWSNqoE+b5pODl7qs5I6/fJ5i/ayMpUPD
 lSRPcPqACd0TP7EJ/engNcPOw26c97PFEw==
X-Google-Smtp-Source: AMsMyM7rGJiOwGruZGgEG8OoL1Oqs8k6zEh2rqYiXv4o88EVdnfp7uBuLYWdb6kY4qI7hdO+gppxKw==
X-Received: by 2002:a05:6638:42c5:b0:375:620d:4306 with SMTP id
 bm5-20020a05663842c500b00375620d4306mr3188762jab.104.1667253648270; 
 Mon, 31 Oct 2022 15:00:48 -0700 (PDT)
Received: from stoup.. ([172.58.176.58]) by smtp.gmail.com with ESMTPSA id
 d6-20020a926806000000b002f9537986f3sm2916853ilc.24.2022.10.31.15.00.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 15:00:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@gmail.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL v2 07/13] target/openrisc: Always exit after mtspr npc
Date: Tue,  1 Nov 2022 09:00:18 +1100
Message-Id: <20221031220020.414768-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221031220020.414768-1-richard.henderson@linaro.org>
References: <20221031215723.414467-1-richard.henderson@linaro.org>
 <20221031220020.414768-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d30;
 envelope-from=richard.henderson@linaro.org; helo=mail-io1-xd30.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

We have called cpu_restore_state asserting will_exit.
Do not go back on that promise.  This affects icount.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
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


