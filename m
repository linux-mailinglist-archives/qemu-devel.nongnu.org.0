Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 240C756467C
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jul 2022 11:44:07 +0200 (CEST)
Received: from localhost ([::1]:52844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7w98-0004Di-9E
	for lists+qemu-devel@lfdr.de; Sun, 03 Jul 2022 05:44:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7vRq-0003eU-Gc
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 04:59:22 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:38435)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7vRo-00048N-Nt
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 04:59:22 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 89-20020a17090a09e200b001ef7638e536so2344962pjo.3
 for <qemu-devel@nongnu.org>; Sun, 03 Jul 2022 01:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oTKGpo4k1nelxM20A4Ut5wSWoWhFNq272y6n98pFD9w=;
 b=AAQz8GRBPbsaCbzTOXlPhm+XscXROeMZOOHQBOHfEGGoS8LDPq52fbePLxXassJnxA
 k4+0ScBUkelIEpg8IsIcajaN9Gv0D3slVrFifRszKl6640wxth9Bj+loyVHml/WFVeAl
 lVwpwWX65waqdauz+MLCwcfHnBkYidi9VyXvDfIs3YrlkDoaSMd8ECQpNnAzoM8BFa5k
 +Ah2ZLuhH7rqXdoQrd6ohzDTnEnjuceAMKFUEAlqqTDUA4i8bkRvbGC5QlGMxMGyzJu8
 tNbfP2DcdyuAQKaEhE3M1H7kqx5zqaoaj6wdhcmXKOPaizCUtOvz66zzCAqbAfUwBpdC
 CU3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oTKGpo4k1nelxM20A4Ut5wSWoWhFNq272y6n98pFD9w=;
 b=3Aa3QSmXKd+5VvAm1Jn61KeFNbPd3IBxYpNLjn5Woek2Bl/fsmHTEbbC3DtNg4iNjy
 czuNq6Ptxh+WVn2C6Bf/d0MMJ89F+9JFUZMxQ5WfKOOcVae8N1rH5TbgI5liOyPAmLoq
 JoxOvW6rrsc0C1w0VVsk1SC06//1kaHh/UGiLZw6L0CSTy4dHOMGQZqplQE/C1/eDoLI
 SCWzB0dol8ztaXMsJtKEOwAtyWro/SVp9gdnVXXmWapBdyjBtRjjpTIWZg272C1JDbVR
 c72jUtwJLsJe/DayVI7owb1CAZZ63HoIRF8WmuWymlB2JsEbaTpCdOCTNHwit4k2hY3I
 zExg==
X-Gm-Message-State: AJIora/Lj7OFTZAvcUt+aVC0zaV80H92MSfXknG582xTpFJ784rLBl02
 4GspbwdK136kB/s/X9GZtzwMWZkAFiXbEdBc
X-Google-Smtp-Source: AGRyM1snFVDs6roo3IsB48hYr9Rm5s7jsBVUDB7rsYxmwYpwJLwGRhC+bfTMUdD6RQayWXLi9FlVxw==
X-Received: by 2002:a17:90b:344f:b0:1ed:9f:a2de with SMTP id
 lj15-20020a17090b344f00b001ed009fa2demr29143470pjb.174.1656838759256; 
 Sun, 03 Jul 2022 01:59:19 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 cq16-20020a056a00331000b00518764d09cdsm18777593pfb.164.2022.07.03.01.59.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jul 2022 01:59:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu
Subject: [PATCH v21 00/13] Add LoongArch linux-user emulation support
Date: Sun,  3 Jul 2022 14:29:00 +0530
Message-Id: <20220703085913.772936-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Hi.  This is Song Gao's v20 [1], with patch 2 extensively rewritten
so that it handles lock_user properly.  It compiles, but I need
to update the docker image we produced last year so that I can
properly test this.

In the meantime, Song, can you please test this?


r~

[1] https://lore.kernel.org/qemu-devel/20220624031049.1716097-1-gaosong@loongson.cn/

Song Gao (13):
  linux-user: Add LoongArch generic header files
  linux-user: Add LoongArch signal support
  linux-user: Add LoongArch elf support
  linux-user: Add LoongArch syscall support
  linux-user: Add LoongArch cpu_loop support
  scripts: add loongarch64 binfmt config
  target/loongarch: remove badaddr from CPULoongArch
  target/loongarch: Fix missing update CSR_BADV
  target/loongarch: Fix helper_asrtle_d/asrtgt_d raise wrong exception
  target/loongarch: remove unused include hw/loader.h
  target/loongarch: Adjust functions and structure to support user-mode
  default-configs: Add loongarch linux-user support
  target/loongarch: Update README

 configs/targets/loongarch64-linux-user.mak    |   3 +
 linux-user/loongarch64/sockbits.h             |  11 +
 linux-user/loongarch64/syscall_nr.h           | 312 ++++++++++++++++
 linux-user/loongarch64/target_cpu.h           |  34 ++
 linux-user/loongarch64/target_elf.h           |  12 +
 linux-user/loongarch64/target_errno_defs.h    |  12 +
 linux-user/loongarch64/target_fcntl.h         |  11 +
 linux-user/loongarch64/target_prctl.h         |   1 +
 linux-user/loongarch64/target_resource.h      |  11 +
 linux-user/loongarch64/target_signal.h        |  13 +
 linux-user/loongarch64/target_structs.h       |  11 +
 linux-user/loongarch64/target_syscall.h       |  48 +++
 linux-user/loongarch64/termbits.h             |  11 +
 linux-user/syscall_defs.h                     |   6 +-
 target/loongarch/cpu.h                        |   8 +-
 target/loongarch/helper.h                     |   2 +
 target/loongarch/internals.h                  |   2 +
 linux-user/elfload.c                          |  91 +++++
 linux-user/loongarch64/cpu_loop.c             |  96 +++++
 linux-user/loongarch64/signal.c               | 335 ++++++++++++++++++
 target/loongarch/cpu.c                        |  34 +-
 target/loongarch/gdbstub.c                    |   2 +-
 target/loongarch/op_helper.c                  |  10 +-
 .../insn_trans/trans_privileged.c.inc         |  36 ++
 scripts/gensyscalls.sh                        |   2 +
 scripts/qemu-binfmt-conf.sh                   |   6 +-
 target/loongarch/README                       |  39 +-
 27 files changed, 1144 insertions(+), 15 deletions(-)
 create mode 100644 configs/targets/loongarch64-linux-user.mak
 create mode 100644 linux-user/loongarch64/sockbits.h
 create mode 100644 linux-user/loongarch64/syscall_nr.h
 create mode 100644 linux-user/loongarch64/target_cpu.h
 create mode 100644 linux-user/loongarch64/target_elf.h
 create mode 100644 linux-user/loongarch64/target_errno_defs.h
 create mode 100644 linux-user/loongarch64/target_fcntl.h
 create mode 100644 linux-user/loongarch64/target_prctl.h
 create mode 100644 linux-user/loongarch64/target_resource.h
 create mode 100644 linux-user/loongarch64/target_signal.h
 create mode 100644 linux-user/loongarch64/target_structs.h
 create mode 100644 linux-user/loongarch64/target_syscall.h
 create mode 100644 linux-user/loongarch64/termbits.h
 create mode 100644 linux-user/loongarch64/cpu_loop.c
 create mode 100644 linux-user/loongarch64/signal.c

-- 
2.34.1


