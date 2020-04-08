Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4666B1A2535
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Apr 2020 17:32:55 +0200 (CEST)
Received: from localhost ([::1]:37586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jMChC-0006tU-Bf
	for lists+qemu-devel@lfdr.de; Wed, 08 Apr 2020 11:32:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33433)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jMCfQ-0005rd-Is
 for qemu-devel@nongnu.org; Wed, 08 Apr 2020 11:31:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jMCfP-0008B7-L5
 for qemu-devel@nongnu.org; Wed, 08 Apr 2020 11:31:04 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:43849)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jMCfP-0008Ad-EV
 for qemu-devel@nongnu.org; Wed, 08 Apr 2020 11:31:03 -0400
Received: by mail-pg1-x535.google.com with SMTP id s4so3452912pgk.10
 for <qemu-devel@nongnu.org>; Wed, 08 Apr 2020 08:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Wy9/RKdx6k2GdGX7vFs6xPvmsh5JxfYLsYClmHq661o=;
 b=zvY/AQ4WyidrWkmVrcdxUCoLxJ+t6LzZ4qfdxTkzlxAx0wWmrWCJggz6Gd00Jt5vRt
 q7m9qpNZ6du7MTGtk9a5/xoVc63Cwcjnh2TLORassd/xxRJx29OpAAr7T2pk/W5tKgfD
 O1zhHEDTkszuCDebZZDCiW7SfftW7NBkNdXdXdTUxBKJZneIGREv080NaxNLm5v+ES6b
 x2UsPuFTt0aqgxwfrKwHQo8cGUzYxuGmW199wyArmwS4L1xqMmk/4qp6WHkdNoltwHmE
 m2u7yQKy+/+XpeODAiqWuyEYe8r9YQluGNpqQKB0Dl3i693cEvnF/wIyanhxurM0IaXT
 T8mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Wy9/RKdx6k2GdGX7vFs6xPvmsh5JxfYLsYClmHq661o=;
 b=k8hQWEjGXuk2kwtNxOD/FBAx62Gk67KrPBpxh8Ei6Hf0WkqQG/Xo8GWtwYmoJyrg5W
 GzF7L5JR7e+yZjnuxzOjF+6MVSPaSprphYv9TT81MJieYRQSO/r5djnN/r8sFir8j21p
 i42tqiai5nGVBER1Ovygh9KpA+/nfCEfqn//8+7tWBEGG5g+9ffX10vnv9qGaREUKw/c
 0G8t6mXn5bo4SZkDXruU50qa3A/Aosj71kz+xLmlomKZMuhpztB2WPXLV3t7WlnCCIXx
 QM507wFlZIYK6UaysxM1suRLS64VdGvjJj0kQZ+KWR81Sh5Cf4b8B4agjEYHszjQB/sM
 Q3Iw==
X-Gm-Message-State: AGi0PuY/B6fcIzd6xjBhyANS89gsLwwOXtFD76myAFm2byaGlSyTI+Ne
 K+OKVIRXYvYXO66MNb2/CdoITCTDsQM=
X-Google-Smtp-Source: APiQypIKnOj7/xOwPFBfphlOfupHTQ69hSnNxFzqc7BHWs1a+dVZ7UXM0dM2ZA3Lrk/AVd5/TBbktg==
X-Received: by 2002:a62:188c:: with SMTP id 134mr8327452pfy.222.1586359861664; 
 Wed, 08 Apr 2020 08:31:01 -0700 (PDT)
Received: from localhost.localdomain (174-21-149-226.tukw.qwest.net.
 [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id t4sm16920454pfb.156.2020.04.08.08.31.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Apr 2020 08:31:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL for-5.0 1/1] target/rx/translate: Add missing fall through
 comment
Date: Wed,  8 Apr 2020 08:30:56 -0700
Message-Id: <20200408153057.31794-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200408153057.31794-1-richard.henderson@linaro.org>
References: <20200408153057.31794-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::535
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Coverity reported a missing fall through comment, add it.

Fixes: e5918d7d7f0 ("target/rx: TCG translation")
Reported-by: Coverity (CID 1422222 MISSING_BREAK)
Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20200403184419.28556-1-philmd@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/rx/translate.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/rx/translate.c b/target/rx/translate.c
index b3d7305f23..61e86653a4 100644
--- a/target/rx/translate.c
+++ b/target/rx/translate.c
@@ -2362,6 +2362,7 @@ static void rx_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
         break;
     case DISAS_UPDATE:
         tcg_gen_movi_i32(cpu_pc, ctx->base.pc_next);
+        /* fall through */
     case DISAS_EXIT:
         tcg_gen_exit_tb(NULL, 0);
         break;
-- 
2.20.1


