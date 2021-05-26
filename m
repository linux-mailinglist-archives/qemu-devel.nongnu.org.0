Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE8C391DBC
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 19:20:22 +0200 (CEST)
Received: from localhost ([::1]:49350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llxCf-0006GV-Ij
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 13:20:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1llwyO-0007GG-3k
 for qemu-devel@nongnu.org; Wed, 26 May 2021 13:05:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49490)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1llwyM-0004MA-DH
 for qemu-devel@nongnu.org; Wed, 26 May 2021 13:05:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622048733;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YUwsAY7j/ecV1UbnP3UC7xEIyUmH3VJq/XNOQQ4OyUg=;
 b=hU4kVtdhxemy5+AJKTl9VdpBwNI/+i5tMzOuAnjksa9SQ/kHKLZWZZHDtoZkCopxyfAkr9
 KblYdrjIur139aPKAXOYtZNU5IuYzGYe2mm7AYrq3n8lW1vH42w20pVp5uFjd18l1v6WYm
 iwgDOQjv4IjNq3ZViEzG9gvFBxsMHw4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-288-_3a8yn91NYCk9mmvqKbKSA-1; Wed, 26 May 2021 13:05:31 -0400
X-MC-Unique: _3a8yn91NYCk9mmvqKbKSA-1
Received: by mail-wm1-f69.google.com with SMTP id
 l18-20020a05600c4f12b02901921c0f2098so763479wmq.0
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 10:05:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YUwsAY7j/ecV1UbnP3UC7xEIyUmH3VJq/XNOQQ4OyUg=;
 b=lgcgbcx381RhPJSD1h1aHNZyDdDXhT+OTTLtWyLcHIO8lWiNU/y1BPVBthNiRffLp4
 QYJMBHN88lRisIF9M5VFTYx2IY4zWt/2JyWb86K9B35WKRbZefUE/IYxdZrrtBelnaN3
 M/qHzg2zfYfsC6Md/MTNtUFr9v+AbZKdZnl58kko+rJRRsUBeDePMFGVfCzEdLIOj6rZ
 4CxyAbfwTMPyJss76Tb9+y2/XJJ7lI0hgCFab5ifOtv8pgWRWKoPUEYOlpKzZQT99cH5
 XQYbCXac/Kf74l0RdsPog5K9deDK6DG3nVmmMg2AftOqBnlRxtxEVKybOq57j46ItUfE
 xYbw==
X-Gm-Message-State: AOAM533mcABzQGmMx46FaaJglA2+MtGZH2p7cGWeSxkKcCuKJSgDbU8g
 V7RXCdLETxepNaP/HH7mjg7SdTZBZdYBVe4RapYWp5giCiIEnAXPdRrnGIPXSa3E+ao/E5D8xyR
 poov/bUHQZFSo8a9om8W10wNarjgWptMvv9lCt19dTCScLAfCc2eLUWbYJpkxEzyD
X-Received: by 2002:a5d:6c6f:: with SMTP id r15mr33128029wrz.79.1622048729836; 
 Wed, 26 May 2021 10:05:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwHIsIzHp16SXARV3XE2hkFnV3zVOvyLUW1bVnOiLVwgyKcmU849alrSDO7ZnsuXfLWBeZa4w==
X-Received: by 2002:a5d:6c6f:: with SMTP id r15mr33127995wrz.79.1622048729660; 
 Wed, 26 May 2021 10:05:29 -0700 (PDT)
Received: from localhost.localdomain (64.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.64])
 by smtp.gmail.com with ESMTPSA id t14sm6719869wmq.16.2021.05.26.10.05.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 10:05:29 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 05/12] qtest/arm-cpu-features: Restrict
 sve_tests_sve_off_kvm test to KVM
Date: Wed, 26 May 2021 19:04:25 +0200
Message-Id: <20210526170432.343588-6-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210526170432.343588-1-philmd@redhat.com>
References: <20210526170432.343588-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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
 Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The sve_tests_sve_off_kvm() test is KVM specific.
Only run it if KVM is available.

Suggested-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
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


