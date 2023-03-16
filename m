Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF4B6BD321
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 16:14:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcpHh-0001bp-Q1; Thu, 16 Mar 2023 11:12:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pcpHQ-0001Qx-8b
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 11:12:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pcpHO-0003I3-Mt
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 11:12:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678979553;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V8X9i5z+IA/JXYTFyPjqnkyE/RoG2BM7TUNVsDqSoo8=;
 b=Ed45ieRrFtEpaNrOTN4b+rstyjgqXW3l279MndcMFV0f7YIEjV00aKEypm2/qO3rv6YegE
 0XEOmKSOXOM8fz/KLUkbYqzFHRW6mv7nyAtjvZl16ndr4VNHKYLdL5t9DP2x/p2b3FkDRD
 T22xPmLyOVLj//WfJW4UOjiQT8y5fO8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-117-PujK91MpMfiRTDvsnV42LA-1; Thu, 16 Mar 2023 11:12:32 -0400
X-MC-Unique: PujK91MpMfiRTDvsnV42LA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A3C482807D71;
 Thu, 16 Mar 2023 15:12:31 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.195.45])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EA95A492B00;
 Thu, 16 Mar 2023 15:12:30 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
Subject: [PULL 4/7] migration/xbzrle: fix out-of-bounds write with axv512
Date: Thu, 16 Mar 2023 16:12:22 +0100
Message-Id: <20230316151225.11362-5-quintela@redhat.com>
In-Reply-To: <20230316151225.11362-1-quintela@redhat.com>
References: <20230316151225.11362-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
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

From: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>

xbzrle_encode_buffer_avx512() checks for overflows too scarcely in its
outer loop, causing out-of-bounds writes:

$ ../configure --target-list=aarch64-softmmu --enable-sanitizers --enable-avx512bw
$ make tests/unit/test-xbzrle && ./tests/unit/test-xbzrle

==5518==ERROR: AddressSanitizer: heap-buffer-overflow on address 0x62100000b100 at pc 0x561109a7714d bp 0x7ffed712a440 sp 0x7ffed712a430
WRITE of size 1 at 0x62100000b100 thread T0
    #0 0x561109a7714c in uleb128_encode_small ../util/cutils.c:831
    #1 0x561109b67f6a in xbzrle_encode_buffer_avx512 ../migration/xbzrle.c:275
    #2 0x5611099a7428 in test_encode_decode_overflow ../tests/unit/test-xbzrle.c:153
    #3 0x7fb2fb65a58d  (/lib/x86_64-linux-gnu/libglib-2.0.so.0+0x7a58d)
    #4 0x7fb2fb65a333  (/lib/x86_64-linux-gnu/libglib-2.0.so.0+0x7a333)
    #5 0x7fb2fb65aa79 in g_test_run_suite (/lib/x86_64-linux-gnu/libglib-2.0.so.0+0x7aa79)
    #6 0x7fb2fb65aa94 in g_test_run (/lib/x86_64-linux-gnu/libglib-2.0.so.0+0x7aa94)
    #7 0x5611099a3a23 in main ../tests/unit/test-xbzrle.c:218
    #8 0x7fb2fa78c082 in __libc_start_main (/lib/x86_64-linux-gnu/libc.so.6+0x24082)
    #9 0x5611099a608d in _start (/qemu/build/tests/unit/test-xbzrle+0x28408d)

0x62100000b100 is located 0 bytes to the right of 4096-byte region [0x62100000a100,0x62100000b100)
allocated by thread T0 here:
    #0 0x7fb2fb823a06 in __interceptor_calloc ../../../../src/libsanitizer/asan/asan_malloc_linux.cc:153
    #1 0x7fb2fb637ef0 in g_malloc0 (/lib/x86_64-linux-gnu/libglib-2.0.so.0+0x57ef0)

Fix that by performing the overflow check in the inner loop, instead.

Signed-off-by: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/xbzrle.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/migration/xbzrle.c b/migration/xbzrle.c
index 21b92d4eae..c6f8b20917 100644
--- a/migration/xbzrle.c
+++ b/migration/xbzrle.c
@@ -197,10 +197,6 @@ int xbzrle_encode_buffer_avx512(uint8_t *old_buf, uint8_t *new_buf, int slen,
     __m512i r = _mm512_set1_epi32(0);
 
     while (count512s) {
-        if (d + 2 > dlen) {
-            return -1;
-        }
-
         int bytes_to_check = 64;
         uint64_t mask = 0xffffffffffffffff;
         if (count512s == 1) {
@@ -216,6 +212,9 @@ int xbzrle_encode_buffer_avx512(uint8_t *old_buf, uint8_t *new_buf, int slen,
 
         bool is_same = (comp & 0x1);
         while (bytes_to_check) {
+            if (d + 2 > dlen) {
+                return -1;
+            }
             if (is_same) {
                 if (nzrun_len) {
                     d += uleb128_encode_small(dst + d, nzrun_len);
-- 
2.39.2


