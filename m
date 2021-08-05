Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1608B3E180A
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 17:31:27 +0200 (CEST)
Received: from localhost ([::1]:44196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBfLC-0005Eb-4B
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 11:31:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mBfIJ-0005zR-3D
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 11:28:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mBfIH-0006EY-OB
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 11:28:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628177305;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o+lE48xeZbOzX+vIawpKHWaJhaZK2kGTCBZxfxZVYEw=;
 b=F0VK6dAzDOHGFNKjitvkXe9R50FNDdxWskMblat5d61qmZW7U6ztAXMxLxsFuSH9Zt5qQ7
 Sh3kvLN3CXQxXwekVkofdEXWN6IOo46CeGUyBzoV7L5yntCiKaurZDZldE2cbp0+yXkMB2
 RuCInuNsorrhPzohS6hPhuDC7Uf1KoY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-558-lMYfk2S_OUWpnLFC8rTeYw-1; Thu, 05 Aug 2021 11:28:22 -0400
X-MC-Unique: lMYfk2S_OUWpnLFC8rTeYw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E549E1084F53;
 Thu,  5 Aug 2021 15:28:20 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.194.118])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5768A27CB1;
 Thu,  5 Aug 2021 15:28:18 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 03/12] s390x/tcg: convert real to absolute address for RRBE,
 SSKE and ISKE
Date: Thu,  5 Aug 2021 17:27:55 +0200
Message-Id: <20210805152804.100333-4-david@redhat.com>
In-Reply-To: <20210805152804.100333-1-david@redhat.com>
References: <20210805152804.100333-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: "Jason J . Herne" <jjherne@linux.ibm.com>, Thomas Huth <thuth@redhat.com>,
 Janosch Frank <frankja@linux.ibm.com>, David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Claudio Imbrenda <imbrenda@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For RRBE, SSKE, and ISKE, we're dealing with real addresses, so we have to
convert to an absolute address first.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 target/s390x/tcg/mem_helper.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/s390x/tcg/mem_helper.c b/target/s390x/tcg/mem_helper.c
index 3c0820dd74..dd506d8d17 100644
--- a/target/s390x/tcg/mem_helper.c
+++ b/target/s390x/tcg/mem_helper.c
@@ -2177,6 +2177,7 @@ uint64_t HELPER(iske)(CPUS390XState *env, uint64_t r2)
     uint64_t addr = wrap_address(env, r2);
     uint8_t key;
 
+    addr = mmu_real2abs(env, addr);
     if (addr > ms->ram_size) {
         return 0;
     }
@@ -2201,6 +2202,7 @@ void HELPER(sske)(CPUS390XState *env, uint64_t r1, uint64_t r2)
     uint64_t addr = wrap_address(env, r2);
     uint8_t key;
 
+    addr = mmu_real2abs(env, addr);
     if (addr > ms->ram_size) {
         return;
     }
@@ -2228,6 +2230,7 @@ uint32_t HELPER(rrbe)(CPUS390XState *env, uint64_t r2)
     static S390SKeysClass *skeyclass;
     uint8_t re, key;
 
+    addr = mmu_real2abs(env, addr);
     if (addr > ms->ram_size) {
         return 0;
     }
-- 
2.31.1


