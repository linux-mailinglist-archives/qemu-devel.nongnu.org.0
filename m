Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF7F3979E9
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 20:18:18 +0200 (CEST)
Received: from localhost ([::1]:34552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo8y1-0003md-4i
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 14:18:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lo8qT-00025r-R0
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 14:10:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46844)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lo8qO-0005bj-D1
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 14:10:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622571023;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GSDGbMJlnIeZClqyLIE18K/JOLIC2BNq7T+N2XkvkYI=;
 b=dYvcC8croGNmIXeVQYIHuthdUAdTZy7rM/xGQHSF+jJSVYONBfcoSijWXjhEwdCx6g0Af2
 K/QGVekZkr0iDibAIMs57FtZPuV0RVFmQ4WZnoVe/UJfQyQfhfo28FFgqGSCJOXChBRRSi
 wSti/X6HSAxEd+N4Ql6KP7SblRfXfc8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-462-h1pngC27Miee3vt7eBg28w-1; Tue, 01 Jun 2021 14:10:21 -0400
X-MC-Unique: h1pngC27Miee3vt7eBg28w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EACED195D566;
 Tue,  1 Jun 2021 18:10:20 +0000 (UTC)
Received: from localhost (ovpn-112-239.rdu2.redhat.com [10.10.112.239])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B95775C1BB;
 Tue,  1 Jun 2021 18:10:20 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 07/24] i386: use better matching family/model/stepping for
 'max' CPU
Date: Tue,  1 Jun 2021 14:09:57 -0400
Message-Id: <20210601181014.2568861-8-ehabkost@redhat.com>
In-Reply-To: <20210601181014.2568861-1-ehabkost@redhat.com>
References: <20210601181014.2568861-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel P. Berrangé <berrange@redhat.com>

The 'max' CPU under TCG currently reports a family/model/stepping that
approximately corresponds to an AMD K7 vintage architecture.
The K7 series predates the introduction of 64-bit support by AMD
in the K8 series. This has been reported to lead to LLVM complaints
about generating 64-bit code for a 32-bit CPU target

  LLVM ERROR: 64-bit code requested on a subtarget that doesn't support it!

It appears LLVM looks at the family/model/stepping, despite qemu64
reporting it is 64-bit capable.

This patch changes 'max' to report a CPUID with the family, model
and stepping taken from a

 AMD Athlon(tm) 64 X2 Dual Core Processor 4000+

which is one of the first 64-bit AMD CPUs.

Closes https://gitlab.com/qemu-project/qemu/-/issues/191

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20210507133650.645526-3-berrange@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 target/i386/cpu.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 078ec905522..d150378c400 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -4285,9 +4285,15 @@ static void max_x86_cpu_initfn(Object *obj)
      */
     object_property_set_str(OBJECT(cpu), "vendor", CPUID_VENDOR_AMD,
                             &error_abort);
+#ifdef TARGET_X86_64
+    object_property_set_int(OBJECT(cpu), "family", 15, &error_abort);
+    object_property_set_int(OBJECT(cpu), "model", 107, &error_abort);
+    object_property_set_int(OBJECT(cpu), "stepping", 1, &error_abort);
+#else
     object_property_set_int(OBJECT(cpu), "family", 6, &error_abort);
     object_property_set_int(OBJECT(cpu), "model", 6, &error_abort);
     object_property_set_int(OBJECT(cpu), "stepping", 3, &error_abort);
+#endif
     object_property_set_str(OBJECT(cpu), "model-id",
                             "QEMU TCG CPU version " QEMU_HW_VERSION,
                             &error_abort);
-- 
2.30.2


