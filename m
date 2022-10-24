Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53FE9609A24
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 07:59:59 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ompY8-00045B-MY; Mon, 24 Oct 2022 00:58:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=72963f20b2=bin.meng@windriver.com>)
 id 1ompXp-0003qN-O5
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 00:58:38 -0400
Received: from mx0a-0064b401.pphosted.com ([205.220.166.238])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=72963f20b2=bin.meng@windriver.com>)
 id 1ompXn-00067k-Tb
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 00:58:37 -0400
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 29O4mkTM015442; Sun, 23 Oct 2022 21:58:22 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=JUfNkvsNca0vVxdygxUEC2C5ZSCP6t/V/Z28oTxp0ak=;
 b=q99Ab1enPsuJL6WRykIF7O6dxPJM52dbtQvN62M96l0Bt/nhtK1up59LuhLx8HSmZUhE
 cfSQtuD4D6YH/MwdyZwqwnAM/KHJ8LOnsCEKzt1lqMdB3nw/vrg+6K63jdnXNDokaGM+
 xLJv3p5izBYUNMLAhQLfyeIhzvNCVcEp/BSS5kmriEdjKefBkduxv0fhx5B/W5xGkwY8
 uao509qIDjoyXdcLiwxB2KFiwlOymjYUJEU2isveGe6oSwSYL1Z2WE+N4pewqn1HF097
 gKnLIHAyvuvrA8dtkXcmsFAGMwg9LHJRQkMi22vFnq5Vb8n4yDKJw/PFIemeZPatTvuI CA== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2101.outbound.protection.outlook.com [104.47.70.101])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kcg1ksma8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 23 Oct 2022 21:58:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V9KCZ3PzenzWPIgCY4HTW0qAEf+iLQEdKc69i8an2tSWx61oR3cHM5bvzgKQVKFIUI8lx1sum1FqXE8NHEFVYtmhkiUN2ei/EfQ+Y1HLHMJZgenZp+w6YiuZRvU9yQs3qBIQLBjdlD0rKjuJ6rb/ui1HRF18TSPHZLi/KVOREdr0/RfAge7VcPfVwNAaqKGAbQJdViVOEcawcXEP3NMaFt450PJEKh3xqsb9CbOaO/OuIJY6zR2mLZ80+xTKzeUwvd6yWKFQWPQiYnZCbmQGPHRYKfvpntOo0+n3UaueINXYUe30GzgCN/NKo5IhdC1zfQD4Xi90yB4o6EOi0YPUgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JUfNkvsNca0vVxdygxUEC2C5ZSCP6t/V/Z28oTxp0ak=;
 b=eAGka9224hX5bN22+wy0EWPPjxGyjf79500y8yxK5aVTJsqnjWvhJjhrWTFjbFh8UbEd2t4SmQ/+g1axNJFWAzx2DRqUMkJhj7LEqCsALn/1iEEyLEoTalfTtQXVnj1Uk1Lri7Mli5wqEnaDZdfqIFMKZ06RRDgyWlFukKx2FG2IMCDDUInPBTIGJNZFzc21hGwqSIFLrxqs501b/r3FWAgPZyW2k4zfFRMRyZL+wdGe/F0fNxG63LIlHAsd9o4BoSRHlaKVPTFuIuBRJuCSh+5GlXxW+K3C2fYcwrH3eFgwv54zb3Xmgjyu6VPFE2tBYnkJeFyCYuYTs1rLtgILsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5358.namprd11.prod.outlook.com (2603:10b6:5:395::7) by
 MW4PR11MB6911.namprd11.prod.outlook.com (2603:10b6:303:22d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.26; Mon, 24 Oct
 2022 04:58:20 +0000
Received: from DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::b051:27b7:c1c1:7cb9]) by DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::b051:27b7:c1c1:7cb9%4]) with mapi id 15.20.5746.025; Mon, 24 Oct 2022
 04:58:20 +0000
From: Bin Meng <bin.meng@windriver.com>
To: qemu-devel@nongnu.org
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>
Subject: [PATCH 02/16] hw/9pfs: Drop unnecessary *xattr wrapper API
 declarations
