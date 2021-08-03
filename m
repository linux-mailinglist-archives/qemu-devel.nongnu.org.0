Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF5443DEF1F
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 15:31:23 +0200 (CEST)
Received: from localhost ([::1]:37348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAuVu-00087l-Up
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 09:31:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mAuQw-0000LA-Ay
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 09:26:14 -0400
Received: from mail-dm6nam10on2066.outbound.protection.outlook.com
 ([40.107.93.66]:8545 helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mAuQu-0001f5-Po
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 09:26:14 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q5oLQuW467yShFyx2jvdDPEfaoduoyL62lI12D2z5uhF9YU7et2LrNg4DB40agTu0e2LqvW2ZwsSb41tXPJ7QP1+7HNJNyHRxzaRez8LMmRDneT58oWPW9ov6DPOwii/g7w/1BxIm0pZ4JRW1tUr6qD0cqAc4M8T/PYIRTxLidMpfK202Zjl0QOejf663HRKSsk4taZMu/BE++7J0bnhVN/rF6fCWvyPhZlS/5ff1nEybd0sUcCvdp6CCnGdRwNHj318Jdp/0bHqopa95eCHQRoqLGZT86xUbat//e4rkUsXeuJr+GHFcSVGKyQoZtidHpniwreyvPeHgLymV9WuEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RxrHVnImuD7TTn1QHo9DEQ8EhEly7Q//WDul4VH3zBQ=;
 b=Cw4+S5ppswU7wKETiyANlb4VhAOUGOKwBYRo5lqmuKUjJ8cCO+Dh6kPJM70Y7ZbsKyWFlMEXOigGNjYlCR6B7rrRcv2xynyIp2MYZdvuRzy+PoqyH0hVZlQgDUlMTjdp2I5pdgVf3QnQJnXNHdW2eBKYxISl0DwiCr7b94f/avWCZ7rW6gE57OjemSFTzl1kMu3ZAAWMMa6c1L2tMBKJd0CVhU1TieezfsuJPbLD3/rJsV/c8E7Lwfc0emW4jiAPgUqiYEfTbFxU6IM3o5bM2k3VOHkwXRr4w0FeF9wJ9rcpiikaPLUBl9H0egLY8QtLjX+A0SgguwSKc2GgtJCIEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RxrHVnImuD7TTn1QHo9DEQ8EhEly7Q//WDul4VH3zBQ=;
 b=FT5mTskbKl3+9cSl7OGnW2fnbz43gTxG4RnmFwybr0L91tbCN7/YPNFkgVeQQTX5JUqzcP+P9MTf1HK+2pjf+swn5Je08KplCvIGZxAH82CZtEhQrVaAHQvL8nvJzn3TufJwf61CHCYNhL9lz4Y7ounvwKk9HmUfMqHvIgL3kwA=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=amd.com;
Received: from CH2PR12MB4133.namprd12.prod.outlook.com (2603:10b6:610:7a::13)
 by CH2PR12MB3909.namprd12.prod.outlook.com (2603:10b6:610:21::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.15; Tue, 3 Aug
 2021 13:26:10 +0000
Received: from CH2PR12MB4133.namprd12.prod.outlook.com
 ([fe80::d19e:b657:5259:24d0]) by CH2PR12MB4133.namprd12.prod.outlook.com
 ([fe80::d19e:b657:5259:24d0%7]) with mapi id 15.20.4373.026; Tue, 3 Aug 2021
 13:26:10 +0000
From: Michael Roth <michael.roth@amd.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Kostiantyn Kostiuk <konstantin@daynix.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PULL for-6.1 4/6] qga-win: Free GMatchInfo properly
Date: Tue,  3 Aug 2021 08:24:50 -0500
Message-Id: <20210803132450.1093602-5-michael.roth@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210803132450.1093602-1-michael.roth@amd.com>
References: <20210803132450.1093602-1-michael.roth@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN7P220CA0004.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:806:123::9) To CH2PR12MB4133.namprd12.prod.outlook.com
 (2603:10b6:610:7a::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (165.204.77.11) by
 SN7P220CA0004.NAMP220.PROD.OUTLOOK.COM (2603:10b6:806:123::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4373.20 via Frontend Transport; Tue, 3 Aug 2021 13:26:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 32d00136-d5a6-41ae-3d14-08d9568241ba
X-MS-TrafficTypeDiagnostic: CH2PR12MB3909:
X-Microsoft-Antispam-PRVS: <CH2PR12MB390974A20B1910624C8E262095F09@CH2PR12MB3909.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:913;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bqrqRfifr7WE66pXaEX6RLhpgVpuWms9ANoTWw8wfaxh+HDStQhu8INQc5B1U2CMRbKBRkUL0xwyOTePIEOIkFblzWWHQmQm62QPh2uc5fwrtnxG0GjSJwCDMzmhavUfNw4cuXURhLvaQEozmUweCQDmHj0YgtLZCeoR78CHXUYOw+aRaItkE9MNc31Vr3RUKBvtfe1wjsRyJb5XXymRLRQ8eLuOt76AqmeHatl/SuDiOD3ZI5HF11C4BN13TP45nNHyTsNSpgUComkjNBg1EAiqEtLCdYnJJQLK1dtWW2voBKYjfNunDnT/YO4JzbO0wboV0SxUibowRvc2R5uNfQGj0vILxsjX8D0ieVN6D41Tbe2HllDdbVDQBn4TmMhK16gT2wKG0bU2VN2cw4JqpfK3RYw2EKPsQ+2EouIb9t53yrat3T/2Bqrvn5mth/cL6TMHsFjAZ/roZoa82rX/UgUkct27L2521MIctWxWvzPALRctniFEPHGe/k3hw+MUIblqrc3vyTMh5w9oN6tjNrsrMUvC45UznQC+X/ZaITOaqDk/Y3WQnZ92nVS/dbiTWQ1YUNoYuvmCeIkiWYtZKNW248Vykk0Rl+Gnp8c6hpe0dADwtj5V6xq03YIdeyjnOG5lGIbyVAYvL6S7KXwZUgkgD5SYh/B3HEtZKjy/2ozI3crGAzH70JlNNAStTCc6IDq98m+iKHLvhWC0Yz5K8A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB4133.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(346002)(39860400002)(376002)(136003)(6916009)(86362001)(36756003)(5660300002)(6666004)(8936002)(54906003)(316002)(478600001)(4326008)(6496006)(52116002)(2906002)(1076003)(8676002)(83380400001)(26005)(66476007)(66556008)(2616005)(956004)(38350700002)(6486002)(38100700002)(186003)(44832011)(66946007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NzlSdnJRaG1oeStRRXYycy9jRndBZXM1TWh2VkJiUWtWeWM4VjM4UnJaTkw2?=
 =?utf-8?B?S0dPbkdNenZnNGR4SVcvcE84ZVRFUytGa0JqbFNqWDJCS0o3TkRudzJOMnlq?=
 =?utf-8?B?a0Z3dUFqUFEwNk54akptTG95YTJ1bDVaWk9hMVJjZjd5dUgvMkdsQ0dSektX?=
 =?utf-8?B?cFVIcVRSQmw4dU1oWVk1UWhPV0RXS2cvY2dpQldqaFRyakJVd2lpeGlDVmZh?=
 =?utf-8?B?QnhxVHpIT0ZTenhoNlMrR24vRmFYR2xTS1BQNUU5SWdoSy9XNExZem9mU3Ny?=
 =?utf-8?B?N1ZVVk93ZU52TFJ0dU1uekRRaVc1K2txQkI5OGlaVFpwWWt2TTN5UHNZdmw2?=
 =?utf-8?B?UTNGaVdSMElTRXNiSllHcXBzb01rTHdnbmZEOTZ2RitBdHd5TEwwMVFIOTZU?=
 =?utf-8?B?NndmS2dqSXZTZGJzOFhibGVvMms1SGExQmhXcDQxOVJsTzBDaS83eEgyeXV1?=
 =?utf-8?B?anVwa3hGVlh0MTlyRHU2YkpTQjhDdVVrdXp6T2tCUXlIcHN6eko4OWh2YVdq?=
 =?utf-8?B?UVd5ZXJ0KzFOUlRVY3oyWlNRNGtzeVFuRWFHcUZPb0VaS1cvSlNVU3lsN1FC?=
 =?utf-8?B?VXVFR0RwMlpiM01HK3RTZGJYRUwyRHJJRXNKU0s1V1RKWmF6c1JOVGV1T3FK?=
 =?utf-8?B?dnAyUUV5cnZGVVQ5Z2F1b2xYNnpwZlhldGQ0RkE2R3RwczF1WGNyT0Q1U3RR?=
 =?utf-8?B?RVJqQjRVVFhRenZhT1gwZG52VFZ2SHVnamlMMWp5RjNiK3R0YkpuQzVpaXQz?=
 =?utf-8?B?bHVNL0VIMlBidEcyTWk5S2lwakJJa1FkQzEzdTBFQXJCN05iWjlGVHNsOVZ0?=
 =?utf-8?B?SFY1SVlSeUw5VWtGbUx0Rk5udHBJYXVHSUMzbWNXS1l3ako4YWlvMmcxekF4?=
 =?utf-8?B?WCt4eTNISDJYTTcydVdUcXpwZnlvMjR3NDB6Q210ampBNmdUczJoblNubHZu?=
 =?utf-8?B?MHZuR0paOGdDR1lkTzVaUk85TysrOU5NbjFMTU56eEJmQUd6VTNsdU1sWTF6?=
 =?utf-8?B?NHVobmhTSXZqZWNXU3lYeEkzTmczbWVLOHpsNEMwVHc0a1MzUys5dittMmRk?=
 =?utf-8?B?S2FiU04vWVIyMldUUThjYmFWdkJXVHhuTmU3aDRtNlhEdjNKM3BCRzgyK2Nt?=
 =?utf-8?B?SUJHM1QyTlAxWDBxSFBpVWc4YjNFNWZlaFJhaE9kN1VoTDdYeG9uT21WQTdl?=
 =?utf-8?B?MzhkQThFajhheVhhZExQU0VPNGpEQi9yTWJ6QXNBRGhJSDFJQXg3Y2swY05h?=
 =?utf-8?B?L1pWRU1KeFhMWmpFL1lOUXJXRVJxV1BKdndCOEQ5UHg0eG94eCtIYU15Tldv?=
 =?utf-8?B?eFdGcjQwYXRiY0J4MEZkWTJXTFk2OWM4aTU5ZWdTQVNNYTdLZ280OHZLRFhn?=
 =?utf-8?B?aVVDNW1qMGRVcFFieEwwYytoN3lldjZHcVNtMThBMGVMY2YzMVJzNldrUlpt?=
 =?utf-8?B?WkxKZFc0OHN3RERNZmQrMkVMVHpCc0c2NEFiZ2NqUHYraG1ldjhVNmZ1OEdD?=
 =?utf-8?B?YWFIUEFKeXhXVndxNk5VdnlrQkRHcjNBcDlhM256TXpTZVlaTkJ6M1BWS3RM?=
 =?utf-8?B?K3RWcXFwOTlFS2pyOEl2LzgzY3lDQXlJaG44a3BmU2hsbHNuVU9HR0xreXFz?=
 =?utf-8?B?VFVjeFV3cmtGdlBucGtzVXE4bCtqbGhUQVJiNHk2aEhOS1I0S2ZuWVNPZ1lN?=
 =?utf-8?B?emYwSWNmQW5hZEN4eTM5bzJObFBWbHBoUnpZd0lLSzFRSDZjRDdLcXloOTNy?=
 =?utf-8?Q?kxZ6GHXC7fH/9JrPJyrdkpkLwisL3uwQAjolhCp?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32d00136-d5a6-41ae-3d14-08d9568241ba
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB4133.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2021 13:26:09.9371 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WHfIO/J/5ZMvKscEcJMXA3kFAr1GUJyVKxngIiO89FkFchUf9CaPHq6EdP6fhLYsz2c613yVRNJRovgnXr97tw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3909
Received-SPF: softfail client-ip=40.107.93.66;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM10-DM6-obe.outbound.protection.outlook.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Kostiantyn Kostiuk <konstantin@daynix.com>

The g_regex_match function creates match_info even if it
returns FALSE. So we should always call g_match_info_free.
A better solution is using g_autoptr for match_info variable.

Signed-off-by: Kostiantyn Kostiuk <konstantin@daynix.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Michael Roth <michael.roth@amd.com>
---
 qga/commands-win32.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/qga/commands-win32.c b/qga/commands-win32.c
index 098211e724..7bac0c5d42 100644
--- a/qga/commands-win32.c
+++ b/qga/commands-win32.c
@@ -2459,7 +2459,7 @@ GuestDeviceInfoList *qmp_guest_get_devices(Error **errp)
             continue;
         }
         for (j = 0; hw_ids[j] != NULL; j++) {
-            GMatchInfo *match_info;
+            g_autoptr(GMatchInfo) match_info;
             GuestDeviceIdPCI *id;
             if (!g_regex_match(device_pci_re, hw_ids[j], 0, &match_info)) {
                 continue;
@@ -2476,7 +2476,6 @@ GuestDeviceInfoList *qmp_guest_get_devices(Error **errp)
             id->vendor_id = g_ascii_strtoull(vendor_id, NULL, 16);
             id->device_id = g_ascii_strtoull(device_id, NULL, 16);
 
-            g_match_info_free(match_info);
             break;
         }
         if (skip) {
-- 
2.25.1


