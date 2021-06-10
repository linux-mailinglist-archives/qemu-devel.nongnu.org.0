Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5B143A21A4
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 02:54:44 +0200 (CEST)
Received: from localhost ([::1]:36846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lr8y3-0002Du-Pl
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 20:54:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lr8wC-0000GB-Rr
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 20:52:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45994)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lr8wB-000607-B5
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 20:52:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623286366;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6pPkLQN+1+I88h2fyXfx1J7SfMF09T6TVeclkO792zc=;
 b=SOc+WYcpsfHyYEVmDh1MlronDb29PTorGXMzdVHvhLYz5E5yJJRwX5jHyW2DkTzfTIHsd2
 WNeAWF4DCXGHgtX23yayWIjjSwBux0mNIc4WclODj3PXXJwNxlhImfZKmLuwdPyhNgMC4f
 x3p+dscd4B+qMlLU26sg5srIrqt22AM=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-456-IxdLjEo8NcGmSEofBXg1Yw-1; Wed, 09 Jun 2021 20:52:45 -0400
X-MC-Unique: IxdLjEo8NcGmSEofBXg1Yw-1
Received: by mail-qv1-f69.google.com with SMTP id
 t7-20020ad45bc70000b029023930e98a57so4191074qvt.18
 for <qemu-devel@nongnu.org>; Wed, 09 Jun 2021 17:52:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6pPkLQN+1+I88h2fyXfx1J7SfMF09T6TVeclkO792zc=;
 b=l0Oogm2qKWF2ZvSyhoiC2KF/oDK41xA9ekAtnr5wXQfIq91stylrgAnqBPLBQv8NeZ
 uL7ZQ0AT/sDzuROrmvjjze5y7EOgwnIBbPKCmTAvwvRtKrVhpkYBcFUshcIK6sD1anFB
 gDWxnSRLzP4uFBcUG6W7lGJAOEs4uoXFEZVWDJ+deXZAfQpWXIKGJWjug+VMjKWSh/qG
 1NTlXCjZkF4DSoiJYCt+XOCr6+ivBpigtRi9aHsOPF0Bfc8wg2U/8bgZ1aPncIGiClim
 C70ulsF/nmMDMKJy04uSHJJmpUujc5re2klNJScpp+vGTVgI+0RPltvondjxhhURdY1L
 u8zQ==
X-Gm-Message-State: AOAM533G5YTb4LcrAYVq3MjUR5EJ/mmidEiDeShKs8Ij+zZ6xGbVoZ4w
 7EecJZqHvLNizd3FxeE6ryRr3u7uwt7Ky4lRnv3NhFuDEfe0GcI1VVvB86WeP6sFSEaZChimZBY
 hq1b76K/3MtNEQxtBcNbwVFZ0h4QkPvnGA5lwR8tJPlEYzYuc2mmi/MWX1cfXXX5j
X-Received: by 2002:ad4:4631:: with SMTP id x17mr2886273qvv.28.1623286364805; 
 Wed, 09 Jun 2021 17:52:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxFsiaxNdAvAuOHqhfYSkeT//DaETwLmRFT1n7qvb535cep0YtaYjMfHBYGc8VYgBW0pQguWA==
X-Received: by 2002:ad4:4631:: with SMTP id x17mr2886242qvv.28.1623286364489; 
 Wed, 09 Jun 2021 17:52:44 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-toroon474qw-grc-88-174-93-75-200.dsl.bell.ca. [174.93.75.200])
 by smtp.gmail.com with ESMTPSA id x15sm1279045qkh.19.2021.06.09.17.52.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jun 2021 17:52:43 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] tests: migration-test: Still run the rest even if uffd
 missing
Date: Wed,  9 Jun 2021 20:52:38 -0400
Message-Id: <20210610005239.265588-2-peterx@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210610005239.265588-1-peterx@redhat.com>
References: <20210610005239.265588-1-peterx@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently we'll skip the whole migration-test if uffd missing.

It's a bit harsh - we can still run the rest besides postcopy!  Enable them
when we still can.

It'll happen more frequently now after kernel UFFD_USER_MODE_ONLY introduced in
commit 37cd0575b8510159, as qemu test normally requires kernel faults.  One
alternative is we disable kvm and create the uffd with UFFD_USER_MODE_ONLY for
all postcopy tests, however to be simple for now just skip postcopy tests only
by default.  If we wanna run them use "sudo" or root, they'll still work.  In
all cases, it's still better than running nothing for migration-test.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 tests/qtest/migration-test.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index 2b028df6875..d9225f58d4d 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -1376,10 +1376,6 @@ int main(int argc, char **argv)
 
     g_test_init(&argc, &argv, NULL);
 
-    if (!ufd_version_check()) {
-        return g_test_run();
-    }
-
     /*
      * On ppc64, the test only works with kvm-hv, but not with kvm-pr and TCG
      * is touchy due to race conditions on dirty bits (especially on PPC for
@@ -1416,8 +1412,11 @@ int main(int argc, char **argv)
 
     module_call_init(MODULE_INIT_QOM);
 
-    qtest_add_func("/migration/postcopy/unix", test_postcopy);
-    qtest_add_func("/migration/postcopy/recovery", test_postcopy_recovery);
+    if (ufd_version_check()) {
+        qtest_add_func("/migration/postcopy/unix", test_postcopy);
+        qtest_add_func("/migration/postcopy/recovery", test_postcopy_recovery);
+    }
+
     qtest_add_func("/migration/bad_dest", test_baddest);
     qtest_add_func("/migration/precopy/unix", test_precopy_unix);
     qtest_add_func("/migration/precopy/tcp", test_precopy_tcp);
-- 
2.31.1


