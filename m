Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29B2B5E6E73
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 23:37:06 +0200 (CEST)
Received: from localhost ([::1]:47540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obTsW-0000ie-QR
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 17:37:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1obTr2-0007gO-1n
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 17:35:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42441)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1obTqy-00046r-QA
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 17:35:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663882527;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=YZFOk4NIJg3hsU/+pc0pw+0lzx8dVPUm5b5PkVv3ets=;
 b=dR9prmHJMHzxry6yTSxjK2MH2d8r9+8Vzveq9pM4RGzGuSALnVGIs6I/zv9tKGpYDGLP8S
 tzkEGYNOEeFRpuN/wbsgux84K3auIHyt0CzDvfQ0zIiVnm14Y4cN9pGGuWaneolLeDURfN
 lAZ6FM6BMcMlIesZ6G0mzCWhcszhLw8=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-50-V7FsLVfbP4WYQeEIXodRpw-1; Thu, 22 Sep 2022 17:35:26 -0400
X-MC-Unique: V7FsLVfbP4WYQeEIXodRpw-1
Received: by mail-qv1-f69.google.com with SMTP id
 om32-20020a0562143da000b004ad858a5458so1648173qvb.22
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 14:35:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=YZFOk4NIJg3hsU/+pc0pw+0lzx8dVPUm5b5PkVv3ets=;
 b=wQS+v8D79aa2dJkg+e8SaEl3L5lW1xD+mFhvbHSa2Su6iA3/h8KrKuejEpeNn4mEhI
 halSp9u3XF9CJTdogvH6ydRn5hDs7H8mlgBs8Jr8SuWQt7HNEBCtnJZ+xvahqRH6+1qp
 8ze++520Smcz/h1SdNZfaxng4oKh2YNGm5gOUB2TkAwNp+dO8tJeYHiQFP1vomb5UlZf
 ZQj1ekzrlsWEAqLrXwhwkLleMk3aZPxLxuZ1PoC8udniCU7yND+MLNccWMFLjA1N8ad1
 vKMScSTb+M5DAWBLpyeUmk2ojEC5Zokw2pud+nKHlKd2ndsVfenByJDHL4cff7RwLWfU
 5JjA==
X-Gm-Message-State: ACrzQf0UgNJvz0vykMFKqugG+Echclprpl6uJEOD/h0ABtkZ2BDymG9m
 Tj05aO3YlFakAjkpw6/4Qsuhw+/B9TjOoZCgyrqysMUeHSeKn91IKZsDBMtozy+SGSMn61hR5OG
 jOIZqvA16NQNfOq1yLum77fvi0HPrfXGHXOpC7DJCpS0/xCPihS+z35y3SoVvLy77
X-Received: by 2002:ac8:4e90:0:b0:35d:4c5:7e4e with SMTP id
 16-20020ac84e90000000b0035d04c57e4emr4590684qtp.117.1663882524739; 
 Thu, 22 Sep 2022 14:35:24 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4v2gv7fdkSbB7tvzIY9iuFTg4xn9XcDgpAQTlUshbFB/hWD+/S6kscKDCPE+sX/ErArDeXEA==
X-Received: by 2002:ac8:4e90:0:b0:35d:4c5:7e4e with SMTP id
 16-20020ac84e90000000b0035d04c57e4emr4590665qtp.117.1663882524491; 
 Thu, 22 Sep 2022 14:35:24 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca. [70.31.27.79])
 by smtp.gmail.com with ESMTPSA id
 s2-20020a05620a0bc200b006ce7d9dea7asm4431421qki.13.2022.09.22.14.35.22
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 22 Sep 2022 14:35:23 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: peterx@redhat.com, Marc Zyngier <maz@kernel.org>,
 Gavin Shan <gshan@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH] KVM: dirty ring: Add memory barrier when marking pfn collected
Date: Thu, 22 Sep 2022 17:35:22 -0400
Message-Id: <20220922213522.68861-1-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

Following commit 4802bf910eee9, add the other missing barrier when marking
the PFN as collected.  This will also be required just like 4802bf910eee9
on weak ordering architectures like aarch64.

Cc: Marc Zyngier <maz@kernel.org>
Cc: Gavin Shan <gshan@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 accel/kvm/kvm-all.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 136c8eaed3..60a044048e 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -728,7 +728,11 @@ static bool dirty_gfn_is_dirtied(struct kvm_dirty_gfn *gfn)
 
 static void dirty_gfn_set_collected(struct kvm_dirty_gfn *gfn)
 {
-    gfn->flags = KVM_DIRTY_GFN_F_RESET;
+    /*
+     * Write the flags after reading the entry.  Should pair with another
+     * smp_load_acquire() in KVM when reset dirty rings.
+     */
+    qatomic_store_release(&gfn->flags, KVM_DIRTY_GFN_F_RESET);
 }
 
 /*
-- 
2.32.0


