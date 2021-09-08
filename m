Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 520944037FB
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 12:38:11 +0200 (CEST)
Received: from localhost ([::1]:51530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNuy2-0008No-Cc
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 06:38:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNuRx-0006qo-9f
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 06:05:01 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:37686)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNuRu-00038G-W2
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 06:05:00 -0400
Received: by mail-wr1-x435.google.com with SMTP id v10so2412006wrd.4
 for <qemu-devel@nongnu.org>; Wed, 08 Sep 2021 03:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yPtnnCGwNpWuv+KJHtggVQGhlvl+/IX1Kajo4BpYxPk=;
 b=T4h3RFFdkiq+Cahbi0bOi4+64hD2Wyp/VGitdsfhTvtL1K0XItBC0tb/6+ISsut8iY
 Xg9t3cXrFc6ENiml115U/cL/GFHQ+Xts6tWKZLIhe+v7bPeQj99bStU1hxYCawlZ17nE
 4tK5TC2grkd77AgiLJPr4HIqZ+rMvhrgD7Mh/dgWTo/LOLlsBp4Apiz6EAlpPC7TWYxN
 OpgjwoHcORb7mfb/fRnBj1lLvjTW/5VXo6/u3i2gBTgNMyff6XIh7zlAilMzIEwl98Ox
 iaCSBte4J7LCmXtv2WH3dD0z8TEfFVAWr5339zIap+vDS9GwcsUKzEkJUE1WpxUYXLya
 5avw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=yPtnnCGwNpWuv+KJHtggVQGhlvl+/IX1Kajo4BpYxPk=;
 b=hL2neTjNEsziyuy0qfojVuLvtG/w6+1akd/LJvpRhiWFgaUppOhoQwETvSRMsxgb10
 tUeLGj+x8yy9aZV42Qhd670+bGqP2KoKk6tw5II0gbUTNsgFBBAtdnzu4rhAUva+FxbD
 vlbTSGWZdfelhxf1u2y4S9oQRyS2FOX+rvXewQvHm1Rkyfx6/0toeCo+cIQeUaglg1lG
 0es2O1sEtuj1r6VTJGluXXzhrEoLWJ9vWZqeaL1H3/6wUNQ/IZAUaa3e7SHUqloie7nJ
 tr4bRqKjjKWvTwLEP0CGfsS6U3rhPCGGhLBVoWjfoKRF9FBck1MkxArmM3wSs1iu7RGl
 atxg==
X-Gm-Message-State: AOAM533cWFeW5+Y4sHSHTkmNFRkk2iZMO5v8oZgxd2Rtw3+wjdiqOI4V
 t7TMv0DXkno8SkDgNZuD8Qwf01sm1+8=
X-Google-Smtp-Source: ABdhPJzomZ6xTWBp2R13JCzK3ZBJDL/cF4iXQf7DlflN4pdWPWp0NWEBIsd1SrBgmLdURHb2zBLazw==
X-Received: by 2002:a5d:6210:: with SMTP id y16mr2986872wru.290.1631095497780; 
 Wed, 08 Sep 2021 03:04:57 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id u8sm1683715wmq.45.2021.09.08.03.04.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 03:04:57 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v4 30/43] i440fx: Add support for SGX EPC
Date: Wed,  8 Sep 2021 12:04:13 +0200
Message-Id: <20210908100426.264356-31-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210908100426.264356-1-pbonzini@redhat.com>
References: <20210908100426.264356-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x435.google.com
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

Enable SGX EPC virtualization, which is currently only support by KVM.

Signed-off-by: Sean Christopherson <sean.j.christopherson@intel.com>
Signed-off-by: Yang Zhong <yang.zhong@intel.com>
Message-Id: <20210719112136.57018-22-yang.zhong@intel.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/i386/pc_piix.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index c5da7739ce..dabb66b51d 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -153,6 +153,10 @@ static void pc_init1(MachineState *machine,
         }
     }
 
+    if (x86ms->sgx_epc_list) {
+        pc_machine_init_sgx_epc(pcms);
+    }
+
     x86_cpus_init(x86ms, pcmc->default_cpu_version);
 
     if (pcmc->kvmclock_enabled) {
-- 
2.31.1



