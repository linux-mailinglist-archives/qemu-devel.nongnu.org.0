Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07529401C52
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Sep 2021 15:33:19 +0200 (CEST)
Received: from localhost ([::1]:48886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNEkQ-0002DV-2f
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 09:33:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNEPd-0001N2-H5
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 09:11:49 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:40831)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNEPb-0007pp-Ey
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 09:11:49 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 n14-20020a05600c3b8e00b002f8bd2f8ab6so1681874wms.5
 for <qemu-devel@nongnu.org>; Mon, 06 Sep 2021 06:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mbaw9pdnqP92DKqM8tgQDqLgCgg/jsObWRY9yUoyBk0=;
 b=FgliT+UOe7R0BCMtMI627zl3oyO/9+hED7WVkNiJrmStkZ1t2wuCzvACRAlB0O6Dgj
 LcSM5bQD8QCpArrQg3DIozXk0V4NYGRWtgpo+a3DCVZ72t2kUQd5MZdMYWshRJIo9XM9
 7A0hYfyNbQDpmQieOcf0oHlS0RRApDROXsjk0t2wTOkBF6qXnmPKvyo2iMauxcQp+RUW
 qRsBkkrUEuBIBBjd/aTW8Q/bTJHFd5W9QXSJoqCsNP8ZK3JKI87UZLONqC8gBElltRTE
 CBXYTX+ZVg48co3ZzVedgicSohIuhQuOhQ7+3E5CHzVDAkdO9KTOhakDbR+wsAcSFQ/V
 5Vig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=mbaw9pdnqP92DKqM8tgQDqLgCgg/jsObWRY9yUoyBk0=;
 b=GXwuJm6EuHdi8oyxZAEuQCbtWeHhlmjqV9iNAYz6bExmL7rdQQCMROaqV+SMV2uHWM
 wyFChMAWfAAld2/2AGtzakIzeNj101Zrk4Txhnj7b1e93WsLVWyaRH6pHocZYmmZxxQv
 uXpm8T9J/QQRWPowmUerQoYaxQI303Klbf5zNIEdEjHtJYQyJ1U+baA2SiltOh0nWkjI
 5jkTLwjH1UnbgqfiuOnHWrOzeZA9JIdTpb2zyl8gESskmy7X+7burcAaxa+CI9PVxXJ+
 hWXT9+xxHxAuN60oxIYIPThTciZ8Xcp51RF26dTmd3d+HxyNd621pOHJ0exRt5Lx4RBU
 sPXg==
X-Gm-Message-State: AOAM533qKMVnrSTYb2ZnFu2p1zqzMVGnuxtMYWFPYdTZaN0PJkSJMVFy
 Xw6ztCRylVpFfsIqSlf9JKhQlycSU/E=
X-Google-Smtp-Source: ABdhPJyS0Wy+BrAYxCdTWD14eSLN9RUh3hNaSdKKZzWeuW7409+prrkqYsZEpOiycQj6AtO4sKq0xg==
X-Received: by 2002:a1c:c918:: with SMTP id f24mr11304076wmb.61.1630933906127; 
 Mon, 06 Sep 2021 06:11:46 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 k4sm7992331wrm.74.2021.09.06.06.11.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Sep 2021 06:11:45 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 26/36] i386/pc: Add e820 entry for SGX EPC section(s)
Date: Mon,  6 Sep 2021 15:10:49 +0200
Message-Id: <20210906131059.55234-27-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210906131059.55234-1-pbonzini@redhat.com>
References: <20210906131059.55234-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32f.google.com
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
Cc: Yang Zhong <yang.zhong@intel.com>,
 Sean Christopherson <sean.j.christopherson@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Sean Christopherson <sean.j.christopherson@intel.com>

Note that SGX EPC is currently guaranteed to reside in a single
contiguous chunk of memory regardless of the number of EPC sections.

Signed-off-by: Sean Christopherson <sean.j.christopherson@intel.com>
Signed-off-by: Yang Zhong <yang.zhong@intel.com>
Message-Id: <20210719112136.57018-19-yang.zhong@intel.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/i386/pc.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index f79be3edc2..b55cd27deb 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -892,6 +892,10 @@ void pc_memory_init(PCMachineState *pcms,
         e820_add_entry(0x100000000ULL, x86ms->above_4g_mem_size, E820_RAM);
     }
 
+    if (pcms->sgx_epc.size != 0) {
+        e820_add_entry(pcms->sgx_epc.base, pcms->sgx_epc.size, E820_RESERVED);
+    }
+
     if (!pcmc->has_reserved_memory &&
         (machine->ram_slots ||
          (machine->maxram_size > machine->ram_size))) {
-- 
2.31.1



