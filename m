Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 067023F8A92
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 16:59:11 +0200 (CEST)
Received: from localhost ([::1]:52266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJGqT-0006yS-Gr
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 10:59:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mJGoj-0005aO-0s; Thu, 26 Aug 2021 10:57:21 -0400
Received: from [201.28.113.2] (port=34533 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mJGof-00062m-5C; Thu, 26 Aug 2021 10:57:19 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Thu, 26 Aug 2021 11:57:11 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id 64C42800930;
 Thu, 26 Aug 2021 11:57:11 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v3 0/2] target/ppc: Fix vector registers access in gdbstub for
 little-endian
Date: Thu, 26 Aug 2021 11:56:54 -0300
Message-Id: <20210826145656.2507213-1-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 26 Aug 2021 14:57:11.0835 (UTC)
 FILETIME=[A66266B0:01D79A8A]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, PDS_HP_HELO_NORDNS=0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org, philmd@redhat.com, richard.henderson@linaro.org,
 groug@kaod.org, Matheus Ferst <matheus.ferst@eldorado.org.br>,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

PPC gdbstub code has two possible swaps of the 64-bit elements of AVR
registers: in gdb_get_avr_reg/gdb_set_avr_reg (based on msr_le) and in
gdb_get_reg128/ldq_p (based on TARGET_WORDS_BIGENDIAN).

In softmmu, only the first is done, because TARGET_WORDS_BIGENDIAN is
always true. In user mode, both are being done, resulting in swapped
high and low doublewords of AVR registers in little-endian binaries.

We fix this by moving the first swap to ppc_maybe_bswap_register, which
already handles the endianness swap of each element's value in softmmu
and does nothing in user mode.

Based-on: <20210826141446.2488609-1-matheus.ferst@eldorado.org.br>

Matheus Ferst (2):
  include/qemu/int128.h: introduce bswap128s
  target/ppc: fix vector registers access in gdbstub for little-endian

 include/qemu/int128.h | 17 ++++++++++++++++-
 target/ppc/gdbstub.c  | 32 +++++++-------------------------
 2 files changed, 23 insertions(+), 26 deletions(-)

-- 
2.25.1


