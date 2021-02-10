Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95DF43160F3
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 09:28:07 +0100 (CET)
Received: from localhost ([::1]:51382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9kr0-0007IQ-L6
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 03:28:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.brenken@efs-auto.org>)
 id 1l9kpg-0006R7-KQ
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 03:26:44 -0500
Received: from mout.kundenserver.de ([212.227.126.135]:45435)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.brenken@efs-auto.org>)
 id 1l9kpf-0005Tx-3c
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 03:26:44 -0500
Received: from localhost.localdomain ([178.239.76.114]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1M3VAI-1l9Crm0znm-000eS3; Wed, 10 Feb 2021 09:26:36 +0100
From: David Brenken <david.brenken@efs-auto.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/1] tricore: fixed faulty conditions for extr and imask
Date: Wed, 10 Feb 2021 09:26:49 +0100
Message-Id: <20210210082650.5516-1-david.brenken@efs-auto.org>
X-Mailer: git-send-email 2.16.1.windows.4
X-Provags-ID: V03:K1:mv+N3TXvfeXD5XkQxZYvHJz66GSEKiIquh54XdIaZHqgVU3gKqd
 S7JcODRa8oUnn/n9FvDMW/w4TYKVrsbQI2n4nirocIkU+yYP/7q2Hpg9N+Xcg4aI5PNygQo
 ncgJa3LqZLbw7BUAIsyGllEz7wEa4NCsfK+kl7BtY3VunpWVI1J+dU/GlDByAWvyxe2kbfe
 hE8iXl0cIariK1280AR/w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Dwjthlv3I00=:Q8wValfIR86SQnmPd47w9o
 vSDfgdMU+FNKSLZLWa8GRRzGOyfizvqc3JSx7RefquUvRQKt726NH7q7w41QoIGUtEqYqPq5Q
 apXzFI7nyQlbW3m7DHiEJg1iehFdOhKJl5qk3ncWVCI81VZCwC4YiSZicrnceyU9Hlhi2sIeg
 5x0Wi1TsQ/446GJ0WMGvKjjxXABDN7UizXad7EQ8fkW4GQZnApN4Q7KKfWOodrKEtIkq2t0sP
 vLakzB8bMVhVcSzkYFCBBPsSDRsjiOXUJVk2AMsMOQ/qmre8l5WW131K4rn/iki6DHiHNC58K
 aMCaN9Arcfw7vgAW61pIKrNH+js4FuU+3vOc8ff9ico/wR2DzIE5YZwCizFpWUBh2E416/0Nl
 uTRjEheCZMzHeAmSgxTYF8wfh75Wy6D5RpDkS33uItPQJbCzBaq/1nyQu1IF91/JZkILxfrao
 fvMG9kDhLA==
Received-SPF: none client-ip=212.227.126.135;
 envelope-from=david.brenken@efs-auto.org; helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: kbastian@mail.uni-paderborn.de,
 Andreas Konopik <andreas.konopik@efs-auto.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Andreas Konopik <andreas.konopik@efs-auto.de>

Hello together,

we have fixed a few conditions leading to incorrect intermediate code
generation. RCPW_IMASK, RRPW_EXTR, RRPW_EXTR_U and RRPW_IMASK invoke
undefined behavior for "pos + width > 32", which is also checked in
tcg_gen_extract_tl(). RRRW_EXTR_U invokes undefined behavior for
"width == 0", hence we removed that condition.

Andreas Konopik (1):
  tricore: fixed faulty conditions for extr and imask

 target/tricore/translate.c | 37 ++++++++++---------------------------
 1 file changed, 10 insertions(+), 27 deletions(-)

-- 
2.30.0


