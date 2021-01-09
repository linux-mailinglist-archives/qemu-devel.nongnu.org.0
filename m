Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC572EFF70
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Jan 2021 13:31:50 +0100 (CET)
Received: from localhost ([::1]:57412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyDPJ-00041b-62
	for lists+qemu-devel@lfdr.de; Sat, 09 Jan 2021 07:31:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kyDL3-00080x-0j; Sat, 09 Jan 2021 07:27:25 -0500
Received: from mail-am6eur05on2098.outbound.protection.outlook.com
 ([40.107.22.98]:57153 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kyDKv-00067J-2Q; Sat, 09 Jan 2021 07:27:24 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KDpuFcYPvR3FF2jYLvrzQ4Hr7oSawQfF27x6spgJelhhlsVELzieyPIwT8GQh5Cp/41fKBSRwmtQXE95YaXNKwURtdgkjqgMDlHPd4mUx6Zjm75nQYkWbRtv+2b4wDICCaZ5GI+3jnc0J4D78cql68jGewiYioMNziprMY0a9B7yvRwdvuYafgwykM9JWxDWVuiHi8h9uj/Pgf50PdaZAkZIWKPZuC+HDJP2YFGleuU1glx7Us3hb0aHny4ZV/eXIPZvQGQSaYH+mZUKRTruk6DHLxPsIjT19wAGpqgHP7x/UKGrSw6iuaBXJR1TEGxCS894Y5U2uCa3cEFK5tSKwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8W8HWgbbSK9uPFjQw0EqnNiknpAHayCofLkMqtURmXI=;
 b=MWMUPY3OYOE+/+fstJKwHPhTnolWDktnrW7jZecd3FNU/TjuCA7th5MNsDRuLamHvavpEemSaf7OfAGpjGTz/p84uEYTU4eOAyNqPmWFZBsww6vTjEkgE8+40DxzLspWbItdkTGnGr6yYkpoQ6DKdAgj5q9YbA6xcYIooC6PCcA9cMkQOkb67D9T3myVZcDW1L4krH9aBRIwz74kcGFGoh/aZN875pN44bHEGtou26APpNPLyWyZrVny7ArGQxvhvBvIls+scdPI6IEatMnDyEHrNa8Ep/uKn59FYhUUyV/5OySdV2bLivWAyiOjXbNZiBl7YONeDvlJ6SnH5532SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8W8HWgbbSK9uPFjQw0EqnNiknpAHayCofLkMqtURmXI=;
 b=Gj3HVnh6RTuZcEwMSsU7+XEO0pV/zQc/lFx3KxM1CiC3uzLiSM0eeYx1fHsJNkOJST/7mFKDDxPG8caYZTc4OXRiIWASa8wTwOUgtFFeAiBP13oZ6RGclFbVukMSSY1RjU9oe89g/BR3DH8jbNY9cKAwDhQ9pAn376/hBMs+Ti8=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0802MB2529.eurprd08.prod.outlook.com (2603:10a6:203:9e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.11; Sat, 9 Jan
 2021 12:27:03 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%7]) with mapi id 15.20.3742.011; Sat, 9 Jan 2021
 12:27:03 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v6 00/11] Rework iotests/check
