Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD1252561E
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 21:55:59 +0200 (CEST)
Received: from localhost ([::1]:51556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npEuk-0007d4-46
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 15:55:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victor.colombo@eldorado.org.br>)
 id 1npEiU-0007w1-DW; Thu, 12 May 2022 15:43:19 -0400
Received: from [187.72.171.209] (port=25741 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <victor.colombo@eldorado.org.br>)
 id 1npEiQ-0003R0-4Z; Thu, 12 May 2022 15:43:16 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Thu, 12 May 2022 16:43:04 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 2979B800177;
 Thu, 12 May 2022 16:43:04 -0300 (-03)
From: =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, richard.henderson@linaro.org,
 victor.colombo@eldorado.org.br
Subject: [RFC PATCH 0/2] target/ppc: Propose rework in fp exception handling
Date: Thu, 12 May 2022 16:42:48 -0300
Message-Id: <20220512194250.138244-1-victor.colombo@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 12 May 2022 19:43:04.0523 (UTC)
 FILETIME=[7F2C21B0:01D86638]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 187.72.171.209 (failed)
Received-SPF: pass client-ip=187.72.171.209;
 envelope-from=victor.colombo@eldorado.org.br; helo=outlook.eldorado.org.br
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

Hello everyone!

I would like to propose a rework on the fpscr exceptions in
fpu_helper.c. Today, we have: do_float_check_status() dealing with
Overflow, Underflow, and Inexact; and other helpers for the invalid
exceptions (like float_invalid_op_vximz(), float_invalid_op_vxisi()),
including some special cases like float_invalid_op_madd(). So, there is
a lot of helpers that may need to be used in the insn helpers code.

My idea is try to find a way to concentrate them in a single place.
This RFC moves imz, isi, and snan excp helpers to do_float_check_status
as a hub for dealing with the commitment of exception flags from
env->fp_status to env->fpscr. Then, show how an instruction could
benefit of this change by adapting VSX_MADD helper to leverage the
changes.

The main objectives with this patch set are:
1. Try to simplify the excp handling code.
2. Allow for MMA instruction XVFGER to be easily implemented
   (see [1])

This RFC is just a subset of what I think should be done. There are
more exceptions to be moved to do_float_check_status, and many more
instructions to refactor to use it.

Thanks!

Based-on the FI bit fix [2].

[1] https://lists.gnu.org/archive/html/qemu-ppc/2022-05/msg00176.html
[2] <20220510204610.100867-1-victor.colombo@eldorado.org.br>
    https://lists.nongnu.org/archive/html/qemu-ppc/2022-05/msg00246.html
    https://patchew.org/QEMU/20220510204610.100867-1-victor.colombo@eldorado.org.br/

Víctor Colombo (2):
  target/ppc: Add invalid imz, isi and snan to do_float_check_status()
  target/ppc: Rely on do_float_check_status for VSX_MADD invalid excepts

 target/ppc/fpu_helper.c | 148 ++++++++++++++++++++++++++--------------
 1 file changed, 97 insertions(+), 51 deletions(-)

-- 
2.25.1


