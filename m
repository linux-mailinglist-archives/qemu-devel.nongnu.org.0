Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2015432F984
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Mar 2021 11:58:54 +0100 (CET)
Received: from localhost ([::1]:47546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIUe5-0002sc-5v
	for lists+qemu-devel@lfdr.de; Sat, 06 Mar 2021 05:58:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lIUZq-0005pN-5e
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 05:54:30 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:43680)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lIUZo-00087A-LJ
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 05:54:29 -0500
Received: by mail-wr1-x42f.google.com with SMTP id w11so5193665wrr.10
 for <qemu-devel@nongnu.org>; Sat, 06 Mar 2021 02:54:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1Dyo9JQU4PBoCZozZP36ldGGAENBXiTpRbFQ6rDtUvk=;
 b=cpOA+YsJsCzAiSvbXcQ3q+3l5YLpAWM/VgQEEiULo11YKZs/tFB+8NyCsAwr+4eWHG
 Qy/LT5TcnXad3blGibNwv7qwDuXAK2QltESQIcsM9tsT6+POdHTxwkV9wP7/pe1zXVXP
 dyeEM3Iz4m9079gEBJdjLxX8H+psFNHlI6laFxf/RLgJXNZUVz8JlmAexknIijGLK+jO
 B5MTsZQ+WndtovL7iT9VUXeQScgfyA5dwt8i50ciUC5ZCZNzkh0tCaxx+0uOfOVngdGE
 MwEVfws3hzKbYK8Qxu+/TO2tsaPypZ9a9FoNWSDnnIsT2UjGSARNsxrYP+aw9sUkmuWn
 uqDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=1Dyo9JQU4PBoCZozZP36ldGGAENBXiTpRbFQ6rDtUvk=;
 b=EJt3LxXM3s0XUrBR3zNxOrrP4wECuSuZTSlT+ypCbOG/3nNayc4zI2TBpdXcY/eSR7
 1T08kXBCYgbarASiSEJsswM5reF05Qrxnb+dAHDrn2/OJPdTvrrirIq3hipBIg8xsBZi
 S2fSrhD/gCDsYDKgdTngPqzvH02mmyljoeaoXLUk7wXZSAWjVOvgmPqdIA04EGo+I+yV
 HpEg+ZabNlPubAfLbeL4mn6TbhNzi4szPaaFgaSVb9ov4YufgYGATwHWm6yFXdUeXUO8
 hV6FBzCZCh4I4qEcmZpsLtlIrdt0QylyDJsJOVGqckLmn9Z0f4vI/vOia9bSr552G6MN
 rXFw==
X-Gm-Message-State: AOAM533mDwAe3DTALQRcZrQ91IsYUjeh7uQ2WX7QtmSTVKbwpOP4+1C/
 L+qD9LLT/+svX3jfpCS0eyQtoTjS5xE=
X-Google-Smtp-Source: ABdhPJzgcCptO7X87KvuGLJttZ9iq9mCCfGM/IHaRJP1dYs+jnYk/qF503bmBoroM0fkcJXOZFJYuA==
X-Received: by 2002:adf:8104:: with SMTP id 4mr13681225wrm.265.1615028067437; 
 Sat, 06 Mar 2021 02:54:27 -0800 (PST)
Received: from avogadro.redhat.com ([93.56.170.5])
 by smtp.gmail.com with ESMTPSA id i26sm9326472wmb.18.2021.03.06.02.54.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Mar 2021 02:54:27 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 07/23] accel: kvm: Fix memory waste under mismatch page size
Date: Sat,  6 Mar 2021 11:54:03 +0100
Message-Id: <20210306105419.110503-8-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210306105419.110503-1-pbonzini@redhat.com>
References: <20210306105419.110503-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42f.google.com
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

When handle dirty log, we face qemu_real_host_page_size and
TARGET_PAGE_SIZE. The first one is the granule of KVM dirty
bitmap, and the second one is the granule of QEMU dirty bitmap.

As qemu_real_host_page_size >= TARGET_PAGE_SIZE (kvm_init()
enforced it), misuse TARGET_PAGE_SIZE to init kvmslot dirty_bmap
may waste memory. For example, when qemu_real_host_page_size is
64K and TARGET_PAGE_SIZE is 4K, it wastes 93.75% (15/16) memory.

Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
Reviewed-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
Message-Id: <20201217014941.22872-2-zhukeqian1@huawei.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 accel/kvm/kvm-all.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 84c943fcdb..ffce83f1a7 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -598,8 +598,12 @@ static void kvm_memslot_init_dirty_bitmap(KVMSlot *mem)
      * too, in most cases).
      * So for now, let's align to 64 instead of HOST_LONG_BITS here, in
      * a hope that sizeof(long) won't become >8 any time soon.
+     *
+     * Note: the granule of kvm dirty log is qemu_real_host_page_size.
+     * And mem->memory_size is aligned to it (otherwise this mem can't
+     * be registered to KVM).
      */
-    hwaddr bitmap_size = ALIGN(((mem->memory_size) >> TARGET_PAGE_BITS),
+    hwaddr bitmap_size = ALIGN(mem->memory_size / qemu_real_host_page_size,
                                         /*HOST_LONG_BITS*/ 64) / 8;
     mem->dirty_bmap = g_malloc0(bitmap_size);
 }
-- 
2.29.2



