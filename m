Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F8CC35E81D
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 23:18:48 +0200 (CEST)
Received: from localhost ([::1]:60314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWQQp-0001Dw-5v
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 17:18:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1lWQLy-0007Il-Qp; Tue, 13 Apr 2021 17:13:46 -0400
Received: from [201.28.113.2] (port=27024 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <luis.pires@eldorado.org.br>)
 id 1lWQLx-0007YY-3g; Tue, 13 Apr 2021 17:13:46 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Tue, 13 Apr 2021 18:13:41 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id EB8018011B4;
 Tue, 13 Apr 2021 18:13:40 -0300 (-03)
From: Luis Pires <luis.pires@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH 0/5] Base for adding PowerPC 64-bit instructions
Date: Tue, 13 Apr 2021 18:11:24 -0300
Message-Id: <20210413211129.457272-1-luis.pires@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 13 Apr 2021 21:13:41.0297 (UTC)
 FILETIME=[E0FC8210:01D730A9]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=luis.pires@eldorado.org.br; helo=outlook.eldorado.org.br
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
Cc: richard.henderson@linaro.org, f4bug@amsat.org,
 Luis Pires <luis.pires@eldorado.org.br>, lagarcia@br.ibm.com,
 bruno.larsen@eldorado.org.br, matheus.ferst@eldorado.org.br,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series provides the basic infrastructure for adding the new
32/64-bit instructions in Power ISA 3.1 to target/ppc.

It starts by changing decodetree.py to support 64-bit instructions
as well as custom variable-width instruction load functions.

Then it changes the target/ppc code to allow 32- and 64-bit instructions
to be decoded using decodetree, and finishes by adding the implementation
for 2 simple instructions to demonstrate the new approach:
- addi (replacing the legacy implementation)
- paddi (new)

Luis Pires (5):
  decodetree: Add support for 64-bit instructions
  decodetree: Fix empty input files for varinsnwidth
  decodetree: Allow custom var width load functions
  target/ppc: Base changes to allow 32/64-bit insns
  target/ppc: Implement paddi and replace addi insns

 docs/devel/decodetree.rst                  |   5 +-
 scripts/decodetree.py                      |  55 ++++--
 target/ppc/cpu.h                           |   1 +
 target/ppc/meson.build                     |   5 +
 target/ppc/ppc.decode                      |  26 +++
 target/ppc/translate.c                     | 206 +++++++++++++++------
 target/ppc/translate/fixedpoint-impl.c.inc |  26 +++
 7 files changed, 250 insertions(+), 74 deletions(-)
 create mode 100644 target/ppc/ppc.decode
 create mode 100644 target/ppc/translate/fixedpoint-impl.c.inc

-- 
2.25.1


