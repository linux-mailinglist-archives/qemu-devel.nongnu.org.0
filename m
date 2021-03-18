Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B8E34086B
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 16:07:32 +0100 (CET)
Received: from localhost ([::1]:33000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMuFH-0001KN-9n
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 11:07:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lMu8s-0005fV-JE
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 11:00:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24818)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lMu8q-0005eo-Fm
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 11:00:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616079651;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gF8shkL9d4p69aJ98TkRkFFQDtlC4V3fo6jb0Wtc7Xk=;
 b=VWRvE9L5zGjCKdzSPt8xr2Gbc7O3Y1V0CjeK5AqN9kleBFm8HmOA82fAKA72kHFa42RG7m
 bf7di2Q2UfNk9uFm+VdjvmRG9u8sK9FaaWQ7Kb4fz57fU8GmpyXBPnkM/ilsbpVa+IXSGU
 NC9lmwQuUmilrW75CLlUsuS53H85My8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-234-ciz0YISWMOC19ODtD51cew-1; Thu, 18 Mar 2021 11:00:49 -0400
X-MC-Unique: ciz0YISWMOC19ODtD51cew-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CCF3D8CD8CE
 for <qemu-devel@nongnu.org>; Thu, 18 Mar 2021 15:00:24 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8D3DC71928
 for <qemu-devel@nongnu.org>; Thu, 18 Mar 2021 15:00:24 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/3] target/i386: fail if toggling LA57 in 64-bit mode
Date: Thu, 18 Mar 2021 11:00:21 -0400
Message-Id: <20210318150022.1824646-3-pbonzini@redhat.com>
In-Reply-To: <20210318150022.1824646-1-pbonzini@redhat.com>
References: <20210318150022.1824646-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This fixes kvm-unit-tests access.flat with -cpu qemu64,la57.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/misc_helper.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/i386/tcg/misc_helper.c b/target/i386/tcg/misc_helper.c
index 90b87fdef0..a25428c36e 100644
--- a/target/i386/tcg/misc_helper.c
+++ b/target/i386/tcg/misc_helper.c
@@ -167,6 +167,10 @@ void helper_write_crN(CPUX86State *env, int reg, target_ulong t0)
         cpu_x86_update_cr3(env, t0);
         break;
     case 4:
+        if (((t0 ^ env->cr[4]) & CR4_LA57_MASK) &&
+            (env->hflags & HF_CS64_MASK)) {
+             raise_exception_ra(env, EXCP0D_GPF, GETPC());
+        }
         cpu_x86_update_cr4(env, t0);
         break;
     case 8:
-- 
2.26.2



