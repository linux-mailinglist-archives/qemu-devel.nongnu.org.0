Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 060BD33A8B7
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 00:11:52 +0100 (CET)
Received: from localhost ([::1]:54054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLZtm-0000Cd-GR
	for lists+qemu-devel@lfdr.de; Sun, 14 Mar 2021 19:11:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lLZsX-00081U-5k
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 19:10:33 -0400
Received: from mail-mw2nam12on2106.outbound.protection.outlook.com
 ([40.107.244.106]:19297 helo=NAM12-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lLZsV-000342-58
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 19:10:32 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hSSbXFDmIn53PuxjudguKXjurlGamNP8zH7ksWENpMgfc1wXl23eY3VMnfsCOXv7gmIjlU5FPixYiUgeW2SPhpKD4cnPQHRYQHtvkD3LNqwNSRNfyXUDJYo5qunKFamYkCq/Tha405wjQHVrRSe95Iztb/68m1Dy1GLaiv/hxvbqiJsEL/ABxVPZDLGE20lX5fOsr0AEoFnzedTL8fmkrVvbMrcN7/z3vUGSxTjuV2i2N9QqpvByydwvcZiV/Ol1VClX/FuZV20XHHlA7MCYFgI1wyfCam9SoNVc7yc0RPTWmTrg1a98A2ucLvkuJWyFvAUy2+OUIOtJqsHeZ+yBvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aLSisIGtYKl1pNQEx50Kowu2v0RKb2wTjaO1NF9a4O0=;
 b=YMdESk7Wl1xZoT5SNmmF/TqIAv+aYS9RLlhGCk0bBJZ7MkgPwddt1WVYhm8ZUkspRwM70L+2AbbO7dW+zsrOu1Ey1jHKQOTeMVakq9H9uVXUeO2BwIks0WFiVjOo3+yJHN5VzNfuqNzOVQsHS/Gvz2XyvC25GFYgjorkW0GgTbCiZcPl4XWf3rGFZETUI+oPHDYEvAtyutqUrAQ2VXpkro4ncI8rlHa0gtEHbarF5EHr4cxFoH0ovk+sw5O8Npr4mMOMgfMdG6b1UidDzaKICwMlsjKVbDD8+61+BJlTfYrp82h2/wsz0Nkk42XLoYuTSq/f9ldJR4vRqDXPHjvAiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bushare.onmicrosoft.com; s=selector2-bushare-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aLSisIGtYKl1pNQEx50Kowu2v0RKb2wTjaO1NF9a4O0=;
 b=pHvJqtulgzeX0tQci+X4hC/qSvvKCCfjUnkJup5zibfs89E+SejRD4jxnxYU/0wQqRpn8DydBcBXfdw+aD1L00eV1bfhaBNdtzjXFSfXnpyOvPnO5mCt48ZSk5pzZh6I6GjtPqkzcdjxDK8nmj7gJfxj+syaE5SGnhZw/GwvwgE=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SN6PR03MB3725.namprd03.prod.outlook.com (2603:10b6:805:43::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17; Sun, 14 Mar
 2021 23:10:27 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::dda8:67d8:8d23:74c6]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::dda8:67d8:8d23:74c6%6]) with mapi id 15.20.3933.032; Sun, 14 Mar 2021
 23:10:26 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: [PATCH] fuzz: check machine, before PC-specific code
