Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F14B13B098A
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 17:51:07 +0200 (CEST)
Received: from localhost ([::1]:45298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvig7-0007oD-0K
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 11:51:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lvidY-000519-87
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 11:48:28 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:33776)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lvidU-0005HJ-1J
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 11:48:27 -0400
Received: by mail-pl1-x629.google.com with SMTP id f10so8521734plg.0
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 08:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bfer+b/IySj5HnA20PczAstzpnS9sh6sXij+B/wRGag=;
 b=WtdLRP5b0itUxQz1LfgbtZ1VCrnIHP/llfPOENkjayYzcVYj0dmc/If6fwGvHmRyxu
 koEHb72d2NXhKf1sk2gIgl26oIdr9Y3c07p/KuGfhp+Ll+yyqn5Zb5s27ugp2caF0La2
 IACQdj49uLQn6HLO7dlEWlt5YrGEX2Ta5/ZMgShjd14cC8+TSyxE3kfGIS6qdZZJdEhC
 8TEIWOLEBJyz1Ert6r8kHfY30y8oGapweA2juHd2KfGxqJlDh++p2kg+SzmI6XoP2nLp
 Wh7tCfYEWK9GZSAqAdbJevMosVbH09DIpJY24SaADhcMoF52XARnFClheK26QnksiKAX
 dGng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bfer+b/IySj5HnA20PczAstzpnS9sh6sXij+B/wRGag=;
 b=uauXLiOSXABvDxvPO1RoWeV84mSbNNXWg0cMBGyQTdzTKYQ416oFVyZSFz3gBEXsKx
 vebYFoQwX8X6ehRvJsEzY7/WoKUiSWvr0lFbAq5MCrTUTKnnt6w1kvq/wE5yPcZ9dUR8
 wajCQEj7nalUDFuEi1VNulK5K8QHKmgwse1T3vVCAY6EvXCcONxwA1z9tZqWvhhMxNT9
 bcvk569FwrKIzGVtn/HjAwGu9pGQ5F1PArf/bHqIwBHKzT7E9O3Sl/KSxylxlSjeNTR9
 WaeIV10cpAaY3M7unmgf7OE0t+XFyayk8TwYfhRoT1LEqr/U7LKJYrCI7w51ACKLpZND
 Dw1A==
X-Gm-Message-State: AOAM531PVaSY2i3PXKB2pMUhsTs/jGWkd9a+XKTnKG6SYh8HBD8FUarA
 FeGt/f7Iu3PFA/1o06/hQM/HE0v9znez8Q==
X-Google-Smtp-Source: ABdhPJwd3SwK4a7Wd7Jo0aWBly6/a1tgq9IDksrDlXhsf5BG0CW5G4gY1Lk/gk1LxqcK8eApR3vh+A==
X-Received: by 2002:a17:903:31c3:b029:ed:6f74:49c7 with SMTP id
 v3-20020a17090331c3b02900ed6f7449c7mr22813663ple.12.1624376901876; 
 Tue, 22 Jun 2021 08:48:21 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id x13sm2898769pjh.30.2021.06.22.08.48.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jun 2021 08:48:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 00/15] target/cris: Convert to TranslatorOps
Date: Tue, 22 Jun 2021 08:48:05 -0700
Message-Id: <20210622154820.1978982-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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
Cc: edgar.iglesias@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Changes for v3:
  * Fix delayed branch changes vs cpustate_changed.
  * Tidy some X_FLAG handling.

Changes for v2:
  * Fix (drop) singlestep check for max_insns.
    We already do that generically.
  * Move delay branch handling to tb_stop.
  * Improve tcg_gen_lookup_and_goto_ptr patch.
  * Patch 8, Use movcond for t_gen_cc_jmp, now
    folded into single caller, for JMP_INDIRECT.


r~


Richard Henderson (15):
  target/cris: Add DisasContextBase to DisasContext
  target/cris: Remove DISAS_SWI
  target/cris: Replace DISAS_TB_JUMP with DISAS_NORETURN
  target/cris: Mark exceptions as DISAS_NORETURN
  target/cris: Fix use_goto_tb
  target/cris: Convert to TranslatorOps
  target/cris: Mark helper_raise_exception noreturn
  target/cris: Mark static arrays const
  target/cris: Fold unhandled X_FLAG changes into cpustate_changed
  target/cris: Add DISAS_UPDATE_NEXT
  target/cris: Add DISAS_DBRANCH
  target/cris: Use tcg_gen_lookup_and_goto_ptr
  target/cris: Improve JMP_INDIRECT
  target/cris: Remove dc->flagx_known
  target/cris: Do not exit tb for X_FLAG changes

 target/cris/helper.h            |   2 +-
 target/cris/translate.c         | 513 ++++++++++++++++----------------
 target/cris/translate_v10.c.inc |  17 +-
 3 files changed, 262 insertions(+), 270 deletions(-)

-- 
2.25.1


