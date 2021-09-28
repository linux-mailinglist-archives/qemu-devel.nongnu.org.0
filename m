Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4862741B003
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 15:28:39 +0200 (CEST)
Received: from localhost ([::1]:52694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVD9y-0007O6-1V
	for lists+qemu-devel@lfdr.de; Tue, 28 Sep 2021 09:28:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mVCaG-0006Ya-QA
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 08:51:44 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:41957)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mVCaB-0001Se-PR
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 08:51:42 -0400
Received: by mail-ed1-x52c.google.com with SMTP id s17so64109691edd.8
 for <qemu-devel@nongnu.org>; Tue, 28 Sep 2021 05:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HIpbBVsq+qGYM7QnpoxAN/h8ed4NbHFTGJsvkWBRASU=;
 b=lYD3sLKIhzvpMGiTXcUKXT6GdlYtwKGK/QRBqu94a4sZ0qGayy7m/EbVrc59y/Ooik
 HYQ/+tAU4MhVE09RZ1oJtSvr+Vt/wqIEaixLE3qBsVkTaEWsD7EEYSc/HzmHpewq9R7o
 HVpESZXws85qEObz79eIt4C1Zmn2hWsmKNu711Ka5r+VbtzhqIMlRnaOjYpqcr6JrMMC
 0gnVqUuIbfRCjzLkGztJ1jquwzzqHutAtap4nGAsS/DPpmkvq9jYV6ek+wv+orkekE5A
 f4ut5bo19f9SvpmCopuLV93iMMkK2I4LV6BNK5p9DlVanx0MLYL36MqXSG06nUKGGu2O
 +XSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=HIpbBVsq+qGYM7QnpoxAN/h8ed4NbHFTGJsvkWBRASU=;
 b=i17xinKJvZ9w9HeIccy8mtScBdPDuZJQ7tcvQsOFC7HZkQjp4m/i4Cko783zZXGsTg
 aeWqWQ3nt6xE7pvfr8udMnSKkTQGqB7ahDRrOfIZnXwmRIcjAEseOaWgfjidHU+3xsK8
 nFtYH7SvL8sSBG7gReRYMiVn/24lZ7hO8qhnYsUVgXDNdDTU5WK6ZZ1mXq03MW1vvXR+
 hhGQVDMGHqmg8vY12iQzSU2K+Yt9S6BXn7vmg7uc5Vm9f+/ACMxNXz/M64JcMn/Qf9A8
 qjIDFKLoygbvbqSSYLB2gbf5p4i6hfTesB57oHETTRC1SpFsxVzClvVlIfIXHqyHmFQU
 jdLg==
X-Gm-Message-State: AOAM5303X2VTa37T3LP9pC8ihAXOp2ZTwrCXqaUNB6PtP1HVmATQHADZ
 055n/Jpti34zZuJzVBCaBg80fYKidqs=
X-Google-Smtp-Source: ABdhPJx46ySwMifQ7F9B6giPw51XotA23WITMLWGDmzSR+qp5suB64Av1ul2QU9zQJvrntof6Lp2lw==
X-Received: by 2002:aa7:c305:: with SMTP id l5mr7377224edq.205.1632833496328; 
 Tue, 28 Sep 2021 05:51:36 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id p24sm12641685edq.27.2021.09.28.05.51.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Sep 2021 05:51:35 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 22/33] i440fx: Add support for SGX EPC
Date: Tue, 28 Sep 2021 14:51:05 +0200
Message-Id: <20210928125116.183620-23-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210928125116.183620-1-pbonzini@redhat.com>
References: <20210928125116.183620-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52c.google.com
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