Date: Sat,  9 Jan 2021 15:26:20 +0300
Message-Id: <20210109122631.167314-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.119]
X-ClientProxiedBy: AM0PR02CA0217.eurprd02.prod.outlook.com
 (2603:10a6:20b:28f::24) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.119) by
 AM0PR02CA0217.eurprd02.prod.outlook.com (2603:10a6:20b:28f::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend
 Transport; Sat, 9 Jan 2021 12:27:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a65a4a2b-256b-4b0e-f2dc-08d8b499def5
X-MS-TrafficTypeDiagnostic: AM5PR0802MB2529:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0802MB252955DCB73C9E7747A5266DC1AD0@AM5PR0802MB2529.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: e4TUL/58BYW7tjVXHcyv5zcr9CjPA0N4Ks2n7oVllKuQ8bOL03GpsDXGe/QXFGGvQbXAVxuikOCabmeR12dMd8y9pvhqt0Ix9CE6R7fNLkpJK2by1X2piyhH27MDV5NbsyBqo3hWN3CjuLCFQCLWJ8vue5/hMXPXKGHuAIa4jxG5P9K8amCwYFVJ3yGogbUl92TckltjBQ+UBwFeRzeQZECcGteqz828U/o6lYWaNufHfLsvfkRUFwL8o05kNQ4KPl/9Abch0U5vsFpALuiQs07miYVq3m9fA5El/dMXNxypENRO3HiO+a9n7qFiKMK3jDbiQHtX+237GVVAo8zXdLMmlyK0L6jGzV7P6YQoN+x/2f+w2CBk49rSawBtBWANnsaDeRbBxZPGJyGuM0Ftxg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(39840400004)(366004)(396003)(376002)(8936002)(6666004)(1076003)(6506007)(52116002)(478600001)(30864003)(2906002)(8676002)(16526019)(5660300002)(186003)(26005)(36756003)(66556008)(66476007)(6916009)(66946007)(2616005)(6486002)(6512007)(4326008)(83380400001)(86362001)(956004)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?UukIyOrvrvDc0Ylr2WNC74jFfKDwUqQM+V730CAyPlxTqG4gBSdZiHGoIIMK?=
 =?us-ascii?Q?9p4+o3iYS8G1MTR+uSuiIWl5THXIAG9idBZ5nMFm8RHtphaNe6UInDye7kty?=
 =?us-ascii?Q?UYZFSuOVo28hR4iT29Hh+WRam93TGqjiYEZJWvbP0EiezQGRhwFm/50t4guw?=
 =?us-ascii?Q?B6jdVvSWdSpTtIwyvSqFoH9Y/UVRgbOPJiNJSq3LWarxrTd2AlPlXS1Ws/18?=
 =?us-ascii?Q?bvAtGuG93RcK49/kgOzWBzhC4YgMRCogIRBAKT48pszDCNw5DXxCP5k33+CZ?=
 =?us-ascii?Q?J22duNu4r+TVO6sTcngQUO228h30YLP/MukEFfEWDlgZnj3nENOXsNTd2LGV?=
 =?us-ascii?Q?vYPZs6TemfridPHfZbGsrTnycfJKeDx8nXgKyYxCz3ohVk3/0XZex0Mrw70A?=
 =?us-ascii?Q?NkF9Fz6YUYefYQnD5j5vppc4tzPcnfsZwUrDmN3WBMelxUo40o8eC+smmQBf?=
 =?us-ascii?Q?7KMv1CkPRej3TVQA31jqTskQEUo2aDEz/8ielJ0gKGdmvbtJi8NE7ywmJVBV?=
 =?us-ascii?Q?ETgX2/H8ZgwbRVAkFde5APqLtXr8dQSp6xiZs5Cu23JdaqqQPj+nZVH9I2LA?=
 =?us-ascii?Q?SrqDsvrwTgo8hpRKFijdfRRFDuVmvTo1vr+r5UcY+8JuAi/3bQBEgN0v+dbr?=
 =?us-ascii?Q?QklXINjYeUMtQQL199o7bdRpuzDTWvLyPYxdpwDzbBSChR/HEX8ZXATpXY4Z?=
 =?us-ascii?Q?vkElTuGtIWRIb1b8MChc8NHEgxYWvaA+p9/wUUalqmFDXAqi88CKkja8NsO3?=
 =?us-ascii?Q?fM0YKGgDGYV/jM5mcA9fxkR3A+/hfvkfPzGiAuSJSLRNAGglv1wpifFuaQO4?=
 =?us-ascii?Q?ypqEsDu3HB8v/3kaeeu4rfRzx1Nx87WYfSgdi1Km7wlYfV3xj+JGXk8QLcDx?=
 =?us-ascii?Q?bdgjEALQHepaWH0chkXINb5UIXPQJftxxbRcBojE+kVNXrAt4cj+eeJIUUgF?=
 =?us-ascii?Q?I3yYqh3akmDRnGQA7OYXydAIpA0cSc8Le2V/HQIWGzziT3x0p1aobuqPk4Ex?=
 =?us-ascii?Q?GRWA?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2021 12:27:03.5197 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: a65a4a2b-256b-4b0e-f2dc-08d8b499def5
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kg7NpqnoXDxqLO+TORfS6Q9mxKqCKq/HokGJVyyO+ALXUhSbjgposemCO3nx+VF5rdfZwF4SwMicxBIKvneSiMoi2BE33hIo7zVbmympCLU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2529
Received-SPF: pass client-ip=40.107.22.98;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 qemu-devel@nongnu.org, mreitz@redhat.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi all!

These series has 3 goals:

 - get rid of group file (to forget about rebase and in-list conflicts)
 - introduce human-readable names for tests
 - rewrite check into python

v6:

04: condense making 283 and 299 executable into one patch. add 298 too
06: handle three more tests
08: add qemu-storage-daemon and fuse protocol

Last patch is RFC. Patches 01-05 are simple cleanups and may be merged
in separate.

Vladimir Sementsov-Ogievskiy (11):
  iotests/277: use dot slash for nbd-fault-injector.py running
  iotests/303: use dot slash for qcow2.py running
  iotests: fix some whitespaces in test output files
  iotests: make tests executable
  iotests/294: add shebang line
  iotests: define group in each iotest
  iotests: add findtests.py
  iotests: add testenv.py
  iotests: add testrunner.py
  iotests: rewrite check into python
  iotests: rename and move 169 and 199 tests

 docs/devel/testing.rst                        |  50 +-
 tests/qemu-iotests/001                        |   1 +
 tests/qemu-iotests/002                        |   1 +
 tests/qemu-iotests/003                        |   1 +
 tests/qemu-iotests/004                        |   1 +
 tests/qemu-iotests/005                        |   1 +
 tests/qemu-iotests/007                        |   1 +
 tests/qemu-iotests/008                        |   1 +
 tests/qemu-iotests/009                        |   1 +
 tests/qemu-iotests/010                        |   1 +
 tests/qemu-iotests/011                        |   1 +
 tests/qemu-iotests/012                        |   1 +
 tests/qemu-iotests/013                        |   1 +
 tests/qemu-iotests/014                        |   1 +
 tests/qemu-iotests/015                        |   1 +
 tests/qemu-iotests/017                        |   1 +
 tests/qemu-iotests/018                        |   1 +
 tests/qemu-iotests/019                        |   1 +
 tests/qemu-iotests/020                        |   1 +
 tests/qemu-iotests/021                        |   1 +
 tests/qemu-iotests/022                        |   1 +
 tests/qemu-iotests/023                        |   1 +
 tests/qemu-iotests/024                        |   1 +
 tests/qemu-iotests/025                        |   1 +
 tests/qemu-iotests/026                        |   1 +
 tests/qemu-iotests/027                        |   1 +
 tests/qemu-iotests/028                        |   1 +
 tests/qemu-iotests/029                        |   1 +
 tests/qemu-iotests/030                        |   1 +
 tests/qemu-iotests/031                        |   1 +
 tests/qemu-iotests/032                        |   1 +
 tests/qemu-iotests/033                        |   1 +
 tests/qemu-iotests/034                        |   1 +
 tests/qemu-iotests/035                        |   1 +
 tests/qemu-iotests/036                        |   1 +
 tests/qemu-iotests/037                        |   1 +
 tests/qemu-iotests/038                        |   1 +
 tests/qemu-iotests/039                        |   1 +
 tests/qemu-iotests/040                        |   1 +
 tests/qemu-iotests/041                        |   1 +
 tests/qemu-iotests/042                        |   1 +
 tests/qemu-iotests/043                        |   1 +
 tests/qemu-iotests/044                        |   1 +
 tests/qemu-iotests/045                        |   1 +
 tests/qemu-iotests/046                        |   1 +
 tests/qemu-iotests/047                        |   1 +
 tests/qemu-iotests/048                        |   1 +
 tests/qemu-iotests/049                        |   1 +
 tests/qemu-iotests/050                        |   1 +
 tests/qemu-iotests/051                        |   1 +
 tests/qemu-iotests/052                        |   1 +
 tests/qemu-iotests/053                        |   1 +
 tests/qemu-iotests/054                        |   1 +
 tests/qemu-iotests/055                        |   1 +
 tests/qemu-iotests/056                        |   1 +
 tests/qemu-iotests/057                        |   1 +
 tests/qemu-iotests/058                        |   1 +
 tests/qemu-iotests/059                        |   1 +
 tests/qemu-iotests/060                        |   1 +
 tests/qemu-iotests/061                        |   1 +
 tests/qemu-iotests/062                        |   1 +
 tests/qemu-iotests/063                        |   1 +
 tests/qemu-iotests/064                        |   1 +
 tests/qemu-iotests/065                        |   1 +
 tests/qemu-iotests/066                        |   1 +
 tests/qemu-iotests/068                        |   1 +
 tests/qemu-iotests/069                        |   1 +
 tests/qemu-iotests/070                        |   1 +
 tests/qemu-iotests/071                        |   1 +
 tests/qemu-iotests/072                        |   1 +
 tests/qemu-iotests/073                        |   1 +
 tests/qemu-iotests/074                        |   1 +
 tests/qemu-iotests/075                        |   1 +
 tests/qemu-iotests/076                        |   1 +
 tests/qemu-iotests/077                        |   1 +
 tests/qemu-iotests/078                        |   1 +
 tests/qemu-iotests/079                        |   1 +
 tests/qemu-iotests/080                        |   1 +
 tests/qemu-iotests/081                        |   1 +
 tests/qemu-iotests/082                        |   1 +
 tests/qemu-iotests/083                        |   1 +
 tests/qemu-iotests/084                        |   1 +
 tests/qemu-iotests/085                        |   1 +
 tests/qemu-iotests/086                        |   1 +
 tests/qemu-iotests/087                        |   1 +
 tests/qemu-iotests/088                        |   1 +
 tests/qemu-iotests/089                        |   1 +
 tests/qemu-iotests/090                        |   1 +
 tests/qemu-iotests/091                        |   1 +
 tests/qemu-iotests/092                        |   1 +
 tests/qemu-iotests/093                        |   1 +
 tests/qemu-iotests/094                        |   1 +
 tests/qemu-iotests/095                        |   1 +
 tests/qemu-iotests/096                        |   1 +
 tests/qemu-iotests/097                        |   1 +
 tests/qemu-iotests/098                        |   1 +
 tests/qemu-iotests/099                        |   1 +
 tests/qemu-iotests/101                        |   1 +
 tests/qemu-iotests/102                        |   1 +
 tests/qemu-iotests/103                        |   1 +
 tests/qemu-iotests/104                        |   1 +
 tests/qemu-iotests/105                        |   1 +
 tests/qemu-iotests/106                        |   1 +
 tests/qemu-iotests/107                        |   1 +
 tests/qemu-iotests/108                        |   1 +
 tests/qemu-iotests/109                        |   1 +
 tests/qemu-iotests/110                        |   1 +
 tests/qemu-iotests/111                        |   1 +
 tests/qemu-iotests/112                        |   1 +
 tests/qemu-iotests/113                        |   1 +
 tests/qemu-iotests/114                        |   1 +
 tests/qemu-iotests/115                        |   1 +
 tests/qemu-iotests/116                        |   1 +
 tests/qemu-iotests/117                        |   1 +
 tests/qemu-iotests/118                        |   1 +
 tests/qemu-iotests/119                        |   1 +
 tests/qemu-iotests/120                        |   1 +
 tests/qemu-iotests/121                        |   1 +
 tests/qemu-iotests/122                        |   1 +
 tests/qemu-iotests/123                        |   1 +
 tests/qemu-iotests/124                        |   1 +
 tests/qemu-iotests/125                        |   1 +
 tests/qemu-iotests/126                        |   1 +
 tests/qemu-iotests/127                        |   1 +
 tests/qemu-iotests/128                        |   1 +
 tests/qemu-iotests/129                        |   1 +
 tests/qemu-iotests/130                        |   1 +
 tests/qemu-iotests/131                        |   1 +
 tests/qemu-iotests/132                        |   1 +
 tests/qemu-iotests/133                        |   1 +
 tests/qemu-iotests/134                        |   1 +
 tests/qemu-iotests/135                        |   1 +
 tests/qemu-iotests/136                        |   1 +
 tests/qemu-iotests/137                        |   1 +
 tests/qemu-iotests/138                        |   1 +
 tests/qemu-iotests/139                        |   1 +
 tests/qemu-iotests/140                        |   1 +
 tests/qemu-iotests/141                        |   1 +
 tests/qemu-iotests/143                        |   1 +
 tests/qemu-iotests/144                        |   1 +
 tests/qemu-iotests/145                        |   1 +
 tests/qemu-iotests/146                        |   1 +
 tests/qemu-iotests/147                        |   1 +
 tests/qemu-iotests/148                        |   1 +
 tests/qemu-iotests/149                        |   1 +
 tests/qemu-iotests/150                        |   1 +
 tests/qemu-iotests/151                        |   1 +
 tests/qemu-iotests/152                        |   1 +
 tests/qemu-iotests/153                        |   1 +
 tests/qemu-iotests/154                        |   1 +
 tests/qemu-iotests/155                        |   1 +
 tests/qemu-iotests/156                        |   1 +
 tests/qemu-iotests/157                        |   1 +
 tests/qemu-iotests/158                        |   1 +
 tests/qemu-iotests/159                        |   1 +
 tests/qemu-iotests/160                        |   1 +
 tests/qemu-iotests/161                        |   1 +
 tests/qemu-iotests/162                        |   1 +
 tests/qemu-iotests/163                        |   1 +
 tests/qemu-iotests/165                        |   1 +
 tests/qemu-iotests/170                        |   1 +
 tests/qemu-iotests/171                        |   1 +
 tests/qemu-iotests/172                        |   1 +
 tests/qemu-iotests/173                        |   1 +
 tests/qemu-iotests/174                        |   1 +
 tests/qemu-iotests/175                        |   1 +
 tests/qemu-iotests/175.out                    |   2 +-
 tests/qemu-iotests/176                        |   1 +
 tests/qemu-iotests/177                        |   1 +
 tests/qemu-iotests/178                        |   1 +
 tests/qemu-iotests/179                        |   1 +
 tests/qemu-iotests/181                        |   1 +
 tests/qemu-iotests/182                        |   1 +
 tests/qemu-iotests/183                        |   1 +
 tests/qemu-iotests/184                        |   1 +
 tests/qemu-iotests/185                        |   1 +
 tests/qemu-iotests/186                        |   1 +
 tests/qemu-iotests/187                        |   1 +
 tests/qemu-iotests/188                        |   1 +
 tests/qemu-iotests/189                        |   1 +
 tests/qemu-iotests/190                        |   1 +
 tests/qemu-iotests/191                        |   1 +
 tests/qemu-iotests/192                        |   1 +
 tests/qemu-iotests/194                        |   1 +
 tests/qemu-iotests/195                        |   1 +
 tests/qemu-iotests/196                        |   1 +
 tests/qemu-iotests/197                        |   1 +
 tests/qemu-iotests/198                        |   1 +
 tests/qemu-iotests/200                        |   1 +
 tests/qemu-iotests/201                        |   1 +
 tests/qemu-iotests/202                        |   1 +
 tests/qemu-iotests/203                        |   1 +
 tests/qemu-iotests/204                        |   1 +
 tests/qemu-iotests/205                        |   1 +
 tests/qemu-iotests/206                        |   1 +
 tests/qemu-iotests/207                        |   1 +
 tests/qemu-iotests/208                        |   1 +
 tests/qemu-iotests/209                        |   1 +
 tests/qemu-iotests/210                        |   1 +
 tests/qemu-iotests/211                        |   1 +
 tests/qemu-iotests/212                        |   1 +
 tests/qemu-iotests/213                        |   1 +
 tests/qemu-iotests/214                        |   1 +
 tests/qemu-iotests/215                        |   1 +
 tests/qemu-iotests/216                        |   1 +
 tests/qemu-iotests/217                        |   1 +
 tests/qemu-iotests/218                        |   1 +
 tests/qemu-iotests/219                        |   1 +
 tests/qemu-iotests/220                        |   1 +
 tests/qemu-iotests/221                        |   1 +
 tests/qemu-iotests/222                        |   1 +
 tests/qemu-iotests/223                        |   1 +
 tests/qemu-iotests/224                        |   1 +
 tests/qemu-iotests/225                        |   1 +
 tests/qemu-iotests/226                        |   1 +
 tests/qemu-iotests/227                        |   1 +
 tests/qemu-iotests/228                        |   1 +
 tests/qemu-iotests/229                        |   1 +
 tests/qemu-iotests/231                        |   1 +
 tests/qemu-iotests/232                        |   1 +
 tests/qemu-iotests/233                        |   1 +
 tests/qemu-iotests/234                        |   1 +
 tests/qemu-iotests/235                        |   1 +
 tests/qemu-iotests/236                        |   1 +
 tests/qemu-iotests/237                        |   1 +
 tests/qemu-iotests/238                        |   1 +
 tests/qemu-iotests/239                        |   1 +
 tests/qemu-iotests/240                        |   1 +
 tests/qemu-iotests/241                        |   1 +
 tests/qemu-iotests/242                        |   1 +
 tests/qemu-iotests/243                        |   1 +
 tests/qemu-iotests/244                        |   1 +
 tests/qemu-iotests/245                        |   1 +
 tests/qemu-iotests/246                        |   1 +
 tests/qemu-iotests/247                        |   1 +
 tests/qemu-iotests/248                        |   1 +
 tests/qemu-iotests/249                        |   1 +
 tests/qemu-iotests/250                        |   1 +
 tests/qemu-iotests/251                        |   1 +
 tests/qemu-iotests/252                        |   1 +
 tests/qemu-iotests/253                        |   1 +
 tests/qemu-iotests/254                        |   1 +
 tests/qemu-iotests/255                        |   1 +
 tests/qemu-iotests/256                        |   1 +
 tests/qemu-iotests/257                        |   1 +
 tests/qemu-iotests/258                        |   1 +
 tests/qemu-iotests/259                        |   1 +
 tests/qemu-iotests/260                        |   1 +
 tests/qemu-iotests/261                        |   1 +
 tests/qemu-iotests/262                        |   1 +
 tests/qemu-iotests/263                        |   1 +
 tests/qemu-iotests/264                        |   1 +
 tests/qemu-iotests/265                        |   1 +
 tests/qemu-iotests/266                        |   1 +
 tests/qemu-iotests/267                        |   1 +
 tests/qemu-iotests/268                        |   1 +
 tests/qemu-iotests/270                        |   1 +
 tests/qemu-iotests/271                        |   1 +
 tests/qemu-iotests/271.out                    |  12 +-
 tests/qemu-iotests/272                        |   1 +
 tests/qemu-iotests/273                        |   1 +
 tests/qemu-iotests/274                        |   1 +
 tests/qemu-iotests/277                        |   3 +-
 tests/qemu-iotests/279                        |   1 +
 tests/qemu-iotests/280                        |   1 +
 tests/qemu-iotests/281                        |   1 +
 tests/qemu-iotests/282                        |   1 +
 tests/qemu-iotests/283                        |   1 +
 tests/qemu-iotests/284                        |   1 +
 tests/qemu-iotests/286                        |   1 +
 tests/qemu-iotests/287                        |   1 +
 tests/qemu-iotests/287.out                    |  10 +-
 tests/qemu-iotests/288                        |   1 +
 tests/qemu-iotests/289                        |   1 +
 tests/qemu-iotests/290                        |   1 +
 tests/qemu-iotests/291                        |   1 +
 tests/qemu-iotests/292                        |   1 +
 tests/qemu-iotests/293                        |   1 +
 tests/qemu-iotests/294                        |   2 +
 tests/qemu-iotests/295                        |   1 +
 tests/qemu-iotests/296                        |   1 +
 tests/qemu-iotests/297                        |   1 +
 tests/qemu-iotests/298                        |   0
 tests/qemu-iotests/299                        |   1 +
 tests/qemu-iotests/300                        |   1 +
 tests/qemu-iotests/301                        |   1 +
 tests/qemu-iotests/302                        |   1 +
 tests/qemu-iotests/303                        |   3 +-
 tests/qemu-iotests/304                        |   1 +
 tests/qemu-iotests/305                        |   1 +
 tests/qemu-iotests/307                        |   1 +
 tests/qemu-iotests/308                        |   1 +
 tests/qemu-iotests/309                        |   1 +
 tests/qemu-iotests/312                        |   1 +
 tests/qemu-iotests/check                      | 994 +-----------------
 tests/qemu-iotests/findtests.py               | 229 ++++
 tests/qemu-iotests/group                      | 321 ------
 tests/qemu-iotests/testenv.py                 | 328 ++++++
 tests/qemu-iotests/testrunner.py              | 351 +++++++
 .../migrate-bitmaps-postcopy-test}            |   1 +
 .../migrate-bitmaps-postcopy-test.out}        |   0
 .../{169 => tests/migrate-bitmaps-test}       |   1 +
 .../migrate-bitmaps-test.out}                 |   0
 303 files changed, 1291 insertions(+), 1302 deletions(-)
 mode change 100644 => 100755 tests/qemu-iotests/283
 mode change 100644 => 100755 tests/qemu-iotests/298
 mode change 100644 => 100755 tests/qemu-iotests/299
 create mode 100755 tests/qemu-iotests/findtests.py
 delete mode 100644 tests/qemu-iotests/group
 create mode 100755 tests/qemu-iotests/testenv.py
 create mode 100644 tests/qemu-iotests/testrunner.py
 rename tests/qemu-iotests/{199 => tests/migrate-bitmaps-postcopy-test} (99%)
 rename tests/qemu-iotests/{199.out => tests/migrate-bitmaps-postcopy-test.out} (100%)
 rename tests/qemu-iotests/{169 => tests/migrate-bitmaps-test} (99%)
 rename tests/qemu-iotests/{169.out => tests/migrate-bitmaps-test.out} (100%)

-- 
2.29.2


