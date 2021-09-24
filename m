Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C21E54170F2
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 13:37:04 +0200 (CEST)
Received: from localhost ([::1]:57394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTjVn-0002KU-PL
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 07:37:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mTjKc-0007yq-Kq
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 07:25:30 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:37718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mTjKb-0000by-3y
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 07:25:30 -0400
Received: by mail-ed1-x52d.google.com with SMTP id bx4so34922481edb.4
 for <qemu-devel@nongnu.org>; Fri, 24 Sep 2021 04:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=e3CR8xrdtQNpyFMwEEkkK45w7yuIntrOePJfuLXKl2k=;
 b=UMbERYiMt6fmplsnsvzyw3yj1YEQoOnbiTTgwLrA/6KAX5dkQe1oCYbzBLm1hctnjs
 KwuEReRM1rjAfbRJVQZ1GSIoWg4GD7YNbS4o4HuoPx+bMB/OUSLUGJ9reOxKP/uIxPxw
 a36ifaQNSVgWQjG3jio/Vi/oLJeAZKn+aM/gm7QaVD/Abzm36MlwVrSoYGI1RVRCQ32V
 clx+EV27u4zHm+KAlnx9xLDJ8ffG8alDovvPxGADvWa7zqdq1IBhpjGBPsh7DK0RN2s1
 zKPmfOcTGvJwImL9Dff07+eXQjl5YcdbEMSLkYpS2iVZagMhQm0gqXnRUPuyF0lZK4tF
 sfsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=e3CR8xrdtQNpyFMwEEkkK45w7yuIntrOePJfuLXKl2k=;
 b=E0pxpQk9WHtpLFR8iZFa0EEiq7gsNQivktjZ1Vi2/nPCUMjqruRfeHsdhJsAwkGxCk
 Rswn+RkFZkNVXLAMrP01tFeLz3WHhPofGqQEmTA9Ibs4ldtzvV9dWXzigsf4kmMOGfW0
 KKtL6mLI6KWPBIrpAN7dInf5CNnmRud2S5FIEKkaghzZgUKLauMWRQxE/wySKaGxa9Ps
 BUy1of+K6y2ZW/RYTEHrHUBVKTwDC0qlivT4dbf1HYdyL8+LnvnzkV+3AriDr3J39uLv
 yy2hEXaIu5kqBvUIQZ1zCmDz8IRpO7V2EX63yV94qSsIdQUxi4TOlvJpUFEG3DNimYDY
 OadQ==
X-Gm-Message-State: AOAM531lKEh75SsBCff4dIdik7UKB0bnAY9Z0wtEYylNP+I44s7aWZI1
 wtbq1MNDNSn1dX8e19Xl2i0TNkm0BXM=
X-Google-Smtp-Source: ABdhPJzh5u3Lr9pMnc1EQfIrQp+VZhxF86mAez1ghcrXYUo9KWqC0ITFhLd9bHan4u+a/l7uhlMv9w==
X-Received: by 2002:a17:906:1d43:: with SMTP id
 o3mr10591019ejh.118.1632482727917; 
 Fri, 24 Sep 2021 04:25:27 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id t14sm4886961ejf.24.2021.09.24.04.25.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Sep 2021 04:25:27 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 21/26] q35: Add support for SGX EPC
Date: Fri, 24 Sep 2021 13:25:04 +0200
Message-Id: <20210924112509.25061-22-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210924112509.25061-1-pbonzini@redhat.com>
References: <20210924112509.25061-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52d.google.com
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



