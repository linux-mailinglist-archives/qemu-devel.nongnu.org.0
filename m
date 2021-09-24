Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A502941710B
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 13:42:14 +0200 (CEST)
Received: from localhost ([::1]:37186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTjan-00088n-Na
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 07:42:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mTjKY-0007pc-EK
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 07:25:26 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:46034)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mTjKX-0000Zt-10
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 07:25:26 -0400
Received: by mail-ed1-x52e.google.com with SMTP id dm26so549358edb.12
 for <qemu-devel@nongnu.org>; Fri, 24 Sep 2021 04:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VDdHQ7wAYQQjw1FA0X2CemkmylszfW2NxiKOBkxwC/s=;
 b=C4kafI1i0zx4Djuprq+67bZM5g6azBQd31PByc/71oVN6durhFKD4cX68uAz47tAGS
 83FPzkmcbY41mARhkl1ZXk1DqEAwSdRjtidw6ORow2kj82lzTlxLmt69BQFl0eJP305q
 mJ+I2KM6J0xwu/Gsfj1+3UNOtKr+c06Qvg3KT52/MtIoltGrpGh6zrOqdi3MdRcgVd01
 Ft22xzl+6xdGvHgUBgWrz8rDL1VGfFK8bkB9NAjQXTNMpdTV6jXk8sRj/2L+CHbhoVh8
 zvMKFibrgX+ASZCZ1QRpipIN2q1DC+sboHO8NCfM/de8APt+8Hs+ocgn93Du48qR1pPe
 b7Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=VDdHQ7wAYQQjw1FA0X2CemkmylszfW2NxiKOBkxwC/s=;
 b=gtPq75L9JCwU441TR4Ci+2nOGmPKbRlx7Q3o8Cvlew29XjbmkaPJfh36FGE34p6jOE
 VArERP+q12MKdDCcfldqaERfOHLAgdMRz+tE02BWSK7KkKQmD9YL8MMv1a6Incsr2qJt
 iNVEW0U7jklIDAXqWUlmpZT9Z2nrzZ9tPNULT3W7aoVSsnoHYB/2rHzguZXF1WIc/c1t
 /Fmb+qLKmN5G3znhyPslKjAL1s/iNg5rFBBGi3vteqFixAjb7bKulXDeztW8i2rFu0LI
 g7QKm46a8BStoaseLtFkre9y7y8j7jKJHK/diRG5mK/W3XCvozRVLxWF7F/WqGKl4qCK
 EEcA==
X-Gm-Message-State: AOAM532dRWz12FkvCWeug1jEHPTvnehQW/YbvhvwL1stJmELGGCE5kvG
 FJvug9oUAIMUo8/tZvEgqNGSR7pJxRI=
X-Google-Smtp-Source: ABdhPJx/6E21KgToQbgGw5pKQrg2fpjSitakCgJX+Ay0kPsb0VYkOKIXFlDjYBOAw3ioAUOxkRX5TA==
X-Received: by 2002:a17:906:1454:: with SMTP id
 q20mr10627031ejc.446.1632482723744; 
 Fri, 24 Sep 2021 04:25:23 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id t14sm4886961ejf.24.2021.09.24.04.25.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Sep 2021 04:25:23 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 16/26] Adjust min CPUID level to 0x12 when SGX is enabled
Date: Fri, 24 Sep 2021 13:24:59 +0200
Message-Id: <20210924112509.25061-17-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210924112509.25061-1-pbonzini@redhat.com>
References: <20210924112509.25061-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52e.google.com
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

SGX capabilities are enumerated through CPUID_0x12.

Signed-off-by: Sean Christopherson <sean.j.christopherson@intel.com>
Signed-off-by: Yang Zhong <yang.zhong@intel.com>
Message-Id: <20210719112136.57018-16-yang.zhong@intel.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/cpu.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index de58599a3d..cacec605bf 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -6154,6 +6154,11 @@ void x86_cpu_expand_features(X86CPU *cpu, Error **errp)
         if (sev_enabled()) {
             x86_cpu_adjust_level(cpu, &env->cpuid_min_xlevel, 0x8000001F);
         }
+
+        /* SGX requires CPUID[0x12] for EPC enumeration */
+        if (env->features[FEAT_7_0_EBX] & CPUID_7_0_EBX_SGX) {
+            x86_cpu_adjust_level(cpu, &env->cpuid_min_level, 0x12);
+        }
     }
 
     /* Set cpuid_*level* based on cpuid_min_*level, if not explicitly set */
-- 
2.31.1



