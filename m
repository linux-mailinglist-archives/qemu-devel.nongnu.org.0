Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C98491341EE
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jan 2020 13:41:15 +0100 (CET)
Received: from localhost ([::1]:42888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ipAeA-0006N9-9j
	for lists+qemu-devel@lfdr.de; Wed, 08 Jan 2020 07:41:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60308)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <paolo.bonzini@gmail.com>) id 1ipAWL-0003iU-Fw
 for qemu-devel@nongnu.org; Wed, 08 Jan 2020 07:33:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <paolo.bonzini@gmail.com>) id 1ipAWK-0004HK-9e
 for qemu-devel@nongnu.org; Wed, 08 Jan 2020 07:33:09 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:40809)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ipAWK-0004Gj-30
 for qemu-devel@nongnu.org; Wed, 08 Jan 2020 07:33:08 -0500
Received: by mail-wm1-x335.google.com with SMTP id t14so2304819wmi.5
 for <qemu-devel@nongnu.org>; Wed, 08 Jan 2020 04:33:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rosgTXU7NuqW50rtytxejrl5MTYMCw63euXWmhTQ/DQ=;
 b=m+wiMyb8fphkXLN0I9PLhEl1eEr9pbC7K3mvoiS4DiKUTkuy2xJydGyegQQ9myq3dg
 /n4pJ5zLWljrjsCh48GN7uAabfG0CAC/oQKge9Go4kiHpl/EzVOtOhLHFgKgfDQWxDFA
 sKKfKUGjdsvGl1CW8aELKg90ynN2RBuW2y+1gD847lLoTA1S/Ajig/F6yP7Pi8H1x2T8
 4YI1xPzA4++8NLnhdevi38/3sdN9XJaqeP6ysCFN1yKB589jLjqGwp671ORgAvmdAxBh
 9ZJDQily4hHvxfRIMWPcdHJNRglJd4mJm6/g346lVsJlqRMfoIPaomAmXJWJzpzY+RSO
 8qxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=rosgTXU7NuqW50rtytxejrl5MTYMCw63euXWmhTQ/DQ=;
 b=sc1Pl1lZF4QUyoqKtCb9AeY2ukmnjDPcbNpabFIccommu3nCFYvweDG6A7Y4/eDju4
 9hxrhVoZR4FrU78m8AEzKCgdcYcISPjMpDPji+kTdPgNjuIZzSAUk9X9KIeMf+aIRMy9
 1RQ+RtaD5zpk0evVMVsQeKgoSOglOIdwfeM0obADBRs0WMPkMvcRhr2UckRHDJ//vIU3
 OzWc6YQ7F9xPnLX1+VGqnGbUf4Dt39FsV+tXWrytp/vVnsR1C4Bn52eca/hUlVEpl2Iv
 0RYAXK6YU7pMHQuoYrJfZkWC3eP9QESzWH2ZrpQt4vJIGH3YXznkCGyNeBB9QVuvPgdW
 9XeA==
X-Gm-Message-State: APjAAAVksoS7ykE4sHsyFxprAKsoknTuO75sWDG4wqXttF+6Ggp7b0b0
 Vd5qCM1WVGgVuIFgLhwNIRxlI2kk
X-Google-Smtp-Source: APXvYqwft8YVYbtgH9fIxJ+ClV1SutL+5Pw9ND74+AU1CM0P25KR7R2b+uGmnp2CiKQlp1et4X33ag==
X-Received: by 2002:a1c:a50e:: with SMTP id o14mr3528011wme.2.1578486786831;
 Wed, 08 Jan 2020 04:33:06 -0800 (PST)
Received: from 640k.lan ([93.56.166.5])
 by smtp.gmail.com with ESMTPSA id o4sm4037750wrw.97.2020.01.08.04.33.05
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 08 Jan 2020 04:33:06 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 10/38] hw/intc/i8259: Fix Kconfig dependency on ISA bus
Date: Wed,  8 Jan 2020 13:32:27 +0100
Message-Id: <1578486775-52247-11-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1578486775-52247-1-git-send-email-pbonzini@redhat.com>
References: <1578486775-52247-1-git-send-email-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::335
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

The 8259 Interrupt Controller sits on a ISA bus.
Add the missing dependency to fix:

    LINK    x86_64-softmmu/qemu-system-x86_64
  /usr/bin/ld: ../hw/intc/i8259_common.o: in function `pic_common_realize':
  hw/intc/i8259_common.c:84: undefined reference to `isa_register_ioport'
  /usr/bin/ld: hw/intc/i8259_common.c:86: undefined reference to `isa_register_ioport'
  /usr/bin/ld: ../hw/intc/i8259_common.o: in function `i8259_init_chip':
  hw/intc/i8259_common.c:97: undefined reference to `isa_create'
  collect2: error: ld returned 1 exit status
  make[1]: *** [Makefile:206: qemu-system-x86_64] Error 1

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20191231183216.6781-3-philmd@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/intc/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/intc/Kconfig b/hw/intc/Kconfig
index 10a680b..a189d6f 100644
--- a/hw/intc/Kconfig
+++ b/hw/intc/Kconfig
@@ -3,6 +3,7 @@ config HEATHROW_PIC
 
 config I8259
     bool
+    select ISA_BUS
 
 config PL190
     bool
-- 
1.8.3.1



