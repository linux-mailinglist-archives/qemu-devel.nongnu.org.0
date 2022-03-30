Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6390C4EBAC6
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 08:24:58 +0200 (CEST)
Received: from localhost ([::1]:44912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZRlJ-0001NU-Dh
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 02:24:57 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kshitij.suri@nutanix.com>)
 id 1nZRYs-0004q6-ME
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 02:12:10 -0400
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12]:15778)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kshitij.suri@nutanix.com>)
 id 1nZRYo-0004fg-Hi
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 02:12:05 -0400
Received: from pps.filterd (m0127842.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 22U46uqC020508;
 Tue, 29 Mar 2022 23:12:01 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=CB2zp35M3gKYk1tjFzOJCN+jacSLXlnlQl1RL4NipHg=;
 b=YV+C6uKp8N1fThR4/3T40Y7fG7ThUrnwm3XZ20Tmay4rnPu4ZBiViSgu1zTibhLadbxa
 J+niN1ATlQY8eJ8a7lfujpm026D9SM6l5p5sOzFV8WMDWTakjJsn1jLm4r8CKIFTmkPi
 ribc5nfxlYsM8KDMSv6tDUJrTjz6n0cL2HUIBdL1SaHpjEghV8S9uKqKz1Mjtgvtc7ua
 MCSRKnR4e6ylffqvo5lJKXJ7rXFKa1w2U4Q1weOwAZAIVakrDP9ev6HEnWj+pHWCy0vH
 d8CfO3GzygIiFl+neuR2kY1m/HxHr71hHtU59vBi+IxPDHmUnG5NemePdF9wm/RS7Rvl UQ== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2171.outbound.protection.outlook.com [104.47.55.171])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 3f225g7pgm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Mar 2022 23:12:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NOx8VsYaOZZuHKDeCd6Yq4sDj66gU62Y0eVgpWJBwFs2SpYq0+X7ycI7V6lIkg5Y5N+ci42EgscnD52buLOjmO+xrfW3Mv6d7uStaD+dR6ojUTqH9W3mwSvEeA8iWRObIIBydx8vqCKbLeuKvb6Z4UpQVmeBSwHINQLxVTsrA7xgcuzeKQEbuoIJUKMmvHwgqzB7qdir64N3gUFzj/hAlfGwY5Ctup3G8p1nYsdJ+k2LzJZpD7C37Il02br8Lkf3xh8Bs/c8VVHCekA29nVJuvwUPus0ZI+8UMTNYdtoNKMgK3dqY0FWU5+hThNbaikppLRV+0FZZlOJimOQqIrZ7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CB2zp35M3gKYk1tjFzOJCN+jacSLXlnlQl1RL4NipHg=;
 b=HxxeuJQznAfXqs/bzgPDFdkAFb3z51Joag393NoB7f4G6cHgowVSTgPeACIiQcqmehYS4wC+jY7dvhoRF3inOCsi+9q0Sm0JfyxDhDBj/5hvf/F9HTRPca1n6Si6RiraFKHKH/QAnRiq8zPD7YjMSvH/CrgKylvLtF9iUReoSq3hllUbhVvc0LS4KQXfTMpvqmwlzD+ltUODCpy4vhciPETaffs8n60LHteQ/co2Brx4l8K5Y3MrbNYre0A9RubZTFOYa5ufH/xHrDAWgYIsD5+IaXf/DPok70Jc3P28wnqS/binADdktfUg8tifgUyBWJI0O9IqzeRHsz/bohIVXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BN7PR02MB4033.namprd02.prod.outlook.com (2603:10b6:406:f9::16)
 by BN6PR02MB2866.namprd02.prod.outlook.com (2603:10b6:404:fe::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.19; Wed, 30 Mar
 2022 06:11:59 +0000
Received: from BN7PR02MB4033.namprd02.prod.outlook.com
 ([fe80::5d3d:384c:d914:b12d]) by BN7PR02MB4033.namprd02.prod.outlook.com
 ([fe80::5d3d:384c:d914:b12d%6]) with mapi id 15.20.5123.019; Wed, 30 Mar 2022
 06:11:59 +0000
From: Kshitij Suri <kshitij.suri@nutanix.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 2/2] Added parameter to take screenshot with screendump as
 PNG
