Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81E344507C7
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 16:02:55 +0100 (CET)
Received: from localhost ([::1]:41984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmdVW-0002EN-MC
	for lists+qemu-devel@lfdr.de; Mon, 15 Nov 2021 10:02:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mmdSP-0007tR-Qo
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 09:59:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26495)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mmdSB-0008WB-FO
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 09:59:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636988366;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gF1s0KbAL9b83AB6/JlbAHqywgqU7lOR4NhlFP3KFgg=;
 b=cy2OEnuTRuwnbJtQVSpL1cS2O8A8lJEdoXNuCVUaBHP65zobighyd7hhx1BtbVO3azEgyV
 2EqfxHMd55gN0IZhuPDZUrEpuPyhNEuL27bX8B8Fvu/yequjb2XocaP9QMnSX3G7S2JKcR
 U5ZA2Bdjkv666n6Jp2f1RutAvPVsEd4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-282-hD989GA5M5S2vhzoSIfTbw-1; Mon, 15 Nov 2021 09:59:25 -0500
X-MC-Unique: hD989GA5M5S2vhzoSIfTbw-1
Received: by mail-wr1-f70.google.com with SMTP id
 q7-20020adff507000000b0017d160d35a8so3670391wro.4
 for <qemu-devel@nongnu.org>; Mon, 15 Nov 2021 06:59:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gF1s0KbAL9b83AB6/JlbAHqywgqU7lOR4NhlFP3KFgg=;
 b=bWoK5f/Pqzv25JI+nQW4NZWhwDrSdB0tIlOFBAdaMkLQPK63mMrX1evz5kSD2hL8bS
 QPshpjUHNgQYUHBMU3dJQ2M5U9zmS4hf7uWYhHlT4OsGeBQJ1Y1QOrw5dg2W24NoXHN3
 VnOY4a20UdKw8gYYYVpnu4pj6inKbqJHcoHEY/1e5+ej77KwhlRbICEVF8d9wA/NEdOh
 xO9pZDm1Yln4IsxiMpVZPhaXyvy/ceaRzd4B/cS4Fb0/O+CAj5UoI93bZQ2X8uPpwnU4
 YX3nY/PzauN66NDzG/zawKt4ZVVoUUGSoxh1WDF7U8TQd5FudBusSBehysXAwK0QCiPe
 e47w==
X-Gm-Message-State: AOAM532usKiTaNFmjFPp3r+ACsRu+78lRE4AxoiqW4LGip1vGcWyU0rP
 u2paUE8rPYuOsqWpnEi61Gufz0QZ7WktcnK5NWsWBJp8PtGmZoBjruAPRQr0xA7JoMgllyceCid
 ULghKepI0Xa1TLsYCKN3pKV3u+GIhZdgYKZZdWqzPRPRpTEWoaw61HQW9wIMp2U1G
X-Received: by 2002:a05:600c:3553:: with SMTP id
 i19mr59753383wmq.97.1636988364093; 
 Mon, 15 Nov 2021 06:59:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyBiHO29Vm+h+jU24GT/dqqfeksL0Vw9veynBbFRs2Rn1r5bPrUU8uyakzy04flTYbN4S4oew==
X-Received: by 2002:a05:600c:3553:: with SMTP id
 i19mr59753356wmq.97.1636988363875; 
 Mon, 15 Nov 2021 06:59:23 -0800 (PST)
Received: from x1w.redhat.com (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id d15sm20289354wri.50.2021.11.15.06.59.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Nov 2021 06:59:23 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-7.0 v4 05/11] tests/unit/test-smp-parse: Split the
 'generic' test in valid / invalid
Date: Mon, 15 Nov 2021 15:58:54 +0100
Message-Id: <20211115145900.2531865-6-philmd@redhat.com>
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
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Andrew Jones <drjones@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Yanan Wang <wangyanan55@huawei.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Split the 'generic' test in two tests: 'valid' and 'invalid'.
This will allow us to remove the hack which modifies the
MachineClass internal state.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 tests/unit/test-smp-parse.c | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/tests/unit/test-smp-parse.c b/tests/unit/test-smp-parse.c
index 37c6b4981db..e27aedad354 100644
--- a/tests/unit/test-smp-parse.c
+++ b/tests/unit/test-smp-parse.c
@@ -487,7 +487,7 @@ static void machine_base_class_init(ObjectClass *oc, void *data)
     mc->name = g_strdup(SMP_MACHINE_NAME);
 }
 
-static void test_generic(const void *opaque)
+static void test_generic_valid(const void *opaque)
 {
     const char *machine_type = opaque;
     Object *obj = object_new(machine_type);
@@ -508,6 +508,19 @@ static void test_generic(const void *opaque)
         smp_parse_test(ms, data, true);
     }
 
+    object_unref(obj);
+}
+
+static void test_generic_invalid(const void *opaque)
+{
+    const char *machine_type = opaque;
+    Object *obj = object_new(machine_type);
+    MachineState *ms = MACHINE(obj);
+    MachineClass *mc = MACHINE_GET_CLASS(obj);
+    SMPTestData *data = &(SMPTestData){};
+    int i;
+
+
     /* Force invalid min CPUs and max CPUs */
     mc->min_cpus = 2;
     mc->max_cpus = 511;
@@ -601,9 +614,12 @@ int main(int argc, char *argv[])
 
     g_test_init(&argc, &argv, NULL);
 
-    g_test_add_data_func("/test-smp-parse/generic",
+    g_test_add_data_func("/test-smp-parse/generic/valid",
                          TYPE_MACHINE,
-                         test_generic);
+                         test_generic_valid);
+    g_test_add_data_func("/test-smp-parse/generic/invalid",
+                         TYPE_MACHINE,
+                         test_generic_invalid);
     g_test_add_data_func("/test-smp-parse/with_dies",
                          TYPE_MACHINE,
                          test_with_dies);
-- 
2.31.1


