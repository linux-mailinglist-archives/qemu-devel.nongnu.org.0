Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF812707CB
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Sep 2020 23:08:03 +0200 (CEST)
Received: from localhost ([::1]:53062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kJNbu-0007wz-8q
	for lists+qemu-devel@lfdr.de; Fri, 18 Sep 2020 17:08:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kJNIG-0002f5-Rf
 for qemu-devel@nongnu.org; Fri, 18 Sep 2020 16:47:44 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:21280
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kJNI2-0006Hy-9h
 for qemu-devel@nongnu.org; Fri, 18 Sep 2020 16:47:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600462049;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yldcnY4aWcVFPppdh4LG4wtGDDsB8bzuisIy+OR1aPU=;
 b=ZCETUcbdWPvoIyoXwdD4j683EsJHwXqFgUta5V7x/UVV8rMkFYZEOnBv1uv1NAlUBThXwI
 DsxKU8nIBugFTRN3g0Y75gmJrYEX4TZCbnGg8/mwUuFKLBrmddy3KvoiaNzEfN8Pgu0Z0E
 boFQ1pnCsT2xSK135qodrZXjaoujQis=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-516-2U6ReEBqNRSIFrYjz5GEeQ-1; Fri, 18 Sep 2020 16:47:27 -0400
X-MC-Unique: 2U6ReEBqNRSIFrYjz5GEeQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3483B100831D;
 Fri, 18 Sep 2020 20:47:26 +0000 (UTC)
Received: from localhost (unknown [10.10.67.5])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A3C6568D64;
 Fri, 18 Sep 2020 20:47:25 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 10/17] target/ppc: Set instance_align on PowerPCCPU TypeInfo
Date: Fri, 18 Sep 2020 16:47:07 -0400
Message-Id: <20200918204714.27276-11-ehabkost@redhat.com>
In-Reply-To: <20200918204714.27276-1-ehabkost@redhat.com>
References: <20200918204714.27276-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/18 16:47:22
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.999,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Fix alignment of CPUPPCState.vsr.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Acked-by: David Gibson <david@gibson.dropbear.id.au>
Message-Id: <20200916004638.2444147-5-richard.henderson@linaro.org>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 target/ppc/translate_init.c.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/ppc/translate_init.c.inc b/target/ppc/translate_init.c.inc
index 230a062d29..accb4f2fae 100644
--- a/target/ppc/translate_init.c.inc
+++ b/target/ppc/translate_init.c.inc
@@ -10960,6 +10960,7 @@ static const TypeInfo ppc_cpu_type_info = {
     .name = TYPE_POWERPC_CPU,
     .parent = TYPE_CPU,
     .instance_size = sizeof(PowerPCCPU),
+    .instance_align = __alignof__(PowerPCCPU),
     .instance_init = ppc_cpu_instance_init,
     .instance_finalize = ppc_cpu_instance_finalize,
     .abstract = true,
-- 
2.26.2