Date: Wed, 30 Mar 2022 06:11:34 +0000
Message-Id: <20220330061134.59254-3-kshitij.suri@nutanix.com>
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
X-MS-Office365-Filtering-Correlation-Id: 0b9b9921-8214-4e13-2d36-08da12143305
X-MS-TrafficTypeDiagnostic: BN6PR02MB2866:EE_
X-Microsoft-Antispam-PRVS: <BN6PR02MB286689D857B6B8DFF905F62D991F9@BN6PR02MB2866.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: s0h3T393UZIQywSGi5wAT7xv348w9n83hwew2MMiQKVrA/svpUp63eRbWxT1WOJob3VlPcLJXL8bdcijbw2P9zPELFkBGn7i8SulGAzbHCfSqQNTRBshCxVpla2Mw7PMcIKF/zkH6HJqjfZKDzUkpWG1/g+rx7MAgZTfH5putkfcg08VgJeIwSpheZnF6jrk5f2+gPxpDhOFfLkmQJkyXq84b5lXWZ+XmwAmDuPGpCrz4bY060sO/ek2iSXs/QWHKeBx13+Vl0BgUDnTwFMIgsjc+s9svIuB95FolgxBWrcnDhrFucRExspp+12KF52R9yABsIF1SOJP7lMXB9AhQDDNC/TwYQrkl/UWOUF0+XrTMDETvUW0gh2JWFReiUg1KW6/+RZoilKo9IL/qy48yTA+NahP3q9DPjShvdgH5XsNJP3HOSCmcN761Mp3PG/uW0935/GXgk65psnAALbszXxiDGhV60WEMZtPIC+pM0yf58HRLTCFhtZKk6mdTItJCFfdMGRAL4FvLHKVrmt3Cu5jMFZYOFYQ6rVvSvKvmb74ONcZj5BfR6GKskyUdZSBaLDrI57rUiiG5tH9bD+y+uoCy7XkyMxCbW9l8fUtqoTSE7E9DDTIp2I0gwH3Fzx8o9myGxzWzeKSZXTCe8eXJCND1JQ8vOdP/dMyAHXDhCWuujGm/DZoJMKc0ur3uTdWjvVCofjw1Fr3BUWSvhClQmUKO8Zd3X/KHDtAnaZeBWDk5v5EDqWD8NQSQFb3GwNTlsWTCAhGAIKyihywo9eOdVs86DUphj569wOhs38A6Lg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN7PR02MB4033.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(2616005)(6916009)(107886003)(6666004)(6512007)(6506007)(66476007)(66556008)(36756003)(8676002)(66946007)(86362001)(52116002)(4326008)(6486002)(5660300002)(186003)(7416002)(44832011)(1076003)(83380400001)(316002)(966005)(66574015)(26005)(2906002)(38350700002)(38100700002)(508600001)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VmIycnRXcnVYa2tHT0NwQWhGQmZBNWxHQ1V0WHpOc0c0bkdjck9RWE95UnBh?=
 =?utf-8?B?OXV0UXl4Sm9NbUNRemJCanRJR0xaNGRTcXpka1EwMjlhMTI5cUdLbTJDQ21L?=
 =?utf-8?B?b282MktoQUR5SmxUNzB5VmMreEsveEpqQVRnZ2V2TGcwcUtUS0lYTDdkUU4x?=
 =?utf-8?B?bmZLSVFFK2RBVkcvSC9hdEV1QlQ1YnhUWTNsZm9pRTRQbEFWSWx6akpnL2R5?=
 =?utf-8?B?MHR2ZFUxaDF6UWh5bGYrczlYZXZzbkpXSmtyQkQ2R3IweGRMN1VhSXJzQlVS?=
 =?utf-8?B?MjNOTUpBcnRZTHh4YSsrcGYvSWxPNXpNTUc1NkN2QnlKTHYxRnFQYWhVNXZQ?=
 =?utf-8?B?RC9NelVDNzEzbVd3QkRrVGpDKzNVdFBVWllReTFoSlBCbm8vci9ESysrZ1Rx?=
 =?utf-8?B?ZU11OVo1c2N2VnFrTDcxYS8zNHRab1hPMUVSWWkzUGhqS1RmMXlZbER2dHIy?=
 =?utf-8?B?eWJ0N1FFMFQzV0U4OUZwczZ6OHdsR3JyMEROVlEzNi9LMVZxSVJJV1RlWkZD?=
 =?utf-8?B?WkYrSVhVMk1ZTjFpcUY0ODRYTng5ZEl0TC8wWm5TZHQxZzRqNkNDTVhHcjFC?=
 =?utf-8?B?SGRIalk4c3FEY2xnZGZCdVJKYXdSY1R0RW1kRUVnVXY4cWVQNnhBZ2tKcUJn?=
 =?utf-8?B?Y1hndDNXUDlUZzdsSXpwSTlSUnNpRFJ3eEpCSkFIM2RFSnZsaWNnUFZvUFl6?=
 =?utf-8?B?aFNsWWhYVFNoVzZqbXpCZERyT0VvK3dpSWpLZFNVeG52aDNHa1Fqc1lMV3dG?=
 =?utf-8?B?ZjZOSWRhTk53SUJtUFM3cVNxY3pXMndVUjhBT1NkTUxaOTh6cEYrTkhYSjNQ?=
 =?utf-8?B?WnBHTnBJNHBseFJUZVpjMVpVekJnOFpra1QrMUdqUHpNNFBoM3ptSCtOS01L?=
 =?utf-8?B?ZGdDakY3bUtnaGExUnRLcmNNYm1pWWVYQjhaMERrbnJVNkdIcGpvOTZRbFBL?=
 =?utf-8?B?TFlJdXJJd2VGNGNMUWZZZnZQMWo1QmxvRE9ray81R2pyTjNUbGcxemY4clh4?=
 =?utf-8?B?RjJxU0NySDNjMWRDckdDVVFMRTBHWTV6OEJ2clFUUjc4QWR1bDZBOURWaHF6?=
 =?utf-8?B?NTNsOFp5bDhNZEZFVktnbWdGNkwzejFqc3NBdHRJMkJuaVhEeU1JMktCNVVz?=
 =?utf-8?B?MjdnUXQrV3owV1FEUWh3OTcvTzlaQ2JIbHhCcHl0am9vdmdXZWlqUDdOcXk3?=
 =?utf-8?B?TTJRY2JtdVdFSXM3emVpZ0NSc2hzUkFGZi9DMXpJeUQ1WlZ0RDA0aEpLQjNv?=
 =?utf-8?B?NlBxcHJMYW0vTEZyV2lDY29kY2NXYkthUlpvUHZUa1ZEVFNyaUNLT0lhaXRj?=
 =?utf-8?B?alJ3ek1nREJTZzVtT0VOQUo5Skg3SW8xd1ZBdE11TXd2UGNZbC9WQ1libDg0?=
 =?utf-8?B?L292NHp4cHlBczF0MVVDZ0ViUGVwaGRQK0VBL3E3ZFdmcFZMMjlMNkVBOFc1?=
 =?utf-8?B?Y01keTA0QWdVNjBqWVErMGFDeTdmck1DVGh1TE9YOWt1d05MRGFiUXBaSU1S?=
 =?utf-8?B?bjFta1J4ekZHZVlpamsyUGkvY0o3ZGZLR1FyWjVDUXY0U2V4OExWcmwwWjBL?=
 =?utf-8?B?SEVTZDlCdm5yd3YzVUlzbHgwUTgxSmRWdXhLTXVvd3JBQUtQa1BsMEJ4Wml0?=
 =?utf-8?B?VUtsUXZBZHVoWTNBWmJZamppeW8rMFJVR3BGV2wyUW5YWnUvMS9NR2VIL2Jw?=
 =?utf-8?B?M0ZBdkRKZXZ5dmNQZzdINGhhaEhqcFNXeEdMKzg0blBTTGpEWEN0ZnlueTFU?=
 =?utf-8?B?aGtVdVVQUUMvV1I0L0tiV0txb1BxaEZ1R1dvajdFUUs2M0M5OHB6SzI2YnEv?=
 =?utf-8?B?cnJTcXpCUitUTysrT1NTUlM1S2NJVDJibmFwWDdoRXIzcUpORlBYZDRqc1Ex?=
 =?utf-8?B?TzZDQ25TZ041eHI5dWorNTdHc09lQ01OZ3F1ZEVXellNSVZFUU9OSHlueTZy?=
 =?utf-8?B?V1d4eFdjc2QwOFh3SDdURklBd09QTmh6Y3pRajdLUG5FSXlEdUFrT0o1Kzh0?=
 =?utf-8?B?eElOZU5odWV3SHJhQmdxdFR2TzQwanEwMTZlazVsTExQdXNlYmlRRGFUNzcw?=
 =?utf-8?B?NmtXVUhETHRWZ2J4QUZoSFJzWlF6VnZzaHo5SHhGcEhzZDBLUU5qM01DYlJ1?=
 =?utf-8?B?L1l5U250TTcwOElhZ0xvcjZSaEpkYy9EQkZRc0xMRFVsQ2tJZnFCMmZ5ZklI?=
 =?utf-8?B?eGs2WW1JUlNlZFJDaTBCUjZRT1MyUlZaME1mV3FxR0RDSHgxek5ZeS91R05w?=
 =?utf-8?B?eHJZZVpWblR6bmxaV3dhUmxMYzNvU2VIRUFFQ2lXSUhtRHdKZHdkSVk2TmFK?=
 =?utf-8?B?MUNBalRiTEE3N0ZTNGptMWpNczlGeGpPNGZHNTc5NUNnQ3lmc2Q2VFA2MVF5?=
 =?utf-8?Q?lc/8uqL9wc2bUT/k=3D?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b9b9921-8214-4e13-2d36-08da12143305
