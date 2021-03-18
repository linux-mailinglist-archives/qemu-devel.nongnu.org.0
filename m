Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C33D4340A3A
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 17:30:35 +0100 (CET)
Received: from localhost ([::1]:45050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMvXe-0002Nz-Nf
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 12:30:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1lMv7D-00011n-HR
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 12:03:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:41302)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1lMv72-0001ro-19
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 12:03:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616083382;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ngtOnVU+GhSzlj0jTb7UiISDcSbEbghcvax8X9l6Rrs=;
 b=H3MK4jh3uk/ZpMqjYoNXKlRf+3z5XjSldsstCttRaeFRHyqTZyMwVo9RPa6VrOJ3HegjEY
 MEKBaxb+N210kx1JQ3TXTJ9if/UW72EoKPrF4/SauBiXirqWDIhh0RoiT7s/qPihlVxYrl
 A488kqVDV2g5OU3U/7rVoo/F0W3DFf4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-556-oV69FEMGMZexhBHFCTlEUA-1; Thu, 18 Mar 2021 12:02:58 -0400
X-MC-Unique: oV69FEMGMZexhBHFCTlEUA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 554FC18C8C05;
 Thu, 18 Mar 2021 16:02:57 +0000 (UTC)
Received: from vitty.brq.redhat.com (unknown [10.40.194.127])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 55B2810023B0;
 Thu, 18 Mar 2021 16:02:55 +0000 (UTC)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/3] i386: Make Hyper-V related sections KVM only
Date: Thu, 18 Mar 2021 17:02:47 +0100
Message-Id: <20210318160249.1084178-2-vkuznets@redhat.com>
In-Reply-To: <20210318160249.1084178-1-vkuznets@redhat.com>
References: <20210318160249.1084178-1-vkuznets@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vkuznets@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=vkuznets@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently, Hyper-V enlightenments are only implemented by KVM so there's no
need to have corresponding vmstate_x86_cpu sections when !CONFIG_KVM.

Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
---
 target/i386/machine.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/i386/machine.c b/target/i386/machine.c
index 3967dfc25763..a4777a73b0a9 100644
--- a/target/i386/machine.c
+++ b/target/i386/machine.c
@@ -697,6 +697,7 @@ static const VMStateDescription vmstate_mpx = {
     }
 };
 
+#ifdef CONFIG_KVM
 static bool hyperv_hypercall_enable_needed(void *opaque)
 {
     X86CPU *cpu = opaque;
@@ -895,6 +896,7 @@ static const VMStateDescription vmstate_msr_hyperv_reenlightenment = {
         VMSTATE_END_OF_LIST()
     }
 };
+#endif
 
 static bool avx512_needed(void *opaque)
 {
@@ -1484,6 +1486,7 @@ VMStateDescription vmstate_x86_cpu = {
         &vmstate_msr_ia32_feature_control,
         &vmstate_msr_architectural_pmu,
         &vmstate_mpx,
+#ifdef CONFIG_KVM
         &vmstate_msr_hypercall_hypercall,
         &vmstate_msr_hyperv_vapic,
         &vmstate_msr_hyperv_time,
@@ -1492,6 +1495,7 @@ VMStateDescription vmstate_x86_cpu = {
         &vmstate_msr_hyperv_synic,
         &vmstate_msr_hyperv_stimer,
         &vmstate_msr_hyperv_reenlightenment,
+#endif
         &vmstate_avx512,
         &vmstate_xss,
         &vmstate_umwait,
-- 
2.30.2


