Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D6C3015E6
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Jan 2021 15:34:02 +0100 (CET)
Received: from localhost ([::1]:55750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3JzF-0005Ku-Dw
	for lists+qemu-devel@lfdr.de; Sat, 23 Jan 2021 09:34:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l3Jx7-0003Tp-Bf
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 09:31:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29852)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l3Jwt-0005n5-FW
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 09:31:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611412294;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gAmQwhlSgGC3nvJeBVzdxf82+bKzyQU76t5EI0xvwT8=;
 b=KJf753jsdM/qEfbK8fJtq42fNq4L1handxPMs+2WNVXzhjLEXIYVb9+u68eNbIwYbWRo6g
 IqcWSSp/XyHL8ovaVVNoqWeO/M9J3d5dQU3aBdtOma3cTnhGUGOLJO+6LwEnvRV1Wos+Bf
 JliU457SblvcyyvLBuWYZ3Vrt9fWogQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-169-bzFm-jzaPNOSX0fqB9vjOA-1; Sat, 23 Jan 2021 09:31:31 -0500
X-MC-Unique: bzFm-jzaPNOSX0fqB9vjOA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D26298018A3;
 Sat, 23 Jan 2021 14:31:30 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4D70B5D9CC;
 Sat, 23 Jan 2021 14:31:30 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 03/31] x86/cpu: Use max host physical address if -cpu max
 option is applied
Date: Sat, 23 Jan 2021 09:31:00 -0500
Message-Id: <20210123143128.1167797-4-pbonzini@redhat.com>
In-Reply-To: <20210123143128.1167797-1-pbonzini@redhat.com>
References: <20210123143128.1167797-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.165,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Yang Weijiang <weijiang.yang@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Yang Weijiang <weijiang.yang@intel.com>

QEMU option -cpu max(max_features) means "Enables all features supported by
the accelerator in the current host", this looks true for all the features
except guest max physical address width, so add this patch to enable it.

Signed-off-by: Yang Weijiang <weijiang.yang@intel.com>
Message-Id: <20210113090430.26394-1-weijiang.yang@intel.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/cpu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 35459a38bb..72a79e6019 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -4319,6 +4319,7 @@ static void max_x86_cpu_initfn(Object *obj)
         if (lmce_supported()) {
             object_property_set_bool(OBJECT(cpu), "lmce", true, &error_abort);
         }
+        object_property_set_bool(OBJECT(cpu), "host-phys-bits", true, &error_abort);
     } else {
         object_property_set_str(OBJECT(cpu), "vendor", CPUID_VENDOR_AMD,
                                 &error_abort);
-- 
2.26.2



