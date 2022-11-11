Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50491625286
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 05:28:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otLZh-0000aI-Ly; Thu, 10 Nov 2022 23:23:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=83144312e2=bin.meng@windriver.com>)
 id 1otLZf-0000Zh-QH
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 23:23:27 -0500
Received: from mx0a-0064b401.pphosted.com ([205.220.166.238])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=83144312e2=bin.meng@windriver.com>)
 id 1otLZe-0001bx-85
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 23:23:27 -0500
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AB43I17028685; Thu, 10 Nov 2022 20:23:14 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=NAClB/vYcrJi/d56y20Tl8wxwlevWX+TEdbP015zj3M=;
 b=KH0GRbRTKbZu04i6b0Jjpp1Imrr97UwehAGumU9lBhuf6sA77reSDf1ho3zGSsLLPy39
 ge3zDs1YPqIYnDtQyb1zgUa/TXFZo643YGjcukstAA8/bw4HvCnEh8CJP2Uuwhj3gKY7
 NrTdvT/AE1vvIyZqIsdcAVSL8c6l/dTFl4tHjVgLME2yhw1XvNeiyylw4lRctB/1rNeK
 ZxE5LpyYFCFplqFuPxFyWL4uCAIu/fqz8O1LzDbOvExrSoPBNmhBzMaVJS5IhMmPaG4L
 CcScXshIIzYP3aqaYsGW/+Gp5nFZuzv3GYpym+qa82y7nSsWaqV7HugWqcpkloGN/fPE bg== 
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3knk43d9ma-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Nov 2022 20:23:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oLEiS2WIZlVPQl/ZZVSnJBJeouiCWeQslkdJZVLjndBRUbttzbq2jqp16Pehq7Vv40tegc9zHNv6k3mgY37Mxcsolgq1TVKHjcMhnImA2aLUKSxMyp3Y5wuj5Odc3EfEK1JBInwbwsChHA/VohYcwCQZrBxzB8ev4N09tCKkkJkj2HF/N9ZBge5JicWVpJU7Qp0WwEgYQpWNqqOV4GThRm1kzgPWnOqpUiCZUaiGapUrschs08j/Qyrpq+evJOqeik8b+tRM3DMZtBdWEHhEThHuiH90I4qeVm7xPYUX8xAR6A7wjcELA5QKQJKcb9lNhwBuT9Y/IuKoFQ6knfjdsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NAClB/vYcrJi/d56y20Tl8wxwlevWX+TEdbP015zj3M=;
 b=Tasbzz/fMZb0jfbftk9nwB/E6HMM7BA73hm490Bv4jbLLljJCPptanBTfkymj+f08/VRRJDUhRfdKaPLrvlw/tjSQlZ66hWppeRtUWRhdjQgSJe80yHG7RUwI8t57BDUWwOucqp6mP24Bv8Q0N4UTpCiPNetQPq+p6NOIo3NojO06bBtpMyu5hKFjdBgKKoESmekhwBw69Cp0SLPzUWY3ZzoizDIy6OOsoxuoqg5zaMv6j0FgG1LPi+O/sKNoWmcEGqU/WdbK/MFaItkWTOZxVvvR0gsOeLu9ByBA50Ux56mtq27c+APPCar+IJRH4sVa9YxYYyUTK/qlnwAmYr1tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5358.namprd11.prod.outlook.com (2603:10b6:5:395::7) by
 SJ0PR11MB5102.namprd11.prod.outlook.com (2603:10b6:a03:2ac::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.27; Fri, 11 Nov
 2022 04:23:13 +0000
Received: from DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::8e5e:71da:1e29:bc15]) by DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::8e5e:71da:1e29:bc15%5]) with mapi id 15.20.5813.013; Fri, 11 Nov 2022
 04:23:13 +0000
