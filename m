Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6079554599
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jun 2022 13:04:31 +0200 (CEST)
Received: from localhost ([::1]:33174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3y9u-0002t4-Qg
	for lists+qemu-devel@lfdr.de; Wed, 22 Jun 2022 07:04:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o3xzq-0004bY-G9; Wed, 22 Jun 2022 06:54:06 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:37866)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o3xzo-0005Ts-VV; Wed, 22 Jun 2022 06:54:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=445j6yhRsZQ18OxLojcfBAM3WNj3gP5q9l/as7NXJ/g=; b=aUH+NLsZ4DQHf4b9E8kI3ESIbE
 aK88TWMFkuzLXS9kO4Pqs7qOjUBuw5tgsKL6Tsyz2MCkYzGDWoJS9g+kMwxz9kF/iO4q9ObZn5SO+
 +VUh50E7ZOQgrxRd7z8ppT7xL7Pt+3Yh66cWEUNjIW4+URONMcCpAKGpKfHbg4pSdpyCoB9qpqnmL
 O+Uuz5as2xUbTNaMYqv7BT1Vonx6jjH0jlLatWYYlm8mRYdfBCkyYSMVkY5CR5d698kCFvmB0YowI
 4j/T93/4uRskQ6eLjp/wosQl17axQ0YiNPLMItpRJu24f0zjHJcru9fVTEEJzeJeMmywok0JDPjVm
 hWQfbLzjPWbFyWkNUwH5ypw1rZROWsxorWqQsCMEW9F9e3ARomUMjnfvQBJT+HmGspbuQJEl28yMr
 GzRjjbBNuwXIalPVMtGrcRtGLgNW+DuJfCz4HsQp2S91ejtKgf5y786h12amdIpju5c4PN+yVlyv9
 6kzXH9nJHA3U8OS3j62eUjcI6VVwm8KkoK4BAu2AK9eyRNwsdfozZY8TiNvp6gFAR5GvVFTUE2zxB
 RFW2XtALjfIszy3YvVhsbzJGc0Kp/s9H2Jk7rlQ01DahJoRPt3/PFKBP6tzcGo581jWD/NDn0C0xi
 wml0OCE+UjTXu9Z3P6APDk8ZGHuja4wbqSiw+2aV0=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o3xyY-000CTX-6R; Wed, 22 Jun 2022 11:52:50 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: pbonzini@redhat.com, laurent@vivier.eu, fam@euphon.net,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Date: Wed, 22 Jun 2022 11:53:07 +0100
Message-Id: <20220622105314.802852-8-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220622105314.802852-1-mark.cave-ayland@ilande.co.uk>
References: <20220622105314.802852-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v3 07/14] q800: implement compat_props to enable
 quirk_mode_page_vendor_specific_apple for scsi devices
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

By default quirk_mode_page_vendor_specific_apple should be enabled for both scsi-hd
and scsi-cd devices to allow MacOS to format SCSI disk devices, and A/UX to
enumerate SCSI CDROM devices succesfully without getting stuck in a loop.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/m68k/q800.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/m68k/q800.c b/hw/m68k/q800.c
index 4745f72c92..b774a5b20a 100644
--- a/hw/m68k/q800.c
+++ b/hw/m68k/q800.c
@@ -687,8 +687,10 @@ static void q800_init(MachineState *machine)
 }
 
 static GlobalProperty hw_compat_q800[] = {
+    { "scsi-hd", "quirk_mode_page_vendor_specific_apple", "on"},
     { "scsi-cd", "quirk_mode_page_apple_vendor", "on"},
     { "scsi-cd", "quirk_mode_sense_rom_use_dbd", "on"},
+    { "scsi-cd", "quirk_mode_page_vendor_specific_apple", "on"},
 };
 static const size_t hw_compat_q800_len = G_N_ELEMENTS(hw_compat_q800);
 
-- 
2.30.2


