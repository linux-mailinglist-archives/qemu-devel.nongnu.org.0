Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BDEB58AC50
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 16:21:26 +0200 (CEST)
Received: from localhost ([::1]:54374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJyCa-0003tp-Rw
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 10:21:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1oJy6x-000800-94; Fri, 05 Aug 2022 10:15:36 -0400
Received: from [200.168.210.66] (port=13350 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1oJy6q-0004vg-7N; Fri, 05 Aug 2022 10:15:29 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Fri, 5 Aug 2022 11:15:23 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 2CE04800358;
 Fri,  5 Aug 2022 11:15:23 -0300 (-03)
From: "Lucas Mateus Castro(alqotel)" <lucas.araujo@eldorado.org.br>
To: qemu-ppc@nongnu.org,
	qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, danielhb413@gmail.com,
 "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>
Subject: [PATCH 0/2] Floating-point OE/UE exception bug
Date: Fri,  5 Aug 2022 11:15:20 -0300
Message-Id: <20220805141522.412864-1-lucas.araujo@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 05 Aug 2022 14:15:23.0460 (UTC)
 FILETIME=[CD60C040:01D8A8D5]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 200.168.210.66 (failed)
Received-SPF: pass client-ip=200.168.210.66;
 envelope-from=lucas.araujo@eldorado.org.br; helo=outlook.eldorado.org.br
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

From: "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>

Changes in v2:
    - Completely reworked the solution:
        * Created re_bias in FloatFmt, it is 3/4 of the total exponent
          range of a FP type
        * Added rebias bools that dictates if the result should have
          its exponent add/subtract the re_bias value if an
          overflow/underflow occurs.
        * ppc_store_fpscr sets/unsets rebias if OE/UE is set/unset

The PowerISA defines that if an overflow exception happen with FPSCR.OE
set, the exponent of the intermediate result is subtracted 1536 in
double precision operations and is added 1536 in an underflow exception,
currently this behavior is not QEMU's behavior, this patch series fixes
that.

Currently there's no test in this patch series as there's no way to
disable MSR.FE0 and MSR.FE1 in linux user, so any overflow/underflow
exception with OE/UE set causes a trapping exception.

Lucas Mateus Castro (alqotel) (2):
  fpu: Add rebias bool, value and operation
  target/ppc: Bugfix FP when OE/UE are set

 fpu/softfloat-parts.c.inc     | 21 +++++++++++++++++++--
 fpu/softfloat.c               |  2 ++
 include/fpu/softfloat-types.h |  4 ++++
 target/ppc/cpu.c              |  2 ++
 target/ppc/fpu_helper.c       |  2 --
 5 files changed, 27 insertions(+), 4 deletions(-)

-- 
2.31.1


