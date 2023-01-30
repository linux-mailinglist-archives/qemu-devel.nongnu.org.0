Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20B2E680A07
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 10:54:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMQqM-00032W-Ih; Mon, 30 Jan 2023 04:52:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=13943e2a21=bin.meng@windriver.com>)
 id 1pMQqK-00030z-NT
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 04:52:52 -0500
Received: from mx0b-0064b401.pphosted.com ([205.220.178.238])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=13943e2a21=bin.meng@windriver.com>)
 id 1pMQqI-00021i-Qg
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 04:52:52 -0500
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30U7wgu9004336; Mon, 30 Jan 2023 09:52:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=jquWjOk/2bQifIb1iccPzCgXb9Qy8aYd7A+unbyQWmY=;
 b=d0ru7RA8OeFEhfoxd9fGkUK0JhWt7aEB5Hfr+af5IseNU1z6EQfSt2L5giaFzPFqYaoV
 /e0g4kV2rmHTlQAOc/3IHzeeD7LRfo4CF15+DvC0YaZ9Zr4pQ3IsQ3Dv56vP+tc+KFR0
 +rurggc/KBr4mzmlZSGAZDA6C/yWr+y1rzNAqgC/axkpVFKrWAMZPKVeDmpN7XMxRJrL
 TuyMYYQ1Bgp+KT/5x6S4y+6nY5ddtW7cEXtHZXR3wTD5eQr4m9PpO+5u25xAFSWLbu4I
 Cq/0i7b8aG5AE9SA78PgITBa/BiNbOvC9uoXtVwUkJKd/p2vEtn6+Q5fA2ngIXv9LpJU Xg== 
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2175.outbound.protection.outlook.com [104.47.57.175])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ncrx3a45g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Jan 2023 09:52:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k5UsWgzCExT5Vf3FfDXQI4X37LOsMw4jTxlTLYYvPJnz2VscTuHzIKUsLpKdP1zKmBKlxFazrczT5oV6VMegl80QmUgx1IZ7J8ofmoVumznwpBM8+nnItqsG7BhzNBF6MyWIkoCfIIq6CnTulik088bEaKoP8wLFC7m/7xWD94b3p7Bqey2ZzomUOq9kcAubbna1wlfoMlMEjbN+58ravyl7eyR7/lqeEZtwDoJSbqlB0D4lxgUMFNRSgMKVh8tSGcDjoodhoUpNLubc6yVi+3QZpDG+ss0SSqm3PNhceStel8G4c9mlc+E/KJuxDMfGfq5pBwcUJo/JT9uX7I8hAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jquWjOk/2bQifIb1iccPzCgXb9Qy8aYd7A+unbyQWmY=;
 b=M7ByR1u7FLqyw1pZYzc1PQCRZgWSyBRSWML6wgfi4jvDhEDnVaWj9FzIvvh2t2UZuXqaqn2xFBdPmM13Z4vOsXFCvld0/dNscMYABq0Ij0kK++9mJTJ9l8gOvIsCqKIxuxgY70Y8yXfSVnh7ttlUCmc64LwhWJoLIu0cxZsvcUlMxi4mtZlDl42OEwIn39quPO6qVkM1QN6p0t1jCE1e/7E5UYIv6AxVPneTv5TjDLcOHPUe6gfh0yD7/y5txh7oBy8cZqLmUzCC76yycu7G4fCixo2X0Z1utqK+4/wamJ3tYwLcFkoYzVjjEIpln4uZWfuhpKsobJK4zFSXPcvjxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5358.namprd11.prod.outlook.com (2603:10b6:5:395::7) by
 BL1PR11MB6025.namprd11.prod.outlook.com (2603:10b6:208:390::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.36; Mon, 30 Jan
 2023 09:52:38 +0000
Received: from DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::6c5d:5b92:1599:ce9]) by DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::6c5d:5b92:1599:ce9%2]) with mapi id 15.20.6043.036; Mon, 30 Jan 2023
 09:52:38 +0000
From: Bin Meng <bin.meng@windriver.com>
To: Greg Kurz <groug@kaod.org>, Christian Schoenebeck <qemu_oss@crudebyte.com>,
 qemu-devel@nongnu.org
