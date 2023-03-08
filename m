Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00E896AFBDA
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 02:12:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZiMB-0004LP-6p; Tue, 07 Mar 2023 20:12:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZiM8-00041w-Oa
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 20:12:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZiM7-0001fS-34
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 20:12:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678237954;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HPL0VRVJ57Yfjl6d5EjiF2dYWygETGBKxIqXYP+XM24=;
 b=Dxh7KfnyXWU4jFXKB12trvjZ2i+5WtWQ4WJ69LiZQgSuwUCiT8rhhTKARRwhEDUqLx+SSS
 rlcwNhdpEkxVoJa6rX6/k5VG7Irv9mi648naWxFQCviquRWKIqLs6qxyJRmIs8WuFbcr9H
 u0EDc6vaEOaEUc03QbsUyuIOE8Bgb9s=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-25-QLuS06YgOIOOqY8DYU7JpQ-1; Tue, 07 Mar 2023 20:12:33 -0500
X-MC-Unique: QLuS06YgOIOOqY8DYU7JpQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 ev6-20020a056402540600b004bc2358ac04so21652541edb.21
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 17:12:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678237951;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HPL0VRVJ57Yfjl6d5EjiF2dYWygETGBKxIqXYP+XM24=;
 b=H7AUktakltepEPqjTDeYbm7vhBd7b/8Q7uTypmkvIOQeA5o/oD0cIvaR39Mo1n9dl9
 ZxIklOMtOVk4h/UomzNtSOHMHGGSelGrnazBNfHMeAX8yAJ9rzlDfr7IZkYiqWOgMA8d
 tGH7RfBfH/S9AL2rxluXCseYy6vfTJCbHb09tMLrwRzCRxoTaE3hWWCcqPeOnLq+DGcq
 aYN8MEDgIDhGaB67J0Y0hTMo9zjWSPOVYW5t79JS0FAKtylvNtnxje+F6Y+//NsSNnON
 dddC4Vlzz7hswv5rZeIjBSiThVRGQXyga0OW3224BN3ml+wEhJ7/XFMHKPoYIC3x6ztx
 6FrA==
X-Gm-Message-State: AO0yUKVvoVbuXCc/WIF1JK2LJCUL1OxcffpiDCs5lYAZ1sIgnrwy95AH
 Dm8Aprgjo4i4pKoRH1wFaV/bU9WH6YKXJrjICnB1fvcqHjaAFtAUhfB2xKI1yz6v5LGx7pUPg9q
 qQvFJIfLviHVPrQ21G+s8DuzPRC8YSgP0+S0Oz69QNvw1W4zJrux/QmokO9DSr7aRUUD9
X-Received: by 2002:aa7:cf0d:0:b0:4ae:eae1:1109 with SMTP id
 a13-20020aa7cf0d000000b004aeeae11109mr14247676edy.2.1678237951642; 
 Tue, 07 Mar 2023 17:12:31 -0800 (PST)
X-Google-Smtp-Source: AK7set9qzf8RFpW7Ecqw6uszxP8HA7Yiixt2TrtyMvO9F9Ta+rxFdZfMajqBf9x7/c/ZrnGSjrzj3g==
X-Received: by 2002:aa7:cf0d:0:b0:4ae:eae1:1109 with SMTP id
 a13-20020aa7cf0d000000b004aeeae11109mr14247660edy.2.1678237951415; 
 Tue, 07 Mar 2023 17:12:31 -0800 (PST)
Received: from redhat.com ([2.52.138.216]) by smtp.gmail.com with ESMTPSA id
 v5-20020a50d085000000b004af5968cb3bsm7466370edd.17.2023.03.07.17.12.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 17:12:30 -0800 (PST)
Date: Tue, 7 Mar 2023 20:12:28 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PULL 33/73] x86: pcihp: fix missing PCNT callchain when
 intermediate root-port has 'hotplug=off' set
Message-ID: <11215a349e39353f272256a72ed0fd4affe5fc78.1678237635.git.mst@redhat.com>
References: <cover.1678237635.git.mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1678237635.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Igor Mammedov <imammedo@redhat.com>

Beside BSEL numbers change (due to 2 extra root-ports in q35/miltibridge test),
following change is expected:

       Scope (\_SB.PCI0)
       {
  ...
  +        Scope (S50)
  +        {
  +            Scope (S00)
  +            {
  +                Method (PCNT, 0, NotSerialized)
  +                {
  +                    BNUM = Zero
  +                    DVNT (PCIU, One)
  +                    DVNT (PCID, 0x03)
  +                }
  +            }
  +
  +            Method (PCNT, 0, NotSerialized)
  +            {
  +                ^S00.PCNT
  +            }
  +        }
  ...
           Method (PCNT, 0, NotSerialized)
           {
  +            ^S50.PCNT ()
               ^S13.PCNT ()
               ^S12.PCNT ()
               ^S11.PCNT ()

I practice [1] hasn't broke anything since on hardware side we unset
hotplug_handler on such intermediate port => hotplug behind it has
not been properly wired and as result not worked.

1)
Fixes: ddab4d3fae4e8 ("pcihp: compose PCNT callchain right before its user _GPE._E01")
Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20230302161543.286002-8-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/i386/acpi-build.c | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index b19fb4259e..c691104d47 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -517,16 +517,24 @@ static bool build_append_notfication_callback(Aml *parent_scope,
     PCIBus *sec;
     QObject *bsel;
     int nr_notifiers = 0;
+    GQueue *pcnt_bus_list = g_queue_new();
 
     QLIST_FOREACH(sec, &bus->child, sibling) {
         Aml *br_scope = aml_scope("S%.02X", sec->parent_dev->devfn);
-        if (pci_bus_is_root(sec) ||
-            !object_property_find(OBJECT(sec), ACPI_PCIHP_PROP_BSEL)) {
+        if (pci_bus_is_root(sec)) {
             continue;
         }
         nr_notifiers = nr_notifiers +
                        build_append_notfication_callback(br_scope, sec);
-        aml_append(parent_scope, br_scope);
+        /*
+         * add new child scope to parent
+         * and keep track of bus that have PCNT,
+         * bus list is used later to call children PCNTs from this level PCNT
+         */
+        if (nr_notifiers) {
+            g_queue_push_tail(pcnt_bus_list, sec);
+            aml_append(parent_scope, br_scope);
+        }
     }
 
     /*
@@ -550,17 +558,13 @@ static bool build_append_notfication_callback(Aml *parent_scope,
     }
 
     /* Notify about child bus events in any case */
-    QLIST_FOREACH(sec, &bus->child, sibling) {
-        if (pci_bus_is_root(sec) ||
-            !object_property_find(OBJECT(sec), ACPI_PCIHP_PROP_BSEL)) {
-            continue;
-        }
-
+    while ((sec = g_queue_pop_head(pcnt_bus_list))) {
         aml_append(method, aml_name("^S%.02X.PCNT", sec->parent_dev->devfn));
     }
 
     aml_append(parent_scope, method);
     qobject_unref(bsel);
+    g_queue_free(pcnt_bus_list);
     return !!nr_notifiers;
 }
 
-- 
MST


