Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2EE34849AC
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 22:05:06 +0100 (CET)
Received: from localhost ([::1]:33678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4qzR-0007zP-CD
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 16:05:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1n4qvz-0005bi-No; Tue, 04 Jan 2022 16:01:31 -0500
Received: from [201.28.113.2] (port=18444 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1n4qvy-0000Ie-5o; Tue, 04 Jan 2022 16:01:31 -0500
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Tue, 4 Jan 2022 18:01:26 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id A6DD180012A;
 Tue,  4 Jan 2022 18:01:25 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v2 0/2] linux-user/ppc: Deliver SIGTRAP on tw[i]/td[i]
Date: Tue,  4 Jan 2022 18:00:13 -0300
Message-Id: <20220104210015.457468-1-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 04 Jan 2022 21:01:26.0108 (UTC)
 FILETIME=[3CA911C0:01D801AE]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: 8
X-Spam_score: 0.8
X-Spam_bar: /
X-Spam_report: (0.8 / 5.0 requ) RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: danielhb413@gmail.com, richard.henderson@linaro.org, laurent@vivier.eu,
 groug@kaod.org, clg@kaod.org, Matheus Ferst <matheus.ferst@eldorado.org.br>,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

In the review of 66c6b40aba1, Richard Henderson suggested[1] using
"trap" instead of ".long 0x0" to generate the signal to test XER
save/restore behavior. However, linux-user aborts when a trap
exception is raised, so we kept the patch with SIGILL.

This patch series is a follow-up to remove the cpu_abort call, deliver
SIGTRAP instead (using TRAP_BRKPT as si_code), and apply the suggestion
to the signal_save_restore_xer test.

This change removes the "qemu: fatal: Tried to call a TRAP" reported in
issue #588[2], but we still have the "Unknown privilege violation (03)"
error.

I had some problems building with
--static, so I couldn't test if it solves the problem.

Based-on: https://lists.gnu.org/archive/html/qemu-devel/2021-12/msg03454.html

[1] https://lists.gnu.org/archive/html/qemu-ppc/2021-10/msg00143.html

v2:
 - Based-on rth's patch to use force_sig_fault and avoid merge conflicts

Matheus Ferst (2):
  linux-user/ppc: deliver SIGTRAP on POWERPC_EXCP_TRAP
  tests/tcg/ppc64le: change signal_save_restore_xer to use SIGTRAP

 linux-user/ppc/cpu_loop.c                   | 3 ++-
 tests/tcg/ppc64le/signal_save_restore_xer.c | 8 ++++----
 2 files changed, 6 insertions(+), 5 deletions(-)

-- 
2.25.1


