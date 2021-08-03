Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A25EE3DE5B1
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 06:49:17 +0200 (CEST)
Received: from localhost ([::1]:41256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAmMe-0002cI-Oh
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 00:49:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mAmEk-0000sT-N1
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 00:41:06 -0400
Received: from mail-dm6nam12on2061e.outbound.protection.outlook.com
 ([2a01:111:f400:fe59::61e]:59233
 helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mAmEg-0006lP-1r
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 00:41:06 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LjhDHCgaIkZZOpwUnlZJ9EKWbvNnge3iwaNniz8TDvtLf3QvCfdlxC0b9OtwjhOxjR7YoE9BwWgTuByLJE1YrsQG8lsmQnoJMyDFTSHTDTgYYDBvJ3r/Pzk12mEd+SSM/nrf4AtxI2WvZXO4aaarmLzc2ByP9mf/8bUeIFZEdqlD98yxF4YGbGQl4pl+Tv7hQvaUCxpOXCGXz0ZBzyQ0a44Z46W98UHdspswi3YA780SI+GCrkFev+zqW9x6+Sext9c64qMujA4kxXN9L6OGovWsXv3rcl0vhCbd/2HsjdArnce0EeapEVGoDmKZKnFw97PkzGNs4r+i2Crssk6CCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/gGyydD9peBAQDmEZy04F6S38XwzKqgzV7vaqcEEh8c=;
 b=egLxichkcIARy3HlJMnR7SDTJEaP4oK7WvrocLh8DyOrcG2P8/R7i2leMBnnNuX+/WWMw+8rqtEiQ5UgyIVq+TyTWWI8Lz0pTXSVFn4d3NNwo+93rfy/Rx4axfaTyC4LoCWZlCo+FIJsHsVQdwPj5QpuPvVc9rrW77Z1a7crgbZ2xMa3YYYLQiE2t4QDWV8eKi1a6U2xBAqktAY0faDP5gnkMC2Iii69n4+FYZqpTbv3pWzAcKKHPP31OpYrI/g1UE/jsxQaIR4+bXqBwNzBdmHale1CNYwWruY/oGOVmztoUQHXkbdpZvLxo3rCixZQrR2W6oZo7rbcYApfLbp0uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/gGyydD9peBAQDmEZy04F6S38XwzKqgzV7vaqcEEh8c=;
 b=Er1zxeQcYq1bo3lt+WL7M0OysjbHsfOWthVtREEQYcBcwGK1DPfyO+JeMHkM/WCddELvrgI0vBqehEEtmsOEExuNpUgF9Bjfh+PmqhgjyMwL9KU6LmcPKZhqFA608isP17Sx80DF9c4tM3QxvnqHXlB2Yvd5BiufmdlQCmrIlaY=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=amd.com;
Received: from CH2PR12MB4133.namprd12.prod.outlook.com (2603:10b6:610:7a::13)
 by CH2PR12MB4822.namprd12.prod.outlook.com (2603:10b6:610:6::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18; Tue, 3 Aug
 2021 04:35:55 +0000
Received: from CH2PR12MB4133.namprd12.prod.outlook.com
 ([fe80::d19e:b657:5259:24d0]) by CH2PR12MB4133.namprd12.prod.outlook.com
 ([fe80::d19e:b657:5259:24d0%7]) with mapi id 15.20.4373.026; Tue, 3 Aug 2021
 04:35:55 +0000
From: Michael Roth <michael.roth@amd.com>
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 Kostiantyn Kostiuk <konstantin@daynix.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH for-6.1] qga-win/msi: fix missing libstdc++-6 DLL in MSI
 installer
Date: Mon,  2 Aug 2021 23:35:36 -0500
Message-Id: <20210803043536.1071251-1-michael.roth@amd.com>
X-Mailer: git-send-email 2.25.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN7P220CA0012.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:806:123::17) To CH2PR12MB4133.namprd12.prod.outlook.com
 (2603:10b6:610:7a::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (165.204.77.11) by
 SN7P220CA0012.NAMP220.PROD.OUTLOOK.COM (2603:10b6:806:123::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4373.18 via Frontend Transport; Tue, 3 Aug 2021 04:35:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 96f88458-ca89-40ab-2a99-08d956382ead
X-MS-TrafficTypeDiagnostic: CH2PR12MB4822:
X-Microsoft-Antispam-PRVS: <CH2PR12MB4822C11B825207B02CE4635895F09@CH2PR12MB4822.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bkGJQiyPKYE3jw/fwNQD6yy6UQqAbL7QB3cSdL3q0yrtZ74tgIrZ26DNA9VFK0VADBEDWCNoNaZoqcnE3qCAFqyJTi08wxSDpJ5ygxx4MudyAGKLSkHolnPRdbANS8bhQrrdc1ZWzb3pg82uE1bISa34G14TtcYaoARieve6dn9JAjDYOc0z2bH5SPx3Mbz+RaKoaRA2BDtBjvnpeBvO9oPi5F77YRc7ANb6x0kKjH5iXnxbQxgphW4HtHCOdW2JbPeUQR/uNNe+VqNuEbUJtn5HB9nZdIwbMFj3lj66DLVr6J/rQWPwGt8eRv77r0dwhoLahK4uBUoYKDKc8k8KyQqqlF6h5MD0g8LnMVjUY0qy4B8Mf2aELtIEdAPzKnTw/PovqmRN9zZbpRZwIZkFstN9AAYoBLTzB3cs9GCAudDLvD52cfxiBeWpYh5pvb1hxtI5QFHWnLkRafGJu9QTczwJqvOSXAn7r7Moc1Z92y+L97+cBY7DTY8demC9WGCi7TdT8ZfO7tZbBE8E7opgGu2FQQsD2nBrcV417P4KRpdJWrmBga2S+NYnUCdIU2yJAGhWi/GPlREWSGRn9ulYRI/cmrQPQaxjMuUk/KU8y4bPhUogW3YkYZYDipNS2LX/U+/zlISfCATdDwF/e5N1Af7NUiRTqKqmlURy2uRaDJ4n1tV76CQIxV6a6ydGSgsguA+SRJXPyP/7GBQwhE6HUQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB4133.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(376002)(346002)(396003)(39860400002)(21480400003)(38100700002)(6666004)(8676002)(6486002)(6916009)(8936002)(54906003)(38350700002)(52116002)(66476007)(66946007)(66556008)(26005)(44832011)(83380400001)(316002)(36756003)(4326008)(86362001)(5660300002)(478600001)(186003)(1076003)(6496006)(2906002)(956004)(2616005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bEVMejBDdHlZQ3pnQXFXL1dlWlJVeDN1N0ZTanJjR0dzSmxTKzB1R2FRZFpR?=
 =?utf-8?B?VC8vQ2JNelBWTUNCTTlCVHNLSG5VQjNIaUQxbEdlM3Vwbzg2V0dOWHNRcEJ1?=
 =?utf-8?B?alR4dlNqTm8wSEZPQ3phc1Z5NVp1QWdLOElPdTdiemNWcE1kZnp3VlBsWWFj?=
 =?utf-8?B?eFdFdFhnNXpNVUZuRUcvOEthZlhjWjZNc1NTTlFhL2xrNzlrVnRtRldIeUFu?=
 =?utf-8?B?UTJVRGN4ZldiMkFma29DaWN5TGtxN1JxTExTS1hCb3BYM2o5a2VWRnhRa3F3?=
 =?utf-8?B?NEFZWTg0T290SWJydDRLODlIcDFTTjltTmFSaEdkNGhnVFYyellSQWk0OG9n?=
 =?utf-8?B?UzlhVm5zd0FaR1ZIT1dnRjR0aE9HUVltZHpNOWEzTnZaOXBpT3ZUS05GR0RE?=
 =?utf-8?B?eERqUm0vSjJ2cHFPd3RyVm5WQjMrSzJmYWJ0aUpIamgvbkp2emlwdzJWME93?=
 =?utf-8?B?UWtjbll6RUkyLzhlSzFXcUhSOVQ3T0VlM1dNMVVXejJvZXp1Y2xqclRXd1BQ?=
 =?utf-8?B?cGtsR3R1UnM4d3VVSlBXbURyOHlBbFhqVE5Ob2tMaWhSNFlLcmRuVkdURWFw?=
 =?utf-8?B?VVJIWkdhYjdUa0VSTWVXMXJvY3hxeDZheXdDVkFDU0k5WlF1dzJaN3h5T29j?=
 =?utf-8?B?ZjlERjJBZEJiSXVuUkVpNklhTC9MYnBDWEJoVTBCRXpiWWFscWRkWlA3cjhU?=
 =?utf-8?B?WXJHQjh4a2FQOHN4NkpwbFpxY1loaWttQ1ZlYTBPenNlaTBMWFY5V1g5eEs1?=
 =?utf-8?B?bmJXTk1BQmxQMEVROGMzb3c4d2x5YnRBNXM4WmZVZkh2RGZ2WEdtOHo5SWZB?=
 =?utf-8?B?amxoRTQwNkdBZGJrQjJUKytiTi9TQ0REZmRvNjhTa2JwcUNDUU9XTFRvS2Vh?=
 =?utf-8?B?SE1kYmhnbWwvaDNQMWJaVGV3M0w3cGJvMFFrNXJ5ZDRuV2Z2UmQ2eXk1Nk1R?=
 =?utf-8?B?OGVwdzNjcEhDdElSZWhDMmRNS2hkY2Fma1pIeDNibmdncnVWK3JDOXJpUisr?=
 =?utf-8?B?L3RudTNNa2pSaTArK29aRHltc09UMFNsU1R0ZG5oOGdjdnFtZVBuWnREeFl1?=
 =?utf-8?B?RzlISnJLWmNxcCtPNEIwOGh2MWxpc1oycDNIYlAyWjRYRWp6V2ZQSmlMTUpC?=
 =?utf-8?B?UFk5U01TVVFCTnlXczBBaEh3OTZ6cTlVTFJKck1UUTMwazF5ajF0cXJGdWVD?=
 =?utf-8?B?NDNFUTZuNmY2SlNRcEJMWDljYzhGaU1DK3FNeFdvcDRzYWhmYkFETDFOYVRw?=
 =?utf-8?B?TWJneE01T2tlN2trMXphTG5DRFEwZlFIb3FMQUpraE1ERFhyT0RiMVpJZVc1?=
 =?utf-8?B?YWdLNW9JVlFiVC9mY1BOdGhnTHIxaDFtL2l1TWU1ckttRVFUSFZZR1NHVFE2?=
 =?utf-8?B?R2hkOXJaazhhRXNDczBVVkNlT1JaWHk1bzdmL2NEdmRNdzVzMkZLMFhHNWlM?=
 =?utf-8?B?QjVSTXM2ZzU0azViYU1jTjVqVW5xaHhZbkxjZDdOTFMwdE5ka0xveDZ2a245?=
 =?utf-8?B?UjNMQytQcGtzczBRam1FaU5acDdpWjBVbUowQTZQT3gyL3pjcmw2UHlNMlNt?=
 =?utf-8?B?WTBuYmFEc1dyOUdwYmNkLzdUNm95N01hUlBMRHJPZWhxeElMeUFYM3RlYUlw?=
 =?utf-8?B?bytXRE1ZMUtFVW5tS21oTm4wbklBa1h4Y3pVeGMxWk1jWXNkQXI1dlZ4MURN?=
 =?utf-8?B?bEVNQ0IyemJheGNiSHZMd21NdkVldEgvWlhjVmZRZnBSSDhrNUtxcjdQSnFz?=
 =?utf-8?Q?OAgGpGri8yJRnjqA6NLiPWZ6VXcyk0WkCqlzm6e?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96f88458-ca89-40ab-2a99-08d956382ead
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB4133.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2021 04:35:55.2417 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TbfxY6vlHJQJLjpvVfM9ekV7bcGZ7e/bV8GAeX7i4k4LH1KVwxvbf5xH0nhzZ9rKj0CenJFasDnlmUHtnWu1+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4822
Received-SPF: softfail client-ip=2a01:111:f400:fe59::61e;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM12-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
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

libstdc++ is required for the qga-vss.dll that provides fsfreeze
functionality. Currently it is not provided by the MSI installer,
resulting in fsfreeze being disabled in guest environments where it has
not been installed by other means.

In the future this would be better handled via gcc-cpp ComponentGroup
provided by msitools, but that would be better handled with a general
rework of DLL dependency handling in the installer build. Keep it
simple for now to fix this regression.

Tested with Fedora 34 mingw build environment.

Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Kostiantyn Kostiuk <konstantin@daynix.com>
Cc: Marc-André Lureau <marcandre.lureau@redhat.com>
Cc: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Michael Roth <michael.roth@amd.com>
---
 qga/installer/qemu-ga.wxs | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/qga/installer/qemu-ga.wxs b/qga/installer/qemu-ga.wxs
index ce7b25b5e1..0950e8c6be 100644
--- a/qga/installer/qemu-ga.wxs
+++ b/qga/installer/qemu-ga.wxs
@@ -84,6 +84,9 @@
             <ServiceControl Id="StartService" Start="install" Stop="both" Remove="uninstall" Name="QEMU-GA" Wait="yes" />
           </Component>
           <?ifdef var.InstallVss?>
+          <Component Id="libstdc++_6_lib" Guid="{55E737B5-9127-4A11-9FC3-A29367714574}">
+            <File Id="libstdc++-6.lib" Name="libstdc++-6.dll" Source="$(var.Mingw_bin)/libstdc++-6.dll" KeyPath="yes" DiskId="1"/>
+          </Component>
           <Component Id="qga_vss_dll" Guid="{CB19C453-FABB-4BB1-ABAB-6B74F687BFBB}">
             <File Id="qga_vss.dll" Name="qga-vss.dll" Source="$(env.BUILD_DIR)/qga/vss-win32/qga-vss.dll" KeyPath="yes" DiskId="1"/>
           </Component>
@@ -164,6 +167,7 @@
     <Feature Id="QEMUFeature" Title="QEMU Guest Agent" Level="1">
       <ComponentRef Id="qemu_ga" />
       <?ifdef var.InstallVss?>
+      <ComponentRef Id="libstdc++_6_lib" />
       <ComponentRef Id="qga_vss_dll" />
       <ComponentRef Id="qga_vss_tlb" />
       <?endif?>
-- 
2.25.1


