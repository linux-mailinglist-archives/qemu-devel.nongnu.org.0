Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38B253F6A4C
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 22:14:57 +0200 (CEST)
Received: from localhost ([::1]:34672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIcox-0002Iu-S9
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 16:14:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mIcnH-0000x0-W7; Tue, 24 Aug 2021 16:13:12 -0400
Received: from [201.28.113.2] (port=17263 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mIcnG-00064l-5T; Tue, 24 Aug 2021 16:13:11 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Tue, 24 Aug 2021 17:12:14 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id AAAB28010FC;
 Tue, 24 Aug 2021 17:12:13 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH 0/2] target/ppc: Fix vextu[bhw][lr]x on big endian hosts
Date: Tue, 24 Aug 2021 17:11:03 -0300
Message-Id: <20210824201105.2303789-1-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 24 Aug 2021 20:12:14.0077 (UTC)
 FILETIME=[542C22D0:01D79924]
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
Cc: peter.maydell@linaro.org, Matheus Ferst <matheus.ferst@eldorado.org.br>,
 groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

The definition of struct Int128 is currently independent of the host
endianness, causing different results when using the member s128 of
union ppc_vsr_t in big-endian builds with CONFIG_INT128 or
!CONFIG_INT128.

The only PPC instructions that seem to be affected by this issue are the
"Vector Extract Unsigned Byte/Halfword/Word to GPR using GPR-specified
Left/Right-Index." Even on builds with Int128 support, however, their
helpers give the wrong result on big-endian hosts.

The first patch in this series changes the definition of struct Int128
to allow its use in the ppc_vsr_t union. The second patch fixes the
helper definition.

Matheus Ferst (2):
  include/qemu/int128.h: define struct Int128 according to the host
    endianness
  target/ppc: fix vextu[bhw][lr]x helpers

 include/qemu/int128.h   | 19 ++++++++++++-------
 target/ppc/int_helper.c | 38 ++++++++++----------------------------
 2 files changed, 22 insertions(+), 35 deletions(-)

-- 
2.25.1


