Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2F72680A0D
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 10:55:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMQqL-000314-JL; Mon, 30 Jan 2023 04:52:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=13943e2a21=bin.meng@windriver.com>)
 id 1pMQqJ-0002zo-BS
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 04:52:51 -0500
Received: from mx0a-0064b401.pphosted.com ([205.220.166.238])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=13943e2a21=bin.meng@windriver.com>)
 id 1pMQqH-00021P-NJ
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 04:52:51 -0500
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30U99Kg7008133; Mon, 30 Jan 2023 01:52:44 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=4A1e6sHVcoUouSxEStJohMBnC1urIIH6KVBurlDY0lw=;
 b=ffM7GSXkQij7+jZkwhSw+DpgeEjxnP8QlApBMRkETptrCTag0F/SvrpBI+n8fsZYX/Bi
 Nm9WcF1vsdvFgoR+nmD4oqhedEMVnL/Ns7eUB0NEwQMPIT0K98XJAvo4Enueu9Hi0v1w
 cAk1Cq/9HrTSfHv5JKqLaZRkluYcnAEsbjbHwoa8yXH2rSBNWQKuS47sWtRa8MLVaK2W
 e+kYW0TOndB49r1Y5xoWZs97Dmtwmz1ayQI+woBhS9xiP3ZEO8tEp42XTAnvVvZEG4xX
 78F3LdmUEzKXZ3O3CaWUOaC4wLq0t7G7/3+AvaYc6sD3GV5EAU9FyDfSreTRKg5nQZjh QA== 
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2171.outbound.protection.outlook.com [104.47.56.171])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nd43rhj5t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Jan 2023 01:52:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h26c3vAFm3TLEcVKMw6PRT683hew7M7Dn5sYRvdT1w55BGfn58AVbXpOGhFwBbY7/NHB/lqhOJkRk2rvIR//Y5Q9byOf9UZixCvS57RYrFjyUciyu8NxzmQreT7BvRoIlX1Kw/3L9WrYgwuT5agF9Ljs/Q9Du/pK90nrbpuwEzLE6V1UoBsfVdziNnAcH0TzUNUNqFJlIAvtLsA0BgaABdEziZiu4KfjRW7mr/IrfkAHxPJsG36Sa67lfSDsDzc/c0CW4kcqCLCWf550HU8KvMUi4sA9J04jgxqli4ft0ibpe+bLwqrH7xF+bCrSEJc3pP+K11m8CgrrtMKMqz0rHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4A1e6sHVcoUouSxEStJohMBnC1urIIH6KVBurlDY0lw=;
 b=Y93lxhrTHMHxDJvpSspVPcV6+ftaJVrEjWm5y5YTMvkYoUS19V0KF4dII6UoiHAPEUqGuL0qSX0iZTelc4sPy90jczbkygJrJk+atJd0mUX77N86dLVc/vddRVOSx0Ugf4OqBSDLBYl7B9ruXClK3ShVVMKf1ujf9LMJ68prBe7Yul8DAk+ApPpYvemMCkZo9t1bbZRnxBQKXdILtOMJe0yAfKCuNfezRrx1t+xnYqEzvVXcvuXS7/zCh5I5+uLIJuRBJnGCorQBNuhNCBfoauzUSUWXTOT8Q/fwamfcHEAUV1joBy+JTXw7uY24DYRAA8BL2oAH/xDMzStvrby5eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5358.namprd11.prod.outlook.com (2603:10b6:5:395::7) by
 SJ0PR11MB4992.namprd11.prod.outlook.com (2603:10b6:a03:2d4::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.36; Mon, 30 Jan
 2023 09:52:40 +0000
Received: from DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::6c5d:5b92:1599:ce9]) by DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::6c5d:5b92:1599:ce9%2]) with mapi id 15.20.6043.036; Mon, 30 Jan 2023
 09:52:40 +0000
From: Bin Meng <bin.meng@windriver.com>
To: Greg Kurz <groug@kaod.org>, Christian Schoenebeck <qemu_oss@crudebyte.com>,
 qemu-devel@nongnu.org
