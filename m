Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D18716A2D04
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Feb 2023 02:59:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pW6J1-0005zz-Hg; Sat, 25 Feb 2023 20:58:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien@zamaudio.com>)
 id 1pW6Iy-0005zT-ER
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 20:58:25 -0500
Received: from mail-0201.mail-europe.com ([51.77.79.158])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien@zamaudio.com>)
 id 1pW6Iv-0002yF-C3
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 20:58:23 -0500
Date: Sun, 26 Feb 2023 01:58:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zamaudio.com;
 s=protonmail3; t=1677376694; x=1677635894;
 bh=YtEcSvrIKmrXEzmTDaHWLzTOfA8pqLAVbEU/xV2w4ig=;
 h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=C6pedWGwAiIG6gOeKRQ4Zd23fC5dEAwimJ3Pvs7hvAip0hWABzIOICJA4lO+8X6Dq
 7mW9tLwmtlwrt7rMPgRsjMxDCFSlBt1bESwAlhrwBvE4CqtUPWPgKNzXnmcMBxmxc7
 kXfsro6Zc60l+RfqcBCfONyr7BMSzCKn0Cqy4ojdFa9Wtx3lFSgLvoZO6Fsx7JVuC/
 ylu4IxoEwn2TqKyc4zL2GrjIE5Ij3GnOID+POvi6ciy6BqyMhAvq0T11tg52bFZvNR
 7YBEqLQSZ9u+f+1a2CUDkgJLJIctgxO5tYREkt1sMKgWDCJg3nrPIEfdBsQaur1Lpv
 FtY0K6K/bid9w==
To: qemu-devel@nongnu.org
From: Damien Zammit <damien@zamaudio.com>
Cc: Damien Zammit <damien@zamaudio.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH qemu] timer/i8254: Fix one shot PIT mode
Message-ID: <20230226015755.52624-1-damien@zamaudio.com>
Feedback-ID: 43209410:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=51.77.79.158; envelope-from=damien@zamaudio.com;
 helo=mail-0201.mail-europe.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Currently, the one-shot (mode 1) PIT expires far too quickly,
due to the output being set under the wrong logic.
This change fixes the one-shot PIT mode to behave similarly to mode 0.

TESTED: using the one-shot PIT mode to calibrate a local apic timer.

Signed-off-by: Damien Zammit <damien@zamaudio.com>

---
 hw/timer/i8254_common.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/hw/timer/i8254_common.c b/hw/timer/i8254_common.c
index 050875b497..9164576ca9 100644
--- a/hw/timer/i8254_common.c
+++ b/hw/timer/i8254_common.c
@@ -52,10 +52,8 @@ int pit_get_out(PITChannelState *s, int64_t current_time=
)
     switch (s->mode) {
     default:
     case 0:
-        out =3D (d >=3D s->count);
-        break;
     case 1:
-        out =3D (d < s->count);
+        out =3D (d >=3D s->count);
         break;
     case 2:
         if ((d % s->count) =3D=3D 0 && d !=3D 0) {
--
2.39.0



