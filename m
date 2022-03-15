Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F8C4DA42F
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 21:45:56 +0100 (CET)
Received: from localhost ([::1]:42446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUE3H-00007Q-Sp
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 16:45:55 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nUE0e-0006PB-MM
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 16:43:12 -0400
Received: from [2a00:1450:4864:20::433] (port=35523
 helo=mail-wr1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nUE0c-0008Fe-SO
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 16:43:12 -0400
Received: by mail-wr1-x433.google.com with SMTP id r6so261080wrr.2
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 13:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WjoW4TuhrLDh3vJbD36hIEHEEGiSVoyg+GX+kjzhoEI=;
 b=KboKxyOIUCopYWDgAigdTqExkbNXpYShjD/bZX5N9r2fvO+G17d8vYG+95seS6gyeY
 mxgPtpy3lR3T9UwbUSSQu8GR24GHB54k46peKKypI2VB/4pGGNQ9cA/wK4Aatr3L9Ysm
 n9ya6KkCYdSNXTLgGsARqrpDkHF0KXx3yw16DdlY8heGzgGv3uWD4sKPIfnAd2hOb49O
 eTPOfrmrJSXzpGWboOcE5bRnsRJNaFozQKytGd0/MoxkDOPEYceekV7lD42nxOmeAL4z
 5fE7/CPDjRIQedwW7TTC1whknIj9MpQftPxAVri1chsp+prbNDsGV3Pb7U01TusCKdkd
 LsuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WjoW4TuhrLDh3vJbD36hIEHEEGiSVoyg+GX+kjzhoEI=;
 b=bL6ulyrRV/Lnfp4plVRQdKOz4bkkThV7GvVctSDIut+l/uaYj0M1fN0ioH1Uh/aQ59
 ovm2E2OC22zKt1Yj/8qlVi2e62IzHMeqiliL39LQwpYGsBxKAIaSOgAA+xkeYTBf//2l
 YAdywzheILZrLpIyGzCsRJBVkvRoI1V91us4RN+8Pc71s8dN265yisaWP7hlnHPPeIbv
 YzYjLH1uzVcFuR52ILA2DnmmhHYWWiz4LT6ipbP+hshclRO5jXx52Q3CQh1tXvJkM3uo
 eQtihV+dfpAKjkZad/3grjySwn2AxcZHRguzFSB5PUh9WUULYDMZi8LZT+56qh0e6bSE
 tduw==
X-Gm-Message-State: AOAM532ubZSLPj3xU3JOO3ckeqP7fT3eLDocNzUqeZ1UFFR80iMk642h
 EbyqttcpzxjueQG5pIlcVBRgnQ==
X-Google-Smtp-Source: ABdhPJyT2SEmyCuEeOLVmhaJ0sHmZM0uH/S0xRh49RKWP1wJdoZBKkVowP3uW0UFCCrh6ros2sP+xw==
X-Received: by 2002:a05:6000:16ca:b0:1f1:dfd6:723d with SMTP id
 h10-20020a05600016ca00b001f1dfd6723dmr21281905wrf.127.1647376988881; 
 Tue, 15 Mar 2022 13:43:08 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 h11-20020a05600c414b00b0038c6c3eaee9sm465208wmm.1.2022.03.15.13.43.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Mar 2022 13:43:08 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 0/2] target/arm: Improve M-profile exception logging
Date: Tue, 15 Mar 2022 20:43:04 +0000
Message-Id: <20220315204306.2797684-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::433
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Our current logging for M-profile exceptions has a couple of holes
which are particularly confusing for the case of an exception taken
immediately out of reset:
 * we don't log the initial PC/SP loaded from the vector table
 * we don't log the PC we load from the vector table when
   we take an exception
 * we don't log the address for i-side aborts

This case is quite common where the user has failed to provide a
vector table in their ELF file and QEMU thus loads garbage for the
initial PC. At the moment the logging looks like:

$ qemu-system-arm [...] -d in_asm,cpu,exec,int
Taking exception 3 [Prefetch Abort] on CPU 0
...with CFSR.IACCVIOL
...BusFault with BFSR.STKERR
...taking pending nonsecure exception 3
----------------
IN: 
0x20000558:  08000079  stmdaeq  r0, {r0, r3, r4, r5, r6}


After this patchset it looks like:

$ qemu-system-arm [...] -d in_asm,cpu,exec,int
Loaded reset SP 0x0 PC 0x0 from vector table
Loaded reset SP 0xd008f8df PC 0xf000bf00 from vector table
Taking exception 3 [Prefetch Abort] on CPU 0
...at fault address 0xf000bf00
...with CFSR.IACCVIOL
...BusFault with BFSR.STKERR
...taking pending nonsecure exception 3
...loading from element 3 of non-secure vector table at 0xc
...loaded new PC 0x20000558
----------------
IN: 
0x20000558:  08000079  stmdaeq  r0, {r0, r3, r4, r5, r6}

and I think it is somewhat clearer that we loaded a bogus
PC from the vector table at reset, faulted at that address,
loaded the HardFault entry point which was bogus but at
least readable, and started executing code from there.

The double-logging of the reset loads is the result of
the way we currently reset the CPU twice on QEMU startup.
If we ever manage to fix that silliness it'll go away.


(Patchset inspired by a stackexchange question:
https://stackoverflow.com/questions/71486314/loading-an-elf-file-into-qemu
)

thanks
-- PMM

Peter Maydell (2):
  target/arm: Log M-profile vector table accesses
  target/arm: Log fault address for M-profile faults

 target/arm/cpu.c      |  5 +++++
 target/arm/m_helper.c | 11 +++++++++++
 2 files changed, 16 insertions(+)

-- 
2.25.1


