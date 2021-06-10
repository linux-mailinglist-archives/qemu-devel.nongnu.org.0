Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 901463A2C56
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 15:02:27 +0200 (CEST)
Received: from localhost ([::1]:36496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrKKI-0005xy-MB
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 09:02:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1lrKHO-0004nQ-LR
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 08:59:26 -0400
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e]:45989)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1lrKHM-0006gr-Od
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 08:59:26 -0400
Received: by mail-qt1-x82e.google.com with SMTP id l17so16696229qtq.12
 for <qemu-devel@nongnu.org>; Thu, 10 Jun 2021 05:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:content-transfer-encoding:mime-version:subject:message-id:date
 :to; bh=iV/QS+kdTgRRSxpLusRJ/jCEq+X4AbQalUusSNyEzP8=;
 b=NTmB+aCFuqTekRCMmD/M0d8qvgA+nyK0DB1QPyEn0ayzTuNiuuPY+Asv+dMaPbnVWY
 tw34vnflJmY/cyK/gOf8Ec7kRxXxMT769Qqu48p3AgaP89VDxNoeJU6SF/vBR6K9Fxeq
 3tkYBo7/Vj4rUVR0xQmYK8GQT7mMHn9xNjU8DK2ucRXAERgezvKd91aVljHxVT27O4fJ
 SRiMJtTP6ICeLWEr7QMKt67c41ViWt4xLXso+y37St5jyVg0gWR1KCRNRh/GHMOv7YiG
 bkdiNVZl+cFmssPFgsUgOLH3E8UH4urTdWu1o9y/HL57I5exKI9fDfAeOG1vkiu+0DIp
 6jVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:content-transfer-encoding:mime-version
 :subject:message-id:date:to;
 bh=iV/QS+kdTgRRSxpLusRJ/jCEq+X4AbQalUusSNyEzP8=;
 b=QOweMq4c1x+q/hLGc+fU14oeQaHqO5RcpQnpfa+gRQUqww7Io4syP6WRrB0h8E9VBg
 ryZbsRBGj2bwGIJkQzifRvf2kb52Huhc1Wau4+Lp3f3BdvRBdyYV5nOKqguXpey0t8uc
 Uxx0B2EKsp0KTXbPKIGb9ZqIgRAd93k1ei5BUjOjFvTW3trxV1Om6luxsK7FTRgF1GGJ
 eD3rHv/PqN/J+Nixe3RYym5ETokNOsK7KPtT9b8P1x/5JdqwVG7c3UD7A9tUatkg9qhC
 Va1G+++/J9YOKSKX8iPv/7306WS/3Lu6JZi4WES+JP4P8q9OboFlqUyzy7B0QhAka6pB
 roRw==
X-Gm-Message-State: AOAM530aqLlWBhLwHIYOEW+n8BFQ+TBIPpsHBHfpyNOQbCj2fRlIxRdo
 W5Yf3Z5wB+ztKW3mIlBMMG0=
X-Google-Smtp-Source: ABdhPJz3fMbHq63iXRnXu8a7HpjslTgktilaXo0N0W1CWabH31yL0i25WDnN1ezEFNpk29y5Xru/Ew==
X-Received: by 2002:ac8:4e29:: with SMTP id d9mr5178294qtw.136.1623329963192; 
 Thu, 10 Jun 2021 05:59:23 -0700 (PDT)
Received: from [192.168.0.6] (d149-67-175-105.try.wideopenwest.com.
 [67.149.105.175])
 by smtp.gmail.com with ESMTPSA id x10sm2137600qkf.42.2021.06.10.05.59.22
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 10 Jun 2021 05:59:22 -0700 (PDT)
From: Programmingkid <programmingkidx@gmail.com>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.40.0.2.32\))
Subject: tb_flush() calls causing long Windows XP boot times
Message-Id: <BCB8773B-FC54-4C25-9B60-92C263165D38@gmail.com>
Date: Thu, 10 Jun 2021 08:59:20 -0400
To: Richard Henderson <richard.henderson@linaro.org>,
 QEMU devel list <qemu-devel@nongnu.org>
X-Mailer: Apple Mail (2.3654.40.0.2.32)
Received-SPF: pass client-ip=2607:f8b0:4864:20::82e;
 envelope-from=programmingkidx@gmail.com; helo=mail-qt1-x82e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Richard,

There is a function called breakpoint_invalidate() in cpu.c that calls a =
function called tb_flush(). I have determined that this call is being =
made over 200,000 times when Windows XP boots. Disabling this function =
makes Windows XP boot way faster than before. The time went down from =
around 3 minutes to 20 seconds when I applied the patch below.=20

After I applied the patch I ran several tests in my VM's to see if =
anything broke. I could not find any problems. Here is the list my VM's =
I tested:

Mac OS 10.8 in qemu-system-x86_64
Windows 7 in qemu-system-x86_64
Windows XP in qemu-system-i386
Mac OS 10.4 in qemu-system-ppc

I would be happy if the patch below was accepted but I would like to =
know your thoughts.

Thank you.


---
 cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/cpu.c b/cpu.c
index bfbe5a66f9..297c2e4281 100644
--- a/cpu.c
+++ b/cpu.c
@@ -253,7 +253,7 @@ static void breakpoint_invalidate(CPUState *cpu, =
target_ulong pc)
      * Flush the whole TB cache to force re-translation of such TBs.
      * This is heavyweight, but we're debugging anyway.
      */
-    tb_flush(cpu);
+    /* tb_flush(cpu); */
 }
 #endif
=20
--=20
2.24.3 (Apple Git-128)



