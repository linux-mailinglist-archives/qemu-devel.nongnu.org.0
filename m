Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90036401C55
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Sep 2021 15:34:07 +0200 (CEST)
Received: from localhost ([::1]:51612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNElC-00043G-2b
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 09:34:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNEPg-0001bI-UU
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 09:11:52 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:38880)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNEPf-0007uI-8Y
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 09:11:52 -0400
Received: by mail-wr1-x434.google.com with SMTP id u16so9796952wrn.5
 for <qemu-devel@nongnu.org>; Mon, 06 Sep 2021 06:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yPtnnCGwNpWuv+KJHtggVQGhlvl+/IX1Kajo4BpYxPk=;
 b=nHoj05MPuM0tmmfoX9xy5yIFagsJj5+BTogkIApRni0SrrVWoBqb1yF2p7RduDiUkP
 uGu06YCY+Ue0LrPfDCbC4dl2/gQkMQor5jyhCn235aRLJWelD9keCV2H5E3/TmIPXSRx
 4MfEPwVCmwvoski52DOfZnTPt9Y6tvQsJ7DfI+dUNxcRdoPbSVQQzbSBTjhL7aDrcbvs
 n8cVoSZOEH3hI2biJOU1l0ZAEgIt2buuv5MVSknXbd3ejsWs4ehiqPBasAE171zmKnpj
 0rdwdZniGU9NUhI6DLrELgsCtXwI6uW+yjisVry3u2AQBpF6Oa1DzpBOjov6xd6DhKqJ
 1mKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=yPtnnCGwNpWuv+KJHtggVQGhlvl+/IX1Kajo4BpYxPk=;
 b=bMYqYM0CLrAEqrdVlrysz0PDijV5Y2fG48f9qaoMymc/OpN4bXqbgXqf/+5XtIlHBQ
 umgE0DhLwd+X+oXuM4U1mKfjFxMQ+kFnrXIoYH3JlWbNiApBbFV1UmFUzF87TE3NhOCD
 6MhYRfv7LGy4JQsphTOe+XkZsVf5sErBcoOrXNANVXEYq1w1SLUyo+yBZ6gWqS8SO4Uh
 c+7cMVPfUdJ67zaw3qf/Fv5mt3SGwfc+IMazfHcJwf7m+4iFvuhHMOESBU9ZFIrdsfBK
 CvFxfxvK1tYnfumpp+YTn1wI/J1Y+cQfC1pYxJ7lKzhrKuaKhUlpKYZKyZMLE9vx6j/t
 u1GQ==
X-Gm-Message-State: AOAM530WGEA3/6iMJkG31D9p2/0BBM6MBdRNsE0Zd9EZ43oW5p4ToHud
 vEJW2LA15yVrb5g91AfY6VvKUSAEyLg=
X-Google-Smtp-Source: ABdhPJyy/v9fSZHcS9f1z8zUYcVdaXIseR/u3UvDvN9z57KQ/DV7JvLZA8BBflWIuRqH2CtPJU6YEg==
X-Received: by 2002:a5d:6485:: with SMTP id o5mr13185108wri.91.1630933909963; 
 Mon, 06 Sep 2021 06:11:49 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 k4sm7992331wrm.74.2021.09.06.06.11.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Sep 2021 06:11:49 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 29/36] i440fx: Add support for SGX EPC
Date: Mon,  6 Sep 2021 15:10:52 +0200
Message-Id: <20210906131059.55234-30-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210906131059.55234-1-pbonzini@redhat.com>
References: <20210906131059.55234-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x434.google.com
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



