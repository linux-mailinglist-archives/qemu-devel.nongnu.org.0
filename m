Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D7B3D97B3
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Jul 2021 23:42:48 +0200 (CEST)
Received: from localhost ([::1]:49218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8rKB-0003ho-Gn
	for lists+qemu-devel@lfdr.de; Wed, 28 Jul 2021 17:42:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m8rJ1-00031P-NT
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 17:41:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24322)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m8rJ0-0000jT-6O
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 17:41:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627508493;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Dty4nNLVepfTl3vJ9c9FYg2rp1FK77r1aFxBpbH8x9I=;
 b=OS4GfHJA7m+iBmvVwX+bBscSokrYhDVqI0llIqc/Ea4qQDP3x5mYjWiknyJQzeSe4WbIvd
 uj4ibmtRA3ui5leqdIq6AO36SXTsIRcHEAJfLgje/wQUFdJabO/OBqxykPH3mSbIMQJ7br
 C7NwwPhzsp4HTppPmnVt1ynzCn8thZ8=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-6-XKbRXbJEOLCTmXdix0xIKA-1; Wed, 28 Jul 2021 17:41:32 -0400
X-MC-Unique: XKbRXbJEOLCTmXdix0xIKA-1
Received: by mail-qv1-f69.google.com with SMTP id
 v19-20020ad455530000b029032620cab853so2767416qvy.8
 for <qemu-devel@nongnu.org>; Wed, 28 Jul 2021 14:41:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Dty4nNLVepfTl3vJ9c9FYg2rp1FK77r1aFxBpbH8x9I=;
 b=P0hgdW03jBw13Z9JEilwqRwfRKcJM81po/D+adZl9ncK8Yv/K1xAzQ/cXsD7iNykj2
 g69S6Hec6JfXwujvciHrWsAnyPvC53MdV/E8qTF4mHGI/6pYR6PfcadkAHUnDec9rABs
 S5vruHhyUQ+UPCW6kPdQc8BdP4n+fKViJMwZWGqsXFHLXFnwOfLzwPYhOMFLlH4HO/aw
 rtxhaxo5YCKwjGzlZIhsuyyNhH2Q0oXTzqgFpbKS5AxmAiIYCXKUgyGgTVAvjp1y3sgz
 9mblrBGifsOsmdntDvn566GwwtvFZKUaIvdQ3TNnR/gsF8sGCEpTcvfqjiGhtIADLRtS
 7S3Q==
X-Gm-Message-State: AOAM533hJw6wgoroNLq25rgYZSM6yAmAz8UY/bhaFrVptTIkaKYG9pFA
 JIp5PruUUafFpqawihScAN3WWZMknBEzRoyLcTygP2ZpTp7hettmZTF2SJeEHjmVeYvLdXMGCWO
 FVPAknbTFTePOF4/ktH/6n1YqNj9SZ7ALIzgi1ypS7C3pZDAcg5+dwhnNFGVHvFXA
X-Received: by 2002:a37:660b:: with SMTP id a11mr1812716qkc.395.1627508491967; 
 Wed, 28 Jul 2021 14:41:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz4T7Uyt9FrjxUtLIJwE1wSXJxw6tJ2VZxV2cWIB5O9exOonmRLJS3SkoEGfCZnk7bHLd/L5Q==
X-Received: by 2002:a37:660b:: with SMTP id a11mr1812694qkc.395.1627508491702; 
 Wed, 28 Jul 2021 14:41:31 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id y1sm634947qki.59.2021.07.28.14.41.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jul 2021 14:41:31 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] tests: Fix migration-test build failure for sparc
Date: Wed, 28 Jul 2021 17:41:28 -0400
Message-Id: <20210728214128.206198-1-peterx@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
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
Cc: Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Even if <linux/kvm.h> seems to exist for all archs on linux, however including
it with __linux__ defined seems to be not working yet as it'll try to include
asm/kvm.h and that can be missing for archs that do not support kvm.

To fix this (instead of any attempt to fix linux headers..), we can mark the
header to be x86_64 only, because it's so far only service for adding the kvm
dirty ring test.

No need to have "Fixes" as the issue is just introduced very recently.

Reported-by: Richard Henderson <rth@twiddle.net>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 tests/qtest/migration-test.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index 1e8b7784ef..cc5e83d98a 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -27,7 +27,8 @@
 #include "migration-helpers.h"
 #include "tests/migration/migration-test.h"
 
-#if defined(__linux__)
+/* For dirty ring test; so far only x86_64 is supported */
+#if defined(__linux__) && defined(HOST_X86_64)
 #include "linux/kvm.h"
 #endif
 
@@ -1395,7 +1396,7 @@ static void test_multifd_tcp_cancel(void)
 
 static bool kvm_dirty_ring_supported(void)
 {
-#if defined(__linux__)
+#if defined(__linux__) && defined(HOST_X86_64)
     int ret, kvm_fd = open("/dev/kvm", O_RDONLY);
 
     if (kvm_fd < 0) {
-- 
2.31.1


