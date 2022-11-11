Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AEF5625285
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 05:28:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otLZd-0000Y2-3t; Thu, 10 Nov 2022 23:23:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=83144312e2=bin.meng@windriver.com>)
 id 1otLZY-0000V4-1V
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 23:23:20 -0500
Received: from mx0b-0064b401.pphosted.com ([205.220.178.238])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=83144312e2=bin.meng@windriver.com>)
 id 1otLZV-0001ZL-9x
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 23:23:19 -0500
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AB4N0iJ024928; Fri, 11 Nov 2022 04:23:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=3J2NROZnClrvuX5c5BEezlgW8s+8HRmDzv9cpo+LHXE=;
 b=n7/GQu9ei74NAisd7t7hkWwupoGMSSUMdyit7zCfuja2gmCc7kmakGHW5w8jV00jFeFD
 Mb6g4vBn8r4Qlxfq5xOXOyNBbIwXkM8L3sV+iQ4/ctZc3kRAEliJb8yrLe4/RbcS8TVt
 glKtS+HnCGzC+HVSO7vZaL2nBWhg0klJWQt2EvCz8Fsdoz+OA4qWNEofkXbVB27ta7j4
 G1teiDwZhKkX9Nu3T+DL+7N3bwQIaQlXMou1rJoXUcFrzDq3XCOczzRkvNw8sjCpH1yp
 fo3dNa2g8wAoGHyPGCxDvtyCC9ve2p/auL9cDh78TwfyENNHB8TQ0/UhZW+YtkVGdOBQ pg== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2103.outbound.protection.outlook.com [104.47.70.103])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3knd21ndvc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Nov 2022 04:23:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DU4kFg9PaUYbLNRZYXMhUxPxjxHJt/TcpPSPHvj7l6Yiewm8VtVoUGOkbS9ghwzqWMs4lwCYRxThZ3OaYcujB31aUr+yb/S4CqX/P4gIGsEfSDTl2L160F+2MlhgjreEpr2eC38rHsBti8pWemQzDaEuzvHgVUFlV33berwxz+xcX4nDf25b7lpu99Wr18WhyKJFpb4/EYVNglzfob9+nAcEjQ2r965fQowETLqokS374uEnZAepesYqN4Nvd6WBtmqhD6WMXAdPX83OW460MSzHs3kDkaUxo+j3q4Lg634CI9mUjx9S7K/qXv/PEWJKaDJpW7lm0Nr9ily07XwThQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3J2NROZnClrvuX5c5BEezlgW8s+8HRmDzv9cpo+LHXE=;
 b=hW21Hm0d/aI+jdEFLE5VPxI4IwEeNSxq6K+aXdfpHq0mCvU5voF3SFTh1kMW5KiG9n6N6kE+jagzihRyqHa32DvICjW6nh1pbXeXS+JafJ86fKN8hcGz602/+iiYCOZT13r2c2TzeQ2kjP3P/N/nZhcOootqDCog+UD4bKodxguins/Jf+sIjbVW00rhRLOmp4lRsDDb60Zod+I6/sGUcSal59d494U1vkbT5sMpSLp/0HTU9Zcl288I9vYJfh/HgBHPkRcaxaI/XiIa+npe7JKLgsQj+FdyaGWh3Tf78TWUjC6iwdVidlgFtY/XVrZ26YCWhQjED83SQxMumEzeNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5358.namprd11.prod.outlook.com (2603:10b6:5:395::7) by
 SJ0PR11MB5102.namprd11.prod.outlook.com (2603:10b6:a03:2ac::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.27; Fri, 11 Nov
 2022 04:22:49 +0000
Received: from DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::8e5e:71da:1e29:bc15]) by DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::8e5e:71da:1e29:bc15%5]) with mapi id 15.20.5813.013; Fri, 11 Nov 2022
 04:22:49 +0000
From: Bin Meng <bin.meng@windriver.com>
To: qemu-devel@nongnu.org
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>,
 Keno Fischer <keno@juliacomputing.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 01/19] qemu/xattr.h: Exclude <sys/xattr.h> for Windows
