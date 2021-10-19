Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FDC5433CDD
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 18:59:38 +0200 (CEST)
Received: from localhost ([::1]:36828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcsSf-0007jr-AS
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 12:59:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcsF9-0000N1-7c
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 12:45:40 -0400
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32]:42894)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcsEs-0000QL-IF
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 12:45:38 -0400
Received: by mail-io1-xd32.google.com with SMTP id z69so17989923iof.9
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 09:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XzE2jU0su05kDtVbOWf+vABzyOorkzBBpxHUdiCDmT4=;
 b=FHV3Q5bRXKaNAmjjnFV84B16PVqFcs6MoxCSIWOWqGKeaiegeBH9mBM+p7o43n1c4D
 fAfng2K3vr8azZVuEICzuYzcpHEjZYYfK4F9ng4BkGYazl6alAPgbybRIr0eyauhSJwy
 s83Sh8QHRHu5bgWuqzK6k+lY9PtYkjPu2RTQnctXLXfV05zQ752ziSMD8sFKPEpc7BCp
 MhCYN1udj1hA7ds4PSvC+J8jVe4AU6IDO7/7+Hkf775LNp5JGdByTQ9SSQBJOF5b39rj
 0kG16juqp//vGQTJ+bgSRax2ZncIM+BT8dwPlYxLsWCK9V8q7GKBzvZIJU4G3dzq11G2
 HGQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XzE2jU0su05kDtVbOWf+vABzyOorkzBBpxHUdiCDmT4=;
 b=wBJEBZZg/jdJ0wBfkqJqT/JALTQS0uOQ/EfMlsetNB0YGGpsCoLyFfW6ZRQsmzsBS8
 JZgm0oYm/oOK+T6XB8IwCdV0vPJ6k/IGEoDhfw/yO6DoOg3a9Enc0RrTQiw4SH88LOHO
 RYBGQHiDHYhkFKnYKOIPtncCMi9WKhqZG3WShtlrzWWxWGcokwws/yLxxnGe1sWlb/09
 bRyolFduLeJCQK9RatnwKEGMwT1OLKnLofnYq7VPwluqHBB8ZcYevGmvSxvz+r80Kpb1
 9LgogO8LkznrsMw2x+taQ2jkwLCNQhezTZ25Ujwsk0IZUMplocIwLEfTeYg1Vomhod07
 x92w==
X-Gm-Message-State: AOAM530xTENVcUNaLek904NFBvSz4rUwGkhP7iEoSOFpA/CoBHlY4qmm
 4wRFc+dJI3Qnsut3PLZncbSG0ttOxEKuCg==
X-Google-Smtp-Source: ABdhPJwoAE248wEI72c/9W7/VIu8F4u2VjSF+fYkbTtTQfdn90a6GWkuN7O0di/ojBd9K9Wd5+7ZMg==
X-Received: by 2002:a02:cb94:: with SMTP id u20mr4901519jap.134.1634661920562; 
 Tue, 19 Oct 2021 09:45:20 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id q7sm1133951ilv.48.2021.10.19.09.45.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 09:45:20 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 14/24] bsd-user/arm/target_arch_elf.h: arm defines for ELF
Date: Tue, 19 Oct 2021 10:44:37 -0600
Message-Id: <20211019164447.16359-15-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211019164447.16359-1-imp@bsdimp.com>
References: <20211019164447.16359-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d32;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd32.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: Stacey Son <sson@FreeBSD.org>, qemu-trivial@nongnu.org,
 Kyle Evans <kevans@freebsd.org>, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Basic set of defines needed for arm ELF file activation.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/arm/target_arch_elf.h | 36 ++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 bsd-user/arm/target_arch_elf.h

diff --git a/bsd-user/arm/target_arch_elf.h b/bsd-user/arm/target_arch_elf.h
new file mode 100644
index 0000000000..15b5c66511
--- /dev/null
+++ b/bsd-user/arm/target_arch_elf.h
@@ -0,0 +1,36 @@
+/*
+ *  arm ELF definitions
+ *
+ *  Copyright (c) 2013 Stacey D. Son
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License, or
+ *  (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+#ifndef _TARGET_ARCH_ELF_H_
+#define _TARGET_ARCH_ELF_H_
+
+#define ELF_START_MMAP 0x80000000
+#define ELF_ET_DYN_LOAD_ADDR    0x500000
+
+#define elf_check_arch(x) ((x) == EM_ARM)
+
+#define ELF_CLASS       ELFCLASS32
+#define ELF_DATA        ELFDATA2LSB
+#define ELF_ARCH        EM_ARM
+
+#define USE_ELF_CORE_DUMP
+#define ELF_EXEC_PAGESIZE       4096
+
+#define ELF_HWCAP 0
+
+#endif /* _TARGET_ARCH_ELF_H_ */
-- 
2.32.0


