Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18834442FDD
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 15:09:21 +0100 (CET)
Received: from localhost ([::1]:49664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhuTY-0002Rt-6i
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 10:09:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mhu6V-00050F-T1
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 09:45:31 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:46914)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mhu6R-0006PC-UH
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 09:45:31 -0400
Received: by mail-wr1-x434.google.com with SMTP id u1so1805581wru.13
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 06:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mbPpFP9IPA2wXzUBxuHciFVrxDYF6qdrb181+WZfmQs=;
 b=L3/1I++TwT1CxQEdRc/8VEj/aHwFhzzc423CdOKhlj8U/Il38H3kV0UOxKilB3BDVr
 RN+jY/0n4eDq1CqwERNnlt61koYIgdIJXgv7CtVADQpksgGy7Ci+r84diHNQyd9y1RiL
 jdWL4FMs5+sQ0aPBC0nRH5o6zQsdt3oEyByu6ZK4LEzIJjljNTmO2OGaM/gqRGrHj6Bw
 mOpm778iJXlebX0ETZr+NoOZk7vO5biPiNUvlg7KhOxAjxh48NYEJrtEJihSz9DynS+7
 wTTrBw6E47zmyV4bVN5ijYiEDHvLYANnXV8U8pAEqJnwjK52IXsEzG30sXh/rCZjCwxK
 8qlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=mbPpFP9IPA2wXzUBxuHciFVrxDYF6qdrb181+WZfmQs=;
 b=ESHqqibng5OZmc5osIOC02CPVXTjCbeqwHXW1Er5mLLOPk7iSkzJgEfcDJFbbUQrcH
 l6AUSpgAQigbMENzgONrtQkoRPsN3CeYghbkrnFN+4vmOX2wdTPgDeLsn9aEvvXXJFml
 uW0vsED9GE6WbvW6zgPEDX0avYTlVF5UZ6zIXEphvazpy5Tl1HOAGWuXkodSPtOLL1zr
 TH7DyRnkzHhI8NpC4EaMD6arEpL5RbUPiwCE2uvkESy9XJvNB9PuquCQ7YRlNG1VECsN
 YY7m9Rf0RzdjLF6p1N2risjKOUYaeWSzNW43xqCcruIi3nfAGs2Bl2Fp78vA0BddnknB
 iZ0w==
X-Gm-Message-State: AOAM530x5+axTWwgv/y5pWvowb40nzSoZAq21qB7PN+dneSkFIhN/iG2
 vAObz6f3bXD1+9Uv9RytFRAyo8RtWgE=
X-Google-Smtp-Source: ABdhPJytiQ3pv+1KR6l9PwquMBmGrXD16wmojFZKFzwZA6jHvjfQGgVDgDOVuv46TucjxmM2Yc7UCQ==
X-Received: by 2002:a05:6000:1849:: with SMTP id
 c9mr48646466wri.394.1635860725821; 
 Tue, 02 Nov 2021 06:45:25 -0700 (PDT)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 t8sm16205177wrv.30.2021.11.02.06.45.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 06:45:25 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 34/41] target/mips: Remove one MSA unnecessary decodetree
 overlap group
Date: Tue,  2 Nov 2021 14:42:33 +0100
Message-Id: <20211102134240.3036524-35-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211102134240.3036524-1-f4bug@amsat.org>
References: <20211102134240.3036524-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Only the MSA generic opcode was overlapping with the other
instructions. Since the previous commit removed it, we can
now remove the overlap group. The decodetree script forces
us to re-indent the opcodes.

Diff trivial to review using `git-diff --ignore-all-space`.

Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20211028210843.2120802-32-f4bug@amsat.org>
---
 target/mips/tcg/msa.decode | 398 ++++++++++++++++++-------------------
 1 file changed, 198 insertions(+), 200 deletions(-)

