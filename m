Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB6706DC995
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Apr 2023 18:54:18 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1plulM-0003iI-Hd; Mon, 10 Apr 2023 12:53:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1plulJ-0003hT-WF
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 12:53:02 -0400
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1plulI-0007Io-EW
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 12:53:01 -0400
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-18447b9a633so3924129fac.7
 for <qemu-devel@nongnu.org>; Mon, 10 Apr 2023 09:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1681145579;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=w508CrB3oDkV8UYU+LPQv6kXFdaQIJvJRtv5f8FmnQ0=;
 b=Zhm/cgvSjTEvWL1IPWPggAsNoxHWBvWXR4rBLVyQ7tPhQOJHE+QbZ2XG7jHJo8Zqf0
 8+o7Z4wxd0gv5h3oWuCWsTMbBIISvwLQB9IoO3pavQOYeQtyIDJze6+tzaDAxxsIOtTH
 kZVqvfgscDOHAjwPNgHOVCdtRLF6Zj31R1SWBTlTcDCnyml4b3sBcv9XN0T/oIn5X4St
 S1OoxMBMuJZ8Ygq1r9FDAqrWMYu0hGvpdGsj3pYLL7dvxobMeyTy2qtOmpPifH7k1Pr9
 0657fVszwXG014/VoRW99mD76PoH4ol62AkUpJU2/TxqxHxuLt/nynlVUsVTaF+ghChs
 fIDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681145579;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=w508CrB3oDkV8UYU+LPQv6kXFdaQIJvJRtv5f8FmnQ0=;
 b=xCsQnCZifYv8dXm/sLJQZCW7UA56YenqfT3JZubEFVFyIY0dvV9i6K6IgtPbCSh361
 0/BBvdaHzAclef85Y0VCND5U+UN8BVzVfh3GUxsVyCmgCl6WKEyvDOamwU8dGB6rNvje
 SK2II1blymEkTZeAOs6ruCk9sUSND3wMQY/mmqkIFx/Hrcv4KylwtZutzos35zTGME15
 cYdP7xlhooUlOrRJJnxFqVoF4AGAwvV2hmRSYtGkJvJxGPwdyFUTgccoulrP/Jk3mDyn
 h7hY2biKbi/jn6tIdWVd1TgPP+XcN55BpMRgQ/fUu4vvVosMrw4GHNFOtdo1MnqNIiMi
 byiA==
X-Gm-Message-State: AAQBX9dx/9WF7HZW0K9nYQ2U2c+hJgUIg3wPkkaOyWdk1xZN/Kjvx6oC
 QKYIn/sXK8yRTOhQoeSLR/tlieDUgrMOCLiqBbk=
X-Google-Smtp-Source: AKy350YDdOnOofVfBvu2MDfSJYlHRBAJHZU9uqrrhyqgME7ipWQsoYE2Zhk8QxQNLsFqBx1z/YArOA==
X-Received: by 2002:a05:6870:a10b:b0:184:42a2:cad1 with SMTP id
 m11-20020a056870a10b00b0018442a2cad1mr2692358oae.44.1681145578830; 
 Mon, 10 Apr 2023 09:52:58 -0700 (PDT)
Received: from grind.. ([191.255.108.232]) by smtp.gmail.com with ESMTPSA id
 zq36-20020a0568718ea400b0017f647294f5sm4191896oab.16.2023.04.10.09.52.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Apr 2023 09:52:58 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 0/4] target/riscv: implement query-cpu-definitions
Date: Mon, 10 Apr 2023 13:52:47 -0300
Message-Id: <20230410165251.99107-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2c;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x2c.google.com
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

Hi,

This v2 contains a change suggested by Weiwei Li in patch 4. No
functional changes made from the previous version.

Changes from v1:
- patch 4:
  - use a common class_init() fn instead of one class fn per generic CPU
- v1 link: https://lists.gnu.org/archive/html/qemu-devel/2023-04/msg01266.html

Daniel Henrique Barboza (4):
  target/riscv: add CPU QOM header
  target/riscv: add query-cpy-definitions support
  target/riscv: add 'static' attribute of query-cpu-definitions
  target/riscv: make generic cpus not static

 qapi/machine-target.json      |  6 ++-
 target/riscv/cpu-qom.h        | 73 +++++++++++++++++++++++++++++++++++
 target/riscv/cpu.c            | 33 ++++++++++++++--
 target/riscv/cpu.h            | 46 +---------------------
 target/riscv/meson.build      |  3 +-
 target/riscv/riscv-qmp-cmds.c | 55 ++++++++++++++++++++++++++
 6 files changed, 164 insertions(+), 52 deletions(-)
 create mode 100644 target/riscv/cpu-qom.h
 create mode 100644 target/riscv/riscv-qmp-cmds.c

-- 
2.39.2


