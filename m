Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 203D3367F93
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 13:32:00 +0200 (CEST)
Received: from localhost ([::1]:55854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZXYt-0006OR-5r
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 07:31:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1lZXVA-0005Kj-On; Thu, 22 Apr 2021 07:28:08 -0400
Received: from [201.28.113.2] (port=22402 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1lZXV7-0003Oo-NM; Thu, 22 Apr 2021 07:28:07 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Thu, 22 Apr 2021 08:28:01 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id 29E13800BEE;
 Thu, 22 Apr 2021 08:28:01 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] tests/docker: tests/tcg/ppc64le: Newer toolchain to build
 tests for PowerISA v3.1 instructions
Date: Thu, 22 Apr 2021 08:27:52 -0300
Message-Id: <20210422112754.1099177-1-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 22 Apr 2021 11:28:01.0599 (UTC)
 FILETIME=[8DCFDCF0:01D7376A]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Matheus Ferst <matheus.ferst@eldorado.org.br>,
 gustavo.romero@protonmail.com, f4bug@amsat.org, qemu-ppc@nongnu.org,
 bruno.larsen@eldorado.org.br, alex.bennee@linaro.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

This series adds gcc-10 based images to enable the build of tests with Power10
instructions. Then, to put it to good use, a tests for the byte-reverse
instructions (implemented in 9d69cfa2faa7) is introduced.

v2:
- Unused images removed from tests/docker/Makefile.include,
  tests/docker/dockerfiles, and .gitlab-ci.d/containers.yml
- Nested ppc64-* and ppc64le-* cases in tests/tcg/configure.sh
- Fixed inline assembly usage and unused header removed from
  tests/tcg/ppc64le/byte_reverse.c

Matheus Ferst (2):
  tests/docker: gcc-10 based images for ppc64{,le} tests
  tests/tcg/ppc64le: tests for brh/brw/brd

 .gitlab-ci.d/containers.yml                   | 11 ++--------
 tests/docker/Makefile.include                 |  5 ++---
 .../dockerfiles/debian-powerpc-cross.docker   | 12 -----------
 .../debian-powerpc-test-cross.docker          | 17 +++++++++++++++
 .../dockerfiles/debian-ppc64-cross.docker     | 11 ----------
 tests/tcg/configure.sh                        | 20 +++++++++---------
 tests/tcg/ppc64/Makefile.target               |  7 +++++++
 tests/tcg/ppc64le/Makefile.target             |  7 +++++++
 tests/tcg/ppc64le/byte_reverse.c              | 21 +++++++++++++++++++
 9 files changed, 66 insertions(+), 45 deletions(-)
 delete mode 100644 tests/docker/dockerfiles/debian-powerpc-cross.docker
 create mode 100644 tests/docker/dockerfiles/debian-powerpc-test-cross.docker
 delete mode 100644 tests/docker/dockerfiles/debian-ppc64-cross.docker
 create mode 100644 tests/tcg/ppc64le/byte_reverse.c

-- 
2.25.1


