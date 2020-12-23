Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A922E2208
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Dec 2020 22:29:08 +0100 (CET)
Received: from localhost ([::1]:59814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ksBgx-0003e8-Um
	for lists+qemu-devel@lfdr.de; Wed, 23 Dec 2020 16:29:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1ksBff-000259-2i
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 16:27:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30535)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1ksBfd-0004My-Iy
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 16:27:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608758865;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xPfFA/rWB2afyMM83obqm4z0i1w3En0YuRCz2b/3btU=;
 b=My7pUDYJ/WBMdga3uwGWGiXuGER8lH480ccWxsuxRcC03RAp+iEfkv6oOPhbkxs0tsa7Lj
 07wb+y5aKZuB8XHMKSVH2trZcGGpO2k65Hgzb4IlJt8o7IBHnhz4Ok3jXj97pU4y9ZJwf+
 3l7gb72ynQxA29PEYt/1+s95vimwq9M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-577-2Gyxhg_cNZewgNgHug53lA-1; Wed, 23 Dec 2020 16:27:43 -0500
X-MC-Unique: 2Gyxhg_cNZewgNgHug53lA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D12271005513;
 Wed, 23 Dec 2020 21:27:41 +0000 (UTC)
Received: from localhost (ovpn-113-96.rdu2.redhat.com [10.10.113.96])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 96FA65F9B8;
 Wed, 23 Dec 2020 21:27:41 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 03/15] sparc: Use DEFINE_PROP for nwindows property
Date: Wed, 23 Dec 2020 16:27:23 -0500
Message-Id: <20201223212735.512062-4-ehabkost@redhat.com>
In-Reply-To: <20201223212735.512062-1-ehabkost@redhat.com>
References: <20201223212735.512062-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use the DEFINE_PROP macro (which will set extra fields in the
struct) instead of initializing a Property struct manually.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Acked-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-Id: <20201211220529.2290218-18-ehabkost@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 target/sparc/cpu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/sparc/cpu.c b/target/sparc/cpu.c
index 6a3299041f..a1dc0f1be4 100644
--- a/target/sparc/cpu.c
+++ b/target/sparc/cpu.c
@@ -848,7 +848,8 @@ static Property sparc_cpu_properties[] = {
                          qdev_prop_uint64, target_ulong),
     DEFINE_PROP_UINT32("fpu-version", SPARCCPU, env.def.fpu_version, 0),
     DEFINE_PROP_UINT32("mmu-version", SPARCCPU, env.def.mmu_version, 0),
-    { .name  = "nwindows", .info  = &qdev_prop_nwindows },
+    DEFINE_PROP("nwindows", SPARCCPU, env.def.nwindows,
+                qdev_prop_nwindows, uint32_t),
     DEFINE_PROP_END_OF_LIST()
 };
 
-- 
2.28.0


