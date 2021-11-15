Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B37DB4517FA
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 23:51:10 +0100 (CET)
Received: from localhost ([::1]:50410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmkof-0006pC-B7
	for lists+qemu-devel@lfdr.de; Mon, 15 Nov 2021 17:51:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mmklp-0004aW-9E
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 17:48:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22976)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mmkln-0004Lt-Hi
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 17:48:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637016491;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DWI+cx9qApZnpufdk+eCQH7BppqYrJuE51M3l3XNNKQ=;
 b=aXntrX6cBall804wueI+dj673coT8EObcbzUMFIwO8wMK7lfYL+VP00fYPvaRvzSyz7K7j
 xdAghadOgPPQy8ahk8TJkDGUJgif/Dm1A80oj9S4vpuao3/jdyaU2Cukh37VZBuw53ntRE
 n4z90POwWC2XB6jR2IhBUA7CJmt6+eI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-516-4fmQ9ygMOEC8KM5iYs6kJA-1; Mon, 15 Nov 2021 17:48:09 -0500
X-MC-Unique: 4fmQ9ygMOEC8KM5iYs6kJA-1
Received: by mail-wm1-f71.google.com with SMTP id
 b145-20020a1c8097000000b003335872db8dso5943519wmd.2
 for <qemu-devel@nongnu.org>; Mon, 15 Nov 2021 14:48:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DWI+cx9qApZnpufdk+eCQH7BppqYrJuE51M3l3XNNKQ=;
 b=SgOqray1cvHtZGAVwygzWtNXCR4k+mJwLCi2uU/mYfF/Opa57BP/+R91OfxW9KQCWB
 GBc5MAIf7Fn5eA70O4apjXYMoDvM91+WyUrGIyf0X9fvtxAdL9Dd+/QY10Upwi9eYqm/
 mxQ0sQZ/hkz8//LtXo3MafRkbxjoRCxSg4anwTuqBrplvaLQPyx1xN2aBcVH5EAr7etp
 9iH8HHIWBbKRwu226374JnpM5iyS12uhoYtRdbcjkZWgpbQLoHSu7k2cxU2iB2qhILrX
 SvpQOkkUDpK8tbA3PtwjizGAbQyzfbnd3uLnJZHtFshMqYFoEpMfvT94+AE0ijRbf9DE
 wVWw==
X-Gm-Message-State: AOAM532X4xoN0DRKwFpnR4t9L9RVJlorB6/qRpU9YIjuDoHlBJtaz5Cn
 NvzLMnGVqjDb6oEGJ+JJqCU2mlUDbvYpnMmQMV+zHB/oiboWuheuTh9dQRQOG7+i2JDu6Ot42Gc
 1VQwH3c7hMx8tipYJ5SG+8CPB5h93mamIEd6E0dG/m7eaWKKUj4eApXTSMVwRwxjg
X-Received: by 2002:a05:600c:4e8d:: with SMTP id
 f13mr64733396wmq.7.1637016488680; 
 Mon, 15 Nov 2021 14:48:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwjlDNL5VzZGyDjQWO+VAHonka3hCNfH6XY6wn8DcCY//dndRnpHeVt3FfeNIur+zaAopOpZg==
X-Received: by 2002:a05:600c:4e8d:: with SMTP id
 f13mr64733368wmq.7.1637016488472; 
 Mon, 15 Nov 2021 14:48:08 -0800 (PST)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 t8sm669534wmq.32.2021.11.15.14.48.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Nov 2021 14:48:08 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 1/3] tests/unit/test-smp-parse: Restore MachineClass fields
 after modifying
Date: Mon, 15 Nov 2021 23:48:00 +0100
Message-Id: <20211115224802.2602894-2-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211115224802.2602894-1-philmd@redhat.com>
References: <20211115224802.2602894-1-philmd@redhat.com>
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Andrew Jones <drjones@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There is a single MachineClass object, registered with
type_register_static(&smp_machine_info). Since the same
object is used multiple times (an MachineState object
is instantiated in both test_generic and test_with_dies),
we should restore its internal state after modifying for
the test purpose.

Reviewed-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Yanan Wang <wangyanan55@huawei.com>
Tested-by: Yanan Wang <wangyanan55@huawei.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20211115145900.2531865-2-philmd@redhat.com>
---
 tests/unit/test-smp-parse.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/tests/unit/test-smp-parse.c b/tests/unit/test-smp-parse.c
index cbe0c990494..47774c1ee2a 100644
--- a/tests/unit/test-smp-parse.c
+++ b/tests/unit/test-smp-parse.c
@@ -512,7 +512,7 @@ static void test_generic(void)
         smp_parse_test(ms, data, true);
     }
 
-    /* Reset the supported min CPUs and max CPUs */
+    /* Force invalid min CPUs and max CPUs */
     mc->min_cpus = 2;
     mc->max_cpus = 511;
 
@@ -523,6 +523,10 @@ static void test_generic(void)
         smp_parse_test(ms, data, false);
     }
 
+    /* Reset the supported min CPUs and max CPUs */
+    mc->min_cpus = MIN_CPUS;
+    mc->max_cpus = MAX_CPUS;
+
     object_unref(obj);
 }
 
@@ -536,6 +540,7 @@ static void test_with_dies(void)
     int i;
 
     smp_machine_class_init(mc);
+    /* Force the SMP compat properties */
     mc->smp_props.dies_supported = true;
 
     for (i = 0; i < ARRAY_SIZE(data_generic_valid); i++) {
@@ -575,6 +580,9 @@ static void test_with_dies(void)
         smp_parse_test(ms, data, false);
     }
 
+    /* Restore the SMP compat properties */
+    mc->smp_props.dies_supported = false;
+
     object_unref(obj);
 }
 
-- 
2.31.1