Cc: Guohuai Shi <guohuai.shi@windriver.com>
Subject: [PATCH v4 10/16] hw/9pfs: Update v9fs_set_fd_limit() for Windows
Date: Mon, 30 Jan 2023 17:51:56 +0800
Message-Id: <20230130095202.2773186-11-bin.meng@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: 18824923-328f-4ddf-b850-08db02a7b993
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pcDQReDa8ocJvtKi4O0/kPALl15AxfFPQve7wAghu4NDp5QHpgLQBA734efl76nLYXr7Bts0E1VVqyOIkmj4EneeqFE7R1XKMYQ3ltTfi8iJPgnGuZsKMYSmqFneKbTj0MRU6m+LHRlOgiLmhUppQt0jP/g3R5w3VUS57+gk5U8AOMsAliCbCU6Cs1PYSRDJjpI8ny6cw1O8zlOruS2Yddty3V4gxb7GYFsVecrkTYEqTAjNJu9Sz+7fYVMenaMoIe1ZWRpVPq1cT3A7Ae/8whYiTVIGNLDqr1mE1LY5iCGgG5xFxK6X1YBRPQ0vFl4TJZsQZ3wXPPZ4LygdDQwkesmb4qul3GTKREBQYWsnx2OX3lhjUbJdLq4UQt36IVb6DfotBy6pO1dAn95Tod62o2D9ovvAxH/BcA38iCr0BGYCtn9ewCFh4Pv5swoGoOjByZbcWbLKvZnbSEj6OV+oLrJnPZ6R7VpROEg/3F0FPXdclPmUu5vNapkpZpXbsteBLUalUWlBDC48HKICkaJMiNBlQDadjc89SZHnTecXB7bKdPCZ0ZPhuy1dl2G+YgFV9GSOt1CGhGj3KZS94tP5n5nNCOPuFkO5fUWA5kC/OgdjQYHfiQH6Q47s70Y18k328Pc6Wyx9hISm4bHduIcdou69hDohx1JrsYqAcGxhSNSyG75wqmcfThjaKwCbWZkTIcmpBqxAJbcgZbje4PIN7A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5358.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(396003)(376002)(39850400004)(366004)(346002)(136003)(451199018)(2906002)(83380400001)(66556008)(41300700001)(8936002)(44832011)(6512007)(26005)(107886003)(6506007)(6666004)(1076003)(2616005)(186003)(5660300002)(86362001)(38100700002)(38350700002)(66476007)(4326008)(66946007)(316002)(478600001)(110136005)(8676002)(52116002)(36756003)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CjXESg/o2/N7SPEvzkmgrDBYIQM05+G6mEyXucHf972PpDwmpkUxtqfraJrn?=
 =?us-ascii?Q?/93avBhEtUgZZpRIpUmMTqrucmxrUZuOQFvpPKzJ4PGVCnmNMy9rUIxRBRkp?=
 =?us-ascii?Q?jAhoe800R1CQuff8jWIsWkl3YY7S5StCEKYg74YPncLTenTgpgz0GX8OpqzJ?=
 =?us-ascii?Q?c33pNoIc0Qts/G0OqUnKq9UWqtQ/IWi94YVUV7hlXYp4T2pX5aTRr0xPSl8H?=
 =?us-ascii?Q?tZaGABOaUdphJ1gkTZDlvl1XWHlFthJMKJoaxV8aPyu0TpTPOrvwahVHaZW6?=
 =?us-ascii?Q?nqpFQFrWrtzcbqelzoxhirEA3d8z6zT/WdkmS/Drk6HpQBob+3yIIv+SRyXa?=
 =?us-ascii?Q?+dZK/WPEOyRzILad5ixLdh3IkRS29U8GBJAx8vs4jTBqw29yW8OcZLGEqSpF?=
 =?us-ascii?Q?xIeG9GdamgE8J8r1BiCYnaQOWd/FO4ixDbTRLOMpzgP553cNpGEmS/1JadGL?=
 =?us-ascii?Q?zgr7LG25xcxRW7c++iRV3ixML25DQBsggQBsfm4AYZIGXVTE2kyKLVmvtZYP?=
 =?us-ascii?Q?TgTuk9WI48kBpJFfu0vemjYBIx4quAEV+lrFRKIY/lYKf3qpDt1Z3OnXEXZZ?=
 =?us-ascii?Q?aQzuerS2O7x8q27jeO5mT/78xPEglG+Etbmyp/3NGfng3nXCpFdP0t3cMUs1?=
 =?us-ascii?Q?2GLWKgVOAcG+uIYfSCoG99rYZJ1omQO88WQfB0LAbPO85iFg71GGhZY1LZ4k?=
 =?us-ascii?Q?zmttc6pbtxj8ZvHJlfnzqPgoY5qPlObPUc1uUtSMtrw+5iDZWmR1OLMoG+GC?=
 =?us-ascii?Q?MZOvkLzuedNBUnd7lg+841oAbS4UhCihtx58N39eCtcHT4SkDADmDP3aF54g?=
 =?us-ascii?Q?Vi5zua3WhN0/p7wF1aI3axUEShjT5qS/mzkav31n0hiQpQ2IjDszQ0ZTlket?=
 =?us-ascii?Q?Rf++C94yC0c/UuQ/iIBVYiB9C9PvK+MeTHOJkT6IABKFFqpomQoYf0BYW7+1?=
 =?us-ascii?Q?VknTkftc4CYRKwCG6bO9MftY0IC3673RHKZuUre9yXvVuHOAXfF+dUMqxCKM?=
 =?us-ascii?Q?WjqyC93Hl4KowCViU4Crxir0PAa0mcGRnQhuORsqbVIH9woARaYVUgFUDPGA?=
 =?us-ascii?Q?56g7oSVWe2bPx3B5IhAsKvbBqbDYr2R/3g9kGeKoBqobLopa1mF1r0iX/5xg?=
 =?us-ascii?Q?agpzCGMbAbGMOf6hDRuRaeVAkhK5F53U3n8AJxZKIMeLK1sL+/Q+SwL+xkYo?=
 =?us-ascii?Q?SjdbLRLLkDuSGIStzQv4wrR15/ZlCpbrhp1jCSDk3CE8BP7fZMx02+2IiSNM?=
 =?us-ascii?Q?/6rnIPjih/cX1U6lMzlVMfchxe9oqH58bQgcQflKANouBKY1vBEWkfXhU3Yk?=
 =?us-ascii?Q?p5uLbx8kz5gsB7I5f/m5PSlYReQTnNSWe7Ze1ZbsVkmnfxmaR6FyYq3F+kuU?=
 =?us-ascii?Q?tWyLdGREpNHJ7ZWPaYQDzhqiH0KMYa17/pVT1wD/GV5OIEvOI2209jEMqVvD?=
 =?us-ascii?Q?VpNQhz3xdjXf53Ll8kDxxtZG0+u8eT+mnQSCWAWL1um4c0rpe7iWV3pqZuVg?=
 =?us-ascii?Q?oRa/aV+SlB9HxmHxmoGD4j3Ei/5UJdLB9haHMxKYj9XeFFkT6bzISPW2c711?=
 =?us-ascii?Q?2os2E9nwuk95KQG/Do04TBMmdHeQqOpdgvpky2xy9b/r54P+b/orHHOUiYnL?=
 =?us-ascii?Q?oA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18824923-328f-4ddf-b850-08db02a7b993
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5358.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2023 09:52:40.2284 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j0COJKFxAY3MkCFAOcmjle0ACpNeDN2msj5xhoeZwUsdpnxuZzHAn3ZX/6zxk4FMl+091QgqVCl1Gs7heG2U8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4992
X-Proofpoint-ORIG-GUID: Kw1z-u4MwuW9zm6tn4mY74p5V3ChgZzZ
X-Proofpoint-GUID: Kw1z-u4MwuW9zm6tn4mY74p5V3ChgZzZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-30_09,2023-01-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0
 suspectscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 mlxlogscore=995
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301300094
Received-SPF: pass client-ip=205.220.166.238;
 envelope-from=prvs=13943e2a21=bin.meng@windriver.com;
 helo=mx0a-0064b401.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

