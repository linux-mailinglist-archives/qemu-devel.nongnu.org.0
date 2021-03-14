Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3480633A29E
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Mar 2021 05:25:57 +0100 (CET)
Received: from localhost ([::1]:34684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLIKB-0004eG-Ot
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 23:25:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lLIIZ-0003ma-BF
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 23:24:15 -0500
Received: from mail-dm6nam10on2128.outbound.protection.outlook.com
 ([40.107.93.128]:27905 helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lLIIX-0007Pg-G5
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 23:24:15 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AzrLhN2m1nrL91auw49WN5OQHKX4MO/2tLMk6kj5P7PjTamyx2NUYs8txZVV8J+Fh7QA1G0ySCILWsLODljoiPazmfc6wdDGbDNQKNiaxbpbYSd7cL5uVHEwfpkPslBteblzTl01J98uutL2Jhzv+iYJxGfWc8/2hNNmbv+d7HQ+vu6vcZ9lRRIkqoSHkXVt452EHPTTH59IDkQR8ihbOuB3pWRAylGxwbWDQWDKsILfdPt6Y8UWoWDxepRZJgrUBijj+2sZZ8hsoRijA7FCl0h5XUqKpJQf7H9ACmK2xIfFmwNWMQbpj4pSjkiYfWZawJsv8hMrKjDtDGzfY0tmdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wu8bQAWaoPn+tpt306A7mFFSrMcUwUJLpBM5o/9X/fc=;
 b=gXzGxwyuvzP3D20epbCFhfCka8IUJf5zevjbCuG94k3a86CQ1GwtwjZ20UeTJdvaPiGg/p7XCP6jXKp+cf/vRy+k+W6V6BS2Mu8JuSh8DG25h8oHd3G7lRqyigB4HTZ8Oo9l04A5QO13x+dxgFn66QAt+qv120bbbovcmvgdidChK10lz/ma0SJK+cg8HSjEENeJ0u4VlvP7JrHqrdap5KnfMrtpwC9L7aR6mX+2VsRIcZxLYTgz8wdo+neJsa665y5z6iHTxt1A6Bjx37ypyMZd1cvZzTL77SlvTTSjYuISllo2VMMsMTI2Rjjp8mCA2wC9QiXcptcLhhfwEUYsIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bushare.onmicrosoft.com; s=selector2-bushare-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wu8bQAWaoPn+tpt306A7mFFSrMcUwUJLpBM5o/9X/fc=;
 b=Ru/lSi9MlYp0R+LWTGm+qhzkOL3WGH1YDU4uNvrVp8MdGCoy8/Gi2ATVb4eLdzto480/xzfenS/Pf5x0wYVALxZw/ZM6xAUoPZpiuXMAmYFHJIE9JBAkj6Mt8MGVoKKVa24+khKxdB6Fu7rAn9uk2B3qX5jBL/WqP6CJRmDwBtA=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SN6PR03MB3854.namprd03.prod.outlook.com (2603:10b6:805:6e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Sun, 14 Mar
 2021 04:24:09 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::dda8:67d8:8d23:74c6]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::dda8:67d8:8d23:74c6%6]) with mapi id 15.20.3933.032; Sun, 14 Mar 2021
 04:24:09 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] fuzz: add a script to help build reproducers
