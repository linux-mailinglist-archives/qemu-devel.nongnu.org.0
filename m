Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EBFF44D4B6
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 11:07:32 +0100 (CET)
Received: from localhost ([::1]:42746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ml6zT-0004N7-Dn
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 05:07:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ml6w9-0006kf-2N
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 05:04:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45492)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ml6w7-00010G-09
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 05:04:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636625040;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UAQJZocas4bPTljBjE8/4eZncm0k7SsFi5AABg6C/Aw=;
 b=XXNqvsHtQ9xNOvoPKZ0ZfKhs6w2BWEA412aZVl3hArOjwZTQSDpZHtmHHTN0n9f0VpowU/
 CKt6Zrx54NS26Fx2tAKbAl0XBJLiIZyeMwCQSJrmKVTlmbvskO/VUWz67ExxmeS4sRQ0KK
 ZxyZ9r5V7MWPeVbE2RYrYxIpvCbkOHE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-325-8aFlnMAEP1aqk6MAa2vkAg-1; Thu, 11 Nov 2021 05:03:59 -0500
X-MC-Unique: 8aFlnMAEP1aqk6MAa2vkAg-1
Received: by mail-wm1-f72.google.com with SMTP id
 k25-20020a05600c1c9900b00332f798ba1dso4549250wms.4
 for <qemu-devel@nongnu.org>; Thu, 11 Nov 2021 02:03:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UAQJZocas4bPTljBjE8/4eZncm0k7SsFi5AABg6C/Aw=;
 b=kzd19IxbXeug0kH93uuWfZa0eapdcgvZvwOr0HoPlOaFLFylgvaLdMmgMYw5TuDksi
 vjcseCsXTkx7YcGmqYhqvEC4QmwVzDdp7VjnKULDvdRJgmrgobMtSqQbglnW0hDOFEHX
 PW4ExrLNQLgW1hLR1VmuIWEr+ymqvTXa24p1SOgFway4C8Bte3KgcDpdbwp11mnGA3ey
 W+7+/yyNJY3IuEx+eDBXQqrJ4Y1qrN9k0H/ZoFOGCjqlUsoEGUja2kJQ1xqvcMbzgmoD
 1wiMIFtQ8nbaC6XaCUzN/lCNU1kHVIdUHGII7zzdRIziaVCRpTvI6XCMSUzRG183Qtxz
 y9kg==
X-Gm-Message-State: AOAM533xDQRjeSfL1AW6jiVnY5wtI9QdkQHTP4322M+BNFKP4P6PQ2GC
 rNQTOXGfFOBLfFSGxzBPT6M59aoI9NmnlW+MzVp8I3ITMWs6gQ7fQHEOtoom4aV+Zi4fibXo+WI
 zb4vLG5P7NWZr48h8bM9j9MsfjXcps+I7oDC2zK+Cc5hXtYAaqSruLhjDdmPDEnqF
X-Received: by 2002:a1c:287:: with SMTP id 129mr9508556wmc.49.1636625037502;
 Thu, 11 Nov 2021 02:03:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz57akgQK3IVeD5RUy1LWIKehQr3tvgNoTNXgmxUZBN1/3RmGFwrtdZ/cQ2MGMJyEUsbCPa2g==
X-Received: by 2002:a1c:287:: with SMTP id 129mr9508521wmc.49.1636625037246;
 Thu, 11 Nov 2021 02:03:57 -0800 (PST)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 q18sm8600902wmc.7.2021.11.11.02.03.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Nov 2021 02:03:56 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-6.2 v3 1/6] tests/unit/test-smp-parse: Restore
 MachineClass fields after modifying
Date: Thu, 11 Nov 2021 11:03:46 +0100
Message-Id: <20211111100351.2153662-2-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211111100351.2153662-1-philmd@redhat.com>
References: <20211111100351.2153662-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Andrew Jones <drjones@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Markus Armbruster <armbru@redhat.com>,
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

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 tests/unit/test-smp-parse.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tests/unit/test-smp-parse.c b/tests/unit/test-smp-parse.c
index cbe0c990494..bd11fbe91de 100644
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
 
-- 
2.31.1


