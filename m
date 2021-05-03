Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DCC437225F
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 23:19:52 +0200 (CEST)
Received: from localhost ([::1]:52742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldfyp-0006nu-Jt
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 17:19:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ldfqR-0005GT-1W
 for qemu-devel@nongnu.org; Mon, 03 May 2021 17:11:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ldfqP-0007Of-4k
 for qemu-devel@nongnu.org; Mon, 03 May 2021 17:11:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620076268;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NSr0ATvoVPT94Kw0PlP2HcPHUZbWsmv1leCf95/HD08=;
 b=LVDWjrr6M4pA70l3kcvK3B7VbJ5ynwrgYg32551vVSlI4z7TOy/Z0YgcWoxpq9AAOuR4Ck
 XWRpTWKJXVqsIRx9kHJjFRdNU0aML+CWv5jmSPFfKmdQ3Ff0zDBAaaSv5hl6RwnBpS/YD7
 oGNaU5JSoEEp5BQmfqhRcjCCGruqI0U=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-214-0aAWhiazOtacL3yKxaoVGQ-1; Mon, 03 May 2021 17:11:05 -0400
X-MC-Unique: 0aAWhiazOtacL3yKxaoVGQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 u5-20020adf9e050000b029010df603f280so1704835wre.18
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 14:11:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NSr0ATvoVPT94Kw0PlP2HcPHUZbWsmv1leCf95/HD08=;
 b=A5Gelpj+NYSM4yVLmYnd+ox3RYGv16hirr6hlLoCD2D8Rct+7AWyK/DizquPH4TDWd
 Pcz5fMk0RMAJgCVD/6XwOjMLqP0lpIacMIFN6J93j5SyKlyuBvOwGih5c8MuB6cR9wjG
 0sah8oNPpEQVZ9oaPEhYGeOXVZ+Qd3kJBiyu/IWaeCEQ/LZKW/3Gc8E+wb0GLXfru6et
 yjUCDry6DixAq4jJRhMApPLqEthnx6NsLTE6+Vhedf+JPGWnV8t5l6Vsbu3pIyOJ9Exf
 5hDecJkrI8ZrlXECLYqNBPqt5Vsclt1z/jyhSSI3d3mUZXiQd6GeYllAm529kvmHjds6
 EB4g==
X-Gm-Message-State: AOAM531cATnpCht+wMKNSrOnydZQo2ieZZ17Dnlqw5yyd0+3oNcsPLAG
 8fu/MxBEg+bmaop+4/YyxdTgJK9P/XlKpn4MsWOFWhADU1/1OwjHlKVqLkliHsoZROrM3duDBFO
 wGUmMf6pijGkJ1EEcouHsHuT+HwuSdZT+u2cuKYnQwL0bJLckHG+l+IALiY1jrF/b
X-Received: by 2002:a5d:694c:: with SMTP id r12mr19922325wrw.224.1620076263908; 
 Mon, 03 May 2021 14:11:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxXk4Rp8nF47WJi79SR59M5qxQEDP2BRMqT6EjyDdtaDzjU4XNikQMnT5N9foAzrLq4441Ueg==
X-Received: by 2002:a5d:694c:: with SMTP id r12mr19922293wrw.224.1620076263712; 
 Mon, 03 May 2021 14:11:03 -0700 (PDT)
Received: from x1w.redhat.com (anancy-651-1-208-144.w109-217.abo.wanadoo.fr.
 [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id f18sm549071wmg.26.2021.05.03.14.11.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 May 2021 14:11:03 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 08/12] qtest/migration-test: Skip tests if KVM not builtin
 on s390x/ppc64
Date: Mon,  3 May 2021 23:10:16 +0200
Message-Id: <20210503211020.894589-9-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210503211020.894589-1-philmd@redhat.com>
References: <20210503211020.894589-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Greg Kurz <groug@kaod.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We might have a s390x/ppc64 QEMU binary built without the KVM
accelerator (configured with --disable-kvm).
Checking for /dev/kvm accessibility isn't enough, also check for the
accelerator in the binary.

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Reviewed-by: Greg Kurz <groug@kaod.org>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 tests/qtest/migration-test.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index 3a711bb4929..c32a2aa30a2 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -1408,7 +1408,7 @@ int main(int argc, char **argv)
      */
     if (g_str_equal(qtest_get_arch(), "ppc64") &&
         (access("/sys/module/kvm_hv", F_OK) ||
-         access("/dev/kvm", R_OK | W_OK))) {
+         access("/dev/kvm", R_OK | W_OK) || !qtest_has_accel("kvm"))) {
         g_test_message("Skipping test: kvm_hv not available");
         return g_test_run();
     }
@@ -1419,7 +1419,7 @@ int main(int argc, char **argv)
      */
     if (g_str_equal(qtest_get_arch(), "s390x")) {
 #if defined(HOST_S390X)
-        if (access("/dev/kvm", R_OK | W_OK)) {
+        if (access("/dev/kvm", R_OK | W_OK) || !qtest_has_accel("kvm")) {
             g_test_message("Skipping test: kvm not available");
             return g_test_run();
         }
-- 
2.26.3


