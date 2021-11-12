Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B9EE44E874
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Nov 2021 15:18:34 +0100 (CET)
Received: from localhost ([::1]:48822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlXNw-0008Rq-Mw
	for lists+qemu-devel@lfdr.de; Fri, 12 Nov 2021 09:18:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mlXKU-0005zH-Qy; Fri, 12 Nov 2021 09:14:58 -0500
Received: from [201.28.113.2] (port=37434 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mlXKS-0007oL-In; Fri, 12 Nov 2021 09:14:58 -0500
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Fri, 12 Nov 2021 11:14:50 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id 1C61680009B;
 Fri, 12 Nov 2021 11:14:50 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v2 0/3] target/ppc: Implement Vector Expand/Extract Mask and
 Vector Mask
Date: Fri, 12 Nov 2021 11:14:27 -0300
Message-Id: <20211112141430.631732-1-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 12 Nov 2021 14:14:50.0544 (UTC)
 FILETIME=[A7E0AB00:01D7D7CF]
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

This is a small patch series just to allow Ubuntu 21.10 to boot with
-cpu POWER10. Glibc 2.34 is using vextractbm, so the init is killed by
SIGILL without the second patch of this series. The other two insns. are
included as they are somewhat close to Vector Extract Mask (at least in
pseudocode).

v2:
- Applied rth suggestions to VEXTRACT[BHWDQ]M and MTVSR[BHWDQ]M[I]

Matheus Ferst (3):
  target/ppc: Implement Vector Expand Mask
  target/ppc: Implement Vector Extract Mask
  target/ppc: Implement Vector Mask Move insns

 target/ppc/insn32.decode            |  28 ++++
 target/ppc/translate/vmx-impl.c.inc | 209 ++++++++++++++++++++++++++++
 2 files changed, 237 insertions(+)

-- 
2.25.1


