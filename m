Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B1353E56D
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jun 2022 17:25:17 +0200 (CEST)
Received: from localhost ([::1]:37974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyEbU-0003f0-Ez
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 11:25:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nyEEm-0002di-1W; Mon, 06 Jun 2022 11:01:48 -0400
Received: from [187.72.171.209] (port=55330 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nyEEh-0004pP-1W; Mon, 06 Jun 2022 11:01:45 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Mon, 6 Jun 2022 12:01:35 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 25A2D8000CB;
 Mon,  6 Jun 2022 12:01:35 -0300 (-03)
From: Matheus Ferst <matheus.ferst@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, richard.henderson@linaro.org,
 Matheus Ferst <matheus.ferst@eldorado.org.br>
Subject: [PATCH 0/7] Remove CONFIG_INT128 conditional code from target/ppc/*
Date: Mon,  6 Jun 2022 12:00:30 -0300
Message-Id: <20220606150037.338931-1-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 06 Jun 2022 15:01:35.0433 (UTC)
 FILETIME=[50D14390:01D879B6]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 187.72.171.209 (failed)
Received-SPF: pass client-ip=187.72.171.209;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, PDS_HP_HELO_NORDNS=0.659,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

PPC-specific methods to handle 128-bits integers operations, like
avr_qw_not and avr_qw_add, are currently only tested indirectly (through
the behavior of the insns that use them) in !CONFIG_INT128 builds. They
can be replaced by the methods provided by int128.h, which are shared
with other archs and have unit tests.

We also take the opportunity to move some instructions to decodetree and
drop unnecessary uses of VECTOR_FOR_INORDER_I.

Based-on: <20220525134954.85056-1-lucas.araujo@eldorado.org.br>
because int128_ult, implemented in 'host-utils: Implemented unsigned
256-by-128 division'

Matheus Ferst (7):
  target/ppc: use int128.h methods in vpmsumd
  target/ppc: use int128.h methods in vadduqm
  target/ppc: use int128.h methods in vaddecuq and vaddeuqm
  target/ppc: use int128.h methods in vaddcuq
  target/ppc: use int128.h methods in vsubuqm
  target/ppc: use int128.h methods in vsubecuq and vsubeuqm
  target/ppc: use int128.h methods in vsubcuq

 target/ppc/helper.h                 |  18 +-
 target/ppc/insn32.decode            |  16 ++
 target/ppc/int_helper.c             | 255 ++++++----------------------
 target/ppc/translate/vmx-impl.c.inc |  32 ++--
 target/ppc/translate/vmx-ops.c.inc  |   9 +-
 5 files changed, 93 insertions(+), 237 deletions(-)

-- 
2.25.1


