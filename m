Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B99CB32F989
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Mar 2021 12:01:22 +0100 (CET)
Received: from localhost ([::1]:55730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIUgT-00069V-Oe
	for lists+qemu-devel@lfdr.de; Sat, 06 Mar 2021 06:01:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lIUZq-0005qy-Uh
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 05:54:30 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:45650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lIUZp-00087K-Gy
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 05:54:30 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 r10-20020a05600c35cab029010c946c95easo817403wmq.4
 for <qemu-devel@nongnu.org>; Sat, 06 Mar 2021 02:54:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=x7HLVffWfs7XbJuqu9XKwrCohcTt98B8P3m4cZ+q8nI=;
 b=UwXKAnnQgRG1u2VLtBCjoUPBU32NgHUlJy0M0jBvP/erQTAKCcsO1yBRVWqGwkw2yf
 7WPX/N8bhl98wGJSVero1V3AeFsWwb8WkiKdEH5k9EgiapLJpN4ErIV0rYQi6dYLmOjX
 FGG6bkOR1n/5I3K+OtA60goBAGraxd3UZ+fXoNUsaaWxwCAqQe1Ktsw6bWnIE3b6HSJS
 mYFQTWi1l61gqQuquPeyTd6ZW8DUJ/duurf2fUxVgF1qxdU4FafANmLoDwM3arzAGFjF
 FANzQdER+B2uk21L8F/LIq9XC8OVlE2Le8TH9XVm6an17uJr4jTDIozST7JwUAqRH4we
 9eeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=x7HLVffWfs7XbJuqu9XKwrCohcTt98B8P3m4cZ+q8nI=;
 b=QBe5f9CnqYY6XdJp3ICiyxG18YnnbX/UD6LHEMMj2e5+tOUDdg/iTFD0jOaATRfoCJ
 DMh3ql4cr0c/41E2vpQNi7RSY7e4InjIlWwNlInmH1fjQIiGzNyhctCcTzJL39cAaYyO
 P4I4ZS50PfLxThoZw0Me1tOUs0SulGp7AC3a7yZvZkcO59iM9HN7ocC8MKIBhqHuDaTV
 iUvwKqfQFA1l+88+HMOqMY7n/B8FUQeyERMWGxgzwfj7cydqVP0GT1DdoSciSkluKCk5
 dTRzBVuqxvE0N6+ekkSyXdYmfxLyqCWfcixwdRiPwQ86r3fxLBq9ABo2Ic4yi1IAdKwi
 BisA==
X-Gm-Message-State: AOAM531QBktE9ZnugzXiEmVaXGGPd/lVARCfuDIUrLg7vsT669wSegPL
 yqICOpa+QF2F5+8fTPZYANErjLqmLYQ=
X-Google-Smtp-Source: ABdhPJyGjU4rJLjFZsm6Jr77WeDwPtqhhHHtRE/iIAhjNzmh9ggeQxzKDGta8dSaX4yOftzSdWeKBg==
X-Received: by 2002:a1c:2846:: with SMTP id o67mr13120469wmo.188.1615028068215; 
 Sat, 06 Mar 2021 02:54:28 -0800 (PST)
Received: from avogadro.redhat.com ([93.56.170.5])
 by smtp.gmail.com with ESMTPSA id i26sm9326472wmb.18.2021.03.06.02.54.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Mar 2021 02:54:27 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 08/23] accel: kvm: Add aligment assert for
 kvm_log_clear_one_slot
Date: Sat,  6 Mar 2021 11:54:04 +0100
Message-Id: <20210306105419.110503-9-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210306105419.110503-1-pbonzini@redhat.com>
References: <20210306105419.110503-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x330.google.com
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
Cc: Andrew Jones <drjones@redhat.com>, Keqian Zhu <zhukeqian1@huawei.com>,
 Peter Xu <peterx@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Keqian Zhu <zhukeqian1@huawei.com>

The parameters start and size are transfered from QEMU memory
emulation layer. It can promise that they are TARGET_PAGE_SIZE
aligned. However, KVM needs they are qemu_real_page_size aligned.

Though no caller breaks this aligned requirement currently, we'd
better add an explicit assert to avoid future breaking.

Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
Acked-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Andrew Jones <drjones@redhat.com>
Message-Id: <20201217014941.22872-3-zhukeqian1@huawei.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 accel/kvm/kvm-all.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index ffce83f1a7..f88a52393f 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -673,6 +673,10 @@ out:
 #define KVM_CLEAR_LOG_ALIGN  (qemu_real_host_page_size << KVM_CLEAR_LOG_SHIFT)
 #define KVM_CLEAR_LOG_MASK   (-KVM_CLEAR_LOG_ALIGN)
 
+/*
+ * As the granule of kvm dirty log is qemu_real_host_page_size,
+ * @start and @size are expected and restricted to align to it.
+ */
 static int kvm_log_clear_one_slot(KVMSlot *mem, int as_id, uint64_t start,
                                   uint64_t size)
 {
@@ -682,6 +686,9 @@ static int kvm_log_clear_one_slot(KVMSlot *mem, int as_id, uint64_t start,
     unsigned long *bmap_clear = NULL, psize = qemu_real_host_page_size;
     int ret;
 
+    /* Make sure start and size are qemu_real_host_page_size aligned */
+    assert(QEMU_IS_ALIGNED(start | size, psize));
+
     /*
      * We need to extend either the start or the size or both to
      * satisfy the KVM interface requirement.  Firstly, do the start
-- 
2.29.2