X-MS-Exchange-CrossTenant-AuthSource: BN7PR02MB4033.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2022 06:11:59.3000 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: At3Cp3U4DP2NRnrMEIBzrYfLk1uhRiz40qbwjMkaYmcwwZ8hPx59cnuH/z4B+t6CMhxcyJv2U4+Km2RiSAdyLKS4gSj3rnGoArejK6/Sfno=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR02MB2866
X-Proofpoint-ORIG-GUID: TA9o38T9t-pzlGy3P28bVuIoxVrJ0YQB
X-Proofpoint-GUID: TA9o38T9t-pzlGy3P28bVuIoxVrJ0YQB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-30_02,2022-03-29_01,2022-02-23_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12;
 envelope-from=kshitij.suri@nutanix.com; helo=mx0b-002c1b01.pphosted.com
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

Currently screendump only supports PPM format, which is un-compressed and not
standard. Added a "format" parameter to qemu monitor screendump capabilites
to support PNG image capture using libpng. The param was added in QAPI schema
of screendump present in ui.json along with png_save() function which converts
pixman_image to PNG. HMP command equivalent was also modified to support the
feature.

Example usage:
{ "execute": "screendump", "arguments": { "filename": "/tmp/image",
"format":"png" } }

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/718

Signed-off-by: Kshitij Suri <kshitij.suri@nutanix.com>

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
---
 hmp-commands.hx    |  11 ++---
 monitor/hmp-cmds.c |  12 +++++-
 qapi/ui.json       |  24 +++++++++--
 ui/console.c       | 101 +++++++++++++++++++++++++++++++++++++++++++--
 4 files changed, 136 insertions(+), 12 deletions(-)

