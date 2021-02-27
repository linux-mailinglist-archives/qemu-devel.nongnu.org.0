Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03E2F326F97
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Feb 2021 00:26:52 +0100 (CET)
Received: from localhost ([::1]:43702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lG8z5-0002Mi-F8
	for lists+qemu-devel@lfdr.de; Sat, 27 Feb 2021 18:26:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lG8xh-0001eh-2F
 for qemu-devel@nongnu.org; Sat, 27 Feb 2021 18:25:25 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:39746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lG8xf-00036i-FG
 for qemu-devel@nongnu.org; Sat, 27 Feb 2021 18:25:24 -0500
Received: by mail-pj1-x1029.google.com with SMTP id d2so8355688pjs.4
 for <qemu-devel@nongnu.org>; Sat, 27 Feb 2021 15:25:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7Qiav1V7NOWEgm/S3G9FTTXu0OD1xC4jdPU0NVWpcGc=;
 b=k4BMw6IEulh/snolh3Vdx8REq4KMiLI6uDbvsE/vWmk16bxDGPrIeF47/gYrmbTkP7
 ms14NJHi3CmQsdMn807mi+fO5pUNvS73dD4Zk+ASQY+7rDZuphvlXbb+Mu5Cj5oYv6a6
 AukjRW9RjA+lHlgt3pg6xCLcnBjoNTTZw8J2/u/fiqQLuZc7tN3Zyk9d63gL01Ny7FT3
 6TapDwgQv8F4J1s8ueSI80Dkg+j/q3VWbSFA7yugl2hYk2/OPpP/EgS9Cx4HnKeMOpAt
 9lLpBvAf1MLdR8QrHiySIEPkWIjW8iSPs+pyFeD+P62BeqoGmT8FuF+C0H6n1JzpBMXZ
 Qbxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7Qiav1V7NOWEgm/S3G9FTTXu0OD1xC4jdPU0NVWpcGc=;
 b=KhP8vu50TEqN3EdoeovucG/Xm/2d6WFzyJPUbgn0Gx+/gx0ragrmBMv2q11R+9wOz3
 kHITsWJ0IV0mRHD/1z9vSKzRTYOphQEVyFO3KvrKzM0ZlDqszVahYAGzfWtyacuxTqjo
 rvpAsvi7xG6XDpsm8AfUgjHnMt6ZSBMgRy4dNCu1Vez8lRCsQZ2wBLETzVmuyEfDL/K7
 9Mre0agtTWxUL37YS0LAOSY/XM/CzjfuEJ6AoVmo0PtX56+qkffP9IV/jt68BV9vQ3tS
 vmGXqo0e/G7ETIEc7wvpV0tXinRtaBSeQJSlcNXFVuTVGW+tXfej13Sd0bce00m+uTTm
 tcWg==
X-Gm-Message-State: AOAM532kw5yvnHx56rhjCgikSfYQmRLmu0vkhsLCCsq1EZzBJzFgWv2X
 skbDtq9cDe33LK4jtni0vBR/ASL8a1ZDqQ==
X-Google-Smtp-Source: ABdhPJygfIPeCDKsQ5Db/rpB/zsttRAY9AwT8UqYCfrtP7UDTAX/Nq+8O1WVMdfq38XV3/URsbBMhQ==
X-Received: by 2002:a17:902:369:b029:e4:9165:9a7c with SMTP id
 96-20020a1709020369b02900e491659a7cmr2974080pld.2.1614468320791; 
 Sat, 27 Feb 2021 15:25:20 -0800 (PST)
Received: from localhost.localdomain (174-21-84-25.tukw.qwest.net.
 [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id ha8sm8187516pjb.6.2021.02.27.15.25.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Feb 2021 15:25:20 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] Fix mips jazz vs constant TCGCPUOps
Date: Sat, 27 Feb 2021 15:25:17 -0800
Message-Id: <20210227232519.222663-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: f4bug@amsat.org, cfontana@suse.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We can implement the jazz behaviour with a flag on MIPSCPUClass,
rather than by adjusting the do_transaction_failed callback.


r~


Richard Henderson (2):
  target/mips: Fold jazz behaviour into mips_cpu_do_transaction_failed
  hw/core: Constify TCGCPUOps

 include/hw/core/cpu.h           |  2 +-
 target/mips/cpu-qom.h           |  3 +++
 hw/mips/jazz.c                  | 35 +++------------------------------
 target/alpha/cpu.c              |  2 +-
 target/arm/cpu.c                |  2 +-
 target/arm/cpu_tcg.c            |  2 +-
 target/avr/cpu.c                |  2 +-
 target/cris/cpu.c               |  4 ++--
 target/hexagon/cpu.c            |  2 +-
 target/hppa/cpu.c               |  2 +-
 target/i386/tcg/tcg-cpu.c       |  2 +-
 target/lm32/cpu.c               |  2 +-
 target/m68k/cpu.c               |  2 +-
 target/microblaze/cpu.c         |  2 +-
 target/mips/cpu.c               |  2 +-
 target/mips/op_helper.c         |  3 ++-
 target/moxie/cpu.c              |  2 +-
 target/nios2/cpu.c              |  2 +-
 target/openrisc/cpu.c           |  2 +-
 target/riscv/cpu.c              |  2 +-
 target/rx/cpu.c                 |  2 +-
 target/s390x/cpu.c              |  2 +-
 target/sh4/cpu.c                |  2 +-
 target/sparc/cpu.c              |  2 +-
 target/tilegx/cpu.c             |  2 +-
 target/tricore/cpu.c            |  2 +-
 target/unicore32/cpu.c          |  2 +-
 target/xtensa/cpu.c             |  2 +-
 target/ppc/translate_init.c.inc |  2 +-
 29 files changed, 35 insertions(+), 60 deletions(-)

-- 
2.25.1


