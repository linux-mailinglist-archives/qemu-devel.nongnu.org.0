Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB9CA361088
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 18:55:17 +0200 (CEST)
Received: from localhost ([::1]:39270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lX5Gv-0002Ic-1Q
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 12:55:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ale@rev.ng>) id 1lX4xV-00049I-VK
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 12:35:14 -0400
Received: from rev.ng ([5.9.113.41]:48157)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ale@rev.ng>) id 1lX4xT-0006eH-F1
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 12:35:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date
 :Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4jTCkfq3XcmETgf3Ux1MMnW4upozSRxmg9Qhbb9pUa0=; b=nUYbtV2GYADN7fZeJWL6UfSV4N
 pg85OuzHlvtynHnlvsgtdDAcOBivg0Dq2iI9OA2xO83qAJBlbhfKu5IB1Sj38i449UOMwof7X1e3N
 2SIxWVdqY1LNo6o5Ls3IwCOI+zie3Q/EjfdxNycaCnoEUiqk3dZwiuDDJer9Di38YML4=;
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, bcain@quicinc.com, babush@rev.ng, nizzo@rev.ng,
 philmd@redhat.com, richard.henderson@linaro.org,
 Alessandro Di Federico <ale@rev.ng>
Subject: [PATCH v4 00/12] target/hexagon: introduce idef-parser
Date: Thu, 15 Apr 2021 18:34:43 +0200
Message-Id: <20210415163455.3839169-1-ale.qemu@rev.ng>
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

It's the fourth iteration of the patchset and includes fixes suggested
in previous iterations.

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
* The build on the CI fails for the cross-i386-* jobs. This seems to be
  due to the fact that, despite we specified glib as a native
  dependency, meson still chooses the i386 bit version of the library,
  as opposed to the x86-64.
  Help on this matter is appreciated.
  The `clang-user` build fails too, but seems to be due reasons not
  concerning this patchset.
* Unlike the last iteration of this patchset, we no longer use local
  temps, which were detrimental for performance. Now, in order to
  handle side effects in ternary operators, the parser keeps track of
  nested ternary operators and their conditions. We then exploit that
  information to turn the side effect itself into a `movcond`. This is
  done by emitting a series of `and` instructions on the nested
  ternary operator conditions.

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
 target/hexagon/genptr.c                       |  201 +-
 target/hexagon/genptr.h                       |   28 +
 target/hexagon/hex_common.py                  |   10 +
 target/hexagon/idef-parser/README.rst         |  447 ++++
 target/hexagon/idef-parser/idef-parser.h      |  254 ++
 target/hexagon/idef-parser/idef-parser.lex    |  611 +++++
 target/hexagon/idef-parser/idef-parser.y      |  947 +++++++
 target/hexagon/idef-parser/macros.inc         |  150 ++
 target/hexagon/idef-parser/parser-helpers.c   | 2374 +++++++++++++++++
 target/hexagon/idef-parser/parser-helpers.h   |  347 +++
 target/hexagon/idef-parser/prepare            |   24 +
 target/hexagon/macros.h                       |   11 +-
 target/hexagon/meson.build                    |   67 +-
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
 tests/tcg/hexagon/Makefile.target             |   36 +-
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
 tests/tcg/hexagon/test_overflow.S             |   63 +
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
 68 files changed, 6849 insertions(+), 89 deletions(-)
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
 create mode 100644 tests/tcg/hexagon/test_overflow.S
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


