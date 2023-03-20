Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D1B6C1295
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 14:05:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peFB0-0001CT-RB; Mon, 20 Mar 2023 09:03:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1peFAv-0001Ao-8c
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 09:03:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1peFAt-0006AW-Ft
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 09:03:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679317420;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s0wxJiXYClXSoa8e5D2eDibhzd3LookEebaQeXBZ0QQ=;
 b=HSp06L+6/kOkn9uTXk8TIgWVvuxDAGM4K53oA4W37sRxwCIlv2LAh9UZTMBjkPZH72uiZc
 w5UyRR6i1MqlrrLG9Nxp+9jgLkjYFsKInO7NS1uXKzB0BVN3HJ5vvtffp/S2802eQK4Su5
 4fjB2Tl0w8hDQscIyeiZEpX6efMjNRg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-413-iq4FSI6eOJmV-Bd48SfcAQ-1; Mon, 20 Mar 2023 09:03:39 -0400
X-MC-Unique: iq4FSI6eOJmV-Bd48SfcAQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E85F61818E53;
 Mon, 20 Mar 2023 13:03:38 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.77])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 16006C15BA0;
 Mon, 20 Mar 2023 13:03:37 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Cc: Ilya Leoshkevich <iii@linux.ibm.com>, David Hildenbrand <david@redhat.com>
Subject: [PULL 05/24] target/s390x: Fix R[NOX]SBG with T=1
Date: Mon, 20 Mar 2023 14:03:11 +0100
Message-Id: <20230320130330.406378-6-thuth@redhat.com>
In-Reply-To: <20230320130330.406378-1-thuth@redhat.com>
References: <20230320130330.406378-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
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

From: Ilya Leoshkevich <iii@linux.ibm.com>

RXSBG usage in the "filetests" test from the wasmtime testsuite makes
tcg_reg_alloc_op() attempt to temp_load() a TEMP_VAL_DEAD temporary,
causing an assertion failure:

    0x01000a70:  ec14 b040 3057  rxsbg    %r1, %r4, 0xb0, 0x40, 0x30

    OP after optimization and liveness analysis:
     ---- 0000000001000a70 0000000000000004 0000000000000006
     rotl_i64 tmp2,r4,$0x30                   dead: 1 2  pref=0xffff
     and_i64 tmp2,tmp2,$0x800000000000ffff    dead: 1  pref=0xffff
    [xor_i64 tmp3,tmp3,tmp2                   dead: 1 2  pref=0xffff]
     and_i64 cc_dst,tmp3,$0x800000000000ffff  sync: 0  dead: 0 1 2  pref=0xffff
     mov_i64 psw_addr,$0x1000a76              sync: 0  dead: 0 1  pref=0xffff
     mov_i32 cc_op,$0x6                       sync: 0  dead: 0 1  pref=0xffff
     call lookup_tb_ptr,$0x6,$1,tmp8,env      dead: 1  pref=none
     goto_ptr tmp8                            dead: 0
     set_label $L0
     exit_tb $0x7fffe809d183

    ../tcg/tcg.c:3865: tcg fatal error

The reason is that tmp3 does not have an initial value, which confuses
the register allocator. This also affects the correctness of the
results.

Fix by assigning R1 to it.

Exposed by commit e2e641fa3d5 ("tcg: Change default temp lifetime to
TEMP_TB").

Fixes: d6c6372e186e ("target-s390: Implement R[NOX]SBG")
Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
Reviewed-by: David Hildenbrand <david@redhat.com>
Message-Id: <20230316172205.281369-2-iii@linux.ibm.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 target/s390x/tcg/translate.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index 7832cf02a6..6758d9f47a 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -3697,11 +3697,15 @@ static DisasJumpType op_rosbg(DisasContext *s, DisasOps *o)
     int i3 = get_field(s, i3);
     int i4 = get_field(s, i4);
     int i5 = get_field(s, i5);
+    TCGv_i64 orig_out;
     uint64_t mask;
 
     /* If this is a test-only form, arrange to discard the result.  */
     if (i3 & 0x80) {
+        tcg_debug_assert(o->out != NULL);
+        orig_out = o->out;
         o->out = tcg_temp_new_i64();
+        tcg_gen_mov_i64(o->out, orig_out);
     }
 
     i3 &= 63;
-- 
2.31.1


