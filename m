Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68FC73CF9C8
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 14:42:18 +0200 (CEST)
Received: from localhost ([::1]:54314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5p4j-0008UV-FI
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 08:42:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ale@rev.ng>) id 1m5otp-0004f8-Dz
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 08:31:01 -0400
Received: from rev.ng ([5.9.113.41]:54623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ale@rev.ng>) id 1m5oth-0004eS-7Z
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 08:31:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date
 :Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Xbc+zOAC6hh8CtaEiUikNGDWHyQJ/lXTgzuHjYaYR74=; b=oryQfFq0sa7Imh2X9ambw3+aZE
 KPwT9UTsqsGHroyeUAvclLvrb6QW3F8wqxln8Mng1hQ918AlJ571b95gYXW3zLPcyinhnMkkeZ0+9
 MUPMbSN7GOpBd9GEGh72ZkA2od0WDCNusMMPF5c5JEIIxOZPh1V4QlYgNApB1nPsd7D0=;
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, bcain@quicinc.com, babush@rev.ng, nizzo@rev.ng,
 richard.henderson@linaro.org, Alessandro Di Federico <ale@rev.ng>
Subject: [PATCH v6 00/12] target/hexagon: introduce idef-parser
Date: Tue, 20 Jul 2021 14:30:19 +0200
Message-Id: <20210720123031.1101682-1-ale.qemu@rev.ng>
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

It's the sixth iteration of the patchset and includes fixes suggested in
previous iterations.

