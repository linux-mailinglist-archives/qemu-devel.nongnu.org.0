Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18DAA698BA1
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 06:18:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSWeD-0002HF-9m; Thu, 16 Feb 2023 00:17:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.nowakowski@fungible.com>)
 id 1pSWeB-0002H3-U1
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 00:17:31 -0500
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcin.nowakowski@fungible.com>)
 id 1pSWeA-0002yY-Ah
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 00:17:31 -0500
Received: by mail-lf1-x12e.google.com with SMTP id v17so1388791lfd.7
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 21:17:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fungible.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OwHuytDDuhj+CV36/9EfGdu5fZuYXcdMcH/F4vgIz2M=;
 b=btfVlM41zsnE1MNBFhDSxqIWuD99htFXmimhnReGLVjRt5DgZaaP0E12VYcpf71a6J
 ORsaYIvrxVNTEQBL/RemMvTyjk+YypG9DUAyo2faU94brS83BsZTajq/CAWTI0CbgX46
 +UautgeSKx2FdGFFhbZhhrsLvx58iq8olIlcc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OwHuytDDuhj+CV36/9EfGdu5fZuYXcdMcH/F4vgIz2M=;
 b=wAl64xezCZdQLx5Z76gucbdAVorEDgfKOG0ZHInSLhzlG1/GPQmwVWU2GJ45s+ZU46
 uvdHw+dC0V29aPLqxQls59BGbj/dgjQZmB0RaiyswPemcYUhXA3pbNg8BSNeNA0uPFVG
 GnCTOuio0SL5iTeptqP6FND7xU9eJ0OBW5eQNBPAOKre0165YQHFluMkYjTDLyCxFIFS
 NCuA4YFvguVYOs5traeyEQm5bko+Z4qdCcuPHrk/TmohVsrVlCGI0sJIWIBAAzXWYPPE
 RMYIn+SPTjBZsVJgzSz/7WGQUM5DF9XNJ8KowsMb+/sUu2vpBf2bSSKS6P+Q3Hjopu/h
 sFUg==
X-Gm-Message-State: AO0yUKXxgyXcY9T8XZffFlQJTZssaHdPTLtzJOp52Dlz6AqzZVEkurMx
 Z2uq4b5inOiMLTz8OlK0qz1gVF4+2a8Es7g7
X-Google-Smtp-Source: AK7set+9p6wVvhAwm588Qf9osMDOl9yuvClh3iWTrmGBdZG3hmtJPMQ5JDHLCtu5MRZhn8R1yxHiZw==
X-Received: by 2002:ac2:59cf:0:b0:4cc:597b:583e with SMTP id
 x15-20020ac259cf000000b004cc597b583emr1238596lfn.55.1676524647781; 
 Wed, 15 Feb 2023 21:17:27 -0800 (PST)
Received: from WR-NOWAKOWSKI.fungible.local (77-255-255-121.adsl.inetia.pl.
 [77.255.255.121]) by smtp.gmail.com with ESMTPSA id
 s1-20020a19ad41000000b004b7033da2d7sm141278lfd.128.2023.02.15.21.17.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 21:17:27 -0800 (PST)
From: Marcin Nowakowski <marcin.nowakowski@fungible.com>
To: qemu-devel@nongnu.org
Cc: marcin.nowakowski@fungible.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
Subject: [PATCH v2 0/4] target/mips: misc microMIPS fixes
Date: Thu, 16 Feb 2023 06:17:13 +0100
Message-Id: <20230216051717.3911212-1-marcin.nowakowski@fungible.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12e;
 envelope-from=marcin.nowakowski@fungible.com; helo=mail-lf1-x12e.google.com
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

v2:
  - add reviewed-by to patch 1 & 2
  - add CP0.Config7.WII for P5600
  - new patch: add CP0.Config[4,5] for M14K(c)

Marcin Nowakowski (4):
  target/mips: fix JALS32/J32 instruction handling for microMIPS
  target/mips: fix SWM32 handling for micromips
  target/mips: implement CP0.Config7.WII bit support
  target/mips: set correct CP0.Config[4,5] values for M14K(c)

 target/mips/cpu-defs.c.inc    | 13 +++++++++++--
 target/mips/cpu.c             |  6 ++++--
 target/mips/cpu.h             |  1 +
 target/mips/tcg/ldst_helper.c |  4 ++--
 target/mips/tcg/translate.c   |  7 +++++++
 5 files changed, 25 insertions(+), 6 deletions(-)

-- 
2.25.1


