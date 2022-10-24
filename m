Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94C44609B15
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 09:15:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ompZ7-00058t-Cb; Mon, 24 Oct 2022 00:59:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=72963f20b2=bin.meng@windriver.com>)
 id 1ompYH-0004MH-UU
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 00:59:07 -0400
Received: from mx0b-0064b401.pphosted.com ([205.220.178.238])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=72963f20b2=bin.meng@windriver.com>)
 id 1ompYF-0006DP-JZ
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 00:59:05 -0400
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 29O4aBdG004966; Mon, 24 Oct 2022 04:58:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=HYLliU5SInIaZI2Sm1MxYUuuakbxSydGL3cJiGUQUcI=;
 b=E553md43ATWQanUfd7UNkLqiKBiqLsAqNp8tBTb/LeVhd8GsBYm4Ls8emlrsa/vKngGi
 CylPQZ8maKx0RrVt5kRohlvZ290sEEGBaR0dqvoopYYrh2nRr3Kd3dH78N6Xz7NHVE5x
 pqNmCURA+rYlRtYdRA7tuqryQm4urs8LCSk280vnX2ecjn7S7N2hmiWUgc6fvYblE4Aw
 p1Dn7vvVatzx+dSAtv4mVS74z8M3RBRYaSH5P/v6BHzSfDvDe8FFpFXrZ7/RIqBLZuEj
 QpxVK0kvpRMJl9EoRQpwsBB9R+f6wYSUoItY9e4Rrlwj4mhsipY+ZM4P/urKtDK/TlJW Ig== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2104.outbound.protection.outlook.com [104.47.70.104])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kc7g9stjg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Oct 2022 04:58:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dBzzHP4VkJzml/gujXMDOIuDWddt5/yJRUKaQ0G6l9AnSwHvcmN+0oRR66opPg0ViYX3MwtEfvw2R3LL+7bg23qahsDobX9VM0nXPZO+Viej8xs+xMfRA5MGWjClU2eYm3YdnJ6Ukk/E9juS6zg3ppEixp6dV+lS75lDNXCsV9zIBuMJ1vwAn8aRI+rHKVoKoETV7dcTCYThk+LNu+xCTGdtIT9O1rVxYzDvI4LWq6Ec/+/gHdf4j5kn01RP7hJRnCDCUXhNSwKpHuxPftOq7h2a2TUUT2IwZOKnm0hmDcMekkSkNS3VgWRm0GXS9ncilvw3IB+QF+PLJimtvw0/Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HYLliU5SInIaZI2Sm1MxYUuuakbxSydGL3cJiGUQUcI=;
 b=ItHEqNqY5irxcuAglnZaGhJlQtPICFzar7PScHmUuDGKUiAJkDMFxePdJZFhCcsHfn+MOY1EBp6mEkFhXuYx/67pvNVh0P+s818UhzuokfwWXQiK0NPC/hvmhYjrGvVSPlDOv07/Wc3djNW9ya8uKYbeTGac8N3VC8ARnu6nV6ur9oZfMGYaI5vaEPYVLey5lYl/GZmg1jKlB9kYoF30tC1/Xzggt/Shr996afRqTLEwmriM2DCerUzf0h8a8t4Dm0zAKyJabf4yy27YMhrLtJDQzONcfLxAKz4K80/A7HBcgEnltNQdllu98sewWC8zAggXwksqaQITtaknF8uPhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5358.namprd11.prod.outlook.com (2603:10b6:5:395::7) by
 MW4PR11MB6911.namprd11.prod.outlook.com (2603:10b6:303:22d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.26; Mon, 24 Oct
 2022 04:58:51 +0000
Received: from DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::b051:27b7:c1c1:7cb9]) by DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::b051:27b7:c1c1:7cb9%4]) with mapi id 15.20.5746.025; Mon, 24 Oct 2022
 04:58:51 +0000
