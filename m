Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF28C32AC59
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 22:39:08 +0100 (CET)
Received: from localhost ([::1]:49510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHCjT-0004OZ-Tq
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 16:39:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Babu.Moger@amd.com>)
 id 1lHCfr-0006pM-1J
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 16:35:24 -0500
Received: from mail-bn8nam12on2060.outbound.protection.outlook.com
 ([40.107.237.60]:21601 helo=NAM12-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Babu.Moger@amd.com>)
 id 1lHCff-0006LD-G3
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 16:35:22 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fQ48H+6nnmL/sXyx35FwyeGWXNoHh+pr/OTwJ4s02UPQg5eirEM4hjV8KMUSpdjfZiMnS/UdiHxhNJ0m/2fBYPhnKEeqUPYof0ZIZNPwZTvyf4D30iAYro7lsbfOwV+GGFGnKEU0hyTexRmVmm0cfYsL5mi91Qs8xHUTHEGKbqdalM9eNBefZWy1+5T0ll7oIeUNnx4KIBuoh0X5aVTXEbppxfD7jaqNEiK/Rp/Uh8cRM/WnyOn66vvMpq6ObPom3f+Rtd+XbXTzXiGggs24RRPaH8COSJci0cOahQIEr5V6G/g2ZkH7z5xe/HQVL+b/2Vu4bY1bxfOcYzB6wU7Lsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Adi73RJkMCV7SJOealvpmjblVIiE3HTBkKd54DrzR5A=;
 b=a4XFgeJXs9931Cg4vLGxxMMvg+wsEoUZSu5Pi160syJzgE/CqzZXjwcKqp/PX44B6S6WMPKOkqkK27HTSNs7le1e6UosagNjmx3xXAoAB9Sw5VU1tYnDXtXu6t6pCm0qDWIrvhM+3m9dtK7KWjYH4b0iyQXD3sr9AN5KkfIJ1vaPXDcLjkb6En0JXftaLw29+zt3smLpNZ+YInbKl6hgZHmFyzQowO70opWlG9Iuicmxd2SBEuRVRspFb6Eel+Wi2neCUqaZ0HJpJ6QKELNkf4rD2TpBnvWwQsrv3hHzkNT7QDOaoujLtTBaIg+mwQlKqW+78B5i5mO0lUdgJjRsRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Adi73RJkMCV7SJOealvpmjblVIiE3HTBkKd54DrzR5A=;
 b=WC1A1gzlCNXXEokbTF21hLfgW7kHBGcZMdLW6KwMHY68QEtSnP4a5KKch7s8NHIJRQ0tS2OarggUIJ+sNMb/0OpfnccDc2twv8fSvOMMkFXLTWEiCx36wrNkZxNZGBZ2fohzE+NCOw4Uy/f6M9VmAC0LzACpkCuR/w5cPNB8LyE=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from SN1PR12MB2560.namprd12.prod.outlook.com (2603:10b6:802:26::19)
 by SN6PR12MB2605.namprd12.prod.outlook.com (2603:10b6:805:6a::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.20; Tue, 2 Mar
 2021 21:20:02 +0000
Received: from SN1PR12MB2560.namprd12.prod.outlook.com
 ([fe80::8c0e:9a64:673b:4fff]) by SN1PR12MB2560.namprd12.prod.outlook.com
 ([fe80::8c0e:9a64:673b:4fff%5]) with mapi id 15.20.3825.040; Tue, 2 Mar 2021
 21:20:02 +0000
Subject: [PATCH] i386: Add missing cpu feature bits in EPYC-Rome model
From: Babu Moger <babu.moger@amd.com>
To: pbonzini@redhat.com, richard.henderson@linaro.org, ehabkost@redhat.com
Date: Tue, 02 Mar 2021 15:20:00 -0600
Message-ID: <161472000062.17527.13517059335871466534.stgit@bmoger-ubuntu>
User-Agent: StGit/0.17.1-dirty
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [165.204.77.1]
X-ClientProxiedBy: SA9PR13CA0004.namprd13.prod.outlook.com
 (2603:10b6:806:21::9) To SN1PR12MB2560.namprd12.prod.outlook.com
 (2603:10b6:802:26::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [127.0.1.1] (165.204.77.1) by
 SA9PR13CA0004.namprd13.prod.outlook.com (2603:10b6:806:21::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.11 via Frontend Transport; Tue, 2 Mar 2021 21:20:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a0427e42-5fc0-4fed-c505-08d8ddc0f10b
X-MS-TrafficTypeDiagnostic: SN6PR12MB2605:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB2605CFBF3E753011CD4738D495999@SN6PR12MB2605.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WqLHuzCiL31ecGHJe1HhJKIVBJK47Xi9kefJYblNICndz10uC+mt8ZHPvQJVKNpouL5Px/1WvIUm1YjDgtXMotSgIUkCkNpPSjvoMW0A+QeakzinGY7o3gckXVITqhvt4qaS14x/gPQXfGS4Xci3vUpzTGexW7C5e42wdImA8iPzilnMoaZG0amIqmhklgTjKnDZfhAwqBXl4jj+enMVAaxw1VAob3Qt6jnSklsY3AsJOdUl4z4Bun9WUu9ZulgUSbvGwcfDMdMEA7wiK2vokD7mUuRdGDRAEHuohHS5vcMPV8TS/dlUduhx1fqlvyc0fG4J0sCARVBmgAdb+VkJXboFssQ+3IBCRzqDpe8NPvi7+uY8IoZ/m3gAAt4sTjuiWtwlG8xW6aLEzHDbEHMkwlu+OMYJQ0iGHe+kBCZ9o6TvrBmIsfJtIB8zn5A/+vlHZNq6w4ub73tpZM09IHvYWQxfpkWO9lw8og+w0CJJoQwx+VLWbjwVaBfjLq8wVyFmd+cYCgWfhMThaaUERSnfYw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN1PR12MB2560.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(7916004)(4636009)(346002)(136003)(39860400002)(366004)(376002)(396003)(4326008)(9686003)(5660300002)(86362001)(16576012)(44832011)(52116002)(956004)(8676002)(478600001)(6486002)(8936002)(66556008)(103116003)(26005)(2906002)(66476007)(186003)(16526019)(316002)(66946007)(33716001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dktWbFRGdm5YTGF2MXBMYkIyanorZjVWaERvc3FZamM3V01Tbys0aUxQTUtN?=
 =?utf-8?B?UkI2K0tCdGpGbmxVdGMyVnBDNDZBQThoVlJIUVdMYkNOUU1UbzM5SHg3YXJG?=
 =?utf-8?B?MWFjWEtyQXNRU0RaNkR4NGVObklBbHVzcmt2RFdiSmR3S0c2NGlzZS81NEJn?=
 =?utf-8?B?YjBLT3VrdW1NT0RoU083azR6aThLMGVKaHNVTCtEVkJ6Lzl3cHc0a3NHMzFU?=
 =?utf-8?B?SFllNnkzL1R6VXFYSzV6TEhmZnBFMXlEbzNRQXIzNEpjUFhJbU51aVlqbDFm?=
 =?utf-8?B?VWh0WDhGKzBjdlNxZ3RkbmQrVzVZV2doZnkzbDUxUG45S3BVUlh5OWI4N2dx?=
 =?utf-8?B?U3I5dndkU1FrSHI3MWRpSUN0TXRrWlBUa0s5b2NlTE9OVVdPZEpBMzlEYS9G?=
 =?utf-8?B?SWR0enkxUis1VU9vMzhSeThwczJhSHFTTEJWZDdFVlpvZ1VMYVZub2VZRUV0?=
 =?utf-8?B?MzBLSlRuWG8zeTdralVwMG1Ib2lkVXVJNk0rUE9XN2ZGOGdhaXU3Q1pBdGhJ?=
 =?utf-8?B?WXp3YnIrMyt0SFRLWDRRdGFnRTZ0OGdhUE05MmhGOWlxNjVKeXNDL1JVdlB4?=
 =?utf-8?B?aG1XR1VUK285aW5JRXdvY2tHdGk2dWlIbWY4QXNFK0xRdUVCWDZLY1Avdzcz?=
 =?utf-8?B?UE52d0JVMG52V2xPcG1Yb1JQNkFHRTZYeThoMWpxRW5oS3hOWmViTlZTd3Rt?=
 =?utf-8?B?ZTFERDBiTjR6M1FxeHhFQ3JzUkVac0I0a0pRS0J5Z01SOGxZSG9sMGVGSHVi?=
 =?utf-8?B?MmI1ZFlkV0RMc1BWdlBDK083dXE4YWw3UmMyc1Q1Umx6azJ2UmM1bnZlcGV0?=
 =?utf-8?B?eDh5MnRYL0lyd05vSyszQjlCbC9SMmptR2MyT0YxQ1RUa2dKSCtiZnJlZnRa?=
 =?utf-8?B?cHBRWUtGZVFLWEFvNkNyM3E0YnVvT093NzV6NnNyWmd6ellTNVVMODdUbjg0?=
 =?utf-8?B?MXhldnRKQ0hrTlBid2dOci8xcjNJMUF1M0Z3TXBFRGpxbTRYSFBHRWJwOFNu?=
 =?utf-8?B?TDJJRElScGxwbmc1d0xrbDN0OHVQNkJhUzYrKys5MXFYS2F6SXdqdFNMT0dX?=
 =?utf-8?B?Vm9QaWE0RWM5dDFldnpvc21zZ3BZRGFvNlNNN05yRDdRd002NUMwOVRFcy9j?=
 =?utf-8?B?dFZrbUtnWDJTWTdCd2lxbzZtYmJyNVkyK3h5TTBaQ3RNK2FMT2gybTd3Wjcx?=
 =?utf-8?B?S3c0S3NiSTBVMnFrcVNGWmV0Q0wzSUV0enNweDdDbDN0RUJIZDdkZ1FBTmFZ?=
 =?utf-8?B?YzVMZ0JMTkFVdFo5cWc4YXNtNjhKU1hKYzJkOEFrWEVmTU04KzdIUHNjdEhq?=
 =?utf-8?B?aWtNRXc1N1FOWVpQWmxFWkRXTklyeDJKY1JZenhNVFRRQVpVSXUvNGpnVjR4?=
 =?utf-8?B?aGF0b1JDNld0ZmtiMUFTS2Q0SjdyK24rTU4xbU42RTVoQXRNRTkzdCtIa0Zj?=
 =?utf-8?B?SGZGS3BiK1ZrKzZyd1d1Q0VQYVZsSVUySDUzQVkxcHpYWjhwTHdqcUtISkp6?=
 =?utf-8?B?UkpyOGhaQTh6ZTgyK1QxeXNjU1dmeERQSHk2VnZHdXVjbWZ3K0plajZSb0ZL?=
 =?utf-8?B?a3FNRHJ5QlRlNEZXODZzUDY3U09LVWlxUGx0V3pjdC9Nbkx5NVVkcDJyVTZ5?=
 =?utf-8?B?dnpFSldKZW1vbVpkN1JUT2VYemlYM1YvRFAyam5hSjFCZkdkWll0TXVNZWo2?=
 =?utf-8?B?cTZWNmYva1Y4UDM5T2dtOE9BMzFWZlIreEJNQVNkVU5XaWhHOWp0Ti9OK01a?=
 =?utf-8?Q?aCegXWWJU9B+u5PgajGgjhdRxGo6Z6TSxGxU/o2?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0427e42-5fc0-4fed-c505-08d8ddc0f10b
X-MS-Exchange-CrossTenant-AuthSource: SN1PR12MB2560.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2021 21:20:02.1854 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uRa+LR6CGZqgcdxBR/Z0/RIFyDyE9fuAiywiH9FGIFv9pwV0DhWy7GsMDDdB9Jup
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2605
Received-SPF: softfail client-ip=40.107.237.60;
 envelope-from=Babu.Moger@amd.com;
 helo=NAM12-BN8-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: babu.moger@amd.com, pankaj.gupta@cloud.ionos.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Found the following cpu feature bits missing from EPYC-Rome model.
ibrs    : Indirect Branch Restricted Speculation
ssbd    : Speculative Store Bypass Disable

These new features will be added in EPYC-Rome-v2. The -cpu help output
after the change.

x86 EPYC-Rome             (alias configured by machine type)
x86 EPYC-Rome-v1          AMD EPYC-Rome Processor
x86 EPYC-Rome-v2          AMD EPYC-Rome Processor

Reported-by: Pankaj Gupta <pankaj.gupta@cloud.ionos.com>
Signed-off-by: Babu Moger <babu.moger@amd.com>
Signed-off-by: Pankaj Gupta <pankaj.gupta@cloud.ionos.com>
---
 target/i386/cpu.c |   14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 6a53446e6a..9b5a31783d 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -4179,6 +4179,20 @@ static X86CPUDefinition builtin_x86_defs[] = {
         .xlevel = 0x8000001E,
         .model_id = "AMD EPYC-Rome Processor",
         .cache_info = &epyc_rome_cache_info,
+        .versions = (X86CPUVersionDefinition[]) {
+            { .version = 1 },
+            {
+                .version = 2,
+                .props = (PropValue[]) {
+                    { "ibrs", "on" },
+                    { "amd-ssbd", "on" },
+                    { "model-id",
+                      "AMD EPYC-Rome Processor" },
+                    { /* end of list */ }
+                }
+            },
+            { /* end of list */ }
+        }
     },
     {
         .name = "EPYC-Milan",


