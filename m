Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B0094E9CE9
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Mar 2022 18:56:39 +0200 (CEST)
Received: from localhost ([::1]:53936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYsfW-0006wf-64
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 12:56:38 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kshitij.suri@nutanix.com>)
 id 1nYsdS-0005Fr-VY
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 12:54:30 -0400
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12]:11784)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kshitij.suri@nutanix.com>)
 id 1nYsdQ-00074T-GA
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 12:54:30 -0400
Received: from pps.filterd (m0127841.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 22SAoqJ7028548;
 Mon, 28 Mar 2022 09:54:25 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=CB2zp35M3gKYk1tjFzOJCN+jacSLXlnlQl1RL4NipHg=;
 b=QM5vWZX17oot/iNpWGXQvkFJdMPeJhj8PAFZKKakVuRWxtLJVGZCRvowtsLzC2PMEFoR
 K0ZK18ju7/YkJIf7v/s4uIzJeSmnOWaeOHWzyv4IiHerOb0SYsurEUkPpuM++j+vtrqm
 SYV4TdtOs7GuPZg/o+FLEzjxQUtbkY8tdLYXVPhQtSfZgJFr0XNo3WS2pDC6MytDZS4t
 OdbNcXBVq+U4QX3gxT6bTpKUID8AbqtAgN7IkYHJCyDHRKgNtSEvLnw6ddS66qiXsWR8
 xpoODs3hpYiBdk/fi2m7/mTjPTIoRTtn8Plri+rh96mZbG9CtZpuOGitqdGlcpk3ie3S UQ== 
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2177.outbound.protection.outlook.com [104.47.56.177])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 3f20c9bxph-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Mar 2022 09:54:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OSqlKv2kaLrSg5aHIADQb5VjBqWHJz92+BD2Jh8RLA/JYzn5erMeYmorBHQjL9CseAZcY8aGYpT8YQWW+a85k/KjqdrUp+r+pWD+XaQ49ROSF1Ry3RRBDHrOTrjBi06BeRR5oSJt+YBuHNVU7v/XeFlFCMI0ri7vI12NDdjeTLrNgkXEVH+CQdWC87SIa0ucnroyheK9Jbux/P+bf/r0Rxi8sQN3/+M+gXvOS0rEt2rQXHW638LA9ZfXGYjPykRTwq6ftjv8ok3n4ptmEayy5vQGFiD9XWEtcmoVh1DmrJnWmsuXgnxrgYukArqneNTOuwXxufYzlTDTveveWpmquQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CB2zp35M3gKYk1tjFzOJCN+jacSLXlnlQl1RL4NipHg=;
 b=lXgmkAIFIlj0E0QoBo0JksJptSMduc/7OdSLtAU/SGQzwM23dL1Hk+b6JY3atHeO14YclaOOybWm3CRL4R1xNnW22l582YFTkpIk4JdI0WXGtZv47lebU3KVyvWepVhyh1lLeMcgRmyeQj+Yzal73dkOrtjAZ32YhZXYIaNzf9Y0DbrdslD2WrE8nCwAtYve3YSAqeO11wanuJ+MlhuOSurX/jwG2VwJ6TnuSmTGm2ttBdg91JZewpf3TtvmyTHTn7AKJC4kToetDa5sDwbGeDnsc6HFIQCi8fYo6n3hQAxpGOUMmL+BT9onhF//ivBgVcjPWbjt4+Jjhw0IYT55aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BN7PR02MB4033.namprd02.prod.outlook.com (2603:10b6:406:f9::16)
 by CH2PR02MB6182.namprd02.prod.outlook.com (2603:10b6:610:d::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.18; Mon, 28 Mar
 2022 16:54:23 +0000
Received: from BN7PR02MB4033.namprd02.prod.outlook.com
 ([fe80::5d3d:384c:d914:b12d]) by BN7PR02MB4033.namprd02.prod.outlook.com
 ([fe80::5d3d:384c:d914:b12d%6]) with mapi id 15.20.5102.022; Mon, 28 Mar 2022
 16:54:23 +0000
From: Kshitij Suri <kshitij.suri@nutanix.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/2] Added parameter to take screenshot with screendump as
 PNG
