Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E58D4445553
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Nov 2021 15:30:46 +0100 (CET)
Received: from localhost ([::1]:36676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1midlO-0003pK-1v
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 10:30:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1midRN-0006FM-Ht; Thu, 04 Nov 2021 10:10:07 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:41524)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1midRK-0002Kq-CJ; Thu, 04 Nov 2021 10:10:05 -0400
Received: by mail-wr1-x42b.google.com with SMTP id d3so8809703wrh.8;
 Thu, 04 Nov 2021 07:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ENOdbTpjWaps6H1BTH69NWFKpPcyVeSjIgQ8RCGKNss=;
 b=KtxoW8mnfuaX/YojsRB9YDTOSlGvsjWPqeXbq0UqOrsSk+KPyxxRFBeQvKTScIjpQt
 yYzB0tCGFjzHBDM5MnRjG5BIYAI7GFjNoBmnVX9z/T7QFBcaMVH/XoN20FanXJTo8aln
 ZBupZGVEN54JPogFFiCHuigAuRUzmI4hHeSuoRIoWr1td9hpl+MCKyx3ocF/TFZVuadZ
 Ko+4Wo0629ojh7V48FvjA/Yc0PdJNMWdXV+vRJ0MdP1Eg7K7C/r7zflafgHshwsnNIwq
 yhHnHniCFn2uEctE9Yq7ss+h5dkJvqRkyECNTFkW/Bgs52+KkJht+7XyylQfOB4X7MEV
 yTqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=ENOdbTpjWaps6H1BTH69NWFKpPcyVeSjIgQ8RCGKNss=;
 b=LdJFgX3qsN8/6a2F06qD91Xh3rdjAZ1SLRJvKcpEAIUsYPv9IWi2jMiIUaE9TcKmX0
 1/BQ2aD1VJOPcuoGqRdpxJUGr+nS/r8T+gvV18te2pE3ZwOhVQ3SkAc5YAUYuX8Jt59l
 3FjKlDCT61ur3uJaNVWk1F5r5G1kUQiPAa+ZoIbpUcMkvZH4PAQLOF3Msg3gAcBG8j6U
 rBvNL8NGG9GDLeNnCIeaMRzYN+duuK03b7BTVviz2+4b++oVM8cZesUrus0aD76xzLiN
 /52NRBIFE1Wec3sC8Pk15xd0rqzl9n7wce5P9v/Tf45B87ooka7J4O0fb+eBu9f7UHDf
 avEQ==
X-Gm-Message-State: AOAM53079j+YuimiQB8vLuDtQxzsFLLRkjPw3nez0iu/Sssdy+U+As2j
 V5FNzcRHOKAvgTXka0HClsw6PQo5cqo=
X-Google-Smtp-Source: ABdhPJzMPfdN1+tHd88no7lh8m5cuXxyBJDsd/dQL4Qu+8mrO98ptdU6h1xWD0wlqcf6G1+YoBitow==
X-Received: by 2002:a5d:4ed1:: with SMTP id s17mr48226989wrv.310.1636035000236; 
 Thu, 04 Nov 2021 07:10:00 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id n7sm5065330wra.37.2021.11.04.07.09.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 07:09:59 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] target-i386: mmu: use pg_mode instead of HF_LMA_MASK
Date: Thu,  4 Nov 2021 15:09:57 +0100
Message-Id: <20211104140958.445304-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42b.google.com
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
Cc: qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Correctly look up the paging mode of the hypervisor when it is using 64-bit
mode but the guest is not.

Fixes: 68746930ae ("target/i386: use mmu_translate for NPT walk", 2021-05-11)
Cc: qemu-stable@nongnu.org
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/sysemu/excp_helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/i386/tcg/sysemu/excp_helper.c b/target/i386/tcg/sysemu/excp_helper.c
index 7af887be4d..492b777de9 100644
--- a/target/i386/tcg/sysemu/excp_helper.c
+++ b/target/i386/tcg/sysemu/excp_helper.c
@@ -90,7 +90,7 @@ static int mmu_translate(CPUState *cs, hwaddr addr, MMUTranslateFunc get_hphys_f
         target_ulong pdpe_addr;
 
 #ifdef TARGET_X86_64
-        if (env->hflags & HF_LMA_MASK) {
+        if (pg_mode & PG_MODE_LMA) {
             bool la57 = pg_mode & PG_MODE_LA57;
             uint64_t pml5e_addr, pml5e;
             uint64_t pml4e_addr, pml4e;
@@ -287,7 +287,7 @@ do_check_protect_pse36:
         *prot |= PAGE_EXEC;
     }
 
-    if (!(env->hflags & HF_LMA_MASK)) {
+    if (!(pg_mode & PG_MODE_LMA)) {
         pkr = 0;
     } else if (ptep & PG_USER_MASK) {
         pkr = pg_mode & PG_MODE_PKE ? env->pkru : 0;
-- 
2.33.1


