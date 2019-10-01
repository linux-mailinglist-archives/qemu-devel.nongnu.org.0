Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82467C3613
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Oct 2019 15:43:21 +0200 (CEST)
Received: from localhost ([::1]:42278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iFIQx-0004Li-NQ
	for lists+qemu-devel@lfdr.de; Tue, 01 Oct 2019 09:43:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58064)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <paolo.bonzini@gmail.com>) id 1iFIKS-00065o-Gf
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 09:36:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <paolo.bonzini@gmail.com>) id 1iFIKR-0001fO-AO
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 09:36:36 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:45663)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
 id 1iFIKR-0001eH-4T
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 09:36:35 -0400
Received: by mail-wr1-x444.google.com with SMTP id r5so15528489wrm.12
 for <qemu-devel@nongnu.org>; Tue, 01 Oct 2019 06:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references;
 bh=H449cNVRaL6XSCU/dlyiydLxUhuSV3o/ZTq+QK6WcPM=;
 b=N4xxJ8Vg2YeUNbMhvLen/i9MIKIVgMVLZuXueiU8zCueNSbBv8W+wIIyvlvECjtaIM
 xpDD7yg+U/EDdtluSp5edBr8iCLm4hOYmadXcUHa00S+fRcJi2DN+08dyyThbNDlN5Gu
 o/jja2kxNh40CJPtkic97XD73AxZqtJxXhBxhCVRdtNMooUMmDCBaowujlSZ+RPwXTvG
 aqz3AmOds/IeE3yAnRYPaOfLGg9M6uAOLhd9gCInXa3sB+a2eOaQ94ZJp/P3Zqbeai3v
 mw2Y+Sb/f29jHcXf44OuWhHWJ19FD96gaEOU4r0BZ/Hdj1ujb3OcrcAWNFzKkTdSFuSo
 ek8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references;
 bh=H449cNVRaL6XSCU/dlyiydLxUhuSV3o/ZTq+QK6WcPM=;
 b=JK6RYR3w4kkiP7faYmd7i0CpM0Ac1DT6mAt5eaWMvDStb9DXHLbT/J3EF9bhIaqLPl
 T6xC+GS5x9NEmsGpY4wu10NZevGJ2OItCoq+iB198rdFHs4jkQIqfzUs7es4/kfaNF+T
 87ANwVgpt8ZPdtELLp+8Nckw7/iw7k247vFF4Ms3aqVgI60oW8Abyk1cQWm0k/hWBQ3k
 yhE9KjzQSGTjtXbfCr1SKrJ7/zbGKVj/U1PCbNFFooZiKZ7o+leYTfNQ8Anz6EVN8hFf
 t+H4ngKv/KK6gk7hsczYeMeiqHM8ThF+5552UtN4PYxKjbb0ZuGmkZGL2dyRH6brB7fQ
 PTBg==
X-Gm-Message-State: APjAAAXfS2TXMDl/fHuGilYdBnQotZ/2XXGLm+FYHPDbqLLndARskeVi
 yUeBKsb5AWVMnx1ZzSzh6OaKRM5+
X-Google-Smtp-Source: APXvYqwughsDhyVU0Q3karlrZt1Tq3v78M+NxGU6bgwcWg2U7AFNEkCNChPih6zjXsuTwN8TzmSjpA==
X-Received: by 2002:a05:6000:10ce:: with SMTP id
 b14mr16831377wrx.96.1569936993346; 
 Tue, 01 Oct 2019 06:36:33 -0700 (PDT)
Received: from 640k.localdomain ([93.56.166.5])
 by smtp.gmail.com with ESMTPSA id q192sm4424575wme.23.2019.10.01.06.36.32
 for <qemu-devel@nongnu.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 01 Oct 2019 06:36:32 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/8] mcf5208: fix leak from qemu_allocate_irqs
Date: Tue,  1 Oct 2019 15:36:23 +0200
Message-Id: <1569936988-635-4-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1569936988-635-1-git-send-email-pbonzini@redhat.com>
References: <1569936988-635-1-git-send-email-pbonzini@redhat.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::444
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

The array returned by qemu_allocate_irqs is malloced, free it.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/m68k/mcf5208.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/m68k/mcf5208.c b/hw/m68k/mcf5208.c
index 012710d..60c5802 100644
--- a/hw/m68k/mcf5208.c
+++ b/hw/m68k/mcf5208.c
@@ -273,6 +273,8 @@ static void mcf5208evb_init(MachineState *machine)
                      0xfc030000, pic + 36);
     }
 
+    g_free(pic);
+
     /*  0xfc000000 SCM.  */
     /*  0xfc004000 XBS.  */
     /*  0xfc008000 FlexBus CS.  */
-- 
1.8.3.1