Date: Mon, 28 Mar 2022 16:54:15 +0000
Message-Id: <20220328165415.2102-2-kshitij.suri@nutanix.com>
X-Mailer: git-send-email 2.22.3
In-Reply-To: <20220328165415.2102-1-kshitij.suri@nutanix.com>
References: <20220328165415.2102-1-kshitij.suri@nutanix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0P220CA0008.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::17) To BN7PR02MB4033.namprd02.prod.outlook.com
 (2603:10b6:406:f9::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1ed48502-cb8d-4566-b0e1-08da10db9c3e
X-MS-TrafficTypeDiagnostic: CH2PR02MB6182:EE_
X-Microsoft-Antispam-PRVS: <CH2PR02MB6182FC5D82B405AAC28DF588991D9@CH2PR02MB6182.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nTauTjoIKIMJi7NPHMzR1AF2qR7+oxx+qRTQEMZx40rIlPhLFph+jGV10yj9xA69llECFgnK9RaPTslMkZtTntMwZeB7xA9pKbEM+M7r+un1EVlQzrXWT5mz4FiOEcYUOKPOifqY2mQPrCGFYIVZ3GI6rNMLW+Oe133uvG4OvIaBlhHFL0pf/XU6AQR9fCYJWkesSE/3HGtz4mXuxphkIgz5qtPg5biFnjv26zzVCzQzjHIsLRqyx5OHdATFebHKzTqEu+DAAdGg5R6wZaZWgOmZ5TKv9ZJgkldvgEqLqeeNAeNV0UsQau5aijfg/uvxYWfws3qncWSao+CT+X7T6n+WeHAKzOjJ3+ESJdXYnnWhOLJQBkg1aGG7UZ+vFRI/lm7OrOFom2sYKPes/g8YUjPAtFxx3zKyRrKujjzZ3POcOotFlcJA6ID2J2WSJcB/nrEV6dxW49sq10Atl57ZKDhMIJgL8wqy0aQAZvOUZnrnXkhR3Ptrx51DqUdVW++NiObrLBEQVL/lpe8VLbkUQqxj7E7cF/+ByHVpjmZt+JEiLbaraPwX0s3NXxa5S8hgD4niDJeq7qQlwll3T3zYwilSm2DgPMWyJ4W2KHdoKBd9R4EIQ1tiPWjpToRyHb6dbD11Ft2iD3RT2YE371Sg+iPXOcxwJmuVCTl+sd3lCtOb6Wwq7DsW4fK+aQMNwSiXoKi1fSWP9Xw6Rr9vp/vEFxNBUuobMvsspbOipRc4MSjVjsAloXUgNFqhf0rDNn8a2qlDKViCHVycSqxP3QvtvwiZa+jWRtSyYdiIF6bVmIY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN7PR02MB4033.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(316002)(6666004)(6916009)(186003)(83380400001)(26005)(6512007)(44832011)(66574015)(2616005)(38350700002)(38100700002)(86362001)(1076003)(107886003)(4326008)(8676002)(66556008)(966005)(66476007)(6486002)(508600001)(66946007)(6506007)(8936002)(52116002)(2906002)(5660300002)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aUR1ZzBkMUU2emJ1RTdJdE1kWG5VdkJYbWx1Wm52dWdXMm1qTEEyUzdmbGdi?=
 =?utf-8?B?U1l2OWVvRmVweS9pYXJNTWZMMlV0K0ZISkJqdzBUTHlRVitGQnBGVU1hdkI4?=
 =?utf-8?B?Y0tSNmR1MnJVMUVkQjZuRE9GMEx4czNTVzJFdDNuQkZqYXBHVEhMQ3Rjdjdv?=
 =?utf-8?B?cUM4b296a1lYVmZGV2JNcWFNVkpmNSttcCszZ1AreTB0QlFkSDBzYlpTQTZ2?=
 =?utf-8?B?UzNwOEJPSWdHWU5hQXh1OXQrZXpCWDRFblMzOFBOajRVaWVTcm00Q1E5U0Fq?=
 =?utf-8?B?TVk2Q3JyUVhsREVScWVidTVNcWVKSHZmUXlnR2xDU0czb0hsWDRZUVdybzdN?=
 =?utf-8?B?cTBlQlYrSkE2Q0NnZkRXcGdHVjkzVXBnUjlZb0FuN21xUHJFT1RDOC96TGw0?=
 =?utf-8?B?RDFZV0pOWmcrTG90Zk9GYXE0SEt0Qnl4Z0xLdnl6QURiS0RQNk5oUXg5bXk5?=
 =?utf-8?B?NnZXb1ROOVNyclpRTGJPd1JhME5YL3doN2xOYlNqbmhBWGdwdTJvTElFNFIz?=
 =?utf-8?B?cDZYWGNqcTdGSWZxRlNwaVNZOVdsL0I0WFNndXJKV0RWa1VqYXNFZkszVDZh?=
 =?utf-8?B?QU5UNDN5UzBVRVhnZ0ZuTWtqdmNZdXZRQVlSV2U3RWQ0SnVRa3RkclRzby9s?=
 =?utf-8?B?WW1KRmNXK1lMbDZCM0srMmYyV1UzNktjMnpRNTBLMmlWbDVxV2NuNE9zZ2VF?=
 =?utf-8?B?THpEL05TOFVIUnBiUTl5S1BQbkoxU2d5MExqZ3ZGLzRuQndCUjdVbFBHM0Y0?=
 =?utf-8?B?RDEzSlcxR2I2eWhCRHlWSGk1Vlg5aVZDZllFVUsySVVrc3dhL3hFSkxLSmlv?=
 =?utf-8?B?NGNFcTBiZUhONWpYRkZYWkpXQW5VbForZ2JJOUVmOExQbVhVMmF4dFBjSVJj?=
 =?utf-8?B?V0dnOGFkRWIxSklKN1pxcUJiMmJ6M1hOWjJYWmNERUZ3eUhNNUhHcVpYQUQ5?=
 =?utf-8?B?WVVqT1Z6cnhDVHNBK3JyTklYTTl1bG13L09BbitlakpVdS94Q1hpdUlBUFF0?=
 =?utf-8?B?SXkrVGdVV09zZDRsdE54V00wVG5sek8rY1hocVBtTWczTDNxTEphWDBGN1o1?=
 =?utf-8?B?djBaY283MVF3Z0RqZ3RVQ3krVWlCdDlBWjdhU1BjcG9ucnd3bXhaY253dVJC?=
 =?utf-8?B?SVV2THBSRTVITThEZWV6MUpNRFdaSkJ2OHBmMDJTcjV4cHZ6QVl6OGNWQ3JH?=
 =?utf-8?B?ajJORFFuUkhHbHIxNFlGaWsvU284WkRLTEl1VUl1c1psR1lVVlQ5d0xKaEdS?=
 =?utf-8?B?K0xDM0ZMcjFyUys1WWFGQlZ2eENuejhhb2NZcFZhTnlGdjZhZzdTaWFHQ0JU?=
 =?utf-8?B?bGFDL1orOUpNTnFTQVRNcGVTa3o2YncwcGEwNmJGbmhsZ041MWRqditCMVc2?=
 =?utf-8?B?VEx3VldBdnJaZ2U0b1FDL0FGL1JpY2xhaXBtNGYraUtOZ0NhWFp2VXdDQUZZ?=
 =?utf-8?B?VU8yMVJNYWI5Vmw5V001dVkzNWVHQnRJMmRZUldFS0IxeWVQbFpNRzVmVDVP?=
 =?utf-8?B?OW5MQzJYbE5wb0NMV0VTbGtrUzE4OWxoM3ZiUjNaSVIxdUZmWk5jZXBXaUpx?=
 =?utf-8?B?RnRGcXRCeGI4VkxWV3BoYVlQYWphS0Z6SFlnZTZncXlPRXp0ZktjTFBINlZk?=
 =?utf-8?B?dDYzWEx6aitmZk9kNWZUenVxQnNIaHBzUHlJSGN2d29WSlZkWXFoWGQxWWoy?=
 =?utf-8?B?bDlsN0twVjJXc2dsSkN4alBMSGVNRmFIc2lpVGlsaTVzMUZKRmcwU2lHUVJX?=
 =?utf-8?B?THV0ZmJyVUlVU254dUw1cHpSSGU5UDhuUWNhZ2E2d1JYSk9ndXczVUsvQTlh?=
 =?utf-8?B?WHM4SHY5N0xOa2tqLzlXL0RWWHV4ekkrYlVJbVNneCszS3Y4RTdzTlp4Zm5B?=
 =?utf-8?B?emtJK3o3ZG5WMFZOOEdJazRXSHZ5bHpYK3ZTRnpDVTVsMFc0dTJxQ2ptK0NS?=
 =?utf-8?B?Qm5waVNRR1ZvaEp0M0xNWWIzejhrbFdkM254c1hhZEMyRVNZNGxVVlRCWWlS?=
 =?utf-8?B?MGtXN1dkY2o4YnFxZjQwZDZxMHdOc2FVcjA3OEdOS2dDcFRQTnFJbm80STZU?=
 =?utf-8?B?d25Xb0ZkNTJjSDFybFlrWm5wd1dvRnJ1UTJuUVpNbXdDbUpEZkRsV1BodEwv?=
 =?utf-8?B?R1JMMnB3ZitBUmJCM0RMTHRZN3BpeW9OWEVHcTNDZGc1a3FOTkowTzYzVTgr?=
 =?utf-8?B?SDJHTmk5WXEvM3BGTTcyT1NuWno0bjdsa1RtOEZQWVpYOFFlWVRydjZHLzJt?=
 =?utf-8?B?REtrL0V2cTNPNkZXeWFieWVyTlZ3U0RGZWlWOE9VLzhzdWZWK2Z3QnZjNEtR?=
 =?utf-8?B?em1JSWxnY2Y5bFV1eGVXNDQwSFNEbGZvMFdiWW9mbkJZNFhzOU5ndzk4UXBw?=
 =?utf-8?Q?GiPOY+MytzBPojEs=3D?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ed48502-cb8d-4566-b0e1-08da10db9c3e
X-MS-Exchange-CrossTenant-AuthSource: BN7PR02MB4033.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2022 16:54:23.3145 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GZkg6rTnVwGjimRsMXDr7nAsRvGY7Qrly77IO+J61Ok+JrLu6G3DzpY3ylvuxPUfJbCNe0D/U6hS8bfOnP8t8XhERTe9LmwXuTLDZLzmCdc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR02MB6182
X-Proofpoint-GUID: kswLF9OoJd9pcqh8g8LF2QlpBS5Dv4cU
X-Proofpoint-ORIG-GUID: kswLF9OoJd9pcqh8g8LF2QlpBS5Dv4cU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-28_07,2022-03-28_01,2022-02-23_01
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
Cc: soham.ghosh@nutanix.com, thuth@redhat.com, berrange@redhat.com,
 prerna.saxena@nutanix.com, dgilbert@redhat.com, armbru@redhat.com,
 Kshitij Suri <kshitij.suri@nutanix.com>, philippe.mathieu.daude@gmail.com,
 kraxel@redhat.com, prachatos.mitra@nutanix.com, eblake@redhat.com
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


