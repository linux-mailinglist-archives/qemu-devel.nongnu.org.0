Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E869680A06
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 10:54:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMQqz-0003J3-IQ; Mon, 30 Jan 2023 04:53:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=13943e2a21=bin.meng@windriver.com>)
 id 1pMQqc-0003BO-3M
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 04:53:13 -0500
Received: from mx0b-0064b401.pphosted.com ([205.220.178.238])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=13943e2a21=bin.meng@windriver.com>)
 id 1pMQqV-00024G-Pd
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 04:53:09 -0500
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30U91W7s003981; Mon, 30 Jan 2023 09:52:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=3vCoOHxbCSjHUbC+8+fF0U3s0PhEtrD3RWGpqDkLTgw=;
 b=s8oSLHGsc2skE68kjNpPEJFKvMxEFjSz07mlClBapytTFYEOMpQO1hfMK4oECYmhY9Bi
 pCVy4AyAWfbj4BmI2phKJJvkSNp6C5P+mb3nJ67b2OSbhsM6by0QC4siEyhfsXg37AqQ
 6UoQws7kzdpi0fBXoVRFb0QLs9qSlwxiGYkD+VT4Qj61SzuHc1+bGOp8drhyC9AVZroS
 eeGhDN8d6U3u8eINeyYe9iTP1CAOK7yRKCdozQrA6B7usfT9f1vGHzionaseAW+nfGR9
 aMEG7EuBfbrP9xPqpOm4VwQ9iBWOgctWzL34EklHlpb8aOIYoLe1uPtPfmh2mfDilnjQ bw== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2040.outbound.protection.outlook.com [104.47.66.40])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nctpat10w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Jan 2023 09:52:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HqTdkS2AVpkCoAcj8iiSrabBQEdWkbJIJJM+m15IZ8lBz465krp+cMB5TLDj/KOyoH55PU34MOb/HDTtuQasdxDkNg4CrGg/Qty4AELhEABAjmhr01cvZxPpI8n6tr1LTvoD3vskQaSC6Kv74EQmtVDqznFYy0ip4ziLYeAIlJ17eWjReItPLbW7SyJkU/LQTNSrpSXZIs5pSYyXsmiKKvMB6t59qA+XJUFxD9R/d8WmVwkqBN8PMJMt1f+VJBWtwwjXoXWEudZihIy9mUN3fmEjKLeSsvwmbO9TVi1AgrMBAdg1X2TZ2bcJ/i9zUzU2+qmcy0viIQAHm6mVcenidg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3vCoOHxbCSjHUbC+8+fF0U3s0PhEtrD3RWGpqDkLTgw=;
 b=MibDSnx0ZQMHIbjQWkygFYvadS/XpOo3T/sxyUXvfup8d/qUo7kYQhpZAzlneRQDx9of+9LGF24RB6r/w9VPRv/gVujSbpCzUxsTdKJkR3TZ0s874kPB22Rat7Sb/AcI7an8r/OTcmUgZ1fRPqwF9EqSF760w/H/S3IAsFsziig854BclazpQ3f7IHxtOfc6qN0iW04pI8lOzHiK2pHHiHA628Zv5ZfvfzYjbG5nISUXmwPTkK3A1+HDAVrl95GZaWxdsFs6ilomjONOMrDSpot1Unij6BaSR+MYZHN83l+EbpAkbi2z3OrowZN9Sk4EkkecE6tZzDy9qtiVWracbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5358.namprd11.prod.outlook.com (2603:10b6:5:395::7) by
 SJ0PR11MB4992.namprd11.prod.outlook.com (2603:10b6:a03:2d4::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.36; Mon, 30 Jan
 2023 09:52:51 +0000
Received: from DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::6c5d:5b92:1599:ce9]) by DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::6c5d:5b92:1599:ce9%2]) with mapi id 15.20.6043.036; Mon, 30 Jan 2023
 09:52:51 +0000
From: Bin Meng <bin.meng@windriver.com>
To: Greg Kurz <groug@kaod.org>, Christian Schoenebeck <qemu_oss@crudebyte.com>,
 qemu-devel@nongnu.org
Cc: Guohuai Shi <guohuai.shi@windriver.com>,
 Xuzhou Cheng <xuzhou.cheng@windriver.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v4 15/16] tests/qtest: virtio-9p-test: Adapt the case for win32
