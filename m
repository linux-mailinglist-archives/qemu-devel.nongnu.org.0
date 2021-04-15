Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EC063609E2
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 14:58:58 +0200 (CEST)
Received: from localhost ([::1]:57774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lX1aD-0003i5-7M
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 08:58:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lX1Z3-00038Y-3p
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 08:57:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40169)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lX1Z1-0006ND-Id
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 08:57:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618491463;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=guk+TFRH4H8npjA92ucehbcfrQY0sqYaSCHgw+fxV9U=;
 b=aiqXAY7Vtq0/DvytF+Cp8VvAXpOarbCIrv16omRbtSqIgaazQo5neQjdrvSlCxKRx0DThU
 7UrsLd3IjakOLlwLpL/JRevI9IAt+mkkeaaHZT6U2QjKE8AgGjiAXj76cihL7JexQMOb+r
 37aKpCJHojq2PP1N5TX9BeQIgaDB14U=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-488-Bq5fFmyIMyurX6S3hVMgFg-1; Thu, 15 Apr 2021 08:57:41 -0400
X-MC-Unique: Bq5fFmyIMyurX6S3hVMgFg-1
Received: by mail-wr1-f69.google.com with SMTP id
 91-20020adf92e40000b029010470a9ebc4so1646144wrn.14
 for <qemu-devel@nongnu.org>; Thu, 15 Apr 2021 05:57:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=guk+TFRH4H8npjA92ucehbcfrQY0sqYaSCHgw+fxV9U=;
 b=ftO1kgP0nuAw/ImbDtEQU9noP5MZCtHjSgHVdmLHaAxA92UYGobtPwbwNs/pCwtwNY
 szAzRJA0DZMyo5l57Iq+YyzdEPjCPwa7jasoMMZRyzg2mN0TnGOzTFwQswJYEpg3KFTJ
 bo6zf36t0UP2S+8XQAyrsrnN2KdFOZidqH8rcUfAPfPoDLYc4SF0yNFJ8aeSMzrAfhPI
 HJq+9AjqV1l4tI3jUDaj4sdJAPKAksA5CZTCsz6XYfFDDAbe4A9TgGKtCB0HKzZu+6fK
 iQPyEBr5ENBYLd6Jhhu7XlHHdUaE25TWasLZc/anZUTiEECtZDuSPnv4Hu0Uq+pgU2MM
 5rEg==
X-Gm-Message-State: AOAM533FI8iRSA0q4y54lIuBn/HzBc1EWMuu2kp2jjKDeZa8nIb21sR0
 Q1zuBmETdJ+9QuEQat/AA9MWSW+EohWfxdeUtMnZUbpRmJLJyzD2bUJFstxOPdm6qZX5LK3XeoB
 ++sSwv+7OttMuBSnFto/AuqSu3a4pMG9CiQHczKRX/o+JuNC8wJyX7/Xj91HyFOj7
X-Received: by 2002:a1c:ed0a:: with SMTP id l10mr3014255wmh.151.1618491459991; 
 Thu, 15 Apr 2021 05:57:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxHgK/B9xdBozvUa0Dz97seOiLaXYEXB8pLdaGBRX8bv4ipUgORSdQROblkAX1QksL+KxFXtQ==
X-Received: by 2002:a1c:ed0a:: with SMTP id l10mr3014231wmh.151.1618491459807; 
 Thu, 15 Apr 2021 05:57:39 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id 24sm3016453wmk.18.2021.04.15.05.57.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Apr 2021 05:57:39 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 7/6] qtest/arm-cpu-features: Use generic qtest_has_accel()
 to check for KVM
Date: Thu, 15 Apr 2021 14:57:37 +0200
Message-Id: <20210415125737.4064646-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210415122633.4054644-1-philmd@redhat.com>
References: <20210415122633.4054644-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Andrew Jones <drjones@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 qemu-arm@nongnu.org, Claudio Fontana <cfontana@suse.de>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use the recently added generic qtest_has_accel() method to
check if KVM is available.

Suggested-by: Claudio Fontana <cfontana@suse.de>
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


