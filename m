Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C09134EAD5
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Mar 2021 16:46:21 +0200 (CEST)
Received: from localhost ([::1]:43356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRFdL-0003V2-Vo
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 10:46:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ale@rev.ng>) id 1lRFVl-0003B8-6J
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 10:38:29 -0400
Received: from rev.ng ([5.9.113.41]:57211)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ale@rev.ng>) id 1lRFVa-0004v5-FL
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 10:38:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date
 :Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=iGr6aiyYFjM38FqsTnWP7M3QGx3dAbetHTD53eVQzFU=; b=qxUTH4bOeSrFvDqV+V63spEqnw
 5WL/mw7uFBjrVYRoCdtfuzddqOn+WKbNqVxUogDi+DrEUo4s9oAHskNb3CnaiG/YR7pRzvJu0Fn7b
 HiCZJ9PBmi7RVnCqOxOIp1IARemwrWuhGkkqkFNzVqaNPmYrX75Wyc2gECG/8EgYfyVk=;
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, bcain@quicinc.com, babush@rev.ng, nizzo@rev.ng,
 philmd@redhat.com, richard.henderson@linaro.org,
 Alessandro Di Federico <ale@rev.ng>
Subject: [PATCH v3 00/12] target/hexagon: introduce idef-parser
Date: Tue, 30 Mar 2021 16:37:38 +0200
Message-Id: <20210330143750.3037824-1-ale.qemu@rev.ng>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.9.113.41; envelope-from=ale@rev.ng; helo=rev.ng
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Alessandro Di Federico <ale.qemu@rev.ng>
From:  Alessandro Di Federico via <qemu-devel@nongnu.org>

From: Alessandro Di Federico <ale@rev.ng>

This patchset introduces the idef-parser for target/hexagon.

It's the third iteration of the patchset and includes fixes suggested
in the previous iteration.