Date: Mon, 30 Jan 2023 17:52:01 +0800
Message-Id: <20230130095202.2773186-16-bin.meng@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230130095202.2773186-1-bin.meng@windriver.com>
References: <20230130095202.2773186-1-bin.meng@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR02CA0061.namprd02.prod.outlook.com
 (2603:10b6:a03:54::38) To DM4PR11MB5358.namprd11.prod.outlook.com
 (2603:10b6:5:395::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5358:EE_|SJ0PR11MB4992:EE_
X-MS-Office365-Filtering-Correlation-Id: 355b998a-af23-4f06-51f1-08db02a7c060
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: T3/9jNoXe1SIL/vtbtOLtS7JYpkB5u2ns+G4XhxbyIwis9nkAjgcB8HFR73th5a79/BYTl4OpMRCy311pSnlyXETJ7v3db9Rk9D7WxiZWmOPXkzHDaRUhymu3nXaiW4u1SovwfJRTgb0Rrf5Qb/LbS5/cCkVuaA9eoWFz+ZBlYtjsyiB602owEWsyL1OFwan0W61Oq8UwQ6LXeaT66ey7QqB2Kp21F7xFRlCt8RYL8blUVTwCIZZUnSy/UctYnx4bVeezVTQMaPPclR8oaaSignz+WTUdm15/bfMNXhoGQ1k/ZkvKS+h6wxgFdF1wLgYht9jL/jRW4OMHS7fJdFliLlanFITCZDpuS4hZTP1+ex6iPfjFMe/Dr9udVa2JobADfqzqNFdUZHmsJhskjIAeOQ5X/up2CFiBd2TE+IXM4UwGLxtg+r3eA25CFu9LoIbzho8clS+ncXdMbevZZ9njA2mqKsSBo6yOphiSrsgn0R263xUxRT52CMOsIPVHk+aUkYLVurg/c3HbFM9zTeHUq7TvWmnwppamk6CEYTFOpIFbQC9jFz+GjKq8iC6G4hl1oy0XQcuYHppMDdnnZqveveJmP9sOrMbofvhV82GINCAT//lfQM8MwY8Xd0Iin0zaGaRPC6oyGC5vFsM/GmwfVjb8OkOcxOP0bQmeIiTwMqV+JHJPtSqom6PX+rx4Vl1Qaf51XT92Mox2k4Vfq+DXw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5358.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(396003)(376002)(39850400004)(366004)(346002)(136003)(451199018)(2906002)(4744005)(66556008)(41300700001)(8936002)(44832011)(6512007)(26005)(6506007)(6666004)(1076003)(2616005)(186003)(5660300002)(86362001)(38100700002)(38350700002)(66476007)(4326008)(66946007)(54906003)(316002)(478600001)(110136005)(8676002)(52116002)(36756003)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NVltrcNcRx8++QKs+6/KR3geQ9UqDkI937TRTKKB1BIuKTjtd4BH8kwobOZx?=
 =?us-ascii?Q?RHqvhlpx5Mw7GFxml7GdM7QNHdJu3obkNSiMfCOQojIv1X0M1xf0vAFzed9P?=
 =?us-ascii?Q?1EfYa0bLHLu/rCfWn3FbeUjx8Dzdng7HhB+S7z/h2kNfONyNrEu7W1Pzv2QW?=
 =?us-ascii?Q?vN68dcVfVy+ZJxDAph15BirqU//mNA92v5whIjAWgy2Xfd0QSmR5yyd8eKZ0?=
 =?us-ascii?Q?YwwYVXT+gWPvesualA87f3YRfPzeSvcaQl4yQQxG7iBwpi4M/chUklxfbx17?=
 =?us-ascii?Q?21Q9TFN+TVPUImJD67pKDViDgrlqzrKc0f9kRVIeDEBt70lWTp1skm8okRqz?=
 =?us-ascii?Q?tpQxNh6TW0YeQLImH8zuoJpNCH/qb83yo7SmuWN9weTwloGeepyxXnly1YNp?=
 =?us-ascii?Q?AojEmjO20R2EgyezjWQiEIp+nDPvf3Z8sBeh3DVyVljCLUQzkYWMvvDx81VM?=
 =?us-ascii?Q?Scwm9BGBVuKrPmhHp/dQ80cQuMV4piWBk6MIxfVbljzGcWwWDo8A0NTgMiUr?=
 =?us-ascii?Q?fhtT1uPaeAu9X2PcjX5BCrOG4y5UrPNSNA01F54+cSsHx4g3jwRe4pHGtH93?=
 =?us-ascii?Q?chu7UWY+NYKDayf2x+n7POIKxZDqbGZdJHzosvh8HysiALZ2I7dIJSvndgN9?=
 =?us-ascii?Q?LPVpoKBN/WF3PnE556jG22PTwVv71OXJhaoaPpMogf0zCo2wNvt7PVHxluGT?=
 =?us-ascii?Q?r+aUtELi6IqA4TWbtPjatbPidmyDi07EFJYP4Pat1iJOTh6D9C1Pv1pmXfC3?=
 =?us-ascii?Q?9JNVhzg9oAxKO/dzaI/UHbl9KvFhSJ30JyjUgENXIOFo9yyjKTPnOdtNnboT?=
 =?us-ascii?Q?MxXHD6eGKsv68ZSXKu1Jxr7kwjPMKMaW1ZPau5jrDuIikKGXBWUFbUtqg30g?=
 =?us-ascii?Q?dAfK3prD2kRL/MmIQb3iMlhQOSj/ZJtN2usiGhvQmxG89Q9bFFgOnBR0jp7w?=
 =?us-ascii?Q?zHl53uWS0eJwlVPqClVYXSvwH2ldPRdKJQ9ANYfKHWfRNqCHESgolJ+ZW6mL?=
 =?us-ascii?Q?sk9rYKGCJEsBln1+sQRkAd5zIHU5H+2aFbuXB7zJkn++uY8yn6wCS2nhJNh6?=
 =?us-ascii?Q?uAWDvmKREJ59iGjV+9rTS+awrjA7TYwDZJofAjQR9ZH7zBdwNyqBYPlHh0H4?=
 =?us-ascii?Q?995pybTyunBmoPIVlvm8k7TZFNxy0QcZMIzvH3o4by4ZFMuhD/JFcO9Thkrr?=
 =?us-ascii?Q?ez/CJbilXX9s+cQzoTtMhjVmR/XAOi/sxEDYnUcf/JtJTxZx4FA9qCYmoahz?=
 =?us-ascii?Q?vsDb2xnl3R6wTm5Q2HP2sBorQrgKfC+Fuy5+HIyB9/CoxTiOqk7eJRARatft?=
 =?us-ascii?Q?2sSf9olg13S1081XdMjA0BXnFBC/zQgVdcxGy749YKW/nCPuacUpyvdHBP5W?=
 =?us-ascii?Q?iT0llVG/LjtD4GsfAMdu7Ygqj8AUpJ9R/xh0U0K4hSIGLP6QynMz9vWD1Y7/?=
 =?us-ascii?Q?dvRMwySdkZPDxLAfSI6lTsh+dilbMtEUkuM6yITJ8xjOGZKEScjX0UdMFwH9?=
 =?us-ascii?Q?j1GbcVGmhNibkhw4/db96nrZvvgDhz5A7NKdBXd0kIGxuXbLpO8SWYrcKaE/?=
 =?us-ascii?Q?BTogYw+VK8MTUticHxVMghdUu1yhkjOtPSzMpgdTo2AdTPOVO4qEaA15dFLM?=
 =?us-ascii?Q?1g=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 355b998a-af23-4f06-51f1-08db02a7c060
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5358.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2023 09:52:51.6370 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hU4XKEl/N5riscI4X5Ln8QPJsLiI/N4t/1Tj/ShBcfw7VZ35QHtyfAZc5PrETZKyEc2zNNfDxP+E6N9LWxrncA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4992
X-Proofpoint-GUID: 8oyvZ28CR2nL6iupOWosAqBllq9Bbe7a
X-Proofpoint-ORIG-GUID: 8oyvZ28CR2nL6iupOWosAqBllq9Bbe7a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-30_09,2023-01-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 mlxscore=0 clxscore=1015 adultscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301300094
Received-SPF: pass client-ip=205.220.178.238;
 envelope-from=prvs=13943e2a21=bin.meng@windriver.com;
 helo=mx0b-0064b401.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Reviewed-by: Thomas Huth <thuth@redhat.com>
---

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


