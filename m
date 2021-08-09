Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E050D3E4487
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 13:18:04 +0200 (CEST)
Received: from localhost ([::1]:54228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mD3IB-0004DS-VU
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 07:18:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1mD3Gt-0003EX-Jf
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 07:16:43 -0400
Received: from mail-mw2nam12on2114.outbound.protection.outlook.com
 ([40.107.244.114]:24551 helo=NAM12-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1mD3Gq-0000uI-UR
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 07:16:43 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K/Hg1vYFgs9RWFMngTnpwpk1dg9mKt0bQNWC7diNpzCj4BLVddP0wA3tyLwD6HhTlRuyh6XeuuEGLBZjEl/dk72rTm/juNgqWNVT+0iyGEOkpagOkTl4qmXN7I8SrrCGy4NzRuKwlNB/i7ZTdsPEC9IxFkF+qx+BiZ5rs4OMdiguG/AjOhxk5SxrT7PiRFsP5QRiUM4r86Brho6CAjj0knpsZkZnVSwsXwdhbjBRMWrpa4AufcjFLOKQi5nRP7w+xegVY1sfRD8ak7MF+n6s5YB/o3ytBnMedrg4Vdvirh0ArEf6PtrEwJ5fA3TSec0ese6usk8jywgfGDPWnblgew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VmxVXTlhKRSVnBPjbYjITDBgqAPq0Hbi/ev7/nfp2ys=;
 b=c1QjECybYQOv6h3W1a+QjJXTUqjlFCBM0KOvbpOazMTFDXC7pE4z+FSoganZTcai/j1WgXtlkKqrTZZ9l79gm6RsXfoOT6wIogPd6GcY1v4QP11+A25gwx3DKIAruqrHwPW9xaiQOINK6gDjcoqDnVOpwNmWUtHafothSbEgkcjCc5NJtdJtQ2KJBG9AxdnqOwrAOJOSN4Hy6qcaomZ7yd+VGDBO/CIrohsleKXX/R6fu8Y+F7zWiBNGJsoxFO7LRKvJxgo5Qy1vx8CNTYHii1mu8rXBms50qBgVOy9knOl+zvstmIxu/E7A0Uu4FwB9uR0nI0ES8NdD4Lox7905Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bushare.onmicrosoft.com; s=selector2-bushare-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VmxVXTlhKRSVnBPjbYjITDBgqAPq0Hbi/ev7/nfp2ys=;
 b=X5YOkuJVEYgGTv2bgB0Hg7almV/jyLnQWNkXnFt8yIT3eXNTscY8Vqg7885Gm9k/NQBoXbYRwpp+Gjk1d2l34rnRpdVVMqX0hT6whsNS32dWxn/safxGLF6v3d82InEY7uM1e+lwt/4AWDlUbPvGox8re6bsLolVlC50E8IXh/Q=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SA0PR03MB5593.namprd03.prod.outlook.com (2603:10b6:806:b9::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.21; Mon, 9 Aug
 2021 11:16:36 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::f6:2ec0:d576:8139]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::f6:2ec0:d576:8139%7]) with mapi id 15.20.4394.022; Mon, 9 Aug 2021
 11:16:36 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: [PATCH] fuzz: avoid building twice, when running on gitlab
