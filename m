Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAB1C4E9CE8
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Mar 2022 18:56:38 +0200 (CEST)
Received: from localhost ([::1]:53924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYsfV-0006wL-Mn
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 12:56:37 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kshitij.suri@nutanix.com>)
 id 1nYsdT-0005Fe-FN
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 12:54:31 -0400
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68]:62458)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kshitij.suri@nutanix.com>)
 id 1nYsdQ-00074A-1L
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 12:54:30 -0400
Received: from pps.filterd (m0127838.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 22SAMUWu024619;
 Mon, 28 Mar 2022 09:54:23 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=proofpoint20171006;
 bh=aWpq8ynHbMCTC5tG3JF67oR8pzzbwd8Jq4ZPLYpS9lI=;
 b=nYNepfa1RJAhUb0Q9GPMyG4cr7vcjYPXFcjtnne4X6W0yX5/QzV0Wg3UXxkZtbgRlyu7
 W1f+UAQO1sO9g0EP+PC33vOMScEYo/6JFBqM6bo8qbeey/ojj0F2mMu7rYSNXakvgB+s
 DR07uCpf1wRKLK+ppxB91IdkERJclYMIXJOagfpuUPKRuStF+xi+EHKV+GgxMxKKkRME
 v5QbjfhNxvfjeHOJLlOkP5aWawvsf4zrAVj/99+hhp3DH/f3UiSuQ7VZifwwoz30vNcN
 stLut2JYMsTcwIfssE4Ngu6aA53O8D3Ob8G94+R87+eJIgORUH9lBBtbqENvfPjviFxe eg== 
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2170.outbound.protection.outlook.com [104.47.56.170])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3f22cx3ssx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Mar 2022 09:54:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DqQJZskRDxA+uetdtM/WO6kAa9pmwr567vb2ID17XrbpVt+JET9WBkHfHAJrhgS8Tgo3tb3AxybrVkjok+mhiE03tA0IlxM1zxG7Guclui/WGrLyjphmA93bQJHWpBTMh602VhUKL6pCyPXQyMOiA93f6KzIO63PS0rbiQclgl/BMOF3UCQV/YYnxK5fFNPrwGXlI7go/GYkREOmVHDts/Uc16MbvKDGDYaYffvCP1T1Ui1cGQSncwSGHM+tPSXvJ+GOAU9HlWkGUM91ngxKGAeF9plTDDCRw8ubUrSFM4oNyWqSdfZ0bppVH7DOTzJPM8mNwKksTlWnPgtdDdRCuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aWpq8ynHbMCTC5tG3JF67oR8pzzbwd8Jq4ZPLYpS9lI=;
 b=Lp3ZauDAbb0CrenhVZZJep5EeJ5mNx0sT2c+dvTiel/ce/WFo67dN/UrXTZyGtKn7atpHPTbORYxor4I2NbNg5e6qtxPEqxJ+UwDnwQ9RgO58aXFcRNr5fVOGEonK8ThczbCQBOpBQqjx+0y/hJY38T3rhMhKTLEpDSnmOaUZl02eY5MU5hrg2T1y3d1GIalWfu0JCqe7jp3mzSO1Z7yQy4wTVb1tk0MdHiu1MWQkEVMR2jwcPPsIm4leZCE3w4KjollwziTWfJRhluD8zNPKBUhnCshKg0/wSZp7sINDYJ6kdIh4Aou08PTefwVdLnPfvkmbK+dT4BWt9NHBKZSbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BN7PR02MB4033.namprd02.prod.outlook.com (2603:10b6:406:f9::16)
 by CH2PR02MB6182.namprd02.prod.outlook.com (2603:10b6:610:d::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.18; Mon, 28 Mar
 2022 16:54:20 +0000
Received: from BN7PR02MB4033.namprd02.prod.outlook.com
 ([fe80::5d3d:384c:d914:b12d]) by BN7PR02MB4033.namprd02.prod.outlook.com
 ([fe80::5d3d:384c:d914:b12d%6]) with mapi id 15.20.5102.022; Mon, 28 Mar 2022
 16:54:20 +0000
From: Kshitij Suri <kshitij.suri@nutanix.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/2] Replacing CONFIG_VNC_PNG with CONFIG_PNG
Date: Mon, 28 Mar 2022 16:54:14 +0000
Message-Id: <20220328165415.2102-1-kshitij.suri@nutanix.com>
X-Mailer: git-send-email 2.22.3
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0P220CA0008.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::17) To BN7PR02MB4033.namprd02.prod.outlook.com
 (2603:10b6:406:f9::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 58018e61-2a44-4fdd-7fa7-08da10db9a7e
X-MS-TrafficTypeDiagnostic: CH2PR02MB6182:EE_
X-Microsoft-Antispam-PRVS: <CH2PR02MB618271A8FD3283382A55C9C2991D9@CH2PR02MB6182.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DyoPNwAibrR61ALHKdWl4MxE4yq0cAd8Da01lwfqytriYdcaFr/IOnCtk3JsBbvY1p87gNSJnwVNV3kVLkGVBp3UEHl+5njPKqjPxwpOmgvPh9Hr1HNzJjgxg661K4ReG9T4Je9u604svYNRx68KIVo+m+EhgM31ZDb7Qkn3zr285m4ZCABTJLuKk3T3bVySspxV4B6JpepL65aAY2wHjeCoedzIeooYxm6DLZNEdyIcCsdGOHuWRPrR5qOT/OKxXbPph0eSF3+ybsAqWGw9adeQua+lEr2wWkesrw81x8v2vIOIhT3XpahKBthDm/NpaXfD0VNulrCFHfjS3oQSpLfDm4ZhYtbVh5p8xZr7akliyzszFSqU0ZfqiWJQTbOhn84hOjyOlsiNQJTCvYJBgBY+uZNQZUX7vG5poUTjk+K/fHfCJanQhkyS7pjusTG42uwF3caAk671VfkPkK4yZhz2Q1ViipGwqZR4L9VKqPOpF/LG/auBzD8N48SO2ks3yBvAMwZGo+eZXKHMqifXIGcb36ND3pIkTJj+J8Bef03NeoHmN2gCenMPMlsad3QOTjtZAwQFZi7dzkWjmzIhe4woPggyZ1x0Z8qshi9Y+PxVwijcVWjHzvRyG9FH+a2wgheBhosK9D0slnHXTjdaotj+i0DfLIJewcfh21k4nU5eDb79j7UFFGrL2cTR7j91bthqUDPxLW9CRKv0hQE5Pg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN7PR02MB4033.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(316002)(6666004)(6916009)(186003)(83380400001)(26005)(6512007)(44832011)(2616005)(38350700002)(38100700002)(86362001)(1076003)(107886003)(4326008)(8676002)(66556008)(66476007)(6486002)(508600001)(66946007)(6506007)(8936002)(52116002)(2906002)(5660300002)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RDA4dkNLYWFIRGo3cU9PdHRJNCt5MVVkZjdVNW5NbWZqb3B3SERWRllQU1g4?=
 =?utf-8?B?a3p2dHR2ZDd4ZlRuaFVmaFR4NGZDZHBYa0FHZm0xakxUQ2ViWCsrY1YrMnBU?=
 =?utf-8?B?TGhJQzk5N1VSekNKMEllOUhKOG1KUXVyNmgvUDlGaWkwVHVSTDZWeVFyKytp?=
 =?utf-8?B?a0F0Wk50NXBWQlY2V3FkNXVkOGloMUxzRm9oV1BldjFFcklGYWFScjRCMXdS?=
 =?utf-8?B?RTFqcGkvb0JBcUlOMnFUS0huTkgrNmRnUjViTTZXTWU2WkJOSEhhc05ybldz?=
 =?utf-8?B?Y1ZjcEhzU3FpbkRNM1BZQW1OZG92cUYxMVF4TmhNVFcrek1mSlhUSlEyb3hJ?=
 =?utf-8?B?TjdaQ25YcGoySmgxcHU1VENPc2FXQzloc1dvZVNrVm1LSTYxTnlNTW81dWQr?=
 =?utf-8?B?VS9EcDdoRXpyOTdZTU5LQWhEYTE1NHFUSEg1amZEODA3dzM5KzRhUXZ6d3Yr?=
 =?utf-8?B?b3prazJEK3dlajhuRjdEa1B3Qng2dTlhVmdWcllRZkJYQUdUOU9LOWdXNUdJ?=
 =?utf-8?B?UkpTR3pndFM0R1dWd2lic2xTWTdrYXE0VW0zNURKUHRSOGNiRVVyWGM0THcr?=
 =?utf-8?B?Q3VyVElFU3B4dEJMQnF2UG9tcUxpNk93d05YZFFjT3RzaHVod0N3dG1wano5?=
 =?utf-8?B?VGsvVGNuMkdKcDh3bmFtSmtYUWpQalJRaUhETWhSZkEzTk9rMDFtTWZiNFBm?=
 =?utf-8?B?Ti8xUGtmRWRRK01kLzR0TGg1TGVER2pyV05Xc3pURmg5bGhPcDB6T0c2UVA5?=
 =?utf-8?B?Ky9PMDNpS21BQWdkRkpvS1hVS3RNQm4wc2pEQ09QNmZqcGc4RGQ2Yk96cjUx?=
 =?utf-8?B?eGptd2lTRDVlRjZJTGhrRG1wYlZsY3R0c2VqTHVVK1dQdjUrUThpMUthcVlj?=
 =?utf-8?B?QjFEWGNyWmFyYVhaNTZCVDRtOEI5WXlJQ1R2YVR1WWZCWkdRSnNINXhCdi9s?=
 =?utf-8?B?MllENmhzbk15R3BWOHEzWG5yQVJ0aEdya1U2dzVKRUZteDBMRmpJd3czais4?=
 =?utf-8?B?NUltMi9OdFRta3RmV1Awbk0yN01uU2ZSRHlEbzJ6bnVlbU9wTTNJTVl6NzBp?=
 =?utf-8?B?MFdoV05xcm9NNk1nVFFtbzA0Q1VocSs0UU42eHRGejFabDE4OWswMVhRYlI2?=
 =?utf-8?B?dWNaRG8vMVF3QW5ZTUVKd3dlU1dIUUVHaVlJNjZSMmtWZ3BoalVqOXhRNURN?=
 =?utf-8?B?czlnNCtKME00MkMvampxSVpjNVhlMU1kS0tjQ2s0Q3FDcHVnSGZUTS9hTU9I?=
 =?utf-8?B?dVJqdC9xRGhDUkdxbGxuOUptYllWS3VOclIzS3RraytKVFc2L0U5L1VHSnh1?=
 =?utf-8?B?U2oyU3JaZ0N6Ri93RmVXTmYxeURBSkIyVkc3RFAvSlAyOXY1VURUeXdnVkho?=
 =?utf-8?B?VGtTSWlaaWRGM3V2SjcwMHluTnBNR0lmUTkrZWFaMm9pYThZdWF4WkZzSVVH?=
 =?utf-8?B?S3FYbTFldjB2TWJEcW9oMFFlQVpUWFZEMG9ENDVIRlA5bGtTN3VUdjYrNEp5?=
 =?utf-8?B?TmQxbTcwMnNCZjRiaDRlbWZPcWhRdy9sMUwzdGEyMXJYbUlJZjUrR1p5WW5r?=
 =?utf-8?B?amNmaGoxYzJnL2ZUd1dkTnhQTUxjbVBuZ2g1TVc0aUhNNlN6cDJzLzFyV1Jp?=
 =?utf-8?B?TmJveEl4R1NWNHdjTElnc3ZQZmNxTmFWaHE2MTBmSXNTLy9KRzJQV1orN1ZE?=
 =?utf-8?B?S3F4d1FPWXRVMHRzckRYOGp5U1V3TGFlczdXdWNma2w2N3o1MElVWmxYbzRW?=
 =?utf-8?B?dTAvVDk0a2Vwem4xUFZjUXU5MzRmY2Z6SXJHY0xZOCtOUjdiUUFHUnBZdGZS?=
 =?utf-8?B?dTBXR2Q4bFlqN0ZhUWZRQzVLVGRISEN3NmUvOXZiTldyNEsxOGNDVnVPeDh3?=
 =?utf-8?B?Q2lZQ3Y0VVYrR2NpVmJ5QXM2VlY3TFN3MlM2WGtwSU9EVWQ3S1R0a0VBSHpD?=
 =?utf-8?B?TncrRXE5eFQwQWJMejhZMy9CTTk0eHZIY1U1OVNiTEl1SU5oOG42VE5RcFdW?=
 =?utf-8?B?WnRlUXdJZkpvNnYreGRzRHppYXdVSi9HOHZLM0FuVG9VOHN1dDJoU1RqeG10?=
 =?utf-8?B?amRJaGVUNitzV2krMGZSckVzdjFPK3FYVkFwY1dQKzF1ZW1nZ1ZzSUJYcTBt?=
 =?utf-8?B?a0FSUzBjZkIvYThuUjIvYlQ5aWVESnJFdDFzMEUwa09YeUdNVUZIakVlRmVU?=
 =?utf-8?B?MnJhVEwybkZ4SkdFZ2MwR0o4NDN3L0RwcDJIODBIbHZhQUVhZ201YlJXMDI1?=
 =?utf-8?B?Yzl4cTFzbjVRbHgwL0hRY042c1N4a1BVWnB0a3BydWREbnV6N0dPMERuS2Mr?=
 =?utf-8?B?UXluVER6MlU1YTRmRk1UUlgvK0xiNjFwRWpFamxkbnhyTFFNeGpRNHpTazlH?=
 =?utf-8?Q?WJZ0vwPP/ysNBqwc=3D?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58018e61-2a44-4fdd-7fa7-08da10db9a7e
X-MS-Exchange-CrossTenant-AuthSource: BN7PR02MB4033.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2022 16:54:20.3303 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L9mCvOTHW9JiJMUTk1ETSdNoi8/u/66JqZB/Hw0MnpgbT5x2xQ70/9f20clAFrVJ6kG0Z4xe5ESI+Sg9coSVNtIe5bKk07GXhBmY/v459dk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR02MB6182
X-Proofpoint-ORIG-GUID: DZlWKGIcMASZIk5HAuaTLwGtsu2ipCGh
X-Proofpoint-GUID: DZlWKGIcMASZIk5HAuaTLwGtsu2ipCGh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-28_07,2022-03-28_01,2022-02-23_01
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
Cc: soham.ghosh@nutanix.com, thuth@redhat.com, berrange@redhat.com,
 prerna.saxena@nutanix.com, dgilbert@redhat.com, armbru@redhat.com,
 Kshitij Suri <kshitij.suri@nutanix.com>, philippe.mathieu.daude@gmail.com,
 kraxel@redhat.com, prachatos.mitra@nutanix.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Libpng is only detected if VNC is enabled currently. This patch adds a
generalised png option in the meson build which is aimed to replace use of
CONFIG_VNC_PNG with CONFIG_PNG.

Signed-off-by: Kshitij Suri <kshitij.suri@nutanix.com>

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
---
 meson.build        |  9 ++++-----
 meson_options.txt  |  4 ++--
 ui/vnc-enc-tight.c | 18 +++++++++---------
 ui/vnc.c           |  4 ++--
 ui/vnc.h           |  2 +-
 5 files changed, 18 insertions(+), 19 deletions(-)

diff --git a/meson.build b/meson.build
index 282e7c4650..ccb6840a49 100644
--- a/meson.build
+++ b/meson.build
@@ -1115,14 +1115,13 @@ if gtkx11.found()
   x11 = dependency('x11', method: 'pkg-config', required: gtkx11.found(),
                    kwargs: static_kwargs)
 endif
+png = dependency('libpng', required: get_option('png'),
+                 method: 'pkg-config', kwargs: static_kwargs)
 vnc = not_found
-png = not_found
 jpeg = not_found
 sasl = not_found
 if get_option('vnc').allowed() and have_system
   vnc = declare_dependency() # dummy dependency
-  png = dependency('libpng', required: get_option('vnc_png'),
-                   method: 'pkg-config', kwargs: static_kwargs)
   jpeg = dependency('libjpeg', required: get_option('vnc_jpeg'),
                     method: 'pkg-config', kwargs: static_kwargs)
   sasl = cc.find_library('sasl2', has_headers: ['sasl/sasl.h'],
@@ -1554,9 +1553,9 @@ config_host_data.set('CONFIG_TPM', have_tpm)
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
@@ -3638,11 +3637,11 @@ summary_info += {'curses support':    curses}
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


