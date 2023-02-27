Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E32B6A3A6B
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 06:31:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWW2i-0002jv-Pu; Mon, 27 Feb 2023 00:27:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW2Q-0000ZT-Bf
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 00:27:02 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW2J-0007zy-Ia
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 00:26:58 -0500
Received: by mail-pj1-x102f.google.com with SMTP id
 gi3-20020a17090b110300b0023762f642dcso5008490pjb.4
 for <qemu-devel@nongnu.org>; Sun, 26 Feb 2023 21:26:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b6y4zpHlwmASZL3Wsq/COyCHbhwEv63XD2IWNIuyt6k=;
 b=YDnEChFGZP6yT99BLe5B2vrbT8rKkEDDJPm8gI44g6SZllPaJM38yCofbRlDlqNfcH
 mixQ2IGdye33oYHp5P3JMms82cCJewRSMm/nt+KPhMKPBHbk6WIHTxUKT9Fn6y5XbfpW
 qsmBQtq0WVhdohU4OZyUEJHHV9ZKmjjtxVn+v7FmMoScQSMrCCptgdiE22v2qmfjDwN2
 Bo0CMCkF4vTWFOfH5ZOFwlarujWzykrDKuCh+ObjTTm8VFrdNqscp/qdpy7zUoObXis/
 yGj+PUTdOaO/X+pGyCYIqNseU+MuzRCAVT7q4EorFjceSIdAy7/LZNNaT7clv1kGS0vz
 GGYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=b6y4zpHlwmASZL3Wsq/COyCHbhwEv63XD2IWNIuyt6k=;
 b=dSOYUIOeX4nR0dOdBI+Vih6A0/U722VYnyZbL491QMl35e0vgjQRWvsO9sM7AWyjnP
 bsPzqpx35MHpe6Kij5zZk8f+jby0eYlEiqaDQgH1JA07b1Jvg4aFrsGxZc9Gqp5P2vGa
 7ENdHOvUEqCS400P2tMzEpoD25yBfb84nNQXxGhG0r3EG5IEGA6LBgBn2tsjj8c7KVN2
 zDIIbmMv3Ig4hGvsGlKfTcL4FGcXykZF3YHEEfYN4BZrpBWseJxccKuEdjUPIKkOL/HS
 lkN6SGFaHiFSSFAOB5gAxK/RTRxxj3RnU+48BvMhaOdTAmFfUNwO8nM5P63ycwTTg94W
 iwPg==
X-Gm-Message-State: AO0yUKUSTM6gxl1gZ/71zUCUWKatM6RSDJS9d6X1k46jfIU9U6P/cCDw
 L0sMZhpuDlsA1nkMTv8PEkC6p8v2iNEYeDnOmPs=
X-Google-Smtp-Source: AK7set9sf89/GmYsKQ0+GRLBZqTeq5m4AsjpeaWHUeGlTtarBYrCQpSwqG3kh37yxeOj+e9Ym0BYIg==
X-Received: by 2002:a17:903:5d0:b0:19c:f096:bbef with SMTP id
 kf16-20020a17090305d000b0019cf096bbefmr5658932plb.49.1677475614022; 
 Sun, 26 Feb 2023 21:26:54 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 a14-20020a170902ecce00b0019a837be977sm3513341plh.271.2023.02.26.21.26.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:26:53 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH v2 38/76] target/mips: Drop tcg_temp_free from
 mips16e_translate.c.inc
Date: Sun, 26 Feb 2023 19:24:27 -1000
Message-Id: <20230227052505.352889-39-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227052505.352889-1-richard.henderson@linaro.org>
References: <20230227052505.352889-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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

Translators are no longer required to free tcg temporaries.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/mips/tcg/mips16e_translate.c.inc | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/target/mips/tcg/mips16e_translate.c.inc b/target/mips/tcg/mips16e_translate.c.inc
index 918b15d55c..602f5f0c02 100644
--- a/target/mips/tcg/mips16e_translate.c.inc
+++ b/target/mips/tcg/mips16e_translate.c.inc
@@ -280,9 +280,6 @@ static void gen_mips16_save(DisasContext *ctx,
 
     tcg_gen_movi_tl(t2, -framesize);
     gen_op_addr_add(ctx, cpu_gpr[29], cpu_gpr[29], t2);
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
-    tcg_temp_free(t2);
 }
 
 static void gen_mips16_restore(DisasContext *ctx,
@@ -386,9 +383,6 @@ static void gen_mips16_restore(DisasContext *ctx,
 
     tcg_gen_movi_tl(t2, framesize);
     gen_op_addr_add(ctx, cpu_gpr[29], cpu_gpr[29], t2);
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
-    tcg_temp_free(t2);
 }
 
 #if defined(TARGET_MIPS64)
-- 
2.34.1