`idef-parser` is a build-time tool built using flex and bison. Its aim
is to generate a large part of the tiny code generator frontend for
Hexagon. The prototype of idef-parser has been presented at KVM Forum
2019 ("QEMU-Hexagon: Automatic Translation of the ISA Manual Pseudcode
to Tiny Code Instructions"):

    https://www.youtube.com/watch?v=3EpnTYBOXCI

`target/hexagon/idef-parser/README.rst` provides an overview of the
parser and its inner working.

A couple of notes:

* Among other things, this commit ensures the signedness is always
  properly propagated and that memory safety tools (valgrind and various
  sanitizers) report no issues on the parser.
* We now also indent the generated C code using `indent`, if availble.
  This has no run-time effect, it's just to ease debugging.
* These commits build successfully on the CI (including using clang),
  with some exceptions.
  The build on the CI fails for the cross-i386-* jobs. This seems to be
  due to the fact that, despite we specified glib as a native
  dependency, meson still chooses the i386 bit version of the library,
  as opposed to the x86-64.
  We also introduced a commit to make sure containers produced by the
  developer Docker registry (as opposed to the official one) is
  used. Otherwise, the changes we made to the containers would not
  take effect.
  However, as Daniel pointed out, our solution is an hack.
  Since this is a problem only for developers when introducing new
  dependencies for the containers, we might consider not merging the
  last patch at all. But it's required in order to get some success in
  testing on the CI it required.
  Also, building debian-hexagon-cross still fails since it's not built
  by the CI by default.
  Help on these matters is appreciated.

Alessandro Di Federico (5):
  target/hexagon: update MAINTAINERS for idef-parser
  target/hexagon: import README for idef-parser
  target/hexagon: prepare input for the idef-parser
  target/hexagon: call idef-parser functions
  gitlab-ci: do not use qemu-project Docker registry

Niccolò Izzo (2):
  target/hexagon: introduce new helper functions
  target/hexagon: import additional tests

Paolo Montesel (5):
  target/hexagon: make slot number an unsigned
  target/hexagon: make helper functions non-static
  target/hexagon: expose next PC in DisasContext
  target/hexagon: import lexer for idef-parser
  target/hexagon: import parser for idef-parser

 target/hexagon/idef-parser/README.rst         |  447 +++
 target/hexagon/genptr.h                       |   43 +
 target/hexagon/idef-parser/idef-parser.h      |  258 ++
 target/hexagon/idef-parser/parser-helpers.h   |  346 +++
 target/hexagon/macros.h                       |   11 +-
 target/hexagon/op_helper.h                    |   37 +
 target/hexagon/translate.h                    |    1 +
 target/hexagon/genptr.c                       |  176 +-
 target/hexagon/idef-parser/parser-helpers.c   | 2396 +++++++++++++++++
 target/hexagon/op_helper.c                    |   29 +-
 target/hexagon/translate.c                    |    3 +-
 .gitlab-ci.d/container-cross.yml              |    2 +-
 .gitlab-ci.d/container-template.yml           |    4 +-
 MAINTAINERS                                   |    8 +
 target/hexagon/README                         |    5 +
 target/hexagon/gen_helper_funcs.py            |    5 +-
 target/hexagon/gen_helper_protos.py           |    5 +-
 target/hexagon/gen_idef_parser_funcs.py       |  114 +
 target/hexagon/gen_tcg_funcs.py               |   28 +-
 target/hexagon/hex_common.py                  |   10 +
 target/hexagon/idef-parser/idef-parser.lex    |  642 +++++
 target/hexagon/idef-parser/idef-parser.y      |  975 +++++++
 target/hexagon/idef-parser/macros.inc         |  153 ++
 target/hexagon/idef-parser/prepare            |   24 +
 target/hexagon/meson.build                    |  126 +-
 tests/docker/dockerfiles/alpine.docker        |    2 +
 tests/docker/dockerfiles/centos8.docker       |    2 +
 tests/docker/dockerfiles/debian-amd64.docker  |    2 +
 tests/docker/dockerfiles/debian10.docker      |    3 +
 .../dockerfiles/fedora-i386-cross.docker      |    3 +
 .../dockerfiles/fedora-win32-cross.docker     |    3 +
 .../dockerfiles/fedora-win64-cross.docker     |    3 +
 tests/docker/dockerfiles/fedora.docker        |    2 +
 tests/docker/dockerfiles/opensuse-leap.docker |    2 +
 tests/docker/dockerfiles/ubuntu.docker        |    3 +
 tests/docker/dockerfiles/ubuntu1804.docker    |    2 +
 tests/docker/dockerfiles/ubuntu2004.docker    |    2 +
 tests/tcg/hexagon/Makefile.target             |   30 +-
 tests/tcg/hexagon/crt.S                       |   26 +
 tests/tcg/hexagon/test_abs.S                  |   20 +
 tests/tcg/hexagon/test_bitcnt.S               |   42 +
 tests/tcg/hexagon/test_bitsplit.S             |   25 +
 tests/tcg/hexagon/test_call.S                 |   60 +
 tests/tcg/hexagon/test_clobber.S              |   35 +
 tests/tcg/hexagon/test_cmp.S                  |   34 +
 tests/tcg/hexagon/test_cmpy.S                 |   31 +
 tests/tcg/hexagon/test_dotnew.S               |   36 +
 tests/tcg/hexagon/test_ext.S                  |   16 +
 tests/tcg/hexagon/test_fibonacci.S            |   33 +
 tests/tcg/hexagon/test_hl.S                   |   19 +
 tests/tcg/hexagon/test_hwloops.S              |   22 +
 tests/tcg/hexagon/test_jmp.S                  |   25 +
 tests/tcg/hexagon/test_lsr.S                  |   39 +
 tests/tcg/hexagon/test_mpyi.S                 |   20 +
 tests/tcg/hexagon/test_overflow.S             |   63 +
 tests/tcg/hexagon/test_packet.S               |   26 +
 tests/tcg/hexagon/test_reorder.S              |   29 +
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
 67 files changed, 6753 insertions(+), 90 deletions(-)
 create mode 100644 target/hexagon/idef-parser/README.rst
 create mode 100644 target/hexagon/idef-parser/idef-parser.h
 create mode 100644 target/hexagon/idef-parser/parser-helpers.h
 create mode 100644 target/hexagon/op_helper.h
 create mode 100644 target/hexagon/idef-parser/parser-helpers.c
 create mode 100644 target/hexagon/gen_idef_parser_funcs.py
 create mode 100644 target/hexagon/idef-parser/idef-parser.lex
 create mode 100644 target/hexagon/idef-parser/idef-parser.y
 create mode 100644 target/hexagon/idef-parser/macros.inc
 create mode 100755 target/hexagon/idef-parser/prepare
 create mode 100644 tests/tcg/hexagon/crt.S
 create mode 100644 tests/tcg/hexagon/test_abs.S
 create mode 100644 tests/tcg/hexagon/test_bitcnt.S
 create mode 100644 tests/tcg/hexagon/test_bitsplit.S
 create mode 100644 tests/tcg/hexagon/test_call.S
 create mode 100644 tests/tcg/hexagon/test_clobber.S
 create mode 100644 tests/tcg/hexagon/test_cmp.S
 create mode 100644 tests/tcg/hexagon/test_cmpy.S
 create mode 100644 tests/tcg/hexagon/test_dotnew.S
 create mode 100644 tests/tcg/hexagon/test_ext.S
 create mode 100644 tests/tcg/hexagon/test_fibonacci.S
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
2.32.0


