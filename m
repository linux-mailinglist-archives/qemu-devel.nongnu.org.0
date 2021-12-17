Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68E0C4786D3
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 10:14:22 +0100 (CET)
Received: from localhost ([::1]:41446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1my9Jl-0004R2-HY
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 04:14:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1my97k-0001Mw-2d
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 04:02:01 -0500
Received: from rev.ng ([5.9.113.41]:45727)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1my97d-0002AW-Qn
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 04:01:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date
 :Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RcmWAd0oSJFgHG08oejFtcVRFo9Y+tKRrwddDxbgC3Q=; b=V2XWanAd2ymD56BuMo5iRMnWlC
 g2UnUe48fnaP2mI9eCtsocI+vixCFAGeDIpDb8KoeQ+sSS9ejb34Ga9h/6sJrFhA2u5kMIv17xsWJ
 ng5Ev5y+kmL7+/dIEktbiStNukyz0HM4+wvd1GWSAWbPVR4k5dsKUtIPT8kTgMr3AIYs=;
To: qemu-devel@nongnu.org
Cc: ale@rev.ng, tsimpson@quicinc.com, bcain@quicinc.com, babush@rev.ng,
 nizzo@rev.ng, richard.henderson@linaro.org
Subject: [PATCH v7 00/13] target/hexagon: introduce idef-parser
Date: Fri, 17 Dec 2021 10:01:16 +0100
Message-Id: <20211217090129.23242-1-anjo@rev.ng>
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

It's the seventh iteration of the patchset and includes fixes suggested in
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

* Other than minor changes, tweaks, and cleanup, this patchset includes
  one change to the type system of idef-parser. Variables in the parser
  are no longer automatically typed, but we instead rely on declartions
  found inside `fHIDE(int var;)` macros in the input code.

* These commits build successfully on the CI (including using clang),
  with one notable exception. Presently, the `build-user-hexagon` job
  fails due to not being able to find `flex`. We believe this to be
  caused by `debian-hexagon-cross` not being built by the CI.

  Last patch, we also introduced a commit to make sure containers
  produced by the developer Docker registry (as opposed to the official
  one) is used. Otherwise, the changes we made to the containers would not
  take effect.

  However, as Daniel pointed out, our solution is a hack.
  Since this is a problem only for developers when introducing new
  dependencies for the containers, we might consider not merging the
  last patch at all. But it's required in order to get some success in
  testing on the CI it required.

  Help on these matters is appreciated.

Alessandro Di Federico (5):
  target/hexagon: update MAINTAINERS for idef-parser
  target/hexagon: import README for idef-parser
  target/hexagon: prepare input for the idef-parser
  target/hexagon: call idef-parser functions
  gitlab-ci: do not use qemu-project Docker registry

Anton Johansson (1):
  target/hexagon: import parser for idef-parser

Niccolò Izzo (2):
  target/hexagon: introduce new helper functions
  target/hexagon: import additional tests

Paolo Montesel (5):
  target/hexagon: make slot number an unsigned
  target/hexagon: make helper functions non-static
  target/hexagon: expose next PC in DisasContext
  target/hexagon: import flex/bison to docker files
  target/hexagon: import lexer for idef-parser

 .gitlab-ci.d/container-cross.yml              |    2 +-
 .gitlab-ci.d/container-template.yml           |    4 +-
 .gitlab-ci.d/windows.yml                      |    2 +
 MAINTAINERS                                   |   11 +-
 meson_options.txt                             |    3 +
 target/hexagon/README                         |    5 +
 target/hexagon/gen_helper_funcs.py            |   16 +-
 target/hexagon/gen_helper_protos.py           |   16 +-
 target/hexagon/gen_idef_parser_funcs.py       |  123 +
 target/hexagon/gen_tcg_funcs.py               |   39 +-
 target/hexagon/genptr.c                       |  229 +-
 target/hexagon/genptr.h                       |   44 +
 target/hexagon/helper.h                       |    2 +
 target/hexagon/hex_common.py                  |   10 +
 target/hexagon/idef-parser/README.rst         |  722 +++++
 target/hexagon/idef-parser/idef-parser.h      |  259 ++
 target/hexagon/idef-parser/idef-parser.lex    |  571 ++++
 target/hexagon/idef-parser/idef-parser.y      | 1064 +++++++
 target/hexagon/idef-parser/macros.inc         |  140 +
 target/hexagon/idef-parser/parser-helpers.c   | 2548 +++++++++++++++++
 target/hexagon/idef-parser/parser-helpers.h   |  379 +++
 target/hexagon/idef-parser/prepare            |   24 +
 target/hexagon/macros.h                       |   11 +-
 target/hexagon/meson.build                    |  137 +-
 target/hexagon/op_helper.c                    |   39 +-
 target/hexagon/op_helper.h                    |   37 +
 target/hexagon/translate.c                    |    3 +-
 target/hexagon/translate.h                    |    1 +
 tests/docker/dockerfiles/alpine.docker        |    2 +
 tests/docker/dockerfiles/centos8.docker       |    2 +
 tests/docker/dockerfiles/debian-amd64.docker  |    2 +
 tests/docker/dockerfiles/debian-native.docker |    3 +
 .../dockerfiles/debian-riscv64-cross.docker   |    3 +
 .../dockerfiles/debian-tricore-cross.docker   |    2 +
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
 73 files changed, 7353 insertions(+), 91 deletions(-)
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
2.33.1

