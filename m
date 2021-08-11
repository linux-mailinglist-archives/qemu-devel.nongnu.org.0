Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4F6D3E99BB
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Aug 2021 22:36:35 +0200 (CEST)
Received: from localhost ([::1]:57568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDuxm-0001Si-72
	for lists+qemu-devel@lfdr.de; Wed, 11 Aug 2021 16:36:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lmichel@kalray.eu>) id 1mDoyM-0005N0-Hj
 for qemu-devel@nongnu.org; Wed, 11 Aug 2021 10:12:46 -0400
Received: from mxout.security-mail.net ([85.31.212.42]:28863
 helo=fx302.security-mail.net)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lmichel@kalray.eu>) id 1mDoyJ-0001IK-Ts
 for qemu-devel@nongnu.org; Wed, 11 Aug 2021 10:12:45 -0400
Received: from localhost (localhost [127.0.0.1])
 by fx302.security-mail.net (Postfix) with ESMTP id C729F3D3B00F
 for <qemu-devel@nongnu.org>; Wed, 11 Aug 2021 16:12:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kalray.eu;
 s=sec-sig-email; t=1628691159;
 bh=tOYaN2UbiEaoRiVkc8X/qDCOP/fo9Bm4P9G2MZwi1hE=;
 h=From:To:Cc:Subject:Date;
 b=PiyDpJFV5k0fyhMetg52bc3kvVWnXG7Q/ITsWxCes2dNuHlw/Xe5EEJt3ao371PCC
 w9kfecJ1n3AwNEDI88RIXNTNK5O7ThTOQ30CDe4Ck5WiY4rYOp+m5Z3K6KBx+s+63Z
 aCG1aLWRpSMt/vdjot3qJdJu8pUN6qpZWTqNKrsc=
Received: from fx302 (localhost [127.0.0.1])
 by fx302.security-mail.net (Postfix) with ESMTP id 634E33D3B06B;
 Wed, 11 Aug 2021 16:12:39 +0200 (CEST)
X-Virus-Scanned: E-securemail
Secumail-id: <55b4.6113dad7.143d1.0>
Received: from zimbra2.kalray.eu (unknown [217.181.231.53])
 by fx302.security-mail.net (Postfix) with ESMTPS id 14FDB3D3B013;
 Wed, 11 Aug 2021 16:12:39 +0200 (CEST)
Received: from zimbra2.kalray.eu (localhost [127.0.0.1])
 by zimbra2.kalray.eu (Postfix) with ESMTPS id F020327E02A8;
 Wed, 11 Aug 2021 16:12:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zimbra2.kalray.eu (Postfix) with ESMTP id DA14627E02A3;
 Wed, 11 Aug 2021 16:12:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu DA14627E02A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalray.eu;
 s=32AE1B44-9502-11E5-BA35-3734643DEF29; t=1628691158;
 bh=oACWa9YHXQ8Ts/YPz7whKVIVY6zi1KAtwPkc47a9mgQ=;
 h=From:To:Date:Message-Id;
 b=KQNGXW7fmE1NhL5N/oVPY+AlO7SFTUFnYkm08olwDI/HWWyJbc5MnQgYTVGoGfybr
 kOkLwVYIsmmCaCpMb4OolhbVaXNioZRwD6cCUvE6KctZQvAsBM3qZQMbvGFPuIaEZq
 wv+y7D+1DY1E1Ugzty9Re6rHSfF9rhA2QrXur2ys=
Received: from zimbra2.kalray.eu ([127.0.0.1])
 by localhost (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id fCMczIuZsNla; Wed, 11 Aug 2021 16:12:38 +0200 (CEST)
Received: from nemesis.lin.mbt.kalray.eu (unknown [192.168.37.229])
 by zimbra2.kalray.eu (Postfix) with ESMTPSA id C9FAE27E0232;
 Wed, 11 Aug 2021 16:12:38 +0200 (CEST)
From: Luc Michel <lmichel@kalray.eu>
To: qemu-devel@nongnu.org
Cc: Luc Michel <lmichel@kalray.eu>, qemu-trivial@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH] accel/tcg: remove redundant TCG_KICK_PERIOD define
Date: Wed, 11 Aug 2021 16:12:29 +0200
Message-Id: <20210811141229.12470-1-lmichel@kalray.eu>
X-Mailer: git-send-email 2.17.1
X-Virus-Scanned: by Secumail
Received-SPF: pass client-ip=85.31.212.42; envelope-from=lmichel@kalray.eu;
 helo=fx302.security-mail.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 11 Aug 2021 16:34:37 -0400
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The TCG_KICK_PERIOD macro is already defined in tcg-accel-ops-rr.h.
Remove it from tcg-accel-ops-rr.c.

Signed-off-by: Luc Michel <lmichel@kalray.eu>
---
 accel/tcg/tcg-accel-ops-rr.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/accel/tcg/tcg-accel-ops-rr.c b/accel/tcg/tcg-accel-ops-rr.c
index c02c061ecb..a5fd26190e 100644
--- a/accel/tcg/tcg-accel-ops-rr.c
+++ b/accel/tcg/tcg-accel-ops-rr.c
@@ -58,12 +58,10 @@ void rr_kick_vcpu_thread(CPUState *unused)
  */
 
 static QEMUTimer *rr_kick_vcpu_timer;
 static CPUState *rr_current_cpu;
 
-#define TCG_KICK_PERIOD (NANOSECONDS_PER_SECOND / 10)
-
 static inline int64_t rr_next_kick_time(void)
 {
     return qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + TCG_KICK_PERIOD;
 }
 
-- 
2.17.1


