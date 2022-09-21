Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B10CD5C0456
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 18:37:46 +0200 (CEST)
Received: from localhost ([::1]:53344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ob2jJ-0000xp-HB
	for lists+qemu-devel@lfdr.de; Wed, 21 Sep 2022 12:37:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1ob2Kz-0002z0-Ej
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 12:12:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38082)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1ob2Kv-0001F4-PU
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 12:12:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663776752;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=kyYFerlLKWf+eSQUgf9DyqGMgbmIhxiql0vE/9q9P34=;
 b=i7sVSVfao20oXFl4nCVn2za+0nyCUXn7vwrcYwpejGu5aogz9u/4a2uD06y8HhiyvX1Z/f
 g9yKrHc31x9+1EmRrIeRc+eo7wqSm7LpCu/7cnrKthMpJz53PG+YMnOisxGujeSz4sA6Ta
 I9ui+/FIDkp/Yr6tpGCHl2N0nkSlXvs=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-172-HouGPgkANSyIFSGL9ST37g-1; Wed, 21 Sep 2022 12:12:30 -0400
X-MC-Unique: HouGPgkANSyIFSGL9ST37g-1
Received: by mail-qt1-f197.google.com with SMTP id
 h7-20020ac85047000000b0035a6794699bso4483868qtm.3
 for <qemu-devel@nongnu.org>; Wed, 21 Sep 2022 09:12:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=kyYFerlLKWf+eSQUgf9DyqGMgbmIhxiql0vE/9q9P34=;
 b=uNjxDcdl+y9G0pLX7bqe0+oHtXNJyHroiJ1hyUwlG20kBANtDBXTIaxH0R9AlUMTK5
 hJ7lcnNQcKlyZe2jbQU+AM/yRookdXCUZcE9ywv6cpBmXH+ep8oZgCiYCi5TnBBUAFj7
 UXPvZEoD6fSZv6Mnu63UrFxz84XgEdYp3AmKOBn86eFUOdIpBqpSh8rsOmWl4bHOEhiR
 IWZ5gdIzthC67vMQtrVXFi1ZF6HZwZgjKsJky5rfHlQ7mYMZlXk1GnQJJBGwnlbaSXzO
 tYr9Yyuwl8CGsrCRu5y9HQ/en+oEeibShD6uOuqNEPVHNahz7qLHs0pED5b+1f0B5Ca3
 7GrQ==
X-Gm-Message-State: ACrzQf1VhN2amGnHL8ruFK/1iE6NzSGPU3/Pi6E7nUVGq22R6TLx6Bww
 nJj/smFqFC6vSWzLUpG9k4KpHEa3xiKOuBTYzc9+fZG0J8RTrCoT6DYdO8xeKRexQvqwrc1LtW5
 91UqjRzRX9V58Yv3lptM5lTI8HShXMiTOAec07LdpoNTpK/QFBrxnuq4kgonNipbZ
X-Received: by 2002:ac8:594b:0:b0:35c:d0b7:e2f9 with SMTP id
 11-20020ac8594b000000b0035cd0b7e2f9mr21754827qtz.483.1663776749842; 
 Wed, 21 Sep 2022 09:12:29 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM69y/k5H1irHxgTghRfUrPjppe4vGVe8tStJFEdusU/UfOrrosoKRcI76BM0bwmK7Xvp8EXrA==
X-Received: by 2002:ac8:594b:0:b0:35c:d0b7:e2f9 with SMTP id
 11-20020ac8594b000000b0035cd0b7e2f9mr21754800qtz.483.1663776749560; 
 Wed, 21 Sep 2022 09:12:29 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca. [70.31.27.79])
 by smtp.gmail.com with ESMTPSA id
 e24-20020ac84918000000b003445d06a622sm1821407qtq.86.2022.09.21.09.12.28
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 21 Sep 2022 09:12:29 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: Jason Wang <jasowang@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, peterx@redhat.com,
 Igor Mammedov <imammedo@redhat.com>, David Woodhouse <dwmw2@infradead.org>,
 Claudio Fontana <cfontana@suse.de>
Subject: [PATCH] Revert "intel_iommu: Fix irqchip / X2APIC configuration
 checks"
Date: Wed, 21 Sep 2022 12:12:27 -0400
Message-Id: <20220921161227.57259-1-peterx@redhat.com>
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

It's true that when vcpus<=255 we don't require the length of 32bit APIC
IDs.  However here since we already have EIM=ON it means the hypervisor
will declare the VM as x2apic supported (e.g. VT-d ECAP register will have
EIM bit 4 set), so the guest should assume the APIC IDs are 32bits width
even if vcpus<=255.  In short, commit 77250171bdc breaks any simple cmdline
that wants to boot a VM with >=9 but <=255 vcpus with:

  -device intel-iommu,intremap=on

For anyone who does not want to enable x2apic, we can use eim=off in the
intel-iommu parameters to skip enabling KVM x2apic.

This partly reverts commit 77250171bdc02aee106083fd2a068147befa1a38, while
keeping the valid bit on checking split irqchip, but revert the other change.

Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Claudio Fontana <cfontana@suse.de>
Cc: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 hw/i386/intel_iommu.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
index 05d53a1aa9..6524c2ee32 100644
--- a/hw/i386/intel_iommu.c
+++ b/hw/i386/intel_iommu.c
@@ -3818,6 +3818,11 @@ static bool vtd_decide_config(IntelIOMMUState *s, Error **errp)
             error_setg(errp, "eim=on requires accel=kvm,kernel-irqchip=split");
             return false;
         }
+        if (!kvm_enable_x2apic()) {
+            error_setg(errp, "eim=on requires support on the KVM side"
+                             "(X2APIC_API, first shipped in v4.7)");
+            return false;
+        }
     }
 
     /* Currently only address widths supported are 39 and 48 bits */
-- 
2.32.0


