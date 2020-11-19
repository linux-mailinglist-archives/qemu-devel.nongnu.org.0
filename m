Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E962B9AA3
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 19:30:59 +0100 (CET)
Received: from localhost ([::1]:48036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfohu-00032p-MK
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 13:30:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <priyankar.jain@nutanix.com>)
 id 1kfogP-00026S-Ba
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 13:29:25 -0500
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12]:61734)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <priyankar.jain@nutanix.com>)
 id 1kfogL-0004mP-40
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 13:29:24 -0500
Received: from pps.filterd (m0127842.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0AJIC7n1002841; Thu, 19 Nov 2020 10:29:17 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : content-type : mime-version;
 s=proofpoint20171006; bh=ZBfJy5MUv8jWgfQAjxUBO80e6BF2i1KNPdvxXI3wahw=;
 b=eE8lMDJS0jlVu0WCv066qjoE6nwBiaU3xr0VYmAZ2bN+gvnQtTeOoQjqZ2lS1JnqS4t6
 l32BOkzuOrv836tl773xJUEmmmDXtVDywuMwenX4CFdvuiRou5hsMMw2rgp5Eud0L4hs
 WVze5gKt5SpRIEtFhAS0lyV7nkdFf8XdDVgQlQKk4AZcwkOaYT/rm0gRFHt+9UwjKqgx
 zl6MVn12PXfBfkqKsfouzRN3J3PphneVciomn33l4KHaVCKld5euTSWIDi/Imz6XEqA/
 +HZ9kjWLSW4XWtNTGFAqSawL4d3NtpzFINAGeTR6VMhtdN4gYDvgi0ZNyvs0aou+D/a3 4A== 
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2175.outbound.protection.outlook.com [104.47.58.175])
 by mx0b-002c1b01.pphosted.com with ESMTP id 34tfembsr5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Nov 2020 10:29:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gya+7ULFlyjrZ7s3ThJbYDIWbAlFq7gWT8aBz68PPC7UmuCCkT9GrMF7QTHUPyoV+YH7Gvgv7sfjIs2If/MMrlScm2zzeYjtgn2FD5/xBFyaqYYQDoJ/B/eSGLj33V6jglmINgwXxWOOOZaHIu0/p53qJ2915IkVPpE5yGyQm89cLKFt0BZuobY3emAPoXELp0cXLxVXM5Kn9latiEI06J3o/jmzByaFqN5PhH6SNIhFp131MLeGCzW+UlfsfSa90qbkCvyTvaduQIB5PK3Z8Ty/IYYQkIrvfuh/5wVD8VeX1VhLBFP3zQKuSB62GGH3J9xkOwL1oQ8bhtbHldp64w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZBfJy5MUv8jWgfQAjxUBO80e6BF2i1KNPdvxXI3wahw=;
 b=Io7s7FlbvOkh44s4KGf6Xt5ljuRs/POJTqWNG/fTleplkOxKcC9ss5aEOGuTiytfVqZxF9FXmUgfLyBeXW1jnu0QUwbvOWdHMioXYcU2R1Iv+517iXJ3kGLzQ4iuJIEm6HzslrxMCfxf1F5+eCjHAZq9aCRhQ2VKH8OzO3ql2Rvcw+eXZRz0faUyMeu9n8koJSOghPHfEsDsMcnva+DIzDBgNcudbTbSTt6EfG+TFx1otVmfznSCIbuIuHJFx8uL4VkiYbN+gB8B0F+21PG1bI1kqZPQNDX+hBpKEkHdoZF5xoSiWsZO4c6mAxTI8juUokTBiG9kOGo39KDSLIyw7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=nutanix.com;
