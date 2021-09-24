Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB34417150
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 13:51:31 +0200 (CEST)
Received: from localhost ([::1]:54340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTjjm-0003Mf-Sv
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 07:51:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mTjKb-0007uk-0q
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 07:25:29 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:46763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mTjKZ-0000be-Ij
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 07:25:28 -0400
Received: by mail-ed1-x52b.google.com with SMTP id ee50so34836652edb.13
 for <qemu-devel@nongnu.org>; Fri, 24 Sep 2021 04:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UgkF1mvQK//t6XGujinPfYl2Zezj6c5sitJ7wVbQTZk=;
 b=aRYsDJ6RlG82hxpdlQYlkUM+tUkNgm7RVYTzAB5Al3emL+KWyqwk1IwrOEyMSpRwSH
 fvmUloOPCu2+ptpV/cMabGIXBmwtIvC7KjOxm6olQO7hVcrSGhRoe8ep1QuayEYSNxdv
 mGWmnvxqxip0pqFoKH4pImMeYLKEv54VX/GJON6c4rDMWHXoZSYMYJI5lEUenfOhgvmR
 YEsq4v+4Dfwzuv+GCFM/F9FUWY6K46M5dUrv4skfruG2UveX3EENxGlhEqVSl0enrBju
 N9kVv0tFqQ+5ww46W8OfVzL6C+ch+prvqbts1HG2FzhoH+Y4kM8+AYcZ0cBeThkjrfsI
 LmAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=UgkF1mvQK//t6XGujinPfYl2Zezj6c5sitJ7wVbQTZk=;
 b=FR4zoTDLZ+LE/M56reBwG46Jd8MRJsfsVSJeh/wcYEfgtuA+K+TxWzF0BxKU1lYyAq
 AycfUiPEYhxmhPGwJq3nJF8esOiXm12Aa1yEwvxBuno9yajgMrPhoLaHV7Y7wkGEd1Lq
 3EDkiy9/+evxRLc05Gy/WqYi3mG9PC5hv8mO8GMh3X8tZQo01Wq1RD/QJx8JYxKNtRH7
 9FzH3QkbRd+WONZilKX1dTWuGLSuLwtZfPJKAhqxtz0f8hUSND/zJ4pwWz4BFb6hbaFA
 cFxnKoQ/lu051RhyGHrxWojjT6pT175HHSexR7ebxQf5Xw8qjZRXOSaQxfIaSJDHAEe+
 viCA==
X-Gm-Message-State: AOAM533YPskwu7ophrnD7vElbWqvV5kZwVN/nchNa/0Cty2jSgP42PtV
 6HE7r9YVxhq/OkCsiW3VIXvZ0hLJsq4=
X-Google-Smtp-Source: ABdhPJz+LLV15KpSWyw97ABoAy09rcQb20QMx4KZVV0ABW5Wq+FgcEEZ5ovfd1i2Vryp/aPQuFh/uQ==
X-Received: by 2002:a17:907:7803:: with SMTP id
 la3mr10785186ejc.235.1632482726226; 
 Fri, 24 Sep 2021 04:25:26 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id t14sm4886961ejf.24.2021.09.24.04.25.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Sep 2021 04:25:25 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 19/26] i386/pc: Add e820 entry for SGX EPC section(s)
Date: Fri, 24 Sep 2021 13:25:02 +0200
Message-Id: <20210924112509.25061-20-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210924112509.25061-1-pbonzini@redhat.com>
References: <20210924112509.25061-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52b.google.com
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
index 58700af138..1260fb6197 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -883,6 +883,10 @@ void pc_memory_init(PCMachineState *pcms,
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



