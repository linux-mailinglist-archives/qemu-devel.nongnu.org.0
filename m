Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39FBC370935
	for <lists+qemu-devel@lfdr.de>; Sun,  2 May 2021 00:38:52 +0200 (CEST)
Received: from localhost ([::1]:49978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcyGB-00066D-A4
	for lists+qemu-devel@lfdr.de; Sat, 01 May 2021 18:38:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lcyEU-0004Z1-S8
 for qemu-devel@nongnu.org; Sat, 01 May 2021 18:37:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44104)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lcyES-0008Kd-0Z
 for qemu-devel@nongnu.org; Sat, 01 May 2021 18:37:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619908623;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MeNb2Atwfh/sX8kxLzvRexJijoqF1JUDJOimaLT3mRk=;
 b=XYuomF3RVr2ArVkgFPo682BONif8uR+qP5NkayUoAU+thLb/4lBoABmSzq+KCzXctpxvBx
 7qd1y0yJUtc+MVzJRu+AtFrQVDgGjvX/Hlw/aI2jG5EhRzdyuvY+qMpwkEoMaxBjxZ7lLG
 poEW/DnRxZL5pYuPJh+wVN64Edk5q5s=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-203-xEvtQ6y6NY-xkgUJu6yxsA-1; Sat, 01 May 2021 18:37:02 -0400
X-MC-Unique: xEvtQ6y6NY-xkgUJu6yxsA-1
Received: by mail-wr1-f71.google.com with SMTP id
 t5-20020adfb7c50000b029010dd0bb24cfso654814wre.2
 for <qemu-devel@nongnu.org>; Sat, 01 May 2021 15:37:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MeNb2Atwfh/sX8kxLzvRexJijoqF1JUDJOimaLT3mRk=;
 b=YzCVHY1WGlQyWWdpbpQir1l8FfxaJfQctGerpDdTH3wlsPOWPPvmMv0w1oh513Nobh
 tMQjhMyo0EXwEIWxRzgMv53ZkqAaL3zKIrmYcKTjK5B9cjaj7BrsDf2oYOh1iU0/a2Nc
 h2BHcvcP8A8+AvhYVk1lFsC4C5Ax1OuAPUiU4deyl34RC2f2piQhmqo+IX/VtNpH0iNL
 HN4qAAKYtdzlOaIuAbIWQXYc0xxIpUj3Wt7fUo+aLl1xkvJVDbP5cXPzfihmpk6O5W/l
 dPyfVO/CqqdNowasrYxur6S7p/M2Q7qHsrGvOUjXFNfPvDLpdAsxgyvVeE5JLCS8elMx
 1MyQ==
X-Gm-Message-State: AOAM530+X7Fqo4WvVr/0y6ah6THrrBMcHvPP1sQ60L9N6NbSpqEaNZJs
 rUWfwxVUCOcQfJk+4eE0D/F+yqMOCyttUlEaWqEQ80aDgeJfl26cT/DDqgJkyz+jCPwPITMR+7W
 WC09kiHGue0OgILVEfbahsW4Vq6KX5CsxwSFhUnH6X7BfTgtNXCa41Qdyzn46tn2Y
X-Received: by 2002:a5d:6402:: with SMTP id z2mr15766599wru.7.1619908620819;
 Sat, 01 May 2021 15:37:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJydHkF1nFsD6v3ghTqvjA382j+7drkcbTObCLa6Zz57LeItnKKqwKxleO0Ej/I7nKecQq1eiQ==
X-Received: by 2002:a5d:6402:: with SMTP id z2mr15766570wru.7.1619908620603;
 Sat, 01 May 2021 15:37:00 -0700 (PDT)
Received: from localhost.localdomain
 (anancy-651-1-208-144.w109-217.abo.wanadoo.fr. [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id t206sm6797726wmb.11.2021.05.01.15.36.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 May 2021 15:37:00 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 04/10] qtest/arm-cpu-features: Use generic
 qtest_has_accel() to check for KVM
Date: Sun,  2 May 2021 00:36:32 +0200
Message-Id: <20210501223638.510712-5-philmd@redhat.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use the recently added generic qtest_has_accel() method to
check if KVM is available.

Suggested-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 tests/qtest/arm-cpu-features.c | 25 +------------------------
 1 file changed, 1 insertion(+), 24 deletions(-)

diff --git a/tests/qtest/arm-cpu-features.c b/tests/qtest/arm-cpu-features.c
index 8252b85bb85..7f4b2521277 100644
--- a/tests/qtest/arm-cpu-features.c
+++ b/tests/qtest/arm-cpu-features.c
@@ -26,21 +26,6 @@
                     "  'arguments': { 'type': 'full', "
 #define QUERY_TAIL  "}}"
 
-static bool kvm_enabled(QTestState *qts)
-{
-    QDict *resp, *qdict;
-    bool enabled;
-
-    resp = qtest_qmp(qts, "{ 'execute': 'query-kvm' }");
-    g_assert(qdict_haskey(resp, "return"));
-    qdict = qdict_get_qdict(resp, "return");
-    g_assert(qdict_haskey(qdict, "enabled"));
-    enabled = qdict_get_bool(qdict, "enabled");
-    qobject_unref(resp);
-
-    return enabled;
-}
-
 static QDict *do_query_no_props(QTestState *qts, const char *cpu_type)
 {
     return qtest_qmp(qts, QUERY_HEAD "'model': { 'name': %s }"
@@ -493,14 +478,6 @@ static void test_query_cpu_model_expansion_kvm(const void *data)
 
     qts = qtest_init(MACHINE_KVM "-cpu max");
 
-    /*
-     * These tests target the 'host' CPU type, so KVM must be enabled.
-     */
-    if (!kvm_enabled(qts)) {
-        qtest_quit(qts);
-        return;
-    }
-
     /* Enabling and disabling kvm-no-adjvtime should always work. */
     assert_has_feature_disabled(qts, "host", "kvm-no-adjvtime");
     assert_set_feature(qts, "host", "kvm-no-adjvtime", true);
@@ -624,7 +601,7 @@ int main(int argc, char **argv)
      * order avoid attempting to run an AArch32 QEMU with KVM on
      * AArch64 hosts. That won't work and isn't easy to detect.
      */
-    if (g_str_equal(qtest_get_arch(), "aarch64")) {
+    if (g_str_equal(qtest_get_arch(), "aarch64") && qtest_has_accel("kvm")) {
         qtest_add_data_func("/arm/kvm/query-cpu-model-expansion",
                             NULL, test_query_cpu_model_expansion_kvm);
     }
-- 
2.26.3


