Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D725E3EDDBE
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 21:18:07 +0200 (CEST)
Received: from localhost ([::1]:37094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFi7a-0002R5-Ip
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 15:18:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mFi4w-0000Oe-4w; Mon, 16 Aug 2021 15:15:22 -0400
Received: from [201.28.113.2] (port=32515 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mFi4t-00046X-Gm; Mon, 16 Aug 2021 15:15:21 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Mon, 16 Aug 2021 16:14:15 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id 6C559801091;
 Mon, 16 Aug 2021 16:14:15 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH for-6.2 0/2] target/ppc: Fix vector registers access in
 gdbstub for little-endian
Date: Mon, 16 Aug 2021 16:13:14 -0300
Message-Id: <20210816191316.1163622-1-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 16 Aug 2021 19:14:15.0926 (UTC)
 FILETIME=[E7BA6960:01D792D2]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) BAYES_00=-1.9, PDS_HP_HELO_NORDNS=0.825,
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
Cc: peter.maydell@linaro.org, Matheus Ferst <matheus.ferst@eldorado.org.br>,
 richard.henderson@linaro.org, groug@kaod.org, david@gibson.dropbear.id.au
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

Matheus Ferst (2):
  include/qemu/int128.h: introduce bswap128s
  target/ppc: fix vector registers access in gdbstub for little-endian

 include/qemu/int128.h | 16 +++++++++++-----
 target/ppc/gdbstub.c  | 32 +++++++-------------------------
 2 files changed, 18 insertions(+), 30 deletions(-)

-- 
2.25.1


