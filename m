Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B75F1341EB
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jan 2020 13:40:24 +0100 (CET)
Received: from localhost ([::1]:42884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ipAdL-0005Nf-5Z
	for lists+qemu-devel@lfdr.de; Wed, 08 Jan 2020 07:40:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60335)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <paolo.bonzini@gmail.com>) id 1ipAWN-0003kl-2J
 for qemu-devel@nongnu.org; Wed, 08 Jan 2020 07:33:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <paolo.bonzini@gmail.com>) id 1ipAWL-0004Jr-Uq
 for qemu-devel@nongnu.org; Wed, 08 Jan 2020 07:33:10 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:46969)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ipAWL-0004Ir-Ol
 for qemu-devel@nongnu.org; Wed, 08 Jan 2020 07:33:09 -0500
Received: by mail-wr1-x429.google.com with SMTP id z7so3123858wrl.13
 for <qemu-devel@nongnu.org>; Wed, 08 Jan 2020 04:33:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=se+V48CVFj2UMhia/l7TQbfN4HTq3HN6TcBQFtKO7+Q=;
 b=P7qTUpIzEQ0plOiP2KBlmpij9QZ42bwoNHY3LRT7zFaWoHfdzl63+1zdchsfS80Hda
 SB0TnjbnZca8TKkaDrfVTSVKVxz61K4ouh2CUQV/NIPlBUn7HnxqrrQkAzIUOsOotyEf
 SVW5los9GV9CrwClztMzEcnaElnNLZfKQpjSPsdCnkjFZeIA91tfoivs+q9NvAAaqOjQ
 +BFKsuD+U/svCvFIBBcmGYRJn4JPC5jI7yHsjVJSCjlSFtwJJqL/Kc75x/4gwgnZhWKd
 MMjDQVqoQILCvMpnLjCzIC1BCSWHzvgFDbkuibNfuw6Ba3ghiTIl9W0rwdeqYymAFcKF
 ULZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=se+V48CVFj2UMhia/l7TQbfN4HTq3HN6TcBQFtKO7+Q=;
 b=SPu4e+H0yGmF6DyEZ6ej6FEgoYYccvdksyolaLnEhGWhFALUKTwJWW7CGp9KHAFbJH
 09lZpXnpPA/z+26kTr/4QlrfZvGa04MxOux8lJnWLu6ftsq8t6M0YpIbLUyloghexKeh
 p8h3Nd0bzIkciY9o5IdiF8itm6F7rk88FhyUg47+88XSqwN4K6hMFn58tINcurc8t5wD
 7yleH+sMDJM9humUIx1nZlWre7NRSD/8VlM/YvRic471f1t+fgYbnTnZoXNjpTF84FQr
 IDSod+D/QOMzKLeGSeir79aE+hj6TLZSHX6UwIY9oC7nt1jvZzbvfHdfJxB/GB/QDmOg
 u//w==
X-Gm-Message-State: APjAAAV1h2Ai7J2Cb+DUfPwHniJ+lC2HWM8DyPqTGeSzZDJ8jEOXHkP6
 ehqRtOAjyzTySuQLEthttjCgR1lC
X-Google-Smtp-Source: APXvYqy12AOv3O4ADmjF14ctfr2Vd5agtCJLpeRKhyObrB8zens0tkyadRDfu934KV1Nt8FK4DYltQ==
X-Received: by 2002:a5d:45c4:: with SMTP id b4mr4242923wrs.303.1578486788568; 
 Wed, 08 Jan 2020 04:33:08 -0800 (PST)
Received: from 640k.lan ([93.56.166.5])
 by smtp.gmail.com with ESMTPSA id o4sm4037750wrw.97.2020.01.08.04.33.07
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 08 Jan 2020 04:33:08 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 12/38] hw/ppc/Kconfig: Restrict the MPC I2C controller to
 e500-based platforms
Date: Wed,  8 Jan 2020 13:32:29 +0100
Message-Id: <1578486775-52247-13-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1578486775-52247-1-git-send-email-pbonzini@redhat.com>
References: <1578486775-52247-1-git-send-email-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::429
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Only the PowerPC e500-based platforms use the MPC I2C controller.
Do not build it for the other machines.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20191231183216.6781-7-philmd@redhat.com>
Acked-by: David Gibson <david@gibson.dropbear.id.au>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 default-configs/ppc-softmmu.mak | 1 -
 hw/ppc/Kconfig                  | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/default-configs/ppc-softmmu.mak b/default-configs/ppc-softmmu.mak
index bf86128..61b78b8 100644
--- a/default-configs/ppc-softmmu.mak
+++ b/default-configs/ppc-softmmu.mak
@@ -1,7 +1,6 @@
 # Default configuration for ppc-softmmu
 
 # For embedded PPCs:
-CONFIG_MPC_I2C=y
 CONFIG_DS1338=y
 CONFIG_E500=y
 CONFIG_PPC405=y
diff --git a/hw/ppc/Kconfig b/hw/ppc/Kconfig
index f927ec9..0cd8d40 100644
--- a/hw/ppc/Kconfig
+++ b/hw/ppc/Kconfig
@@ -105,6 +105,7 @@ config E500
     select PLATFORM_BUS
     select PPCE500_PCI
     select SERIAL
+    select MPC_I2C
 
 config VIRTEX
     bool
-- 
1.8.3.1



