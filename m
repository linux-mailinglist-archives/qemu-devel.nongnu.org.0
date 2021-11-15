Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C77A045081C
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 16:18:26 +0100 (CET)
Received: from localhost ([::1]:59940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmdkX-0008QT-Ue
	for lists+qemu-devel@lfdr.de; Mon, 15 Nov 2021 10:18:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mmdRx-000756-5Z
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 09:59:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45588)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mmdRt-0008TL-9Y
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 09:59:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636988348;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=caAjapNdQ6O6O98D29tR+rRlgePlecp/3vyOxlktzrU=;
 b=VBiE+P32t719oMDwsu2Mf8buyyWvtpQib+Ojzy1EZHfUTUQahiqkuhAi/K2EabAupiCpSE
 BhJaeNPyNcAEPQSqNdKTbF99A9ezxOwxA3O8o9ET9S4JMUIlGeBW5Phx2wytA1ROPCJbR1
 +WElj9FbIRBDDDbMy38XInvDMYNX/YM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-244-S2fc4UsIPtWmV0q0i60m_Q-1; Mon, 15 Nov 2021 09:59:07 -0500
X-MC-Unique: S2fc4UsIPtWmV0q0i60m_Q-1
Received: by mail-wm1-f69.google.com with SMTP id
 144-20020a1c0496000000b003305ac0e03aso9740358wme.8
 for <qemu-devel@nongnu.org>; Mon, 15 Nov 2021 06:59:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=caAjapNdQ6O6O98D29tR+rRlgePlecp/3vyOxlktzrU=;
 b=sngz2Oy0GM9xIVN7bQNCB0JcA/uOU8sEQ7dE0zDLvDPUL706dz/sQFxzD4+u8MGlfN
 K7aGNdvXRS0lADV9lPgtAHNdelMuec93o1tlUfzIkasn53uf+czX6kmcGGwixuKGIzA9
 8gBNnUhFtkc3bE5otT2vOZUNEI0ep7Nf4FNbEZ9YkArqQZUSUnqGnQTTHXVad7HFPnrD
 rnle7swsnwAzgAXx4+ThxIFgG1MD36tfATRXQj6nWHGKMn2ReJyGIMoCE5ZiCEj0Xezq
 FVt3mCW/eiNZ0BuFwsAA+qTepg5JWfEsHrxEG6dwO5u3ITc/NC732WI9yLQ8vYXxGprZ
 QVyQ==
X-Gm-Message-State: AOAM530RD/NagsszIH5fbv88KBvPZYajAoNn9+Ws+CjHjUP3EydrL+ME
 VXCVoRuGF34EfG4dzxWNZIZzhXpBj8YvwUElTNpdhJ90KI2dvM6lZsjGcuoXrz2S15gKe0773CU
 BTyDxF0f9npRJw4zip4gLQlQoGQTmyG0lDO0JZym8Qtxd54O5pAVZNUsJ4wGmKjOj
X-Received: by 2002:a1c:1b15:: with SMTP id b21mr42113598wmb.174.1636988346242; 
 Mon, 15 Nov 2021 06:59:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz0oa/CpUTWaggeGCmCOAqU5B8Z8RhJ/2ib4uzilsK0l/Wf4C9bHkOkX2oqAZOGufh4YElNHw==
X-Received: by 2002:a1c:1b15:: with SMTP id b21mr42113554wmb.174.1636988346010; 
 Mon, 15 Nov 2021 06:59:06 -0800 (PST)
Received: from x1w.redhat.com (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id f7sm16700545wri.74.2021.11.15.06.59.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Nov 2021 06:59:05 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-6.2 v4 01/11] tests/unit/test-smp-parse: Restore
 MachineClass fields after modifying
Date: Mon, 15 Nov 2021 15:58:50 +0100
Message-Id: <20211115145900.2531865-2-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211115145900.2531865-1-philmd@redhat.com>
References: <20211115145900.2531865-1-philmd@redhat.com>
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
 Markus Armbruster <armbru@redhat.com>, Yanan Wang <wangyanan55@huawei.com>,
 Thomas Huth <thuth@redhat.com>,
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


