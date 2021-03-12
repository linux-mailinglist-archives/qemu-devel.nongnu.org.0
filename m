Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B58C4339362
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 17:29:11 +0100 (CET)
Received: from localhost ([::1]:37586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKkf0-00016C-Mu
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 11:29:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lKkaf-0005rI-52
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 11:24:44 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:52111)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lKkad-00053A-HC
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 11:24:40 -0500
Received: by mail-wm1-x32b.google.com with SMTP id l19so4151398wmh.1
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 08:24:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QfMWHYEE2mBNNhjNUaW8YRhjOJTj8OsnuYK4a3Lc2Rw=;
 b=JSWLgxpDD7tFO4Ixc7eJ8zhmbjT54WcX4ieElh5+NgwS15l1yZfcZRrHCKHLWQ6FCD
 B5uelaUMy4+wIcLF82SYVzPpQMH4yRPoWJYaogVFapq8aeYcW9TMXAIUnDOWSczhq039
 5B1io3f6AajPvVooZhADwNLYKHt32jGo6d8rkZaTPSA2wkLrQCLqYSANe1S4SCqS5NhW
 Ui7Kef7ED5XNSctBTJ+P+SWI6Ioxk2Hv4ov9G31vlMTe4fYfQi9a+Ed3y3dEg1c3IvRR
 Cpue8OXjCouU/pmE8hIcaAPVl60W3ptv9XMwmFKe8ll/Rs6oLv0ldnMP36WnybLmIQRL
 vt0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=QfMWHYEE2mBNNhjNUaW8YRhjOJTj8OsnuYK4a3Lc2Rw=;
 b=EqfEfrXU1B65GIdoMX13PFO262nSjW+iVfUq4c3ae05sO1FsPVsCGi+X1eWf3aEET3
 zXvl+RbhlXRhGzw4A8ldiPLiQmDcKxroKX8ax28uL7xZxrHdfoEyuJXi7RE3V4eJa/kt
 z2ooIGB6DPRZRAIs9b8WW21n3h0AMjs/wNB+h2WLdsrte/QAxX2WEkGsNdxu/OmSpL5F
 WeQXeCalhrKhyEgy0SD1Xk2UshJedZp6syc6zTaMdx7+7Lcy5ekCjKFW6CBBvW5b8X8l
 pt0QFw+5MepShOKKD2EDVXFTAAxvyzV+tl8zuXrNwbr7XJpV/VngQhZYaM/Mz2N8++3U
 aYUw==
X-Gm-Message-State: AOAM532skTxxDeB0xlJx7QN7jRifHTou8MPaskMPqNQk/0huyzHfV6xV
 mngkhiVHWbvbxzW3YuBU6UQBaGd1EjU=
X-Google-Smtp-Source: ABdhPJyapQ+C6Ahsaq2Vm06yE25ECCEa6qxmwrkCz7xRezOLZ9qpWLofCiaqprB6tiJvF2ZmbZ7yJw==
X-Received: by 2002:a7b:cd04:: with SMTP id f4mr13895900wmj.76.1615566276955; 
 Fri, 12 Mar 2021 08:24:36 -0800 (PST)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id h20sm2501681wmp.38.2021.03.12.08.24.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Mar 2021 08:24:36 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/5] target/mips: Reintroduce the R5900 CPU
Date: Fri, 12 Mar 2021 17:24:29 +0100
Message-Id: <20210312162434.1869129-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
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
Cc: Fredrik Noring <noring@nocrew.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 "Maciej W . Rozycki" <macro@orcam.me.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I'm running out of time to address Richard's comments on the new=0D
opcodes, so let's KISS and only fix RDHWR (after adding LQ/SQ).=0D
=0D
Missing review: 3 & 5=0D
- target/mips/tx79: Move RDHWR usermode kludge to trans_SQ()=0D
- tests/tcg/mips: Test user mode DMULT for the R5900=0D
=0D
Based-on: mips-next=0D
Supersedes: <20210309145653.743937-1-f4bug@amsat.org>=0D
=0D
Fredrik Noring (1):=0D
  tests/tcg/mips: Test user mode DMULT for the R5900=0D
=0D
Philippe Mathieu-Daud=C3=A9 (4):=0D
  target/mips/tx79: Introduce LQ opcode (Load Quadword)=0D
  target/mips/tx79: Introduce SQ opcode (Store Quadword)=0D
  target/mips/tx79: Move RDHWR usermode kludge to trans_SQ()=0D
  target/mips: Reintroduce the R5900 CPU=0D
=0D
 target/mips/tx79.decode           | 12 ++++=0D
 target/mips/translate.c           | 72 +-----------------------=0D
 target/mips/tx79_translate.c      | 93 +++++++++++++++++++++++++++++++=0D
 tests/tcg/mips/test-r5900-dmult.c | 40 +++++++++++++=0D
 target/mips/cpu-defs.c.inc        | 59 ++++++++++++++++++++=0D
 tests/tcg/mips/Makefile.target    | 11 +++-=0D
 6 files changed, 214 insertions(+), 73 deletions(-)=0D
 create mode 100644 tests/tcg/mips/test-r5900-dmult.c=0D
=0D
-- =0D
2.26.2=0D
=0D

