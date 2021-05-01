Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01DAF37093D
	for <lists+qemu-devel@lfdr.de>; Sun,  2 May 2021 00:45:15 +0200 (CEST)
Received: from localhost ([::1]:41778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcyMM-0005p8-43
	for lists+qemu-devel@lfdr.de; Sat, 01 May 2021 18:45:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lcyEs-0005Em-6Y
 for qemu-devel@nongnu.org; Sat, 01 May 2021 18:37:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22605)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lcyEq-00007v-Ms
 for qemu-devel@nongnu.org; Sat, 01 May 2021 18:37:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619908648;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NSr0ATvoVPT94Kw0PlP2HcPHUZbWsmv1leCf95/HD08=;
 b=MO1xT4mVSLlQLG9pWhhnYcisPVqyBjlnujVph3nPvkCTRmtlKxc1pQjjvXETb0q3efO8bt
 aO3r8s/Mk4QBudRCAacQuKdeIA5XJF41Yk7vEyC4PQCxTw/vzDshuHxHTx4rfkPbPvsNUr
 zZwsyysVatSGlNDadUSZwXS0YYcK76I=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-393-3X4nQ5tEOY2bXv3KLe9ALg-1; Sat, 01 May 2021 18:37:26 -0400
X-MC-Unique: 3X4nQ5tEOY2bXv3KLe9ALg-1
Received: by mail-wr1-f71.google.com with SMTP id
 a7-20020adfc4470000b029010d875c66edso1264523wrg.23
 for <qemu-devel@nongnu.org>; Sat, 01 May 2021 15:37:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NSr0ATvoVPT94Kw0PlP2HcPHUZbWsmv1leCf95/HD08=;
 b=Ou7HuKNadNwZwSC1WU4evZTy/VSDs/eEvRb/HRst+e8jCaWNe3nSwE77hLeiaS2Vwm
 w4RK0UGLAHcp1OQiBcVb5+NPXbmeGqJkXTr2SS3VdWbQlV/Ob+Cq1HF6Ej+IQCEmnFN0
 QY2oCbs6co/bmsmmCy6PuaElCEr5i9vkXBAX2cgN7F70LFSJymMsWIVj6WC7qPaXN0OZ
 4sCOIY2EgngsgHAd9+aCMwJiLqpwN9CAbo6boGZwfAg/wALslqpkqyJOKvEy5IlO2jy0
 lbXndk30Utn9iYExMw2Vhkoxl5ltLz6lO1XQjidHel6yDlYrUg8PDmkuPFKpZjv9/NFu
 cF0g==
X-Gm-Message-State: AOAM531610npFY54hNrNGvG4R/gQDWzPkxFzCqP5+ZyYzj4kyZsZ64uK
 vp2qtQ5Kq2ngaFmne8kvumkYUtASpO2NkI8aM4MQNwso5XE6RSNWKw43oQn3oCCuZ4A6B9odvkI
 0mkqzZin26QlztrHf+owF+h0POdxpfMH+XyFCJbjn9T7M7fYmpJt1OpTACXa6hVBI
X-Received: by 2002:a5d:6d48:: with SMTP id k8mr15615936wri.93.1619908645445; 
 Sat, 01 May 2021 15:37:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyHlDmMb/Hu2EcSuWjOkP9gCFn8An4aP1VyRAf3WRmO5rwvrL7se7YiZsfzpfi6wQhgecdN1w==
X-Received: by 2002:a5d:6d48:: with SMTP id k8mr15615905wri.93.1619908645226; 
 Sat, 01 May 2021 15:37:25 -0700 (PDT)
Received: from localhost.localdomain
 (anancy-651-1-208-144.w109-217.abo.wanadoo.fr. [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id n2sm8024960wmb.32.2021.05.01.15.37.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 May 2021 15:37:24 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 09/10] qtest/migration-test: Skip tests if KVM not builtin
 on s390x/ppc64
Date: Sun,  2 May 2021 00:36:37 +0200
Message-Id: <20210501223638.510712-10-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210501223638.510712-1-philmd@redhat.com>
References: <20210501223638.510712-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Andrew Jones <drjones@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Greg Kurz <groug@kaod.org>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
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