diff --git a/target/mips/tcg/msa.decode b/target/mips/tcg/msa.decode
index 124768132ba..95752891956 100644
--- a/target/mips/tcg/msa.decode
+++ b/target/mips/tcg/msa.decode
@@ -56,205 +56,203 @@ BNZ_V               010001 01111  ..... ................    @bz_v
 BZ                  010001 110 .. ..... ................    @bz
 BNZ                 010001 111 .. ..... ................    @bz
 
+ANDI                011110 00 ........ ..... .....  000000  @i8
+ORI                 011110 01 ........ ..... .....  000000  @i8
+NORI                011110 10 ........ ..... .....  000000  @i8
+XORI                011110 11 ........ ..... .....  000000  @i8
+BMNZI               011110 00 ........ ..... .....  000001  @i8
+BMZI                011110 01 ........ ..... .....  000001  @i8
+BSELI               011110 10 ........ ..... .....  000001  @i8
+SHF                 011110 .. ........ ..... .....  000010  @i8_df
+
+ADDVI               011110 000 .. ..... ..... ..... 000110  @u5
+SUBVI               011110 001 .. ..... ..... ..... 000110  @u5
+MAXI_S              011110 010 .. ..... ..... ..... 000110  @s5
+MAXI_U              011110 011 .. ..... ..... ..... 000110  @u5
+MINI_S              011110 100 .. ..... ..... ..... 000110  @s5
+MINI_U              011110 101 .. ..... ..... ..... 000110  @u5
+
+CEQI                011110 000 .. ..... ..... ..... 000111  @s5
+CLTI_S              011110 010 .. ..... ..... ..... 000111  @s5
+CLTI_U              011110 011 .. ..... ..... ..... 000111  @u5
+CLEI_S              011110 100 .. ..... ..... ..... 000111  @s5
+CLEI_U              011110 101 .. ..... ..... ..... 000111  @u5
+
+LDI                 011110 110 .. ..........  ..... 000111  @ldi
+
+SLLI                011110 000 ....... ..... .....  001001  @bit
+SRAI                011110 001 ....... ..... .....  001001  @bit
+SRLI                011110 010 ....... ..... .....  001001  @bit
+BCLRI               011110 011 ....... ..... .....  001001  @bit
+BSETI               011110 100 ....... ..... .....  001001  @bit
+BNEGI               011110 101 ....... ..... .....  001001  @bit
+BINSLI              011110 110 ....... ..... .....  001001  @bit
+BINSRI              011110 111 ....... ..... .....  001001  @bit
+
+SAT_S               011110 000 ....... ..... .....  001010  @bit
+SAT_U               011110 001 ....... ..... .....  001010  @bit
+SRARI               011110 010 ....... ..... .....  001010  @bit
+SRLRI               011110 011 ....... ..... .....  001010  @bit
+
+SLL                 011110 000.. ..... ..... .....  001101  @3r
+SRA                 011110 001.. ..... ..... .....  001101  @3r
+SRL                 011110 010.. ..... ..... .....  001101  @3r
+BCLR                011110 011.. ..... ..... .....  001101  @3r
+BSET                011110 100.. ..... ..... .....  001101  @3r
+BNEG                011110 101.. ..... ..... .....  001101  @3r
+BINSL               011110 110.. ..... ..... .....  001101  @3r
+BINSR               011110 111.. ..... ..... .....  001101  @3r
+
+ADDV                011110 000.. ..... ..... .....  001110  @3r
+SUBV                011110 001.. ..... ..... .....  001110  @3r
+MAX_S               011110 010.. ..... ..... .....  001110  @3r
+MAX_U               011110 011.. ..... ..... .....  001110  @3r
+MIN_S               011110 100.. ..... ..... .....  001110  @3r
+MIN_U               011110 101.. ..... ..... .....  001110  @3r
+MAX_A               011110 110.. ..... ..... .....  001110  @3r
+MIN_A               011110 111.. ..... ..... .....  001110  @3r
+
+CEQ                 011110 000.. ..... ..... .....  001111  @3r
+CLT_S               011110 010.. ..... ..... .....  001111  @3r
+CLT_U               011110 011.. ..... ..... .....  001111  @3r
+CLE_S               011110 100.. ..... ..... .....  001111  @3r
+CLE_U               011110 101.. ..... ..... .....  001111  @3r
+
+ADD_A               011110 000.. ..... ..... .....  010000  @3r
+ADDS_A              011110 001.. ..... ..... .....  010000  @3r
+ADDS_S              011110 010.. ..... ..... .....  010000  @3r
+ADDS_U              011110 011.. ..... ..... .....  010000  @3r
+AVE_S               011110 100.. ..... ..... .....  010000  @3r
+AVE_U               011110 101.. ..... ..... .....  010000  @3r
+AVER_S              011110 110.. ..... ..... .....  010000  @3r
+AVER_U              011110 111.. ..... ..... .....  010000  @3r
+
+SUBS_S              011110 000.. ..... ..... .....  010001  @3r
+SUBS_U              011110 001.. ..... ..... .....  010001  @3r
+SUBSUS_U            011110 010.. ..... ..... .....  010001  @3r
+SUBSUU_S            011110 011.. ..... ..... .....  010001  @3r
+ASUB_S              011110 100.. ..... ..... .....  010001  @3r
+ASUB_U              011110 101.. ..... ..... .....  010001  @3r
+
+MULV                011110 000.. ..... ..... .....  010010  @3r
+MADDV               011110 001.. ..... ..... .....  010010  @3r
+MSUBV               011110 010.. ..... ..... .....  010010  @3r
+DIV_S               011110 100.. ..... ..... .....  010010  @3r
+DIV_U               011110 101.. ..... ..... .....  010010  @3r
+MOD_S               011110 110.. ..... ..... .....  010010  @3r
+MOD_U               011110 111.. ..... ..... .....  010010  @3r
+
+DOTP_S              011110 000.. ..... ..... .....  010011  @3r
+DOTP_U              011110 001.. ..... ..... .....  010011  @3r
+DPADD_S             011110 010.. ..... ..... .....  010011  @3r
+DPADD_U             011110 011.. ..... ..... .....  010011  @3r
+DPSUB_S             011110 100.. ..... ..... .....  010011  @3r
+DPSUB_U             011110 101.. ..... ..... .....  010011  @3r
+
+SLD                 011110 000 .. ..... ..... ..... 010100  @3r
+SPLAT               011110 001 .. ..... ..... ..... 010100  @3r
+PCKEV               011110 010 .. ..... ..... ..... 010100  @3r
+PCKOD               011110 011 .. ..... ..... ..... 010100  @3r
+ILVL                011110 100 .. ..... ..... ..... 010100  @3r
+ILVR                011110 101 .. ..... ..... ..... 010100  @3r
+ILVEV               011110 110 .. ..... ..... ..... 010100  @3r
+ILVOD               011110 111 .. ..... ..... ..... 010100  @3r
+
+VSHF                011110 000 .. ..... ..... ..... 010101  @3r
+SRAR                011110 001 .. ..... ..... ..... 010101  @3r
+SRLR                011110 010 .. ..... ..... ..... 010101  @3r
+HADD_S              011110 100.. ..... ..... .....  010101  @3r
+HADD_U              011110 101.. ..... ..... .....  010101  @3r
+HSUB_S              011110 110.. ..... ..... .....  010101  @3r
+HSUB_U              011110 111.. ..... ..... .....  010101  @3r
+
 {
-  ANDI              011110 00 ........ ..... .....  000000  @i8
-  ORI               011110 01 ........ ..... .....  000000  @i8
-  NORI              011110 10 ........ ..... .....  000000  @i8
-  XORI              011110 11 ........ ..... .....  000000  @i8
-  BMNZI             011110 00 ........ ..... .....  000001  @i8
-  BMZI              011110 01 ........ ..... .....  000001  @i8
-  BSELI             011110 10 ........ ..... .....  000001  @i8
-  SHF               011110 .. ........ ..... .....  000010  @i8_df
-
-  ADDVI             011110 000 .. ..... ..... ..... 000110  @u5
-  SUBVI             011110 001 .. ..... ..... ..... 000110  @u5
-  MAXI_S            011110 010 .. ..... ..... ..... 000110  @s5
-  MAXI_U            011110 011 .. ..... ..... ..... 000110  @u5
-  MINI_S            011110 100 .. ..... ..... ..... 000110  @s5
-  MINI_U            011110 101 .. ..... ..... ..... 000110  @u5
-
-  CEQI              011110 000 .. ..... ..... ..... 000111  @s5
-  CLTI_S            011110 010 .. ..... ..... ..... 000111  @s5
-  CLTI_U            011110 011 .. ..... ..... ..... 000111  @u5
-  CLEI_S            011110 100 .. ..... ..... ..... 000111  @s5
-  CLEI_U            011110 101 .. ..... ..... ..... 000111  @u5
-
-  LDI               011110 110 .. ..........  ..... 000111  @ldi
-
-  SLLI              011110 000 ....... ..... .....  001001  @bit
-  SRAI              011110 001 ....... ..... .....  001001  @bit
-  SRLI              011110 010 ....... ..... .....  001001  @bit
-  BCLRI             011110 011 ....... ..... .....  001001  @bit
-  BSETI             011110 100 ....... ..... .....  001001  @bit
-  BNEGI             011110 101 ....... ..... .....  001001  @bit
-  BINSLI            011110 110 ....... ..... .....  001001  @bit
-  BINSRI            011110 111 ....... ..... .....  001001  @bit
-
-  SAT_S             011110 000 ....... ..... .....  001010  @bit
-  SAT_U             011110 001 ....... ..... .....  001010  @bit
-  SRARI             011110 010 ....... ..... .....  001010  @bit
-  SRLRI             011110 011 ....... ..... .....  001010  @bit
-
-  SLL               011110 000.. ..... ..... .....  001101  @3r
-  SRA               011110 001.. ..... ..... .....  001101  @3r
-  SRL               011110 010.. ..... ..... .....  001101  @3r
-  BCLR              011110 011.. ..... ..... .....  001101  @3r
-  BSET              011110 100.. ..... ..... .....  001101  @3r
-  BNEG              011110 101.. ..... ..... .....  001101  @3r
-  BINSL             011110 110.. ..... ..... .....  001101  @3r
-  BINSR             011110 111.. ..... ..... .....  001101  @3r
-
-  ADDV              011110 000.. ..... ..... .....  001110  @3r
-  SUBV              011110 001.. ..... ..... .....  001110  @3r
-  MAX_S             011110 010.. ..... ..... .....  001110  @3r
-  MAX_U             011110 011.. ..... ..... .....  001110  @3r
-  MIN_S             011110 100.. ..... ..... .....  001110  @3r
-  MIN_U             011110 101.. ..... ..... .....  001110  @3r
-  MAX_A             011110 110.. ..... ..... .....  001110  @3r
-  MIN_A             011110 111.. ..... ..... .....  001110  @3r
-
-  CEQ               011110 000.. ..... ..... .....  001111  @3r
-  CLT_S             011110 010.. ..... ..... .....  001111  @3r
-  CLT_U             011110 011.. ..... ..... .....  001111  @3r
-  CLE_S             011110 100.. ..... ..... .....  001111  @3r
-  CLE_U             011110 101.. ..... ..... .....  001111  @3r
-
-  ADD_A             011110 000.. ..... ..... .....  010000  @3r
-  ADDS_A            011110 001.. ..... ..... .....  010000  @3r
-  ADDS_S            011110 010.. ..... ..... .....  010000  @3r
-  ADDS_U            011110 011.. ..... ..... .....  010000  @3r
-  AVE_S             011110 100.. ..... ..... .....  010000  @3r
-  AVE_U             011110 101.. ..... ..... .....  010000  @3r
-  AVER_S            011110 110.. ..... ..... .....  010000  @3r
-  AVER_U            011110 111.. ..... ..... .....  010000  @3r
-
-  SUBS_S            011110 000.. ..... ..... .....  010001  @3r
-  SUBS_U            011110 001.. ..... ..... .....  010001  @3r
-  SUBSUS_U          011110 010.. ..... ..... .....  010001  @3r
-  SUBSUU_S          011110 011.. ..... ..... .....  010001  @3r
-  ASUB_S            011110 100.. ..... ..... .....  010001  @3r
-  ASUB_U            011110 101.. ..... ..... .....  010001  @3r
-
-  MULV              011110 000.. ..... ..... .....  010010  @3r
-  MADDV             011110 001.. ..... ..... .....  010010  @3r
-  MSUBV             011110 010.. ..... ..... .....  010010  @3r
-  DIV_S             011110 100.. ..... ..... .....  010010  @3r
-  DIV_U             011110 101.. ..... ..... .....  010010  @3r
-  MOD_S             011110 110.. ..... ..... .....  010010  @3r
-  MOD_U             011110 111.. ..... ..... .....  010010  @3r
-
-  DOTP_S            011110 000.. ..... ..... .....  010011  @3r
-  DOTP_U            011110 001.. ..... ..... .....  010011  @3r
-  DPADD_S           011110 010.. ..... ..... .....  010011  @3r
-  DPADD_U           011110 011.. ..... ..... .....  010011  @3r
-  DPSUB_S           011110 100.. ..... ..... .....  010011  @3r
-  DPSUB_U           011110 101.. ..... ..... .....  010011  @3r
-
-  SLD               011110 000 .. ..... ..... ..... 010100  @3r
-  SPLAT             011110 001 .. ..... ..... ..... 010100  @3r
-  PCKEV             011110 010 .. ..... ..... ..... 010100  @3r
-  PCKOD             011110 011 .. ..... ..... ..... 010100  @3r
-  ILVL              011110 100 .. ..... ..... ..... 010100  @3r
-  ILVR              011110 101 .. ..... ..... ..... 010100  @3r
-  ILVEV             011110 110 .. ..... ..... ..... 010100  @3r
-  ILVOD             011110 111 .. ..... ..... ..... 010100  @3r
-
-  VSHF              011110 000 .. ..... ..... ..... 010101  @3r
-  SRAR              011110 001 .. ..... ..... ..... 010101  @3r
-  SRLR              011110 010 .. ..... ..... ..... 010101  @3r
-  HADD_S            011110 100.. ..... ..... .....  010101  @3r
-  HADD_U            011110 101.. ..... ..... .....  010101  @3r
-  HSUB_S            011110 110.. ..... ..... .....  010101  @3r
-  HSUB_U            011110 111.. ..... ..... .....  010101  @3r
-
-  {
-    CTCMSA          011110 0000111110  ..... .....  011001  @elm
-    SLDI            011110 0000 ...... ..... .....  011001  @elm_df
-  }
-  {
-    CFCMSA          011110 0001111110  ..... .....  011001  @elm
-    SPLATI          011110 0001 ...... ..... .....  011001  @elm_df
-  }
-  {
-    MOVE_V          011110 0010111110  ..... .....  011001  @elm
-    COPY_S          011110 0010 ...... ..... .....  011001  @elm_df
-  }
-  COPY_U            011110 0011 ...... ..... .....  011001  @elm_df
-  INSERT            011110 0100 ...... ..... .....  011001  @elm_df
-  INSVE             011110 0101 ...... ..... .....  011001  @elm_df
-
-  FCAF              011110 0000 . ..... ..... ..... 011010  @3rf_w
-  FCUN              011110 0001 . ..... ..... ..... 011010  @3rf_w
-  FCEQ              011110 0010 . ..... ..... ..... 011010  @3rf_w
-  FCUEQ             011110 0011 . ..... ..... ..... 011010  @3rf_w
-  FCLT              011110 0100 . ..... ..... ..... 011010  @3rf_w
-  FCULT             011110 0101 . ..... ..... ..... 011010  @3rf_w
-  FCLE              011110 0110 . ..... ..... ..... 011010  @3rf_w
-  FCULE             011110 0111 . ..... ..... ..... 011010  @3rf_w
-  FSAF              011110 1000 . ..... ..... ..... 011010  @3rf_w
-  FSUN              011110 1001 . ..... ..... ..... 011010  @3rf_w
-  FSEQ              011110 1010 . ..... ..... ..... 011010  @3rf_w
-  FSUEQ             011110 1011 . ..... ..... ..... 011010  @3rf_w
-  FSLT              011110 1100 . ..... ..... ..... 011010  @3rf_w
-  FSULT             011110 1101 . ..... ..... ..... 011010  @3rf_w
-  FSLE              011110 1110 . ..... ..... ..... 011010  @3rf_w
-  FSULE             011110 1111 . ..... ..... ..... 011010  @3rf_w
-
-  FADD              011110 0000 . ..... ..... ..... 011011  @3rf_w
-  FSUB              011110 0001 . ..... ..... ..... 011011  @3rf_w
-  FMUL              011110 0010 . ..... ..... ..... 011011  @3rf_w
-  FDIV              011110 0011 . ..... ..... ..... 011011  @3rf_w
-  FMADD             011110 0100 . ..... ..... ..... 011011  @3rf_w
-  FMSUB             011110 0101 . ..... ..... ..... 011011  @3rf_w
-  FEXP2             011110 0111 . ..... ..... ..... 011011  @3rf_w
-  FEXDO             011110 1000 . ..... ..... ..... 011011  @3rf_w
-  FTQ               011110 1010 . ..... ..... ..... 011011  @3rf_w
-  FMIN              011110 1100 . ..... ..... ..... 011011  @3rf_w
-  FMIN_A            011110 1101 . ..... ..... ..... 011011  @3rf_w
-  FMAX              011110 1110 . ..... ..... ..... 011011  @3rf_w
-  FMAX_A            011110 1111 . ..... ..... ..... 011011  @3rf_w
-
-  FCOR              011110 0001 . ..... ..... ..... 011100  @3rf_w
-  FCUNE             011110 0010 . ..... ..... ..... 011100  @3rf_w
-  FCNE              011110 0011 . ..... ..... ..... 011100  @3rf_w
-  MUL_Q             011110 0100 . ..... ..... ..... 011100  @3rf_h
-  MADD_Q            011110 0101 . ..... ..... ..... 011100  @3rf_h
-  MSUB_Q            011110 0110 . ..... ..... ..... 011100  @3rf_h
-  FSOR              011110 1001 . ..... ..... ..... 011100  @3rf_w
-  FSUNE             011110 1010 . ..... ..... ..... 011100  @3rf_w
-  FSNE              011110 1011 . ..... ..... ..... 011100  @3rf_w
-  MULR_Q            011110 1100 . ..... ..... ..... 011100  @3rf_h
-  MADDR_Q           011110 1101 . ..... ..... ..... 011100  @3rf_h
-  MSUBR_Q           011110 1110 . ..... ..... ..... 011100  @3rf_h
-
-  AND_V             011110 00000 ..... ..... .....  011110  @vec
-  OR_V              011110 00001 ..... ..... .....  011110  @vec
-  NOR_V             011110 00010 ..... ..... .....  011110  @vec
-  XOR_V             011110 00011 ..... ..... .....  011110  @vec
-  BMNZ_V            011110 00100 ..... ..... .....  011110  @vec
-  BMZ_V             011110 00101 ..... ..... .....  011110  @vec
-  BSEL_V            011110 00110 ..... ..... .....  011110  @vec
-  FILL              011110 11000000 .. ..... .....  011110  @2r
-  PCNT              011110 11000001 .. ..... .....  011110  @2r
-  NLOC              011110 11000010 .. ..... .....  011110  @2r
-  NLZC              011110 11000011 .. ..... .....  011110  @2r
-  FCLASS            011110 110010000 . ..... .....  011110  @2rf
-  FTRUNC_S          011110 110010001 . ..... .....  011110  @2rf
-  FTRUNC_U          011110 110010010 . ..... .....  011110  @2rf
-  FSQRT             011110 110010011 . ..... .....  011110  @2rf
-  FRSQRT            011110 110010100 . ..... .....  011110  @2rf
-  FRCP              011110 110010101 . ..... .....  011110  @2rf
-  FRINT             011110 110010110 . ..... .....  011110  @2rf
-  FLOG2             011110 110010111 . ..... .....  011110  @2rf
-  FEXUPL            011110 110011000 . ..... .....  011110  @2rf
-  FEXUPR            011110 110011001 . ..... .....  011110  @2rf
-  FFQL              011110 110011010 . ..... .....  011110  @2rf
-  FFQR              011110 110011011 . ..... .....  011110  @2rf
-  FTINT_S           011110 110011100 . ..... .....  011110  @2rf
-  FTINT_U           011110 110011101 . ..... .....  011110  @2rf
-  FFINT_S           011110 110011110 . ..... .....  011110  @2rf
-  FFINT_U           011110 110011111 . ..... .....  011110  @2rf
-
-  LD                011110 .......... ..... .....   1000 .. @ldst
-  ST                011110 .......... ..... .....   1001 .. @ldst
+  CTCMSA            011110 0000111110  ..... .....  011001  @elm
+  SLDI              011110 0000 ...... ..... .....  011001  @elm_df
 }