diff --git a/hmp-commands.hx b/hmp-commands.hx
index 8476277aa9..19b7cab595 100644
--- a/hmp-commands.hx
+++ b/hmp-commands.hx
@@ -244,11 +244,12 @@ ERST
 
     {
         .name       = "screendump",
-        .args_type  = "filename:F,device:s?,head:i?",
-        .params     = "filename [device [head]]",
-        .help       = "save screen from head 'head' of display device 'device' "
-                      "into PPM image 'filename'",
-        .cmd        = hmp_screendump,
+        .args_type  = "filename:F,format:s?,device:s?,head:i?",
+        .params     = "filename [format] [device [head]]",
+        .help       = "save screen from head 'head' of display device 'device'"
+                      "in specified format 'format' as image 'filename'."
+                      "Currently only 'png' and 'ppm' formats are supported.",
+         .cmd        = hmp_screendump,
         .coroutine  = true,
     },
 
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index 634968498b..2442bfa989 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -1720,9 +1720,19 @@ hmp_screendump(Monitor *mon, const QDict *qdict)
     const char *filename = qdict_get_str(qdict, "filename");
     const char *id = qdict_get_try_str(qdict, "device");
     int64_t head = qdict_get_try_int(qdict, "head", 0);
+    const char *input_format  = qdict_get_try_str(qdict, "format");
     Error *err = NULL;
