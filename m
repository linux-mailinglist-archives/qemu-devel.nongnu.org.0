Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCECA3DEF15
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 15:30:04 +0200 (CEST)
Received: from localhost ([::1]:34764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAuUd-0006Mk-TA
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 09:30:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mAuR0-0000Ze-Cp
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 09:26:18 -0400
Received: from mail-dm6nam11on2057.outbound.protection.outlook.com
 ([40.107.223.57]:17105 helo=NAM11-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mAuQy-0001hC-PW
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 09:26:18 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KqDe7hlC+b5/sVg6ai34w5UXwlmPKAkPNhgZZfVZ0/2ODINuwUL7BaX9vC9VkI028r7uiPHc5x6IZQI5AN6fQ/CGwIxMwtVoTvZVPlullw2iXTxuesoz/cM+bSyAt19lYaQC07E2rT4iGtDXpql7P53LBrx4aJb8kXcziT38opWqRSIUa/By+cqkiYyps8XDjyAxsdPufBhHAMoWozPoK33DC5pWpxN/JulI781f8Ux9ftWF0ixplTukVB2RUKqidLx9ggZnGBVz7ofFBWyURigzyRw0WK+E4q49SPfJlVMFDfN4yeHDWhnaUO4BWkfQ4a6lY+U3Eqf+0PXjrLaKMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UTCARjOvbloP4QP00vMd7GwlXb9u1YH8LoPSomMtPLM=;
 b=F10exrf9VTtL29KdOXNGl7UXYvbeth4P7A4pFPgXskgo1NQ6+LDOuH2qOX95EDqkLb3uMC2OOl4BwbYRUu98f8yBQS6OkPKv04Egk1SXUJRmgZl5bGAHUAUSUguflEInkeNQLsmz6MAHMKgpHh0Q7vHqUfbSgn+WZgZOsgxSVqMFr1+uOK00fy/z7aPTp48Q8xrxV08BgURQyfugSmMwKkD16mvVpXi6OPoglnNoZazop6T9y+sHmV8+u5EFweoBnz5Zl/ZmBit7515vAX9fmdxGd5YmNRF1h3lAkOgBqx46ikInAptywUFOszKKoFgIG3k9rdNLsd1J3lXaV1Z1gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UTCARjOvbloP4QP00vMd7GwlXb9u1YH8LoPSomMtPLM=;
 b=k66PpimE2mDXJBVGO3qFbm9wJ6Zpp+uOcLiZ8fOTltdthUSA/nmtlzXDIqzvlFOh3wXSyHO/6GbYZ3qPYZQ71mjOMjUpNB+gtMOykknvBuz2irfgP72b1Ixify21+N0nyGSmIH0q8cyBu6H/h77a27XW+B2tC/qwkjA6VCrttvU=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=amd.com;
Received: from CH2PR12MB4133.namprd12.prod.outlook.com (2603:10b6:610:7a::13)
 by CH2PR12MB4184.namprd12.prod.outlook.com (2603:10b6:610:a7::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.25; Tue, 3 Aug
 2021 13:26:14 +0000
Received: from CH2PR12MB4133.namprd12.prod.outlook.com
 ([fe80::d19e:b657:5259:24d0]) by CH2PR12MB4133.namprd12.prod.outlook.com
 ([fe80::d19e:b657:5259:24d0%7]) with mapi id 15.20.4373.026; Tue, 3 Aug 2021
 13:26:14 +0000
From: Michael Roth <michael.roth@amd.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Gerd Hoffmann <kraxel@redhat.com>,
 Kostiantyn Kostiuk <konstantin@daynix.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PULL for-6.1 6/6] qga-win/msi: fix missing libstdc++-6 DLL in MSI
 installer
Date: Tue,  3 Aug 2021 08:24:52 -0500
Message-Id: <20210803132450.1093602-7-michael.roth@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210803132450.1093602-1-michael.roth@amd.com>
References: <20210803132450.1093602-1-michael.roth@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN7P220CA0020.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:806:123::25) To CH2PR12MB4133.namprd12.prod.outlook.com
 (2603:10b6:610:7a::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (165.204.77.11) by
 SN7P220CA0020.NAMP220.PROD.OUTLOOK.COM (2603:10b6:806:123::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4373.19 via Frontend Transport; Tue, 3 Aug 2021 13:26:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4782bd8c-012d-457c-9bfe-08d95682442c
X-MS-TrafficTypeDiagnostic: CH2PR12MB4184:
X-Microsoft-Antispam-PRVS: <CH2PR12MB4184B72DD0CFDA20F22394DF95F09@CH2PR12MB4184.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +xiWOAc5TLdgZYk63BACKdoH1+BQkpIh6XnPcrlR3ypehdGy4Io99b5wSvGmRiruOtP1yFkpn5HkA3MhebJg4K3PVESzp+66zOWSRv3HImvrNGFUgsd2vqMJH0ANyonXAJOWvg9yZDCi1Txy20xzURMke6fNzKjG+UXPXfI+LATI9y2L2n0F9Xbdw7TKA5SG7+XR30OKTuHvFSKcPPE/7niezKqFaTvnXT1pNulunoXDox6oL8Ow2+2tHTN2F3LCQ4804fH+qmKlCL80wCEdu/FidRsZArV2EJINgSNv6LwQySk6Cbi3FEn583CgUdgHqM19btxVZn/HgRRmYVG60lGmxeeROQt+nLHzu5Rio+Owx+yTAeHJnw0fQTI8pSzQKgl74kC5jN4P7d2NnAScoZ5QrBHWZTu5H40zd5SuFjirJzEcOACwx41jAYMxOhVvZf+QLYTpXvXYOOVsUh5MbqLdu1jLIC38fgjoSm3zET5F7GlMD3buttCoO4zXGX3HghKwXtzasIykuH/JZtljmD195OQegMVbkSMabpATYjhvXZru0asEIUccEoGRcg29oVyh8X31Johtv+t9dwMpZGj0nF2PU8ewoo/oey1zFx3i5A29JQG+RQ59FYjFzUUAcib5gykawpqaG4MHDE6edxGel3LhZGKRMq3qjBFq7NzlR3dlzuZXXBeKpjRfh5EuDYY31N/osMoCENON8ydlTg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB4133.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66946007)(4326008)(6916009)(21480400003)(38350700002)(1076003)(2906002)(86362001)(508600001)(36756003)(38100700002)(66556008)(66476007)(26005)(44832011)(5660300002)(6496006)(8936002)(6666004)(52116002)(54906003)(8676002)(83380400001)(2616005)(6486002)(186003)(316002)(956004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?amZvZ01OQ2VkNUVpWkI2eDQvOTFkc3NNbVlzN0daZ2VYbUg3VHZldEpPM0xl?=
 =?utf-8?B?bmRncnU3d0VCVSs3MlJ2QzlkSGpSQVR4V0p0L1pRY0dVSzFUK2ZVdVA5WEVp?=
 =?utf-8?B?MENvTjdFbGY0WG9GTWZWU1ZoYnBlUXVRTnpyRVY1NnZZczN4Z2E4NHp0c1F5?=
 =?utf-8?B?enh6RjZsKzd0aGc4clNTWlU3WnBtMDZubmlyWHVjVDkzT3JPSXB3VG92c3BF?=
 =?utf-8?B?WG5SMzZlQlNRNXpuVUFDWEpJa0pXbGpXcGl0TnRIUHgzcWtQcnptTjBZUDhC?=
 =?utf-8?B?NUpRczZkNVZMSllYU25va0hPRlRsUGdqeDNNTzJiR2Q1dE0wUDFPMzBCQWRT?=
 =?utf-8?B?ZEZvNFFlUUJCc2lpcStXdnZ5cEFiR1RUSC9qYkhYQWVXei9TTVFIRStPRWpJ?=
 =?utf-8?B?SjNlVnRzUWxPQ21qUU92dnFYYWZXcU9pbDJxcnpXcG5zKzByc1NLTnM1cEY2?=
 =?utf-8?B?RStSdlFQQVd1V09pRUs2KzB5eVFqWFVvVXJXMVMrZUhJRlNTS2RCd3QvWWh2?=
 =?utf-8?B?V3BQSkZldmdGNWhFMlp4ZnpUaE0xRGhEeUJsS1g0c1BPUHZnVUlJbjlJUkl3?=
 =?utf-8?B?YjhKWWlDTENBeVQwZ0dEWjZEbEtiRFdUSG9FUmoxQnlrMElpUTdHeGJYT09J?=
 =?utf-8?B?Q2pWRHBHNDhkTlFRbEVheXY5Z3JpN29ZdzhxUVpwbkhoamJOWXJtL2FxVWlN?=
 =?utf-8?B?d3lnT0xucVhpTFNlb1J2NkZ5eklZZmJZWTdoazlTVWtOdnRUdUpGdnZXdDBj?=
 =?utf-8?B?YVpZMG40SWxya0xhOWhnaElnWmNHY1pCWUlTWVBYdGMxdmFnVjNMcTIxaUkz?=
 =?utf-8?B?djFYMXFsZ2dSa3pjVlQvSzlMWVhETWpxd3Izei9SeGZEQ0Z2SUNlRFJqb3Ry?=
 =?utf-8?B?bHd3M3JhRDhvdXRleDZWR2taUXdyek9Scm1DcGNYVktYY1ErUFZMVWdkRkps?=
 =?utf-8?B?dkVjSjZKRDhsMjN3NVVFdHN0M1JVZW1KeElkTEhqMTlmb1FMdFZoUCthTFl4?=
 =?utf-8?B?UWF4a0hYeldOUWZFOHJ2aitWSEp2ckE4ME9EcWVJNkRlWjZVL1YweG1FU29v?=
 =?utf-8?B?K2ljZjVMZTRGZkZWcFMwRXEwbmVhSnNzcVpJaWhwTm5MRzJaRDlNVmd0Skht?=
 =?utf-8?B?dE11Ujh5QmV6OVU2MkZTMUhQMDUzZ1NtL2hKaTVFcjVZazZwOXExbit6ME1w?=
 =?utf-8?B?UHcxN2tjbHcremN2emNmWnBFajFGYU53eDl1U2lRN0o0VnNMdExXUlQxSzVk?=
 =?utf-8?B?THA4dGVtNm5HSFdsMjZpTDk2cnZRWjd2UFZYcks3ZFNNVDBCL3REeTF1TGUv?=
 =?utf-8?B?ejRrUTM1VmU2U0pkYkZ2bC8xM3NnWlk4c2QzYjc3SjJhajd4QmN1NEdLdWlq?=
 =?utf-8?B?cUJoclp1b1VhNnR5dUFDU0J6MlE5ZVZSdWJjbnhQNWRrTGVVQWh6N1RTOGlE?=
 =?utf-8?B?dTNQb2xNSm5nNi85OHJsREp4MjhXWjdNQWtIM0hIKy9sbm5NeXRLMWphc24w?=
 =?utf-8?B?eUl4UDExUVQ2alhpU1FrZXpsMnR4MGltTi9FMUVPdkRzREZyUVMxMVN4NnhC?=
 =?utf-8?B?UnRjU1FhVmkvdG9YbkM0N1pGdytVOVFLSVNndTVFNkNkU1BrbW5HSG82Rm5V?=
 =?utf-8?B?cE1RYTIvU2d1VWlScWx4MFFxQ2VuQndBZTI0YWZzaDVVS0ZCOXVDa0VYeHpm?=
 =?utf-8?B?QjlKczhRTTlNaXNPcksreElwbWdHb1Vuc1NpNE5XUFNacnl5cnMxSkdWUWVl?=
 =?utf-8?Q?jxnqtdgnWg4z9iHL+9xfG50E2XP/xkQECH8D72b?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4782bd8c-012d-457c-9bfe-08d95682442c
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB4133.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2021 13:26:14.0312 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yHv1rxmPODHs/kEFmOaN1TeofauFLpBPFvVQI+ECj0uKLPPtC1usTJ0SkPmvMkkiml2AzvX5VaR+xib6Rm/KWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4184
Received-SPF: softfail client-ip=40.107.223.57;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM11-DM6-obe.outbound.protection.outlook.com
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
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
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


