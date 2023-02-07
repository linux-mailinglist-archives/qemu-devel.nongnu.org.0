Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A19B68DF1B
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 18:38:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPRut-0004Vp-BA; Tue, 07 Feb 2023 12:38:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1pPRuq-0004Ux-Sm; Tue, 07 Feb 2023 12:38:00 -0500
Received: from mail-b.sr.ht ([173.195.146.151])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1pPRup-0004Ku-AT; Tue, 07 Feb 2023 12:38:00 -0500
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id 84CDF11EF0D;
 Tue,  7 Feb 2023 17:37:57 +0000 (UTC)
From: ~dreiss-meta <dreiss-meta@git.sr.ht>
Date: Tue, 07 Feb 2023 17:37:57 +0000
Subject: [PATCH qemu v4 0/2] ARM: Add support for V8M special registers in GDB
 stub
MIME-Version: 1.0
Message-ID: <167579147730.28776.7263330829354840538-0@git.sr.ht>
X-Mailer: git.sr.ht
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=173.195.146.151; envelope-from=outgoing@sr.ht;
 helo=mail-b.sr.ht
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: ~dreiss-meta <dreiss@meta.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

New in v4: Moved arm_v7m_mrs_control out of the `#ifdef
CONFIG_USER_ONLY` block, unbreaking the user-only build.  The downside
is that this function is now taking up space in the user-only binary,
but it can (presumably?) never be used because there are no user modes
for v8m cores.  Let me know if you'd prefer for me to wrap `#ifdef
CONFIG_USER_ONLY` around the v8m registers in the gdb stub.  Also, let
me know if you'd prefer a separate commit for renaming and moving
v7m_mrs_control.

David Reiss (2):
  target/arm/gdbstub: Support reading M system registers from GDB
  target/arm/gdbstub: Support reading M security extension registers
    from GDB

 target/arm/cpu.h      |  25 ++++-
 target/arm/gdbstub.c  | 241 ++++++++++++++++++++++++++++++++++++++++++
 target/arm/m_helper.c |  87 +++++++--------
 3 files changed, 305 insertions(+), 48 deletions(-)

-- 
2.34.5

