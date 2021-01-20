Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DD6C2FD762
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 18:44:40 +0100 (CET)
Received: from localhost ([::1]:35086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2HX5-00078x-H1
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 12:44:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1l2HPa-0000S2-K0
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 12:36:56 -0500
Received: from mail-dm6nam12on2125.outbound.protection.outlook.com
 ([40.107.243.125]:3041 helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1l2HPW-0002pJ-Vu
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 12:36:52 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SR7BXEiGa3Ss/siNemIlsvtNjtmvA//K7q1vEeKsDJ7BeC6xMxyf013h4SPPwtgNfY9YBcepyOcf3UqPobE1yCuZoIFvOmY9ZswxMRSiEWbEN587fucg7lK0E7F3rxWrKt/Z6a8m/Qodq60WyXcQcAWQjU8JFFQpTX7ZOJLOuUt72XM06yFfMGTlLxdK7kq6Y/7Ohp2xt6RO939SrEwVUjBGhJP6X+0WO4EbsxAQJJrDhwJRt7Yd/r+FRCQ/Tf2fc4IXMI4xl0incY8bQ61S4G4vccOXs0Pj7l9su6o8YWDZ6tamphrLXs/AqCro1yPM2QK8zdg0fK82Kd3ok5aLOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WqAwlkspqsgt5zHVblhrgNjK0N2JsJJYSNl6xVI8XjA=;
 b=XyFIrn2TwgM7pwUYcMvIoSFylANWV37TluXrS5VYPcm0vdiOqzx46Pwn31X5neC42kCx+ePIJ5J0yCZ+ViKZMDyCrAxE3FyNnIcPIC8LGOIRw8K9cQ9jbpfh9tbBMi+MbXXGnotKqmkwC1ixeEM3ljtdcUt8dY/nuA6/rZsoGYu6Id+7NvnNrpNi9RFbWjSa3mg/sYMLDWXRjpyvv5I5UJCU3nnxMc+q+AtNZCAm+5/ZpJx5Uv7IxCLiNpoFLdm5s+YeRwuN6k5PKy8iO9Oky2kdDI/xtTpOj4vXSHEvDFt6FK9eYjjTOs+6hNDHMEGKA9wlilOUXQBL1rmO4/rv2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bushare.onmicrosoft.com; s=selector2-bushare-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WqAwlkspqsgt5zHVblhrgNjK0N2JsJJYSNl6xVI8XjA=;
 b=KeqFeW08gqGL0Y6yr2wmXGEOcPNCX2aidW0ujKVddOdeN+OULc8ciN9vebIBc8AOLn43h71mGReL+YZKyf8T7XjsRlAXk0yNrGwqPY4JlvizlBCalhoUuWMvfhV/cgr9ZGGGq5RCZ/zpXYkLGYserqiUz1URR4yigcasRPYU8dA=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SA0PR03MB5530.namprd03.prod.outlook.com (2603:10b6:806:b0::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.13; Wed, 20 Jan
 2021 17:36:42 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::e828:cd84:e00c:6310]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::e828:cd84:e00c:6310%6]) with mapi id 15.20.3784.012; Wed, 20 Jan 2021
 17:36:42 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: [PULL 4/7] docs/fuzz: add some information about OSS-Fuzz
