Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C703B4EA163
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Mar 2022 22:22:21 +0200 (CEST)
Received: from localhost ([::1]:49302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYvsa-0008PO-Qa
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 16:22:20 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nYvlT-0003GV-71; Mon, 28 Mar 2022 16:14:59 -0400
Received: from [187.72.171.209] (port=39734 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nYvlR-00030r-Hx; Mon, 28 Mar 2022 16:14:58 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Mon, 28 Mar 2022 17:14:51 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 7E48C800094;
 Mon, 28 Mar 2022 17:14:51 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [RFC PATCH 0/6] softfloat 128-bit integer support
Date: Mon, 28 Mar 2022 17:14:36 -0300
Message-Id: <20220328201442.175206-1-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 28 Mar 2022 20:14:51.0903 (UTC)
 FILETIME=[7B7878F0:01D842E0]
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

This RFC is a first attempt at implementing the 128-bit integer
conversion routines in softfloat, as required by the xscv[su]qqp and
xscvqp[su]qz instructions of PowerISA v3.1.

Instead of using int128.h, int-to-float routines receive the 128-bit
numbers through a pair of 64-bit values, and float-to-int conversions
use a pointer to return the lower half of the result.

We only need the parts128 methods, but since the difference to parts64
ones seemed minor, I included both in this patch.

RFC:
 - Should we use struct Int128 instead of 64-bit value pairs?
 - I've not tested the float64 methods since the PPC instructions only
   use the quad-precision routines. Should we keep them in the final
   version?

Matheus Ferst (6):
  softfloat: add uint128_to_float* conversion methods
  softfloat: add int128_to_float* conversion methods
  softfloat: add float*_to_uint128 conversion methods
  softfloat: add float*_to_int128 conversion methods
  target/ppc: implement xscv[su]qqp
  target/ppc: implement xscvqp[su]qz

 fpu/softfloat-parts.c.inc           | 202 ++++++++++++++++++++++++++++
 fpu/softfloat.c                     | 161 ++++++++++++++++++++++
 include/fpu/softfloat.h             |  23 ++++
 target/ppc/fpu_helper.c             |  34 +++++
 target/ppc/helper.h                 |   4 +
 target/ppc/insn32.decode            |   7 +
 target/ppc/translate/vsx-impl.c.inc |  22 +++
 7 files changed, 453 insertions(+)

-- 
2.25.1


