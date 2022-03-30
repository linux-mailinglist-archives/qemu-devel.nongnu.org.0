Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 994834ECB3D
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 20:03:37 +0200 (CEST)
Received: from localhost ([::1]:39514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZcfQ-00033W-LJ
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 14:03:36 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nZcba-0000Au-31; Wed, 30 Mar 2022 13:59:38 -0400
Received: from [187.72.171.209] (port=21948 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nZcbY-0004ik-B1; Wed, 30 Mar 2022 13:59:37 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Wed, 30 Mar 2022 14:59:33 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 70C4D8002AF;
 Wed, 30 Mar 2022 14:59:33 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [RFC PATCH 0/8] Alternative softfloat 128-bit integer support
Date: Wed, 30 Mar 2022 14:59:24 -0300
Message-Id: <20220330175932.6995-1-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 30 Mar 2022 17:59:33.0824 (UTC)
 FILETIME=[E98B6C00:01D8445F]
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
Cc: danielhb413@gmail.com, richard.henderson@linaro.org, groug@kaod.org,
 clg@kaod.org, Matheus Ferst <matheus.ferst@eldorado.org.br>,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

This RFC is an alternative to [1] using Int128 types to implement the
128-bit integer conversion routines in softfloat required by the
xscv[su]qqp and xscvqp[su]qz instructions of PowerISA v3.1.

Some improvements to int128.h are made in patches 1 and 2. Patches 3-6
implement the conversion routines, and patches 7 and 8 implement the new
instructions.

RFC: Int128 vs. pair of 64-bit values.
 - Returning unsigned values through Int128 is not ideal, but creating
   an "UInt128" just for this case seems excessive.
 - OTOH, there are fewer cases to handle, especially in float->int.

[1] https://lists.gnu.org/archive/html/qemu-ppc/2022-03/msg00520.html

Matheus Ferst (8):
  qemu/int128: avoid undefined behavior in int128_lshift
  qemu/int128: add int128_urshift
  softfloat: add uint128_to_float128
  softfloat: add int128_to_float128
  softfloat: add float128_to_uint128
  softfloat: add float128_to_int128
  target/ppc: implement xscv[su]qqp
  target/ppc: implement xscvqp[su]qz

 fpu/softfloat.c                     | 183 ++++++++++++++++++++++++++++
 include/fpu/softfloat.h             |   7 ++
 include/qemu/int128.h               |  25 +++-
 target/ppc/fpu_helper.c             |  33 +++++
 target/ppc/helper.h                 |   4 +
 target/ppc/insn32.decode            |   7 ++
 target/ppc/translate/vsx-impl.c.inc |  22 ++++
 tests/unit/test-int128.c            |  32 +++++
 8 files changed, 311 insertions(+), 2 deletions(-)

-- 
2.25.1


