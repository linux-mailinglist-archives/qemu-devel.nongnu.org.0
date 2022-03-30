Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 790A04EBACD
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 08:30:52 +0200 (CEST)
Received: from localhost ([::1]:49466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZRr0-0004fN-SG
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 02:30:50 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kshitij.suri@nutanix.com>)
 id 1nZRYj-0004lu-VO
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 02:11:58 -0400
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12]:9638)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kshitij.suri@nutanix.com>)
 id 1nZRYh-0004ew-Ml
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 02:11:57 -0400
Received: from pps.filterd (m0127844.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 22U355tD029505;
 Tue, 29 Mar 2022 23:11:53 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=proofpoint20171006;
 bh=UTIGQne/nAdRu0mpbc10y1zfeTXunh84NY5qAfkAQjk=;
 b=mWjhXlC62+PqBmDpNICoiKDCXgAlWhEeSeq/KEeF3BleuhMX4JSXm9NRKAZx4j9SY7tp
 7/DP0OLNvOwfWaEikfgM47ikabvmWbr1y4Vm34fViw+2jdyiyUzFPOLlwq96DzsppNLD
 IeGjXZyAO+MrpcblVuswhn2pUTr8k2JgLU84MkZFOMt8/2cwERbbnIUl1WqVVm9SDpHu
 yVYZf1uLT6lhNRVulh0KjWjA0tXQhvONahc8bT4a7YAnkoWq2RAAY7tuGsFUK74LnFc9
 NzMMMhvaEOftL0dB4yeVdxEL03nFG2P1tjBrJf0Rkp9WpLEcgEDXJC+Aov3OHN1HZNTE Ww== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2170.outbound.protection.outlook.com [104.47.55.170])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 3f22c0fqrc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Mar 2022 23:11:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bDkwqsaC2PZ1dTeDE9hWKGb/nIxcrWpQtOv3yfHo1CG6tMiiVPv9ybDwJOWv1wLspefkdiqo2V8s5YW48/IyYK+Y7RWMsuYKzMdwU/bk0XDwObru/22ecJs1rMgaTygLgYFHIEeFDGl/K+/rABwI5XbgvckTbf6gxAOLKh8LRzTJEoEub1xYi7otLRSh7UELvUCJfInbeJzg9zmvhtuT4pBBPP04VYy8sA/zzFsh7zWTtxmtiZj8VDMiQtEN3BUq3j72iCYcSvNxBgYfgf/eRnbmJ0rVGIzbwD0N1zKgCo0r2q7Y843HQMEV/u0Ab2t/QjLXicUKa7oZIf2SOybE7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UTIGQne/nAdRu0mpbc10y1zfeTXunh84NY5qAfkAQjk=;
 b=R4kdNtO/6jU+OkljU70OgBe9oc9MsHP+O7H5FJL5sOVTVC6bD89XyBEi5uYEOaCt89n5zADgGgXOouLLMgV+CwGXYb39kxk+S6SPDgeeCL5/1yGhMxOn40936HnIXgK7fttpPEi34pw8eF1RzbeatmhEhE//CXeKrSc6PneSaEzmNG0cudC++UnaNSzV5xfZuL7CcvQAgKUjkbSBlHCSfuRmLFw1DsDEpRNLfigWGYt4zBX1VUV5jC1pZJ1H8vlnN4RJ0JxUlpx/K9hErpecceLH/6i5i1Zkqr+PT1A6QTHsEdhcJtyHFs1lRiZPj1b4bojiVYv55ckClzZGUHKypw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BN7PR02MB4033.namprd02.prod.outlook.com (2603:10b6:406:f9::16)
 by BN6PR02MB2866.namprd02.prod.outlook.com (2603:10b6:404:fe::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.19; Wed, 30 Mar
 2022 06:11:51 +0000
Received: from BN7PR02MB4033.namprd02.prod.outlook.com
 ([fe80::5d3d:384c:d914:b12d]) by BN7PR02MB4033.namprd02.prod.outlook.com
 ([fe80::5d3d:384c:d914:b12d%6]) with mapi id 15.20.5123.019; Wed, 30 Mar 2022
 06:11:51 +0000
From: Kshitij Suri <kshitij.suri@nutanix.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 0/2] Option to take screenshot with screendump as PNG
Date: Wed, 30 Mar 2022 06:11:32 +0000
Message-Id: <20220330061134.59254-1-kshitij.suri@nutanix.com>
X-Mailer: git-send-email 2.22.3
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR17CA0043.namprd17.prod.outlook.com
 (2603:10b6:a03:167::20) To BN7PR02MB4033.namprd02.prod.outlook.com
 (2603:10b6:406:f9::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9165520e-e016-4861-d577-08da12142dbf
X-MS-TrafficTypeDiagnostic: BN6PR02MB2866:EE_
X-Microsoft-Antispam-PRVS: <BN6PR02MB2866E968CDC93DE4808ED28F991F9@BN6PR02MB2866.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SXLUg7g6lhZth3JwO1ISV90x41igJ0JBH9wYtXTJO7Qq/ZlOa02BF0uOCUMENzfR5qYyYNZxYYWefVxe4afQu8Flt4Gg8PCF2+95ghhbnks1/SYSgBH3fKqiQSfSXFqt8N0DaC15BwvG4t2qzLTOM2ZIS20bycAldeZBVp/+iVqiwfw4PbV/IqN9kpiV23Mh8oXfwd9bP4Ma/pg3iB5xTOAgcoApfRQ8AMFUeLKZrvVkRBPdLDRBhMalLJpBnFca9zT8KZT8YoM2lMrXCSMqFn29jfEQS5K++xMmKu2ntNCXWwSHlrvHaeMg2AhvNxfJYvdVR9ijuw0UEnFY6TbvWy2dBaipfsiD41MvCrVySbwjs0jQEbaC7dlHkBIS+FXI2eyXlSseL+EIBTK5uzUV/u79pwnGqms37a0cMVRc+jmaZilQ3nDWLXQwvOgfT6ei3yHUpJ8xMkZFDHPNao6uFuUnT8DiBsa3srYdWrIjvAeOcDIlEa8d+j9wXJRx2YC9aOdt+1lYsGSBXe0qWhQ3OHkN6QxxldtD+9mFURhAJ1czew3X4FKCctL4IE/66cCVQ4m4s1bmWJiglDn+1VOuH9UjgQ1H4xq4Lm2TRXRlcDuU5Ogvaw/Pc4IafMvxt59WHHxzcv4zdf3455q0C4s3CpHFW72PkezbvkhWShurI3o2XDOyudeVnHUL8k/xvdCDC8Y2WNaGmnptSTDYHlQzWg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN7PR02MB4033.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(2616005)(6916009)(107886003)(6666004)(6512007)(6506007)(66476007)(66556008)(36756003)(8676002)(66946007)(86362001)(52116002)(4326008)(6486002)(5660300002)(186003)(7416002)(44832011)(1076003)(83380400001)(316002)(66574015)(26005)(2906002)(38350700002)(38100700002)(508600001)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OFZxSzRHdWY5Q1l1QU0xT2hFdE1ndEI5aXM4SzQ1emVXY05sV3dQLzJRcDky?=
 =?utf-8?B?bWsvaDkveW1PbVZWc2JhYzRkalZRUGxlbFRIZXNZRXViR0VzbXJ1aW56Smww?=
 =?utf-8?B?bHJvVWt1VVVHOGhIQ2JiZzZGckx6OFp2LzZqc0RLMWRpSlEza1ArQWpjSkVW?=
 =?utf-8?B?YzhCdTdsYjhiZGtGTHptcEZYUk9STXNPN3d3elBQV3lQOWdTOG1NS21Jbkww?=
 =?utf-8?B?NFVMVTQydFczenYzUVdmdVRyVlYvdTQ2QWZxcHplMVpnQjdtZkVpbXpSMzNk?=
 =?utf-8?B?ZHM5YW1kOGVKNm9oMjZ5UTZnZGNjNmw5OXE1T0ViTGRCVFhoWm9XMGdEQTlt?=
 =?utf-8?B?NnhLcFA2TUlwU3cxR1J3M1hqWit3N1VSc21seVZValpnSjdlWWFITE8vYzQy?=
 =?utf-8?B?TlFCeUpDTUY1L0V3RGJOU3pxYmQ1a2xOUWZVMGlmQjROckRMUHhUdFFhNnNM?=
 =?utf-8?B?U21zYjhQcExKTDBnNU9zcjNESHg2Q3VXWGk0UG1qY3FhbVgzUTB1UHA1TWln?=
 =?utf-8?B?TjV1WHlPU2hodmRBS1VpemlNd3BBNnBVU2ZRWndZQ210TGpyVFRLdDlwSjFQ?=
 =?utf-8?B?WjRud2J0NkhOU2lNZnNmS1gxTURYbU1MTDY4RVA5Tlg4Zm91bkUzZmowRk8v?=
 =?utf-8?B?UWVYVHIxbzd1byswbFZOUC9YZFlQMVRIbmFmVmVqdkZxMi9raU16aGYzcDBU?=
 =?utf-8?B?eGRiL2JWM3lhRGI2cm05WlpwQUUzT042dkxINWRqRkRJVHI3Rmxyblk5aDdT?=
 =?utf-8?B?YnRpcTlMOXVKNXJoTHhRNldvTmRUTGwvcmFlUE5ZZW9POHNsSjU0OHU5c01J?=
 =?utf-8?B?bmJ4TG5zM2lGcldtSHJ5djQyaytrNW4wWENtemFKQUZML21odEJINHZqbnhQ?=
 =?utf-8?B?a1hmTW1WSFdBS3k1Z2xmRWJpWWN3cXcvMGxoYzYvSXpYU1NDVmMxOEROYmp0?=
 =?utf-8?B?QSthaExDbjJKRjJvaWxzTzRrWlFPbnZWaWs4bHl0ekxGVXRxM3VPNmRLL2hq?=
 =?utf-8?B?NTZHNUFCQkpvdUxuL3BUem9sK1IvbVpXVlhMKzM1amYzSFpJVEU2NEhhNzcx?=
 =?utf-8?B?L0hGZzFPYzIxRzJtS0VGL2lTcGdoRzg0MzFkbTNqd2pCSGJBaGZVNDJBdUVZ?=
 =?utf-8?B?VzVPb0VNVzNBWERlbHNZdjJTbjArNTIvdGhheVJnN2lxdG1wYlEvMmlKSXVN?=
 =?utf-8?B?c0IrZ1VpQUZpQUluM0k1ZzJLQWF0L1JkaG1HNjRDbUZGNkJKdVdvLzR3ODZS?=
 =?utf-8?B?VWsya2dWbGZFazk2V1ZockkxWUFXbGRvc3QwdjRyMWpCQWZONXVYSkYxbTgy?=
 =?utf-8?B?TDBzZEdjQkhsZDBPclZHRmV2NmhaOE5jSFVjSnpZU3ZhdFQzVmxKT3F1YmxG?=
 =?utf-8?B?RHp0V3RMMDN6Z3gzenVPOVh4Kyt5OXlkK2tsU3gvWUJvVTR4aXBLWDRpT2s2?=
 =?utf-8?B?MTJYcVc0eTJQZ3pzejVNL1pIQVZSUFVDOEJpWTJGVnNWZ091Q3I4YmRnWlF6?=
 =?utf-8?B?UjV5NGhsNmRkWXYvTzJGMDZlMkNCZlZLcGFEZWUxM3IzbmdOSTgzUUV0cjFL?=
 =?utf-8?B?a1VPb3lsUWovZDBMYm95NlNBUk1HdWl0eFZFL0ZmWjNiRDc5R29aL0QrbzU5?=
 =?utf-8?B?WjRPQlJOeStJRXBYRWhOTEJtNVVWOGFId0tIeWd4Y0dCSmxYS21IRk9hck01?=
 =?utf-8?B?OTU0MzFxa2l2a1JiekptWksrWW5yL3BzSzQ1VTIwWkdyUWtEQ0tpTVpIK1Vv?=
 =?utf-8?B?dld2RkxrNWh1RkdZMVBFckV5WFNhMFBWTTRSN3psNkE5OEFjVzFxZDhIQmpv?=
 =?utf-8?B?RE1jeTVTUGU1S0laMUdLNS93V29qYXZDYkF5UExOMnZyR2pTazR4eWM4SUlh?=
 =?utf-8?B?a3c4Q29IT2NYVnhjakY5MEF5VFlIL2o1VElVMXRKcHdYWi9hdlh6a3VQZlBG?=
 =?utf-8?B?QXR2djhMSzh0czU5c0FoS2lrZHJ1amhJZ0U4OFlrNlZNMXR0TEp4WVdrRy9D?=
 =?utf-8?B?V2RkSVFKS3BtV1IybWdzd2haUEtqOWlSclJrYy9PYWJwNjRZdlZzTEhQanZW?=
 =?utf-8?B?ZGdjM1V6NWRpRy9tV0hvWnRzSzBqYVExSVJJVnNOdmZQUjNnYVRNSk9nbW5u?=
 =?utf-8?B?Z3lUeUZkaTk4bWRQaVpTUXROczlGVDVxQ1VSTHcydFVwaGhTL1duajBYQm14?=
 =?utf-8?B?Mnh3T3V3NktZRzFhcTN1cGdtT2hXV0x1TTRWd3YvSkozK1hGTnh0WUlFVEQz?=
 =?utf-8?B?WlN3cTBYZkN6VHdyRXJpazhGR1VhZmUzZmV1blRGRnRvcm1nKzJhODRwenVI?=
 =?utf-8?B?bDh2S2xTcGRPVWh1cldZR1RrSitmdlk3WmxRYzhDTThmZ0NhUWFjU0VjbVcz?=
 =?utf-8?Q?kAjqWLwmcjR2JTmM=3D?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9165520e-e016-4861-d577-08da12142dbf
X-MS-Exchange-CrossTenant-AuthSource: BN7PR02MB4033.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2022 06:11:50.6132 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zd7nHWGGFM187Ukp6jiISFnkgeKecExCdvEBPx7uIbhdkK9QRlz0ptrVW+lcqHWpEYvVrX6uj/jtsinq5nTkHbjB+w2K0dTAWcaJaTk0gFM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR02MB2866
X-Proofpoint-GUID: 5LbGIBm-J8Shzs8eAVI0qZVTFrTPAXCi
X-Proofpoint-ORIG-GUID: 5LbGIBm-J8Shzs8eAVI0qZVTFrTPAXCi
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

This patch series aims to add PNG support using libpng to screendump method.
Currently screendump only supports PPM format, which is uncompressed and not
standardised.

PATCH 1 phases out CONFIG_VNC_PNG parameter and replaces it with CONFIG_PNG
which detects libpng support.

PATCH 2 contains core logic for PNG creation from pixman using libpng. HMP
command equivalent is also implemented in this patch.

v3->v4
 - Added condition to check for libpng only in PNG option is allowed

v2->v3
 - HMP implementation fixes for png.
 - Used enum for image format.
 - Fixed description and updated QEMU support version.

v1->v2:
 - Removed repeated alpha conversion operation.
 - Modified logic to mirror png conversion in vnc-enc-tight.c file.
 - Added a new CONFIG_PNG parameter for libpng support.
 - Changed input format to enum instead of string.
 - Improved error handling.

Kshitij Suri (2):
  Replacing CONFIG_VNC_PNG with CONFIG_PNG
  Added parameter to take screenshot with screendump as PNG

 hmp-commands.hx    |  11 ++---
 meson.build        |  12 +++---
 meson_options.txt  |   4 +-
 monitor/hmp-cmds.c |  12 +++++-
 qapi/ui.json       |  24 +++++++++--
 ui/console.c       | 101 +++++++++++++++++++++++++++++++++++++++++++--
 ui/vnc-enc-tight.c |  18 ++++----
 ui/vnc.c           |   4 +-
 ui/vnc.h           |   2 +-
 9 files changed, 157 insertions(+), 31 deletions(-)

-- 
2.22.3


