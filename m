Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AB3C609A77
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 08:25:16 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ompY5-0003uB-Cz; Mon, 24 Oct 2022 00:58:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=72963f20b2=bin.meng@windriver.com>)
 id 1ompXo-0003qC-Dm
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 00:58:36 -0400
Received: from mx0a-0064b401.pphosted.com ([205.220.166.238])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=72963f20b2=bin.meng@windriver.com>)
 id 1ompXi-00066V-QW
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 00:58:36 -0400
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 29O4wKB6020372; Sun, 23 Oct 2022 21:58:20 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=MNo6gmgNvmlaFJz8/xTNhlf9gRt8GQNbkh7TRymwHGg=;
 b=Ku9ao9ROowVDZOCL/aDMt8BAOuDXzvwLntTcvE+VaEWe/V+mFSE62jTUmy+I3mEsOoGP
 3K5ybVNyxICtpz4kp1LkJSW2LxxdOPYFxDJdkAMfIKx0QcL41gnP4yWrDNiunPjjdWOy
 ByCoizT4sXV/HTwO7p+WcTfL9xHhoVUEI8k8ITpo1Q9R9CQ8khKIOzaWQxoIG+tTNw3Q
 9ANn8zGAkv+/QMOprbIKU0DCnVzaLqlMMO5tslRoK8GW8CbnrE9wFyn0JGTSCX5UMtKN
 1dXqxmfD2+sqY56Ydd+fIIL8Ey0KtkV8zXmrrPXjsjcaXWNy5pO/KMZDv9SHPrUwQI5s 0g== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2102.outbound.protection.outlook.com [104.47.70.102])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kcbt51s14-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 23 Oct 2022 21:58:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KfAMC5jTfjK69gcaePRmhShmpCVMza6sy439Eb/2sPoIPt4SPOBAkGjtNgC8GCI6UKlHTHk5EE0BvcER6QQq5ZkuIr9iZT8Dg1P20b7Wse7YvZ5ZMDHZ3uprfTxGyKjrBpz7UM/n1u1sHkcWsNlpdz9ZbLfV/4bRUhRLctFIE41bLI6sF42HGWQ2RjhCxsKigfbgFqXsBe1CcqDNHLrmxCl0LMBDH8ZewuA5mCiEOuwwxMo5dODKpkDkMgsPghSfDK1jx+/lUzPhme0VakH6My0byen3JrVA2QhhkwFqxBIMKptiGigSGivP/uSi37rWEB5TLfwGsIFeytkyBnWCDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MNo6gmgNvmlaFJz8/xTNhlf9gRt8GQNbkh7TRymwHGg=;
 b=fkTPWWBHskd7mJmcmprVSCjcKiFTvzjgWor/D8mkY5PqEf52Jr9Hws3jebxRZ1CvgfRfSrV0VSgpXLke4vTTd5yMvjlQlPwLc27t4Y5xcZjM5mYYUGKjq6qah4ZX2FHUcPX9f8MDMXxYMSsoXwbjCurwqM4229CIe1ziTXUl3Z4H8zflmuBvtFa4ok0vxm/KJY+tXfpHpD1y0wsVEtNysA4DWOFyKQM4Q9nByfnXg0AFHVsjjIFN+PSPr3RyfkIWwM2VFntIhGJXgMJo0sBGub/jYbZM5Ml9OCndv8d3cyX//zTN9DUtGTr9xqVkPrZ3YPNP3DQdvmZ1P2GGFGPNog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5358.namprd11.prod.outlook.com (2603:10b6:5:395::7) by
 MW4PR11MB6911.namprd11.prod.outlook.com (2603:10b6:303:22d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.26; Mon, 24 Oct
 2022 04:58:18 +0000
Received: from DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::b051:27b7:c1c1:7cb9]) by DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::b051:27b7:c1c1:7cb9%4]) with mapi id 15.20.5746.025; Mon, 24 Oct 2022
 04:58:18 +0000
