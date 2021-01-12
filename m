Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF83E2F2638
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 03:22:35 +0100 (CET)
Received: from localhost ([::1]:55744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kz9KM-0001qm-DW
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 21:22:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kz9I5-0000LO-HU
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 21:20:13 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:39797)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kz9I3-0001ww-5w
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 21:20:12 -0500
Received: by mail-pj1-x102b.google.com with SMTP id u4so701630pjn.4
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 18:20:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=hMdeLTIobVnnFr9an+png7iZnBio6LlQbfnOtAaUd5s=;
 b=HMdToB8flngDEnJmgDkpcQPlVD6bSsqZTVHg6/N1wIp27aVEXrO35jqj0fdOlqAF0l
 eaGlbZ2WDouVJx6D4fyFO8kIpfLRnYVaaaQ2f68uDSzPEau6U6goFqp/2jLcAi18Ophw
 ce5didCEfTBk+NWk+mom31CWc+QA+RnzTFGqCMCLE+sIrEGkfua5WKHVB05sCyvDrUKm
 BWxRjh8UNzGYrCZ+OGjy0k5BELcKxTnmDDPUOW5aWS4WCmJSmlmYkrCkfuzj86XTDs0b
 uO5nU/MmsecoX/dCybkjp/773n2uV7l9hotY89ruKmVG4awPEnKwc/GzrfM4D5o1TSa5
 nZ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=hMdeLTIobVnnFr9an+png7iZnBio6LlQbfnOtAaUd5s=;
 b=JPOVa6mIlY0U3c1M8gsbQtQ5i1K+rfZkOMxUHrh5Lsq8iuzYUjVdLPLLEhfCbz2Oxx
 w8KLsk4YG24OVScBAzMEyTTjQ2Z/4NlJU/TVZrafCXbbymXxI9O1G5GiQhCh6TwyZL9F
 rRdCxWoRcL6gyS91wmGTqiWgh4ipl9exlplPeoFC/1UmEZRk5mrovTAdmsVYomo+QV6G
 3yet29WMrcNxQPIlhGz9wjw4SUsMUeBVHcgoqwOY603NIzmYDIo5ONHNvw+jNceaMKge
 dQBzn77tJA7Cm2ZSITglJpvYVQanXHKGQJkln+EPFM9KhOpmW9Z7u9WE2vEDF37ZB0Id
 cJzQ==
X-Gm-Message-State: AOAM5326uY9X9Uzi9cH4SIuq5UXA08It56ZvwOAIZUk6J0KFhxF/uBsU
 zRvkkPMTVoBOI+yWHc6guF2KAv3aPpj75zrd
X-Google-Smtp-Source: ABdhPJwkBaB4m2eIVn/p00C7QCXjdeJt1NCPxUu3sAnzsHb3w+OmsI+1JkwYWCoy4qnq8jW6hsjp9g==
X-Received: by 2002:a17:90a:f00f:: with SMTP id
 bt15mr1934827pjb.209.1610418008923; 
 Mon, 11 Jan 2021 18:20:08 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id x14sm981326pfp.77.2021.01.11.18.20.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 18:20:08 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [RFC v3 00/16] support subsets of bitmanip extension
Date: Tue, 12 Jan 2021 10:19:41 +0800
Message-Id: <20210112022001.20521-1-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Frank Chang <frank.chang@sifive.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

This patchset implements RISC-V B-extension 0.93 version Zbb, Zbs and
Zba subset instructions. Some Zbp instructions are also implemented as
they have similar behavior with their Zbb-, Zbs- and Zba-family
instructions or for Zbb pseudo instructions (e.g. rev8, orc.b).

Specification:
https://github.com/riscv/riscv-bitmanip/blob/master/bitmanip-0.93.pdf

The port is available here:
https://github.com/sifive/qemu/tree/rvb-upstream-v3

To test rvb implementation, specify cpu argument with 'x-b=true' to
enable B-extension support.

Changelog:

v3:
 * Convert existing immediate shift instructions to use gen_shifti()
   and gen_shiftiw() interfaces.
 * Rename *u.w instructions to *.uw.
 * Rename sb* instructions to b*.
 * Rename pcnt* instructions to cpop*.

v2:
 * Add gen_shifti(), gen_shiftw(), gen_shiftiw() helper functions.
 * Remove addwu, subwu and addiwu instructions as they are not longer
   exist in latest draft.
 * Optimize implementation with cleaner tcg ops.

Frank Chang (4):
  target/riscv: rvb: count bits set
  target/riscv: add gen_shifti() and gen_shiftiw() helper functions
  target/riscv: rvb: generalized reverse
  target/riscv: rvb: generalized or-combine

Kito Cheng (12):
  target/riscv: reformat @sh format encoding for B-extension
  target/riscv: rvb: count leading/trailing zeros
  target/riscv: rvb: logic-with-negate
  target/riscv: rvb: pack two words into one register
  target/riscv: rvb: min/max instructions
  target/riscv: rvb: sign-extend instructions
  target/riscv: rvb: single-bit instructions
  target/riscv: rvb: shift ones
  target/riscv: rvb: rotate (left/right)
  target/riscv: rvb: address calculation
  target/riscv: rvb: add/shift with prefix zero-extend
  target/riscv: rvb: support and turn on B-extension from command line

 target/riscv/bitmanip_helper.c          | 102 ++++++
 target/riscv/cpu.c                      |   4 +
 target/riscv/cpu.h                      |   2 +
 target/riscv/helper.h                   |   9 +
 target/riscv/insn32-64.decode           |  33 ++
 target/riscv/insn32.decode              |  54 ++-
 target/riscv/insn_trans/trans_rvb.c.inc | 415 ++++++++++++++++++++++++
 target/riscv/insn_trans/trans_rvi.c.inc |  45 +--
 target/riscv/meson.build                |   1 +
 target/riscv/translate.c                | 314 ++++++++++++++++++
 10 files changed, 932 insertions(+), 47 deletions(-)
 create mode 100644 target/riscv/bitmanip_helper.c
 create mode 100644 target/riscv/insn_trans/trans_rvb.c.inc

--
2.17.1


