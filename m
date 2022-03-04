Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 429F54CDBDF
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 19:12:31 +0100 (CET)
Received: from localhost ([::1]:39984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQCPm-0007pm-89
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 13:12:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nQC77-0006Da-MR; Fri, 04 Mar 2022 12:53:13 -0500
Received: from [187.72.171.209] (port=8389 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nQC75-0003AM-RH; Fri, 04 Mar 2022 12:53:13 -0500
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Fri, 4 Mar 2022 14:53:05 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 8E9498001C2;
 Fri,  4 Mar 2022 14:53:05 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH 0/7] target/ppc: Vector/VSX instruction batch fixes
Date: Fri,  4 Mar 2022 14:51:49 -0300
Message-Id: <20220304175156.2012315-1-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 04 Mar 2022 17:53:06.0003 (UTC)
 FILETIME=[B3A52230:01D82FF0]
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

Some fixes to the insns of our last patch series.

Lucas Mateus Castro (alqotel) (1):
  target/ppc: Fix vmul[eo]* instructions marked 2.07

Matheus Ferst (4):
  target/ppc: use ext32u and deposit in do_vx_vmulhw_i64
  target/ppc: use extract/extract2 to create vrlqnm mask
  target/ppc: use andc in vrlqmi
  target/ppc: split XXGENPCV macros for readability

Víctor Colombo (2):
  target/ppc: Add missing helper_reset_fpstatus to VSX_MAX_MINC
  target/ppc: Add missing helper_reset_fpstatus to helper_XVCVSPBF16

 target/ppc/fpu_helper.c             |  4 ++
 target/ppc/int_helper.c             | 28 +++++++++---
 target/ppc/translate/vmx-impl.c.inc | 42 +++++++----------
 target/ppc/translate/vsx-impl.c.inc | 71 +++++++++++++++--------------
 4 files changed, 77 insertions(+), 68 deletions(-)

-- 
2.25.1


