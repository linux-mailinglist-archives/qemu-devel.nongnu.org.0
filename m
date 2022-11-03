Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E18C61860D
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 18:22:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqduA-0001sp-Ib; Thu, 03 Nov 2022 13:21:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oqdu5-0001qS-JN
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 13:21:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oqdu2-0002Co-98
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 13:21:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667496076;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=YMsOqlaR1mpOdLmc46GKtKw6AC5YDMgUbneomZoaSfI=;
 b=G/7Hsk0xVXt3LMD7ePlYB8W18dcTshdn9Q2w72yWPUcQRGCphvmpcmpEPyMIOOGyFTmaKP
 L30LOz+oIAzdjwbsobLEiBTipIr4dwzSuw0gxMTsGGDVIzTHTx0GKNiY3xW7tfUJhSWnT0
 fdX9H7jPNm7MSAEcfCE9I48rp3UR6gI=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-537-3Hvf05qNO5a5KqkJBJ9o0Q-1; Thu, 03 Nov 2022 13:21:15 -0400
X-MC-Unique: 3Hvf05qNO5a5KqkJBJ9o0Q-1
Received: by mail-ed1-f70.google.com with SMTP id
 h9-20020a05640250c900b00461d8ee12e2so1840260edb.23
 for <qemu-devel@nongnu.org>; Thu, 03 Nov 2022 10:21:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YMsOqlaR1mpOdLmc46GKtKw6AC5YDMgUbneomZoaSfI=;
 b=GM/27m0uhyjM8wmVlq7oy0CmOENtY9v3OFl8uEZdkJij15sa4TRG5gTwN82qirtKd9
 Vd1n1X8bIxr2L3HaQ4rpzBGBLiM9NW5Zoon3RP8pEPxbpU7pAL8iRj7zar57NC9nIZwD
 CGhFzTa5iHtW45mFvZekpWJcbvAwVofK+iPpkby+TKfwOnL3NolnEUHcOhT30RD7bIsm
 QxdlTtFs/B2zeZ9jjlKUVS3v4jrx9gp9ysZls5lFCp/DBuzsix6h9YarO+pDdetKQWX4
 ZZ9yBSdPyld2b2iBNWWWiDu71StmpI4A01vIrhhPNKehJ4ywCu8SzxBezi9O8WLdZ1+I
 rdUA==
X-Gm-Message-State: ACrzQf2Vs0U4I1BtlNmcLRAA2ZawRskaiseOj8D4mbKX1DIFIwvO95TT
 Zr8ds/t4Ki7/Bg78KACaws4AMCEbr6P/Xsi6kNJBU8CJcOxyBYfZ3PgvKWnlZkDJj3VLo/xb69S
 1O4fPjHLrTO5d1oT8J6x6yJZZqNFQpxBHS0gcRVvOxFCRpGUJq32sGbSdLNAm3g3fipw=
X-Received: by 2002:a17:907:6d1b:b0:7a1:11a9:1334 with SMTP id
 sa27-20020a1709076d1b00b007a111a91334mr1714652ejc.131.1667496073687; 
 Thu, 03 Nov 2022 10:21:13 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5lOHiFqQhEwm+fOeiU+OGgEjHRBvnmTjP3aKZB4XfN9TE1CubDC/4GlhGWM/38z/iCyeUMnA==
X-Received: by 2002:a17:907:6d1b:b0:7a1:11a9:1334 with SMTP id
 sa27-20020a1709076d1b00b007a111a91334mr1714606ejc.131.1667496073145; 
 Thu, 03 Nov 2022 10:21:13 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 ec35-20020a0564020d6300b00458dc7e8ecasm753804edb.72.2022.11.03.10.21.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 10:21:12 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: berrange@redhat.com,
	sw@weilnetz.de
Subject: [PATCH] meson: avoid unused arguments of main() in compiler tests
Date: Thu,  3 Nov 2022 18:21:10 +0100
Message-Id: <20221103172110.168235-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.047,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

meson.build has one test where "main" is declared unnecessarily
with argc and argv arguments, but does not use them.  Because
the test needs -Werror too, HAVE_BROKEN_SIZE_MAX is defined
incorrectly.

Fix the test and, for consistency, remove argc and argv whenever
they are not needed.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meson.build b/meson.build
index 17834b3c3def..7beeac6b5194 100644
--- a/meson.build
+++ b/meson.build
@@ -2143,7 +2143,7 @@ config_host_data.set('CONFIG_SPLICE', cc.links(gnu_source_prefix + '''
 
 config_host_data.set('HAVE_MLOCKALL', cc.links(gnu_source_prefix + '''
   #include <sys/mman.h>
-  int main(int argc, char *argv[]) {
+  int main(void) {
     return mlockall(MCL_FUTURE);
   }'''))
 
@@ -2188,7 +2188,7 @@ config_host_data.set('HAVE_FSXATTR', cc.links('''
 config_host_data.set('HAVE_BROKEN_SIZE_MAX', not cc.compiles('''
     #include <stdint.h>
     #include <stdio.h>
-    int main(int argc, char *argv[]) {
+    int main(void) {
         return printf("%zu", SIZE_MAX);
     }''', args: ['-Werror']))
 
@@ -2305,7 +2305,7 @@ config_host_data.set('CONFIG_AVX2_OPT', get_option('avx2') \
       __m256i x = *(__m256i *)a;
       return _mm256_testz_si256(x, x);
     }
-    int main(int argc, char *argv[]) { return bar(argv[0]); }
+    int main(int argc, char *argv[]) { return bar(argv[argc - 1]); }
   '''), error_message: 'AVX2 not available').allowed())
 
 config_host_data.set('CONFIG_AVX512F_OPT', get_option('avx512f') \
@@ -2319,7 +2319,7 @@ config_host_data.set('CONFIG_AVX512F_OPT', get_option('avx512f') \
       __m512i x = *(__m512i *)a;
       return _mm512_test_epi64_mask(x, x);
     }
-    int main(int argc, char *argv[]) { return bar(argv[0]); }
+    int main(int argc, char *argv[]) { return bar(argv[argc - 1]); }
   '''), error_message: 'AVX512F not available').allowed())
 
 have_pvrdma = get_option('pvrdma') \
-- 
2.38.1