Date: Wed, 20 Jan 2021 12:35:29 -0500
Message-Id: <20210120173536.265601-8-alxndr@bu.edu>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210120173536.265601-1-alxndr@bu.edu>
References: <20210120173536.265601-1-alxndr@bu.edu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [72.74.210.193]
X-ClientProxiedBy: BL1PR13CA0142.namprd13.prod.outlook.com
 (2603:10b6:208:2bb::27) To SN6PR03MB3871.namprd03.prod.outlook.com
 (2603:10b6:805:6d::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from stormtrooper.vrmnet (72.74.210.193) by
 BL1PR13CA0142.namprd13.prod.outlook.com (2603:10b6:208:2bb::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.8 via Frontend
 Transport; Wed, 20 Jan 2021 17:36:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a9980514-9ae3-4c7c-6f97-08d8bd69f2d6
X-MS-TrafficTypeDiagnostic: SA0PR03MB5530:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR03MB5530BD23FBB62C5748090885BAA20@SA0PR03MB5530.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zAFsCH69VLW8eOcPaVg4GgFirQ9kpjy2keBX6mcxi/2jLXGowz03r9i2IDGXvIS2umOsKgTVwB2o4PuzQ3sXpAZZEr3p4InpUAPaYKLy18tju6Qr+CrKGYomuZS4H0ZRFKnv1miBF9n9/etJOyYrOhFRtOcGkqv4JEH3/oeFreHJYkF9PRvmwQmsjHBBQLABosdjCJzWKFsTsvn04MeuRJqyuDb/HlcnB7Y6vKzHEQIVP7gxMEsK0KG6L3CcuB0kYBTeSIvGgQkz0hhQo9DAYv+iQxa8xFH0UhtpPC6FumcvRcW+cPCdejG4iTD50FL1Zr8YBGHd/DXfU63/RLuop711Gr+elENyV/IpYBfUaV1qVnHLeHhGFT/Kx/McwQBmKf2cICNEh1RYJeG6yStfESyJdSAHUV2yhAzA7C1XGLe/os7m4BmkheGlU1k1Nbe6ZApaOHWOj6S2geowJzbAww==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6666004)(8936002)(6512007)(66476007)(6486002)(8676002)(956004)(5660300002)(4326008)(2616005)(1076003)(75432002)(2906002)(66556008)(86362001)(6916009)(52116002)(186003)(6506007)(16526019)(498600001)(36756003)(54906003)(66946007)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?EKk/ahw1VGioSdh+XweWayJMZC05ps27fiXRozg8mIH59RPpZ2H4u4gN3MjL?=
 =?us-ascii?Q?+GgV2N5fStIce9E8ZyKpKK1wPznIUAPihXFL+tKIjhyfUfpbeAR2K0XAv1C3?=
 =?us-ascii?Q?Brx1mChXUq7A12GU1fqn6ZYQq4Sa/ckQZVNF0hAKbetfZW+0on3XA9OmtkhU?=
 =?us-ascii?Q?67lQbSsdk5EA10a7EhgIdqCJMZHtv6xNSYQgDAkUNet5Q++/wOa+twutx8A1?=
 =?us-ascii?Q?znYUns0xn0qnNU/0QvMqrlAYTYZy/6iM78kCqrWvHEjfFkQOsxDXMIpfmwbx?=
 =?us-ascii?Q?y+kFA+/4SuM5JIbwo/KFR6ymcvO4xfYc3yCAKhKdrFTLV9oXw2IfgtlqzW+k?=
 =?us-ascii?Q?UCcD5gey6ES+FajT947l8EiGLly1HPKVbXL/dNIy+oDCIjKbk0Usf81R42t+?=
 =?us-ascii?Q?DlO1sPdANlu6FesCUBCNoNFWAznsxPRmblqjnoMUDN3xqzQraOcSprtQuNdj?=
 =?us-ascii?Q?0iq4XMHDL0qZym0GkrE8hgZ9BurRbPm3TEzqiIKyBWFTpmR+VU46yet5USKp?=
 =?us-ascii?Q?g8wMlRBw+lvUUlfAhsYJar0F6UjTT0vShZzP3uipR/9Jr+6foCEpkCV0cVLX?=
 =?us-ascii?Q?wKqbTrIfBCoZ+x6gmSIfLh1ptLht9SD2Y7i3HXifoZAVyVYrPkcr1ki4OAdo?=
 =?us-ascii?Q?IOlo/KXEI8TF8oqjc3A5qnVBC8cXN4D3qdDr1oMF/0mhYEdPwidX9HgEWJEX?=
 =?us-ascii?Q?ybmzxqAtbvfBi+NMrNfQzTCr4UoLkwQZKQ/TRRLR/YvuyRYKVGVmeae9Z7x2?=
 =?us-ascii?Q?qubvSjphR9aJx4Fs91vvcZnvwJH3y9M3waV3peoi9YOKhTPuAZayCOl5e1MP?=
 =?us-ascii?Q?m8uTi7Sl70DgsuFvDzBJxBv8cj1WDjfcGcT39FVj9BgI/iIMur8vr/MwSxop?=
 =?us-ascii?Q?HNKWwKNubTZ8u4Go0IMFU2k+G48SzXEaLfVY4xOHbJcQMotPJWk1i5fLdSyh?=
 =?us-ascii?Q?0aYp+SALzn4XfmjQRMMJQQE+wcOW+PQ5bfOR8hgXYnCLxDgDjJrL64Jbx4R8?=
 =?us-ascii?Q?wt0X?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: a9980514-9ae3-4c7c-6f97-08d8bd69f2d6
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2021 17:36:42.4245 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mePs/OGDszRlCDDu9t5TvUiv/VYLPcVb1AYiLDPSK4Jol2CEwCQBiDbU73sP9DFq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5530
Received-SPF: pass client-ip=40.107.243.125; envelope-from=alxndr@bu.edu;
 helo=NAM12-DM6-obe.outbound.protection.outlook.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Darren Kenny <darren.kenny@oracle.com>,
 Bandan Das <bsd@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
---
 docs/devel/fuzzing.rst | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/docs/devel/fuzzing.rst b/docs/devel/fuzzing.rst
index 5f5200c843..b9bb07988b 100644
--- a/docs/devel/fuzzing.rst
+++ b/docs/devel/fuzzing.rst
@@ -180,6 +180,32 @@ To ensure that these env variables have been configured correctly, we can use::
 
 The output should contain a complete list of matched MemoryRegions.
 
+OSS-Fuzz
+--------
+QEMU is continuously fuzzed on `OSS-Fuzz` __(https://github.com/google/oss-fuzz).
+By default, the OSS-Fuzz build will try to fuzz every fuzz-target. Since the
+generic-fuzz target requires additional information provided in environment
+variables, we pre-define some generic-fuzz configs in
+``tests/qtest/fuzz/generic_fuzz_configs.h``. Each config must specify:
+ * ``.name``: To identify the fuzzer config
+ * ``.args`` OR ``.argfunc``: A string or pointer to a function returning a
+   string.  These strings are used to specify the ``QEMU_FUZZ_ARGS``
+   environment variable.  ``argfunc`` is useful when the config relies on e.g.
+   a dynamically created temp directory, or a free tcp/udp port.
+ * ``.objects``: A string that specifies the ``QEMU_FUZZ_OBJECTS`` environment
+   variable.
+
+To fuzz additional devices/device configuration on OSS-Fuzz:
+ * Send patches for a new device-specific fuzzer
+ * Send patches for a new generic-fuzz config
+
+Build details:
+ * `The basic Dockerfile that sets up the environment for building QEMU's
+   fuzzers on OSS-Fuzz
+   <https://github.com/google/oss-fuzz/blob/master/projects/qemu/Dockerfile>`_
+ * The script responsible for building the fuzzers:
+   ``scripts/oss-fuzz/build.sh``
+
 Implementation Details / Fuzzer Lifecycle
 -----------------------------------------
 
-- 
2.28.0