Date: Mon,  9 Aug 2021 07:16:21 -0400
Message-Id: <20210809111621.54454-1-alxndr@bu.edu>
X-Mailer: git-send-email 2.30.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR10CA0010.namprd10.prod.outlook.com
 (2603:10b6:208:120::23) To SN6PR03MB3871.namprd03.prod.outlook.com
 (2603:10b6:805:6d::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from stormtrooper.vrmnet (72.74.210.193) by
 MN2PR10CA0010.namprd10.prod.outlook.com (2603:10b6:208:120::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.15 via Frontend
 Transport; Mon, 9 Aug 2021 11:16:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b0289e17-83ce-48ca-7394-08d95b272697
X-MS-TrafficTypeDiagnostic: SA0PR03MB5593:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR03MB559318C2C53812926B1580C5BAF69@SA0PR03MB5593.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: v9mbheKDyUAHxh25XP4C9mlAiinepi8kW/RdGHccyxeIK4TioUANETKT2ngxmzQrFq6NamogGBf9GSlZqBwJwPOifCBRRebUgvlxCi0X0BbrgT/CXH0pFHOypEKpA0XmU60DwewJO02yj/z97PiWZmUi3QilfS1o3U/rdtR37cr31aJvGVvgZ/y+Vdc41B4fuXIDOWChtbLaZs1E+QTPYzSAt8s3TVyKDmxnZMuB4OrEX/t+oEy1fn/FK8zLamZ7Z1EXytoBBA/A/o6hR8vxZ07DR6S5eWE4v9u78ildviTuYSjAg5mD95aknkX0x0LNYDYbHdKvyGaJ9w3gIV+Qn80cg8q6ZTC1AXun1DwpjAvY2frIPmDPIEr+MGywUYEa7/i81g76aMFAuoJnjGuWhWCyU7GmMbMPDlsb8pDaXH2OQ5smZX68kfLc66ZDwt/f3f2sP4a+n2ds7mam+AAB4kKFUJyrvDpjeLuk3elcQpkYeZ+XjTYBewLwpQ02DHokjL+B8PtUGPmJWwFEjTZddz8R1Ik+O+DeTTa/piG/tU/gkybvgT3zQjklnrsPZCInc6rzsezXxcnuraKQuwfLShdv+44g+9KAgff8KwmkaYOjaeLwbS7MOQJ6dprpFmTe+EMEAW5Ezp9c0z0C9L7xMMnuSJ9z7DsBA8CRxSFKBfBfGDlzGJECVimgCLg+C+M4GTFUkTSpy1PyscyHXTWKjw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(376002)(396003)(346002)(39860400002)(956004)(36756003)(2616005)(38350700002)(38100700002)(54906003)(6486002)(478600001)(86362001)(6916009)(4326008)(6506007)(6666004)(5660300002)(8676002)(6512007)(83380400001)(52116002)(75432002)(316002)(786003)(2906002)(66556008)(66946007)(8936002)(66476007)(1076003)(26005)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?N447ybAeoCh0Z9iBomaWWL/o6CkHtBkj77Dku8iPKq0+PCbokMc8Sl3KZhOP?=
 =?us-ascii?Q?3cGftJvDnnhknk15OKhZYZDAYw72oeAR+JJbYq7aN8eXecySvyxEnz7AymCI?=
 =?us-ascii?Q?f8XyX2Uvdb39zTYVB+jVgp4bSLDXJPC+/W5dHMnJY5Nbb9rdwnWehTPD/UMm?=
 =?us-ascii?Q?l4dtCNHOklqnskr4Xo9Ri72dMH/pcaDaLDDFANoqRQjkMk3Zt+ujN9OikoOS?=
 =?us-ascii?Q?RtMybohlsTomKKwgGWaB7Bdrgd+jxq9aLlDTtYKnkBCj40HYAS4j+Ef+P14v?=
 =?us-ascii?Q?e1TdUo+LyMiQ4c93d9xpb5YVcCwtaj408S4e2/5JoVuvSn1gFVPDpVtBgtUp?=
 =?us-ascii?Q?ASeAIZLKonORgVHlr4v2HgPLU0oEc5SYOnXJRAssr8AZfyMD9/rY7irZmpx6?=
 =?us-ascii?Q?loiS1BXW4b4AeFSxZyBUpBmVV+nCv52L3j1+9DdIqjT9tX3DGTI2yoIo/uuk?=
 =?us-ascii?Q?RfhiwHyq1e9/XWIPhzw/IvOHiVoFGLLI1pbfQyHtCAVEoEJcP2uhykK+t/mN?=
 =?us-ascii?Q?To+iRRxHSgNvbu/yjgnY3GQZI4fPV0EKvmOfD1dHbJuw2AUONA5w67M4nbXj?=
 =?us-ascii?Q?uw6sc2aVcPrCsEUfwQE2SscCoRNu4w04fpeUJKZ3+SxmEG5V18rZt+Ye7NtT?=
 =?us-ascii?Q?nSRr5Kni4i+eejrMGL1tiJmvLfSew9eli9YWAaTSiY8q+bM+nilWgnPmqCwr?=
 =?us-ascii?Q?79gGo9HMT4rZacCa4xltNWDBivnJe2GVJldzkAnfg8RxRlck4t0cslKD832i?=
 =?us-ascii?Q?vUPLP3mfqOjy9g6ZbOAZa6vfaWJYTE3YywEFVmxT4yNbxjJs/XUo7JjleYrk?=
 =?us-ascii?Q?j4hFnBvYUcnk8Mu3xbVayHLCjZKm8XQ9G5jgmP6SGhrgHznQKO/vH/2I2OC1?=
 =?us-ascii?Q?wF5EFN9cn3F9Peb9+C56yN4/+sZJGxkQYpTh7GLBqGZuoeT4dFL+jNIutmuT?=
 =?us-ascii?Q?HpWLBTPvQ0Ge9b3acW+WW6AVhrpVeqJDTkJik7IZex4R2LKBp8HzQ0LI5Gwq?=
 =?us-ascii?Q?hArJfkpHooIMMUHWKGg7wdqCBSZodyFNB0ZTFq3NyxYUNnQgg/H3ciYLuRxl?=
 =?us-ascii?Q?yERgXJBkA1b7iBRmu4wQFfguBV9wkeThMrLjCmq9S0MNyXHyrIXPwZGSYw06?=
 =?us-ascii?Q?fWdlBiJucTQSmoLhQ8X8gWMP5WzVpz5RKA9Jb/64IY5kveiHCr4lp/F4LDnG?=
 =?us-ascii?Q?g8ENEGxsgcIuT+BYPKpncsxrDI3/asjOvARvwqhK1CHlfUhuvreL2FoZkwi/?=
 =?us-ascii?Q?dPu9uKLkFbwNjwSIk/exuYBZMLE5kzN6ejCN42qNLCaufRduHOVcxAtt9of2?=
 =?us-ascii?Q?uuCfgEWPTAiRsP2KKszEsXcS?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: b0289e17-83ce-48ca-7394-08d95b272697
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2021 11:16:36.0776 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x1MC+Nyv0Y658iRPIO08jNXYNVIfJ1P7meRiV9J77LafXh6G+gr1Y0quiOwK/+bb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5593
Received-SPF: pass client-ip=40.107.244.114; envelope-from=alxndr@bu.edu;
 helo=NAM12-MW2-obe.outbound.protection.outlook.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.001,
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
Cc: thuth@redhat.com, berrange@redhat.com, cohuck@redhat.com,
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On oss-fuzz, we build twice, to put together a build that is portable to
the runner containers. On gitlab ci, this is wasteful and contributes to
timeouts on the build-oss-fuzz job. Avoid building twice on gitlab, at
the remote cost of potentially missing some cases that break oss-fuzz
builds.

Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
---

From a couple test runs it looks like this can shave off 15-20 minutes.

 scripts/oss-fuzz/build.sh | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/scripts/oss-fuzz/build.sh b/scripts/oss-fuzz/build.sh
index c1af43fded..98b56e0521 100755
--- a/scripts/oss-fuzz/build.sh
+++ b/scripts/oss-fuzz/build.sh
@@ -73,17 +73,19 @@ if ! make "-j$(nproc)" qemu-fuzz-i386; then
           "\nFor example: CC=clang CXX=clang++ $0"
 fi
 
-for i in $(ldd ./qemu-fuzz-i386 | cut -f3 -d' '); do
-    cp "$i" "$DEST_DIR/lib/"
-done
-rm qemu-fuzz-i386
-
-# Build a second time to build the final binary with correct rpath
-../configure --disable-werror --cc="$CC" --cxx="$CXX" --enable-fuzzing \
-    --prefix="$DEST_DIR" --bindir="$DEST_DIR" --datadir="$DEST_DIR/data/" \
-    --extra-cflags="$EXTRA_CFLAGS" --extra-ldflags="-Wl,-rpath,\$ORIGIN/lib" \
-    --target-list="i386-softmmu"
-make "-j$(nproc)" qemu-fuzz-i386 V=1
+if [ "$GITLAB_CI" != "true" ]; then
+    for i in $(ldd ./qemu-fuzz-i386 | cut -f3 -d' '); do
+        cp "$i" "$DEST_DIR/lib/"
+    done
+    rm qemu-fuzz-i386
+
+    # Build a second time to build the final binary with correct rpath
+    ../configure --disable-werror --cc="$CC" --cxx="$CXX" --enable-fuzzing \
+        --prefix="$DEST_DIR" --bindir="$DEST_DIR" --datadir="$DEST_DIR/data/" \
+        --extra-cflags="$EXTRA_CFLAGS" --extra-ldflags="-Wl,-rpath,\$ORIGIN/lib" \
+        --target-list="i386-softmmu"
+    make "-j$(nproc)" qemu-fuzz-i386 V=1
+fi
 
 # Copy over the datadir
 cp  -r ../pc-bios/ "$DEST_DIR/pc-bios"
-- 
2.30.2


