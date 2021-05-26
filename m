Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F4F8392188
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 22:34:39 +0200 (CEST)
Received: from localhost ([::1]:60344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lm0Eg-0000Y6-Dq
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 16:34:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lm02Q-0007La-Hr; Wed, 26 May 2021 16:22:00 -0400
Received: from [201.28.113.2] (port=2123 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lm02O-00019i-IA; Wed, 26 May 2021 16:21:57 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Wed, 26 May 2021 17:21:07 -0300
Received: from eldorado.org.br (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTP id 0FF9D8013CA;
 Wed, 26 May 2021 17:21:07 -0300 (-03)
From: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/5] stop collection of instruction usage statistics
Date: Wed, 26 May 2021 17:20:59 -0300
Message-Id: <20210526202104.127910-1-bruno.larsen@eldorado.org.br>
X-Mailer: git-send-email 2.17.1
X-OriginalArrivalTime: 26 May 2021 20:21:07.0243 (UTC)
 FILETIME=[A8C94FB0:01D7526C]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=bruno.larsen@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: farosas@linux.ibm.com, richard.henderson@linaro.org,
 luis.pires@eldorado.org.br, lucas.araujo@eldorado.org.br,
 fernando.valle@eldorado.org.br, qemu-ppc@nongnu.org,
 matheus.ferst@eldorado.org.br, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Based-on: <20210525115355.8254-1-bruno.larsen@eldorado.org.br>

The functionality of counting how many instructions were being executed and
being able to show it through the monitor, although neat, was only
supported by ppc, and now that it is migrating to use decodetree (at
least partially), those statistics won't be used anymore. Therefore,
this patch removes that functinality completely.

This series was suggested by Richard Henderson

Bruno Larsen (billionai) (5):
  target/ppc: fixed GEN_OPCODE behavior when PPC_DUMP_CPU is set
  target/ppc: remove ppc_cpu_dump_statistics
  target/ppc: removed mentions to DO_PPC_STATISTICS
  monitor: removed cpustats command
  hw/core/cpu: removed cpu_dump_statistics function

 hmp-commands-info.hx   | 13 --------
 hw/core/cpu.c          |  9 ------
 include/hw/core/cpu.h  | 12 --------
 monitor/misc.c         | 11 -------
 target/ppc/cpu.h       |  1 -
 target/ppc/cpu_init.c  |  3 --
 target/ppc/translate.c | 69 +++---------------------------------------
 7 files changed, 5 insertions(+), 113 deletions(-)

-- 
2.17.1


