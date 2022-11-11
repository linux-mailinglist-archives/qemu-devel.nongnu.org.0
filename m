Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7548625265
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 05:24:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otLZi-0000af-8P; Thu, 10 Nov 2022 23:23:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=83144312e2=bin.meng@windriver.com>)
 id 1otLZh-0000a6-5p
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 23:23:29 -0500
Received: from mx0b-0064b401.pphosted.com ([205.220.178.238])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=83144312e2=bin.meng@windriver.com>)
 id 1otLZf-0001cG-Mq
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 23:23:28 -0500
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AB4Fv80025971; Fri, 11 Nov 2022 04:23:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=rysNIk6lSMrISHuzxrKLFd7qLEqSoQDKkPP11ae2GJ0=;
 b=XGlfooJs7m9vWvprOy9lfU8hiQPX7hmXyJsmeHMjSpcxUAnt7A5YkqVCsx4LqMusqpfl
 n+wQYSrsapYxaUKjeEMZepb5fry3QxOokDqfw4YSGuOHySRzUQB7cmIKGY9Zc7xZ45tK
 SI/g3RrmAx1riyc9VnaHqnjxg1U1rKvXWoGv/SfXArJvrcdiyZ5kDi1p1FNzEIaHptf/
 WWcr7vp0nPMQIqYCcnNMP9eVSJCJKlXB12bgPuCSgnlH5q45uYrPwTIExvphoJyCR2g7
 m31z/Pb7JaGFHO9ivkX7EeXp86FMLy+h/6YSOZb1Ny7US+U7BSxiQUaeFRLvpIEvzxTg gg== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2103.outbound.protection.outlook.com [104.47.70.103])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3knet9nbdy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Nov 2022 04:23:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RP0T9qz0Y7XPjNaksTSGas1bc0LqOKN2urrRoHQYNkrVSs5/ktTSpCGvVtrDDZ24x9ExcBvZ7mwr1WC3npAJ/DoR+rzJKWbZrkYYY1Oqo47AYhKCj833i5otGf8yuiAvzciu11/PuYuLB8OSxdxGq2VXkejpokIkZbrhTQYZKPCGemopalK0Y8yWBsFS85ooRxBFmVryk6WBaDLrv132Rwq4Mr+Uyt6vIJj1r2rPwvI6gctVc+wxTualB21clfakFrQGHuoEfJNOOIq8lQ6oyKpXqF2p0t8u+EEeV8tBjKrXKVBNc1+ODkRH3+8YXjlgYvVW7ddUgPJSrD6tor10kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rysNIk6lSMrISHuzxrKLFd7qLEqSoQDKkPP11ae2GJ0=;
 b=VvxPnAXl2x98TebGKqz3dc9uUVIcyU4w3Uoyk/5IaICz17GPTshmLd1YtChFd4Ise42FMc3y/5342iu9CQez6YH4mbDCwIE8OOukQdGFrTEUz6Y1fFPNTPFpGo5vBaB8rWwCrEEa0TSjbiiEWJ8sl4KsTznGP+AnL/2ospGuVN03pYq91462rlVmj9PHETPm0A+g+zoDI+gdzNyshGh3DU9XklVdNBe6uZj3q+xFknRJ43jD2p8ewANUApeqhRRI1B/qSbUOl37QBYvqdLO/C7ZHH2PLFx2vTkC0utQNd+q0hT1zPrXHw1wtZkKtOfZA+gecN/jtvUQ1+0CB87U6Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5358.namprd11.prod.outlook.com (2603:10b6:5:395::7) by
 SJ0PR11MB5102.namprd11.prod.outlook.com (2603:10b6:a03:2ac::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.27; Fri, 11 Nov
 2022 04:23:24 +0000
Received: from DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::8e5e:71da:1e29:bc15]) by DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::8e5e:71da:1e29:bc15%5]) with mapi id 15.20.5813.013; Fri, 11 Nov 2022
 04:23:24 +0000
From: Bin Meng <bin.meng@windriver.com>
To: qemu-devel@nongnu.org
Cc: Guohuai Shi <guohuai.shi@windriver.com>,
 Xuzhou Cheng <xuzhou.cheng@windriver.com>,
 Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: [PATCH v2 18/19] tests/qtest: virtio-9p-test: Adapt the case for win32
