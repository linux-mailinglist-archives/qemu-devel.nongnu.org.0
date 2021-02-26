Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F62325F3C
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 09:40:09 +0100 (CET)
Received: from localhost ([::1]:38484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFYfK-0004vA-V9
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 03:40:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lFY8B-0001sx-Jk
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 03:05:47 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:33701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lFY89-0004CW-UM
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 03:05:47 -0500
Received: by mail-wr1-x42a.google.com with SMTP id 7so7679982wrz.0
 for <qemu-devel@nongnu.org>; Fri, 26 Feb 2021 00:05:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UJvvnaeptbuYgzrZOE0d0WLQHfz6cH/c4DsWLR0qbV8=;
 b=gniSp2G55g1amU4K+WjdXxJIcgqYjn/Wu3ryIat+Y5d+lyv0Qa68HA/jBO18A9Q9by
 M8UvwnNX/wTSvVPTsF3aJY2/B5jpv1waB7ExuKs7ZO87AjRe5lxrY/iUE9hPjWK7m6kD
 hJPz9qQo9+lOof+quDOfhgOPQA/SViTpJRH+JNFy8qIKQ0BtzVK/osGhUDElqwUUfokZ
 eAldItoHQmEz26wzNL0EnDEkiSekDjcZ3V3JlfAuIigku471VEql547zTB9aR/Q2fFsk
 6AJ8fQj939HUoIjo0K5el4xLgI8CgN2PyIwjUTw+kiM9UxartMr8cAbzeoduj44MwJPT
 tRTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=UJvvnaeptbuYgzrZOE0d0WLQHfz6cH/c4DsWLR0qbV8=;
 b=SnYdx7v0afmwDdISt4I0HsfMUCbya7159k/EU+0/O7HI0ih4Zay+zjLzZQq+CFI/QX
 aTxbW3GbpD2h8tydObU2EK6ZHBgu/LNzU9djWbGQsa4WsUh2SmVi98qjh7QlZb0UVxiY
 7CgJ60fc8YgLGfwsLLNBLPCRy9wXSh+2tB+th5yRSslS88/S4fcYnd+l6Jdl8SJ3Hjdg
 u8tkNostVFiW7hJte59KZplR7O9k2gsqdswtrXHvc//rLDMouFKaIv3hdEBkZeg8dtw2
 PAfT6Ffu8yZs6LZigga084gKxasBUgt8B5EpWPBibu5bflGQOTWX8MgEut4SbM2aCYxT
 glTg==
X-Gm-Message-State: AOAM530CuCmJar9t8aDjjmAXahca9Yb8xvJdAcuEeohI2VQ8z44hfjY8
 9cDIeXEitCusAHq2cHMDHjfuSHxqWQc=
X-Google-Smtp-Source: ABdhPJwa1I4A0rvrUHOCfROYUGPRvNVc38ycbwNmylQM8VcYwXP3WHvB5MX3NBEw0AXAorNNRo/Lng==
X-Received: by 2002:adf:ded1:: with SMTP id i17mr1851522wrn.349.1614326744580; 
 Fri, 26 Feb 2021 00:05:44 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id n66sm10700830wmn.25.2021.02.26.00.05.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Feb 2021 00:05:44 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 26/29] target/i386: Add bus lock debug exception support
Date: Fri, 26 Feb 2021 09:05:23 +0100
Message-Id: <20210226080526.651705-27-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210226080526.651705-1-pbonzini@redhat.com>
References: <20210226080526.651705-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Chenyi Qiang <chenyi.qiang@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Chenyi Qiang <chenyi.qiang@intel.com>

Bus lock debug exception is a feature that can notify the kernel by
generate an #DB trap after the instruction acquires a bus lock when
CPL>0. This allows the kernel to enforce user application throttling or
mitigations.

This feature is enumerated via CPUID.(EAX=7,ECX=0).ECX[bit 24].

Signed-off-by: Chenyi Qiang <chenyi.qiang@intel.com>
Message-Id: <20210202090224.13274-1-chenyi.qiang@intel.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/cpu.c | 2 +-
 target/i386/cpu.h | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index bc6956561a..50008431c3 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -963,7 +963,7 @@ static FeatureWordInfo feature_word_info[FEATURE_WORDS] = {
             "avx512bitalg", NULL, "avx512-vpopcntdq", NULL,
             "la57", NULL, NULL, NULL,
             NULL, NULL, "rdpid", NULL,
-            NULL, "cldemote", NULL, "movdiri",
+            "bus-lock-detect", "cldemote", NULL, "movdiri",
             "movdir64b", NULL, NULL, "pks",
         },
         .cpuid = {
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 8be39cfb62..b4b136cd0d 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -769,6 +769,8 @@ typedef uint64_t FeatureWordArray[FEATURE_WORDS];
 #define CPUID_7_0_ECX_LA57              (1U << 16)
 /* Read Processor ID */
 #define CPUID_7_0_ECX_RDPID             (1U << 22)
+/* Bus Lock Debug Exception */
+#define CPUID_7_0_ECX_BUS_LOCK_DETECT   (1U << 24)
 /* Cache Line Demote Instruction */
 #define CPUID_7_0_ECX_CLDEMOTE          (1U << 25)
 /* Move Doubleword as Direct Store Instruction */
-- 
2.29.2



