Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 706D1445531
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Nov 2021 15:19:46 +0100 (CET)
Received: from localhost ([::1]:35074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1midaj-0008MB-Ke
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 10:19:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1midNr-0006sW-0Q
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 10:06:27 -0400
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e]:38789)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1midNo-00010n-Jm
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 10:06:26 -0400
Received: by mail-io1-xd2e.google.com with SMTP id v65so7010838ioe.5
 for <qemu-devel@nongnu.org>; Thu, 04 Nov 2021 07:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oLmdczkCWtTXgS+hIrrLVL8jr4D4Q93OjOn0dkypiZQ=;
 b=bw15/a0TzFGJUpNj510qR5nOo/8BQ4yG74ERWTJW2cnP5q0VEZceHvrE+7GqeqlW1o
 mRIUB4v7Z74iEFNYiGRN2xaALikC9r8jVjce2IGkN3f7AH8z7iiCsUxmv1yQ/rQGgWWG
 lNwS6UsMnO4qAOFmLhDXpIBzdnyxcrSodGPqRUmztxBv0B1lsWfPuoE++66ZG+BaHA5K
 QG08fAvtfmnVxOeJrN/1mZIEYMd5HV8WxJo5sCqX+t3Rn1DaxJVrEWKRc8ypALGODKQa
 qePYUsHT5sEGydDP7g/zmzJk1ep8ZH6d7GT6KhL+UNokEVBKgTgUBLuEpy7OuVjX8wGB
 Sovg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oLmdczkCWtTXgS+hIrrLVL8jr4D4Q93OjOn0dkypiZQ=;
 b=3MF0IZljHpsoJBkX33Jv98hUqp+0gyQFWRTZ0e75JPrcDrGF0Q8Kjws6eUsKXDcE16
 G/EJGK34Vmiw4k44Z6eani9KCnLB8HJC1KCk7ET0TzOSR0j0L3itzN5fmpKTAJOcIyFo
 L09UiHyLMbxvAyUKVVlTFu49/PwL/tWXxPvfapoNu9nU/obn8+gLILPcF3MVkV6Isvr9
 BW/FZvGii51p5VDNwLJgRanWExqFyyKlOmq+TVr8a6dW//6Ku/iYYt2q91lfyL2oaBvd
 dPM2CsZIhiAoePSsveOu0ttfVrep/Msevr1ZoKADxWfg2MR6NzFR0Evs6jzq2sIQMxMp
 VCSA==
X-Gm-Message-State: AOAM533PIPDvlm4f9HTyeMZ18d0pJaA64lk+7XJe7Z2mxZ/kpO7C/Vve
 qghb6O91nrfO9BCJsM4acjtt9TLHDxtBww==
X-Google-Smtp-Source: ABdhPJxWzcY/Aw6jc4yUn0V2MFlI676Wh7m3YwO8jOKymqo9nNPaPiUH7nEdj+yg8YmlQSvetWvWdw==
X-Received: by 2002:a5d:9753:: with SMTP id c19mr22571466ioo.136.1636034781893; 
 Thu, 04 Nov 2021 07:06:21 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id l2sm3206741iln.50.2021.11.04.07.06.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 07:06:21 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 14/29] bsd-user/arm/target_arch_elf.h: arm defines for ELF
Date: Thu,  4 Nov 2021 08:05:21 -0600
Message-Id: <20211104140536.42573-15-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211104140536.42573-1-imp@bsdimp.com>
References: <20211104140536.42573-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d2e;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Stacey Son <sson@FreeBSD.org>, qemu-trivial@nongnu.org,
 Kyle Evans <kevans@FreeBSD.org>, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>, Philippe Mathieu-Daude <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Basic set of defines needed for arm ELF file activation.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Kyle Evans <kevans@FreeBSD.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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
2.33.0


