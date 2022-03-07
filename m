Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD8794D063D
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 19:19:09 +0100 (CET)
Received: from localhost ([::1]:44342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRHwq-0004LT-W4
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 13:19:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nRHug-0000ye-6L
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 13:16:54 -0500
Received: from [2a00:1450:4864:20::634] (port=45940
 helo=mail-ej1-x634.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nRHud-0005Nv-4I
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 13:16:53 -0500
Received: by mail-ej1-x634.google.com with SMTP id qa43so33763460ejc.12
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 10:16:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=byqwazwlVQ/4eJBCyBXwpdV3frwdTuMRkxwEg4OFvTQ=;
 b=hhR/Axw4o1KctX5ZlONHjOLqAxivn7eula7sXHSDDn8MjWDHXnkmbXROj3EgNQ4cjA
 OgWjyADBSOenxj5CmbSkueXh/ahg4gCwCDYNu/ew8BuYve9zyK3Iy+wkZZRJANtF8GXL
 VdO3Dtsf0HDyDCi41DBT3o1C9ixn6PGHXRaSIB3+dphTVenBUKvb3a1RERnkSED5YBEJ
 4XxuHhijsxuKAR7IvI8NOOs9xotxLj42yMmsofhnqn0v3IGZdVBXBiUeTUCxltAapO6E
 6sSMgE922gVDbeF4lIXLHcKfaHqtBs+xPNWPmKJcV30IwC6EtTK2twonybY2viJj6e0A
 x7AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=byqwazwlVQ/4eJBCyBXwpdV3frwdTuMRkxwEg4OFvTQ=;
 b=gQq4Be5EUbw/s3YZCOESIgJ73GXSXBTHiJ0JlZ77qKnPnAv5x4wzxgrFy9CM9MdvUt
 f/h+npb5KWcBh1cfP9hJw9yitGh8eVpMl9I88E488Sfzavcyf90R68A0PIdfy2dcqfBv
 kfMNRVkcLaXT6/0tlsjXOYuRIbO0tWY8kgH2xoilSxL7ttWTz70WTuqH4sEvBYEE1n7i
 SORBFylt+X+cYoEa2kxg0eUT4pndzJVXP5HjD7AA2NBqrXev/3YyxvU+u1J2NSODxYGm
 tgS9/jIqpFfd5OZpdB60hNDr57XYmvd3o+BEMSupCII5Mc5P2QPDCN6dxn8anIUGPtlm
 +3Ng==
X-Gm-Message-State: AOAM531vYxqasutVG0Z+NkObAmcpqk7bko02CB/quM1A0OLO2YzMEccq
 M0x151b6M098newnKQBBtLOngvW4XZQ=
X-Google-Smtp-Source: ABdhPJw6wx6euQtoVGPBqetw5LiRF+WcCOxxKuOF9XD8Ihe6nJxEnKV7pqtxX2IFommbgXFdLP6JIA==
X-Received: by 2002:a17:906:9751:b0:6db:cf3:e7db with SMTP id
 o17-20020a170906975100b006db0cf3e7dbmr7785183ejy.58.1646677008332; 
 Mon, 07 Mar 2022 10:16:48 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 d8-20020a170906304800b006cdf8a1e146sm4983382ejd.217.2022.03.07.10.16.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 10:16:47 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 16/23] x86: Add XFD faulting bit for state components
Date: Mon,  7 Mar 2022 19:16:26 +0100
Message-Id: <20220307181633.596898-17-pbonzini@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220307181633.596898-1-pbonzini@redhat.com>
References: <20220307181633.596898-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::634
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x634.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Yang Zhong <yang.zhong@intel.com>, Jing Liu <jing2.liu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jing Liu <jing2.liu@intel.com>

Intel introduces XFD faulting mechanism for extended
XSAVE features to dynamically enable the features in
runtime. If CPUID (EAX=0Dh, ECX=n, n>1).ECX[2] is set
as 1, it indicates support for XFD faulting of this
state component.

Signed-off-by: Jing Liu <jing2.liu@intel.com>
Signed-off-by: Yang Zhong <yang.zhong@intel.com>
Message-Id: <20220217060434.52460-5-yang.zhong@intel.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/cpu.c | 3 ++-
 target/i386/cpu.h | 2 ++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 505ee289bc..79e24bb23f 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -5496,7 +5496,8 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
                 const ExtSaveArea *esa = &x86_ext_save_areas[count];
                 *eax = esa->size;
                 *ebx = esa->offset;
-                *ecx = esa->ecx & ESA_FEATURE_ALIGN64_MASK;
+                *ecx = esa->ecx &
+                       (ESA_FEATURE_ALIGN64_MASK | ESA_FEATURE_XFD_MASK);
             }
         }
         break;
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 9630f4712a..925d0129e2 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -557,8 +557,10 @@ typedef enum X86Seg {
 #define XSTATE_DYNAMIC_MASK             (XSTATE_XTILE_DATA_MASK)
 
 #define ESA_FEATURE_ALIGN64_BIT         1
+#define ESA_FEATURE_XFD_BIT             2
 
 #define ESA_FEATURE_ALIGN64_MASK        (1U << ESA_FEATURE_ALIGN64_BIT)
+#define ESA_FEATURE_XFD_MASK            (1U << ESA_FEATURE_XFD_BIT)
 
 
 /* CPUID feature words */
-- 
2.34.1



