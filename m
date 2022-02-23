Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 958404C1215
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 13:00:59 +0100 (CET)
Received: from localhost ([::1]:47532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMqKI-0004XO-K0
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 07:00:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1nMqHx-0003lQ-MZ
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 06:58:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51204)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1nMqHv-00075h-Sq
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 06:58:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645617511;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=wQ3b/OqmX7k5uUOnPAbqMVD8iX83XPV9Sh9vTgh3MDw=;
 b=ZuFWi51aBnIEDga6gEbE/F69EkfWSfGcW1PG/n6JWe1UfgjCez9JNNp1wXp0QY68fpcn2s
 R2X2LV6fscdww3KfbSU+kj0k4uzSfXIG2fEbsHIbPAjZU7nD2NouPpRnusdDX54o0TrHhZ
 mLMCYzNoG24rU7kR6otU38ggEBa2j98=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-371-LmdPGS0vNeGZi15rI9yNlA-1; Wed, 23 Feb 2022 06:58:29 -0500
X-MC-Unique: LmdPGS0vNeGZi15rI9yNlA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E6059501E1
 for <qemu-devel@nongnu.org>; Wed, 23 Feb 2022 11:58:28 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.40.195.190])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4000A2AAB5;
 Wed, 23 Feb 2022 11:58:25 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] KVM: SVM: always set MSR_AMD64_TSC_RATIO to default value
Date: Wed, 23 Feb 2022 13:58:24 +0200
Message-Id: <20220223115824.319821-1-mlevitsk@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlevitsk@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mlevitsk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Maxim Levitsky <mlevitsk@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Even when the feature is not supported in guest CPUID,
still set the msr to the default value which will
be the only value KVM will accept in this case

Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
---
 target/i386/cpu.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 6c7ef1099b..3475e9fa46 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -5930,9 +5930,7 @@ static void x86_cpu_reset(DeviceState *dev)
 
     x86_cpu_set_sgxlepubkeyhash(env);
 
-    if (env->features[FEAT_SVM] & CPUID_SVM_TSCSCALE) {
-        env->amd_tsc_scale_msr =  MSR_AMD64_TSC_RATIO_DEFAULT;
-    }
+    env->amd_tsc_scale_msr =  MSR_AMD64_TSC_RATIO_DEFAULT;
 
 #endif
 }
-- 
2.26.3


