Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAB533E3523
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Aug 2021 13:11:32 +0200 (CEST)
Received: from localhost ([::1]:55312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mCKEl-0002Wd-5z
	for lists+qemu-devel@lfdr.de; Sat, 07 Aug 2021 07:11:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mCKD2-0000Tw-Ul
 for qemu-devel@nongnu.org; Sat, 07 Aug 2021 07:09:44 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:33609)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mCKD1-0001X5-FF
 for qemu-devel@nongnu.org; Sat, 07 Aug 2021 07:09:44 -0400
Received: by mail-wr1-x429.google.com with SMTP id k4so1411878wrc.0
 for <qemu-devel@nongnu.org>; Sat, 07 Aug 2021 04:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=r0zQ9L5i+0Ivud6hH+9q1aA1TLKo/lLYMO9n6YVoc6Q=;
 b=f25603OyR5wdex2QWMZbXRdw2Eve5edo4vNUQF/tqlAYQpvqBIyULh+QEI8vJTUISd
 ihRmnQERlISanqVmaKn9ZO9qgz6QCciC5MMvK60FTlHMbU2ppa6I9A2hHEYFPn4gnHXM
 WOOJKQtGQZFPYXmM3ESGWwTwGnJ73TJT2rdU+v4BWL10RNlOgcy3WuGxqUvfNkJWZXFS
 5DmUw2d2sbPlnyXz6sG7YA+bowxqquSUu8HS3f+A4M1iruAp5/ji8sq4StmG467VdAQX
 fyS2koWcDIpTLl03QXtoLCWbY6heaI+tHtas/sRBj3n5JiEC5hnPwvngjs9xi/eL24jC
 ua/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=r0zQ9L5i+0Ivud6hH+9q1aA1TLKo/lLYMO9n6YVoc6Q=;
 b=CVQa8hxA4jFWo9Qf9Sg22YuW0wqqxIEOXdnPtMQdCRPVhCTGYZDLtwimZB71+SWWjC
 Rx/Nh+TTxingrg5oyEVZQecmqlHFNoxgbzmeIGhRd+9W1drTxdzaSOzDP08Jvy8vmzNy
 5AsrCfTTiwNG5/xSrxLfQMpumCWClK2ycvpwbUDXLkjzRP4h20p5/IKbeFlN9KFTAS0J
 RRvpfeGvV5VPRYMtBd2JjI8bmv9bif3odW+k7DrXQl81ysY775ot6nfhZBs1prk+CruR
 3XigtVRNs6iNBjk66zov+N1Qk+oNOTPz2yr/BJA68T0ZBLB/VBEC96YAfa4upxCa454m
 RReA==
X-Gm-Message-State: AOAM532nzGX++VfhUeu45qgpvYhqMnSAoWZ12KSXedEJwqp9Vs8RbV/K
 TLvuZXy3E3sTMA94QkwvX43ptpwRzroGAgIjaUg=
X-Google-Smtp-Source: ABdhPJya03hcr4Nq2u9l/fwB3H/uBl5thwEApzeM9iAmaM8sJ/dSBMW4h94DwLLGcxgP6SYq1Lug0A==
X-Received: by 2002:adf:f081:: with SMTP id n1mr15720617wro.235.1628334581655; 
 Sat, 07 Aug 2021 04:09:41 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 l5sm14814169wrc.90.2021.08.07.04.09.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Aug 2021 04:09:40 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-6.2 0/2] disas/nios2: Simplify endianess conversion
Date: Sat,  7 Aug 2021 13:09:37 +0200
Message-Id: <20210807110939.95853-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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
Cc: Marek Vasut <marex@denx.de>, Thomas Huth <thuth@redhat.com>,
 Chris Wulff <crwulff@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

After chatting with Richard Henderson and Paolo Bonzini, we=0D
concluded the load/store API is mature enough to have target=0D
code endianess-agnostic.=0D
Thus we could remove the TARGET_WORDS_BIGENDIAN definition from=0D
target-specific code (restricting it to the binary format loaders).=0D
=0D
While experimenting, I noticed the Nios2 disassembler is an easy=0D
win. MIPS will follow shortly.=0D
=0D
Philippe Mathieu-Daud=C3=A9 (2):=0D
  disas/nios2: Fix style in print_insn_nios2()=0D
  disas/nios2: Simplify endianess conversion=0D
=0D
 include/disas/dis-asm.h |  3 +-=0D
 disas/nios2.c           | 71 ++++++++++++++++-------------------------=0D
 target/nios2/cpu.c      |  6 +---=0D
 3 files changed, 29 insertions(+), 51 deletions(-)=0D
=0D
-- =0D
2.31.1=0D
=0D