From: Bin Meng <bin.meng@windriver.com>
To: qemu-devel@nongnu.org
Cc: Guohuai Shi <guohuai.shi@windriver.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>
Subject: [PATCH 16/16] meson.build: Turn on virtfs for Windows
Date: Mon, 24 Oct 2022 12:57:59 +0800
Message-Id: <20221024045759.448014-17-bin.meng@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: 8169ae37-a7d7-408d-62b8-08dab57c714a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FXX9jdV/wddt96Dc6uyrO4tOhFhrHM1E0rESby2CNMvkAt/JQlFVzb+NSzMvLfwQE3A0A60iDkHX9+enox3faBfnOtG671B+3jYgRqFnOdBpP8Y5rD4KRhhnqVQpMLyLhkyu2rG41Eqe1wt4T4Eyqqt7XAjqpbVa/npQa8/n7YGzrA7Ca5Pp0v97pitgglliYty7kIglDALbWRB9e1zBsCs2Z8qUJ/pph3qmvZCzR5c4Kez2dJrb2kRw9Bd4Cg+B6yfxN5c/tX45Xv3QJvwKJiO1I2sx3s2F4g1+sN3cJGNcqMkDC/wOmpJN8mTFIMstMUvW7smemGrS3meUc0GM06Je/kOOXgWIR69yobYeRxQCIwY5Tmg4cK+JNVmPsdRKJwCS4Nc3uP6RJPF/QJDLlK1FAX8peqCkfyNsrKmscLn8j/yjqADsExtI1iWww0X2SiTunkIR3lQVRhMYUU45Yce2HNGzvBNuQ2/2NsKSaAhmTuiEacCqbrN1XxmwWsOh21rlelFs+0WDsJsxWwBhfenj4+V9hyAzkqrhtMrykpaGq154l/5gxImTDPRNkdpNQlseK4jYfUJK636qwmBqBHL0kxIFkGHKyHp1fOa5hsmGLV+MQK8WqpqSQj3xAy1Hcjs9kbMJNPA9VO7rZ75mTvmDb2uF95bP6i2zv2kUdb/OemH8etuwNakM7ROORaVbuFV4cljCAsIDQkg1Zt3jW0g4MNNlzBlCMb1TQmG9NP9/AOdP1lIYrslg14eQQZ/7ZcIpiVPTVyTbohVaB9/+4A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5358.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(396003)(39850400004)(346002)(136003)(366004)(451199015)(6506007)(2616005)(52116002)(6512007)(26005)(1076003)(186003)(83380400001)(44832011)(2906002)(6916009)(54906003)(316002)(478600001)(6486002)(5660300002)(8936002)(41300700001)(66946007)(66556008)(4326008)(8676002)(66476007)(86362001)(36756003)(38100700002)(38350700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FYEfTqK6236nC1p8Ct32TxVLojcG9E8v8ofPDqOsMShdw4nTwT5ffjL+pgvf?=
 =?us-ascii?Q?+dwStPquegRy5Dm4fJDSPpcCzOzdxX69mWQDyeXVmllpebo0eVpKkLjUxcdC?=
 =?us-ascii?Q?moT09I7M4fHXVYz6CuMr8p3rhOu25Etj4syftOoi/QpyNMYzk5BctLIQDBOd?=
 =?us-ascii?Q?SJerVWbroQlG7ig9REdzEpLO2m/fsRfMO+4NEUcL5xnShZ+equTa9eRccl4n?=
 =?us-ascii?Q?WfydO18QnmKESWeSKRrweHUxxVYnkROH5ViJdZEUc1TlzQP4URXPhxP9Zunh?=
 =?us-ascii?Q?sY/B8luks4QVFbYTj/pJGPFAuYSQ/232TUYEqraLlAJmUERVt5e2Yn0Q002G?=
 =?us-ascii?Q?IKXpZY3COutEWjh+5UD2oAajNRdfu9Sw4q1/F5LgCfw1LyII5ZDYDyyKPKXU?=
 =?us-ascii?Q?64GZmf00D7hCdwPfA+VGeH34cMb4CFYjmF8S8KUyYwOhqav8Z1AxvR+NoZyS?=
 =?us-ascii?Q?zHvtKaqJw2raSSWQO2y2KBCoIm9obMhYcLDOGUEZgzT/HBZUAMBP83qw1Umu?=
 =?us-ascii?Q?4sR1BiQCWXE2lODpEE35qnI600hG4qBdo0mxsAmr804W+gAO/z0hR6j8+ZyD?=
 =?us-ascii?Q?KINVlket3q4iVrS2oIc5uuzx4ggp9HSRDVZLTUBdwim4InRzDNjxXLdnn4HV?=
 =?us-ascii?Q?IEn94kxsYUj/gcpwd9HdatoO1z4P440cjCYoQrFY5SZV8xjJkqzbs+BA1esj?=
 =?us-ascii?Q?292kz4aZy+fLgRsz6ZhpxdtFc2r1hk/fEF4pqD8aMxansgvF1iDXDuIdeZ9k?=
 =?us-ascii?Q?YeviYt4blbhpLMyJw3xDaR0ehSfZrL2C7hqXE2l9U3OyXLG25Tn5GdIlIDVQ?=
 =?us-ascii?Q?OvD1P7sZ8xwMw+gWfA0ib9a5osVG72qrNwUj/qMum1U7iIpaCkxjlI/dFnw/?=
 =?us-ascii?Q?COdKEgws95muNw5i6L2oEaNjUnaMYSM+NQui4+Ckx1MFSQZmdBN6u596ZN3c?=
 =?us-ascii?Q?uOuYhEzw9C5zumYnKp5AiVLhf6afZ7PRa7jjb2uzeleyEOBFCu7KSzGfE5XC?=
 =?us-ascii?Q?Aq5ft4gM9ejwp/4sWDsG2xeCqkIeodHRubbY5EUh3FbZXJ2LTXcthiO5GObZ?=
 =?us-ascii?Q?swJt5TrAOjlzRV8dlmRO36LO9rxbrksM5lLw/Dp3asFTP/2jL/o20vb4XGgi?=
 =?us-ascii?Q?To1qm0cysU39vSK3Px0lvq1ZyQUL/H/sI/XKssTtfzOC+h3HwgiC4RmdzpxM?=
 =?us-ascii?Q?fwTaS0ooR1D+m9jf7YAungcfDjzNlpMy1BBE0B5RFuSaH7bFJL8jmWbaxYNR?=
 =?us-ascii?Q?FswWBbZIvO4tssm4uaqyrhOkRCW8GlHu7LpocSHOFmaG7e720HjAHTEhmuVE?=
 =?us-ascii?Q?nUA1+YHz1XYyLv/X792zkB2JJwsOg5JbrNTsIjmm3Wcx3XdKz/sJ9TskxGvK?=
 =?us-ascii?Q?Q2Oju2Atx8a+RLH53KP4J/sYlKM9KcqCNiu5+jYBss7dfi18GRLMGA9/8Vzj?=
 =?us-ascii?Q?TFjBIzZ1ZyD9iakQBmylSs5iEZxj6WB2zPyyKxnbLqYm+8dBPu79h5YRnw8O?=
 =?us-ascii?Q?bt1VlTlzeiD6HHRs27sy6ZTpuKnmSjR1x4EvNGCUsE3d79CS0GDcfeYueY3W?=
 =?us-ascii?Q?7GOQeBte8UgZCkINpJMuLcwWjj8wazl9NJ6zi/GeQfxEoKI0gczi+wYlwssI?=
 =?us-ascii?Q?4g=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8169ae37-a7d7-408d-62b8-08dab57c714a
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5358.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2022 04:58:50.9962 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QjKr265YSdaAVBKsKJJRdM4pysDVhiMFQspa57SmP/3RNrcNEDMvAsGs6+9MtfQL7we69vcUhoClL+N+D4bl/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6911
X-Proofpoint-GUID: no41bZC6vY0oKHU8GQX1HkU2MefHgbiI
X-Proofpoint-ORIG-GUID: no41bZC6vY0oKHU8GQX1HkU2MefHgbiI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-23_02,2022-10-21_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015
 bulkscore=0 malwarescore=0 mlxlogscore=707 spamscore=0 suspectscore=0
 mlxscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2210240031
Received-SPF: pass client-ip=205.220.178.238;
 envelope-from=prvs=72963f20b2=bin.meng@windriver.com;
 helo=mx0b-0064b401.pphosted.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Guohuai Shi <guohuai.shi@windriver.com>

Enable virtfs configuration option for Windows host.

Signed-off-by: Guohuai Shi <guohuai.shi@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>

---

 meson.build         | 10 +++++-----
 fsdev/meson.build   |  1 +
 hw/9pfs/meson.build |  8 +++++---
 3 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/meson.build b/meson.build
index b686dfef75..4c23d18083 100644
--- a/meson.build
+++ b/meson.build
@@ -1728,16 +1728,16 @@ dbus_display = get_option('dbus_display') \
   .allowed()
 
 have_virtfs = get_option('virtfs') \
-    .require(targetos == 'linux' or targetos == 'darwin',
-             error_message: 'virtio-9p (virtfs) requires Linux or macOS') \
-    .require(targetos == 'linux' or cc.has_function('pthread_fchdir_np'),
+    .require(targetos == 'linux' or targetos == 'darwin' or targetos == 'windows',
+             error_message: 'virtio-9p (virtfs) requires Linux or macOS or Windows') \
+    .require(targetos == 'linux' or targetos == 'windows' or cc.has_function('pthread_fchdir_np'),
              error_message: 'virtio-9p (virtfs) on macOS requires the presence of pthread_fchdir_np') \
-    .require(targetos == 'darwin' or (libattr.found() and libcap_ng.found()),
+    .require(targetos == 'darwin' or targetos == 'windows' or (libattr.found() and libcap_ng.found()),
              error_message: 'virtio-9p (virtfs) on Linux requires libcap-ng-devel and libattr-devel') \
     .disable_auto_if(not have_tools and not have_system) \
     .allowed()
 
-have_virtfs_proxy_helper = targetos != 'darwin' and have_virtfs and have_tools
+have_virtfs_proxy_helper = targetos != 'darwin' and targetos != 'windows' and have_virtfs and have_tools
 
 if get_option('block_drv_ro_whitelist') == ''
   config_host_data.set('CONFIG_BDRV_RO_WHITELIST', '')
diff --git a/fsdev/meson.build b/fsdev/meson.build
index b632b66348..2aad081aef 100644
--- a/fsdev/meson.build
+++ b/fsdev/meson.build
@@ -8,6 +8,7 @@ fsdev_ss.add(when: ['CONFIG_FSDEV_9P'], if_true: files(
 ), if_false: files('qemu-fsdev-dummy.c'))
 softmmu_ss.add_all(when: 'CONFIG_LINUX', if_true: fsdev_ss)
 softmmu_ss.add_all(when: 'CONFIG_DARWIN', if_true: fsdev_ss)
+softmmu_ss.add_all(when: 'CONFIG_WIN32', if_true: fsdev_ss)
 
 if have_virtfs_proxy_helper
   executable('virtfs-proxy-helper',
diff --git a/hw/9pfs/meson.build b/hw/9pfs/meson.build
index 12443b6ad5..aaa50e71f7 100644
--- a/hw/9pfs/meson.build
+++ b/hw/9pfs/meson.build
@@ -2,7 +2,6 @@ fs_ss = ss.source_set()
 fs_ss.add(files(
   '9p-local.c',
   '9p-posix-acl.c',
-  '9p-proxy.c',
   '9p-synth.c',
   '9p-xattr-user.c',
   '9p-xattr.c',
@@ -13,8 +12,11 @@ fs_ss.add(files(
   'coth.c',
   'coxattr.c',
 ))
-fs_ss.add(when: 'CONFIG_LINUX', if_true: files('9p-util-linux.c'))
-fs_ss.add(when: 'CONFIG_DARWIN', if_true: files('9p-util-darwin.c'))
+fs_ss.add(when: 'CONFIG_LINUX', if_true: files('9p-proxy.c',
+                                               '9p-util-linux.c'))
+fs_ss.add(when: 'CONFIG_DARWIN', if_true: files('9p-proxy.c',
+                                                '9p-util-darwin.c'))
+fs_ss.add(when: 'CONFIG_WIN32', if_true: files('9p-util-win32.c'))
 fs_ss.add(when: 'CONFIG_XEN', if_true: files('xen-9p-backend.c'))
 softmmu_ss.add_all(when: 'CONFIG_FSDEV_9P', if_true: fs_ss)
 
-- 
2.25.1


