Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A58094433A4
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 17:48:07 +0100 (CET)
Received: from localhost ([::1]:52726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhwxC-0000ea-Qa
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 12:48:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mhwuj-0006cJ-4B
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 12:45:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50485)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mhwuf-0004kE-Ct
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 12:45:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635871528;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CUuuhPL5KFcopdQnu9YE/238JYVStIpO5jZyc0Qk120=;
 b=Axavd26vIPFhCbIrCfesqiZKuIbwHt7Upy1CYVBeB5fWBiZVtjugoOiJNmuFI8PJhvjFbZ
 /Re7/tXQ6mJPX2N54G2PBXRz1EQvrqcDt7iq1xfqUNow/FO0Mnaiw7sUG53LoFsibWPYIU
 S6DCYupylBOT/o2DO4M6pvKl+p85HWE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-165-vY6I6zfWMwGKeibrhrNgrQ-1; Tue, 02 Nov 2021 12:45:25 -0400
X-MC-Unique: vY6I6zfWMwGKeibrhrNgrQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3A9E71006AA7;
 Tue,  2 Nov 2021 16:45:24 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.193.156])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 02DA8100EA05;
 Tue,  2 Nov 2021 16:44:02 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/3] machine: Use host_memory_backend_is_mapped() in
 machine_consume_memdev()
Date: Tue,  2 Nov 2021 17:43:15 +0100
Message-Id: <20211102164317.45658-2-david@redhat.com>
In-Reply-To: <20211102164317.45658-1-david@redhat.com>
References: <20211102164317.45658-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Peter Xu <peterx@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

memory_region_is_mapped() is the wrong check, we actually want to check
whether the backend is already marked mapped.

For example, memory regions mapped via an alias, such as NVDIMMs,
currently don't make memory_region_is_mapped() return "true". As the
machine is initialized before any memory devices (and thereby before
NVDIMMs are initialized), this isn't a fix but merely a cleanup.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 hw/core/machine.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index e24e3e27db..57c82e9473 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -1081,7 +1081,7 @@ MemoryRegion *machine_consume_memdev(MachineState *machine,
 {
     MemoryRegion *ret = host_memory_backend_get_memory(backend);
 
-    if (memory_region_is_mapped(ret)) {
+    if (host_memory_backend_is_mapped(backend)) {
         error_report("memory backend %s can't be used multiple times.",
                      object_get_canonical_path_component(OBJECT(backend)));
         exit(EXIT_FAILURE);
-- 
2.31.1


