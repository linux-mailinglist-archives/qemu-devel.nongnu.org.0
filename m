Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19AA616C0C1
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Feb 2020 13:27:24 +0100 (CET)
Received: from localhost ([::1]:54124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j6ZJ5-0005GP-4y
	for lists+qemu-devel@lfdr.de; Tue, 25 Feb 2020 07:27:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49687)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <paolo.bonzini@gmail.com>) id 1j6Yl0-000184-Ld
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 06:52:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <paolo.bonzini@gmail.com>) id 1j6Ykz-0008Fi-9P
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 06:52:10 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:46196)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
 id 1j6Ykx-00082F-EM
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 06:52:08 -0500
Received: by mail-wr1-x432.google.com with SMTP id j7so1845525wrp.13
 for <qemu-devel@nongnu.org>; Tue, 25 Feb 2020 03:51:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=FZYSBzLsY61Zm90uerBpui3NUi6OxZEJC3M/UdR0wj4=;
 b=Rr4NezGfZuuwq3JVmJUUPp+5CVY0V/lqE1h0Tr64XeWe77QIKlrS5L8/Nef0ADbRIY
 CukAPEneA0KVDqC7+6xQpuoSBApWtTGRsUVprUuTJ0RYB3boqzvf6SwzV8oayak60xL7
 19eJBRSdDZKdTNpmnmmavJRoHmQO7h7nDmaiRTI1F7OR1LUfTNMRYBHJXFFrwUM6QChT
 XvTGzWs6/oC14jPgSqyfLanvhX1Wn4+m3y1fQckoWvugBj8fsM2OvXTY3mpQV2JNEJyc
 p+Ksd6Syv7ny5bSNNz3wIP4FEUB/OTPsjlatCYsi1cZpO5zRgUbk9FBWOb8AyF+HRLgo
 vQ5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references;
 bh=FZYSBzLsY61Zm90uerBpui3NUi6OxZEJC3M/UdR0wj4=;
 b=P+08Um9wDf0+Yn3qVWITu0UoC2o66OsjzzBAJUn+Z6R5OvgSzpB6WhBn2xjT513wUp
 PuKTu3hNB6BtXzCisaTh/6Oexw8U8CBeRkMzb67Lks/tm0nM9ZCGhOBqD94yY1Hv6lvB
 Ly0L7tR8gq4H5RF6QTMlKaIG6lFiKjxuqdV/aNTpZH4C7NxkeGO0jkc3hO/3DDM8hwTc
 2Z4OEMKXNSC9rmApnbFRHwQKl0JRHz/VVpO4UHvUPYBZsG2JhD2PaNH8m7rn9tIO4/G2
 HjG8qmUL6373iWyW1KcSQ3+a5ZSC07Mf+TRc0qY55tXPtnVdy98MSQsVFZc+aEE/OUIB
 g6ew==
X-Gm-Message-State: APjAAAWT11OgxFW50t7wte8wolAjEBYTBEKuSwDQJBSpr8a8QzM+Cds4
 KRc5kGS8Ccs9mXNzeeN0QNOKSUdI
X-Google-Smtp-Source: APXvYqxNGwaDd9vL6Zrssh13/tbcW3CCqcAgG06a/EVXUAahuuMT/p24ppbH8vK6VWcTnm4/NQAv9A==
X-Received: by 2002:a05:6000:1142:: with SMTP id
 d2mr8710396wrx.62.1582631516402; 
 Tue, 25 Feb 2020 03:51:56 -0800 (PST)
Received: from 640k.localdomain ([93.56.166.5])
 by smtp.gmail.com with ESMTPSA id b67sm3922326wmc.38.2020.02.25.03.51.55
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 25 Feb 2020 03:51:55 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 054/136] mips/mips_jazz: add max ram size check
Date: Tue, 25 Feb 2020 12:49:44 +0100
Message-Id: <1582631466-13880-54-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1582631466-13880-1-git-send-email-pbonzini@redhat.com>
References: <1582631466-13880-1-git-send-email-pbonzini@redhat.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::432
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
Cc: Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Igor Mammedov <imammedo@redhat.com>

error out in case user asked for more RAM than board
supports.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Philippe Mathieu-Daude <philmd@redhat.com>
Message-Id: <20200219160953.13771-55-imammedo@redhat.com>
---
 hw/mips/mips_jazz.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/mips/mips_jazz.c b/hw/mips/mips_jazz.c
index 85d49cf..32fbd10 100644
--- a/hw/mips/mips_jazz.c
+++ b/hw/mips/mips_jazz.c
@@ -164,6 +164,11 @@ static void mips_jazz_init(MachineState *machine,
     SysBusESPState *sysbus_esp;
     ESPState *esp;
 
+    if (machine->ram_size > 256 * MiB) {
+        error_report("RAM size more than 256Mb is not supported");
+        exit(EXIT_FAILURE);
+    }
+
     /* init CPUs */
     cpu = MIPS_CPU(cpu_create(machine->cpu_type));
     env = &cpu->env;
-- 
1.8.3.1