Date: Sat, 13 Mar 2021 23:23:55 -0500
Message-Id: <20210314042358.682136-1-alxndr@bu.edu>
X-Mailer: git-send-email 2.28.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [72.74.210.193]
X-ClientProxiedBy: MN2PR22CA0019.namprd22.prod.outlook.com
 (2603:10b6:208:238::24) To SN6PR03MB3871.namprd03.prod.outlook.com
 (2603:10b6:805:6d::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from stormtrooper.vrmnet (72.74.210.193) by
 MN2PR22CA0019.namprd22.prod.outlook.com (2603:10b6:208:238::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31 via Frontend
 Transport; Sun, 14 Mar 2021 04:24:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 95994c6c-668f-47f4-2533-08d8e6a102e3
X-MS-TrafficTypeDiagnostic: SN6PR03MB3854:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR03MB385445D6C31592DA31284B19BA6D9@SN6PR03MB3854.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2xMN9zDMGUzKe/Rv8jodtROwSwH9QfVNbdJKINGc6RWfKyRzIZISbVwhkWPPdzOotKopGs9N0gtLJs2htp8WtdjAwUoQyIdW9ngFxSBY7NM1vJnpFku3SaylvmTSs5qcvwQSsv7ZhDH3h13ExlAm/heI7ZqhYL84ehAT7XPsJhu1B/15fN4EEjNBbRaWusnxuvaEZJjpR4eF4jrA/mRajgOF+1PPqoe/dq5iebdXBbfgrWvC2YcUrYuVr9dzs0zcmhf2KaStfZHqqUvitQTPaAADpO/XmkpmmH/y+c7hwmPYlraHkouu6MNBg2hy6WQzePsriU7KWDzCs5Wl59OgsFGX5voMe9FsGc2NE7tBxSuLKQ4JnBrloc+wFi+VzPkFRznnaXSCbwjKPMVB1EGAU/TWWQF1xyPRhzeaOQFd8dnii24syMJbOVMAKMDeB1w99Vp+kgW38X/vrvN8tIh0mlYw57Rh9JOVXaX840E6TwUVQ/HS/8L3gCmu+xTg0QoLKc7m+qJOuBnCVIWV0oDMJakLK1PGPRn5wotyW2t+EjP003CI2Anx0yGpUgYqLu5q
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(366004)(346002)(136003)(396003)(66946007)(52116002)(66556008)(66476007)(2906002)(186003)(16526019)(86362001)(2616005)(956004)(6506007)(4326008)(8936002)(8676002)(478600001)(6916009)(75432002)(316002)(1076003)(4744005)(786003)(26005)(5660300002)(6666004)(6486002)(36756003)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?mDpgq7n+nEq46lx0w4ClIuPlNKyd0hGHqFa818hSFsRFbt/LkR73vmWDFqR4?=
 =?us-ascii?Q?AspyNFuoDc4Vagmbi6AhCfDamFdmmEh6WwvS+/Poz7+7V3PNugJQaCLYg0mX?=
 =?us-ascii?Q?3iuhgu9exNjPT+BOLoY/Ajycsw+X9O4KmwsvSYffWKIK/cRXjw/JTxBD3cs0?=
 =?us-ascii?Q?zx2OyJpTw25rhgDqB2L7vpleb5OsvaMl3gy2AcFRJ4zOoUB5Q5ERsowVdIK1?=
 =?us-ascii?Q?B2ukK9lwP/PiG9x/tYa9GooSB6blja+beqUtqLgP8WP25rykbXPmnJZ+ViYQ?=
 =?us-ascii?Q?QaPkfBA0FI6Iax/6SHzagQB72N3tFP5w1StrgufFeEcJo4XkClQxkZV5f1v9?=
 =?us-ascii?Q?e7mCtbvqVHGXsm8HWvMq6FIb4udzrNkm7FR7Anued+B5SnD1UJZxyvHhfx4B?=
 =?us-ascii?Q?djrDjfWTJ/SnweHqmheDUg2ENbaIAEE09ZXMGUxFE+MMqD6blDmyE23Lpcl2?=
 =?us-ascii?Q?6nF8TIOE2aLzFMVAIMytWOg/VUnJcaUaw0M4xfUZR7s8zExkMlbvCiD2AY9f?=
 =?us-ascii?Q?g+80BRpU3jWWPF2QLYShOEKrCX1OQ0siE5o+gqPHMIRu7F1iyChLCydmEQeY?=
 =?us-ascii?Q?rtQMmvClGctqe8XUKh4YXxqYJ6m0We0qvFkIGQQSFOD/tiW3KMn1xgLObLUn?=
 =?us-ascii?Q?oljOuslqCODIOujA5HnV6ENTkytv4MKgrz10vmCzE75Mx1m+dJ1RU8ZMtE5H?=
 =?us-ascii?Q?NjElce6NW/e62TstEvcamXocQAjw/jlf8DPQWWiFz8qJH2T1gECd8GS3CBn8?=
 =?us-ascii?Q?oOLUNzfvnzwjYmnCeoqKklE0YUk0ITnyri+gzROPFnuqtaBRWqy/p/CXPDt5?=
 =?us-ascii?Q?Z+pxwQZ+r5QLLu8QTy8RDpYiXBlN0zvp4KMtfcLU8UhFKpaPLoJs74K0wtah?=
 =?us-ascii?Q?VrHXzaQ8autxHEwtjKCuinBF4HLlJtGwVunaX9PFm3p56LyM2NZQebCsIj3W?=
 =?us-ascii?Q?YC7z3bs+jJ5ur8bcEVlE0pBCrJE16zwFWw1ybT2/WZRS5LsZQHL5R3Qa5q6d?=
 =?us-ascii?Q?kW9I7/rdcxfAm2eGbBcj5Wm5nR+hRx1WscEYkKD5kDmyvdfLQec/mtSky4qx?=
 =?us-ascii?Q?wyOyByRnnc5SCd/zIubEyGezW0EKgBUZ01DbgOtngARD8NN3WI1HCCOk4t5r?=
 =?us-ascii?Q?wHCDM4qoKJgEfpBghfom2Wls3Eg/CJFDcsbJvSHeWNzE7FOPkIWH2WoeGmDk?=
 =?us-ascii?Q?D6pSuqYEaoEAph4OCvF6rXyJVgRuO8fLd7O5KltKxLhXilr/UDCFBTDSZciW?=
 =?us-ascii?Q?+47u1v/U2yBIiMdPU5gOClJ887CQcqg1OYcvyvuaIBu7M1nB9EjvbksZlNnS?=
 =?us-ascii?Q?4+3TmOszFjwgrkUoIWsmNcjq?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: 95994c6c-668f-47f4-2533-08d8e6a102e3
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2021 04:24:08.9816 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +PlMhdqLqOJOEW8k2OEAjJZXgd3h6hs7RcHSBnfL2qIMMH7a98i91vBVYyt8e0Kq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB3854
Received-SPF: pass client-ip=40.107.93.128; envelope-from=alxndr@bu.edu;
 helo=NAM10-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.999,
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
Cc: darren.kenny@oracle.com, bsd@redhat.com, f4bug@amsat.org,
 stefanha@redhat.com, Alexander Bulekov <alxndr@bu.edu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,
This series adds a script that can be handy for reporting fuzzer bugs
and creating regression-tests, based on crash reproducers.

Patch 1 adds a script that can help create bash and C reproducers for
crashes.
Patch 2 documents the process of building reproducers.


Alexander Bulekov (2):
  fuzz: add a script to build reproducers
  fuzz: add instructions for building reproducers

 docs/devel/fuzzing.rst                |  45 ++++++++
 scripts/oss-fuzz/output_reproducer.py | 160 ++++++++++++++++++++++++++
 2 files changed, 205 insertions(+)
 create mode 100755 scripts/oss-fuzz/output_reproducer.py

-- 
2.28.0


