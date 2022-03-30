Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDE0A4EBAB7
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 08:21:50 +0200 (CEST)
Received: from localhost ([::1]:42490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZRiH-0007n5-Se
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 02:21:49 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kshitij.suri@nutanix.com>)
 id 1nZRYs-0004q7-L4
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 02:12:10 -0400
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68]:60024)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kshitij.suri@nutanix.com>)
 id 1nZRYo-0004fU-HW
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 02:12:05 -0400
Received: from pps.filterd (m0127839.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 22U56FkD011857;
 Tue, 29 Mar 2022 23:11:58 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=DzRXT/But2HhILKkPJKu26+zL1J8mvsIr4v4PjjpoXg=;
 b=hmnipULYNIfvOBLPRiYdlbdLMilc6MDlMW53Vx0CFytt7NrmHnqWo7bMHj4iTgHDNF/F
 CkULqPDFvBjs5OdDjChPR2kXXbdIWJjOcihgyREetPztzUHz4hMHPOIbSL16Q5KpAuAY
 YlkqBE+llHetWMvPF1lFRXyH6tt2KPBcmtPc4UtLb2zqofDiLJ9kTTeJm9wdT+O8AC/P
 Yth0uTA7NDYFYcEGNRQmdsI5Xlx3Jr42GrID6sSqqhc+0MRPZbVGilxi9R0Jb1VECafw
 hrdPaHP8VUYjTq/AE8fw/ELPmDgoz1+FZ4plF7O4Koec5b434cKwvshzjJf7OFqpVR9k wg== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2168.outbound.protection.outlook.com [104.47.55.168])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3f21wf7qap-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Mar 2022 23:11:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fjN9adg+pn6GayoU2E0j/QQWCKjlomO9GI0eFz1vhIxZHz4hjjTtR2Cn7P4ptRc5cQIeSk2l+DEWykFuwd8trSsiXeLW7Vldm3FwSOXOEQ48SZif5Td0Z5lC9NsaKb3CHHm9r3xratmaa12fS8PjGlLthoKvVfdoz+W9ClM13nOI4MCeW7+yaMfvs55I2y4ruG7SYz5A4tnVJa32+6so0nTQUf4NGaIfWhkHsLTQ+S6yPg6wKlvKZxNp6ic7DIXbISBg58y53QZGyaANSt746yMopeE/StWkAJV1kOstsgwBjrSwbEU3h3PzCz9W6Cygdk5luEOm+gi8nnDvKLiG3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DzRXT/But2HhILKkPJKu26+zL1J8mvsIr4v4PjjpoXg=;
 b=KMQGRT0GiM10TVJXQbXBwpD0jnXyN0JbDKStKD+Z18ADNzUxvJGJkVIGDfPzsPS/bhIGkOZmzgz8sNz/x8j1LhQlwd70SVM+P67HIHHvYFfez8LtItVkvwzrr93Gc8xZH6CZprlrsATz/4okQS7MMPTVMuNHuK1tlt9KukX/Xa1oQ2SJGSzFM04QWhNOOcssXoDTKo36BctxxpToN7Lf64KRE+TovAyJBqqExYNQluUzUqlGg6kBclI0t8wXZPIZnRltD3HCeQT0vOncLnOS6ZF18URbL2BR7WM8BZoc1QHyD4Kum6disSgS5KDh1uvIejWE61hnX5fhygJk7RqjKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BN7PR02MB4033.namprd02.prod.outlook.com (2603:10b6:406:f9::16)
 by BN6PR02MB2866.namprd02.prod.outlook.com (2603:10b6:404:fe::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.19; Wed, 30 Mar
 2022 06:11:56 +0000
Received: from BN7PR02MB4033.namprd02.prod.outlook.com
 ([fe80::5d3d:384c:d914:b12d]) by BN7PR02MB4033.namprd02.prod.outlook.com
 ([fe80::5d3d:384c:d914:b12d%6]) with mapi id 15.20.5123.019; Wed, 30 Mar 2022
 06:11:56 +0000
From: Kshitij Suri <kshitij.suri@nutanix.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 1/2] Replacing CONFIG_VNC_PNG with CONFIG_PNG
Date: Wed, 30 Mar 2022 06:11:33 +0000
Message-Id: <20220330061134.59254-2-kshitij.suri@nutanix.com>
X-Mailer: git-send-email 2.22.3
In-Reply-To: <20220330061134.59254-1-kshitij.suri@nutanix.com>
References: <20220330061134.59254-1-kshitij.suri@nutanix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR17CA0043.namprd17.prod.outlook.com
 (2603:10b6:a03:167::20) To BN7PR02MB4033.namprd02.prod.outlook.com
 (2603:10b6:406:f9::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c179bb79-1bc5-4d35-9bed-08da12143123
X-MS-TrafficTypeDiagnostic: BN6PR02MB2866:EE_
X-Microsoft-Antispam-PRVS: <BN6PR02MB28663BFA0F5D0C2F9C880B90991F9@BN6PR02MB2866.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sVHLeGuWD41gTGfNl+ynUPKwU6gAJQ7oIr6DMF084cWTQS/FJKhcUels+c/oIXhKzqPXPBJ5KXcGck9FpPtpJbQAORRi3Ii5naKN4JBocCpBAa+m+nkpWqXwvgfUgb9fJtnxzvBuQ507UGY3rRCUhyxVS3NdnUzk+wkT/AodY0FMIIsP5oCDyGLEyJssWrcyNjFUo0JT1m9d9YRLQT+hxXj19uD/hsyPHMxzfTV/7CwXzcc4ZI0J52Hzs0Q1n8Ov+Xdnb0lCo9lVBxuE28rMPTQhSWmeAdQqkCx93cwNtccX6keESILeoNCvw6gKtJpAEzSaOffINC8ReA0mpmbXTaurulbVkUsC/SSqxRcqkjgtjht3lX3JDpIIdopoqtpn8kdE7eHV4VmInZKzyfBN9cExO8EGVR4zhzriVcfsk3pGK/YgHAF5tZtuGK8NN0UPcOYUWXa0ijffBciVuSxK13ix2/LIE0PQX4XmFbRjqPIyJkwEFYjX180unKVoxugVpxxiNkdRqjNEccusU277eSpedMLQuuIAf5KFD1mOm08IK0e0eZXJOoDh3F0igARlCH8YSVkjDUuS7VZzQ2a9nuMUd1PTbeOdY27TKZ6SB6LcMb90T1/vub1SCgEY/2ax2bEwvff8E32SqPHSigTNPqyN6Of1TrfZ9p5thk1pY9N1KaGAvl3PCW3n5Xuj4F76c2Ldz6K+rS6u0M5CdeRymw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN7PR02MB4033.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(2616005)(6916009)(107886003)(6666004)(6512007)(6506007)(66476007)(66556008)(36756003)(8676002)(66946007)(86362001)(52116002)(4326008)(6486002)(5660300002)(186003)(7416002)(44832011)(1076003)(83380400001)(316002)(26005)(2906002)(38350700002)(38100700002)(508600001)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cVJsSU11MDVVMlAwS1ZZNzM2a0xZcWxvLzZERGR1NVNLNFlFS0lWeSszQ2dI?=
 =?utf-8?B?R2JweE1SRFFEdGV3VDhWcjR4bGNKVkRFa0NKY3lURUJKWHFXZTBrUDdRRWxG?=
 =?utf-8?B?ckRXaUxpVWdqZVIyVmxkSDNyeERFYUVBWWVDNW05S0szR0pnMWZlamhMY3c0?=
 =?utf-8?B?bWVvNnZQN1pPZUdEK2xncU4yTHRWanBma0w0Y2Z2NmUzT3hoYndQS1hpTnJp?=
 =?utf-8?B?bGsvc0VJd3NFS2oxWGllcHpzZnp3MmlMemFTTlJ4VzJyV0pmelU2LzNrODdK?=
 =?utf-8?B?TFpBL0J2ZVdzT0ZBQ2kyczFLUjlNSjhHNEZtMHF2TmdtSXBXQzVmTEFjZ3BF?=
 =?utf-8?B?ZkFzNEVVdXV3UEpodVZUcCt0ejJ1T3hmLytmNjhwNHE2TmlacEdqV2FPY2hC?=
 =?utf-8?B?MTFPRFVvbVU3Sm1aY25qK3lkVE1qNzB2c2JvNXdJa1NqbzNXZVZuRVNsSVd6?=
 =?utf-8?B?NUViUUpvcjhvTXF6VTlFY1lvdmRxVXdHeE9UVTJPOGR0RWZuWDkyZU0wZjdi?=
 =?utf-8?B?MkliZ2xzRmdmZFdNM0RrVFZmVnpQNnQvRnN5eVhFVnVvUXd3bXZNaUgrRHQv?=
 =?utf-8?B?ODBJemNkTjE1SXV3RzZnKytZRzIvcHdPZXdPWElteitiSiswenpUYzJ0S2lP?=
 =?utf-8?B?OTE4OXdTeFFMejlWcnVEajR4cEVJcTBWd0hqdlh4dUJHUGc3WG45dmxqejV3?=
 =?utf-8?B?bC9PUVdBMzRTOEZSYzBZOEtoT0RBQWRpbGpLT0V2YlVJbTlneVhCMjVoc2xk?=
 =?utf-8?B?cmNjck1GKzVjTFVZTTVxZ3hpckxta2pWREE5dElIc0VERG5qa2ZpbWpPOHl0?=
 =?utf-8?B?eXJDcU9FcU9FZnpZd0xwTzd3TUtJOVg2bm15dW5TL3poZkhCQVd6VmZ1R3cz?=
 =?utf-8?B?dUh6Q05ZVHJmb2xObHpkSTE5bDZiSyt6WEkrN2RFekpnTHh3SHg4ZmkxUy9w?=
 =?utf-8?B?UkxQNStINjhCY3VZcCtWVEZVZ3A0ZE1sSW43d3puS3VCSEtSSXJQWGlPdmJr?=
 =?utf-8?B?ZytCSkxkaEM5dDV2ZlNDT1lDN1pqaFJCRlFxOStlUmxjVlBBNmg4Sk5xR1Q3?=
 =?utf-8?B?WEMzWWd2S0lHZkxTVitJelBQNG1xRWIvWHdpc0x0R3RmNmpIQ20wMUJhSFJU?=
 =?utf-8?B?RWp5d1hnd3NRM2k2cXcySXozWjVWdis4N2doS2l6OHlpZXg3ZXpEZ3Vod0RR?=
 =?utf-8?B?RUtHeHFCVVM5clNObEhOL0JKUDFGZ01oc3lrbnhlT1NMaFUveHpSMlBOZjhG?=
 =?utf-8?B?aExWakEzMGNZa0diaE9jKzFSUitqUThyam83eEorUHBmZ2E5QUN5K1ZzanM0?=
 =?utf-8?B?MWYvWFR3VjV3aUY5ZjhKU1lUWkFNZ1p5NW95OG81UndTOFh4ZXVsb3ZMNFUr?=
 =?utf-8?B?dWU1Y2o3SytpOG94dmNNcXYwaGlGSDI5dGg0eUc5MWZ0dDRVanhZNVJVd2Q5?=
 =?utf-8?B?ZmlXMWZPWEc0Y2lzejZXMmt4em8yOTRaTTlvSlg4SCtiMUgxSHFVN0VVZ1pj?=
 =?utf-8?B?RWlFeHQzdXpRZm5WMUNWWElFSnZJVXY3WWlQK3NiN1FTMFdXVjZ3U2k0b0FT?=
 =?utf-8?B?YTZnSUFGZ2tsQ1VaemYxSENmbDV1TzdscFpLY01OaHhmWFVxdlQ3UEdPRkxj?=
 =?utf-8?B?UWNoMVNtbjFWaVNBZDhObkxZeHNTME5WalZhUkZzODVJaTR6SmFFbTZwUHdN?=
 =?utf-8?B?UXJOOW9jaXJ0eGhWcnBERHhlQ2w3aUhIemMySlRJSE5ZcTdET2x5RWgySUtL?=
 =?utf-8?B?a3Y5NDZSd2ltdDBtVmpqd1VvRzYweE9XME9seXJwbXdBMmxlWFU2TkhCdkdB?=
 =?utf-8?B?Qm9oenR4MWREbWxrK1NldnovQWt0Ti9OVkJGd3hxbnVsckxQd3k2NS9CUnFi?=
 =?utf-8?B?NkVtYXFJcE9NcUh0YTVzdU9ycHYyMWJDN2NLK1ZCZEFlWE5OcU9WYjBtVmgy?=
 =?utf-8?B?NjZDTjN2dk1FbVMvajFlUFZCemp3YmppZFNYemRhOHo2V2pna3JxVitPU2xh?=
 =?utf-8?B?UVc1SUgyN3RRaXhxVGMwNHFtZHVkVzh2ckdWUmdzeUYrckllNzI4eTdnSTFL?=
 =?utf-8?B?MTBIdENSdDlBdGhXMjRub1EvbEthMUR1aGJjTXh4UnVvNlJSSlFUV3FOS3Fq?=
 =?utf-8?B?MFdNRjBpbjdSUElPY2VSUlNrYVdobVphcmxuVnlmMm5VYTFyeFMxUVMwS2lW?=
 =?utf-8?B?RGxLOEI0TFdOY0FsaUJXU1hDQ2w3Z3NSeDFuNDdVWnFEYjhBbnh5WTBLUmp6?=
 =?utf-8?B?cSs1aWdkWEtueUhiTDN6WWlPS3pUcEViSExUb0ZMWGlmNm1Nc1RpU2d3UmpU?=
 =?utf-8?B?WmFYcGFYL0xpdXAycU9sRWpybXdGSDBza2M1RFFzRFJ0bTBtTEM4b01YUStm?=
 =?utf-8?Q?A5r1BxKbiWFrmAYI=3D?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c179bb79-1bc5-4d35-9bed-08da12143123
X-MS-Exchange-CrossTenant-AuthSource: BN7PR02MB4033.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2022 06:11:56.1440 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bJGYjHNoipFL3MRpRaKJ0OLKf1S9aEBQB1IH+EIUOKS2LZxoCD+udCedINBW3qo5QSLWNrTNBJ1kucWWo2vkpSIT8IJjUOl0odSa3hMtaJw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR02MB2866
X-Proofpoint-GUID: f8ncaTVAobd4rwZ2v0E1uwIIWXhftPd6
X-Proofpoint-ORIG-GUID: f8ncaTVAobd4rwZ2v0E1uwIIWXhftPd6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-30_02,2022-03-29_01,2022-02-23_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68;
 envelope-from=kshitij.suri@nutanix.com; helo=mx0a-002c1b01.pphosted.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: soham.ghosh@nutanix.com, peter.maydell@linaro.org, thuth@redhat.com,
 berrange@redhat.com, prerna.saxena@nutanix.com, dgilbert@redhat.com,
 armbru@redhat.com, Kshitij Suri <kshitij.suri@nutanix.com>,
 philippe.mathieu.daude@gmail.com, kraxel@redhat.com, pbonzini@redhat.com,
 prachatos.mitra@nutanix.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Libpng is only detected if VNC is enabled currently. This patch adds a
generalised png option in the meson build which is aimed to replace use of
CONFIG_VNC_PNG with CONFIG_PNG.

Signed-off-by: Kshitij Suri <kshitij.suri@nutanix.com>

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
---
diff to v3:
  - Added condition to check for libpng only in PNG option is allowed
 meson.build        | 12 +++++++-----
 meson_options.txt  |  4 ++--
 ui/vnc-enc-tight.c | 18 +++++++++---------
 ui/vnc.c           |  4 ++--
 ui/vnc.h           |  2 +-
 5 files changed, 21 insertions(+), 19 deletions(-)

diff --git a/meson.build b/meson.build
index 282e7c4650..0790ccef99 100644
--- a/meson.build
+++ b/meson.build
@@ -1115,14 +1115,16 @@ if gtkx11.found()
   x11 = dependency('x11', method: 'pkg-config', required: gtkx11.found(),
                    kwargs: static_kwargs)
 endif
-vnc = not_found
 png = not_found
+if get_option('png').allowed() and have_system
+   png = dependency('libpng', required: get_option('png'),
+                    method: 'pkg-config', kwargs: static_kwargs)
+endif
+vnc = not_found
 jpeg = not_found
 sasl = not_found
 if get_option('vnc').allowed() and have_system
   vnc = declare_dependency() # dummy dependency
-  png = dependency('libpng', required: get_option('vnc_png'),
-                   method: 'pkg-config', kwargs: static_kwargs)
   jpeg = dependency('libjpeg', required: get_option('vnc_jpeg'),
                     method: 'pkg-config', kwargs: static_kwargs)
   sasl = cc.find_library('sasl2', has_headers: ['sasl/sasl.h'],
@@ -1554,9 +1556,9 @@ config_host_data.set('CONFIG_TPM', have_tpm)
 config_host_data.set('CONFIG_USB_LIBUSB', libusb.found())
 config_host_data.set('CONFIG_VDE', vde.found())
 config_host_data.set('CONFIG_VHOST_USER_BLK_SERVER', have_vhost_user_blk_server)
+config_host_data.set('CONFIG_PNG', png.found())
 config_host_data.set('CONFIG_VNC', vnc.found())
 config_host_data.set('CONFIG_VNC_JPEG', jpeg.found())
-config_host_data.set('CONFIG_VNC_PNG', png.found())
 config_host_data.set('CONFIG_VNC_SASL', sasl.found())
 config_host_data.set('CONFIG_VIRTFS', have_virtfs)
 config_host_data.set('CONFIG_VTE', vte.found())
@@ -3638,11 +3640,11 @@ summary_info += {'curses support':    curses}
 summary_info += {'virgl support':     virgl}
 summary_info += {'curl support':      curl}
 summary_info += {'Multipath support': mpathpersist}
+summary_info += {'PNG support':       png}
 summary_info += {'VNC support':       vnc}
 if vnc.found()
   summary_info += {'VNC SASL support':  sasl}
   summary_info += {'VNC JPEG support':  jpeg}
-  summary_info += {'VNC PNG support':   png}
 endif
 if targetos not in ['darwin', 'haiku', 'windows']
   summary_info += {'OSS support':     oss}
diff --git a/meson_options.txt b/meson_options.txt
index 52b11cead4..d85734f8e6 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -177,12 +177,12 @@ option('vde', type : 'feature', value : 'auto',
        description: 'vde network backend support')
 option('virglrenderer', type : 'feature', value : 'auto',
        description: 'virgl rendering support')
+option('png', type : 'feature', value : 'auto',
+       description: 'PNG support with libpng')
 option('vnc', type : 'feature', value : 'auto',
        description: 'VNC server')
 option('vnc_jpeg', type : 'feature', value : 'auto',
        description: 'JPEG lossy compression for VNC server')
-option('vnc_png', type : 'feature', value : 'auto',
-       description: 'PNG compression for VNC server')
 option('vnc_sasl', type : 'feature', value : 'auto',
        description: 'SASL authentication for VNC server')
 option('vte', type : 'feature', value : 'auto',
diff --git a/ui/vnc-enc-tight.c b/ui/vnc-enc-tight.c
index 7b86a4713d..e879cca7f5 100644
--- a/ui/vnc-enc-tight.c
+++ b/ui/vnc-enc-tight.c
@@ -32,7 +32,7 @@
    INT32 definitions between jmorecfg.h (included by jpeglib.h) and
    Win32 basetsd.h (included by windows.h). */
 
-#ifdef CONFIG_VNC_PNG
+#ifdef CONFIG_PNG
 /* The following define is needed by pngconf.h. Otherwise it won't compile,
    because setjmp.h was already included by qemu-common.h. */
 #define PNG_SKIP_SETJMP_CHECK
@@ -95,7 +95,7 @@ static const struct {
 };
 #endif
 
-#ifdef CONFIG_VNC_PNG
+#ifdef CONFIG_PNG
 static const struct {
     int png_zlib_level, png_filters;
 } tight_png_conf[] = {
@@ -919,7 +919,7 @@ static int send_full_color_rect(VncState *vs, int x, int y, int w, int h)
     int stream = 0;
     ssize_t bytes;
 
-#ifdef CONFIG_VNC_PNG
+#ifdef CONFIG_PNG
     if (tight_can_send_png_rect(vs, w, h)) {
         return send_png_rect(vs, x, y, w, h, NULL);
     }
@@ -966,7 +966,7 @@ static int send_mono_rect(VncState *vs, int x, int y,
     int stream = 1;
     int level = tight_conf[vs->tight->compression].mono_zlib_level;
 
-#ifdef CONFIG_VNC_PNG
+#ifdef CONFIG_PNG
     if (tight_can_send_png_rect(vs, w, h)) {
         int ret;
         int bpp = vs->client_pf.bytes_per_pixel * 8;
@@ -1020,7 +1020,7 @@ static int send_mono_rect(VncState *vs, int x, int y,
 struct palette_cb_priv {
     VncState *vs;
     uint8_t *header;
-#ifdef CONFIG_VNC_PNG
+#ifdef CONFIG_PNG
     png_colorp png_palette;
 #endif
 };
@@ -1082,7 +1082,7 @@ static int send_palette_rect(VncState *vs, int x, int y,
     int colors;
     ssize_t bytes;
 
-#ifdef CONFIG_VNC_PNG
+#ifdef CONFIG_PNG
     if (tight_can_send_png_rect(vs, w, h)) {
         return send_png_rect(vs, x, y, w, h, palette);
     }
@@ -1233,7 +1233,7 @@ static int send_jpeg_rect(VncState *vs, int x, int y, int w, int h, int quality)
 /*
  * PNG compression stuff.
  */
-#ifdef CONFIG_VNC_PNG
+#ifdef CONFIG_PNG
 static void write_png_palette(int idx, uint32_t pix, void *opaque)
 {
     struct palette_cb_priv *priv = opaque;
@@ -1379,7 +1379,7 @@ static int send_png_rect(VncState *vs, int x, int y, int w, int h,
     buffer_reset(&vs->tight->png);
     return 1;
 }
-#endif /* CONFIG_VNC_PNG */
+#endif /* CONFIG_PNG */
 
 static void vnc_tight_start(VncState *vs)
 {
@@ -1706,7 +1706,7 @@ void vnc_tight_clear(VncState *vs)
 #ifdef CONFIG_VNC_JPEG
     buffer_free(&vs->tight->jpeg);
 #endif
-#ifdef CONFIG_VNC_PNG
+#ifdef CONFIG_PNG
     buffer_free(&vs->tight->png);
 #endif
 }
diff --git a/ui/vnc.c b/ui/vnc.c
index 310a873c21..8376291b47 100644
--- a/ui/vnc.c
+++ b/ui/vnc.c
@@ -2165,7 +2165,7 @@ static void set_encodings(VncState *vs, int32_t *encodings, size_t n_encodings)
             vs->features |= VNC_FEATURE_TIGHT_MASK;
             vs->vnc_encoding = enc;
             break;
-#ifdef CONFIG_VNC_PNG
+#ifdef CONFIG_PNG
         case VNC_ENCODING_TIGHT_PNG:
             vs->features |= VNC_FEATURE_TIGHT_PNG_MASK;
             vs->vnc_encoding = enc;
@@ -3256,7 +3256,7 @@ static void vnc_connect(VncDisplay *vd, QIOChannelSocket *sioc,
 #ifdef CONFIG_VNC_JPEG
     buffer_init(&vs->tight->jpeg,     "vnc-tight-jpeg/%p", sioc);
 #endif
-#ifdef CONFIG_VNC_PNG
+#ifdef CONFIG_PNG
     buffer_init(&vs->tight->png,      "vnc-tight-png/%p", sioc);
 #endif
     buffer_init(&vs->zlib.zlib,      "vnc-zlib/%p", sioc);
diff --git a/ui/vnc.h b/ui/vnc.h
index a7149831f9..a60fb13115 100644
--- a/ui/vnc.h
+++ b/ui/vnc.h
@@ -201,7 +201,7 @@ typedef struct VncTight {
 #ifdef CONFIG_VNC_JPEG
     Buffer jpeg;
 #endif
-#ifdef CONFIG_VNC_PNG
+#ifdef CONFIG_PNG
     Buffer png;
 #endif
     int levels[4];
-- 
2.22.3


