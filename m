Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 292E75A7E19
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 14:57:06 +0200 (CEST)
Received: from localhost ([::1]:58854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTNHD-0002Nb-To
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 08:57:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1oTNBa-00037u-U0
 for qemu-devel@nongnu.org; Wed, 31 Aug 2022 08:51:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40946)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1oTNBU-0000lD-7e
 for qemu-devel@nongnu.org; Wed, 31 Aug 2022 08:51:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661950265;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CE4fA7BUGFAjvQkmvSK15esjX/ggaaSavOfVyHFuI1A=;
 b=fJ1jXkhPN//ATPyZPTlT82zibb/VZH/aHh4OwXxHx41GujcLO/TbVg0QVyY7IFiAAnNYga
 otUZMnMsN+svmqkksmFb5Q4dRe6ZWVQW+/45zr1HUARvM1NrMaoDTdO9XHlAxBnZTXz5QD
 X+hFXstadKYNIUcWSSQWCh00rKi9jXM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-494-EiYwpVoVO_SVC0RJADLPsg-1; Wed, 31 Aug 2022 08:51:01 -0400
X-MC-Unique: EiYwpVoVO_SVC0RJADLPsg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AD5623825787;
 Wed, 31 Aug 2022 12:51:00 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.195.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6C8B44010D43;
 Wed, 31 Aug 2022 12:51:00 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 2F7D11800623; Wed, 31 Aug 2022 14:50:59 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org, Marcelo Tosatti <mtosatti@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Sergio Lopez <slp@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH 1/2] [hack] reserve bit KVM_HINTS_HOST_PHYS_BITS
Date: Wed, 31 Aug 2022 14:50:58 +0200
Message-Id: <20220831125059.170032-2-kraxel@redhat.com>
In-Reply-To: <20220831125059.170032-1-kraxel@redhat.com>
References: <20220831125059.170032-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

The KVM_HINTS_HOST_PHYS_BITS bit indicates that qemu has host-phys-bits
turned on.  This implies the guest can actually work with the full
available physical address space as advertised by CPUID(0x80000008).

Temporary hack for RfC patch and testing.  This change must actually be
done in the linux kernel, then picked up by qemu via header file sync.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/standard-headers/asm-x86/kvm_para.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/standard-headers/asm-x86/kvm_para.h b/include/standard-headers/asm-x86/kvm_para.h
index f0235e58a1d3..105b958c0f56 100644
--- a/include/standard-headers/asm-x86/kvm_para.h
+++ b/include/standard-headers/asm-x86/kvm_para.h
@@ -37,7 +37,8 @@
 #define KVM_FEATURE_HC_MAP_GPA_RANGE	16
 #define KVM_FEATURE_MIGRATION_CONTROL	17
 
-#define KVM_HINTS_REALTIME      0
+#define KVM_HINTS_REALTIME              0
+#define KVM_HINTS_HOST_PHYS_BITS        1
 
 /* The last 8 bits are used to indicate how to interpret the flags field
  * in pvclock structure. If no bits are set, all flags are ignored.
-- 
2.37.2


