Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F92432783
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 21:23:07 +0200 (CEST)
Received: from localhost ([::1]:37788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcYDy-0005s1-Fh
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 15:23:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcXtb-0008Ot-Ml
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 15:02:05 -0400
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136]:46078)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcXtZ-0001vN-FP
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 15:02:03 -0400
Received: by mail-il1-x136.google.com with SMTP id i11so15937636ila.12
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 12:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=laLU0XX8CdBP2//L0jChpwkHQR7NdHyxMB0d78r5Vqk=;
 b=t6SXIc/Km8JHggmPMcVrtyKEnpRjgrU9dZpvjuZrcq854mVo7qY5djsGa7ZmQiIWas
 1k/1fxNLXS9Ajfmfk2L3PAVcoCWUtA+OX1NqUMEWORMuIMMtK+zRIAjbg9EwQ5hHR6ZM
 zU8BkWa98A+A4UyfxfOnrJQLK+FxkqrhFo3LCaxnO/CNaKfAX4ak6I9TKLM4XozaaboR
 rgaVNCBQSIdOfvoIWGoBk06FfdvFmPWDQZ4pasf3phShpoU6vwYkL8tThZOxHfv5NQQO
 ouF0joN/DiC30wDXfEhSlhcTYdywQf1+giV546YzH8INNMQxMAm0o4ZhgMkZMITHO9ZD
 kqJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=laLU0XX8CdBP2//L0jChpwkHQR7NdHyxMB0d78r5Vqk=;
 b=DHcQkv2OnrWHzOXbLuDMfmGCM/XvZmMGlPAaBAiernacEmjaD3fDsCNRQmZ1ZUd/m7
 3veO8Pyti0ubdnvja9i+CLv+yxCGz/pxLPep/EiIkatgeJaZSJPeQTkaaAvu8UHCy4Fq
 PDyqAcSLI+2YP8hcmgVSbRq3BoydHr4d2uWx+Pmh9RYWMVWwHjzxGeP6eeju5g6Dg48A
 lL/6BG4tU4+GZ/sqNvzdLLX/34OoWCsRsMytUzxkI2pA+7oruA2CfkvRKH+/mDuWLbpL
 Mw2Gms/0+hHTLBejASHF8ij0HuBjEDnawGnush7iSA8GZrS5UDS1yuBXG8y7kwocceFG
 jx8Q==
X-Gm-Message-State: AOAM531T34Eo/VEAMaIxYOy3WAMY/ZCQPZkzoWt4QiQy8CPftAxNYMG+
 dM/9TipkHGRw9xeFPhxFl1KpXpG4FSFPpA==
X-Google-Smtp-Source: ABdhPJxq66kAh4NsMlA/K+9VdJloEkKGA67LniFINeUk3ke+RCzZHIxCW1Lp3Aj6n6qpDPt0DDz5rg==
X-Received: by 2002:a05:6e02:8a3:: with SMTP id
 a3mr14874311ilt.88.1634583719652; 
 Mon, 18 Oct 2021 12:01:59 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id a8sm6945151ilh.5.2021.10.18.12.01.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 12:01:58 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 17/23] bsd-user/target_os_elf.h: Remove fallback ELF_HWCAP
 and reorder
Date: Mon, 18 Oct 2021 13:01:09 -0600
Message-Id: <20211018190115.5365-18-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211018190115.5365-1-imp@bsdimp.com>
References: <20211018190115.5365-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::136;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x136.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Kyle Evans <kevans@FreeBSD.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Warner Losh <imp@bsdimp.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

All architectures have a ELF_HWCAP, so remove the fallback ifdef.
Place ELF_HWCAP in the same order as on native FreeBSD.

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Kyle Evans <kevans@FreeBSD.org>
---
 bsd-user/freebsd/target_os_elf.h | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/bsd-user/freebsd/target_os_elf.h b/bsd-user/freebsd/target_os_elf.h
index 2d03a883aa..adcffd1ddb 100644
--- a/bsd-user/freebsd/target_os_elf.h
+++ b/bsd-user/freebsd/target_os_elf.h
@@ -38,10 +38,6 @@
 #define ELF_PLATFORM (NULL)
 #endif
 
-#ifndef ELF_HWCAP
-#define ELF_HWCAP 0
-#endif
-
 /* XXX Look at the other conflicting AT_* values. */
 #define FREEBSD_AT_NCPUS     19
 #define FREEBSD_AT_HWCAP     25
@@ -114,12 +110,12 @@ static abi_ulong target_create_elf_tables(abi_ulong p, int argc, int envc,
         NEW_AUX_ENT(AT_FLAGS, (abi_ulong)0);
         NEW_AUX_ENT(FREEBSD_AT_NCPUS, (abi_ulong)bsd_get_ncpu());
         NEW_AUX_ENT(AT_ENTRY, load_bias + exec->e_entry);
+        features = ELF_HWCAP;
+        NEW_AUX_ENT(FREEBSD_AT_HWCAP, features);
         NEW_AUX_ENT(AT_UID, (abi_ulong)getuid());
         NEW_AUX_ENT(AT_EUID, (abi_ulong)geteuid());
         NEW_AUX_ENT(AT_GID, (abi_ulong)getgid());
         NEW_AUX_ENT(AT_EGID, (abi_ulong)getegid());
-        features = ELF_HWCAP;
-        NEW_AUX_ENT(FREEBSD_AT_HWCAP, features);
         target_auxents = sp; /* Note where the aux entries are in the target */
 #ifdef ARCH_DLINFO
         /*
-- 
2.32.0


