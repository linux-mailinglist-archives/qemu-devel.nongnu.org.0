Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2B52D9081
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Dec 2020 21:27:42 +0100 (CET)
Received: from localhost ([::1]:42288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koXy1-0004Aw-NN
	for lists+qemu-devel@lfdr.de; Sun, 13 Dec 2020 15:27:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1koXrH-0001yF-5x
 for qemu-devel@nongnu.org; Sun, 13 Dec 2020 15:20:43 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:54801)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1koXrF-0005Ov-Qb
 for qemu-devel@nongnu.org; Sun, 13 Dec 2020 15:20:42 -0500
Received: by mail-wm1-x336.google.com with SMTP id d3so11951534wmb.4
 for <qemu-devel@nongnu.org>; Sun, 13 Dec 2020 12:20:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UKVyHTJcfnmphpZOlFQ3sK0TO5i59SQTbNG7ZpwIL2s=;
 b=Q2ksS/NIJwRo6OVacRh1D3+KqjRnj3fQkjk+RFruSjRTqsxfiGyG+2kd+xqRaPSyNn
 Og8GyaYIUtXhBQX+ZW1nfYS1ilo/N/MXh94szzfdIv4dta73ui2OpQFnEmnU3t/r+teV
 Tka2QbqFNDF+03VruDSDXm2EDY0TDxtdzQcGizbC803leH6tL1MOB8fNUmFcmB7n+bV4
 N8yARhMJkKFDmnjPEv7kVWv0GVMvQAhDMqIa45YAM3Bwo7t5En2DVylczCrwAzDEA5Xl
 sIg9lVvazuHl6l7sJEEFsd8GbAJt4sB2QIEPGG9ZKAcN5ikpBAIkwDEfNdY7XCyoOr7v
 +I3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=UKVyHTJcfnmphpZOlFQ3sK0TO5i59SQTbNG7ZpwIL2s=;
 b=khknwjKjgDd2Y+lB2eI4Xc4sE+phL5DJD2e5UqFscy9qdtwllEFTVd6z8yxlqt1zBE
 0HT53I6tRQIKbFFXtzt2lHDkZnSlkB79mRlqCTBDGdzptehAW8WaAqL9MPVRQEV/sAct
 jbCZm2UhXjfjNOdvKClm6fpiUqohatFQLz82ytBtR0VEiA4A79QsIywUodJtNb8nSEMi
 I90rbTik3rbfJ+ArK0RoGKRsVFDcNr7YDrj/O/Ilfd5vjwWJWIf2RNTLwnA6YA8wWFjN
 KizHeuyb80OAFqD1isOs3RisL5My/GdxwHE7hoDwrdW36wT4A4p7PPDY86vjFdl0n3Jg
 mP1w==
X-Gm-Message-State: AOAM531Jk6QmlKUSHg/uMV0KLhWVa+un3lUaCXIcUiqNU/huxUPTokiv
 i8nUTchgkZ6vBoHcXmrUD2zmIHi2+5k=
X-Google-Smtp-Source: ABdhPJzgoE2qp8c/gtBc5k0f18CqNg5PxnMO3ehBmX6yeySByMtolXCKZoaCC8qZNyu+dyEmkIbmeA==
X-Received: by 2002:a7b:c773:: with SMTP id x19mr23833930wmk.127.1607890838712; 
 Sun, 13 Dec 2020 12:20:38 -0800 (PST)
Received: from localhost.localdomain (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id r20sm28985853wrg.66.2020.12.13.12.20.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Dec 2020 12:20:38 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 10/26] target/mips: Explicit Release 6 MMU types
Date: Sun, 13 Dec 2020 21:19:30 +0100
Message-Id: <20201213201946.236123-11-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201213201946.236123-1-f4bug@amsat.org>
References: <20201213201946.236123-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Paul Burton <paulburton@kernel.org>, kvm@vger.kernel.org,
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As of Release 6, MMU type 4 is assigned to "Dual Variable-Page-Size
and Fixed-Page-Size TLBs" and type 2 to "Block Address Translation.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20201201132817.2863301-4-f4bug@amsat.org>
---
 target/mips/internal.h | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/target/mips/internal.h b/target/mips/internal.h
index 76b7a85cbb3..bcd3d857ab6 100644
--- a/target/mips/internal.h
+++ b/target/mips/internal.h
@@ -16,10 +16,11 @@
  * CP0C0_MT field.
  */
 enum mips_mmu_types {
-    MMU_TYPE_NONE,
-    MMU_TYPE_R4000,
-    MMU_TYPE_RESERVED,
-    MMU_TYPE_FMT,
+    MMU_TYPE_NONE       = 0,
+    MMU_TYPE_R4000      = 1,    /* Standard TLB */
+    MMU_TYPE_BAT        = 2,    /* Block Address Translation */
+    MMU_TYPE_FMT        = 3,    /* Fixed Mapping */
+    MMU_TYPE_DVF        = 4,    /* Dual VTLB and FTLB */
     MMU_TYPE_R3000,
     MMU_TYPE_R6000,
     MMU_TYPE_R8000
-- 
2.26.2


