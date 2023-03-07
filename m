Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A1A6AEE23
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 19:09:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZbim-0007QL-K4; Tue, 07 Mar 2023 13:07:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1pZbiZ-0007Bn-PM
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 13:07:19 -0500
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1pZbiX-0002EL-Vj
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 13:07:19 -0500
Received: by mail-lj1-x232.google.com with SMTP id h3so14050563lja.12
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 10:07:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vrull.eu; s=google; t=1678212435;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=m0Gxou+MGW9a2T5xEFkWg+NJvqC5ilJod1fsR9xzHRs=;
 b=MiQwGfryy2uCiGYDMzn9W+PIyCF59i73uwrv7uK7ZCk1Ji2HqWBYjD7cH1T8/Rmk45
 hFKje7veDss/g4yzsiUMMVy9hlxas6aLw30vqB5iVUPHa+H+hlNU+c+cdY1LRz2ygUk4
 nrXzA69DSu1zMhM5cHmqQyf/XAUP2HnWLisZIiLcLJi+rA1LRpsSUgGhPDXsAGi58VDs
 pgoPozbYkBJ9c9ARF5FJh/uSB9J4fso12IsLPvtC+Y8+4Y3TWcsectzYAylE2IwvU6ak
 mP/12nnLfhEXHcTo2IDKcr7YsZU7CCdLZbkIKp2o1LMJu0bL+zYXvF4+VLJL72p567Pd
 kElw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678212435;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=m0Gxou+MGW9a2T5xEFkWg+NJvqC5ilJod1fsR9xzHRs=;
 b=bGDevH7SZ9+UkZTxB4SIPyZ0L1s0Ei5/5jRV50GbrtFF3Fw6X/VrwKJcDy/KphIgY0
 YebSaEfKQ/0nfeKn7njgXTia5mBdiodfyltTg+vf1LC4KjynL6tUu5G6+CvEPnSv703H
 W99XVtf1www2pbSoz63LvNTdP8jSULKAIRoAKl6PKmHdlvhUhc3GXyEyXOgeKzkXs2Yg
 VzK1fPuK7qiMdx2MzJopISDl93M56DldqhyDSP/1WEP5Qh4pSB77zMhcoGCAeK9a4oDY
 DoCzjv6v1vgzSplkLVtB0SF8yA+8asMi04mhijDylAe9kgMEMRfjkIPvbtH9gB3j0x6L
 9k5A==
X-Gm-Message-State: AO0yUKU/ixaWRuGMqxa01iKNkuukFtbRURXRZgiNB4ookDQs/LxIS4Wt
 nUblkv9ymktM7QmG1IgEbLH1GKlDMMrl8WPcGM4=
X-Google-Smtp-Source: AK7set+So6Qua6e46w2AotCeBx+bnBmhwig6n+LkDFnWF/LN9+KL/M7z5N4PtsCfy+xF4vrTyTgohg==
X-Received: by 2002:a2e:9984:0:b0:293:45f1:c1a6 with SMTP id
 w4-20020a2e9984000000b0029345f1c1a6mr3972804lji.0.1678212434714; 
 Tue, 07 Mar 2023 10:07:14 -0800 (PST)
Received: from ubuntu-focal.. ([2a01:4f9:3a:1e26::2])
 by smtp.gmail.com with ESMTPSA id
 f13-20020a2eb5ad000000b0028b6e922ba1sm2266952ljn.30.2023.03.07.10.07.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 10:07:14 -0800 (PST)
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Christoph Muellner <christoph.muellner@vrull.eu>,
 Kito Cheng <kito.cheng@sifive.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>
Subject: [PATCH v5 0/2] target/riscv: refactor Zicond and reuse in
 XVentanaCondOps
Date: Tue,  7 Mar 2023 19:07:06 +0100
Message-Id: <20230307180708.302867-1-philipp.tomsich@vrull.eu>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::232;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-lj1-x232.google.com
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


After the original Zicond support was stuck/fell through the cracks on
the mailing list at v3 (and a different implementation was merged in
the meanwhile), we now refactor Zicond and then reuse it in
XVentanaCondOps.


Philipp Tomsich (2):
  target/riscv: refactor Zicond support
  target/riscv: redirect XVentanaCondOps to use the Zicond functions

 MAINTAINERS                                   |  2 +-
 target/riscv/insn_trans/trans_rvzicond.c.inc  | 36 +++++++++++--------
 .../insn_trans/trans_xventanacondops.c.inc    | 18 ++--------
 3 files changed, 25 insertions(+), 31 deletions(-)

-- 
2.34.1


