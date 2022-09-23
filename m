Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90BD15E8131
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 19:56:51 +0200 (CEST)
Received: from localhost ([::1]:56396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obmuw-000352-Ix
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 13:56:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1obmdW-0002q4-I2
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 13:38:50 -0400
Received: from rev.ng ([5.9.113.41]:51081)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1obmdP-0000AF-65
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 13:38:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date
 :Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0kfzlQwmDo7ELDhWEAzxsI8gbCijGf8vBYK48zyTuOQ=; b=TFprtPQsLZmrTlmTEXl4UINh3X
 rD/PuXb+Rjmaf8oSB3IOpoDC5qd3sxqanGY+/e+rUGvlnW5Sxzn5ew/Ma2EsxAitWnxcv3hubggz7
 /ih+ZoNInERLB69/CTGpAiIfQBuaZH9Sfs5CCSpRqBS81mg7ywq25NZOayvxhyGBFBZk=;
To: qemu-devel@nongnu.org
Cc: ale@rev.ng, tsimpson@quicinc.com, bcain@quicinc.com, mlambert@quicinc.com,
 babush@rev.ng, nizzo@rev.ng, richard.henderson@linaro.org,
 alex.bennee@linaro.org
Subject: [PATCH v12 00/11] target/hexagon: introduce idef-parser
Date: Fri, 23 Sep 2022 19:38:20 +0200
Message-Id: <20220923173831.227551-1-anjo@rev.ng>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.9.113.41; envelope-from=anjo@rev.ng; helo=rev.ng
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Anton Johansson <anjo@rev.ng>
From:  Anton Johansson via <qemu-devel@nongnu.org>

This patchset introduces the idef-parser for target/hexagon.

It's the twelfth iteration of the patchset and includes fixes suggested
in previous iterations.

idef-parser is a build-time tool built using flex and bison. Its aim
is to generate a large part of the tiny code generator frontend for
Hexagon. The prototype of idef-parser has been presented at KVM Forum
2019 ("QEMU-Hexagon: Automatic Translation of the ISA Manual Pseudocode
to Tiny Code Instructions"):

    https://www.youtube.com/watch?v=3EpnTYBOXCI

target/hexagon/idef-parser/README.rst provides an overview of the
parser and its inner working.

Main changes in v12:

* Patches 8, 9, and 10 which introduce flex, bison, and native glib2
  to the dockerfiles, have been dropped. These patches will instead be
  included in Alex's testing/next PR. Therefore, this patchset should
  not be pulled until our CI changes in testing/next are merged.

* :mem_noshuf is now dealt with in the 9th patch by emitting a
  process_store(...) when dealing with LOAD_CANCEL.

A couple of notes:

* These commits build successfully on the CI (including using clang),
  with one notable exception. Presently, the build-user-hexagon job
  fails due to not being able to find flex/bison. This is due to
  the debian-hexagon-cross container not being built by the CI.

  As such the debian-hexagon-cross container will have to be manually
  rebuilt before merging.

* checkpatch.pl complains about the _Generic macro OUT_IMPL in
  idef-parser/parser-helpers.h which we believe to be correctly
  formatted. The complaints concern the `:` in the type "labels" of the
  macro, and also the `default:` label.

Alessandro Di Federico (4):
  target/hexagon: update MAINTAINERS for idef-parser
  target/hexagon: import README for idef-parser
  target/hexagon: prepare input for the idef-parser
  target/hexagon: call idef-parser functions

Anton Johansson (1):
  target/hexagon: import parser for idef-parser

Niccolò Izzo (2):
  target/hexagon: introduce new helper functions
  target/hexagon: import additional tests

Paolo Montesel (4):
  target/hexagon: make slot number an unsigned
  target/hexagon: make helper functions non-static
  target/hexagon: expose next PC in DisasContext
  target/hexagon: import lexer for idef-parser

 MAINTAINERS                                 |    9 +
 meson_options.txt                           |    3 +
 target/hexagon/README                       |    5 +
 target/hexagon/gen_helper_funcs.py          |   17 +-
 target/hexagon/gen_helper_protos.py         |   17 +-
 target/hexagon/gen_idef_parser_funcs.py     |  128 +
 target/hexagon/gen_tcg_funcs.py             |   41 +-
 target/hexagon/genptr.c                     |  243 +-
 target/hexagon/genptr.h                     |   46 +
 target/hexagon/hex_common.py                |   10 +
 target/hexagon/idef-parser/README.rst       |  722 ++++++
 target/hexagon/idef-parser/idef-parser.h    |  253 ++
 target/hexagon/idef-parser/idef-parser.lex  |  471 ++++
 target/hexagon/idef-parser/idef-parser.y    |  965 ++++++++
 target/hexagon/idef-parser/macros.inc       |  140 ++
 target/hexagon/idef-parser/parser-helpers.c | 2360 +++++++++++++++++++
 target/hexagon/idef-parser/parser-helpers.h |  376 +++
 target/hexagon/idef-parser/prepare          |   24 +
 target/hexagon/macros.h                     |   11 +-
 target/hexagon/meson.build                  |  158 +-
 target/hexagon/op_helper.c                  |   29 +-
 target/hexagon/op_helper.h                  |   37 +
 target/hexagon/translate.c                  |    3 +-
 target/hexagon/translate.h                  |    1 +
 tests/tcg/hexagon/Makefile.target           |   28 +-
 tests/tcg/hexagon/crt.S                     |   14 +
 tests/tcg/hexagon/test_abs.S                |   17 +
 tests/tcg/hexagon/test_bitcnt.S             |   40 +
 tests/tcg/hexagon/test_bitsplit.S           |   22 +
 tests/tcg/hexagon/test_call.S               |   64 +
 tests/tcg/hexagon/test_clobber.S            |   29 +
 tests/tcg/hexagon/test_cmp.S                |   31 +
 tests/tcg/hexagon/test_dotnew.S             |   38 +
 tests/tcg/hexagon/test_ext.S                |   13 +
 tests/tcg/hexagon/test_fibonacci.S          |   30 +
 tests/tcg/hexagon/test_hl.S                 |   16 +
 tests/tcg/hexagon/test_hwloops.S            |   19 +
 tests/tcg/hexagon/test_jmp.S                |   22 +
 tests/tcg/hexagon/test_lsr.S                |   36 +
 tests/tcg/hexagon/test_mpyi.S               |   17 +
 tests/tcg/hexagon/test_packet.S             |   29 +
 tests/tcg/hexagon/test_reorder.S            |   33 +
 tests/tcg/hexagon/test_round.S              |   29 +
 tests/tcg/hexagon/test_vavgw.S              |   31 +
 tests/tcg/hexagon/test_vcmpb.S              |   30 +
 tests/tcg/hexagon/test_vcmpw.S              |   30 +
 tests/tcg/hexagon/test_vlsrw.S              |   20 +
 tests/tcg/hexagon/test_vmaxh.S              |   35 +
 tests/tcg/hexagon/test_vminh.S              |   35 +
 tests/tcg/hexagon/test_vpmpyh.S             |   28 +
 tests/tcg/hexagon/test_vspliceb.S           |   31 +
 51 files changed, 6748 insertions(+), 88 deletions(-)
 create mode 100644 target/hexagon/gen_idef_parser_funcs.py
 create mode 100644 target/hexagon/idef-parser/README.rst
 create mode 100644 target/hexagon/idef-parser/idef-parser.h
 create mode 100644 target/hexagon/idef-parser/idef-parser.lex
 create mode 100644 target/hexagon/idef-parser/idef-parser.y
 create mode 100644 target/hexagon/idef-parser/macros.inc
 create mode 100644 target/hexagon/idef-parser/parser-helpers.c
 create mode 100644 target/hexagon/idef-parser/parser-helpers.h
 create mode 100755 target/hexagon/idef-parser/prepare
 create mode 100644 target/hexagon/op_helper.h
 create mode 100644 tests/tcg/hexagon/crt.S
 create mode 100644 tests/tcg/hexagon/test_abs.S
 create mode 100644 tests/tcg/hexagon/test_bitcnt.S
 create mode 100644 tests/tcg/hexagon/test_bitsplit.S
 create mode 100644 tests/tcg/hexagon/test_call.S
 create mode 100644 tests/tcg/hexagon/test_clobber.S
 create mode 100644 tests/tcg/hexagon/test_cmp.S
 create mode 100644 tests/tcg/hexagon/test_dotnew.S
 create mode 100644 tests/tcg/hexagon/test_ext.S
 create mode 100644 tests/tcg/hexagon/test_fibonacci.S
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
 create mode 100644 tests/tcg/hexagon/test_vlsrw.S
 create mode 100644 tests/tcg/hexagon/test_vmaxh.S
 create mode 100644 tests/tcg/hexagon/test_vminh.S
 create mode 100644 tests/tcg/hexagon/test_vpmpyh.S
 create mode 100644 tests/tcg/hexagon/test_vspliceb.S

--
2.37.3