`idef-parser` is a build-time tool built using flex and bison. Its aim
is to generate a large part of the tiny code generator frontend for
Hexagon. The prototype of idef-parser has been presented at KVM Forum
2019 ("QEMU-Hexagon: Automatic Translation of the ISA Manual Pseudcode
to Tiny Code Instructions"):

    https://www.youtube.com/watch?v=3EpnTYBOXCI

`target/hexagon/idef-parser/README.rst` provides an overview of the
parser and its inner working.

A couple of notes:

* `idef-parser` also supports certain things that are not used in the
  most recently submitted version of the "Hexagon patch
  series". However, they will be needed and stripping them out of the
  parser is quite a bit of work.
* checkpatch.pl complains on a single macro which has a trailing
  semi-colon, which is required.
* The build on the CI fails for the cross-i386-* jobs. This seems to be
  due to the fact that, despite we specified glib as a native
  dependency, meson still chooses the i386 bit version of the library,
  as opposed to the x86-64.
* This implementation no longer employs a conditional move to implement
  the ternary operator of the input language. We now employ proper
  control flow instructions (brcond). This is due to the fact that
  certain ternary expression have side effects. As a side effect, we had
  to switch from temporaries to local temporaries.

Alessandro Di Federico (5):
  tcg: expose TCGCond manipulation routines
  target/hexagon: update MAINTAINERS for idef-parser
  target/hexagon: import README for idef-parser
  target/hexagon: prepare input for the idef-parser
  target/hexagon: call idef-parser functions

Niccolò Izzo (2):
  target/hexagon: introduce new helper functions
  target/hexagon: import additional tests

Paolo Montesel (5):
  target/hexagon: make slot number an unsigned
  target/hexagon: make helper functions non-static
  target/hexagon: expose next PC in DisasContext
  target/hexagon: import lexer for idef-parser
  target/hexagon: import parser for idef-parser

 MAINTAINERS                                   |    8 +
 include/tcg/tcg-cond.h                        |  101 +
 include/tcg/tcg.h                             |   70 +-
 target/hexagon/README                         |    5 +
 target/hexagon/gen_idef_parser_funcs.py       |  114 +
 target/hexagon/gen_tcg_funcs.py               |   28 +-
 target/hexagon/genptr.c                       |  186 +-
 target/hexagon/genptr.h                       |   23 +
 target/hexagon/hex_common.py                  |   10 +
 target/hexagon/idef-parser/README.rst         |  447 ++++
 target/hexagon/idef-parser/idef-parser.h      |  240 ++
 target/hexagon/idef-parser/idef-parser.lex    |  611 +++++
 target/hexagon/idef-parser/idef-parser.y      |  940 +++++++
 target/hexagon/idef-parser/macros.inc         |  150 ++
 target/hexagon/idef-parser/parser-helpers.c   | 2230 +++++++++++++++++
 target/hexagon/idef-parser/parser-helpers.h   |  344 +++
 target/hexagon/idef-parser/prepare            |   24 +
 target/hexagon/macros.h                       |   11 +-
 target/hexagon/meson.build                    |   70 +-
 target/hexagon/translate.c                    |    3 +-
 target/hexagon/translate.h                    |    1 +
 tests/docker/dockerfiles/alpine.docker        |    2 +
 tests/docker/dockerfiles/centos7.docker       |    2 +
 tests/docker/dockerfiles/centos8.docker       |    2 +
 tests/docker/dockerfiles/debian10.docker      |    3 +
 .../dockerfiles/fedora-i386-cross.docker      |    3 +
 .../dockerfiles/fedora-win32-cross.docker     |    3 +
 .../dockerfiles/fedora-win64-cross.docker     |    3 +
 tests/docker/dockerfiles/fedora.docker        |    2 +
 tests/docker/dockerfiles/opensuse-leap.docker |    2 +
 tests/docker/dockerfiles/ubuntu.docker        |    3 +
 tests/docker/dockerfiles/ubuntu1804.docker    |    3 +
 tests/docker/dockerfiles/ubuntu2004.docker    |    5 +-
 tests/tcg/hexagon/Makefile.target             |   35 +-
 tests/tcg/hexagon/crt.S                       |   28 +
 tests/tcg/hexagon/test_abs.S                  |   20 +
 tests/tcg/hexagon/test_add.S                  |   20 +
 tests/tcg/hexagon/test_andp.S                 |   23 +
 tests/tcg/hexagon/test_bitcnt.S               |   42 +
 tests/tcg/hexagon/test_bitsplit.S             |   25 +
 tests/tcg/hexagon/test_call.S                 |   63 +
 tests/tcg/hexagon/test_clobber.S              |   35 +
 tests/tcg/hexagon/test_cmp.S                  |   34 +
 tests/tcg/hexagon/test_cmpy.S                 |   31 +
 tests/tcg/hexagon/test_djump.S                |   24 +
 tests/tcg/hexagon/test_dotnew.S               |   39 +
 tests/tcg/hexagon/test_dstore.S               |   29 +
 tests/tcg/hexagon/test_ext.S                  |   18 +
 tests/tcg/hexagon/test_fibonacci.S            |   33 +
 tests/tcg/hexagon/test_hello.S                |   21 +
 tests/tcg/hexagon/test_hl.S                   |   19 +
 tests/tcg/hexagon/test_hwloops.S              |   25 +
 tests/tcg/hexagon/test_jmp.S                  |   25 +
 tests/tcg/hexagon/test_lsr.S                  |   39 +
 tests/tcg/hexagon/test_mpyi.S                 |   20 +
 tests/tcg/hexagon/test_packet.S               |   26 +
 tests/tcg/hexagon/test_reorder.S              |   31 +
 tests/tcg/hexagon/test_round.S                |   31 +
 tests/tcg/hexagon/test_vavgw.S                |   33 +
 tests/tcg/hexagon/test_vcmpb.S                |   32 +
 tests/tcg/hexagon/test_vcmpw.S                |   29 +
 tests/tcg/hexagon/test_vcmpy.S                |   50 +
 tests/tcg/hexagon/test_vlsrw.S                |   23 +
 tests/tcg/hexagon/test_vmaxh.S                |   37 +
 tests/tcg/hexagon/test_vminh.S                |   37 +
 tests/tcg/hexagon/test_vpmpyh.S               |   30 +
 tests/tcg/hexagon/test_vspliceb.S             |   33 +
 67 files changed, 6599 insertions(+), 90 deletions(-)
 create mode 100644 include/tcg/tcg-cond.h
 create mode 100644 target/hexagon/gen_idef_parser_funcs.py
 create mode 100644 target/hexagon/idef-parser/README.rst
 create mode 100644 target/hexagon/idef-parser/idef-parser.h
 create mode 100644 target/hexagon/idef-parser/idef-parser.lex
 create mode 100644 target/hexagon/idef-parser/idef-parser.y
 create mode 100644 target/hexagon/idef-parser/macros.inc
 create mode 100644 target/hexagon/idef-parser/parser-helpers.c
 create mode 100644 target/hexagon/idef-parser/parser-helpers.h
 create mode 100755 target/hexagon/idef-parser/prepare
 create mode 100644 tests/tcg/hexagon/crt.S
 create mode 100644 tests/tcg/hexagon/test_abs.S
 create mode 100644 tests/tcg/hexagon/test_add.S
 create mode 100644 tests/tcg/hexagon/test_andp.S
 create mode 100644 tests/tcg/hexagon/test_bitcnt.S
 create mode 100644 tests/tcg/hexagon/test_bitsplit.S
 create mode 100644 tests/tcg/hexagon/test_call.S
 create mode 100644 tests/tcg/hexagon/test_clobber.S
 create mode 100644 tests/tcg/hexagon/test_cmp.S
 create mode 100644 tests/tcg/hexagon/test_cmpy.S
 create mode 100644 tests/tcg/hexagon/test_djump.S
 create mode 100644 tests/tcg/hexagon/test_dotnew.S
 create mode 100644 tests/tcg/hexagon/test_dstore.S
 create mode 100644 tests/tcg/hexagon/test_ext.S
 create mode 100644 tests/tcg/hexagon/test_fibonacci.S
 create mode 100644 tests/tcg/hexagon/test_hello.S
 create mode 100644 tests/tcg/hexagon/test_hl.S
 create mode 100644 tests/tcg/hexagon/test_hwloops.S
 create mode 100644 tests/tcg/hexagon/test_jmp.S
 create mode 100644 tests/tcg/hexagon/test_lsr.S
 create mode 100644 tests/tcg/hexagon/test_mpyi.S
 create mode 100644 tests/tcg/hexagon/test_packet.S
 create mode 100644 tests/tcg/hexagon/test_reorder.S
 create mode 100644 tests/tcg/hexagon/test_round.S
 create mode 100644 tests/tcg/hexagon/test_vavgw.S
 create mode 100644 tests/tcg/hexagon/test_vcmpb.S
 create mode 100644 tests/tcg/hexagon/test_vcmpw.S
 create mode 100644 tests/tcg/hexagon/test_vcmpy.S
 create mode 100644 tests/tcg/hexagon/test_vlsrw.S
 create mode 100644 tests/tcg/hexagon/test_vmaxh.S
 create mode 100644 tests/tcg/hexagon/test_vminh.S
 create mode 100644 tests/tcg/hexagon/test_vpmpyh.S
 create mode 100644 tests/tcg/hexagon/test_vspliceb.S

-- 
2.31.1


