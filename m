Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AF12488288
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 09:43:03 +0100 (CET)
Received: from localhost ([::1]:34620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n67JW-0006tm-C7
	for lists+qemu-devel@lfdr.de; Sat, 08 Jan 2022 03:43:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n66Io-0005MR-1e
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 02:38:15 -0500
Received: from [2607:f8b0:4864:20::d2a] (port=42722
 helo=mail-io1-xd2a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n66Il-0003SS-5q
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 02:38:13 -0500
Received: by mail-io1-xd2a.google.com with SMTP id o7so10064060ioo.9
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 23:38:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sjaqpy92Qqb3sdMZ3pMivxUNnqWoJmC1P4NXVM3iJJ0=;
 b=wjbDNF5wCrK2G7xaZUgCegeMYo3quGu1UezlFzJXcWn5zF/OaW388Kq2USsWN89g4h
 afcpBEAS+rHLpIRp0Epojk4r8rmHgTICcd+pTJJkicvRa11WseJFhmukB5GJKPKqIfZP
 ZO3DSTd3LlxODvfWs/80OVgJ77yv+vzD3WxzfBYIBloGwePbiOeSjrw+6CSmNsRVh55y
 rR4SNMUCGlYsggK8gvUPqkFQcWAMybGq/wSBLlSUUzhKaWh8pFp0Od/6p7gUwG+i3blf
 hrHcOHyGo9oKYK/R6HoEyqa7o6hn9IV4864ZwmIp8XCRaEmYE8Jl1MrwV5s177FVTMca
 ssrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sjaqpy92Qqb3sdMZ3pMivxUNnqWoJmC1P4NXVM3iJJ0=;
 b=Ac87Gj+yD7Cdz4ZRt55Q28sUv9u2R96CcB37+PHFa+Dixw3H8wZrwgGVneN49/gu+g
 kLMu5SIuK369itA9CgJBaOpmvaEVcZg3bK67lSEjrVuXGk6ohBv6ml9ZCW/HR1Wic46O
 PulTrIxyQJbrhvWhEkM0nci95t/aLISFcdn/cK8fexby9PGLsJmzoEvJcgM7W9jgZ6MO
 V0c+g8OgopbaUmgJ9F6hhF7gCV5iK7GCtdQcOBonq/8SIJvGFxgCMSP2SuWeVPacB00w
 VrgUzztfkfS1w+H8s9Tzeh1nSLGG3HFsclr044qMiCdZfT/1EMvCNbjX2/ybhVOtBlwi
 fEqQ==
X-Gm-Message-State: AOAM5326ybuORHMuMdqoTObqCVOrEBN7zm51UaKdaS+qmmlzUPMHobgZ
 rTiDPdUsWTaNmKWbhjuyvwIfyqecaTXL4DVW
X-Google-Smtp-Source: ABdhPJzF61SpPoI8HzUsiS3nGUXqJp+KOQVOrBZJAF2/Cd6rGmfVsb6Z15L+GRiVNBXbfJJ9twbJpg==
X-Received: by 2002:a5d:97c3:: with SMTP id k3mr31834006ios.191.1641627488893; 
 Fri, 07 Jan 2022 23:38:08 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id w19sm613022iov.12.2022.01.07.23.38.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 23:38:08 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PULL 26/37] bsd-user/arm/target_arch_elf.h: arm defines for ELF
Date: Sat,  8 Jan 2022 00:37:26 -0700
Message-Id: <20220108073737.5959-27-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220108073737.5959-1-imp@bsdimp.com>
References: <20220108073737.5959-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d2a
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d2a;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2a.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>,
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
index 00000000000..15b5c66511f
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
2.33.1


