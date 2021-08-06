Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 714853E30A5
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 23:07:38 +0200 (CEST)
Received: from localhost ([::1]:40632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mC744-0005cD-T8
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 17:07:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mC72R-0003NT-9g
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 17:05:55 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:33331)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mC72O-0008KV-FV
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 17:05:55 -0400
Received: by mail-wr1-x42c.google.com with SMTP id k4so12682141wrc.0
 for <qemu-devel@nongnu.org>; Fri, 06 Aug 2021 14:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Sfy2ficaDNLncPyjFm89GnESlfJEtpYcSmsKvSYuCSQ=;
 b=K1iKkwcwBedB2J43KVou5hrggasiZF4X1jZHZoo+jW4lVjgwL7fBCzzzxVYpRXnLZ2
 vYM+NgBUico5yTTueMd2yIl/tbLDgJlu6oDoLAHqYbve92t+Il3lYe+tS/IA0w1MHZt9
 f10/juIA27wYH+cVz7Mp1A39Rt7ey6b1t0nOUUXwHYB0o0FqkAsoYHQnufguolwGVeY6
 RPvt3Sl1PbL3AcbvaMTzfrryJ8Q8GhkTJy5tPuOhhPYL7589rxu/cwRGok1ZnEpeKWvk
 uv4UQcaNEiyRpTt6awRci2xi1N8bAeuuoUpkjjjbhsTsaxRl14b2Af8vqcJxopEV7aqu
 7+1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=Sfy2ficaDNLncPyjFm89GnESlfJEtpYcSmsKvSYuCSQ=;
 b=VpenE5XsYR6fei4Q508x6njqIJdi7C5gcJd11Bjo264PAhwaoGFIzxK07gcoxTbAbN
 h52tJSBj19bBLYSbqpORP1/2bSE+s4ClQFbHg6m1f9QkiUraZYzM5vYEzg0F7DIXAkX0
 02nT/LDiVwOnuTuQkjC4YumVJ3OOApKdsCXxACnnxJOhSPf6msT4ovWot1TltEh+LONB
 G7BxYziqEZXP2Wil20JGjtZSAF2A72drpUlofdVzK9NcGqsKLzEjaR7ngCW2jSC74IgF
 EbMN/zLMmOj5l3PQ9TVT7YbbPqmok58GEowTpFi7kBVLpQO4zvdZAYGwLJETW2RafWRt
 CkNg==
X-Gm-Message-State: AOAM532bu8E/Nscxr5QDQNvARs/vv1HGnw4Neiq37nrW16mIFgfGmqef
 jn9lmCO1rOHsT8nl2xMYl358jkweRZZfkidYa2w=
X-Google-Smtp-Source: ABdhPJz7k2AOOqb4Rpj1HoY3Vjxh3+1Rh1VCqOwb4YMrv+WID2wpIMBPUSNOcKyPfXEUB+jWFTtFCg==
X-Received: by 2002:a5d:6448:: with SMTP id d8mr12534751wrw.120.1628283950644; 
 Fri, 06 Aug 2021 14:05:50 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 c2sm10467368wrs.60.2021.08.06.14.05.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Aug 2021 14:05:49 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-6.2 v2 0/5] target/mips: Convert NEC Vr54xx to decodetree
Date: Fri,  6 Aug 2021 23:05:43 +0200
Message-Id: <20210806210548.8568-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
 Matheus Ferst <matheus.ferst@eldorado.org.br>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Series fully reviewed.=0D
=0D
Trivial conversion, few more lines moved out of the huge translate.c.=0D
=0D
Since v1:=0D
- Use TRANS() macro from ppc/translate.c, per rth's comment:=0D
  https://www.mail-archive.com/qemu-devel@nongnu.org/msg827660.html=0D
=0D
Philippe Mathieu-Daud=C3=A9 (5):=0D
  target/mips: Extract NEC Vr54xx helpers to vr54xx_helper.c=0D
  target/mips: Introduce decodetree structure for NEC Vr54xx extension=0D
  target/mips: Convert Vr54xx MACC* opcodes to decodetree=0D
  target/mips: Convert Vr54xx MUL* opcodes to decodetree=0D
  target/mips: Convert Vr54xx MSA* opcodes to decodetree=0D
=0D
 target/mips/tcg/translate.h        |   1 +=0D
 target/mips/tcg/vr54xx.decode      |  27 ++++++=0D
 target/mips/tcg/op_helper.c        | 118 ------------------------=0D
 target/mips/tcg/translate.c        |  98 +-------------------=0D
 target/mips/tcg/vr54xx_helper.c    | 142 +++++++++++++++++++++++++++++=0D
 target/mips/tcg/vr54xx_translate.c |  82 +++++++++++++++++=0D
 target/mips/tcg/meson.build        |   3 +=0D
 7 files changed, 260 insertions(+), 211 deletions(-)=0D
 create mode 100644 target/mips/tcg/vr54xx.decode=0D
 create mode 100644 target/mips/tcg/vr54xx_helper.c=0D
 create mode 100644 target/mips/tcg/vr54xx_translate.c=0D
=0D
-- =0D
2.31.1=0D
=0D

