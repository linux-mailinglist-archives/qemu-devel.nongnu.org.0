Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 146E342BBB2
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 11:34:06 +0200 (CEST)
Received: from localhost ([::1]:57860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maaeC-0003mg-Vj
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 05:34:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1maaEw-0002Zp-46
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 05:07:58 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:42505)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1maaEs-0005wx-9m
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 05:07:57 -0400
Received: by mail-ed1-x536.google.com with SMTP id t16so7204489eds.9
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 02:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=C9y5huMw4LwH2pJnuKk7cxJUHcEjm1Oaww7ZVrlgFH8=;
 b=FfwLyCRTagya72JwQwm71kgyFWcPQVlZkVY+kPpbbXn1GZtUKSqTG2RDRrI8z6nbKN
 FeMEbVbLcpnHgZVRwNe5FX71kaKToJ5wBGIQ5pilAewZK6n1/lM78NldpCKwuo4bEQoX
 3hzQS2hxqK+tRLOmpwwjuJtq7AQ9UT/gjg5V7n70DEbg3UflKpH9iRVykXDwHOcVzVXJ
 RZ9M262L7xPXIYLJkWyLZFeeKEYtWZl1NXPETreR+HmPwXr0vUWbop7RYJJEWropln2Z
 8tGfRX+bdkitRr9LT+xb36mIEa5edQEWce6XpnwvzeqUD6eTG/fgUo7q0wV3rcO3/kNB
 mr7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=C9y5huMw4LwH2pJnuKk7cxJUHcEjm1Oaww7ZVrlgFH8=;
 b=3dD40CbLC9NsCs35pC7b1YQ9flC1z1KnzXEj54DNgwkcrJpON+gDtJ61PclrDDUx3y
 3SyColDS3eNF0pz9FmPIfFyz6DF7en3h+xGoq5bqitnpI06NJ8b4dRkXNc6VpscW9UmN
 HnMYSvy99gBivKyK5selsx814jJFeY/IJbzjFtCSBNmLQpHaxX0IzeZ4I1MZZwWxOTFP
 sjWW8fErwkefjaCmjrTLI/8oezjyG6+D4eiFVT2lvwxRauBkkZzOr6bLZ5R/SSFPCuZQ
 Mn717BzdRetxhm6vcRLRql0ESODUWMO+pfp37H2cCuZa1j0wh0fKr9r1Mgck4hlHyvit
 gOxg==
X-Gm-Message-State: AOAM533sWGdjplSHlpnj7rC0DEPOa0MbdR4o61G8iXXgLwNt29kNLvTA
 0UHlsUel7YjRkziEN81LWJuC+mszFTg=
X-Google-Smtp-Source: ABdhPJwoPmax0I7ER/5XArGq+xeYfx6QfmKMoBbLsUIVxtFHbLics27oGZEGLTWPx4ZDPZC13p7kwQ==
X-Received: by 2002:a17:907:c0c:: with SMTP id
 ga12mr9248080ejc.111.1634116072671; 
 Wed, 13 Oct 2021 02:07:52 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id c6sm6177849ejb.41.2021.10.13.02.07.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 02:07:52 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 33/40] hw/i386/sgx: Have sgx_epc_get_section() return a boolean
Date: Wed, 13 Oct 2021 11:07:21 +0200
Message-Id: <20211013090728.309365-34-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211013090728.309365-1-pbonzini@redhat.com>
References: <20211013090728.309365-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x536.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20211007175612.496366-3-philmd@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/i386/sgx-stub.c        | 2 +-
 hw/i386/sgx.c             | 6 +++---
 include/hw/i386/sgx-epc.h | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/i386/sgx-stub.c b/hw/i386/sgx-stub.c
index 3be9f5ca32..45c473119e 100644
--- a/hw/i386/sgx-stub.c
+++ b/hw/i386/sgx-stub.c
@@ -20,7 +20,7 @@ void pc_machine_init_sgx_epc(PCMachineState *pcms)
     memset(&pcms->sgx_epc, 0, sizeof(SGXEPCState));
 }
 
-int sgx_epc_get_section(int section_nr, uint64_t *addr, uint64_t *size)
+bool sgx_epc_get_section(int section_nr, uint64_t *addr, uint64_t *size)
 {
     g_assert_not_reached();
 }
diff --git a/hw/i386/sgx.c b/hw/i386/sgx.c
index e481e9358f..29724ff8f0 100644
--- a/hw/i386/sgx.c
+++ b/hw/i386/sgx.c
@@ -115,13 +115,13 @@ SGXInfo *sgx_get_info(Error **errp)
     return info;
 }
 
-int sgx_epc_get_section(int section_nr, uint64_t *addr, uint64_t *size)
+bool sgx_epc_get_section(int section_nr, uint64_t *addr, uint64_t *size)
 {
     PCMachineState *pcms = PC_MACHINE(qdev_get_machine());
     SGXEPCDevice *epc;
 
     if (pcms->sgx_epc.size == 0 || pcms->sgx_epc.nr_sections <= section_nr) {
-        return 1;
+        return true;
     }
 
     epc = pcms->sgx_epc.sections[section_nr];
@@ -129,7 +129,7 @@ int sgx_epc_get_section(int section_nr, uint64_t *addr, uint64_t *size)
     *addr = epc->addr;
     *size = memory_device_get_region_size(MEMORY_DEVICE(epc), &error_fatal);
 
-    return 0;
+    return false;
 }
 
 void pc_machine_init_sgx_epc(PCMachineState *pcms)
diff --git a/include/hw/i386/sgx-epc.h b/include/hw/i386/sgx-epc.h
index 65a68ca753..a6a65be854 100644
--- a/include/hw/i386/sgx-epc.h
+++ b/include/hw/i386/sgx-epc.h
@@ -55,7 +55,7 @@ typedef struct SGXEPCState {
     int nr_sections;
 } SGXEPCState;
 
-int sgx_epc_get_section(int section_nr, uint64_t *addr, uint64_t *size);
+bool sgx_epc_get_section(int section_nr, uint64_t *addr, uint64_t *size);
 
 static inline uint64_t sgx_epc_above_4g_end(SGXEPCState *sgx_epc)
 {
-- 
2.31.1



