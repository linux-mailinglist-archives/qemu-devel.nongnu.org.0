Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16DE64507DD
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 16:08:18 +0100 (CET)
Received: from localhost ([::1]:58880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmdai-0005DR-Ue
	for lists+qemu-devel@lfdr.de; Mon, 15 Nov 2021 10:08:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mmdSp-0008DJ-JA
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 10:00:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45661)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mmdSn-0000D2-G5
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 10:00:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636988404;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BZpI0ahGf4kduGjb9YumMUGF6LmoFzxgBcNi4uwMZn8=;
 b=JCerl6pt8iYl6uMla7DlOYoZ1NJJAMGK4jFLeHE6ZW6c0j+jNQ02ncI/G2TelQUmXxxeU0
 NCLA0R2rrI5cIE3ogOv6nI6K9D0ffSSlV9S5MXc2MkITeNJ4Brxl+8jhS+4fCM8xF+on1i
 NcIJHd/3OIpHyaG702rsUFDa0NBcrZI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-487-YCQYesshMCSuizJDUtjyyA-1; Mon, 15 Nov 2021 09:59:20 -0500
X-MC-Unique: YCQYesshMCSuizJDUtjyyA-1
Received: by mail-wm1-f71.google.com with SMTP id
 205-20020a1c00d6000000b003335d1384f1so6799547wma.3
 for <qemu-devel@nongnu.org>; Mon, 15 Nov 2021 06:59:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BZpI0ahGf4kduGjb9YumMUGF6LmoFzxgBcNi4uwMZn8=;
 b=xX/OUVuoEgGsAFDzxg+fMQQRj7nYMsNLsMQuELLWVBagmkIllfbOdsstfHmIoCCI3u
 dOA/q6sW0JJItaLtUGSt97y9LGOthG402AW17YuAP/AWoTquHUmF9RhzTenTiJxoS7Ut
 Ev0iNi3e5OkUaVHB3wWL7b+7AYYNlv1/fvIyHBycjdRTEuW4QGxU/qNZRq+s186j9v8E
 p80svOMl2+aGX+CYK+8860peqN1gUXWKaZefqbGpi3tZ4QYat3bL3rdFlRwmchzhUb0y
 x4VegFsSVl+J9b/fa4UnF1TWSIh6dmGOUr97WrHi5+xu4hNyemOFXKUbzjU1Ls7k/Is8
 k2Fw==
X-Gm-Message-State: AOAM53329XC7QCNv58pbGmtpIOS4Xe1zotdXOtpS41lAEabQ9kRR4iFG
 du8Tih6cmbOzIzYxZs9GGNsVQvtzb0rYYkABPi8DDZvu4fyzWnaXR3HnR2oP6H4NayDoPK9d3Iq
 sVKkj7V9kdRTImMb98vDpI0nYruA7NhwwGU7/Zgs/sLF/8CpMqJIBF9Kp3Y6iqlC1
X-Received: by 2002:a7b:ce16:: with SMTP id m22mr42101243wmc.39.1636988359552; 
 Mon, 15 Nov 2021 06:59:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwmV7M5DT5RuonHLIfQoQVMZNVgK795Dk22eQTXVP5DyttGto4TohsnhEW3oETy41PCeUw0HA==
X-Received: by 2002:a7b:ce16:: with SMTP id m22mr42101213wmc.39.1636988359392; 
 Mon, 15 Nov 2021 06:59:19 -0800 (PST)
Received: from x1w.redhat.com (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id h15sm14551985wml.9.2021.11.15.06.59.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Nov 2021 06:59:18 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-7.0 v4 04/11] tests/unit/test-smp-parse: Pass machine type
 as argument to tests
Date: Mon, 15 Nov 2021 15:58:53 +0100
Message-Id: <20211115145900.2531865-5-philmd@redhat.com>
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
 Markus Armbruster <armbru@redhat.com>, Yanan Wang <wangyanan55@huawei.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use g_test_add_data_func() instead of g_test_add_func() so we can
pass the machine type to the tests (we will soon have different
machine types).

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 tests/unit/test-smp-parse.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/tests/unit/test-smp-parse.c b/tests/unit/test-smp-parse.c
index b02450e25a3..37c6b4981db 100644
--- a/tests/unit/test-smp-parse.c
+++ b/tests/unit/test-smp-parse.c
@@ -487,9 +487,10 @@ static void machine_base_class_init(ObjectClass *oc, void *data)
     mc->name = g_strdup(SMP_MACHINE_NAME);
 }
 
-static void test_generic(void)
+static void test_generic(const void *opaque)
 {
-    Object *obj = object_new(TYPE_MACHINE);
+    const char *machine_type = opaque;
+    Object *obj = object_new(machine_type);
     MachineState *ms = MACHINE(obj);
     MachineClass *mc = MACHINE_GET_CLASS(obj);
     SMPTestData *data = &(SMPTestData){{ }};
@@ -525,9 +526,10 @@ static void test_generic(void)
     object_unref(obj);
 }
 
-static void test_with_dies(void)
+static void test_with_dies(const void *opaque)
 {
-    Object *obj = object_new(TYPE_MACHINE);
+    const char *machine_type = opaque;
+    Object *obj = object_new(machine_type);
     MachineState *ms = MACHINE(obj);
     MachineClass *mc = MACHINE_GET_CLASS(obj);
     SMPTestData *data = &(SMPTestData){{ }};
@@ -599,8 +601,12 @@ int main(int argc, char *argv[])
 
     g_test_init(&argc, &argv, NULL);
 
-    g_test_add_func("/test-smp-parse/generic", test_generic);
-    g_test_add_func("/test-smp-parse/with_dies", test_with_dies);
+    g_test_add_data_func("/test-smp-parse/generic",
+                         TYPE_MACHINE,
+                         test_generic);
+    g_test_add_data_func("/test-smp-parse/with_dies",
+                         TYPE_MACHINE,
+                         test_with_dies);
 
     g_test_run();
 
-- 
2.31.1


