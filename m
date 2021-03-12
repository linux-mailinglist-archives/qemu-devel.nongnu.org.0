Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C55338F75
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 15:09:42 +0100 (CET)
Received: from localhost ([::1]:33902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKiU1-00080d-0l
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 09:09:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKiD6-000327-8C
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 08:52:13 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:40873)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKiCt-00020b-VI
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 08:52:11 -0500
Received: by mail-wr1-x42b.google.com with SMTP id v11so1815447wro.7
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 05:51:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=FtE1w8SqWKE0y1z04t9BX5/YkIGduuqbmCzSca0fKhg=;
 b=BWosYPeFmrY6D7mI+4cE7t/Wdjr5gt1WKFRUJRAKY+9BqmEWftWKzGiqtLDVJyBCTl
 Sc78C+8+aLuYZI9Dwf7JL13+g+G3vuAJOTX1Lfj6x70GjQOH+Mr8KeA4JzLlAWFgiLVw
 iPYyYFo1ofrf2mJQmtxItptxj+ETcIsVDBEhAgJsX8rfCxRyJeJjexofd2JkwqdsAClc
 fxe9qvZXtfr5ebwpPuwXrm2RNqp+a1jhyI+7Iyw6ZHOI9f4YnRpElsOmVaUSeF81gF4q
 4HTqel9MjQAUBUbIsWSlmetEVb9D2hHJahh2UjQX3La2yXU0d2o378NKeUq0xO0G++P6
 fDBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FtE1w8SqWKE0y1z04t9BX5/YkIGduuqbmCzSca0fKhg=;
 b=LEKb2SVktbwPus528n4Xu7y0WcHdXaizOmWZ50OQtTbIFJz2hNksK4oW9S+Of+eS0u
 T7lX2rBlkJfRMasUiQ5gXXVkOMkC+oMC+vFSgKNSp5DiuBIUpCv5pZ94VmgymVQiVQCE
 nd3O3OmLAHNXPcgdL5eU6BbkqRnQObKOu1a75riFoVQEq76WrFo0adbDCvXxpw4G1AG1
 AKyNbrKa5BrqznpWRN9zYf/cfER2nTiA56efHSYeYiDDSRLWKN/dnF9pS1W4ILNqE67A
 a3jE/tkWASovW8/jMpSuHscQLkabDW7Q/o7kMQfqbX7jxzF7UvVaEubDR/oeRss760Bl
 uccg==
X-Gm-Message-State: AOAM533DowvzYbvv5NQhm+gxt2tyzXt/0lMz3BS/gBzt4tAOyr2BWIip
 QCd6ascwQQpGYnZRbZyN1S9zYqPlLoiTOlZ6
X-Google-Smtp-Source: ABdhPJyvHbJRmBRnsQpJbn+E0r6iu4ypupHCgEGgWlvMxYyAcFV6rKurBkM6RoWami3DUg7dk/lS9w==
X-Received: by 2002:a5d:4e85:: with SMTP id e5mr14440187wru.218.1615557118691; 
 Fri, 12 Mar 2021 05:51:58 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m6sm7964994wrv.73.2021.03.12.05.51.58
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Mar 2021 05:51:58 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 24/39] accel: kvm: Fix kvm_type invocation
Date: Fri, 12 Mar 2021 13:51:25 +0000
Message-Id: <20210312135140.1099-25-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210312135140.1099-1-peter.maydell@linaro.org>
References: <20210312135140.1099-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Andrew Jones <drjones@redhat.com>

Prior to commit f2ce39b4f067 a MachineClass kvm_type method
only needed to be registered to ensure it would be executed.
With commit f2ce39b4f067 a kvm-type machine property must also
be specified. hw/arm/virt relies on the kvm_type method to pass
its selected IPA limit to KVM, but this is not exposed as a
machine property. Restore the previous functionality of invoking
kvm_type when it's present.

Fixes: f2ce39b4f067 ("vl: make qemu_get_machine_opts static")
Signed-off-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Message-id: 20210310135218.255205-2-drjones@redhat.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/boards.h | 1 +
 accel/kvm/kvm-all.c | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/include/hw/boards.h b/include/hw/boards.h
index 5fda5fd128d..4a90549ad85 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -128,6 +128,7 @@ typedef struct {
  * @kvm_type:
  *    Return the type of KVM corresponding to the kvm-type string option or
  *    computed based on other criteria such as the host kernel capabilities.
+ *    kvm-type may be NULL if it is not needed.
  * @numa_mem_supported:
  *    true if '--numa node.mem' option is supported and false otherwise
  * @smp_parse:
diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index f88a52393fe..37b0a1861e7 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -2068,6 +2068,8 @@ static int kvm_init(MachineState *ms)
                                                             "kvm-type",
                                                             &error_abort);
         type = mc->kvm_type(ms, kvm_type);
+    } else if (mc->kvm_type) {
+        type = mc->kvm_type(ms, NULL);
     }
 
     do {
-- 
2.20.1


