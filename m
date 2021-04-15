Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F077361585
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 00:32:57 +0200 (CEST)
Received: from localhost ([::1]:37372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXAXg-0001LX-J6
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 18:32:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1lXATy-0007gE-SC; Thu, 15 Apr 2021 18:29:06 -0400
Received: from [201.28.113.2] (port=9244 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1lXATx-0007aM-Db; Thu, 15 Apr 2021 18:29:06 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Thu, 15 Apr 2021 18:41:41 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id D9BB8801328;
 Thu, 15 Apr 2021 18:41:40 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 0/3] tests/tcg/ppc64le: paddi tests
Date: Thu, 15 Apr 2021 18:41:35 -0300
Message-Id: <20210415214138.563795-1-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 15 Apr 2021 21:41:41.0372 (UTC)
 FILETIME=[1F371BC0:01D73240]
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
Cc: thuth@redhat.com, Matheus Ferst <matheus.ferst@eldorado.org.br>,
 gustavo.romero@protonmail.com, f4bug@amsat.org, wainersm@redhat.com,
 luis.pires@eldorado.org.br, qemu-ppc@nongnu.org, alex.bennee@linaro.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

Based-on: <20210413211129.457272-1-luis.pires@eldorado.org.br>

This series adds gcc-10 based images to enable the build of tests with Power10
instructions. Then two tests for paddi are added:
- The first one checks a weird behavior observed on POWER10 Functional Simulator
  1.1.0, where the 34-bit immediate is treated as a 32-bits one;
- The second one exercises the R=1 path of paddi, where CIA is used instead of RA.
  The test is failing with the current implementation because we use cpu_nip,
  which is not updated all the time. Luis already has the fix, it should be
  applied on the next version of his patch series.

The main reason to submit this patch as an RFC first is the docker part. I would
lie if I tell you that I understand half of what is going on there.
 - 'make docker-test-tcg' fails, but apparently on unrelated things;
 - 'make docker-run-test-tcg@debian-ppc64el-cross' passes, but it looks
   like the test is skipped?
 - 'make check-tcg' runs the test and passes (with the fix in place for the
   second).

Finally, get_maintainer.pl found no maintainers for
tests/tcg/ppc64{,le}/Makefile.target. Would it be Mr. Gibson?

Thanks,
Matheus K. Ferst

Matheus Ferst (3):
  tests/docker: gcc-10 based images for ppc64{,le} tests
  tests/tcg/ppc64le: load 33-bits constant with paddi
  tests/tcg/ppc64le: R=1 test for paddi

 tests/docker/Makefile.include                 |  4 +++
 .../debian-ppc64-test-cross.docker            | 13 ++++++++++
 .../debian-ppc64el-test-cross.docker          | 17 ++++++++++++
 tests/tcg/configure.sh                        | 12 ++++++---
 tests/tcg/ppc64/Makefile.target               |  6 +++++
 tests/tcg/ppc64le/Makefile.target             |  6 +++++
 tests/tcg/ppc64le/pla.c                       | 26 +++++++++++++++++++
 tests/tcg/ppc64le/pli_33bits.c                | 22 ++++++++++++++++
 8 files changed, 102 insertions(+), 4 deletions(-)
 create mode 100644 tests/docker/dockerfiles/debian-ppc64-test-cross.docker
 create mode 100644 tests/docker/dockerfiles/debian-ppc64el-test-cross.docker
 create mode 100644 tests/tcg/ppc64le/pla.c
 create mode 100644 tests/tcg/ppc64le/pli_33bits.c

-- 
2.25.1


