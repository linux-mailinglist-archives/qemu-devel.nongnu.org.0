Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8143E36108C
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 18:57:14 +0200 (CEST)
Received: from localhost ([::1]:44904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lX5In-0004iT-Hc
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 12:57:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lX4w6-0003Mv-5i
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 12:33:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32159)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lX4w2-0006Dk-1i
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 12:33:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618504420;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0xuLjWIAItsNJigm6O/64309pXXRrcZWKCiQ1igybp0=;
 b=iBYx/+S/do5qxcjpPA6jZ1Ki+r6ZCHlOoPXdrNhmfSMMRnLSToDAR0jOgYh0EAmOEH5a7z
 hcGswja3YfQdrStwMON+zwny/Sgd76d8/bed18T+xCJ8K5hXWtWR1YF/xd2muuZxyhUOyj
 DPzsWBC32Ze0GsVZXX3o0ZNDpSPTr90=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-527-fRFvHVkoO0yJd8CZEiMIXg-1; Thu, 15 Apr 2021 12:33:38 -0400
X-MC-Unique: fRFvHVkoO0yJd8CZEiMIXg-1
Received: by mail-wr1-f72.google.com with SMTP id
 m2-20020a5d64a20000b02900fd24e6af66so3001644wrp.21
 for <qemu-devel@nongnu.org>; Thu, 15 Apr 2021 09:33:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0xuLjWIAItsNJigm6O/64309pXXRrcZWKCiQ1igybp0=;
 b=uH1ni/xzRtjxX4rbMfW/o6vXKzheOSZXpb5TewlSfp7iYb4jrc+ZXST7Vq5GVtx4zo
 8jgnBDPLZeOx1S02ckoKhkSq03gFht+vlMpruMKtmcnKHggZ+2ZnQn7TUaa+/PKYCPsv
 iHV9sG9v6/NRuVAM0gRQUljZReB/gz2xs27B7178+DGgC7n9vpw+9DL8TrbPtVHi7gn4
 vuCf8RlP508wDAPHSNwOl+ewjkG/dhm/bfJ5RgM5O7Gr+vft0B1golvFS5WQAOfupPB0
 Fw+MMctcZBvHmnj46GSUYcnUgBBB3hsjXM99gYFAdntAiWxJsM+bq+20aSxTFVKgVMAk
 Wlow==
X-Gm-Message-State: AOAM532uWby9JcHXTwmMEWpudCD6aLZi/hWdhAEIZ77EFqhBxWevwsPe
 P4PN3TExq2V6NUw4IHtbyyLiVwzOhc77VghMvoPn4VROe5crEnvrydmejcpVbaxBHtSDpcIxCyo
 oC1tO4+9hNddY3QTog14lcc7P9oMFYL0p6+vAziUEpPhuouEhKy7g2+AKZO/qGzJj
X-Received: by 2002:a7b:c357:: with SMTP id l23mr3995288wmj.152.1618504417614; 
 Thu, 15 Apr 2021 09:33:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwVpUiph4IZPHckgqf/Hr+XPjj1Vc4WDu9J0pzOwrcfOm8lURVdTIwdP5PK7UMtrK+aXOn91w==
X-Received: by 2002:a7b:c357:: with SMTP id l23mr3995264wmj.152.1618504417479; 
 Thu, 15 Apr 2021 09:33:37 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id g132sm3769616wmg.42.2021.04.15.09.33.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Apr 2021 09:33:37 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 05/12] qtest/arm-cpu-features: Restrict
 sve_tests_sve_off_kvm test to KVM
Date: Thu, 15 Apr 2021 18:32:57 +0200
Message-Id: <20210415163304.4120052-6-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210415163304.4120052-1-philmd@redhat.com>
References: <20210415163304.4120052-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The sve_tests_sve_off_kvm() test is KVM specific.
Only run it if KVM is available.

Suggested-by: Andrew Jones <drjones@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 tests/qtest/arm-cpu-features.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/qtest/arm-cpu-features.c b/tests/qtest/arm-cpu-features.c
index 7f4b2521277..66300c3bc20 100644
--- a/tests/qtest/arm-cpu-features.c
+++ b/tests/qtest/arm-cpu-features.c
@@ -604,6 +604,8 @@ int main(int argc, char **argv)
     if (g_str_equal(qtest_get_arch(), "aarch64") && qtest_has_accel("kvm")) {
         qtest_add_data_func("/arm/kvm/query-cpu-model-expansion",
                             NULL, test_query_cpu_model_expansion_kvm);
+        qtest_add_data_func("/arm/kvm/query-cpu-model-expansion/sve-off",
+                            NULL, sve_tests_sve_off_kvm);
     }
 
     if (g_str_equal(qtest_get_arch(), "aarch64")) {
@@ -611,8 +613,6 @@ int main(int argc, char **argv)
                             NULL, sve_tests_sve_max_vq_8);
         qtest_add_data_func("/arm/max/query-cpu-model-expansion/sve-off",
                             NULL, sve_tests_sve_off);
-        qtest_add_data_func("/arm/kvm/query-cpu-model-expansion/sve-off",
-                            NULL, sve_tests_sve_off_kvm);
     }
 
     return g_test_run();
-- 
2.26.3