Date: Mon, 24 Oct 2022 12:57:45 +0800
Message-Id: <20221024045759.448014-3-bin.meng@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: 6d0f00d9-bc29-451f-e72d-08dab57c5eea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 88JKkbMVugABb/dySD+4W0tecLyK8BhoHGD7JhLgTQPOROj9B+7WMlUhMFJfireXS2Y3pS3PTLnSisNEyk4KyQ30iBAigaQ5SCaUqZiTrSh6dPm2AQUOtto99GfRWWBXJytbK2aZJjWgFArlx14/XYG98OaG7CAx5WAKN1bLSHqBaAUwtWe7gy2mCQef8oofBYxWE3ue3QV5Jw0508/MxrO9qmOcVR5JNyQQtEGubq3n83mWWdYf9uU6EgBkskQo2tMiS1U3wtdks+uv5aZLKfnSKLOZvKDsSLCnhtVcOvbljnbX38keuiGj1jZC6iP/xMhwRNq3cQsJM497bFtO1+SvI/xCxeWZOW3QF6sEXZ5oAVHN60UQdHtGTewgfq3IaJtNmbmyLD5HfsTVIzwF/4tp1gdrNeFEW5IqD9NucqGcNMHUQq0SRD2AX9GgsrYhuofc1lz3s+Cn3wv/yw0QKEdPCSP1zPi/PsCO34F2jVyFk2Zptvz9byqje7NrXhkVvTV9Mn6TAn/biYbTLtuuqV8PcrysBk20+lHhoGvQD+0SSeGuM9/EyaRLXATuvRzhCfWFuWfJAGWvxfJU2huhZmTZAONflhb5WiRcFLGLPCgrzbnhNlOEq6bzelr5mf5+1/APPZzyU9SLVLdJlEq3a85aA0nepHrQr+tc+bnsjzChS8hcMfUvW3iUFAOoI4EvOfs5wggzakyaB38q4Fyx/7M4MJoylcW2N4nAfRWhuqVpTVxsKKQDRQLUXDaClpnShoKITFOPsCzpZjHosWpZzg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5358.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(396003)(39850400004)(346002)(136003)(366004)(451199015)(6666004)(6506007)(2616005)(52116002)(6512007)(26005)(1076003)(186003)(83380400001)(44832011)(2906002)(6916009)(54906003)(316002)(478600001)(6486002)(5660300002)(8936002)(41300700001)(66946007)(66556008)(4326008)(8676002)(66476007)(86362001)(36756003)(38100700002)(38350700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8Q94tdp1Gbx1RSdTpaflTn3Nun758yYgeN9YDNOpF+UlrxrDmALOmNp5n9mO?=
 =?us-ascii?Q?cyt/ext6CTWLyJvYJcZIB4QalAaWQ2sYEB1htdL22JSUFdQEOE5LVTmK6q8z?=
 =?us-ascii?Q?vjzcukaxnLE5GBgJ5kEV/FxDVMXePeetC3zeTqekIA6KchUhOPMR1xf2NzZM?=
 =?us-ascii?Q?MjPlUJlwlhRJ7Pbx2kjtwon2/9ykzIZ5c+eicgAl2MQkBGq5jMNeMHHuK/m1?=
 =?us-ascii?Q?L2I3ZoqO/Ab0kgAM+vLFq+SOjhOhAqmoANfWCu2kf5xFoXXdqYwv6i9C4kDq?=
 =?us-ascii?Q?dh1Yd5gJldGPMpotvBtfDlHjB0wSpeON3MiI9RvrVo+F8CDfz10jcIT7LaAM?=
 =?us-ascii?Q?t6qGdGpRAAwqu38FAXm+NqkrYYtXPIhnrtTDZWcNA7zDPF38PHNNnbFx3g8g?=
 =?us-ascii?Q?FL80GNv4Awa4MWonhnWw3GZB6V1B8fpoyetnOSLr5CtdqoUpOK3vmUnHKJ6Q?=
 =?us-ascii?Q?3zRwGPF1WAMuuhgRb3yEeQW/DL/qZIOENHYEc312SKchakvLwmKz8Hbk/0eN?=
 =?us-ascii?Q?CVdGeGU4aPu3mzsCMyX54TQb8Owy7YvIr7FzAv6BWmtHXsfxeJ+uXU2UHueY?=
 =?us-ascii?Q?K3h7wh/BOztLieRFkEQQ/cUYmYWjX/j5qz0mD9LPNyP9B6M5VP9c/cYDpjrF?=
 =?us-ascii?Q?bfzj5O88S/wwhoJ/s2qXP++RAcIF0bHGTHUf584JM1ytw+PY/29vIYozohvz?=
 =?us-ascii?Q?W+/g+c2LnppvquA9x+N0iytWSKrasu0rYrJ0GORcG0LBJhl3PkwvvDIabgmQ?=
 =?us-ascii?Q?PUG6tr1z07sFrN85c4uKyIiEb5KKq7p16ehGn1ugtL9CPmZS2wGmlp8QkeJW?=
 =?us-ascii?Q?+BA0TT2TAaCMwGVH7R3WE0Juc47yWI4J5unD6CuS8njklZfYCoX8Lq3NkV6n?=
 =?us-ascii?Q?E7tiJZq4bG/m6kQITX54NIEESOQ0QYY+yE8Wf10EyyfYbUoE66IXvj/9YLnA?=
 =?us-ascii?Q?rXDlegXdAVqxHpgExtAw7vkBVFaVOWT4CoUBykIIq2T0wGBxyfi1x0ByvSS7?=
 =?us-ascii?Q?ShzIAbro4JEDdx/Yk61OHoVRindWCfIr3fDN3TFSWhSEHKmwrbaVVwF5o1r3?=
 =?us-ascii?Q?311Abz5LG43c0qGBqLqbSnzejBpfmuk21JKXviomdafSSXZKKn+ngB4+2w3A?=
 =?us-ascii?Q?Z5l9MS+ZtQDHEuO+9liMti5OihrMwldb2h+sEjow7F0MidvhFhcrBTQTS50Q?=
 =?us-ascii?Q?AcuVRxD9CQSkO2rrXlNSg9a+sIeVxkMOWQuGdJdXBJl7mULvTlKX3brEit5v?=
 =?us-ascii?Q?YPz97x5YqAquOs6Zibq89NKrxyz0iTDn7g/VmJtER6bucpVuQleKC79611Ry?=
 =?us-ascii?Q?sHU97jquOCgj6/jGSYQFzgMSX80LtafYJpVCCgGPR8SN5mV67kywV+JTc8yB?=
 =?us-ascii?Q?yR8OPl9kNuKCDWg0clkoGCWOuc5JIDJxVmx2kCCmsIBbrFQen34XhdIbn7hc?=
 =?us-ascii?Q?xCdfDQ7CwVTjAQMu4Ub+EVO56SEykEHWJQfz7ZNde+vixMYlmmzvoDQk82z2?=
 =?us-ascii?Q?Miknj6jQi/0luYQVrXy6/BQVlasTV2PFm3qczcCojwugQn9/hV0QgTTD1Nou?=
 =?us-ascii?Q?bgnSDQT6HTUnnOGF+aGwdzAY/TQHW6aBSQ9r8unDxCT8Y48EQgr+I/fD6/lL?=
 =?us-ascii?Q?lA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d0f00d9-bc29-451f-e72d-08dab57c5eea
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5358.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2022 04:58:20.1245 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z5mekhV2aOdmqR+4oan8Sv5XGL/xIx4E4ziwy0MUdS8kXIp3SoDc7Xm1STTAC1++T5bTj4s9RpJrUmZwmCeLzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6911
X-Proofpoint-ORIG-GUID: tL-nEIQB6GDJicQGSK1IzamLjTrRuq37
X-Proofpoint-GUID: tL-nEIQB6GDJicQGSK1IzamLjTrRuq37
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-23_02,2022-10-21_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 mlxlogscore=713 mlxscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 suspectscore=0
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

These are not used anywhere in the source tree. Drop them.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 hw/9pfs/9p-util.h | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/hw/9pfs/9p-util.h b/hw/9pfs/9p-util.h
index c3526144c9..ccfc8b1cb3 100644
--- a/hw/9pfs/9p-util.h
+++ b/hw/9pfs/9p-util.h
@@ -90,19 +90,8 @@ static inline int errno_to_dotl(int err) {
 
 #ifdef CONFIG_DARWIN
 #define qemu_fgetxattr(...) fgetxattr(__VA_ARGS__, 0, 0)
-#define qemu_lgetxattr(...) getxattr(__VA_ARGS__, 0, XATTR_NOFOLLOW)
-#define qemu_llistxattr(...) listxattr(__VA_ARGS__, XATTR_NOFOLLOW)
-#define qemu_lremovexattr(...) removexattr(__VA_ARGS__, XATTR_NOFOLLOW)
-static inline int qemu_lsetxattr(const char *path, const char *name,
-                                 const void *value, size_t size, int flags) {
-    return setxattr(path, name, value, size, 0, flags | XATTR_NOFOLLOW);
-}
 #else
 #define qemu_fgetxattr fgetxattr
-#define qemu_lgetxattr lgetxattr
-#define qemu_llistxattr llistxattr
-#define qemu_lremovexattr lremovexattr
-#define qemu_lsetxattr lsetxattr
 #endif
 
 static inline void close_preserve_errno(int fd)
-- 
2.25.1


