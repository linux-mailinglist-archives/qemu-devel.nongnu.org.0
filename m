Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D55604141AA
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 08:24:32 +0200 (CEST)
Received: from localhost ([::1]:53544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSvgF-0005M9-Tu
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 02:24:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mSvWr-0001LQ-S4
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 02:14:50 -0400
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31]:44630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mSvWq-0007VX-Dd
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 02:14:49 -0400
Received: by mail-io1-xd31.google.com with SMTP id y197so1881342iof.11
 for <qemu-devel@nongnu.org>; Tue, 21 Sep 2021 23:14:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9zW08+Vc3ElhFXMnF/RFJwdGBp3FBijIjwjDeGhfTQ0=;
 b=vsX9F6F7yn6EkXWxsTkaoZzqcaodZcBx4/Xi+fvk6CutK+tWVdEX/p7YUjnld4Z0Cv
 U2Obvm8DY9TCGpEvezHQwj5uRn1Afi7MmMZGnzQAc1bHNzvU627nAfMDbr6zEWxerBir
 B1MYrIC33wKVcSvSb52/zzycm4Xc7imA83mYOwiXj3Syf1xv1+ScbucnFfsRLGlzM10a
 XJ1pElg9F8/Xf+x94jfgQlUJwuK5H5XsmLp5wdGqokgDBv9GIo1BLSM6YIKGfuPO+bqE
 E0xIPMjaA+e4jiPNl8IcJK9rpMGI/gTM/k8ZcRnFASuIQBpA7Yp7/ePZJd4Yf284zBdr
 073g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9zW08+Vc3ElhFXMnF/RFJwdGBp3FBijIjwjDeGhfTQ0=;
 b=ebY5yhi66dzztPphqkfbmi3/ZylzYc1bOTne/LC0vHDJD+wXXv//kHpA25OgxNCVXO
 Wp+O7WaThfdq5SaMPWk7aGRPkpoyAiai+u6fHXJq2HPBWGFQ/Z02GG2V7KNAHqCEP8ZL
 77tBShZg+M4e/QsANS5nTIBLgIF65ln8uLPcLXdFlZZRZ+OARg8svSVxZBYKnFR2s0xu
 HUXtFlSsKTi8KQ9moXjxt+40bMCDtEQbDA88eEXgomNMi8FtD5rGlQ2jiE1yq2wYvNXp
 lJCoRGKsu5miwwRiQbh8EjjmKwu8ZhU/FLqOVYODv5+DS7T/ph7L3bZgDwGYtk1sCSlc
 zw2g==
X-Gm-Message-State: AOAM530BhVfD6wV441iaXti/ejl7e3uu2+hLj0k+yZidl+VclreY+X+K
 dVjBFgJE6L6biCDZ29pFxOkPkjDmEDOClpK5mRc=
X-Google-Smtp-Source: ABdhPJzyMJIzvp8sgf3lb/Oi1vV1DMODeWSb+m/C/6BUdqKfsSVJ9MN7S+CoVbDP7XIVlWM97uqjPg==
X-Received: by 2002:a6b:5918:: with SMTP id n24mr3130712iob.108.1632291287105; 
 Tue, 21 Sep 2021 23:14:47 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id a25sm540817ioq.46.2021.09.21.23.14.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Sep 2021 23:14:46 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 07/14] bsd-user/target_os_elf.h: Remove fallback ELF_HWCAP and
 reorder
Date: Wed, 22 Sep 2021 00:14:31 -0600
Message-Id: <20210922061438.27645-8-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210922061438.27645-1-imp@bsdimp.com>
References: <20210922061438.27645-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d31;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd31.google.com
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
Cc: Kyle Evans <kevans@freebsd.org>, richard.henderson@linaro.org,
 f4bug@amsat.org, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

All architectures have a ELF_HWCAP, so remove the fallback ifdef.
Place ELF_HWCAP in the same order as on native FreeBSD.

Signed-off-by: Warner Losh <imp@bsdimp.com>
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


