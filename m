Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE846834A7
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 19:05:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMuxz-0007Yn-Ii; Tue, 31 Jan 2023 13:02:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1pMuxM-0007Bo-C2
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 13:02:08 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1pMuxJ-0000lX-AC
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 13:02:08 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 j32-20020a05600c1c2000b003dc4fd6e61dso6233263wms.5
 for <qemu-devel@nongnu.org>; Tue, 31 Jan 2023 10:02:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ibROdXvGInj/QQaIg5EL6BOybdUZjsL0Y8bNeX1NCnw=;
 b=nzxljNvFn31nUcfwKRVoPFJu+xodrF/OixQiN+timH2hR1p34KjULmh/ehowIGB756
 VSTRStEvTQhGnRc2Q/KGY4/UWyUXIdZfJC7jevgA5xZNpbdT7Zu/ai4Xt7V6zZqK4ARl
 DNTwbcri5F6+IIyYdRiQMAt1VI6BnbH8RnipFp6WnPxEfnyFFr3Au5P+M8E51gn6te3i
 cYS21qu/J85QKBOL7UHKflj1xssdzQ8y/mzSOAm/u7DxJWhNN6mbRK5fFBtxcR1h+cl8
 fqDPCiyjPP/c+eXSdn6YMghIU9LooZHZCqy3zT+WT+4+9EADxY/dFwsukZTlIpYtNhDH
 R5Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ibROdXvGInj/QQaIg5EL6BOybdUZjsL0Y8bNeX1NCnw=;
 b=pwWUbhKpj38L4U9t47fe/nA1/QSms7FFCt6U+ELgwe58ZZVZO69bUgz11h2dCL0qC5
 5xzQaYLz8GAI+SITme3mr0VsWZitkTZQQNpw9FS+y/7FXtdMh8hJ5yRBJCb2JmIfcgYu
 eY1ZEGQ4VM+mQQS1D3DVTFHyi6F/FkLP0xmmkFhGWrLIK/D3AyWz0kfDX1Sd2VE/OjXg
 WxIlDqAFhMEewK9yaolzijPv3s+LXv9SrODiQvfJxGoCAphhZTRMBm+AZVfmoRaraXFd
 uahxuBwp+qxzFaTwifWyk6x4vpcdPKyETuQTL/hNb20tHXAM5romnAGnr97QbgtWcgCc
 OdEA==
X-Gm-Message-State: AO0yUKVjaHbWmpfeJNROGomwTg4EnaE1j4020Axxw0Q1WxtNJX3i+jtp
 BWOga0JWvCeSpmFImD5PsZFA4A==
X-Google-Smtp-Source: AK7set/DbKIoVn0Owmhcw2uPYVA3qVc2BB0Yx15VIOM5V61qYIHcbAzK4ttlXwhNrwKa03KXsrb6wg==
X-Received: by 2002:a05:600c:54e5:b0:3dc:4f2c:c856 with SMTP id
 jb5-20020a05600c54e500b003dc4f2cc856mr12827581wmb.32.1675188122352; 
 Tue, 31 Jan 2023 10:02:02 -0800 (PST)
Received: from beast.fritz.box (62-178-148-172.cable.dynamic.surfer.at.
 [62.178.148.172]) by smtp.gmail.com with ESMTPSA id
 c17-20020adffb11000000b002bc8130cca7sm15453146wrr.23.2023.01.31.10.02.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Jan 2023 10:02:01 -0800 (PST)
From: Christoph Muellner <christoph.muellner@vrull.eu>
To: qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko.stuebner@vrull.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Kito Cheng <kito.cheng@sifive.com>,
 Cooper Qu <cooper.qu@linux.alibaba.com>,
 Lifang Xia <lifang_xia@linux.alibaba.com>,
 Yunhai Shang <yunhai@linux.alibaba.com>,
 Zhiwei Liu <zhiwei_liu@linux.alibaba.com>
Cc: =?UTF-8?q?Christoph=20M=C3=BCllner?= <christoph.muellner@vrull.eu>
Subject: [PATCH v4 00/14] Add support for the T-Head vendor extensions
Date: Tue, 31 Jan 2023 19:01:44 +0100
Message-Id: <20230131180158.2471047-1-christoph.muellner@vrull.eu>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=christoph.muellner@vrull.eu; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

From: Christoph Müllner <christoph.muellner@vrull.eu>

This series introduces support for the T-Head vendor extensions,
which are implemented e.g. in the XuanTie C906 and XuanTie C910:
* XTheadBa
* XTheadBb
* XTheadBs
* XTheadCmo
* XTheadCondMov
* XTheadFMemIdx
* XTheadFmv
* XTheadMac
* XTheadMemIdx
* XTheadMemPair
* XTheadSync

The xthead* extensions are documented here:
  https://github.com/T-head-Semi/thead-extension-spec/releases/latest

The "th." instruction prefix prevents future conflicts with standard
extensions and has been documentented in the RISC-V toolchain conventions:
  https://github.com/riscv-non-isa/riscv-toolchain-conventions

Note, that the T-Head vendor extensions do not contain all
vendor-specific functionality of the T-Head SoCs
(e.g. no vendor-specific CSRs are included).
Instead the extensions cover coherent functionality,
that is exposed to S and U mode.

To enable the extensions above, the following two methods are possible:
* add the extension to the arch string
  E.g. QEMU_CPU="any,xtheadcmo=true,xtheadsync=true"
* implicitly select the extensions via CPU selection
  E.g. QEMU_CPU="thead-c906"

Major changes in v2:
- Add ISA_EXT_DATA_ENTRY()s
- Use single decoder for XThead extensions
- Simplify a lot of translation functions
- Fix RV32 behaviour
- Added XTheadFmv
- Addressed all comments of v1

Major changes in v3:
- Drop XMAE patch
- Rename priv level test macros

Changes in v4:
- Address review comments from Richard Henderson

Christoph Müllner (14):
  RISC-V: Adding XTheadCmo ISA extension
  RISC-V: Adding XTheadSync ISA extension
  RISC-V: Adding XTheadBa ISA extension
  RISC-V: Adding XTheadBb ISA extension
  RISC-V: Adding XTheadBs ISA extension
  RISC-V: Adding XTheadCondMov ISA extension
  RISC-V: Adding T-Head multiply-accumulate instructions
  RISC-V: Adding T-Head MemPair extension
  RISC-V: Adding T-Head MemIdx extension
  RISC-V: Adding T-Head FMemIdx extension
  RISC-V: Set minimum priv version for Zfh to 1.11
  RISC-V: Add initial support for T-Head C906
  RISC-V: Adding XTheadFmv ISA extension
  target/riscv: add a MAINTAINERS entry for XThead* extension support

 MAINTAINERS                                |    8 +
 target/riscv/cpu.c                         |   55 +-
 target/riscv/cpu.h                         |   12 +
 target/riscv/cpu_vendorid.h                |    6 +
 target/riscv/helper.h                      |    1 +
 target/riscv/insn_trans/trans_xthead.c.inc | 1100 ++++++++++++++++++++
 target/riscv/meson.build                   |    1 +
 target/riscv/op_helper.c                   |    6 +
 target/riscv/translate.c                   |   31 +
 target/riscv/xthead.decode                 |  185 ++++
 10 files changed, 1404 insertions(+), 1 deletion(-)
 create mode 100644 target/riscv/cpu_vendorid.h
 create mode 100644 target/riscv/insn_trans/trans_xthead.c.inc
 create mode 100644 target/riscv/xthead.decode

-- 
2.39.1


