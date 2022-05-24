Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8FA5532D0D
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 17:14:24 +0200 (CEST)
Received: from localhost ([::1]:36280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntWEq-0003iT-2c
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 11:14:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1ntWB9-0008R6-UT
 for qemu-devel@nongnu.org; Tue, 24 May 2022 11:10:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35106)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1ntWB4-00081p-RQ
 for qemu-devel@nongnu.org; Tue, 24 May 2022 11:10:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653405027;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c0+Q8Q2QWyfQUVdjOYB2v7xNZl6MDE6k18lDrgIZPXA=;
 b=db1A6f3O4F/hfREkF3hJAoP8050306nTFZW1yNkipo/4WRl2YONIZgBujj9qRLTo/sd2vz
 ZpdUlRqRxmrsNFpdGWZwpMi+aFqWbRd8JGWovrDPP9lwvcrC/l9qBDvp3yvYQR8rCQ7wIc
 Q4O8dqoNKtaFV+Sp+273JfnRDQmQSds=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-592-1t-qOfJ4OGG3fAr7eIAIaw-1; Tue, 24 May 2022 11:10:24 -0400
X-MC-Unique: 1t-qOfJ4OGG3fAr7eIAIaw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D46BE100BAB1;
 Tue, 24 May 2022 15:10:23 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 07F342166B29;
 Tue, 24 May 2022 15:10:22 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, richard.henderson@linaro.org, f4bug@amsat.org,
 yang.zhong@intel.com
Subject: [PATCH 1/2] x86: cpu: make sure number of addressable IDs for
 processor cores meets the spec
Date: Tue, 24 May 2022 11:10:19 -0400
Message-Id: <20220524151020.2541698-2-imammedo@redhat.com>
In-Reply-To: <20220524151020.2541698-1-imammedo@redhat.com>
References: <20220524151020.2541698-1-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Accourding Intel's CPUID[EAX=04H] resulting bits 31 - 26 in EAX
should be:
"
 **** The nearest power-of-2 integer that is not smaller than (1 + EAX[31:26]) is the number of unique
    Core_IDs reserved for addressing different processor cores in a physical package. Core ID is a subset of
    bits of the initial APIC ID.
"

ensure that values stored in EAX[31-26] always meets this condition.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 target/i386/cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 35c3475e6c..bbe37dce2e 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -5279,7 +5279,7 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
             /* QEMU gives out its own APIC IDs, never pass down bits 31..26.  */
             *eax &= ~0xFC000000;
             if ((*eax & 31) && cs->nr_cores > 1) {
-                *eax |= (cs->nr_cores - 1) << 26;
+                *eax |= (pow2ceil(cs->nr_cores) - 1) << 26;
             }
         } else if (cpu->vendor_cpuid_only && IS_AMD_CPU(env)) {
             *eax = *ebx = *ecx = *edx = 0;
-- 
2.31.1