Use _getmaxstdio() to set the fd limit on Windows.

Signed-off-by: Guohuai Shi <guohuai.shi@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 hw/9pfs/9p.c | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
index 2497a06f43..b55d0bc400 100644
--- a/hw/9pfs/9p.c
+++ b/hw/9pfs/9p.c
@@ -4396,11 +4396,28 @@ void v9fs_reset(V9fsState *s)
 
 static void __attribute__((__constructor__)) v9fs_set_fd_limit(void)
 {
+    int rlim_cur;
+    int ret;
+
+#ifndef CONFIG_WIN32
     struct rlimit rlim;
-    if (getrlimit(RLIMIT_NOFILE, &rlim) < 0) {
+    ret = getrlimit(RLIMIT_NOFILE, &rlim);
+    rlim_cur = rlim.rlim_cur;
+#else
+    /*
+     * On Windows host, _getmaxstdio() actually returns the number of max
+     * open files at the stdio level. It *may* be smaller than the number
+     * of open files by open() or CreateFile().
+     */
+    ret = _getmaxstdio();
+    rlim_cur = ret;
+#endif
+
+    if (ret < 0) {
         error_report("Failed to get the resource limit");
         exit(1);
     }
-    open_fd_hw = rlim.rlim_cur - MIN(400, rlim.rlim_cur / 3);
-    open_fd_rc = rlim.rlim_cur / 2;
+
+    open_fd_hw = rlim_cur - MIN(400, rlim_cur / 3);
+    open_fd_rc = rlim_cur / 2;
 }
-- 
2.25.1