Date: Sun, 14 Mar 2021 19:10:15 -0400
Message-Id: <20210314231015.29166-1-alxndr@bu.edu>
X-Mailer: git-send-email 2.27.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Originating-IP: [128.197.127.33]
X-ClientProxiedBy: MN2PR19CA0011.namprd19.prod.outlook.com
 (2603:10b6:208:178::24) To SN6PR03MB3871.namprd03.prod.outlook.com
 (2603:10b6:805:6d::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mozz.bu.edu (128.197.127.33) by
 MN2PR19CA0011.namprd19.prod.outlook.com (2603:10b6:208:178::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31 via Frontend
 Transport; Sun, 14 Mar 2021 23:10:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 19ca975c-0307-4306-d1a6-08d8e73e5a6d
X-MS-TrafficTypeDiagnostic: SN6PR03MB3725:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR03MB3725B04950E65C2E0502B34EBA6D9@SN6PR03MB3725.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:758;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GL/yzXVppVF1zbTXfEaHZ4GkBT5/deaVmz4u+Ayl0KeHFtYJj8/tF9ZMeUrrhczYEoDMgdhohGOVE7cAK67xGc2N44P5KRvJcXMsYkVaAOySzhlRdyLdAlaFFpbUOkFzQ1Xbhtq4OPli3oi032NdKgkQK/aY9Lh9M5jeuLg0ojtX1/8XXn7a7pJ11bEsJ/AneCFcUuYkoXBVRkwjbhOJqlj8sdOgpoFO0uyszjJPao3MXcpUqi7BopkyGQxFcJP4IU/lZJ3fJChrsYxopArdpgq4Zr49NJeDbOOVMqApriU7owsl7/hYDrRr/2rriU/cIA9/SyD6rDC7bLN3Er2SCkUz2vMzIiz2PoOSf/AqgUxfuZwUZ5ut0+06pbO9zKePkUb8JUqA25d46nAothvYX6Z1bDRSCwQT4Sa4vzma6KhyBq3O+y+wTP+9L20f9ebhLHco3Kt8jFWXuDri+zOLT1s12omgKmsqoXjxwF1N47D1yxBklv5rBMl+LDuzJdvVBuL9vjbzXNAvVE2ixQLLHA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(346002)(136003)(366004)(376002)(956004)(186003)(2906002)(478600001)(2616005)(8936002)(52116002)(5660300002)(316002)(7696005)(786003)(6486002)(6916009)(75432002)(86362001)(6666004)(4326008)(1076003)(36756003)(8676002)(66476007)(54906003)(66946007)(16526019)(26005)(83380400001)(66556008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NlNZc0FrcnFEL3JkVkV1c1FYaHFNUWhwaUpDK0ZXdElnLzQ5T2JOV0ZTT3FB?=
 =?utf-8?B?WEY2QW1PcWMrUi9HSjVQWS9sNkhvZWdpWm1nc2tRTEkybGNTbytqbXVJSmxD?=
 =?utf-8?B?ajNWNXU5clZYc0ltcGIzOHBYNVY5Mi9iUFZnRkc3alNzM28reENPYVlCTXYx?=
 =?utf-8?B?ekpiUFhUU3VnL1JPaUxPYnhSUEhxZWtDd1pCekhxeWgzNUQrbVpESHM1YlBC?=
 =?utf-8?B?ZXpxS2hDNXMxcWZLek51YXRXTkx5akQ0ZWtZWklMYTUzVU16K09SWnlTTG5H?=
 =?utf-8?B?ZFVaU2tDMXhROGtKMzJma3hvdWR3NVNvaGdlZkFxUFdMckpUZVhQczV2S0Vk?=
 =?utf-8?B?bnhNV0Nsc3FqVzZOOW9KOGdFaVNLNTJEUlRsMG4wRDk5aUJZV3VaczdBZjcz?=
 =?utf-8?B?ay93NFcydDFXdEUvOGsraURwZk9taG1KWExGTm5FVXF1d0Z1Ujdoc0xLSUEw?=
 =?utf-8?B?eHFsQndrV1B4ZVJIYjdDaEZNNEZVYmpBRUpxWVM1UnJ2MkVGMUszUnRYK2Fv?=
 =?utf-8?B?ZkpwVzZMbmZQM1hTU3FpemRnT1Uwd3drSitLNTdGak50cFBCOFc3SHZRSXBM?=
 =?utf-8?B?dGJsNE5BU2lYV3RzbHFxdFlPSU5OdU5kSmRwQ3ppN0kxREp2Tm1ZMmpaN0Vs?=
 =?utf-8?B?NUpSUFZvbVZWN2ZRQm9TNHJNSWNzbXg0Q2xjSTRmY3lqNXh5clhybURxZGNj?=
 =?utf-8?B?Q2NRbE85U2VHbU9kZ3dRUTd0YU1PR3lsOGozV3E3K2IrZFIrQTcxQW03Vlc3?=
 =?utf-8?B?MlNuazBJeHB1UGg0a0g5ZW0zVjhjNHhhT2dpdFJzUU1EV1FoSWtoWUliNnh6?=
 =?utf-8?B?WHVRYjVtdThhWXNET3RFNlFBdHRxWGVOUVJ1RFU1UE55VzlSdGZ3eDliTFY1?=
 =?utf-8?B?ZzhsZndEcEc3dWkvbFFaSUZ5VmxyK3J6Qk9hbTM1ZzlNTEJNZWF6SFZkMU1M?=
 =?utf-8?B?QUx1YXlxREhWQ24rNUZzUlZJeHlab21EVzkybG55dHpzVVpIcVZmMDBKdFNJ?=
 =?utf-8?B?MkpMaFZNaUE0UmEzeHk4aGphNmNJcjFwbHlOSTVBWmVZdmR3M0l0d3ZtSm5C?=
 =?utf-8?B?REtOR2tETlR0aE5NRmZNOVRoWUwzTVIrUTQ3Q1h2VXhkVE1ZSXBxUlczeGhD?=
 =?utf-8?B?a0h0dm1tcU1JNVRwbmtRWnhNRE4zaTZTdnNxL3VNWkIySWNGTDZ6MHptMmsy?=
 =?utf-8?B?WTlBQmw3NXZoNlNzRHVnMWhUZVVEWHYySjBielhtanBBUitPQnZidFBTNncx?=
 =?utf-8?B?THRERURJejY2aSt2YzY5TEVFQVhQenVKNFVFdU83b0JLSEVrZ01icmozUXgy?=
 =?utf-8?B?T0xmTlNpNXcwTWNzK1FuN2V3Q3FPZzBCUEtEZ25vYnZkbCthZTVYaW5oTkF5?=
 =?utf-8?B?akRqS3ZMajlJMEpUdTNCdkxiRlJ3aDk1S3Eweko1MEhzeFZZejlhU05ISzRP?=
 =?utf-8?B?U2tKUUNiQW05dTJDOW9TZ24xcllSUjViRzdwdThFdEQ0dXB5aDF5eDRFYXNV?=
 =?utf-8?B?bTZNRGtLMVdVYkdreHFNaHJRcjBIRW9jcDJWcXdvV2tSTEw3UnZBOXA2TjI1?=
 =?utf-8?B?TWlGeXV2MXZ3YUJaK2ROV1A4eW9WU1ZkT0NBTnVrckhnNURlNEQ1dlIyRG1x?=
 =?utf-8?B?MlpNcUZsT3o4WnpwUHhHaWxFb0VHbjl4bUdGTjExeEp5MEhsd3lTcEZaVXN2?=
 =?utf-8?B?VWp4MkFGb0tuWGtRZU9xS29CT3pOemdNZ3UwSU9DeGtwdVl5ZFhqU0dnNmRx?=
 =?utf-8?Q?IlJ+EBpzz7qAyl/CwKabVbDS+gbwsXJgOMEz9RM?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: 19ca975c-0307-4306-d1a6-08d8e73e5a6d
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2021 23:10:26.6538 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JqZsuP2P910YxO9ZjDiwUGQlhgm2iimhmHTtmLfT2aoz6rzFbzEgmdc1HT7Qfd/C
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB3725
Received-SPF: pass client-ip=40.107.244.106; envelope-from=alxndr@bu.edu;
 helo=NAM12-MW2-obe.outbound.protection.outlook.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.999,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, f4bug@amsat.org, darren.kenny@oracle.com,
 Bandan Das <bsd@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We enumerate PCI devices on PC machines, but this breaks the fuzzer for
non-PC machines and architectures. Add checks to avoid this.

Reported-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
---
 tests/qtest/fuzz/generic_fuzz.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/tests/qtest/fuzz/generic_fuzz.c b/tests/qtest/fuzz/generic_fuzz.c
index ee8c17a04c..d2b74028fe 100644
--- a/tests/qtest/fuzz/generic_fuzz.c
+++ b/tests/qtest/fuzz/generic_fuzz.c
@@ -784,6 +784,7 @@ static void generic_pre_fuzz(QTestState *s)
     MemoryRegion *mr;
     QPCIBus *pcibus;
     char **result;
+    const char* machine_type;
 
     if (!getenv("QEMU_FUZZ_OBJECTS")) {
         usage();
@@ -827,9 +828,13 @@ static void generic_pre_fuzz(QTestState *s)
         exit(1);
     }
 
-    pcibus = qpci_new_pc(s, NULL);
-    g_ptr_array_foreach(fuzzable_pci_devices, pci_enum, pcibus);
-    qpci_free_pc(pcibus);
+    machine_type = object_get_typename(qdev_get_machine());
+    if(fuzzable_pci_devices->len && strstr(machine_type, "pc") == machine_type)
+    {
+        pcibus = qpci_new_pc(s, NULL);
+        g_ptr_array_foreach(fuzzable_pci_devices, pci_enum, pcibus);
+        qpci_free_pc(pcibus);
+    }
 
     counter_shm_init();
 }
-- 
2.27.0


