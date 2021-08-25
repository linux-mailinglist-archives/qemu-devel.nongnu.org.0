Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE5413F75D1
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 15:23:06 +0200 (CEST)
Received: from localhost ([::1]:60450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIsrx-0001ph-JF
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 09:23:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mIsYw-0000MO-Ha
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 09:03:26 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:42663)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mIsYv-0002Zq-1i
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 09:03:26 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 k20-20020a05600c0b5400b002e87ad6956eso2869022wmr.1
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 06:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Q2GBJLLz4fX2cAnRDxHMbQVxUbqrTMTT7pmg3XAcYZM=;
 b=ijL5G5eoKqRB5PNVm56QPbFxIa8BUfe5JeELCOJEi5WJYOA4r0a1SmR1S8DbeuDmHr
 IdqIk5ANVCksMqeyOiGvXBglmPFljnPv/jq0lG2yQ6gRtLegc5iyPHQNisUGc2pVLa0M
 +V7bvva+2aZQ7U0vZxtQSRMg7N7VL2KumnKrcuNIB17o5B8Mhn6t2mDH2/ZaHKK72MTv
 Prso1urrjKIjudIZ50MoB1pmXQNyZhM9EFtQkcL381XCAqMflcSPN9dcOFD9I5mAil0S
 mrQS8Q6a4dgXWUfwC7MofT4GPv6OHyVGJNwZSb/9ioIr1u30I7LpETFU3sHSFqyNTQ9s
 rFvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Q2GBJLLz4fX2cAnRDxHMbQVxUbqrTMTT7pmg3XAcYZM=;
 b=Gr0kpsl1AzjztMXWWEeUnHz6oOK5+SMkB8/8TXggFhFLzSq1cemlGflSRfZ2CLXApD
 K3YDtSByJgm8rglq3OWE93Z2X0/AwhPr/IKOwAFxFOdO+kceNk4oPQkimi+DA1wsU9uk
 XeX3zTskI63cc05wXyBJSEmouiX3ETXzOdBFWnMdV4+WS7/4TDFquuPh0boJYhxKGuPu
 1GIHc9C8HOEfh01svFr1tT5witmxLh8qt6exbQotVG4afahxcm8uhldpBrioyDTCNmSE
 lpn24agGPbkMfCT/7mHJ7jcPF3qskx584Zll2bRKR8vydqVm1DAIYjde3Vpp1PQquTlo
 tmGw==
X-Gm-Message-State: AOAM5338F2mNZT2RQ3pkuKXjnKvYzYocJoV5rinDiYiu9tRqpmHqv7MG
 VdK8mF9i7tXycx8QB3enUOndZrthXis=
X-Google-Smtp-Source: ABdhPJwuZzNL5vhmxunT3XVOqMa+zxIl4nnjUGsoNaz7VfEcsIbPKM+DmZ3bbmZzYmiqWF5L8mvXtQ==
X-Received: by 2002:a1c:f606:: with SMTP id w6mr9434386wmc.42.1629896603404;
 Wed, 25 Aug 2021 06:03:23 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 c6sm5004545wrp.95.2021.08.25.06.03.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 06:03:22 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 15/28] target/mips: Remove duplicated check_cp1_enabled() calls
 in Loongson EXT
Date: Wed, 25 Aug 2021 15:01:58 +0200
Message-Id: <20210825130211.1542338-16-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210825130211.1542338-1-f4bug@amsat.org>
References: <20210825130211.1542338-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x335.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Huacai Chen <chenhuacai@loongson.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We already call check_cp1_enabled() earlier in the "pre-conditions"
checks for GSLWXC1 and GSLDXC1 in gen_loongson_lsdc2() prologue.
Remove the duplicated calls.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Huacai Chen <chenhuacai@loongson.cn>
Message-Id: <20210816001031.1720432-1-f4bug@amsat.org>
---
 target/mips/tcg/translate.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
index 30780deb96f..a58d50e40e2 100644
--- a/target/mips/tcg/translate.c
+++ b/target/mips/tcg/translate.c
@@ -4693,7 +4693,6 @@ static void gen_loongson_lsdc2(DisasContext *ctx, int rt,
         break;
 #endif
     case OPC_GSLWXC1:
-        check_cp1_enabled(ctx);
         gen_base_offset_addr(ctx, t0, rs, offset);
         if (rd) {
             gen_op_addr_add(ctx, t0, cpu_gpr[rd], t0);
@@ -4706,7 +4705,6 @@ static void gen_loongson_lsdc2(DisasContext *ctx, int rt,
         break;
 #if defined(TARGET_MIPS64)
     case OPC_GSLDXC1:
-        check_cp1_enabled(ctx);
         gen_base_offset_addr(ctx, t0, rs, offset);
         if (rd) {
             gen_op_addr_add(ctx, t0, cpu_gpr[rd], t0);
-- 
2.31.1