Received: from SN1PR02MB3822.namprd02.prod.outlook.com (2603:10b6:802:31::32)
 by SN6PR02MB5263.namprd02.prod.outlook.com (2603:10b6:805:70::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.28; Thu, 19 Nov
 2020 18:29:12 +0000
Received: from SN1PR02MB3822.namprd02.prod.outlook.com
 ([fe80::50ff:8f29:a50d:b815]) by SN1PR02MB3822.namprd02.prod.outlook.com
 ([fe80::50ff:8f29:a50d:b815%7]) with mapi id 15.20.3589.022; Thu, 19 Nov 2020
 18:29:12 +0000
From: Priyankar Jain <priyankar.jain@nutanix.com>
To: qemu-devel@nongnu.org
Subject: [RFC] dbus-vmstate: Connect to the dbus only during the migration
 phase
Date: Thu, 19 Nov 2020 18:28:55 +0000
Message-Id: <1605810535-51254-1-git-send-email-priyankar.jain@nutanix.com>
X-Mailer: git-send-email 1.8.3.1
Content-Type: text/plain
X-Originating-IP: [192.146.154.242]
X-ClientProxiedBy: BY3PR05CA0018.namprd05.prod.outlook.com
 (2603:10b6:a03:254::23) To SN1PR02MB3822.namprd02.prod.outlook.com
 (2603:10b6:802:31::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from priyankar-jain.dev.nutanix.com (192.146.154.242) by
 BY3PR05CA0018.namprd05.prod.outlook.com (2603:10b6:a03:254::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.17 via Frontend
 Transport; Thu, 19 Nov 2020 18:29:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ee193236-b3be-489a-9329-08d88cb9031e
X-MS-TrafficTypeDiagnostic: SN6PR02MB5263:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR02MB5263B87BB3166C2B7C72E5CA83E00@SN6PR02MB5263.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
X-MS-Oob-TLC-OOBClassifiers: OLM:1332;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: k4mrEUqDsK8pNMemJf2qfrW3WMLkubhwm5nM4ZoN97GjOweF+0qGriaBLeOP/9YGSegZ4ewlQwxjwgmrIBQGdY7srGNrd6GTC5Z1glIOVRHGy7ga/O6zyoEpeKahKdMMkQTY2uz4rsw3TTNL+6knvTjru/tG4frihrx7+gICnsYHno4luXgH4ZDzn1KBkMIyW9DTtgKjnFUvOWyGWD2EPbLiTLd6ttYQThsrTVenTEw/cxhNsU5u4veDD2piH1PmiHSqHlJm6bGuGoaKhedH3zMxDaX4bjdPgUoty7M0p/PawFpz6OWD3aVXX0igcO25XjD4XOX2rX4sdQhQUTcCqQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN1PR02MB3822.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(396003)(346002)(39860400002)(376002)(136003)(186003)(16526019)(6486002)(8936002)(5660300002)(44832011)(86362001)(2906002)(7696005)(52116002)(316002)(54906003)(478600001)(36756003)(6666004)(4326008)(83380400001)(2616005)(6916009)(66946007)(8676002)(26005)(66476007)(66556008)(956004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: 78PCpPIZh8yg+/+louJMuOivQVGjhdWeRtw8Iu3FTpfU7oI1oODWNf34xc3ImMiQ6d1K4uoTdhKnQECrWjk2Hw2ngv0KJju1l4GMWUl2/V88QbWxiYu8B0XQLv8Rw+m9h80EYqQhzTh2FxH4osR023IwYM01zSzVviejoG02woimqu1kQR4J077ZBoogmNnQf9awl0E6L7TRsTPFng8shCoR41nx4gYSV9tcCj4HlEzndt5RBDYWMJfDAZcTqLbvewB+eda5Hx+vqOuEBhu4U9xbPzsUC1IvcBR61k2bNAJ76GYt8cYmlbMm6ftKaNoRnXnyjrPi8RjfNE28c4huumKk71lZi2QH0PitkBsPELKu+LCY6DDuX6LTbcZX6mB8V+bOLU1VEhUgyPEtCA/dfFvwYJQbEaapDL/QFLXBRSROLTrQeYR46pUDbBZTZrl+l7KWMxdcPsv2lHpn/PfZKPBRSwufdjt3EHpi/VtdV+6G3gWyX/jf1v/jjQq6zyCn44Smv3fibutYa1VyTnKJEoMBqSF9u3HdxrJry+/0w3nwFlVX4peHLWvp2/rZPFmsvEIWtEOKlT1nL0SbD81zwJFGpsUdUBnijD+aFfMEqcuRn1gLp5LyKimXgZBGTAMO5z6LT/MQTNUkGAu7DWiPzIwGwQpQcMryEMM6nF+EEk1oTriLFpXlttImTS+RGoif86ee8mxnkdLoW6Eebp48KIQ09sxiA2xXO2hmmfpbRfRMmQNds4F5qlCKfPbTowZLMx3XmfkWB+9jB18eoZ0gthpzhRoyYaBOcM2SNGY8Ss6c72fPBewZLEZ5NTo1ud+DrESJphPlFrqvVg3/H1Ul47AahttQwnO1/Bez1eZwIK68EJAU4DC/Lf8bHciBuUQLmXFOACIpJhjJqls2St9ROA==
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee193236-b3be-489a-9329-08d88cb9031e
X-MS-Exchange-CrossTenant-AuthSource: SN1PR02MB3822.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2020 18:29:12.4537 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hFmR9wy2dIwvtogNMEf5u1q5xjPkoMnhOKEKa3y5Ne9+YMth+5s+IHDs6skiC0ZDaFrfH8pfL+pTOpq3nL3HYmxBHOk0J5mThcln2T1Z9dw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB5263
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-19_10:2020-11-19,
 2020-11-19 signatures=0
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12;
 envelope-from=priyankar.jain@nutanix.com; helo=mx0b-002c1b01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Turschmid <peter.turschm@nutanix.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Priyankar Jain <priyankar.jain@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Today, dbus-vmstate maintains a constant connection to the dbus. This is
problematic for a number of reasons:
1. If dbus-vmstate is attached during power-on, then the device holds
   the unused connection for a long period of time until migration
   is triggered, thus unnecessarily occupying dbus.
2. Similarly, if the dbus is restarted in the time period between VM
   power-on (dbus-vmstate initialisation) and migration, then the
   migration will fail. The only way to recover would be by
   re-initialising the dbus-vmstate object.
3. If dbus is not available during VM power-on, then currently dbus-vmstate
   initialisation fails, causing power-on to fail.
4. For a system with large number of VMs, having multiple QEMUs connected to
   the same dbus can lead to a DoS for new connections.

To resolve these issues, this change makes dbus-vmstate connect to the dbus
only during the migration phase, inside dbus_vmstate_pre_save() and
dbus_vmstate_post_load(). The change also adds a helper, clear_dbus_connection(),
and calls it in the appropriate places to ensure dbus-vmstate closes the
connection properly post migration.

Signed-off-by: Priyankar Jain <priyankar.jain@nutanix.com>
Signed-off-by: Peter Turschmid <peter.turschm@nutanix.com>
Signed-off-by: Raphael Norwitz <raphael.norwitz@nutanix.com>
---
 backends/dbus-vmstate.c | 58 ++++++++++++++++++++++++++++++++++++++++---------
 1 file changed, 48 insertions(+), 10 deletions(-)

diff --git a/backends/dbus-vmstate.c b/backends/dbus-vmstate.c
index bd050e8..6bff11e 100644
--- a/backends/dbus-vmstate.c
+++ b/backends/dbus-vmstate.c
@@ -80,6 +80,20 @@ get_id_list_set(DBusVMState *self)
     return g_steal_pointer(&set);
 }
 
+static void
+clear_dbus_connection(DBusVMState *self)
+{
+    g_autoptr(GError) err = NULL;
+    if (self->bus) {
+        g_dbus_connection_close_sync(self->bus, NULL, &err);
+        if (err) {
+            warn_report("%s: Failed to close the Dbus connection: %s",
+                        __func__, err->message);
+        }
+        g_clear_object(&self->bus);
+    }
+}
+
 static GHashTable *
 dbus_get_proxies(DBusVMState *self, GError **err)
 {
@@ -195,9 +209,21 @@ static int dbus_vmstate_post_load(void *opaque, int version_id)
 
     trace_dbus_vmstate_post_load(version_id);
 
+    self->bus = g_dbus_connection_new_for_address_sync(self->dbus_addr,
+                    G_DBUS_CONNECTION_FLAGS_AUTHENTICATION_CLIENT |
+                    G_DBUS_CONNECTION_FLAGS_MESSAGE_BUS_CONNECTION,
+                    NULL, NULL, &err);
+    if (err) {
+        error_report("%s: Failed to connect to DBus: '%s'",
+                     __func__, err->message);
+        clear_dbus_connection(self);
+        return -1;
+    }
+
     proxies = dbus_get_proxies(self, &err);
     if (!proxies) {
         error_report("%s: Failed to get proxies: %s", __func__, err->message);
+        clear_dbus_connection(self);
         return -1;
     }
 
@@ -223,6 +249,7 @@ static int dbus_vmstate_post_load(void *opaque, int version_id)
         if (len >= 256) {
             error_report("%s: Invalid DBus vmstate proxy name %u",
                          __func__, len);
+            clear_dbus_connection(self);
             return -1;
         }
         if (!g_input_stream_read_all(G_INPUT_STREAM(s), id, len,
@@ -237,6 +264,7 @@ static int dbus_vmstate_post_load(void *opaque, int version_id)
         proxy = g_hash_table_lookup(proxies, id);
         if (!proxy) {
             error_report("%s: Failed to find proxy Id '%s'", __func__, id);
+            clear_dbus_connection(self);
             return -1;
         }
 
@@ -246,6 +274,7 @@ static int dbus_vmstate_post_load(void *opaque, int version_id)
 
         if (len > DBUS_VMSTATE_SIZE_LIMIT || len > avail) {
             error_report("%s: Invalid vmstate size: %u", __func__, len);
+            clear_dbus_connection(self);
             return -1;
         }
 
@@ -254,6 +283,7 @@ static int dbus_vmstate_post_load(void *opaque, int version_id)
                                                     NULL),
                 len) < 0) {
             error_report("%s: Failed to restore Id '%s'", __func__, id);
+            clear_dbus_connection(self);
             return -1;
         }
 
@@ -264,10 +294,12 @@ static int dbus_vmstate_post_load(void *opaque, int version_id)
         nelem -= 1;
     }
 
+    clear_dbus_connection(self);
     return 0;
 
 error:
     error_report("%s: Failed to read from stream: %s", __func__, err->message);
+    clear_dbus_connection(self);
     return -1;
 }
 
@@ -327,9 +359,21 @@ static int dbus_vmstate_pre_save(void *opaque)
 
     trace_dbus_vmstate_pre_save();
 
+    self->bus = g_dbus_connection_new_for_address_sync(self->dbus_addr,
+                    G_DBUS_CONNECTION_FLAGS_AUTHENTICATION_CLIENT |
+                    G_DBUS_CONNECTION_FLAGS_MESSAGE_BUS_CONNECTION,
+                    NULL, NULL, &err);
+    if (err) {
+        error_report("%s: Failed to connect to DBus: '%s'",
+                     __func__, err->message);
+        clear_dbus_connection(self);
+        return -1;
+    }
+
     proxies = dbus_get_proxies(self, &err);
     if (!proxies) {
         error_report("%s: Failed to get proxies: %s", __func__, err->message);
+        clear_dbus_connection(self);
         return -1;
     }
 
@@ -341,6 +385,7 @@ static int dbus_vmstate_pre_save(void *opaque)
                                          NULL, &err)) {
         error_report("%s: Failed to write to stream: %s",
                      __func__, err->message);
+        clear_dbus_connection(self);
         return -1;
     }
 
