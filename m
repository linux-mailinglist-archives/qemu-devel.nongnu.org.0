Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A20A7429609
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Oct 2021 19:47:28 +0200 (CEST)
Received: from localhost ([::1]:44986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZzOZ-0006kC-GL
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 13:47:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mZzMs-0005I2-5o
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 13:45:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32171)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mZzMj-0001QL-MK
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 13:45:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633974332;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2C6ZPQ/IUloN0BLppwVSOFa1qzaeGoIE0ME10GKv/1o=;
 b=IJTvB6xiPqAtq98Tk5kUNvhsxLcpDKyvlyHUwyUn6CnNwbib8pLrCqsGnRm8hy77cHh1vd
 jcVX5DoU0cx2A0AzjY5FBG8NfMnbyjmxACnyMTbN0kseSIjRw5BwkCDL9UGMJTl0opYeJF
 chqej4geK+DXi636GXfk23Y2fgMnhVM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-367-JTphlqWzMSGFoRl7OjXwzw-1; Mon, 11 Oct 2021 13:45:29 -0400
X-MC-Unique: JTphlqWzMSGFoRl7OjXwzw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4BB6D100C67B;
 Mon, 11 Oct 2021 17:45:28 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.192.99])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BD688ADCF;
 Mon, 11 Oct 2021 17:45:25 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 1/2] machine: Use host_memory_backend_is_mapped() in
 machine_consume_memdev()
Date: Mon, 11 Oct 2021 19:45:20 +0200
Message-Id: <20211011174522.14351-2-david@redhat.com>
In-Reply-To: <20211011174522.14351-1-david@redhat.com>
References: <20211011174522.14351-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Peter Xu <peterx@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

memory_region_is_mapped() is the wrong check, we actually want to check
whether the backend is already marked mapped.

For example, memory regions mapped via an alias, such as NVDIMMs,
currently don't make memory_region_is_mapped() return "true". As the
machine is initialized before any memory devices (and thereby before
NVDIMMs are initialized), this isn't a fix but merely a cleanup.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 hw/core/machine.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index b8d95eec32..a1db865939 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -1260,7 +1260,7 @@ MemoryRegion *machine_consume_memdev(MachineState *machine,
 {
     MemoryRegion *ret = host_memory_backend_get_memory(backend);
 
-    if (memory_region_is_mapped(ret)) {
+    if (host_memory_backend_is_mapped(backend)) {
         error_report("memory backend %s can't be used multiple times.",
                      object_get_canonical_path_component(OBJECT(backend)));
         exit(EXIT_FAILURE);
-- 
2.31.1


