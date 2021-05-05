Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B307A373BE5
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 15:02:39 +0200 (CEST)
Received: from localhost ([::1]:33212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leHAk-0003eL-NG
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 09:02:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1leH75-0001nA-Uk
 for qemu-devel@nongnu.org; Wed, 05 May 2021 08:58:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58657)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1leH74-00046v-7D
 for qemu-devel@nongnu.org; Wed, 05 May 2021 08:58:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620219529;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NSr0ATvoVPT94Kw0PlP2HcPHUZbWsmv1leCf95/HD08=;
 b=SEYF0TE74UywSlHi+fjQrVUEe0AUYuvqweQ+z46DWkhf1PvMQVbKZwQS4mUXREFiXqtXNK
 s6yB/gHdaq97nu+Chix64I/1kxm5Bg2Ggs2DdMNSMMmSV8elVlTfmuehfn3eo6QZhKhRou
 mfqCrjzyfO4aHp6MhDCLiXmtXMOAJfE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-177-fr5R6ziwOIKDmSTzpKVdqg-1; Wed, 05 May 2021 08:58:48 -0400
X-MC-Unique: fr5R6ziwOIKDmSTzpKVdqg-1
Received: by mail-wr1-f72.google.com with SMTP id
 91-20020adf94640000b029010b019075afso658327wrq.17
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 05:58:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NSr0ATvoVPT94Kw0PlP2HcPHUZbWsmv1leCf95/HD08=;
 b=It5OJn8lmOUNjwYLleaiP+hAKG3kUiMcxxEBh0jIwbr0cX1RCDbpg2NgVPnaqSy5Du
 WhpN3eXUqCzFsKRAANu7DWmiNo10P5z0JOr5mnZNaJEeR2XI1+S7tMDxotx2YTuZY4/C
 rLRN8K3JiAL3WF4zKUtDJbtPgaz2BL8pdjI1zhl9tMv0qnjurfw/0sR9ePwHDnhy0d6p
 WBdaouzv7gHVeUQ8+DtlnT9eI5IJxT9CdxmhWq5rKVrfPAqdipqKKpBojIRHuu+nD3SY
 dSwP1Iu5GN4fD2BWoOCdzRn7VGIeUtBoRlAgNat4yz/MzLzz6HlmeUI6SQZpNdcV5Xfk
 5prA==
X-Gm-Message-State: AOAM533oKSuowZYIVZWP5v4w/b9S4OqPPeuS5PggJYXPmOIxftrKmXKb
 atG2IkWuBNRFakaVq9VSuM00wJAt4Az9pAWCKbKZVuWBlKC5Qe5szhfkXXyfp0TZOtRcmggqVFX
 Z4xqrf5tAbR8JK+kOy35lbJ+1fcAAwtl0r6qUlHa8BAu0KdylM4V8I7jnbYL7jBI7
X-Received: by 2002:a05:6000:1541:: with SMTP id
 1mr28655012wry.364.1620219526974; 
 Wed, 05 May 2021 05:58:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwHXii+RrJP9dv/V7ffUnivzxS+CN4t4Ydboamkb417/bhUtJSFJXBPF0ltegkqxUBv5lu4bg==
X-Received: by 2002:a05:6000:1541:: with SMTP id
 1mr28654987wry.364.1620219526801; 
 Wed, 05 May 2021 05:58:46 -0700 (PDT)
Received: from x1w.redhat.com
 (astrasbourg-653-1-188-220.w90-13.abo.wanadoo.fr. [90.13.127.220])
 by smtp.gmail.com with ESMTPSA id q10sm5767584wmc.31.2021.05.05.05.58.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 May 2021 05:58:46 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 08/12] qtest/migration-test: Skip tests if KVM not builtin
 on s390x/ppc64
Date: Wed,  5 May 2021 14:58:02 +0200
Message-Id: <20210505125806.1263441-9-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210505125806.1263441-1-philmd@redhat.com>
References: <20210505125806.1263441-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.693,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Greg Kurz <groug@kaod.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
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


