Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0624D3F89FF
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 16:19:35 +0200 (CEST)
Received: from localhost ([::1]:34990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJGEA-0007s3-2B
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 10:19:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mJGBO-0006Lp-PI; Thu, 26 Aug 2021 10:16:42 -0400
Received: from [201.28.113.2] (port=2975 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mJGBN-0003xy-7P; Thu, 26 Aug 2021 10:16:42 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Thu, 26 Aug 2021 11:15:22 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id 9E7D7800930;
 Thu, 26 Aug 2021 11:15:21 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v2 0/2] target/ppc: Fix vextu[bhw][lr]x on big endian hosts
Date: Thu, 26 Aug 2021 11:14:44 -0300
Message-Id: <20210826141446.2488609-1-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 26 Aug 2021 14:15:22.0067 (UTC)
 FILETIME=[CE723230:01D79A84]
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
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org, f4bug@amsat.org,
 groug@kaod.org, Matheus Ferst <matheus.ferst@eldorado.org.br>,
 david@gibson.dropbear.id.au
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

 include/qemu/int128.h   | 27 ++++++++++++++++++++-------
 target/ppc/int_helper.c | 38 ++++++++++----------------------------
 2 files changed, 30 insertions(+), 35 deletions(-)

-- 
2.25.1


