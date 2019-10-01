Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 613A3C3644
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Oct 2019 15:49:18 +0200 (CEST)
Received: from localhost ([::1]:42364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iFIWj-0001KD-D7
	for lists+qemu-devel@lfdr.de; Tue, 01 Oct 2019 09:49:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58083)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <paolo.bonzini@gmail.com>) id 1iFIKT-00067B-PM
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 09:36:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <paolo.bonzini@gmail.com>) id 1iFIKS-0001hF-RT
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 09:36:37 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:38778)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
 id 1iFIKS-0001g7-LM
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 09:36:36 -0400
Received: by mail-wm1-x344.google.com with SMTP id 3so3296333wmi.3
 for <qemu-devel@nongnu.org>; Tue, 01 Oct 2019 06:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references;
 bh=+d1Xh6ZliwwFNLY1oySHOclHXGDSuGkLUL7VXwzAtgk=;
 b=WL3igQFxDImBfqKXOZ286t2HBWk4pXpnCkrPskxhy8EQHVHVONsan2tZumx2OZEt2C
 WK94e18MXug78KHcSUSnE5v/loDef1XJBg7e8HaTZTN/DQEH0/hekVEXOvY0bEVev/5E
 9DrpKLQS4qHucCAQLIMqeX7ZeyMG9ZbUzXF0oeemtcJqnqqWa+4hAtZsezZyoybXacqK
 py07TvCSixYi2BNukJRXvTXvCM9gs3RL8iIG/L2tzLA56R2hlnkj/yWxxYgQqxZ/5Gev
 91gppGY6P+abej5F+HgvP1vItKC0/wGDdl1Vd/lHsVV/9gB5tommjB3eMh62KjkjqbBF
 n0Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references;
 bh=+d1Xh6ZliwwFNLY1oySHOclHXGDSuGkLUL7VXwzAtgk=;
 b=OWbY0IsQP1Ji48H3K9G+8SJ8e0/TJu5Q70r64FZBOobOyEGUmsfIfsQztffBmLlGb4
 U6/WkhZt0kefRI42zRyMJp9C8WIef+XyHzRH/4snKpotJD2Pp+6uWekdjCDdLKNdULBN
 vbaQhK41ptjAVTVSac1uJ91RqNnN4y2m7Guuyx9A04eRNcnSnflVhEbzjM9T6RnPwuJ/
 9uFCPV3W9yhMhNoQwFreITt64yBMTX0ryWW1ixCvRaC2mRL7I0bcVV0LnKX/tncK5CyX
 Nv5LWIohiWA+X2SchblgvN0KKmE8JM5SZOCtO8EzzjxHMGkZ3V4RK3vBekEEAPgqG47C
 TeXw==
X-Gm-Message-State: APjAAAXLxhZnYGAn/uZ7S9DQ9LqRK9XWihMh/ot1lKUl/Ju/v5Nl2fQ4
 ojfq1wKf1lG0SjXo5zohUwSLJYPI
X-Google-Smtp-Source: APXvYqxPP4XLvu25pcsm89iM9p7KjWDt1pxWpiJRrMeNZPxozZ4iTGI+9XOZ3zzsf1byvTvJIQRDSA==
X-Received: by 2002:a1c:1f47:: with SMTP id f68mr4106330wmf.78.1569936995187; 
 Tue, 01 Oct 2019 06:36:35 -0700 (PDT)
Received: from 640k.localdomain ([93.56.166.5])
 by smtp.gmail.com with ESMTPSA id q192sm4424575wme.23.2019.10.01.06.36.34
 for <qemu-devel@nongnu.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 01 Oct 2019 06:36:34 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/8] mips: fix memory leaks in board initialization
Date: Tue,  1 Oct 2019 15:36:25 +0200
Message-Id: <1569936988-635-6-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1569936988-635-1-git-send-email-pbonzini@redhat.com>
References: <1569936988-635-1-git-send-email-pbonzini@redhat.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::344
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

They are not a big deal, but they upset asan.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/mips/mips_int.c  | 1 +
 hw/mips/mips_jazz.c | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/hw/mips/mips_int.c b/hw/mips/mips_int.c
index 5ebc961..863ed45 100644
--- a/hw/mips/mips_int.c
+++ b/hw/mips/mips_int.c
@@ -81,6 +81,7 @@ void cpu_mips_irq_init_cpu(MIPSCPU *cpu)
     for (i = 0; i < 8; i++) {
         env->irq[i] = qi[i];
     }
+    g_free(qi);
 }
 
 void cpu_mips_soft_irq(CPUMIPSState *env, int irq, int level)
diff --git a/hw/mips/mips_jazz.c b/hw/mips/mips_jazz.c
index c967b97..8d010a0 100644
--- a/hw/mips/mips_jazz.c
+++ b/hw/mips/mips_jazz.c
@@ -362,6 +362,8 @@ static void mips_jazz_init(MachineState *machine,
 
     /* LED indicator */
     sysbus_create_simple("jazz-led", 0x8000f000, NULL);
+
+    g_free(dmas);
 }
 
 static
-- 
1.8.3.1