From: Bin Meng <bin.meng@windriver.com>
To: qemu-devel@nongnu.org
Cc: Guohuai Shi <guohuai.shi@windriver.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>
Subject: [PATCH v2 13/19] hw/9pfs: Update v9fs_set_fd_limit() for Windows
Date: Fri, 11 Nov 2022 12:22:19 +0800
Message-Id: <20221111042225.1115931-14-bin.meng@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: 2dd90164-6956-481e-3a1b-08dac39c7283
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 95m43/3/O1Yg4f3V+LLlFRoyxeSB7B9AeU6SJb1qAw4b4ag/cO3DyVVX1bxBOdlI7s3dhDpQnCrlNaE343m5t6/hcm6/zK9TYu5XWN6lR8QlY1axT3/H/VN/fYTPLQ6TNmhpPH5+iKHxNJy6eM8tQZJB85u4k53W8I3l4gmdGUuVxCfOfav1FjxVxAbz+FwOEWDFEkAO7VVCSHSSFuWunxa56d9JAQ6f5LXR7AFPBDUAok9zSfuhK1maZR8y929m1QImcn3w2wOxwNzZ1XmxpsAUPVDPgbebVD1N8A/YmHjELBxORaYVIEYhIqOZBoD8U0PXqokfY3vI4KQtIXI31WDjh+/xorclzZMqxV2/SNO1N0IcMikDHXnsqcDGlNo21/i6liMy8o5mWtCF4gde3VAp/RR8FLxFbd882vhAH6oESdXTIP0WiGujSmd/yXc/iCC3ayQ5GxrptdJDcyTXZtF2zIMJeZio7NUFID2qdmbS8R46RA9ys9zSmucK0SwUHF7eeFcJfK35treJLMcgpI74KKp4Es0nveHRfpuCl36odFh6pVBmss1+98+s7hTk7nnjUsSyWO1onVDX0CGX1b6HaDaytIkEOIqoZISsTbVIEC6xekdD4aurFFhqnr90Mttnx+0tvS4uwJTVnViB0lazvG4xxY0pAxbgQxrEqIqlSaQXhDpkWYcZTOEulfCKgnuNhklEgMczAXrp+m1eXNCruIGZsejF14hGF8JB0RMyXg3aDJJGI/KRJZ34C47dCY+CvrmMnj+Ja2cEZZqyDg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5358.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(346002)(376002)(39850400004)(366004)(136003)(451199015)(66556008)(316002)(86362001)(8676002)(66476007)(66946007)(4326008)(38350700002)(38100700002)(36756003)(44832011)(83380400001)(52116002)(6512007)(2616005)(1076003)(26005)(6506007)(478600001)(186003)(6486002)(8936002)(41300700001)(15650500001)(6916009)(2906002)(54906003)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bxvHiOak1vtDr3RsLrBaTVO1iZcgEv3vkG/gzkW+OL7pZKKlUISnqfi6rjJZ?=
 =?us-ascii?Q?n4JbZqvWs5UaXFq9vNyRDO339DHATNNO07rnZQU3KfSIxp2GRde5+i+GfRsa?=
 =?us-ascii?Q?EWeDDqLXwkugvJC5IsB+g9YfXIwKONcClNy3/T0eCrD64HkRZqJ0l1yhqw8/?=
 =?us-ascii?Q?MrNLu275RE6uU6UnX9h+/quG5UxyRD2Sv6YZDd0KCDWwZReMtx1LiQhtHn4d?=
 =?us-ascii?Q?Hx6M1+Kb2KZLxB4Bjh9hANY3XEpUsrj/4p9do11byINvplQ/8okUnY43yJRk?=
 =?us-ascii?Q?x8pKbN5esjq4mOBjr77IF08EgpBTkRjwLN0/TYVejxH7pKqGgVm7a94fc9Hg?=
 =?us-ascii?Q?nYx0T4ZwIIay9cTW7BHeCZOj5O9pKIx7srDL768FG+ZbnvJjuqfBM4THNzeT?=
 =?us-ascii?Q?ychNZkEa4CaLYVED7AMiQv9eXWpLPwbtQrqD4Gkr5sekhqYLxjDd0qR8Ds3E?=
 =?us-ascii?Q?Mq6bV97arEJ9EjOD0C3kpZJdAL8zddzTial9Oi0Po96O5aNiTp8JQuj0W13a?=
 =?us-ascii?Q?sPhKd3edR4fyYBfX1NWccGOmEd93eIjuO5c9JdatFN56uOyTZ0pybDuxT0rH?=
 =?us-ascii?Q?i4qJ60CuYiwmm7XHNV0hNeuhYicJpB1HZxfYcuN+pCRZDTk1hFrAdxuabGMt?=
 =?us-ascii?Q?qbof56IKRP6F7onCljNohoCzgDLMBcIWUep0hla9ZxiiUaETuttKk1WIh1Gp?=
 =?us-ascii?Q?dJMwiXHZBgzDGtcY0qsW9J/kx3r5+/fpV20sFs3o9GGYBWH4LS+2gW14IrPv?=
 =?us-ascii?Q?GjKXandsBxaxjLVJiof2rR1p3AHbv4HrpYbkOdXozScW+d5tx9tMQuUymvtT?=
 =?us-ascii?Q?i0go8dzWP4N6wNgUNZ+yWSZmn4T1M5W7eZ6rpw+7TKKYk0cH9reAPXk9QWbV?=
 =?us-ascii?Q?sAELBjSyYaJl4DOEavTf0KbMDQP51LRMTt/rezJUhh4+cbFUT31FY/DBdwX8?=
 =?us-ascii?Q?sWuTeHzwnIQyAmZy5dWA585jMS1VXszdc6J414hqFNCjmy0lI3OmnJ2FCWYB?=
 =?us-ascii?Q?WvjajlVxyAVRBAlGSOVa5xIXdLOywW2Ajr+BnsoquyDKsDOZO1W5Qs8uG8kO?=
 =?us-ascii?Q?ZQdGJq5V57dIO+RHAFv1lwJGZJlpFgXDxeEsCliyB4qBtP0I3G34BfinBgq+?=
 =?us-ascii?Q?oASYmnT1bUn3rVoPACwSdRNLuywDtBwV6rJjcwFnDFj/Pqy+TUGxFRZs13Gc?=
 =?us-ascii?Q?OSxY1ALtNco+hO6B0mwN7lZ1ClbDa54SME1vqALyz0I5v3Pc5an+Y79/HOft?=
 =?us-ascii?Q?IO2/omUOEsdA+TB34dgx4+GIngAa/+/WgRemrPQQ+SjQneCwDccXJ7yRbSXm?=
 =?us-ascii?Q?23wpDIy4QBSUr5SolK+qrbHA8+ZFRyUCfHwflZPdP6l1Z3hCJlTgp6BU9rst?=
 =?us-ascii?Q?10KKpl2hFzdv+zJZEX1lvyHU+RAUe3dRY/LEyjHTUMcjCBlVZtp/gmC4d9Tl?=
 =?us-ascii?Q?+yykBxfzaXJHXSYK1Fg3V4Haz4pFLnmX8dh8c5FyTiUc0dOaBsXOSnplyKOW?=
 =?us-ascii?Q?EjjPU3JAdREBupj6hbyQ7aV0ocHK7HkLH7Iv9EivUfDN/+fwv90BE5u9ZsB2?=
 =?us-ascii?Q?3Lw3iCmaLeP6exYuPorTpmW+aVOfTeF6VSoWNM+N?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dd90164-6956-481e-3a1b-08dac39c7283
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5358.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2022 04:23:13.1582 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eUHI0C1RUqay7Y4wMcKNNX2qjSMixIl6nfKCzrh+IbX//ogOmyGjNpbST0jFaIYRPcin6fWdwBZTBsSslRWeSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5102
X-Proofpoint-ORIG-GUID: KUYjvmfBn9TTETq5gSkvyt_ZSiipY-La
X-Proofpoint-GUID: KUYjvmfBn9TTETq5gSkvyt_ZSiipY-La
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-11_01,2022-11-09_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015
 mlxlogscore=801 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 phishscore=0 mlxscore=0 adultscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211110027
Received-SPF: pass client-ip=205.220.166.238;
 envelope-from=prvs=83144312e2=bin.meng@windriver.com;
 helo=mx0a-0064b401.pphosted.com
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

Use _getmaxstdio() to set the fd limit on Windows.

Signed-off-by: Guohuai Shi <guohuai.shi@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>

---

Changes in v2:
- new patch: "hw/9pfs: Update v9fs_set_fd_limit() for Windows"

 hw/9pfs/9p.c | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
index 0b5e1fa8d2..be1d2a4f04 100644
--- a/hw/9pfs/9p.c
+++ b/hw/9pfs/9p.c
@@ -4392,11 +4392,28 @@ void v9fs_reset(V9fsState *s)
 
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


