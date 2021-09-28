Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF3FF41AFDD
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 15:19:43 +0200 (CEST)
Received: from localhost ([::1]:34524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVD1K-0003LF-Sp
	for lists+qemu-devel@lfdr.de; Tue, 28 Sep 2021 09:19:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mVCaG-0006Yd-SO
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 08:51:44 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:42637)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mVCaC-0001TL-7d
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 08:51:43 -0400
Received: by mail-ed1-x530.google.com with SMTP id bd28so21418108edb.9
 for <qemu-devel@nongnu.org>; Tue, 28 Sep 2021 05:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=e3CR8xrdtQNpyFMwEEkkK45w7yuIntrOePJfuLXKl2k=;
 b=MvUvjX/UOKt25ZDPXnUhUu2wGVNRDf9Ak4wQgVWHVZbIQtPrpWl11k55vdZkuX0Th0
 kpdX120Yvo2xUZoOuN+oqD40/SZrd48qC8kdabSvUTYdUEuuIk8d8eNNqfQcbND/YLg9
 gjFWP38HJCisTgrIoAojzP4hVsOeKTC9bHXFA8DA3QCuK2DTmhT/8LT0K8tDDdqTuWNA
 aPaz5Tf3Ih6sDRcuyHdnjmNy6n44ScDZZYYrjtTkQu7VSOzU4ieAX0d2C/IPAsNQgUoG
 5LiZJVpTYsNO4l7o6M1URiV9kj8Ht8FxRWjLllVNo/1avtVA3hAIVPu2DiWwjXLQASMS
 MkiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=e3CR8xrdtQNpyFMwEEkkK45w7yuIntrOePJfuLXKl2k=;
 b=14NqpGczIzrgmpeNOQo5Qc1IO6hXdNSy18W46zaguaoUB7FQF0d65ZrUtKXJl5CVqM
 PO9SdTIBciNU1gkPC6sbhQ4u21cZ/iaBy0mFUbyawxepr+TtG9kicVVIo4OlkuOEcv1k
 3LLVDLhcTz+seqp4qTjAWNxioyzS89KpiHJGoHw+vwGuvBnhQGfeoL1L43KkiA4/Xh9j
 BHaEi3qBX5FQTz4pf8qVe9+zOdZ00MSYVT4qspB90XPu1aX3cYtxPszdGonTVrlZMXit
 F6aw9AAUexE/e5tw//K+p3hPTyo428SDqB+heW8xtEgpiPmGsKfnp81LSiq4/Qaxfv54
 Di1g==
X-Gm-Message-State: AOAM533sLF5/8WQHDrCmJ40yIvtkYwnKqq4xjePeL8hSnUg8wTAKhhAD
 kFXsJmjPUYrcxBvjpgggTDxAhJlzpEU=
X-Google-Smtp-Source: ABdhPJwN95IcDGgE1yk4F1SXea+3jNYH2UXmd1Haa75I+ZfHKVPdj5IWmX7zqepM2YeZUqjFxe0LFg==
X-Received: by 2002:a17:906:1405:: with SMTP id
 p5mr6308386ejc.197.1632833495430; 
 Tue, 28 Sep 2021 05:51:35 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id p24sm12641685edq.27.2021.09.28.05.51.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Sep 2021 05:51:35 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 21/33] q35: Add support for SGX EPC
Date: Tue, 28 Sep 2021 14:51:04 +0200
Message-Id: <20210928125116.183620-22-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210928125116.183620-1-pbonzini@redhat.com>
References: <20210928125116.183620-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x530.google.com
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
Cc: Yang Zhong <yang.zhong@intel.com>,
 Sean Christopherson <sean.j.christopherson@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Sean Christopherson <sean.j.christopherson@intel.com>

Enable SGX EPC virtualization, which is currently only support by KVM.

Signed-off-by: Sean Christopherson <sean.j.christopherson@intel.com>
Signed-off-by: Yang Zhong <yang.zhong@intel.com>
Message-Id: <20210719112136.57018-21-yang.zhong@intel.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/i386/pc_q35.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index 46cd542d17..5481d5c965 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -177,6 +177,7 @@ static void pc_q35_init(MachineState *machine)
         x86ms->below_4g_mem_size = machine->ram_size;
     }
 
+    pc_machine_init_sgx_epc(pcms);
     x86_cpus_init(x86ms, pcmc->default_cpu_version);
 
     kvmclock_create(pcmc->kvmclock_create_always);
-- 
2.31.1



