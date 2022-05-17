Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F2A852A7DA
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 18:24:16 +0200 (CEST)
Received: from localhost ([::1]:56768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqzza-0003p3-TU
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 12:24:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victor.colombo@eldorado.org.br>)
 id 1nqzrC-00019u-5i; Tue, 17 May 2022 12:15:34 -0400
Received: from [187.72.171.209] (port=62953 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <victor.colombo@eldorado.org.br>)
 id 1nqzrA-0001KH-7i; Tue, 17 May 2022 12:15:33 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Tue, 17 May 2022 13:15:26 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id CC9BB800603;
 Tue, 17 May 2022 13:15:25 -0300 (-03)
From: =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, richard.henderson@linaro.org, rashmica.g@gmail.com,
 victor.colombo@eldorado.org.br
Subject: [PATCH v3 0/3] target/ppc: Fix FPSCR.FI bit
Date: Tue, 17 May 2022 13:15:19 -0300
Message-Id: <20220517161522.36132-1-victor.colombo@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 17 May 2022 16:15:26.0091 (UTC)
 FILETIME=[516F05B0:01D86A09]
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

Hello everyone,

According to Power ISA, the FI bit in FPSCR is non-sticky.
This means that if an instruction is said to modify the FI bit, then
it should be set or cleared depending on the result of the
instruction. Otherwise, it should be kept as was before.

This patch set fixes inconsistencies found in QEMU's handling of the
FPSCR.FI bit, where it's treating as all instructions are supposed
to change FI.

Thanks!

v2:
- move the FI change from float_inexact_excp to do_float_check_status
- remove the setting of FI from float_overflow_excp, making
  do_float_check_status() the only responsible for it.
- make float_overflow_excp() return float_flag_inexact if it should
  update the inexact flags.
- Add patch 3, moving the renaming of sfprf to sfifprf to it
  (previously on patch 1)

v3:
- rewrite patch 1 commit message
- fix missing comment change in patch 3
- add all R-b

Víctor Colombo (3):
  target/ppc: Fix FPSCR.FI bit being cleared when it shouldn't
  target/ppc: Fix FPSCR.FI changing in float_overflow_excp()
  target/ppc: Rename sfprf to sfifprf where it's also used as set fi
    flag

 target/ppc/cpu.h        |   2 +
 target/ppc/fpu_helper.c | 223 +++++++++++++++++++++-------------------
 2 files changed, 117 insertions(+), 108 deletions(-)

-- 
2.25.1


