Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D106D4113EF
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 14:02:37 +0200 (CEST)
Received: from localhost ([::1]:55250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSI0K-00067l-Tq
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 08:02:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mSHuB-0007b9-VD; Mon, 20 Sep 2021 07:56:16 -0400
Received: from mail-am6eur05on2112.outbound.protection.outlook.com
 ([40.107.22.112]:8080 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mSHuA-0005GQ-HW; Mon, 20 Sep 2021 07:56:15 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eERQhb5TNCEte4anwFENYX6A86dfFgzgMiE8/JRif9sGJyjquSeGmpyJIpQDf8iKl07uVlWff5uznS1AUgn8kVbDFdYLPUFihDCSMa6yRYecWnNDv2WkJ1YVm69sv67T7ZBi4wcEh0j9fhL+cmeiV6T/ilUuKxeL0AN8ieRzx/+/aADenb2o2UWWwb42XXgiJzf+UzFn2JAixypaSOYeO58T59xyPE0d6zxJ0FDdbiJgB1aNF70ZyNvM68vaEwyJ/dRLAqXnUSleeDBc+b9wUJhSdVl0ciludKtV96uSqHgOhtnU0EOUTbq1Dj8DVz4EXRQZ5VHXmv1AwRsPMv34gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=y1ozaHCrCZ+cjgQvz4VlSswTeW64tm4tAo+Ws1z1x1A=;
 b=bxpnNUR22FGXtk29BzTd8UL4i4P5a7U3Lg3HdldmYpkpm8bpRxSEFzGXJgCr4t9sadnscWsSKBet8qWBvBm1LdfoQ5XhUkQ/e6xwddI6DVeDT3ckx7CpdxsOBe24LHDk6rN7IFhdrIq6869rOqplOFVmwjCobNYY2wMb3sI6j3IsK9Zw9JJN170xisztqjGcrspNmlWOz2MdMhghn6Ii4r1tDXtpV86U5EuzaZHi1CsGE3uynWEZ6klLeShYGfeuRoqieHPyv8XEH8qNes/30QfFbunKjgPKNWo0wBMUUdQl2uwfUfhCNZlrBF4bdWQ4o6GexTPXYjAyTii+/y2Dpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y1ozaHCrCZ+cjgQvz4VlSswTeW64tm4tAo+Ws1z1x1A=;
 b=ir9Bro06fgBzgXgM967dMyAvgssBNJGJ7Bh9ierOzycyBxL4KEtpGFexT5fuS8gZkCXJshwaXHTzT4NVFRTktkuCH7igOa8eYRt28jaqSNBEW6RnYxigCBQYU0W9UAdH6vpxENcURgq0Nz90zI+kuU4Zy8bhHSqX4xTnQpP9QQ8=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6631.eurprd08.prod.outlook.com (2603:10a6:20b:339::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.16; Mon, 20 Sep
 2021 11:56:00 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%9]) with mapi id 15.20.4523.018; Mon, 20 Sep 2021
 11:56:00 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, hreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com
Subject: [PATCH 5/5] iotests/image-fleecing: declare requirement of
 copy-before-write
Date: Mon, 20 Sep 2021 14:55:38 +0300
Message-Id: <20210920115538.264372-6-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210920115538.264372-1-vsementsov@virtuozzo.com>
References: <20210920115538.264372-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR09CA0082.eurprd09.prod.outlook.com
 (2603:10a6:7:3d::26) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.205) by
 HE1PR09CA0082.eurprd09.prod.outlook.com (2603:10a6:7:3d::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14 via Frontend Transport; Mon, 20 Sep 2021 11:55:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b26f17a0-cb12-40d2-d04d-08d97c2d9d23
X-MS-TrafficTypeDiagnostic: AS8PR08MB6631:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6631AF44D4651B26E42071A9C1A09@AS8PR08MB6631.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:820;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9Jwm8gW9Nmpwoace4sNAvhFgLQvacNlBaOKmw+c8HFO/h9kehn9KZW24wWtontutaK6xBsSM8WsnFVAcVs+QMOpAu+44+1LoOwr8mplDTarp8O37Rxzlg7EsVSniMmy1A1F5JsWLMgVZuph3+B6c22Khw0zZnqN2OgDlQFaWOPNH6FJNyTBlRWZC84d+l1hlKTpSEi3bNfajM/EKPOmrNIFm7duKv2Qq8w5mSaE7ssfftxW+mIeIewv7KtU8kaBvG+4iBZ01OHsJpCa0Ebk5BAmx3noHTHGg42pzWMZKkYadrneyZnBHuDQvVjwe1WdTpaWUCJqusbnBY4/9oti9RHnigfQwTHWCF+/3nXhu0iYvgjUIYn3hyWQu5JHCSdvSLay2T0KvmATfl1ga77YRN54AJBpMD954UuJQqF6K00DOhizfIsY5JUgK8wef2r3+0zIv4SoDY8q4JXyKGT4Z/RLfJiZrNlxsxptPAP2/d9o8HVt2JxSWzy60TzSWmRpPHgIJa7xF4dqQK+P5+Xy5Qu2a9FvMRyvZ5OXkw0lG4EXrjwJYOJw4zLEozBA5+v0uT3QnYgudFy6BDRc+S8IZS8HM221rqF7Ml6v8WX8kxF9XeF4/VBm+AZNXzjNEXWBjixHglgheU/FjEbtVbi4LhVUv8ejO68eq9sipd6Oegd0sOJeyCdVxQxRs3GFMAzOOS/D2foppiwVDSOMrlwJbnw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(376002)(396003)(136003)(346002)(366004)(2616005)(956004)(66476007)(4744005)(478600001)(66946007)(4326008)(66556008)(36756003)(107886003)(8676002)(8936002)(6506007)(316002)(6666004)(5660300002)(2906002)(52116002)(1076003)(38100700002)(86362001)(186003)(38350700002)(6486002)(6916009)(6512007)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eR3g4Ah6Bd+d3Ekg/wIm+jrlezB51kjHNpv2Dmo7kvCFf8StUA7KqbcjIFK1?=
 =?us-ascii?Q?PaTilRDISFrtJbvS3Ur9Bn2zckPNWhUKzVvAq3BJA+OWsU9HOkdh/l7Y+PLo?=
 =?us-ascii?Q?a5e/GxxHDp53kPvVWCfFg7czE0aDaeYgrTW+94DhgyxG0jcmzcUvSt6iTtRp?=
 =?us-ascii?Q?Klc5F7/NNr46yzc3CJ1gpPvaSVA19aVTx17ZUDU+pibnShjXyzG8E/bw3e43?=
 =?us-ascii?Q?8KhWGyS9MuYPof798vaD0gqhDhCZgH5sEPXiEeHc5aHKAdfn8pgfBOJMWYce?=
 =?us-ascii?Q?K9Q/ZT+wOC8S+ZgK3myYqMpKU3tCSXMDJj8kSJT8VYd7DiMyiE1j+G68B1Qs?=
 =?us-ascii?Q?wRYXzNRqITzdMYxU62UqWEFZDoWpFZIk8nhZSDe/bgvZZsDmFS/Q8Nx6u0ss?=
 =?us-ascii?Q?uaP2Xid1IreehqNerhBRjF2XVVsylye8hVQOEd/LrGrMyssm3Sj9zyE1fPlC?=
 =?us-ascii?Q?vA3cKCB3vtQskIHM9PeQ3W5qixUMK2SJ17Rgl9FB/PTT7mGG/prTVLmkpXNM?=
 =?us-ascii?Q?na50LM2tvQLseGsHB5JFTmma3t45w7smNLxn6znxjV7MIE+jMuonMgZXVZlD?=
 =?us-ascii?Q?qG4Mt6FFEUlK9A0Q5UhTOQv6V9UYek4yxrpNGGx+bzRc8C22XeUsI5NY+Nct?=
 =?us-ascii?Q?NfO69Of7OAq9f2sqZBVzbP+7k5GmOyfGRqCldUaEUXdaUepUVaNb3RaUVr6M?=
 =?us-ascii?Q?v2rHOZ4oF2kQhKQb+NhFVNv6XVDHtXB2y5rwilz5JsU0uyESLIhHDw9IwMcm?=
 =?us-ascii?Q?DEcqnOqtlMau8P2NbMKmUdyAzyh0oa6wbLjagG1nJh6gynqh+mcK6zBeFn3Z?=
 =?us-ascii?Q?UuLS+uhb4eZ7MPQWr3fFX55K4YT3AkEqbbzAkCc7WzBR0DrIplVB8cpcOoi5?=
 =?us-ascii?Q?DRnPliXp9hWFkfg5oODHHBKu5pZ9nXbKopTzSd7UcbL/+1bgyqbk2so5S6E1?=
 =?us-ascii?Q?8eJpVMrhfM5ZKXVHiUhhHx2ErdvMevw4OQrTir6XNgbhaRIuJccKnjLYAtIr?=
 =?us-ascii?Q?WW0FTmAGeIrEI4cE5TtkBNHJ+BWMVc0fUkRBnCHwfKc8ZVcIl/lMtbMycd8E?=
 =?us-ascii?Q?MtWdYPf2x04GbOjo8ntjWeAyTDyPMvs2TvlU1NP8c5Y0l2Ur0z4zSWilGMp2?=
 =?us-ascii?Q?uyCX7b11o+URyuGh80YHYBNapq2tQJVoEyla+Gtv6HKZb94nySumsJ7pN2mI?=
 =?us-ascii?Q?sC09mQSEO2zyCVfEIGJkcGLws3yRRT58qd91YD+nn1SDr3qIRMfF2hjuTPJ3?=
 =?us-ascii?Q?e7hfkBGejstuWWbqrVmOZYPWbHCG9461BSKXVViXum60p/rT/LjOVX6UcUOn?=
 =?us-ascii?Q?1UWgPMjJrSftkuvHjfPAxUBM?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b26f17a0-cb12-40d2-d04d-08d97c2d9d23
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2021 11:56:00.3429 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FUsNjLCGcNgfOhOKPEHDicebWbxGlQMF8nxCdBS5nq6C2+JxjWFYq+Io6XeBrMZ3hCDla+DF/kO5TCWeb9NCUYG9AE9PmzZRpQaRt6eo2AU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6631
Received-SPF: pass client-ip=40.107.22.112;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now test fails if copy-before-write is not white-listed.
Let's skip test instead.

Fixes: c0605985696a19ef034fa25d04f53f3b3b383896
Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/qemu-iotests/tests/image-fleecing | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/qemu-iotests/tests/image-fleecing b/tests/qemu-iotests/tests/image-fleecing
index f6318492c6..35164e9036 100755
--- a/tests/qemu-iotests/tests/image-fleecing
+++ b/tests/qemu-iotests/tests/image-fleecing
@@ -28,6 +28,7 @@ from iotests import log, qemu_img, qemu_io, qemu_io_silent
 iotests.script_initialize(
     supported_fmts=['qcow2', 'qcow', 'qed', 'vmdk', 'vhdx', 'raw'],
     supported_platforms=['linux'],
+    required_fmts=['copy-before-write'],
 )
 
 patterns = [('0x5d', '0',         '64k'),
-- 
2.29.2


