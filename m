Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAB33417158
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 13:54:30 +0200 (CEST)
Received: from localhost ([::1]:58646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTjmf-0006Op-97
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 07:54:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mTjKe-00084B-Ju
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 07:25:32 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:37723)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mTjKc-0000dI-3I
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 07:25:32 -0400
Received: by mail-ed1-x532.google.com with SMTP id bx4so34922560edb.4
 for <qemu-devel@nongnu.org>; Fri, 24 Sep 2021 04:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HIpbBVsq+qGYM7QnpoxAN/h8ed4NbHFTGJsvkWBRASU=;
 b=qFZ9LuyC08/9GdOWO0/un8t2ueeJ1yhDK1E4s7z/j3e71goVWROCPXsZi1JyWhaKpG
 Pug2p2/KIKU20BKb8ONaHnmvEv1L0vO+C2NA+PNmICXr9Qw5pQuPNcZ6I4tegDrUNvbg
 0DHalAIFiWAx3CKt6WvzQbOVWlBt2VDdF8XBvdVvWkB3Gz3UmSSp4hMyntlx81cjKwGi
 KLVJJRUPva8fg34Za51En6+IAbnahELjCefARXYrql6Ojp+WrvslVLEZjLQCZExVn122
 eqrKJaLgpp6p+fTIPfs4fFpDeOxwY5mER0g2Qem7OHk6GlgvuKV320AASgiSt9Zv1phz
 RC+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=HIpbBVsq+qGYM7QnpoxAN/h8ed4NbHFTGJsvkWBRASU=;
 b=rHx5AbrLpHx9xo6EyNLaSr8oWkYudfGtxnc/SW/MmAZk6+VfHzqBodRs/T/jq2k1bj
 vFjlv1Rc4aGp87FI+zhC7L7Ul8nU0tZKG0r/3J0YTo0q0UtVSRM4eKvhFfXxjsu+TTM0
 ZDGI3XZyDiMgX5cZMWqH8/CqAhmsar3M8z3LFPoV4Ue2BJRiRnrz2jEeRrbOBAJmHkGt
 qh5B0rzzZ2nUm7qyFPjtIMWsa0l0184XGbHfZsvJ25RjUTJnEN3/2lKHhm1P0oWXjiXu
 Uz7F1t6NonLnMCAnyStExZI5CkAkdjJbbM2BeAaEgAQqzYJRIUu9aSCa1+S+PAXmFHvq
 wltg==
X-Gm-Message-State: AOAM533bZijZFeX6JeId284hk0F9Ei07iyHrMCxPdXWXZ9c5golbqj4c
 JTHJppMQZ/PpXVv+yQxG5//YlfJw5Sk=
X-Google-Smtp-Source: ABdhPJy9bW5lxvN95Vzmiz5ThofYxcglNmyP4otiPlFLFNROpKLTh5NTlo0ilj8wRg1ZAqfjp23+RQ==
X-Received: by 2002:a50:bf4a:: with SMTP id g10mr4368772edk.11.1632482728637; 
 Fri, 24 Sep 2021 04:25:28 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id t14sm4886961ejf.24.2021.09.24.04.25.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Sep 2021 04:25:28 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 22/26] i440fx: Add support for SGX EPC
Date: Fri, 24 Sep 2021 13:25:05 +0200
Message-Id: <20210924112509.25061-23-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210924112509.25061-1-pbonzini@redhat.com>
References: <20210924112509.25061-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x532.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: yang.zhong@intel.com, philmd@redhat.com, eblake@redhat.com,
 Sean Christopherson <sean.j.christopherson@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Sean Christopherson <sean.j.christopherson@intel.com>

Enable SGX EPC virtualization, which is currently only support by KVM.

Signed-off-by: Sean Christopherson <sean.j.christopherson@intel.com>
Signed-off-by: Yang Zhong <yang.zhong@intel.com>
Message-Id: <20210719112136.57018-22-yang.zhong@intel.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/i386/pc_piix.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index c5da7739ce..6cc834aff6 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -153,6 +153,7 @@ static void pc_init1(MachineState *machine,
         }
     }
 
+    pc_machine_init_sgx_epc(pcms);
     x86_cpus_init(x86ms, pcmc->default_cpu_version);
 
     if (pcmc->kvmclock_enabled) {
-- 
2.31.1