@@ -349,11 +394,13 @@ static int dbus_vmstate_pre_save(void *opaque)
     if (g_memory_output_stream_get_size(G_MEMORY_OUTPUT_STREAM(m))
         > UINT32_MAX) {
         error_report("%s: DBus vmstate buffer is too large", __func__);
+        clear_dbus_connection(self);
         return -1;
     }
 
     if (!g_output_stream_close(G_OUTPUT_STREAM(m), NULL, &err)) {
         error_report("%s: Failed to close stream: %s", __func__, err->message);
+        clear_dbus_connection(self);
         return -1;
     }
 
@@ -363,6 +410,7 @@ static int dbus_vmstate_pre_save(void *opaque)
     self->data =
         g_memory_output_stream_steal_data(G_MEMORY_OUTPUT_STREAM(m));
 
+    clear_dbus_connection(self);
     return 0;
 }
 
@@ -382,7 +430,6 @@ static void
 dbus_vmstate_complete(UserCreatable *uc, Error **errp)
 {
     DBusVMState *self = DBUS_VMSTATE(uc);
-    g_autoptr(GError) err = NULL;
 
     if (!object_resolve_path_type("", TYPE_DBUS_VMSTATE, NULL)) {
         error_setg(errp, "There is already an instance of %s",
@@ -395,15 +442,6 @@ dbus_vmstate_complete(UserCreatable *uc, Error **errp)
         return;
     }
 
-    self->bus = g_dbus_connection_new_for_address_sync(self->dbus_addr,
-                    G_DBUS_CONNECTION_FLAGS_AUTHENTICATION_CLIENT |
-                    G_DBUS_CONNECTION_FLAGS_MESSAGE_BUS_CONNECTION,
-                    NULL, NULL, &err);
-    if (err) {
-        error_setg(errp, "failed to connect to DBus: '%s'", err->message);
-        return;
-    }
-
     if (vmstate_register(VMSTATE_IF(self), VMSTATE_INSTANCE_ID_ANY,
                          &dbus_vmstate, self) < 0) {
         error_setg(errp, "Failed to register vmstate");
-- 
1.8.3.1


