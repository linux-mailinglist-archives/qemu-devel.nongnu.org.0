Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8EB151305F
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 11:55:04 +0200 (CEST)
Received: from localhost ([::1]:52054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk0rX-0002yL-SJ
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 05:55:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nk0k6-00035h-Ay
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 05:47:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40581)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nk0k3-0008CA-NR
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 05:47:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651139238;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nWTa/VK2W1usgH2WMO8nBJqO1YZe1fxR5G6cQyMlefc=;
 b=CMilYL3nnzGX07xcYCfwSmyLLioVJ8ktlH9mxRH7hhRWmQx6sBtJztT3wap1g9GmLKxrOq
 w3nthcCyCiD5u2Xh7RW4AUBgaH5BFMzYNuK9OS5aMXvu+YoeSnSjWCEj2KR9bc6soNIjRo
 1wKkrvSGGX/Vv7BuMNHkhhuP9FjKOOg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-568-_mG9esfWNcCYDsWO0lyqow-1; Thu, 28 Apr 2022 05:47:14 -0400
X-MC-Unique: _mG9esfWNcCYDsWO0lyqow-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 67587281AF02;
 Thu, 28 Apr 2022 09:47:14 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.194.113])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0D5E140CF8FA;
 Thu, 28 Apr 2022 09:47:11 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 01/13] target/s390x: Fix writeback to v1 in helper_vstl
Date: Thu, 28 Apr 2022 11:46:56 +0200
Message-Id: <20220428094708.84835-2-david@redhat.com>
In-Reply-To: <20220428094708.84835-1-david@redhat.com>
References: <20220428094708.84835-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
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
Cc: Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eric Farman <farman@linux.ibm.com>, David Miller <dmiller423@gmail.com>,
 Halil Pasic <pasic@linux.ibm.com>, qemu-s390x@nongnu.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Fixes: 0e0a5b49ad58 ("s390x/tcg: Implement VECTOR STORE WITH LENGTH")
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: David Miller <dmiller423@gmail.com>
Reviewed-by: David Hildenbrand <david@redhat.com>
Tested-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 target/s390x/tcg/vec_helper.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/target/s390x/tcg/vec_helper.c b/target/s390x/tcg/vec_helper.c
index ededf13cf0..48d86722b2 100644
--- a/target/s390x/tcg/vec_helper.c
+++ b/target/s390x/tcg/vec_helper.c
@@ -200,7 +200,6 @@ void HELPER(vstl)(CPUS390XState *env, const void *v1, uint64_t addr,
         addr = wrap_address(env, addr + 8);
         cpu_stq_data_ra(env, addr, s390_vec_read_element64(v1, 1), GETPC());
     } else {
-        S390Vector tmp = {};
         int i;
 
         for (i = 0; i < bytes; i++) {
@@ -209,6 +208,5 @@ void HELPER(vstl)(CPUS390XState *env, const void *v1, uint64_t addr,
             cpu_stb_data_ra(env, addr, byte, GETPC());
             addr = wrap_address(env, addr + 1);
         }
-        *(S390Vector *)v1 = tmp;
     }
 }
-- 
2.35.1


