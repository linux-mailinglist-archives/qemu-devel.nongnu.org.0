Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8906B4F8FA1
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Apr 2022 09:27:51 +0200 (CEST)
Received: from localhost ([::1]:52298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncj26-0000OL-Cd
	for lists+qemu-devel@lfdr.de; Fri, 08 Apr 2022 03:27:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kshitij.suri@nutanix.com>)
 id 1nciom-0000wm-Ar
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 03:14:04 -0400
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68]:56006)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kshitij.suri@nutanix.com>)
 id 1ncioj-0004oZ-AZ
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 03:14:03 -0400
Received: from pps.filterd (m0127840.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 237KhbVZ032017;
 Fri, 8 Apr 2022 00:13:58 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=T+c2Gkx/I6NktWlHyo2jhS+uRIPji2xT0zo0lGeRnd4=;
 b=Sh7q0AC6BEG7NyrnxM9K42qXDbq1e/MYO+8elSe5qY1Nq8/kMHGri2CdQLaLGVfG3CkJ
 M77gi56yJrJ2o+gF8cbKI84/HwTcFxXWi4npC6c73H+QRD3qovinx4NTDKj+/0adEM0k
 t3jff6Ra/+0Ni/S4epSDBUCoF1DOu1MMwzFzKt/wrnT8r7jLR6x1m5Vw7mw2ACPgq2pI
 y6/kkhTcL03M+dH8jFYXly7VDiqu0xTUVmF04aCayBCrzfYXVe/MsJD6sH00I2avvbYU
 RHF+eEfL7UPSyk0TkAX57A7s8CtW7KfwiqpV1YZHnEVWextTeZZj2y4Ss/k6ZCcTIbA3 ZQ== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2177.outbound.protection.outlook.com [104.47.55.177])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3f6jttw02y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 Apr 2022 00:13:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MXKTZhhgQP5FTNe7Vj4IxZ5ZD2K3JAWJJlaeYO+GNu7U9DP812o+czdNknjcqIK7DsYh3mkj7gHJWDrVYerP9U48LPTALKbz/ux7vQzkw3gz1n/uXab8JrVDWrPsYrBttL3kP1denKq5cmmizcFeWGOZgjyqOYnxLX4kP2Y2cLFUDYN6UJdDb6zQY1Poxt/Xxq5Wma1mqfj2XNA+2T1+xhxxULK195LrgkqtFTwcwG1dc+HlOqONymsZOiLzcjGGnd/7daawS+KCbK33/7KFr1VTrau7W+zVAZ3Z885uyLAWcJ83XLscQ9dNpL5XL3Z2vezwa1VEZWuw/iU4OoRwew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T+c2Gkx/I6NktWlHyo2jhS+uRIPji2xT0zo0lGeRnd4=;
 b=Uf0WZL7KqPmDb8ro2B9OWXjvIW0o6ffMvJFwwYg4UJ5UD2EDteBBe1bZO5klHpj1t7777fxx4JMLqFkFr6tyemZI9Pt9AywZeW4uydDAIao4IoKTwxzw917pWfAUcStvuBxNfn6c77dDJ3PCcjIaKvMLfxSw9Gv1SZuVmayYZDOsabIRl/npwAFiXyfa1RrJrF+Mqqj5wHJPoYaoTIdS2lLlKnqH9KldECrxuwm3HHLcvTMLt9G2oJDII5soSZDm4gufLLjcPPFOtLBVD+W2C1v0srX1ucY+uRsGNSA8XY7QBdUFdUBoJ6KvtRvf6ZMRnXr+jW/VDIzlaUXCupNBSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BN7PR02MB4033.namprd02.prod.outlook.com (2603:10b6:406:f9::16)
 by BN6PR02MB3281.namprd02.prod.outlook.com (2603:10b6:405:6c::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.25; Fri, 8 Apr
 2022 07:13:56 +0000
Received: from BN7PR02MB4033.namprd02.prod.outlook.com
 ([fe80::df1:1d4d:e30c:55e6]) by BN7PR02MB4033.namprd02.prod.outlook.com
 ([fe80::df1:1d4d:e30c:55e6%3]) with mapi id 15.20.5144.021; Fri, 8 Apr 2022
 07:13:56 +0000
From: Kshitij Suri <kshitij.suri@nutanix.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 1/2] Replacing CONFIG_VNC_PNG with CONFIG_PNG
Date: Fri,  8 Apr 2022 07:13:34 +0000
Message-Id: <20220408071336.99839-2-kshitij.suri@nutanix.com>
X-Mailer: git-send-email 2.22.3
In-Reply-To: <20220408071336.99839-1-kshitij.suri@nutanix.com>
References: <20220408071336.99839-1-kshitij.suri@nutanix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH0P220CA0024.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:d3::29) To BN7PR02MB4033.namprd02.prod.outlook.com
 (2603:10b6:406:f9::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1e23a79e-57ad-4c23-deca-08da192f5816
X-MS-TrafficTypeDiagnostic: BN6PR02MB3281:EE_
X-Microsoft-Antispam-PRVS: <BN6PR02MB328117BB45C817EC356B74F999E99@BN6PR02MB3281.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: v399/exBdx2gStjbMBAoet5IKZYEcSDutCXKs+mBqacY1iWw4Lq/Ucce1CasOPNoYyG0lNY98sBZCMV96b+qHH2nVw5YdtGj+bcDVh7s5FFjqr6+t13zWJtFzVVt3cUBVeL6zywmEmc7kwG3glX6dRlJWcWcoWaacmYO4i3Iy4xo11EG+bQpJCO9BjC8+ZahxqYh+OPyOc8UAa46gV3Kl4zMEq0D50su8NsGV5QghrcmLcVsH+iWtQDZr/t0zvac5aDQFcf0PaRenZlkko9pKF9Q0EOO99s2ct4fmOkPmFWAMBLOYRV2N9h7lPzpUfQcX0zWxSHBNX9G9X0Wp4Dsoj7BAV/ze7iNOw/wBuxNukrXJkhYc55cw5B237659tG/Gz1/0HxxGm1PYHA9IphL/ej/pT6WEv7ZTda2BsoaALWkJsNdypsPpHFfObLBp5geIUSKdMDow4DQoFF7kOm15mH6ekTy14xAHh4qjNHMGxuu3oQTr8CCIyQTus4ghXGUs1f+c9g47rdTkDi6E4Tuj7qVF2Va/tmLGDGcFeGPRMuO2rkzXZaKL5ECOcJb4lL30eEIGFrbyGrvv9bv4EYilRKYnCgkaD5J4q9Oz/nJDEPYAWYt0IgRr9lrS271YVdXrNZVJk0W6htNLuC0aTrkD3mISIMcD7fMYPTsnJYTuYqyasbvFyMKIW0uMTpcfd3WoaTXUU9oMTU7mLuR2HANjA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN7PR02MB4033.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6916009)(316002)(1076003)(66946007)(66556008)(66476007)(38350700002)(38100700002)(8676002)(4326008)(36756003)(6486002)(2906002)(6506007)(44832011)(6512007)(7416002)(508600001)(86362001)(52116002)(6666004)(5660300002)(2616005)(107886003)(83380400001)(8936002)(26005)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VVNNSGtCZXJ2eFlyUXNSeEdXVGFYZ3JFcHNOaVhiTmFUeXRJSGxPNHF6VnNP?=
 =?utf-8?B?YW52Z0liYWZTQ1pkV25Ud1IrZ2JvY0JVNzIrYzJxcGorR3Y4WU9ZUnNjVEpS?=
 =?utf-8?B?aWRESXJ1MHlsaU9MdWNzeSsvZjZkVWdPZ3VZL3I5U0hIYmJaOXpFRVArUG90?=
 =?utf-8?B?Q21PMWpFeENFWTM2dWFpNFluSFYyeDdCb0VxSFdPK0JlV1RnUGl5b0ZGcXU4?=
 =?utf-8?B?QzU1UVU3d2YzT3FJUnZWRkdnSkl6OElIRUxmQXE5UFlpaHRhV1VqY2Z5bUJ6?=
 =?utf-8?B?ckpZQlMvMUNKb0hIQnJvL2ljbnBUVHV4MGVuWVZsQ0h6UXdVdHJqcmJvdDUz?=
 =?utf-8?B?aWtwY2lRSDYra243cnBpeHJ6dG1ESEQrMEIxRDlkQStFbDBsaUpZUDJlWity?=
 =?utf-8?B?MHQ3QVNWQ3BhaCtIcEg5RFVTRXphaTFBM3R6Yi9ubGRHRWJISHBnMlZQZ3VB?=
 =?utf-8?B?ZkNENlBac05DNEU3WDNoT1ZJUWlERSswMmJKeDB5ZG55aGYvNXNlS09sOGZu?=
 =?utf-8?B?ZmdXV2lCWTFhNk1udGc2TVV3UEdFbVA3S01TejJISVRTQkErSU52bmNINkNZ?=
 =?utf-8?B?aFAyOVhHaW43RFdJZG9wRW5YV1RTZnh3ZVFwQXpPS2dzSW5yRkxmUjFudzZp?=
 =?utf-8?B?MnNQK1kyQlRJNUZTOVVuK1BmNEdUZFNoalBrcU9aT3dxRzBkOW84eWY1aWlh?=
 =?utf-8?B?OWtNMnhmMDh2RUprZGNqSVl0bjlwZGVvYkxNYWtxNW15SE9ON2FBZEVlL2VB?=
 =?utf-8?B?Mk1SeGVwTXRHZVRVbEFsM3NVbVc2ekFkZ2xCcFg0SnZoOWJPVHZLSUFkcmE2?=
 =?utf-8?B?NjRZYmZJaEdMZDVXcHJNTWdRRGpFVDF5dDJzZUtjV3VKWldPVXRyS3FFRStD?=
 =?utf-8?B?WnBUL09oOWdscURVZXdaR0FGS2R2RXg3NjFhWjdoOW5jOHg3VnNkVEFRM3Ru?=
 =?utf-8?B?bkdHaWQ3VWVQWmN5NUNuVEVrV2czRTFNMkRrM2Y3L2ltTThqY1kvVTRrUERX?=
 =?utf-8?B?aFZpVG1DZnFnOFJzZnpMWmQvUEtaU0VBeW1JZ0dSbHFIV2dRc0ljZXZqZlpT?=
 =?utf-8?B?UXVNejhjWlFDa0FwdG5vd1RBOTJXdTJ5WEk1TU9LbWZVYkNYc1EvdUpiNkpX?=
 =?utf-8?B?ZFY4aUpLTUZZaTYvL0o2MUZtdWtLcWhtYjhhVFU0Mk1vbnF4UmFIRDdWaUxU?=
 =?utf-8?B?WjJ5VmJCQ3JoQkJuMWEyMlBocHp6TGxuNXR3Ty85WlBmTjVvOHZzeEM4bWt5?=
 =?utf-8?B?aXlkbWF5dDlsY2FMZkkrVmpJTHk5WlloMm5ycUxhVVdBczcvcVlTeFVxMzhq?=
 =?utf-8?B?SlRzU3lXb05DSTZQNUs1ZVgvcnFKOWFpTUZCLzJ0Tk9rMnJ0QkM4SldNZVpu?=
 =?utf-8?B?NGhIZWF2VE01Z1FNZlNBcnNRTzZ2N293UkN2M0JITUZsOXN0aytueUhlUWdG?=
 =?utf-8?B?N29SOXpQaUs5Qld4ci96azhtNVViYmtNc2l1bDEzVitzZ3VoOGhZZVcxczhZ?=
 =?utf-8?B?QVh4aFRlSVM0RTlhZkZGN2txTDBUam40USttT2s1RXZPdHg4R0VJZ0ZPWUFy?=
 =?utf-8?B?S2JwTjNZWjZoSmwxNVZwOUQ4Y3ZaQmF1Y0IxMjg4VkxzdTJJcWpOSy9UQUMv?=
 =?utf-8?B?S3JROE90Y3M5OHV6WkgyS2FaV1V3UGRMbmdpNnl1UEQ1S1psc0RuWWJYa05p?=
 =?utf-8?B?dkJyd3d5anRZSjFDOTlzUW1kKzBRYjNJOU1BcWNoVmpqa1htVlMvaVcvZ1ZT?=
 =?utf-8?B?STZUMXRoaXZoR2s5a2toVHBkSjltNXdlaDJETXdROCtSbmIwM096ZW9FUW92?=
 =?utf-8?B?dEdFQWE3UnRjMVhzeFRncEVvT2Y0MUNRL2hkMFpKd1dIMlIyWWJpL0w5TEp4?=
 =?utf-8?B?MmJHdGZGMTRISTN5V3dTa2RndkFjU3lsYXVVb3hDeW5RRWk5N2ZOWitwRTVs?=
 =?utf-8?B?N0VnK1JwVHJYVm9USlZiZE1kVWFuTUdEOXIwMVpjWGY4NTBzYnNPZ05nKzNq?=
 =?utf-8?B?cDNmSFZFWHgwSlNPL0VMYWhTdHlleFNvYnlSR0pMNFBQUXdYU3pwSm53VmND?=
 =?utf-8?B?Y3VMQWloSXphYlRWdzMrMVV3TDRlSXpTS2NaVmpyR25PbFhGNUpoUExTdnN2?=
 =?utf-8?B?UEtWNTV6bEI5SlJhdlViUEVQdXI4d2dIanlCdjVlUS9RZU9CYnpxQ2tHeUdt?=
 =?utf-8?B?aTdNQzY1SEIrL1pSMXBUQVdlWEVXYlJjek9aK2JMa08vU2EwZE9OS2ErYS9k?=
 =?utf-8?B?NytCNFNEcUFuREU4a3Q5Q0krZVhxZmZZT3p5MGpOOEVPemtXbXNPZGF1WnBR?=
 =?utf-8?B?UTJnbEhtcHgzRExYR3g3bnVsSkNMNXBScS9mUkx5UHp5QlphTXFHTHM3MVlx?=
 =?utf-8?Q?LUE85D+ziKR58aAc=3D?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e23a79e-57ad-4c23-deca-08da192f5816
X-MS-Exchange-CrossTenant-AuthSource: BN7PR02MB4033.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2022 07:13:55.9178 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ReXAPuTHC6UnZJ0y0XE2N0dOzXBXq5J0in0Fncs2hvxLtNUGcldEksz+PsACa9y2t6SEpB8U4yJT8cLqenPgTt/LrCok05JrhbTcwvOcuYk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR02MB3281
X-Proofpoint-GUID: pVbjNYGIFz_Fm5IZhMARuyqDVW00W3W0
X-Proofpoint-ORIG-GUID: pVbjNYGIFz_Fm5IZhMARuyqDVW00W3W0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-04-08_02,2022-04-07_01,2022-02-23_01
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


