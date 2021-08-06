Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEBBC3E31B5
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Aug 2021 00:23:49 +0200 (CEST)
Received: from localhost ([::1]:54348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mC8Fo-0006uH-MZ
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 18:23:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1mC869-0008Tf-Rb
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 18:13:49 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:61144)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1mC868-0004Sf-3k
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 18:13:49 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 176MBlNN032562; Fri, 6 Aug 2021 22:13:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=PuPwd/kuKKKo9Ljmph+vtxsgiEEgmmfCQmLTxKjsVgs=;
 b=mTpeSzAOYvQzG5tkXp64Nv/datZzsSKmAkBd9afK8pVTOIGsvb1hc7lWKgTh9eL9rV4B
 zp1oQTaz/zFHWtqLwKds7+HT3+ORkvm5m09i5ctwYRK5JSMEDucvpHaR1NsYP45kF6UY
 DXhSjhHWXz3+1gpXVGDTQiXydXtaLIWOwWddnCTCO+HNNGAUub0olNE5gKPZUZFL9ZvV
 gL5RWrmIrq5ovA0Ae+vdJw1npaPwRCwAxeQQuXTDp3o7QN7CDIVID8mSAwAhkt41Nq9Z
 kTA6Wl+NyrfLXCoi3ZvbQicRzWVxOTeaADaWRFZ0EtCMya/s+omDvrGNPsPvkpA4t39H lQ== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=PuPwd/kuKKKo9Ljmph+vtxsgiEEgmmfCQmLTxKjsVgs=;
 b=jbhtzSQzoLW0XY5uvTo976i9OJSV8JxfvXR/Dat8HD/2pRiOHF0gV2oOz1g2Z+6AjjT+
 17xqT2sLIc3oE05xt1VvBq7PSeQSvGrRo6tvQ1VJVIAPJG1hS0xaZfX1lZhgfN2dtPkp
 0qUosEkQPEfDcoRqCS9LVYw9/o5a7I0ChZRJ11bK6C0TyoSQLGnoMOyr1SJbR1uLvXCE
 d8EKvSNoYuoxNYz8ZV0CZSmj5tNhykf9YKpoLCM9wINvXjx9uoX8otWbLV7EmhpyIxwD
 pLu5sv9v46r5s426er4/p38E42hSPPmOe18/I/L9rY0aH8uNdSX3BIwnldZ+GRN5phPv 6A== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3a9661s143-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 06 Aug 2021 22:13:42 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 176MBie0013869;
 Fri, 6 Aug 2021 22:13:41 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2109.outbound.protection.outlook.com [104.47.58.109])
 by userp3030.oracle.com with ESMTP id 3a962pfb9c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 06 Aug 2021 22:13:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W+CBZAGq2Csho70ms7mrs7lRcxgg52tR4hc6ZQNe8M4y4jHNFsltpU+rfOoQehC2q8a1En0RLfn9iQm1KC+Yqir9nrBHcv242jlmN61GkjfqNIVo3dPssNL76Veh64rnUYU2IfaY4hEd5no83ET/W+TP/9mmnmLailmXD7iRqNkZpU6MMyw6eNfAbKOsHm9jT1gu1RYC0xeoB9oUJsyjJdi6nahFA19GIhqDEIAem0vjHCfPD8Ksj3rh6Bua8JOYps6mpUb2FF3B1aS6tRR19A6Sg2a6e5oaFJCXrmYGKq/HeIfk0LjwWZ0Ex7rW3vkrTulR1D9uiBuzJfHIafv2Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PuPwd/kuKKKo9Ljmph+vtxsgiEEgmmfCQmLTxKjsVgs=;
 b=EV1fIM4go7QHiXEt4lHvl3uO8NN/JsRznuzs2zcZ1E7KEMtaMPIzd4oSLJAhL26FQ14jdPeFOOHD9nNFjCbeXkDQtIAX/mfVPYVBtVqw0gcpa0/2kh/XwfF2xr9OmLoSG73bfxXvDN9U2BUKQ3+nMYf/b5BD6oVQjPF2DPWeJpsCnoyzQ+EyH0hK3Fg3B6nX4yAOPVK9vPbcOAkI68nBTAT7ii+VRsvyB4BXQldxg+HQc+7povdaO6wFBrKR2wwDBKsF/5Cwsc8yMwcqiaIFuSDw/e7qSwFzB6ChlRpW+Ar0+yZVldbDNSZ0TCXu/1sZCDZdL9PVGgG8hiwja4kJFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PuPwd/kuKKKo9Ljmph+vtxsgiEEgmmfCQmLTxKjsVgs=;
 b=ohN0sIdVDS9E2yCud99PsPwyCRy4SI/PZ9dWIPhwYHhJ4XEbhZiO5ZB2PdQjucjIdVJPg2IU95uHCvSaa83Xu6f2AiYgxffc89M+Swa98DsgQsWoT9w61xpn8wWV4zzjE5jntV7UFtQtMm3nAr9GQ8K0TzIcFcgdihAxUYK0F3s=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by SJ0PR10MB4734.namprd10.prod.outlook.com (2603:10b6:a03:2d2::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.17; Fri, 6 Aug
 2021 22:13:39 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::99fe:4091:351d:11e3]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::99fe:4091:351d:11e3%5]) with mapi id 15.20.4373.028; Fri, 6 Aug 2021
 22:13:39 +0000
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH V6 25/27] chardev: cpr for pty
Date: Fri,  6 Aug 2021 14:43:59 -0700
Message-Id: <1628286241-217457-26-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1628286241-217457-1-git-send-email-steven.sistare@oracle.com>
References: <1628286241-217457-1-git-send-email-steven.sistare@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SA9PR03CA0002.namprd03.prod.outlook.com
 (2603:10b6:806:20::7) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ca-dev63.us.oracle.com (148.87.23.7) by
 SA9PR03CA0002.namprd03.prod.outlook.com (2603:10b6:806:20::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.16 via Frontend Transport; Fri, 6 Aug 2021 22:13:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c150da72-dc7a-4e49-7adc-08d9592771ba
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4734:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR10MB47340ED13913D04D1F531412F9F39@SJ0PR10MB4734.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:113;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: P5enNzmOS3GgY4DklVbLy19yRVSLNiup+RDWKmvv+8Dp3bEiVnZ5vt43X/JEaBT9r1A2i5l/HcDGN13uhZAMcDNgbjBXo476iUiit4Fq50gsCeftK3D5zTyRja+/enulhVsW7Q42P1T4i50LiwYPg1XYii9iJ/ndLeHGgIdurGDGqiLgL6ErWVm1AlogXisMJm9tSiLqa6PqAlN8G0nCO6UewfqMy/RwubzndEmqEdCiJfk9vXab3R22acF7MYZGm98Rkk4OjF+s4sa8ZsrOeCTfAcHO2QpgtYVnLZdVXxeJaIGa2UzDTtjD1IdzdGA4Y7VoYZsHWTXwTblzS6hFNzxMEXmEYDC9QWGHMELm3M9kiM2jYl2nQq50ryQXAovPQCDURBpP9X9KZyNm24xKnlTIhqjhrgxtDvcXuqut8l8evSVlgt2XtjmmfPz9iEHQROMIQX9eo/uXVX3y1Y4z2FxMi3qpI9hF+7jp2bzJ3U6R0JeaKJGtuKnHg9IA7THS3UrCePru4/uxpRBpY83noyCOjyXtAq8jtCwlijb4sTyqiP5r66KhsYkiQYlWOfzAmCoS+Qoz6wLM06WdSazxLPQ29apIYhwNc85F9ZBUxMa5As7i712uyeo8KCSnMLZh+YGrfXkXrZ+krRof520cIkL6pdHuY21SixOouZLjicyFVM5rerdIdb8FftrhbN/S
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(396003)(376002)(136003)(366004)(346002)(66946007)(107886003)(66476007)(8936002)(86362001)(316002)(83380400001)(54906003)(8676002)(66556008)(4326008)(36756003)(956004)(6666004)(26005)(186003)(2616005)(478600001)(7416002)(6916009)(5660300002)(2906002)(52116002)(7696005)(38100700002)(38350700002)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?53G/U4cXq1yc9Nojba1BEbC3iqHo+spcpJwvq4ckqAsKLI3weO5B5bAdUDwu?=
 =?us-ascii?Q?YRqooHyp44Tyl5f4hexQFHxXrL3EuRLWX8nuUPMrpEYLg3XkoOTrhLXvbhcF?=
 =?us-ascii?Q?lSzsduVw55RH/2CdwYEnjPegijFx8WkOBFWiHCOACMhV9ceiXyN0mRBc1MMo?=
 =?us-ascii?Q?K2cQIiVJr1o0W+SboxZNo0EjkvxEnTz2YKpJBuglq9cLa03q1+1wqw6vWzj/?=
 =?us-ascii?Q?s3kiMwbMDoA9MQcutTInjepqdguq9yQ8Q50DqfkF93rGP6sOhWrNJN9762/S?=
 =?us-ascii?Q?yg9A6Wyl8FMYWeFqe207MVomPHQ/9VmZcydZAP48Zhh0ukCENWCBgLP3irYA?=
 =?us-ascii?Q?2xqafKeNAIZNzF2F1yWPJ/nc5OG7RRdX4Q1DxNzOVCCDIKUgNRiKwsHow4jf?=
 =?us-ascii?Q?YJj76g4EIpXWKS/HOnc+xXqiX+koAI8a76tl95F/nvtIMfJAgEInm8Lsn6uZ?=
 =?us-ascii?Q?akQxmbuizS1JTgRGG3ZN1w4LrpTwdHWC5SY0oZ0EWxWPYet6qJdaws7OWWNh?=
 =?us-ascii?Q?cR55GF89veonDuezyf/1kU5/zaONYffcM9+ybfTAzaUNB9yBVExaNbaBh1GM?=
 =?us-ascii?Q?XVO8Gx3pM713FgcSIpmBj/627wQIexEdesTz6cD39vxgzjv4mE3zobkoBYGo?=
 =?us-ascii?Q?Kv7OAeiCn7wxLABCbkcvIVz6jSB5F7yFMN6a7ZpYKLpdoUw76JJ+xpUSDqHW?=
 =?us-ascii?Q?hmKyatQNfcW0XGsfEYC3mZMPY00MI9ONnuZrkvzl0N15ayPci3sof6qJTjAW?=
 =?us-ascii?Q?Yz/Vx78qS6Ul5zjpCbCkiPIPPQYp/xKeokcx+Q3XhyAS4R5j/CXnUIhgrylD?=
 =?us-ascii?Q?fFJXm1ru+Y24sK/UpMecC5zSN0V5wyMHUEjwA2S8lP2cv3qwr7BvMplxZLOu?=
 =?us-ascii?Q?wi/klT4LsZWQcD+o+0W5w883OBd2W1bhRfWqKVBAYBY41iqTnKXhhkyxOlJ8?=
 =?us-ascii?Q?9lJFF2MvIXRNfgS0M/uJCw0b+aqOdzeDz9/IGMIwtqOv1FOxryhnkgbMbUrf?=
 =?us-ascii?Q?TsZ17Kg1gcq8oMZwnEmPNcthY2fASSw9Bhody+zYQMzTAb4eoNqpJjL2r1DM?=
 =?us-ascii?Q?B2n71gCh5cV3/MZ5/e9bSNZxGNAZ8oY2mKMUoHfPFg0/GWao+WdUXASqWFTh?=
 =?us-ascii?Q?sU8FLJrZVYtonM0FaAm/LUAfMbRtrWXhZbGngD164LwUh+Z0xtJDB/RupN2q?=
 =?us-ascii?Q?oeySWvQ4J6te3t1AVCIG7ZUoCsX5ojjuKzZmyh2bAlUOqlDpW407HMqAsN98?=
 =?us-ascii?Q?9OMdhG/GPW8JT10Tdmcns5lYhsjNohLEs0K/s5lB96nei4x2Ut83e/kuhWU9?=
 =?us-ascii?Q?g3u1IJ/1oQ8q5P+9e6fA1ZpD?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c150da72-dc7a-4e49-7adc-08d9592771ba
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2021 22:13:39.7648 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vrRIsK6xFQ/YRfb20UPe3XGWWETYwcTgyy9wnXNCFhbcvdl5CNCek7M/oSBuBpHF6qUE8bFvULR+5Be7xmSD+zZNtoAHhPFD2DNXdpkueKU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4734
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10068
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 mlxscore=0 phishscore=0
 bulkscore=0 adultscore=0 suspectscore=0 spamscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108060145
X-Proofpoint-GUID: Ov-Q2PsCgpSOBoDDGbnXSLXxg84c1wKT
X-Proofpoint-ORIG-GUID: Ov-Q2PsCgpSOBoDDGbnXSLXxg84c1wKT
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Zeng <jason.zeng@linux.intel.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Zheng Chuan <zhengchuan@huawei.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Steve Sistare <steven.sistare@oracle.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Save and restore pty descriptors across cpr-save and cpr-load.

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 chardev/char-pty.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/chardev/char-pty.c b/chardev/char-pty.c
index a2d1e7c..721cee9 100644
--- a/chardev/char-pty.c
+++ b/chardev/char-pty.c
@@ -30,6 +30,7 @@
 #include "qemu/sockets.h"
 #include "qemu/error-report.h"
 #include "qemu/module.h"
+#include "migration/cpr.h"
 #include "qemu/qemu-print.h"
 
 #include "chardev/char-io.h"
@@ -191,6 +192,7 @@ static void char_pty_finalize(Object *obj)
     Chardev *chr = CHARDEV(obj);
     PtyChardev *s = PTY_CHARDEV(obj);
 
+    cpr_delete_fd(chr->label, 0);
     pty_chr_state(chr, 0);
     object_unref(OBJECT(s->ioc));
     pty_chr_timer_cancel(s);
@@ -207,12 +209,20 @@ static void char_pty_open(Chardev *chr,
     char pty_name[PATH_MAX];
     char *name;
 
+    master_fd = cpr_find_fd(chr->label, 0);
+    if (master_fd >= 0) {
+        chr->filename = g_strdup_printf("pty:unknown");
+        goto have_fd;
+    }
+
     master_fd = qemu_openpty_raw(&slave_fd, pty_name);
     if (master_fd < 0) {
         error_setg_errno(errp, errno, "Failed to create PTY");
         return;
     }
-
+    if (!chr->reopen_on_cpr) {
+        cpr_save_fd(chr->label, 0, master_fd);
+    }
     close(slave_fd);
     qemu_set_nonblock(master_fd);
 
@@ -220,6 +230,8 @@ static void char_pty_open(Chardev *chr,
     qemu_printf("char device redirected to %s (label %s)\n",
                 pty_name, chr->label);
 
+have_fd:
+    qemu_chr_set_feature(chr, QEMU_CHAR_FEATURE_CPR);
     s = PTY_CHARDEV(chr);
     s->ioc = QIO_CHANNEL(qio_channel_file_new_fd(master_fd));
     name = g_strdup_printf("chardev-pty-%s", chr->label);
-- 
1.8.3.1