+    ImageFormat format;
 
-    qmp_screendump(filename, id != NULL, id, id != NULL, head, &err);
+    format = qapi_enum_parse(&ImageFormat_lookup, input_format,
+                              IMAGE_FORMAT_PPM, &err);
+    if (err) {
+        goto end;
+    }
+
+    qmp_screendump(filename, id != NULL, id, id != NULL, head,
+                   input_format != NULL, format, &err);
+end:
     hmp_handle_error(mon, err);
 }
 
diff --git a/qapi/ui.json b/qapi/ui.json
index 664da9e462..24371fce05 100644
--- a/qapi/ui.json
+++ b/qapi/ui.json
@@ -157,12 +157,27 @@
 ##
 { 'command': 'expire_password', 'boxed': true, 'data': 'ExpirePasswordOptions' }
 
+##
+# @ImageFormat:
+#
+# Supported image format types.
+#
+# @png: PNG format
+#
+# @ppm: PPM format
+#
+# Since: 7.1
+#
+##
+{ 'enum': 'ImageFormat',
+  'data': ['ppm', 'png'] }
+
 ##
 # @screendump:
 #
-# Write a PPM of the VGA screen to a file.
+# Capture the contents of a screen and write it to a file.
 #
-# @filename: the path of a new PPM file to store the image
+# @filename: the path of a new file to store the image
 #
 # @device: ID of the display device that should be dumped. If this parameter
 #          is missing, the primary display will be used. (Since 2.12)
@@ -171,6 +186,8 @@
 #        parameter is missing, head #0 will be used. Also note that the head
 #        can only be specified in conjunction with the device ID. (Since 2.12)
 #
+# @format: image format for screendump is specified. (default: ppm) (Since 7.1)
+#
 # Returns: Nothing on success
 #
 # Since: 0.14
@@ -183,7 +200,8 @@
 #
 ##
 { 'command': 'screendump',
-  'data': {'filename': 'str', '*device': 'str', '*head': 'int'},
+  'data': {'filename': 'str', '*device': 'str', '*head': 'int',
+           '*format': 'ImageFormat'},
   'coroutine': true }
 
 ##
diff --git a/ui/console.c b/ui/console.c
index da434ce1b2..f42f64d556 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -37,6 +37,9 @@
 #include "exec/memory.h"
 #include "io/channel-file.h"
 #include "qom/object.h"
+#ifdef CONFIG_PNG
+#include <png.h>
+#endif
 
 #define DEFAULT_BACKSCROLL 512
 #define CONSOLE_CURSOR_PERIOD 500
@@ -291,6 +294,89 @@ void graphic_hw_invalidate(QemuConsole *con)
     }
 }
 
