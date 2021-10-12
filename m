Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B776942A97C
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 18:34:15 +0200 (CEST)
Received: from localhost ([::1]:48032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maKjF-0000qE-QF
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 12:34:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maKXd-0006Lo-OK
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 12:22:13 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:39562)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maKXb-00045i-2c
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 12:22:13 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 ls18-20020a17090b351200b001a00250584aso2266572pjb.4
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 09:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=R6dlxti+/N1vnkKixu8IUh/Zl8M8i7vv7yb2sO8QtGA=;
 b=ssEMTlOy8+7MVSdBRIL5CfNkPE0aQSqbhT0F8022JXOOuIpwvr5KPYdV9MW8lGscKQ
 HoaF3iAtl9rVNh7it3/++nqnhH8i7+825Dp4F4dTsUqdZilz0AMrUUCNLVbmcZAoHuN2
 82m3RfL7uL4o0/6FEPAB5sJDYyZF5Ic4OTglCmU8fgILkTUs2V4diSgPmzbf9vzsUyM2
 CBQKsNqO7iEftTj23KcOH2EnJJ/xEU2QfSjtkcd1sBpd938LFxaxBdAB0DTnZv55NHX6
 7lsl25kVIjvXucRdIF3QWqjLl/d7d/inssB1QbZeT2iqkRt7+IMZmpwTKYr/pMKOFWug
 QJYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=R6dlxti+/N1vnkKixu8IUh/Zl8M8i7vv7yb2sO8QtGA=;
 b=PPDITuRDgIpyOz0Ncje6imZ7iP1gCjtBuEgQiksJmMnNfnmgO0ZQtE4Ps7cyNL8L9Q
 lff1ROnssfsQg6ZbCHhb7uEO+AeaAtMEipWS6Jm6nzO/XtQ248GUAd4TBus5uw+wy+Xw
 jJMVLvOenj28Ub8v3VY4fpqBt/DCao64QeUhep3KZ3COsmpCtKpZqMRfYlbeadKrzOYH
 VW3wQWemhavJ4J0oRidhj8th/+PSBXglcrngMOy9WiMTFcSVYkSBBazVLlhvCsf1WarN
 ICo97tgBVjK0vk74Uci1SYiHDVqui9BucPOPvFtXMoNEh1uHrfNK7sH0cj3OaeJLgC6H
 Tg4Q==
X-Gm-Message-State: AOAM5315LuOxleIh05/i4Ir27lu93MS+DYIWUrS0nj3WFD5Of4dUji1Z
 BYnuxLx8pp6fBwOJg2S9JHhVlpbJgr3LBA==
X-Google-Smtp-Source: ABdhPJxAUnDU9jQ4t1w4RT36dW1bO/RCBAOB+EQRogAkP52HqaLmLBXILcd6wtwpbtITrT4a897Z9g==
X-Received: by 2002:a17:902:c206:b0:13f:68f:675c with SMTP id
 6-20020a170902c20600b0013f068f675cmr30413322pll.8.1634055729708; 
 Tue, 12 Oct 2021 09:22:09 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id k190sm11525023pfd.211.2021.10.12.09.22.09
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 09:22:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 11/23] target/microblaze: Check CF_NO_GOTO_TB for DISAS_JUMP
Date: Tue, 12 Oct 2021 09:21:47 -0700
Message-Id: <20211012162159.471406-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211012162159.471406-1-richard.henderson@linaro.org>
References: <20211012162159.471406-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We were using singlestep_enabled as a proxy for whether
translator_use_goto_tb would always return false.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/microblaze/translate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/microblaze/translate.c b/target/microblaze/translate.c
index a14ffed784..7e465b629a 100644
--- a/target/microblaze/translate.c
+++ b/target/microblaze/translate.c
@@ -1779,7 +1779,7 @@ static void mb_tr_tb_stop(DisasContextBase *dcb, CPUState *cs)
         break;
 
     case DISAS_JUMP:
-        if (dc->jmp_dest != -1 && !cs->singlestep_enabled) {
+        if (dc->jmp_dest != -1 && !(tb_cflags(dc->base.tb) & CF_NO_GOTO_TB)) {
             /* Direct jump. */
             tcg_gen_discard_i32(cpu_btarget);
 
@@ -1804,7 +1804,7 @@ static void mb_tr_tb_stop(DisasContextBase *dcb, CPUState *cs)
             return;
         }
 
-        /* Indirect jump (or direct jump w/ singlestep) */
+        /* Indirect jump (or direct jump w/ goto_tb disabled) */
         tcg_gen_mov_i32(cpu_pc, cpu_btarget);
         tcg_gen_discard_i32(cpu_btarget);
 
-- 
2.25.1