From: Bin Meng <bin.meng@windriver.com>
To: qemu-devel@nongnu.org
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Keno Fischer <keno@juliacomputing.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Will Cohen <wwcohen@gmail.com>
Subject: [PATCH 01/16] qemu/xattr.h: Exclude <sys/xattr.h> for Windows
Date: Mon, 24 Oct 2022 12:57:44 +0800
Message-Id: <20221024045759.448014-2-bin.meng@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221024045759.448014-1-bin.meng@windriver.com>
References: <20221024045759.448014-1-bin.meng@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR03CA0021.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::26) To DM4PR11MB5358.namprd11.prod.outlook.com
 (2603:10b6:5:395::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5358:EE_|MW4PR11MB6911:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f42da0a-5291-4dee-e079-08dab57c5da8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DyNOX+PVOwJSI9sJN00X2WgRqelElXRYw8ElKIH/Fl28aWQTQJKHwM9NJw6kx+rB1Ga7mToUNkMMZPA49aOPacT3dzCe9/X7m7eRhRxbsuG7xmBLFHrLMqxvw25y9vbxUMasu8+ojF2Iw1vmgz4LfWNrpClIAZdMYsCU8oxgvj2WhHjZ00Me6cqQVLID/GgslNzG7mv6hR1wwGA2BjVp0Opv+f8XNJERafVfLrcPDJ8qdvmnGI7j+fYZjhX4y+kTPaFvCCbNro1tIgaSfXmWxk3vTqNBUtBSiLEQUJy0vGxotbyQIa5CpwUTLmgpksHF69FOVaIhQUpmEVaHdtqkL+sOifGAnGNhWbwFN69WFK63eeKQkXsswQk1pSoQh3Ub1ra2Qu6csFKPig4zMMmsc6g3k4fwz6RMnPC/nXckj2NSBF1avm9FbC2xVcb0Ws2/9lNl1mVN4LON773pxhqaLIqdIqcrZKJE0DWrKXDIZ8b+cSpdJK52P2sl0g3fm13UOfIR1YPwGVskRYF7fP0uDaB+FMQ6bnR0B+l3clKpCpqZU31AWmjtGR9He4vJo0QpIbJIQa93aYsaqrOE+IX0zKt6gKMDfGd32+XXmd2agbzuWVVJCmeCEaq/lZGh26yEOPXnPCo6tLA9/tflJQcljez/rk5majsZPPwgXPNROEx1aLtVviUzZFVCg7qDd5ExYGbb26jTWLnylV2WGY5uPIJGSsctZSk1UMxM/ECyIfgXq4GbIPqE/9qI+cIRsAfI/2qo8PgyX7eROzXfjN50wQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5358.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(396003)(39850400004)(346002)(136003)(366004)(451199015)(6666004)(6506007)(2616005)(52116002)(6512007)(26005)(1076003)(186003)(83380400001)(44832011)(2906002)(4744005)(6916009)(54906003)(316002)(478600001)(6486002)(5660300002)(8936002)(41300700001)(66946007)(66556008)(4326008)(8676002)(66476007)(86362001)(36756003)(38100700002)(38350700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VPHOnYCAR2xeaSRXMM4L/MXqAJfZrzP7Fj1+8FqkmBFv/nmB7QBLrMmRvaAC?=
 =?us-ascii?Q?/8RmnF6Iajhf5uDwdy1D8ZvwtWNW3Te9osIEWskT8bVntxvHUH0bzpnBPMhW?=
 =?us-ascii?Q?NsCCHfpwldXFEZvJLcDjqk31SracT/WAOQy3iCVdvv7ebnPjkGfJbcjrFx/M?=
 =?us-ascii?Q?P/5K356jkypUueuv71IRorZ2LKK61Z7PM0NFxaNuQUD23XaCIil6AbGkwMYy?=
 =?us-ascii?Q?9VTtVtl7ThJsHHvKu/sTQzLATNkCeRz86s1tQkX6rVxwAIBSVmnWxaRBO0/7?=
 =?us-ascii?Q?fyfMjvyXJrmilU5b5K5nMcbvwN2c2d50Z8IkNvq9QKPtg5x1gI6+jRuQp4xH?=
 =?us-ascii?Q?cPjityJ6J4gJDl5pdZFrZPC59fXSv4QT4daBv9IUgTEVwS3qzx6UfO5bysgX?=
 =?us-ascii?Q?nbdkJngBmYzIHOSNDdghD4lEaXjT3CsofmYgs/EMMAB6GmQmVOIOIJalDHZ1?=
 =?us-ascii?Q?b6wRAcTBTojYS/QYYJHkvHHpYbxeXqjjOxF0W0U+tJJ85UTkj9hvebNupnzm?=
 =?us-ascii?Q?a6hpBSqZnbufN2x5Bx4FTOdLMrtKvoQm24AfnYEW7aPELJ7ahD6htXW64NXK?=
 =?us-ascii?Q?OeTiQTz37XILR6/AAUZvlnZWiaBHIv+9nt3iyBTKb/dUYUSeRlVbb2TkeDLF?=
 =?us-ascii?Q?K5Jk6TjYos0eaB/jOEvFSxcpfxZKYrJHg/pzrnXNh55uGpg/8hdN4rM47lFN?=
 =?us-ascii?Q?Q2ey0xpYSmKpAL/Ti1oEYMTmTytWSqkQiqG1xAdEAedKbDoACkdFCvS8eZ00?=
 =?us-ascii?Q?/x/Fx6Im9hpCFlMPwa0Gjn+zSn2qy88HH9zwqXgOrhxf84TQGNWPro036efo?=
 =?us-ascii?Q?6UDOzzWH411Je8QcItvd8Bo5Mi71Sz3pqWz5D9Kzocm0Mcca/3nzD+It24p/?=
 =?us-ascii?Q?k4qfZzX/hs+85ipLCAfGBDJYEhVAR/cIGugg/FQS2zEU+YLUHNdfGUr1TFf0?=
 =?us-ascii?Q?44KS5F2RKmk+ixkLNXCIIH8LpjRMEX5PAoFfcy0EbxDni04EylejjkZFSuNs?=
 =?us-ascii?Q?izUoRD3i4rT/D4+aVIliVhyt+mdYzZQE5GIKfri4hO4onLOdyLwf1vDeEtCs?=
 =?us-ascii?Q?ZTfib4t7Mb6ROPH2IuBu5G9QprEQv4dW98kpiqfmwIqXpVDgh/ZyyGoBQuo0?=
 =?us-ascii?Q?+aVx7tbP4cIH012PnwAw2VgZWAsaG+EO4WbPm9eJC6aC/W4hQx0Ukr8rCWra?=
 =?us-ascii?Q?I+/MBGUNyeUv8LVFfRD5w7THAEGMBrIvjEQnrmCuwBeIkdCMfEzScB6t3XLJ?=
 =?us-ascii?Q?VKI6EKpBV1r3gPxsgIl9w6t3sMcxvzFDJMstudqLlwI3+TXM/GF/TQ0dQmOU?=
 =?us-ascii?Q?57AeAAxMB1vhKfEdJZy9z1ec44ezxS5Uz+ougcasdpIHw1iD94z83KueGMhg?=
 =?us-ascii?Q?INXecl8reARjT/nKB6uxeOIW/zov4af0hW9MCc3sLUOphnOvgt+Ef3gxPpsp?=
 =?us-ascii?Q?Pi6BM+1jDVSnUIt0OQrr4Djiu1d5Qznir6IuGj4T5GfWpE1ZyXoWBO1cE10j?=
 =?us-ascii?Q?ITL4h5VAEdHuFDB/Zg2CK6pqIdJMDfZfEiPmM+piNvGzwYiSpE7je0h1NrhD?=
 =?us-ascii?Q?KuanK7gWN3hG25KYHMqQ/lspcotK2yQqbfVHyH9ofE8ow5o1ZQ5w2Zvtzguw?=
 =?us-ascii?Q?/A=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f42da0a-5291-4dee-e079-08dab57c5da8
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5358.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2022 04:58:18.0610 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kqyA3vHLRjB2xFK84XZMUPy9PWXKuYsBDrt1yw214D8AubLOjZrbEwvi4wB9X3xWE7PEjnJUl8MhvQpVeKbSng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6911
X-Proofpoint-ORIG-GUID: iwfSrogsvPxD6tXUM83Qx2MOJJsMFwDH
X-Proofpoint-GUID: iwfSrogsvPxD6tXUM83Qx2MOJJsMFwDH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-23_02,2022-10-21_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 phishscore=0 bulkscore=0
 mlxscore=0 spamscore=0 mlxlogscore=547 priorityscore=1501 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210240031
Received-SPF: pass client-ip=205.220.166.238;
 envelope-from=prvs=72963f20b2=bin.meng@windriver.com;
 helo=mx0a-0064b401.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Windows does not have <sys/xattr.h>.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 include/qemu/xattr.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/qemu/xattr.h b/include/qemu/xattr.h
index f1d0f7be74..b08a934acc 100644
--- a/include/qemu/xattr.h
+++ b/include/qemu/xattr.h
@@ -25,7 +25,9 @@
 #  if !defined(ENOATTR)
 #    define ENOATTR ENODATA
 #  endif
-#  include <sys/xattr.h>
+#  ifndef CONFIG_WIN32
+#    include <sys/xattr.h>
+#  endif
 #endif
 
 #endif
-- 
2.25.1