+#ifdef CONFIG_PNG
+/**
+ * png_save: Take a screenshot as PNG
+ *
+ * Saves screendump as a PNG file
+ *
+ * Returns true for success or false for error.
+ *
+ * @fd: File descriptor for PNG file.
+ * @image: Image data in pixman format.
+ * @errp: Pointer to an error.
+ */
+static bool png_save(int fd, pixman_image_t *image, Error **errp)
+{
+    int width = pixman_image_get_width(image);
+    int height = pixman_image_get_height(image);
+    g_autofree png_struct *png_ptr = NULL;
+    g_autofree png_info *info_ptr = NULL;
+    g_autoptr(pixman_image_t) linebuf =
+                            qemu_pixman_linebuf_create(PIXMAN_a8r8g8b8, width);
+    uint8_t *buf = (uint8_t *)pixman_image_get_data(linebuf);
+    FILE *f = fdopen(fd, "wb");
+    int y;
+    if (!f) {
+        error_setg_errno(errp, errno,
+                         "Failed to create file from file descriptor");
+        return false;
+    }
+
+    png_ptr = png_create_write_struct(PNG_LIBPNG_VER_STRING, NULL,
+                                      NULL, NULL);
+    if (!png_ptr) {
+        error_setg(errp, "PNG creation failed. Unable to write struct");
+        fclose(f);
+        return false;
+    }
+
+    info_ptr = png_create_info_struct(png_ptr);
+
+    if (!info_ptr) {
+        error_setg(errp, "PNG creation failed. Unable to write info");
+        fclose(f);
+        png_destroy_write_struct(&png_ptr, &info_ptr);
+        return false;
+    }
+
+    png_init_io(png_ptr, f);
+
+    png_set_IHDR(png_ptr, info_ptr, width, height, 8,
+                 PNG_COLOR_TYPE_RGB_ALPHA, PNG_INTERLACE_NONE,
+                 PNG_COMPRESSION_TYPE_BASE, PNG_FILTER_TYPE_BASE);
+
+    png_write_info(png_ptr, info_ptr);
+
+    for (y = 0; y < height; ++y) {
+        qemu_pixman_linebuf_fill(linebuf, image, width, 0, y);
+        png_write_row(png_ptr, buf);
+    }
+    qemu_pixman_image_unref(linebuf);
+
+    png_write_end(png_ptr, NULL);
+
+    png_destroy_write_struct(&png_ptr, &info_ptr);
+
+    if (fclose(f) != 0) {
+        error_setg_errno(errp, errno,
+                         "PNG creation failed. Unable to close file");
+        return false;
+    }
+
+    return true;
+}
+
+#else /* no png support */
+
+static bool png_save(int fd, pixman_image_t *image, Error **errp)
+{
+    error_setg(errp, "Enable PNG support with libpng for screendump");
+    return false;
+}
+
+#endif /* CONFIG_PNG */
+
 static bool ppm_save(int fd, pixman_image_t *image, Error **errp)
 {
     int width = pixman_image_get_width(image);
@@ -329,7 +415,8 @@ static void graphic_hw_update_bh(void *con)
 /* Safety: coroutine-only, concurrent-coroutine safe, main thread only */
 void coroutine_fn
 qmp_screendump(const char *filename, bool has_device, const char *device,
-               bool has_head, int64_t head, Error **errp)
+               bool has_head, int64_t head,
+               bool has_format, ImageFormat format, Error **errp)
 {
     g_autoptr(pixman_image_t) image = NULL;
     QemuConsole *con;
@@ -385,8 +472,16 @@ qmp_screendump(const char *filename, bool has_device, const char *device,
      * yields and releases the BQL. It could produce corrupted dump, but
      * it should be otherwise safe.
      */
-    if (!ppm_save(fd, image, errp)) {
-        qemu_unlink(filename);
+    if (has_format && format == IMAGE_FORMAT_PNG) {
+        /* PNG format specified for screendump */
+        if (!png_save(fd, image, errp)) {
+            qemu_unlink(filename);
+        }
+    } else {
+        /* PPM format specified/default for screendump */
+        if (!ppm_save(fd, image, errp)) {
+            qemu_unlink(filename);
+        }
     }
 }
 
-- 
2.22.3


