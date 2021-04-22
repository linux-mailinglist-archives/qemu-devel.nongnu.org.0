Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFD673684F1
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 18:35:31 +0200 (CEST)
Received: from localhost ([::1]:37932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZcId-0002vE-0u
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 12:35:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1lZbwV-0003ye-AH
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 12:12:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41926)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1lZbwR-0003Jk-Uf
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 12:12:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619107955;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oGNW0CJayKzgK+80SOjMW5J+sS8MxA4DFOyUeJq6Txg=;
 b=P1EyUMlIrfzu63twQxjcY7ZYy4UtBFco68wXxSgVqKifECtMmD23cbOyq8jJno+TcWinNa
 pA3Q7+lttDbOTplfXZxWkGMkM54Ln5z5Dsazm8QPYxetXWKKKCBG5WkHG+OEeP5ohc9Wke
 Sf/OUxHkdHK/0T/sxRrlWlNKvxSEv/k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-174-aEe-Jk8lOiWP_VYWywAtqg-1; Thu, 22 Apr 2021 12:12:02 -0400
X-MC-Unique: aEe-Jk8lOiWP_VYWywAtqg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A3FA6343A8
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 16:12:01 +0000 (UTC)
Received: from vitty.brq.redhat.com (unknown [10.40.194.217])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2F0DE5B4A0;
 Thu, 22 Apr 2021 16:12:00 +0000 (UTC)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 12/19] i386: adjust the expected KVM_GET_SUPPORTED_HV_CPUID
 array size
Date: Thu, 22 Apr 2021 18:11:23 +0200
Message-Id: <20210422161130.652779-13-vkuznets@redhat.com>
In-Reply-To: <20210422161130.652779-1-vkuznets@redhat.com>
References: <20210422161130.652779-1-vkuznets@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vkuznets@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=vkuznets@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Eduardo Habkost <ehabkost@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

SYNDBG leaves were recently (Linux-5.8) added to KVM but we haven't
updated the expected size of KVM_GET_SUPPORTED_HV_CPUID output in
KVM so we now make serveral tries before succeeding. Update the
default.

Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
---
 target/i386/kvm/kvm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index f33ba325187f..feec9f25ba12 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -961,7 +961,8 @@ static struct kvm_cpuid2 *try_get_hv_cpuid(CPUState *cs, int max)
 static struct kvm_cpuid2 *get_supported_hv_cpuid(CPUState *cs)
 {
     struct kvm_cpuid2 *cpuid;
-    int max = 7; /* 0x40000000..0x40000005, 0x4000000A */
+    /* 0x40000000..0x40000005, 0x4000000A, 0x40000080..0x40000080 leaves */
+    int max = 10;
     int i;
 
     /*
-- 
2.30.2


