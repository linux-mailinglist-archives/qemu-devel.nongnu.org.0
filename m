Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E409A591A1F
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Aug 2022 14:21:53 +0200 (CEST)
Received: from localhost ([::1]:44966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMq9I-0007xm-CD
	for lists+qemu-devel@lfdr.de; Sat, 13 Aug 2022 08:21:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anton.kochkov@proton.me>)
 id 1oMq3Y-0004Hp-6h
 for qemu-devel@nongnu.org; Sat, 13 Aug 2022 08:15:56 -0400
Received: from mail-4316.protonmail.ch ([185.70.43.16]:29917)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anton.kochkov@proton.me>)
 id 1oMq3U-0001Q8-Bz
 for qemu-devel@nongnu.org; Sat, 13 Aug 2022 08:15:55 -0400
Date: Sat, 13 Aug 2022 12:15:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
 s=k5kerzt4dnaormvktcrgzhgkru.protonmail; t=1660392928; x=1660652128;
 bh=uVTMk+ZlNmRY9pdJknlwgHt1JlGkBCgdXXLcfD/noXM=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:Feedback-ID:From:To:
 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID;
 b=a4RPBR16wGxVKzA4B1JuiNcKDE4OBuFMJh8YOB5MX3Ooz7CjA+deZRurJPnkfrxPp
 OpYI+LtCFpMO9ooeUwLvAR4wAmI1c61mvWJtBWHLi4n+gTT/3F+6f2AJ9AVfd/ufRH
 HQ+KXIFny1/HiVmMk/E1I6MkphJyJyLJDyNAaUlmtrHZM5ErInhMRmx6GZpsJvEfIx
 m3Kxmh1lMbY9sBbKIW1NlzfWkIukUbevjVdW6TL17A+YKWrEd3kbea56JFTCyHOORm
 Ho9S6iBvwQN8PexO0cAYEnOBjXLS0ngNITdijBvW0J6AycwLP+gIzXarVQn+B97iYk
 eNtVbgNddGFNQ==
To: qemu-devel@nongnu.org
From: Anton Kochkov <anton.kochkov@proton.me>
Cc: Anton Kochkov <anton.kochkov@proton.me>
Subject: [PATCH] meson: be strict for boolean options
Message-ID: <20220813121400.1995447-1-anton.kochkov@proton.me>
Feedback-ID: 53490844:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=185.70.43.16;
 envelope-from=anton.kochkov@proton.me; helo=mail-4316.protonmail.ch
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: Anton Kochkov <anton.kochkov@proton.me>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

While Meson buildsystem accepts the 'false' as a value
for boolean options, it's not covered by the specification
and in general invalid. Some alternative Meson implementations,
like Muon, do not accept 'false' or 'true' as a valid value
for the boolean options.

See https://mesonbuild.com/Build-options.html

Signed-off-by: Anton Kochkov <anton.kochkov@proton.me>
---
 meson_options.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meson_options.txt b/meson_options.txt
index e58e158396..63f0725174 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -82,9 +82,9 @@ option('tcg', type: 'feature', value: 'enabled',
        description: 'TCG support')
 option('tcg_interpreter', type: 'boolean', value: false,
        description: 'TCG with bytecode interpreter (slow)')
-option('cfi', type: 'boolean', value: 'false',
+option('cfi', type: 'boolean', value: false,
        description: 'Control-Flow Integrity (CFI)')
-option('cfi_debug', type: 'boolean', value: 'false',
+option('cfi_debug', type: 'boolean', value: false,
        description: 'Verbose errors in case of CFI violation')
 option('multiprocess', type: 'feature', value: 'auto',
        description: 'Out of process device emulation support')
--
2.37.1



