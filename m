Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 068174334EE
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 13:43:14 +0200 (CEST)
Received: from localhost ([::1]:58570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcnWT-0006Sw-3K
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 07:43:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mcnAp-0000LR-Cx
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 07:20:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22361)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mcnAU-0002F7-CL
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 07:20:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634642425;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/OOFXRgq8TSDvZxZeGhYdPtX8D2UWjeyH5vg2OkC7lM=;
 b=T7gg2WgFjq5UIzqFjHosd7W+FN3ZkLTpoBn4djAuLdl+VTRtrzsnovO0dU97WL3MPsPwE5
 yUN0FpH3Jz0AXnSO3A6rB+/RXaNVtcZblho8tiDdL7e6ZoHbslH2q/dLZLYWCUpCd1zJ8x
 WRMzpclKdZpXGpQL8nWVj1BfL6KkjWk=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-491-CbIy7UM7MQu_W1DTL6HF0A-1; Tue, 19 Oct 2021 07:20:24 -0400
X-MC-Unique: CbIy7UM7MQu_W1DTL6HF0A-1
Received: by mail-ed1-f70.google.com with SMTP id
 l10-20020a056402230a00b003db6977b694so17238096eda.23
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 04:20:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/OOFXRgq8TSDvZxZeGhYdPtX8D2UWjeyH5vg2OkC7lM=;
 b=UU+FaqY5q2Lg0K4EKzFJBnVjf7XqqGtT8toFWK2cA5IWaNKap0icFcDMmeFuZyF3QZ
 qo4fyUusi8lhSHpLZ89+UB0OskV2nqUmsoSiB2ZysOB/uwY7HoBN73Lk6ZE9+hTqHbsU
 jWeGX+iAs2TX5i+QsTw9Ev7IJv0dWmnnq3Q/1UAMNWqcIaI/OHTHNxTh3qJbU13imlsa
 AGRbhN/rdzIpMzdWr4TdcFDPoZHIj2nFfx60AZqNYEqErXhW7VUy7QOsEzPhj0NPRRQ3
 bLzdW6rlEFCi/nXCUOPdoatM0GzvFTwWI/z9qoKu4yiW7WucElHHbwE/VgcwZqknoEiq
 Uang==
X-Gm-Message-State: AOAM530Sd7FomqVSBvYYF0DGxQXgra1eJVVdv0nN5IQugUalTJhEbbTw
 m/jkeBldeqjE6qOCBR6dj98SkTKQ3uurJPhTP65dkC1yG5PEwlXNjZU4lP+fqMtvqzKsNU4TBgA
 5lQsTp1LNJlvzR/2HPy6T20MwJM3z4O8UGPDLHtn4RN5WqWYjq4VKDUoIR8I2
X-Received: by 2002:aa7:c44d:: with SMTP id n13mr53433621edr.34.1634642422904; 
 Tue, 19 Oct 2021 04:20:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJztcD81KGN/EeMZrmUd74lpiLk64kBks5gmiHM5gALC+XCXhwHp0if8EUdqUyRmJ4GR9k8zYw==
X-Received: by 2002:aa7:c44d:: with SMTP id n13mr53433587edr.34.1634642422622; 
 Tue, 19 Oct 2021 04:20:22 -0700 (PDT)
Received: from redhat.com ([2.55.24.172])
 by smtp.gmail.com with ESMTPSA id dx2sm9955467ejb.125.2021.10.19.04.20.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 04:20:22 -0700 (PDT)
Date: Tue, 19 Oct 2021 07:20:19 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 14/29] tests: migration-test: use qtest_has_accel() API
Message-ID: <20211019111923.679826-15-mst@redhat.com>
References: <20211019111923.679826-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211019111923.679826-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Igor Mammedov <imammedo@redhat.com>

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Suggested-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20210902113551.461632-15-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/migration-test.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index cc5e83d98a..7b42f6fd90 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -1420,6 +1420,7 @@ static bool kvm_dirty_ring_supported(void)
 int main(int argc, char **argv)
 {
     char template[] = "/tmp/migration-test-XXXXXX";
+    const bool has_kvm = qtest_has_accel("kvm");
     int ret;
 
     g_test_init(&argc, &argv, NULL);
@@ -1434,8 +1435,7 @@ int main(int argc, char **argv)
      * some reason)
      */
     if (g_str_equal(qtest_get_arch(), "ppc64") &&
-        (access("/sys/module/kvm_hv", F_OK) ||
-         access("/dev/kvm", R_OK | W_OK))) {
+        (!has_kvm || access("/sys/module/kvm_hv", F_OK))) {
         g_test_message("Skipping test: kvm_hv not available");
         return g_test_run();
     }
@@ -1444,16 +1444,9 @@ int main(int argc, char **argv)
      * Similar to ppc64, s390x seems to be touchy with TCG, so disable it
      * there until the problems are resolved
      */
-    if (g_str_equal(qtest_get_arch(), "s390x")) {
-#if defined(HOST_S390X)
-        if (access("/dev/kvm", R_OK | W_OK)) {
-            g_test_message("Skipping test: kvm not available");
-            return g_test_run();
-        }
-#else
-        g_test_message("Skipping test: Need s390x host to work properly");
+    if (g_str_equal(qtest_get_arch(), "s390x") && !has_kvm) {
+        g_test_message("Skipping test: s390x host with KVM is required");
         return g_test_run();
-#endif
     }
 
     tmpfs = mkdtemp(template);
-- 
MST


