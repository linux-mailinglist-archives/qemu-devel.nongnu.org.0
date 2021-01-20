Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC4A2FD7C0
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 19:07:01 +0100 (CET)
Received: from localhost ([::1]:55304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2Hsi-0002za-O7
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 13:07:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1l2HYI-0001a6-3h
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 12:45:55 -0500
Received: from mail-bn8nam12on2129.outbound.protection.outlook.com
 ([40.107.237.129]:51169 helo=NAM12-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1l2HYF-0003o3-RC
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 12:45:53 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=btHhvtJGQf82T3ydzbxhBZVx20hDsK/w8EBfwZRn6V6ai7t9ryoS4mpGNrOT/yQTDvXeBJ1ruPnRCKeRMnRrlhBV6rgGgZMgS+P+5kYSsN1gLPHEIARI30mIs0PVXKpWXesUpV/pS04OQ5rAET9bEe3b5TCpFNkMLz3+pVS/yfMfyOpOe1vAP8qhUh2mSK4tbrIBtFmQ0HV9N1O58fnV/tEA1BuNvfVXua/f+l69XYEyxukzQmmQNdOdDnFe+DldjwW9R9pwfepbwjhB0dQngywVdkto7C4pMKTOPZUzni88cHgJby0ShadI17VH4+ayh0qUK/4q2B2slNtTrXXx6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oo6IHh+X4/6fqDol/gGkCwHUM19DBsF5BOSmYYUFXd0=;
 b=ZsRd9ez9BLBJ/C3U2h1Kim4V9unahS8jDaEdSof0f+PlO8HJYM0xAcEfjtcxQpBZZTuUchFDIuHWr3LEhS4nqaXJfYu7AhuybG8yZBe4Bv6i6rxddDi5Aj8hYhp6MZognVliCHO9w4hPLxatShzg/uFqVxkvbfkJYCioA1P6roc75MN7zgha6/XzTrlGcqpFGE92xUKkJEqxXoCcnH3EL1+BApXVfy8Kc4Ky1YsEja6sbPnL0xWHEoOm5m0UG0V2vTXfyENIufr1/x3TH423mxAMkGMR9cONAdNqrhICoxknsycgsy5WQaG29CoeSQMIvVF2m/SejUGcVxo3GswLDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bushare.onmicrosoft.com; s=selector2-bushare-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oo6IHh+X4/6fqDol/gGkCwHUM19DBsF5BOSmYYUFXd0=;
 b=ro6uxYUiEY4CCZLhczgsblVLwRqnRLaw1OEX8VRY7cRvt13qMxbLlHnc+eu3uQRPHsmi1x5FL72q5ufX7cUm4pl12kDZ9tPSmNVpJIU0R7RTeBBNjZqXqxVBzKcVmcMB2uENB8NTi99Xs71FDKvewhYFrrES1fi9u8heq2wkBxI=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SA2PR03MB5835.namprd03.prod.outlook.com (2603:10b6:806:113::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.12; Wed, 20 Jan
 2021 17:45:25 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::e828:cd84:e00c:6310]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::e828:cd84:e00c:6310%6]) with mapi id 15.20.3784.012; Wed, 20 Jan 2021
 17:45:25 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: [PULL 7/7] fuzz: add virtio-9p configurations for fuzzing
