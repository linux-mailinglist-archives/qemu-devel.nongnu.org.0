Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5987B519E98
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 13:54:20 +0200 (CEST)
Received: from localhost ([::1]:41602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmDaF-0002r8-EI
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 07:54:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nmCpC-0001fz-Rw
 for qemu-devel@nongnu.org; Wed, 04 May 2022 07:05:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37017)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nmCp8-0001Ye-IP
 for qemu-devel@nongnu.org; Wed, 04 May 2022 07:05:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651662336;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v/ImEfK7U3vlTABJYQuqZo63RXdQ2AGfVnq3kMe29+E=;
 b=fL/JaEv4BM5eHnzCbT11tCoQLtVx5xS6hJ7La/Hd57oc1U2tX0ko+9rKEQiMkMnLDSJszB
 zNIzQNs6XlKh1lSrzL+5SC9SFjxMeNh/qx5jXpKkpvKuxN9jaUOpBk4Ud7Ln6oSB16WyeF
 SXXU91/8paF6AyLajc1Qk/xNdCTNZNE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-10-0B5Kx-XwNnSfZgDzw5UjOg-1; Wed, 04 May 2022 07:05:33 -0400
X-MC-Unique: 0B5Kx-XwNnSfZgDzw5UjOg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 415D285A5BC;
 Wed,  4 May 2022 11:05:33 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0CF2B111E40B;
 Wed,  4 May 2022 11:05:25 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>,
	qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, David Hildenbrand <david@redhat.com>,
 David Miller <dmiller423@gmail.com>
Subject: [PULL 01/15] target/s390x: Fix writeback to v1 in helper_vstl
Date: Wed,  4 May 2022 13:05:07 +0200
Message-Id: <20220504110521.343519-2-thuth@redhat.com>
In-Reply-To: <20220504110521.343519-1-thuth@redhat.com>
References: <20220504110521.343519-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Fixes: 0e0a5b49ad58 ("s390x/tcg: Implement VECTOR STORE WITH LENGTH")
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: David Hildenbrand <david@redhat.com>
Tested-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: David Miller <dmiller423@gmail.com>
Reviewed-by: David Hildenbrand <david@redhat.com>
Message-Id: <20220428094708.84835-2-david@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
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
2.27.0