+{
+  CFCMSA            011110 0001111110  ..... .....  011001  @elm
+  SPLATI            011110 0001 ...... ..... .....  011001  @elm_df
+}
+{
+  MOVE_V            011110 0010111110  ..... .....  011001  @elm
+  COPY_S            011110 0010 ...... ..... .....  011001  @elm_df
+}
+COPY_U              011110 0011 ...... ..... .....  011001  @elm_df
+INSERT              011110 0100 ...... ..... .....  011001  @elm_df
+INSVE               011110 0101 ...... ..... .....  011001  @elm_df
+
+FCAF                011110 0000 . ..... ..... ..... 011010  @3rf_w
+FCUN                011110 0001 . ..... ..... ..... 011010  @3rf_w
+FCEQ                011110 0010 . ..... ..... ..... 011010  @3rf_w
+FCUEQ               011110 0011 . ..... ..... ..... 011010  @3rf_w
+FCLT                011110 0100 . ..... ..... ..... 011010  @3rf_w
+FCULT               011110 0101 . ..... ..... ..... 011010  @3rf_w
+FCLE                011110 0110 . ..... ..... ..... 011010  @3rf_w
+FCULE               011110 0111 . ..... ..... ..... 011010  @3rf_w
+FSAF                011110 1000 . ..... ..... ..... 011010  @3rf_w
+FSUN                011110 1001 . ..... ..... ..... 011010  @3rf_w
+FSEQ                011110 1010 . ..... ..... ..... 011010  @3rf_w
+FSUEQ               011110 1011 . ..... ..... ..... 011010  @3rf_w
+FSLT                011110 1100 . ..... ..... ..... 011010  @3rf_w
+FSULT               011110 1101 . ..... ..... ..... 011010  @3rf_w
+FSLE                011110 1110 . ..... ..... ..... 011010  @3rf_w
+FSULE               011110 1111 . ..... ..... ..... 011010  @3rf_w
+
+FADD                011110 0000 . ..... ..... ..... 011011  @3rf_w
+FSUB                011110 0001 . ..... ..... ..... 011011  @3rf_w
+FMUL                011110 0010 . ..... ..... ..... 011011  @3rf_w
+FDIV                011110 0011 . ..... ..... ..... 011011  @3rf_w
+FMADD               011110 0100 . ..... ..... ..... 011011  @3rf_w
+FMSUB               011110 0101 . ..... ..... ..... 011011  @3rf_w
+FEXP2               011110 0111 . ..... ..... ..... 011011  @3rf_w
+FEXDO               011110 1000 . ..... ..... ..... 011011  @3rf_w
+FTQ                 011110 1010 . ..... ..... ..... 011011  @3rf_w
+FMIN                011110 1100 . ..... ..... ..... 011011  @3rf_w
+FMIN_A              011110 1101 . ..... ..... ..... 011011  @3rf_w
+FMAX                011110 1110 . ..... ..... ..... 011011  @3rf_w
+FMAX_A              011110 1111 . ..... ..... ..... 011011  @3rf_w
+
+FCOR                011110 0001 . ..... ..... ..... 011100  @3rf_w
+FCUNE               011110 0010 . ..... ..... ..... 011100  @3rf_w
+FCNE                011110 0011 . ..... ..... ..... 011100  @3rf_w
+MUL_Q               011110 0100 . ..... ..... ..... 011100  @3rf_h
+MADD_Q              011110 0101 . ..... ..... ..... 011100  @3rf_h
+MSUB_Q              011110 0110 . ..... ..... ..... 011100  @3rf_h
+FSOR                011110 1001 . ..... ..... ..... 011100  @3rf_w
+FSUNE               011110 1010 . ..... ..... ..... 011100  @3rf_w
+FSNE                011110 1011 . ..... ..... ..... 011100  @3rf_w
+MULR_Q              011110 1100 . ..... ..... ..... 011100  @3rf_h
+MADDR_Q             011110 1101 . ..... ..... ..... 011100  @3rf_h
+MSUBR_Q             011110 1110 . ..... ..... ..... 011100  @3rf_h
+
+AND_V               011110 00000 ..... ..... .....  011110  @vec
+OR_V                011110 00001 ..... ..... .....  011110  @vec
+NOR_V               011110 00010 ..... ..... .....  011110  @vec
+XOR_V               011110 00011 ..... ..... .....  011110  @vec
+BMNZ_V              011110 00100 ..... ..... .....  011110  @vec
+BMZ_V               011110 00101 ..... ..... .....  011110  @vec
+BSEL_V              011110 00110 ..... ..... .....  011110  @vec
+FILL                011110 11000000 .. ..... .....  011110  @2r
+PCNT                011110 11000001 .. ..... .....  011110  @2r
+NLOC                011110 11000010 .. ..... .....  011110  @2r
+NLZC                011110 11000011 .. ..... .....  011110  @2r
+FCLASS              011110 110010000 . ..... .....  011110  @2rf
+FTRUNC_S            011110 110010001 . ..... .....  011110  @2rf
+FTRUNC_U            011110 110010010 . ..... .....  011110  @2rf
+FSQRT               011110 110010011 . ..... .....  011110  @2rf
+FRSQRT              011110 110010100 . ..... .....  011110  @2rf
+FRCP                011110 110010101 . ..... .....  011110  @2rf
+FRINT               011110 110010110 . ..... .....  011110  @2rf
+FLOG2               011110 110010111 . ..... .....  011110  @2rf
+FEXUPL              011110 110011000 . ..... .....  011110  @2rf
+FEXUPR              011110 110011001 . ..... .....  011110  @2rf
+FFQL                011110 110011010 . ..... .....  011110  @2rf
+FFQR                011110 110011011 . ..... .....  011110  @2rf
+FTINT_S             011110 110011100 . ..... .....  011110  @2rf
+FTINT_U             011110 110011101 . ..... .....  011110  @2rf
+FFINT_S             011110 110011110 . ..... .....  011110  @2rf
+FFINT_U             011110 110011111 . ..... .....  011110  @2rf
+
+LD                  011110 .......... ..... .....   1000 .. @ldst
+ST                  011110 .......... ..... .....   1001 .. @ldst
-- 
2.31.1