Date: Wed, 20 Jan 2021 12:44:56 -0500
Message-Id: <20210120174456.275312-8-alxndr@bu.edu>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210120174456.275312-1-alxndr@bu.edu>
References: <20210120174456.275312-1-alxndr@bu.edu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [72.74.210.193]
X-ClientProxiedBy: BL0PR05CA0005.namprd05.prod.outlook.com
 (2603:10b6:208:91::15) To SN6PR03MB3871.namprd03.prod.outlook.com
 (2603:10b6:805:6d::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from stormtrooper.vrmnet (72.74.210.193) by
 BL0PR05CA0005.namprd05.prod.outlook.com (2603:10b6:208:91::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3805.5 via Frontend Transport; Wed, 20 Jan 2021 17:45:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ba2f4aae-3746-4ae1-a2d5-08d8bd6b29ed
X-MS-TrafficTypeDiagnostic: SA2PR03MB5835:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA2PR03MB5835AA3206F1999D21524163BAA29@SA2PR03MB5835.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: j2MHnDgbSedh6csFxkfZY/93cfrahdiFXR6XW604OEEi5O/xwEB1tUTqoMmVIE2GsKgDxUo6hcfRPrsUW5wwdqPDneyL35QH5Bt+/BGXQGBGqk+q+jozrdDrixrI617ozTuKWdWR0oEGzW9Xf0aY8fUbcdg+jyMSChUsOXhtnMEm+DRxCmPJcpnVKHvovRqbMsLDlhqTCbUAYH3OLGYrlK5DreK5xN3Y3dNUAbCyoh4DcH3y/Dra4wLWMxNYlF0lHU4XzKX6jdlfXCqIYX6lti46kpKRQ01O0tx2NHogOpKhfTEtyZK2N0MrrcokFP9X0e1/Sh4kE3BZ7sFuaYch+0n16LSqtpw8I/XhiC64REsahhC1h9qVQRQ2VOHbl+EsTNOrABWZMhjgOCYqexq1QaJSVOZBRTjUhlLAMMmDeQ2iQPHQCdiD6trWAggDGcuBl/tY96r9rnVodAlB4e/1RLU5NycBPBWGs5TqbRYoHGB2sdJQAN3o8YAF7g3jQWoCBd+4LJIW5J3KcRqWrWlfQw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(376002)(346002)(396003)(39860400002)(8676002)(52116002)(4326008)(2616005)(6512007)(6666004)(956004)(54906003)(75432002)(83380400001)(6486002)(5660300002)(16526019)(186003)(1076003)(6506007)(26005)(8936002)(478600001)(6916009)(316002)(786003)(66946007)(66556008)(66476007)(36756003)(86362001)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?spg1JxQPY07+Eppxnwgv7r93v29lWaDZ//Vjkr2iu35naCUwlOM0QfBWWDo0?=
 =?us-ascii?Q?3HqOw7ZxwxEpobvb2t/veQuO7qp7t9m+m3uLCOjc3JeS9hPl34qboRWIJkB5?=
 =?us-ascii?Q?78hrJgK5KTBlawWH2rqtncM6b/QavGeje7fO5JN3vV4JlndxLQNX3349nGxs?=
 =?us-ascii?Q?CyhX19L5GuYyFRst7kXFndZBqs4fASKI/zKY4oXkhLpbVSX+7sF7ea0cg6cG?=
 =?us-ascii?Q?cz9DNk2YyYbUSGACWjlBfqNJL9rZh7zC1fZNVVGQDZvqHlIsNpp+g7H6kfiz?=
 =?us-ascii?Q?UC++RWRFp6IplXorlDIBylqpHuKcoXbwp9n/RDUY/6KfbG5RzQDF8P1VcUkV?=
 =?us-ascii?Q?/Fx9+b+ywEOzSxILR6vaAI0KvYvJzh6+cEwRl9UJvJ+MnfmmIt6Xg1Z2f/Gq?=
 =?us-ascii?Q?8oPzC7NoOnYv08KH1TSldjCBbrVsXwSaYz5SnXsZpvP4JjtK0OFz4Jx7RS/C?=
 =?us-ascii?Q?Qo6FQE4LLZmfp/YaawOc4urCmaqqv8yZ04/5jFWuP36sqexLWWbCN1oSGYK2?=
 =?us-ascii?Q?/oW5zLFsYhwAzuZY5nwQDvRLAwQiTs8D/vjglq50F2EWcS7Ug00W/gXuJYhn?=
 =?us-ascii?Q?1DQe0heC/VUYfZqU2AB/k01JLrr6PE4kv0IA1RZX5L9exKAMWa0SJCnIQk66?=
 =?us-ascii?Q?vzyAdQHMixjcEc//pLuFeImwjLZ9ygVhMpqxODdqSu4KBSiYhxC/800WmO9z?=
 =?us-ascii?Q?SErw4lpjXdtSuNJgI9D42RypjDRqSTfjo0YSiO7l4mp1O4eQwVdoIW2A43X2?=
 =?us-ascii?Q?l6q3ZIT5yaVmLprMlj+rqBRs3Yb6M17lBog0r7ogUreBJ7neFTkJjnnGju0h?=
 =?us-ascii?Q?Zi/FXfMhzaGfEbLip5B5cOVyKWbuOHWEd5svkkVNvvy9FEin215tJNVOG/Kx?=
 =?us-ascii?Q?XYqw7osmg+oPpRSbxBrahc7aYcLmsZA4uSl8tFteFIgh9BuucXScE6B/DPkr?=
 =?us-ascii?Q?j3M8DN5A8Q7YMZX2HRqcbVBMJ/4wPcDuU99B9/haYu8+oO3JXkLyKterb3G7?=
 =?us-ascii?Q?bNTS?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: ba2f4aae-3746-4ae1-a2d5-08d8bd6b29ed
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2021 17:45:25.0636 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t+xLVY7xyloM9N5EXVPPT25vuzyzBOFlE3cmgyWR3vo7Faw9m52AxK/Vt/sr2Qf2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5835
Received-SPF: pass client-ip=40.107.237.129; envelope-from=alxndr@bu.edu;
 helo=NAM12-BN8-obe.outbound.protection.outlook.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.998,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Darren Kenny <darren.kenny@oracle.com>, Alexander Bulekov <alxndr@bu.edu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

virtio-9p devices are often used to expose a virtual-filesystem to the
guest. There have been some bugs reported in this device, such as
CVE-2018-19364, and CVE-2021-20181. We should fuzz this device

This patch adds two virtio-9p configurations:
 * One with the widely used -fsdev local driver. This driver leaks some
   state in the form of files/directories created in the shared dir.
 * One with the synth driver. While it is not used in the real world, this
   driver won't leak leak state between fuzz inputs.

Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
---
 tests/qtest/fuzz/generic_fuzz_configs.h | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/tests/qtest/fuzz/generic_fuzz_configs.h b/tests/qtest/fuzz/generic_fuzz_configs.h
index 51e69c6e42..5d599765c4 100644
--- a/tests/qtest/fuzz/generic_fuzz_configs.h
+++ b/tests/qtest/fuzz/generic_fuzz_configs.h
@@ -19,6 +19,16 @@ typedef struct generic_fuzz_config {
     gchar* (*argfunc)(void); /* Result must be freeable by g_free() */
 } generic_fuzz_config;
 
+static inline gchar *generic_fuzzer_virtio_9p_args(void){
+    char tmpdir[] = "/tmp/qemu-fuzz.XXXXXX";
+    g_assert_nonnull(mkdtemp(tmpdir));
+
+    return g_strdup_printf("-machine q35 -nodefaults "
+    "-device virtio-9p,fsdev=hshare,mount_tag=hshare "
+    "-fsdev local,id=hshare,path=%s,security_model=mapped-xattr,"
+    "writeout=immediate,fmode=0600,dmode=0700", tmpdir);
+}
+
 const generic_fuzz_config predefined_configs[] = {
     {
         .name = "virtio-net-pci-slirp",
@@ -60,6 +70,16 @@ const generic_fuzz_config predefined_configs[] = {
         .name = "virtio-mouse",
         .args = "-machine q35 -nodefaults -device virtio-mouse",
         .objects = "virtio*",
+    },{
+        .name = "virtio-9p",
+        .argfunc = generic_fuzzer_virtio_9p_args,
+        .objects = "virtio*",
+    },{
+        .name = "virtio-9p-synth",
+        .args = "-machine q35 -nodefaults "
+        "-device virtio-9p,fsdev=hshare,mount_tag=hshare "
+        "-fsdev synth,id=hshare",
+        .objects = "virtio*",
     },{
         .name = "e1000",
         .args = "-M q35 -nodefaults "
-- 
2.28.0


