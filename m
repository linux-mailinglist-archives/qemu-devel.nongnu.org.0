Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A554AF7F1
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 18:18:23 +0100 (CET)
Received: from localhost ([::1]:34100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHqbk-0002w6-OU
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 12:18:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1nHqNR-0005zM-IJ
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 12:03:33 -0500
Received: from rev.ng ([5.9.113.41]:41165)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1nHqNN-0004Wv-6Z
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 12:03:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date
 :Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fMpSNZ0wgdKjfNU5BB1Aim5/hnvEISojna0WSmJhpVA=; b=vzC+yYDZfWbCLYvSumX5u0t6AF
 dlhuasjgX6bIERQvxUpbs4XrzkT1kksIfBcqTjAR6TTE+Y4sseEwP+RsFJmk1sNwtU3sDuDt6I5lD
 Wl4P/iOpv4z2I/YMDfSGgNNr773h1Yk4uRWvziLzDW2N/vo4W+JGiO1rhMjYYZ7LR4pQ=;
To: qemu-devel@nongnu.org
Cc: ale@rev.ng, tsimpson@quicinc.com, bcain@quicinc.com, mlambert@quicinc.com,
 babush@rev.ng, nizzo@rev.ng, richard.henderson@linaro.org
Subject: [PATCH v8 00/12] target/hexagon: introduce idef-parser
Date: Wed,  9 Feb 2022 18:03:00 +0100
Message-Id: <20220209170312.30662-1-anjo@rev.ng>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.9.113.41; envelope-from=anjo@rev.ng; helo=rev.ng
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

It's the eight iteration of the patchset and includes fixes suggested in
previous iterations.

`idef-parser` is a build-time tool built using flex and bison. Its aim
is to generate a large part of the tiny code generator frontend for
Hexagon. The prototype of idef-parser has been presented at KVM Forum
2019 ("QEMU-Hexagon: Automatic Translation of the ISA Manual Pseudocode
to Tiny Code Instructions"):

    https://www.youtube.com/watch?v=3EpnTYBOXCI

`target/hexagon/idef-parser/README.rst` provides an overview of the
parser and its inner working.

A couple of notes:

* These commits build successfully on the CI (including using clang),
  with one notable exception. Presently, the `build-user-hexagon` job
  fails due to not being able to find `flex`. We believe this to be
  caused by `debian-hexagon-cross` not being built by the CI.

  As such the `debian-hexagon-cross` container will have to be manually
  rebuilt before merging.

* The eight patch, which introduces flex and bison as new build pre-
  requisites using `libvirt-ci` currently points to a fork, not yet
  merged upstream. This will have to be corrected before the final
  version of the patchset.

Alessandro Di Federico (4):
  target/hexagon: update MAINTAINERS for idef-parser
  target/hexagon: import README for idef-parser
  target/hexagon: prepare input for the idef-parser
  target/hexagon: call idef-parser functions

Anton Johansson (2):
  target/hexagon: import flex/bison to docker files
  target/hexagon: import parser for idef-parser

Niccolò Izzo (2):
  target/hexagon: introduce new helper functions
  target/hexagon: import additional tests

Paolo Montesel (4):
  target/hexagon: make slot number an unsigned
  target/hexagon: make helper functions non-static
  target/hexagon: expose next PC in DisasContext
  target/hexagon: import lexer for idef-parser

 .gitlab-ci.d/cirrus/freebsd-12.vars           |    2 +-
 .gitlab-ci.d/cirrus/freebsd-13.vars           |    2 +-
 .gitlab-ci.d/windows.yml                      |    2 +
 .gitmodules                                   |    3 +-
 MAINTAINERS                                   |    9 +
 meson_options.txt                             |    3 +
 target/hexagon/README                         |    5 +
 target/hexagon/gen_helper_funcs.py            |   17 +-
 target/hexagon/gen_helper_protos.py           |   17 +-
 target/hexagon/gen_idef_parser_funcs.py       |  125 +
 target/hexagon/gen_tcg_funcs.py               |   41 +-
 target/hexagon/genptr.c                       |  230 +-
 target/hexagon/genptr.h                       |   44 +
 target/hexagon/hex_common.py                  |   10 +
 target/hexagon/idef-parser/README.rst         |  722 +++++
 target/hexagon/idef-parser/idef-parser.h      |  254 ++
 target/hexagon/idef-parser/idef-parser.lex    |  566 ++++
 target/hexagon/idef-parser/idef-parser.y      | 1039 +++++++
 target/hexagon/idef-parser/macros.inc         |  140 +
 target/hexagon/idef-parser/parser-helpers.c   | 2551 +++++++++++++++++
 target/hexagon/idef-parser/parser-helpers.h   |  375 +++
 target/hexagon/idef-parser/prepare            |   24 +
 target/hexagon/macros.h                       |   11 +-
 target/hexagon/meson.build                    |  138 +-
 target/hexagon/op_helper.c                    |   29 +-
 target/hexagon/op_helper.h                    |   37 +
 target/hexagon/translate.c                    |    3 +-
 target/hexagon/translate.h                    |    1 +
 tests/docker/dockerfiles/alpine.docker        |    5 +-
 tests/docker/dockerfiles/centos8.docker       |    7 +-
 tests/docker/dockerfiles/debian-amd64.docker  |    2 +
 tests/docker/dockerfiles/debian-native.docker |    3 +
 .../dockerfiles/debian-riscv64-cross.docker   |    3 +
 .../dockerfiles/debian-tricore-cross.docker   |    1 +
 tests/docker/dockerfiles/debian10.docker      |    3 +
 .../dockerfiles/fedora-i386-cross.docker      |    3 +
 .../dockerfiles/fedora-win32-cross.docker     |    3 +
 .../dockerfiles/fedora-win64-cross.docker     |    3 +
 tests/docker/dockerfiles/fedora.docker        |    5 +-
 tests/docker/dockerfiles/opensuse-leap.docker |    7 +-
 tests/docker/dockerfiles/ubuntu1804.docker    |    7 +-
 tests/docker/dockerfiles/ubuntu2004.docker    |    7 +-
 tests/lcitool/libvirt-ci                      |    2 +-
 tests/lcitool/projects/qemu.yml               |    2 +
 tests/lcitool/refresh                         |    2 +-
 tests/tcg/hexagon/Makefile.target             |   28 +-
 tests/tcg/hexagon/crt.S                       |   14 +
 tests/tcg/hexagon/test_abs.S                  |   17 +
 tests/tcg/hexagon/test_bitcnt.S               |   40 +
 tests/tcg/hexagon/test_bitsplit.S             |   22 +
 tests/tcg/hexagon/test_call.S                 |   64 +
 tests/tcg/hexagon/test_clobber.S              |   29 +
 tests/tcg/hexagon/test_cmp.S                  |   31 +
 tests/tcg/hexagon/test_dotnew.S               |   38 +
 tests/tcg/hexagon/test_ext.S                  |   13 +
 tests/tcg/hexagon/test_fibonacci.S            |   30 +
 tests/tcg/hexagon/test_hl.S                   |   16 +
 tests/tcg/hexagon/test_hwloops.S              |   19 +
 tests/tcg/hexagon/test_jmp.S                  |   22 +
 tests/tcg/hexagon/test_lsr.S                  |   36 +
 tests/tcg/hexagon/test_mpyi.S                 |   17 +
 tests/tcg/hexagon/test_packet.S               |   29 +
 tests/tcg/hexagon/test_reorder.S              |   33 +
 tests/tcg/hexagon/test_round.S                |   29 +
 tests/tcg/hexagon/test_vavgw.S                |   31 +
 tests/tcg/hexagon/test_vcmpb.S                |   30 +
 tests/tcg/hexagon/test_vcmpw.S                |   30 +
 tests/tcg/hexagon/test_vlsrw.S                |   20 +
 tests/tcg/hexagon/test_vmaxh.S                |   35 +
 tests/tcg/hexagon/test_vminh.S                |   35 +
 tests/tcg/hexagon/test_vpmpyh.S               |   28 +
 tests/tcg/hexagon/test_vspliceb.S             |   31 +
 72 files changed, 7125 insertions(+), 107 deletions(-)
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
2.34.1