Date: Fri, 11 Nov 2022 12:22:24 +0800
Message-Id: <20221111042225.1115931-19-bin.meng@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221111042225.1115931-1-bin.meng@windriver.com>
References: <20221111042225.1115931-1-bin.meng@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0138.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:1::17) To DM4PR11MB5358.namprd11.prod.outlook.com
 (2603:10b6:5:395::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5358:EE_|SJ0PR11MB5102:EE_
X-MS-Office365-Filtering-Correlation-Id: c08acbe6-a7b6-499a-aed6-08dac39c78e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yWHcTcuH0xXVcv0RcBMrptJqZzZR6+I0Pdq6P+oKzwa4dZydrhDh2nHJcHp2bOAPpwieDutl1FPeeAiktaRkszzBHj2ngyHaeQnb8dW7jpyvHhDLDPjGNbSGTzCS36FiBOplQMpLj0Gd/w31MOVAyANVY0Jna4/xhuE1z8/A61U/RVek5JorwD/Jt0PY+p17Efd+Gdo4QzVEaxvrG8oHdkD126Lap25/cFgHkQ6G7iMRCBos2yvgeYywGMqy64A3elDLfNUk9o77ThTSRdxcpnPblRjRqZo25M4yj5OsvtPGKgZQBEjzI5PZpea+smfiQ3TFpPR+bU4g+aDYJbVko15nCxlYdocKjd1+IMLD/KPFpPDhhFY9MY1RR5F4iWzItgcsWM3qgMs0s4rjLG4edFMcjXNQ3UKa+Asyvor//iEbnAG9WzvhrPJvWMl757Aw6TnoqBt2temECW5nvOvLwHRQ1RWDKv5iUI1HhJVYtQ7h0c7HwWdsavus9kpNgnwacHJIfdJv4+F8rOlGJ4FYot5SkSgT1KjNVSek99ZkOE3BgTZga7UDqjX/kQYLyOyyoqT8EgNknwh+xNJURGc/IxwnPRfWIAGHz3vErGVKPlE9vi9T2RaSQBQLuhi1WuXgWrqg2iDehQggWt+nPrsqfjAzcejVLWttpsnC2ZxMXe75R4sZadeMR+zaD57sGqlj2cKaXMVmusaDXBY8ii30eokwk+b7tJ4NuqKaab5Bzh0RmFQN3UDD6EionRmrJ+xc
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5358.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(346002)(376002)(39850400004)(366004)(136003)(451199015)(66556008)(316002)(86362001)(8676002)(66476007)(66946007)(4326008)(38350700002)(38100700002)(36756003)(44832011)(52116002)(6512007)(2616005)(1076003)(26005)(6506007)(478600001)(186003)(6486002)(4744005)(8936002)(41300700001)(6916009)(2906002)(54906003)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZdJf7Mocunb6LeUVmgFuZoc75xMoAwwtlTDya6c0fEYVIWkq9Xrb0kBPM4MW?=
 =?us-ascii?Q?xEcfo1S0i6hxaD6VIh34nK9eLzzSgAY1nj5dpER3MVCvlg8KNV23p8Xom4go?=
 =?us-ascii?Q?HeoLIFgHOu7QXZC/E2pTLn6wvlYe1b7LGQN2Uz5fjyo5zOXAhKiRFpFnoSLi?=
 =?us-ascii?Q?ohul6atN91aWaLdylk0Npq+I9K1Fe4uou5YRSgzEv2izfmsKVjws0ffVRTEU?=
 =?us-ascii?Q?r8DtanaWPA4JDMFyDlBHYhcy3dzdMUg/1AKoIYp7kxvcKfJOf+llZ9pN3QB6?=
 =?us-ascii?Q?MMLDNH/h92nC0y4nlf4Ebd+1Ym7Uoypbm7NjALT5x2QWhwcxImh4pNu0yRW8?=
 =?us-ascii?Q?RLWCOQrWrE81M9zHzEKUpq5w4euDkIxYTmMKGWTBX8o4oq7HUet4tY7eik5b?=
 =?us-ascii?Q?jjj+ecpOaXWnxcTGcvgw9ay5kfRTp/GTFwvnq0pyBWYj9KAHm1f8q8hwzVFY?=
 =?us-ascii?Q?B7DN4Of4CXw7fw3dKgq1E6dg6rTllYPxPCDTQMr4aPDcSbEHuAPaCADQ+tur?=
 =?us-ascii?Q?gdSWfJklEj0LdgQ+KdYjdp9LCZ3eou7jqMN8xFkmgNm+ygOHsuoXq7c8vCQ2?=
 =?us-ascii?Q?li1wPXfsB3QFnOTf5JPfpzcDb0rgoRhtD5jN4strcIQf+QOesH26ui7Q5BWm?=
 =?us-ascii?Q?+HMKUp4qQzBRdh6HM/K9niKFSizKpRDgGBKBDLD/UKFp6UAcJ2yTJe2pZN6o?=
 =?us-ascii?Q?Zoz+Y582bcnykDJQ1F3JAN0rEAt+zYxjUxBwNnzBYZz8ZK5/mdkwkewnjCps?=
 =?us-ascii?Q?OWeBSA8Sn21FWr8VuTLfpuNljl+K8spcOmKu923BYZW4ZiBavsj8bxdOLWSr?=
 =?us-ascii?Q?EOApGaq45sXy8e0rDBb1Foqjg+TCvGZ7uW0G8nGo2xoY0I/6DZN357vL7HNc?=
 =?us-ascii?Q?17iYAtPUF5n8f0eRGVuhRsI4/yI6X45jnKwpN6+jUHOzAcdWqhSdQVsvsfl1?=
 =?us-ascii?Q?9/nSCIiY6nwJd7gxxr2awp1GeTtuiLUISiQvcAtxugFUvSF2xyGqxoz4Goxu?=
 =?us-ascii?Q?RRsDiure7hUbotCVBUq69lsTf1R8lQjM/CjuoiiXRhBAiqq5LaYKClj3bwt/?=
 =?us-ascii?Q?fIb1V3sFOCWfsB0i1dLHecutgtmo1gBOhvChS6UnhA6sSx08RG1Aq/s3SfO6?=
 =?us-ascii?Q?v8m7dPOXIGzntEQb37Hwv1R0e4qUplZPOrzYpCs/H8F4qtUYMHHvUKeHeuZa?=
 =?us-ascii?Q?9IIRJJAQ8Z8at1mgTus0JEEkA8KWvedyejAMIm03dvNFvGskkVe+Qd3qB8E1?=
 =?us-ascii?Q?OhI+CyKIf52uMnzIxuNjbkkI5kfAqDof1McFoWIMnS5RAft0G5QvA51Yk9DS?=
 =?us-ascii?Q?oF32ORsDecoHIO2lPmYhVb43kaE2LT9gslUpKe/B6k1ziJ2wWqV8HI0w/28x?=
 =?us-ascii?Q?a9Mj4A3ml2A8GXl9jaTHI1xpoeexb2tN3Qs2H8fM7Bs1olgmR5rPUk/TosYX?=
 =?us-ascii?Q?r6L4KffB3vlWa5nbsd8y33dWkp3NYuHpeRbLmlCKZSw303I/9zxDGqCF6ac1?=
 =?us-ascii?Q?vlgimaZzCB+GAZS1fZPfiJMEKFu+/4aNMsnIICgPDQDl9yqDd43ixc0CpDi3?=
 =?us-ascii?Q?ieAl6Menw+VJO6P8318DA2hEXf+HP3WoC9LDblK0?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c08acbe6-a7b6-499a-aed6-08dac39c78e6
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5358.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2022 04:23:23.9700 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qaZlMGgvSyysbFHHIuzQoudwHqS2CctCmwsICCMaGh+pMYjk7NY/L2DWCVEAf5Uc5gNa5DkSHD7d//J1U1kK7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5102
X-Proofpoint-GUID: BidJZD_F0LqKIfWYF5PqbRVmjIM8XvRl
X-Proofpoint-ORIG-GUID: BidJZD_F0LqKIfWYF5PqbRVmjIM8XvRl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-11_01,2022-11-09_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0
 mlxlogscore=992 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0
 mlxscore=0 priorityscore=1501 spamscore=0 impostorscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211110027
Received-SPF: pass client-ip=205.220.178.238;
 envelope-from=prvs=83144312e2=bin.meng@windriver.com;
 helo=mx0b-0064b401.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Guohuai Shi <guohuai.shi@windriver.com>

Windows does not provide the getuid() API. Let's create a local
one and return a fixed value 0 as the uid for testing.

Co-developed-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
Signed-off-by: Guohuai Shi <guohuai.shi@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>

---

Changes in v2:
- Move getuid() to virtio-9p-client.h

 tests/qtest/libqos/virtio-9p-client.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tests/qtest/libqos/virtio-9p-client.h b/tests/qtest/libqos/virtio-9p-client.h
index 78228eb97d..a5c0107580 100644
--- a/tests/qtest/libqos/virtio-9p-client.h
+++ b/tests/qtest/libqos/virtio-9p-client.h
@@ -491,4 +491,11 @@ void v9fs_rlink(P9Req *req);
 TunlinkatRes v9fs_tunlinkat(TunlinkatOpt);
 void v9fs_runlinkat(P9Req *req);
 
+#ifdef CONFIG_WIN32
+static inline uint32_t getuid(void)
+{
+    return 0;
+}
+#endif
+
 #endif
-- 
2.25.1