Date: Fri, 11 Nov 2022 12:22:07 +0800
Message-Id: <20221111042225.1115931-2-bin.meng@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: 89c12892-0948-4a36-fd51-08dac39c6405
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: c4KZM8CdJVsskPYh/oVm84k8Eug5M9yPn7Tbgnxzedd1QbBFEEM2m51tx2Zmkkf8D2hrlcM58htp7ddPD4Cv6X4Da4U5SyTFKnxzlb8NvrZokF/qY5hrW5LdQ6ysPy137knGvvYLvwu8j3l92kg5sUixT0fm/CoBUssy+DpGgCyFR/nYEmvHh1RLdVLwIJH4eO3chjviJ//wGD/gGOueHFJ5JqXIa+dUl28Re4bInnzILO2h3D7b250Vecr0haSjJdgygv5lB5yq4vOUvTJOexLEL6ueyUwpOKHrEW/JAHyfSK6yn+tqYVDcOlNuxvggSSxvhZZAlehhN+dQRI2qb3CkjTuLlZ+yJNo0NkoraW5ArkiyeriIU355JLb3hSOFGq5mvEhh43NgxI4FWr1lpq51Oz9x/gNbDY1UfzdlrOq2y03xDMWDXjnaVITZ4C/e3u3KswJgFw7Fn6ZTJEbOwiGfMIxgzGSrXRnYG6BqPM0CBtJgDXuIM+MVw0zWOnMLbaR1crSf2W6NY2EyKYsgadRHzUycQnIcoGVviu4Akn25Shr8GT7UZRZ8P1fphvO3hNw5IRvRRmkgNIOVUNRM9qGRkCHlcge9kg96hb6+2bCcDO4tuh6ns8P56T5y1YrFybywlCNhIEdpZgJtZilElwOlsxJ4mViYGPn6Bqbw4jMWgGvQAS06/Vh8brTop0D3LBDh8ATmnDruVg+2SRff6iNFQO+cAuJXBVML4dOGQO1fIiqDddRUOlq+E3enXYbX+gACv5T2VO2ySLfY9SWOQw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5358.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(346002)(376002)(39850400004)(366004)(136003)(451199015)(66556008)(316002)(86362001)(8676002)(66476007)(66946007)(4326008)(38350700002)(38100700002)(36756003)(44832011)(83380400001)(52116002)(6512007)(2616005)(1076003)(26005)(6506007)(478600001)(6666004)(186003)(6486002)(4744005)(8936002)(41300700001)(6916009)(2906002)(54906003)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SHS+5MbVpgOQyDmajYNoAkzb2YhL4zZHUvhIl6NZbvhjR/pGpzzJgSgBKIqa?=
 =?us-ascii?Q?zN8e10fScnN97yJDP6UdA/cUUb6a9jIl/z2lglWfOlaKpSXyD3Gxr4uxJbY9?=
 =?us-ascii?Q?b5drlUVsHE8z02RILLhoBPnxGuDkrMCyNhvB0CBEKrNyE8VNCcRPvo/s1lbV?=
 =?us-ascii?Q?cab0Q0wvaMko2zKvJdllyvr0+JJIJ42XpfjmqenE147bzaUVMBo0twolSrJJ?=
 =?us-ascii?Q?LywWZr/fSOnfH/HWB+12TbD0waN6Gy/Hhn8gECtaHErgXvtUruSjmxntrItN?=
 =?us-ascii?Q?ytsxnkhjI5ntLi3t2jCc99jXOUYFTj8TKp8wLxwLzeV0DJE+KliFN2V829rg?=
 =?us-ascii?Q?ilTo+OOhhnQgkNdfkHvOFcBxrCmiWoVzVK7sAzHXMgSkKhOM5LhgBMmll8JB?=
 =?us-ascii?Q?0jyemF4QUXW6ggN/A4d9sL/K65n4ZOOteLusKuhiHNAzQFpBNMYwngCymRdr?=
 =?us-ascii?Q?00e1yCIABUhupDGEkRuPAhcBYneDr4Y3uxbx2FYk2Ev2sCYK4w45mOi9XswY?=
 =?us-ascii?Q?FpcWWKPjdUjBj7MBgAK2GI19NTVg8/NxQ8xD7nOzgr3u2tRc4nq5NuiA1nF8?=
 =?us-ascii?Q?JxnP4cvthaZFcz1w4ED2KsWipES9tuNJ9sDVBecnRrgmq5RAnr66XEM/pOz1?=
 =?us-ascii?Q?Qcv8s7lAZzfeNDuf2f3WjyWUDOREI+5BeujC+uuhlZhbjdw1q/kyuIayLict?=
 =?us-ascii?Q?VjnfvwmLfsFBo0NMYXVGoMEl9JMfZlM9A3IQuqvZ6khQnxWCtlE/2JrxShIl?=
 =?us-ascii?Q?SBWPDe4PBDfEfKe7NG2tDXDy3dF6dgf4neKtP8r/UYYQyGu2dSn5KVJeyLAV?=
 =?us-ascii?Q?uNtlnkVuhI3b4J0Bt3vhe/7KaVAALTXeTx83SNRBPL9RXeEo2fLHIpv/qfZq?=
 =?us-ascii?Q?sdpoTJcigjJ8D40FL1s6BokQW/v7IOMm0A48NW0qCZ1MznIV5nQ7L+yIfNGi?=
 =?us-ascii?Q?h58Cy6k+5YTtXVPVMSRJpZL3UXLaqwpJ8/4zYsGykXd06iyWLOWPxdyxMKm9?=
 =?us-ascii?Q?nXCr5NE2NJrNnWC2DQr4ChHC2KHPdbNZ0lH+LVOFRsLXTFH83BinVGFV8JJM?=
 =?us-ascii?Q?nWgGSPJV9NT7DDCaheBxqdRLVb1/IESi7ZWdsYdDDKDz3hqPWYBd2WkuTpL7?=
 =?us-ascii?Q?3k8hm3ElwZvfe/68yrFshFoQiM4zu1BNJY8HLl+62m3YkGIjnf2l8CElOYG1?=
 =?us-ascii?Q?J3+30UBEA3RFnrLX9qsYJ08NQ7A1oRXD6vejZhiXN3Fy9Q6aMQEN63/oglH3?=
 =?us-ascii?Q?CwCI04r+l2M6RfceZCNdwWoa+ILWAeFV9oe0zXrQYR2w6VlWfaqyXw7/NAvO?=
 =?us-ascii?Q?P4hdb9r0SudKYHG5+O7UeJaTF9ZeBloo+CwA/fd0LLBmOVhfZtTmy+EZL68X?=
 =?us-ascii?Q?3KUxIwLlB4mv8XkJ60qMkci99exD2uUVDoK0NwOxPji62/fvu/Bt2fW3GPKo?=
 =?us-ascii?Q?sDlln9zWJtYC2xE2ngcUYJMNV/l3KMDD+kOi2zLTZSdVRob4NhIwU3sAtbGq?=
 =?us-ascii?Q?vb81W5g3fetwLtUuQlfQTKy93utyWCEfn5QV4y8Akl8NQm8ULHxymTGdbUJ2?=
 =?us-ascii?Q?a+P0U/cDTtLcNrwdLnAov+LZbbi28q40H9ZkDWkNJ0y9/OsIrXt11fQKqoLe?=
 =?us-ascii?Q?5A=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89c12892-0948-4a36-fd51-08dac39c6405
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5358.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2022 04:22:48.9600 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dI7xpfSlQBoH+dBfjRNvVPYh/IRYCDL1qDgPVoz0oczjDl9ccm7/LyN0gg4JE+RQOI+koByU8gxW5SXTa8AiPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5102
X-Proofpoint-GUID: ggP3nISzijyCas2SHjfWXlGPD5vVUcJ1
X-Proofpoint-ORIG-GUID: ggP3nISzijyCas2SHjfWXlGPD5vVUcJ1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-11_01,2022-11-09_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1011
 suspectscore=0 lowpriorityscore=0 mlxscore=0 malwarescore=0 adultscore=0
 bulkscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 mlxlogscore=549 classifier=spam adjust=0 reason=mlx scancount=1
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

Windows does not have <sys/xattr.h>.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

(no changes since v1)

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


