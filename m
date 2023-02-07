Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 667FA68D4AD
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 11:45:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPLSW-0005Yk-Sk; Tue, 07 Feb 2023 05:44:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1pPLSU-0005Xo-5Y
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 05:44:18 -0500
Received: from rev.ng ([5.9.113.41])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1pPLSS-000151-Fz
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 05:44:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3OPCgX//qu7enp/+JCS1MdLsLtR1yu7d/D3sdbUHwNs=; b=obvsKVXZqMBQOKW0lnNksUJ4PL
 YXgqO9Gn55SqjTrK8kJpcQ8l2u3dI11nNZwblxGxsfS1wTd6FYHBmfvMoGqKBWMLF9T9pou3jkxGz
 EqiJ3hLcUtnPN+NpITCXsl6vb0rQrzOvXQwD8oxzxWVTuOqHvxbqE5RAjTeBcR81Uew0=;
To: qemu-devel@nongnu.org
Cc: ale@rev.ng, richard.henderson@linaro.org, pbonzini@redhat.com,
 eduardo@habkost.net, peter.maydell@linaro.org
Subject: [PATCH 0/3] Replace TARGET_TB_PCREL with CF_PCREL
Date: Tue,  7 Feb 2023 11:43:49 +0100
Message-Id: <20230207104352.11055-1-anjo@rev.ng>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.9.113.41; envelope-from=anjo@rev.ng; helo=rev.ng
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
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
Reply-to:  Anton Johansson <anjo@rev.ng>
From:  Anton Johansson via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This patchset entirely replaces the macro TARGET_TB_PCREL with
a field in TranslationBlock.cflags called CF_PCREL, and is a
first step towards removing target-specific assumptions from
non-target/ directories.

The grand goal is to allow for heterogeneous QEMU binaries
consisting of multiple frontends.

RFC: https://lists.nongnu.org/archive/html/qemu-devel/2022-12/msg04518.html

Anton Johansson (3):
  include/exec: Introduce `CF_PCREL`
  Replace `TARGET_TB_PCREL` with `CF_PCREL`
  target: Set `CF_PCREL` for arm and i386 frontends

 accel/tcg/cpu-exec.c        |  8 +++----
 accel/tcg/internal.h        | 10 ++++----
 accel/tcg/perf.c            |  2 +-
 accel/tcg/tb-jmp-cache.h    | 48 ++++++++++++++++++-------------------
 accel/tcg/tb-maint.c        |  8 +++----
 accel/tcg/translate-all.c   | 14 +++++------
 include/exec/cpu-defs.h     |  3 ---
 include/exec/exec-all.h     | 28 ++++++++++------------
 target/arm/cpu-param.h      |  2 --
 target/arm/cpu.c            | 13 ++++++----
 target/arm/translate-a64.c  |  8 +++----
 target/arm/translate.c      |  6 ++---
 target/arm/translate.h      |  2 +-
 target/i386/cpu-param.h     |  4 ----
 target/i386/cpu.c           |  5 ++++
 target/i386/helper.c        |  2 +-
 target/i386/tcg/tcg-cpu.c   |  6 ++---
 target/i386/tcg/translate.c | 26 ++++++++++----------
 18 files changed, 95 insertions(+), 100 deletions(-)

--
2.39.1