Cc: Guohuai Shi <guohuai.shi@windriver.com>
Subject: [PATCH v4 09/16] hw/9pfs: Disable unsupported flags and features for
 Windows
Date: Mon, 30 Jan 2023 17:51:55 +0800
Message-Id: <20230130095202.2773186-10-bin.meng@windriver.com>
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
X-MS-TrafficTypeDiagnostic: DM4PR11MB5358:EE_|BL1PR11MB6025:EE_
X-MS-Office365-Filtering-Correlation-Id: 8268ed78-b6f5-4871-aea7-08db02a7b843
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9FwD9m+i3gDmB852P6jqc6dftgdIq9+Yj/svVb0fk9tvg1BUsYLjOdqTZB/ybdSBn42BMYOuoRHFaOwwmaF8dYlH5+DBjPcZpIK7DIR6CVhN+ksGWkey0VeqFkV3KQlv4sk88pUp2GMu0wuJHeiKdlO88YDQ9iwjKs9oSo2xjF+xTRYxuNmzxItJ/ekfKw8gnTpOT/6oh3DleFd+XKFxlLOKqdVMe4k/M7soNeHaaIEZPnMDPJfhU+I2ZSlKu/sPeg4ahQRtmH7VE1HNvyNpViEUC/JfpnODIm7/W/4OmYBjEVrqPW1wiJGubEt0gPV+fFgVSTKyKVgGrP/JYJcIsctMbu43ST9S6RDdNSv19DKfSY+CrYQNOB9rTKXpL7aCDYkW0hCzIOGAtuwZlLtT3ID5n5Z91Dx6zOozRUAM0kfczf8OJPA27BFaYqw/he2JanQ7GU3380EJqjXO8+aV14P3spzia+oKoFdgfG1+pS+YLYGb2EzfpGi5Grh0IYXvVqNcstWOKyIYFaoKG0u7r2spcVZlGtK98mc+wiO7VgLwQfvMSXZyXjY39/OwHSqvQ5wuvzYmoqcUlhMDx6RYZd1R/FRPIEpsbI1R/d7sI9+YOfqUcfKhlW44/C2vkHCfwKbZ2BII2FD5oO2mC2bgpFa1l5ctznM866gpYf1lxM29Mhfj8d7pftG8xsjxQx1IXV9lczt9QXMRVkxaGa3VxQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5358.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(396003)(136003)(346002)(366004)(376002)(39850400004)(451199018)(2906002)(26005)(6512007)(186003)(478600001)(6666004)(107886003)(6486002)(316002)(110136005)(36756003)(86362001)(38100700002)(38350700002)(41300700001)(8936002)(2616005)(4326008)(66556008)(66476007)(66946007)(8676002)(52116002)(6506007)(1076003)(5660300002)(44832011)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?d0rd3MuLvK7nta4ven3WxKwnCtGlvSNpAvCfx5KTUJUheZ0y8f3p2O42dPcv?=
 =?us-ascii?Q?OCIGsEEYYo5VDPjS8ErkVGRrRm3en/6ndeJnPIVV1g9rqPYNHpIbKOJ9nLxh?=
 =?us-ascii?Q?Vj0NxzC0nS+ZsxdWxdWGbW8qH/yPaIrHgijRJaHfzq2FO1RKBDvYBCmAci+2?=
 =?us-ascii?Q?P3ia4adtmvVfgsySf4g+pl4hXHqr9RsRMAwJ43BJsz0NwO06UCy+S6qQJyVk?=
 =?us-ascii?Q?2V5qfNm/+3lDp3RI9BibxJj4WuYlBl/5Fm4krnqbTvxFD7vKiz3SR/rskVsx?=
 =?us-ascii?Q?lwbM58nTbyDDh6HIMb2zTctU+KFugDIBVYjpZBvUmgcIAXRISi47lnOPEuop?=
 =?us-ascii?Q?kicWPDKHjVXYKjlCFUTN53Z24MrSiJ7bdJ617XdKXgM0tO52OWEBdtu0g59m?=
 =?us-ascii?Q?Ur5kC50ZXk85TSZoQzvU1QPNoT65GcDgYLuioSOFFiACU1pwSsCMocd2kLkf?=
 =?us-ascii?Q?idtAN2tq0Ezn7EnnWXdjQq5nVYLloujYNYI61Zy3r7AfcGive44cNDryDF4r?=
 =?us-ascii?Q?7PhMFe62u1hdY8eeRiEeMnXbX6+afM9j860Qp+oBf9oGFq/W6bkXJEegziRQ?=
 =?us-ascii?Q?KhSf+ZpiMsyEEfBRKu+8ZV0tkgu9UQinSLLWXRlQFTOTymTlhpH5COJpc/oZ?=
 =?us-ascii?Q?qXOti9pWSQfSuWuPV3h2Ka4IaFN2aNNv6+C/LTQZCs65qdyyX2Bt8YNiecHJ?=
 =?us-ascii?Q?zb4PIxNl+zvKn5NHQYsQULrysctrfP9STRgIb9QAlzlDSUqKZs/3gKZ6/o/h?=
 =?us-ascii?Q?cyBvAY2pIPyTcjqjVI495BVIWwbu559/9mAC0PmXdR+5iJJh1lTXQtRBoyA+?=
 =?us-ascii?Q?8jCSlByTCk5NNEbJC+kER7vCTzAaKXqHgzzSu+1LH6UJa515O5UaCDn8ZYQ7?=
 =?us-ascii?Q?0AVgtY51yMAKzZOzCtsxcTmz0P4OjeVbHoXBJ1ToWJMlq5hS7ZjM4FAAFO8D?=
 =?us-ascii?Q?s9jyBB94lHSjYxHTcH7e1F667vt0MlfjU2LpJAQxBf/1gRFRFzia2e+yBowt?=
 =?us-ascii?Q?34G43V9Hz8SRGvFXZcyLUS+/0WmDQYodVMmtcFQWu1gELDu1a+JfXC37E9nE?=
 =?us-ascii?Q?uPfEc94VkjIlbpn2wBUhc2l2v3l9VHv9i1xocfch+DUg0VuCBcqZjGDYkf/n?=
 =?us-ascii?Q?ljAq5a8/doDvrlzthOmv3Jiy/W1Ak+Ii1/En01eAqQN1qViyC4xpWbURASvI?=
 =?us-ascii?Q?ukdcAO+c+Z9MIY62mp39JRpqsO4aJ0KmFzpbmWtQ041AzVznJfBHCbXuG2V2?=
 =?us-ascii?Q?+VA8S8hAsB5cSgOhstXGWjnpSeFF1ER71eA9K9Rm2D0eEcBgDi3YE642HMeE?=
 =?us-ascii?Q?hv6fwM8PWHj3AykWVmcrB4YAwJSO/Sztp5ec1+gz0w0tFyfzhyCtry4wWT0o?=
 =?us-ascii?Q?ZrkwjOq9ZRbLVIlHr+DC7k++OXWh/caeqQPbuedBe6PiC3mibcju5xO9HYTw?=
 =?us-ascii?Q?Yz+cz/kBSCgTr+SBSHQfuYrUaPg2UdFk3kBsKzoSlxV6LSqc9t+SUD4GTDo2?=
 =?us-ascii?Q?t0rSXPUZtcCKlFDlC1gk11yVjEHvtdPTNulV/uHKwDrC1kcbX6fpPZ1V6sMq?=
 =?us-ascii?Q?lPTEGCVB2kSEEVG5zeT2ehM7VDM++Br+hFfTwX0TlcObs7bs8bpK5+5Bd9xr?=
 =?us-ascii?Q?ow=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8268ed78-b6f5-4871-aea7-08db02a7b843
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5358.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2023 09:52:38.2275 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vx/KTqeWVAyM/nnTGfLyS3pj8gYAElq7c4gWaQFDxq4bjnv7ic5HVXcSz7a1H63EhBOjF3a4Jj9yEvYwnGhzng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6025
X-Proofpoint-GUID: 2Rb3cs8tQPYnRWFhRnfCBnhdluKZDKDa
X-Proofpoint-ORIG-GUID: 2Rb3cs8tQPYnRWFhRnfCBnhdluKZDKDa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-30_09,2023-01-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 impostorscore=0
 adultscore=0 malwarescore=0 clxscore=1015 mlxlogscore=999 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

