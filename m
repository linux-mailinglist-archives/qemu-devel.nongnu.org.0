Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F127C42741F
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Oct 2021 01:20:44 +0200 (CEST)
Received: from localhost ([::1]:54372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYzAR-0000J5-S3
	for lists+qemu-devel@lfdr.de; Fri, 08 Oct 2021 19:20:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mYz5N-00008W-RB
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 19:15:29 -0400
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133]:37472)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mYz5M-0006kp-8G
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 19:15:29 -0400
Received: by mail-il1-x133.google.com with SMTP id i13so11515240ilm.4
 for <qemu-devel@nongnu.org>; Fri, 08 Oct 2021 16:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tC2oq89wBfOJKjYnjMrgrMvZ3iT23Ggo33hVTxbERVQ=;
 b=2u0l1D99B1Sy2oEo0LEEE4N8kU3m2MuY4wXhT46d8dh9IKVnFa0dOU9CpNz+ZZyNzl
 2Tvu/IDjMkthks4VG3cutlC0CKydfes9lLUt28KDyg60ha/AWGX9oNq2w3V3a+29eIhT
 AaWVxSUSOQF36K1oT31z5UC8uEz/wI1l8blTeOT/IC6rlPJVvC6SMC0hgDtOrF2IIE+i
 iekvcIhL6icVmhYfPMc74zXlYNDT4sKkl58BwRqu690e1pjlOnwCdsn5h1pMU4SmoZM+
 +WJEv6exnjv335Lr0ZfzoGGzFZBCz+SoPfTpM47haSlZnt82wcVDP0FnWXvtB5hjUgd8
 cNJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tC2oq89wBfOJKjYnjMrgrMvZ3iT23Ggo33hVTxbERVQ=;
 b=v7mD3c42CWh7D3FN3pbsYHvDTCI2AuR1pPDR3iOULXYsvS+tFIfGBLVHy8/yUImzhO
 Doo/7ww41pI4iBSd/VBHwf32Q8a9iAGNjhoGOZrFdruDZvbFqIou4vFzK0KmJbJGSo+4
 SYUBcB3L2FX8GoWXRmsXAZS+oxBoAiWURSdWj5JWVmTSQ+l25y9Be7cf2aiL0O/ojwzl
 94THRfjk2ZJMAZj/Uy0sj9yN7EcCh9a+6M2eIA8BvQ6VRU9CqFrl53skd04TMR72goJ0
 2yN9XcFc+OIHYBF2G4GAc/Nhpp8cJHcw3oG65MCMjCAx7xyRTJsyr5HnM92ItuMUWBBZ
 hxEQ==
X-Gm-Message-State: AOAM530kEKNmThRd+F050TshI5NRxafuJ3DDmmv1dgDeZexghjhcxE9c
 wkTVmHbN+aHkCROdBEWsG9lMp/tKhQYaBA==
X-Google-Smtp-Source: ABdhPJyy2+1a01tSTkYJhTbdSIii+hQ89/zhM68eKY3uaRSF8jOzxF4uYrX8Axah9UtShA9fZ1aN7A==
X-Received: by 2002:a05:6e02:1c41:: with SMTP id
 d1mr9834112ilg.31.1633734926945; 
 Fri, 08 Oct 2021 16:15:26 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id b15sm293628ion.8.2021.10.08.16.15.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Oct 2021 16:15:26 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 08/15] bsd-user/target_os_elf.h: Remove fallback ELF_HWCAP
 and reorder
Date: Fri,  8 Oct 2021 17:14:59 -0600
Message-Id: <20211008231506.17471-9-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211008231506.17471-1-imp@bsdimp.com>
References: <20211008231506.17471-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::133;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x133.google.com
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
 Laurent Vivier <laurent@vivier.eu>, Warner Losh <imp@bsdimp.com>,
 f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

All architectures have a ELF_HWCAP, so remove the fallback ifdef.
Place ELF_HWCAP in the same order as on native FreeBSD.

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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


