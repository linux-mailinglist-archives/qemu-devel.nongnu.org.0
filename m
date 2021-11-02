Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1118B443959
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 00:08:00 +0100 (CET)
Received: from localhost ([::1]:60844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mi2sp-00047s-5j
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 19:07:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mi2ez-0007Av-CX
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 18:53:41 -0400
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129]:45778)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mi2ev-0002qP-0Z
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 18:53:41 -0400
Received: by mail-il1-x129.google.com with SMTP id i12so626047ila.12
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 15:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oLmdczkCWtTXgS+hIrrLVL8jr4D4Q93OjOn0dkypiZQ=;
 b=UkDisWA5favtvBrnRYgu3Zh7u4yVI2YftcY51MkpjyL8An+/5O0NfOjDRMeGBtpQVy
 iN63brvCs2RpRRQZBeUmA2cBOP0Gu869Mx8mrjC813dn95bRwSQWanm//YoeCnoXA9nE
 bRolsj0IVam+KRM5fK93cHhiI0OxkcJn9z+TvcunkrXj6EWDNHxS9mXMhIJBTgdyJkDZ
 gv3T3R3iCrlTTyOCxXpWYdNFv9tlKZQC52QnqjXZYYaDbFg236gsXVYn0ZnGWdscwa3d
 CQlDa6F/J9B+xV8JXIb31rnUr2/z1vWqr35uJxj9CNN9VpSMu7S2MM4h2m8K1IxzS/nx
 fqVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oLmdczkCWtTXgS+hIrrLVL8jr4D4Q93OjOn0dkypiZQ=;
 b=F05mtkWppO0xrP/8LtsAxDgKWWoePwNaWgh4uEaOVlFmw50J3RClHYrnawwjGDGba8
 XTSbEj8FrM3wBbWJX/zqIHK7mYy/Z5IBo0iSocxfGPIu1JYBdcC1qepkC984f+u7sB8d
 vwRD3LRrxQkSm+QqTssnF569C+p9V4P/Oa8Wcw2pC8+pu8qILCM9rS9X81i3NZpzx/AB
 HITDwchhcKWFctqV6SMi034HOSc7WAxfsliwqucG1mikI76WFeOttjSKBZhbT6L1ODme
 LdRL3wa/42bspFc1lZ/fF6bC+mSvgxYazb8WFxpdmd0i70BtofDyb8IH6q88QqHP1/XX
 p6oQ==
X-Gm-Message-State: AOAM532XktBR3yeTG57vBboU+mn4Bu/sna1IpxxZ5+TJ++HFScRZpPY2
 v48neFoPwlnPq0jo6Gr1x6qvdmmKd/iKag==
X-Google-Smtp-Source: ABdhPJxtEMjONA/W4p7sPlXWM/qmz8NNFe0XSg/KJdgU4A3TmxQNRJSPMyS9bPUDL0MlCvtZsSUkXQ==
X-Received: by 2002:a92:3642:: with SMTP id d2mr27886722ilf.234.1635893615857; 
 Tue, 02 Nov 2021 15:53:35 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id h14sm205427ils.75.2021.11.02.15.53.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 15:53:35 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 15/30] bsd-user/arm/target_arch_elf.h: arm defines for ELF
Date: Tue,  2 Nov 2021 16:52:33 -0600
Message-Id: <20211102225248.52999-16-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211102225248.52999-1-imp@bsdimp.com>
References: <20211102225248.52999-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::129;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x129.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
 Kyle Evans <kevans@FreeBSD.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Philippe Mathieu-Daude <f4bug@amsat.org>, Laurent Vivier <laurent@vivier.eu>,
 Michael Tokarev <mjt@tls.msk.ru>, Warner Losh <imp@bsdimp.com>
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


