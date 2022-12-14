Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A36AE64C6DD
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Dec 2022 11:11:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5OiC-0007jD-L3; Wed, 14 Dec 2022 05:10:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p5Ohw-0007dt-67
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 05:09:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p5Ohr-00016o-51
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 05:09:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671012564;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ypgFWqhE2J3xK3+MXb0eHLmjlDQ/avUfb48tdBuEKYw=;
 b=CfCMg31yx7W+krRwYax6ZKBUY+ddmLoOfmiyP8PNNcumRrbHbn6U5UesRTdyAuttbk2pkY
 9EF2ef48QLU4GdsJULuF5skf6VML014y3ZvOY7Ee1JJVkuj1O9j0qlpLvi8L0CmSQIYQwJ
 Ax8RjhDzLnBTZUzU+IAVCXWL2uvwHOY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-76-V4Z2OEvMORih0rrWFfu50g-1; Wed, 14 Dec 2022 05:09:23 -0500
X-MC-Unique: V4Z2OEvMORih0rrWFfu50g-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4789B181E3EE;
 Wed, 14 Dec 2022 10:09:23 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 44956492C14;
 Wed, 14 Dec 2022 10:09:22 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-devel@nongnu.org
Cc: Nina Schoetterl-Glausch <nsg@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>
Subject: [PULL 04/23] target/s390x/tcg/mem_helper: Test the right bits in
 psw_key_valid()
Date: Wed, 14 Dec 2022 11:08:52 +0100
Message-Id: <20221214100911.165291-5-thuth@redhat.com>
In-Reply-To: <20221214100911.165291-1-thuth@redhat.com>
References: <20221214100911.165291-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The PSW key mask is a 16 bit field, and the psw_key variable is
in the range from 0 to 15, so it does not make sense to use
"0x80 >> psw_key" for testing the bits here. We should use 0x8000
instead.

Message-Id: <20221205142043.95185-1-thuth@redhat.com>
Reviewed-by: Nina Schoetterl-Glausch <nsg@linux.ibm.com>
Reviewed-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 target/s390x/tcg/mem_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/s390x/tcg/mem_helper.c b/target/s390x/tcg/mem_helper.c
index 3758b9e688..006b6798a7 100644
--- a/target/s390x/tcg/mem_helper.c
+++ b/target/s390x/tcg/mem_helper.c
@@ -51,7 +51,7 @@ static inline bool psw_key_valid(CPUS390XState *env, uint8_t psw_key)
 
     if (env->psw.mask & PSW_MASK_PSTATE) {
         /* PSW key has range 0..15, it is valid if the bit is 1 in the PKM */
-        return pkm & (0x80 >> psw_key);
+        return pkm & (0x8000 >> psw_key);
     }
     return true;
 }
-- 
2.31.1