Some flags and features are not supported on Windows, like mknod,
readlink, file mode, etc. Update the codes for Windows.

Signed-off-by: Guohuai Shi <guohuai.shi@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 hw/9pfs/9p.c | 45 ++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 38 insertions(+), 7 deletions(-)

diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
index def85a57fa..2497a06f43 100644
--- a/hw/9pfs/9p.c
+++ b/hw/9pfs/9p.c
@@ -39,6 +39,11 @@
 #include "qemu/xxhash.h"
 #include <math.h>
 
+#ifdef CONFIG_WIN32
+#define UTIME_NOW   ((1l << 30) - 1l)
+#define UTIME_OMIT  ((1l << 30) - 2l)
+#endif
+
 int open_fd_hw;
 int total_open_fd;
 static int open_fd_rc;
@@ -132,13 +137,17 @@ static int dotl_to_open_flags(int flags)
     DotlOpenflagMap dotl_oflag_map[] = {
         { P9_DOTL_CREATE, O_CREAT },
         { P9_DOTL_EXCL, O_EXCL },
+#ifndef CONFIG_WIN32
         { P9_DOTL_NOCTTY , O_NOCTTY },
+#endif
         { P9_DOTL_TRUNC, O_TRUNC },
         { P9_DOTL_APPEND, O_APPEND },
+#ifndef CONFIG_WIN32
         { P9_DOTL_NONBLOCK, O_NONBLOCK } ,
         { P9_DOTL_DSYNC, O_DSYNC },
         { P9_DOTL_FASYNC, FASYNC },
-#ifndef CONFIG_DARWIN
+#endif
+#if !defined(CONFIG_DARWIN) && !defined(CONFIG_WIN32)
         { P9_DOTL_NOATIME, O_NOATIME },
         /*
          *  On Darwin, we could map to F_NOCACHE, which is
@@ -151,8 +160,10 @@ static int dotl_to_open_flags(int flags)
 #endif
         { P9_DOTL_LARGEFILE, O_LARGEFILE },
         { P9_DOTL_DIRECTORY, O_DIRECTORY },
+#ifndef CONFIG_WIN32
         { P9_DOTL_NOFOLLOW, O_NOFOLLOW },
         { P9_DOTL_SYNC, O_SYNC },
+#endif
     };
 
     for (i = 0; i < ARRAY_SIZE(dotl_oflag_map); i++) {
@@ -179,8 +190,11 @@ static int get_dotl_openflags(V9fsState *s, int oflags)
      * Filter the client open flags
      */
     flags = dotl_to_open_flags(oflags);
-    flags &= ~(O_NOCTTY | O_ASYNC | O_CREAT);
-#ifndef CONFIG_DARWIN
+    flags &= ~(O_CREAT);
+#ifndef CONFIG_WIN32
+    flags &= ~(O_NOCTTY | O_ASYNC);
+#endif
+#if !defined(CONFIG_DARWIN) && !defined(CONFIG_WIN32)
     /*
      * Ignore direct disk access hint until the server supports it.
      */
@@ -1117,12 +1131,14 @@ static mode_t v9mode_to_mode(uint32_t mode, V9fsString *extension)
     if (mode & P9_STAT_MODE_SYMLINK) {
         ret |= S_IFLNK;
     }
+#ifndef CONFIG_WIN32
     if (mode & P9_STAT_MODE_SOCKET) {
         ret |= S_IFSOCK;
     }
     if (mode & P9_STAT_MODE_NAMED_PIPE) {
         ret |= S_IFIFO;
     }
+#endif
     if (mode & P9_STAT_MODE_DEVICE) {
         if (extension->size && extension->data[0] == 'c') {
             ret |= S_IFCHR;
@@ -1203,6 +1219,7 @@ static uint32_t stat_to_v9mode(const struct stat *stbuf)
         mode |= P9_STAT_MODE_SYMLINK;
     }
 
+#ifndef CONFIG_WIN32
     if (S_ISSOCK(stbuf->st_mode)) {
         mode |= P9_STAT_MODE_SOCKET;
     }
@@ -1210,6 +1227,7 @@ static uint32_t stat_to_v9mode(const struct stat *stbuf)
     if (S_ISFIFO(stbuf->st_mode)) {
         mode |= P9_STAT_MODE_NAMED_PIPE;
     }
+#endif
 
     if (S_ISBLK(stbuf->st_mode) || S_ISCHR(stbuf->st_mode)) {
         mode |= P9_STAT_MODE_DEVICE;
@@ -1369,7 +1387,8 @@ static int stat_to_v9stat_dotl(V9fsPDU *pdu, const struct stat *stbuf,
     v9lstat->st_atime_nsec = stbuf->st_atimespec.tv_nsec;
     v9lstat->st_mtime_nsec = stbuf->st_mtimespec.tv_nsec;
     v9lstat->st_ctime_nsec = stbuf->st_ctimespec.tv_nsec;
-#else
+#endif
+#ifdef CONFIG_LINUX
     v9lstat->st_atime_nsec = stbuf->st_atim.tv_nsec;
     v9lstat->st_mtime_nsec = stbuf->st_mtim.tv_nsec;
     v9lstat->st_ctime_nsec = stbuf->st_ctim.tv_nsec;
@@ -2492,6 +2511,7 @@ static int coroutine_fn v9fs_do_readdir(V9fsPDU *pdu, V9fsFidState *fidp,
     struct dirent *dent;
     struct stat *st;
     struct V9fsDirEnt *entries = NULL;
+    unsigned char d_type = 0;
 
     /*
      * inode remapping requires the device id, which in turn might be
@@ -2553,10 +2573,13 @@ static int coroutine_fn v9fs_do_readdir(V9fsPDU *pdu, V9fsFidState *fidp,
         v9fs_string_init(&name);
         v9fs_string_sprintf(&name, "%s", dent->d_name);
 
+#ifndef CONFIG_WIN32
+        d_type = dent->d_type;
+#endif
         /* 11 = 7 + 4 (7 = start offset, 4 = space for storing count) */
         len = pdu_marshal(pdu, 11 + count, "Qqbs",
                           &qid, off,
-                          dent->d_type, &name);
+                          d_type, &name);
 
         v9fs_string_free(&name);
 
@@ -2912,8 +2935,12 @@ static void coroutine_fn v9fs_create(void *opaque)
         v9fs_path_copy(&fidp->path, &path);
         v9fs_path_unlock(s);
     } else if (perm & P9_STAT_MODE_SOCKET) {
+#ifndef CONFIG_WIN32
         err = v9fs_co_mknod(pdu, fidp, &name, fidp->uid, -1,
                             0, S_IFSOCK | (perm & 0777), &stbuf);
+#else
+        err = -ENOTSUP;
+#endif
         if (err < 0) {
             goto out;
         }
@@ -3983,7 +4010,7 @@ out_nofid:
 #if defined(CONFIG_LINUX)
 /* Currently, only Linux has XATTR_SIZE_MAX */
 #define P9_XATTR_SIZE_MAX XATTR_SIZE_MAX
-#elif defined(CONFIG_DARWIN)
+#elif defined(CONFIG_DARWIN) || defined(CONFIG_WIN32)
 /*
  * Darwin doesn't seem to define a maximum xattr size in its user
  * space header, so manually configure it across platforms as 64k.
@@ -4000,6 +4027,8 @@ out_nofid:
 
 static void coroutine_fn v9fs_xattrcreate(void *opaque)
 {
+    V9fsPDU *pdu = opaque;
+#ifndef CONFIG_WIN32
     int flags, rflags = 0;
     int32_t fid;
     uint64_t size;
@@ -4008,7 +4037,6 @@ static void coroutine_fn v9fs_xattrcreate(void *opaque)
     size_t offset = 7;
     V9fsFidState *file_fidp;
     V9fsFidState *xattr_fidp;
-    V9fsPDU *pdu = opaque;
 
     v9fs_string_init(&name);
     err = pdu_unmarshal(pdu, offset, "dsqd", &fid, &name, &size, &flags);
@@ -4061,6 +4089,9 @@ out_put_fid:
 out_nofid:
     pdu_complete(pdu, err);
     v9fs_string_free(&name);
+#else
+    pdu_complete(pdu, -1);
+#endif
 }
 
 static void coroutine_fn v9fs_readlink(void *opaque)
-- 
2.25.1


