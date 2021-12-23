Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92EA347E0C1
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 10:16:52 +0100 (CET)
Received: from localhost ([::1]:41292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0KDT-0003RJ-Nw
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 04:16:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n0K4R-0001Ky-1K; Thu, 23 Dec 2021 04:07:31 -0500
Received: from mail-vi1eur05on2106.outbound.protection.outlook.com
 ([40.107.21.106]:40097 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n0K4O-0006Tg-MQ; Thu, 23 Dec 2021 04:07:30 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gfsxTiQoansrj/2J0ZwXhQFnAL0YKeOORh0muUtwsitjZvw42OffKl2vMv6dekZagIfJM+mEQWVW3U53zGw4F2KvmuVPbDNzI9Yi81VOk6AU5gAYVgzPpZ1EPQ+yR3/ClXwKnIGD3cmbDT6r88uS1EkCAu9cMHCngnrYem+/Fj/0dD02Jg+O0l0bOxf36rf5oZF/MRtLGNo0ujkPF8Hgtt9dvrMLSG8EiI73KAh8v7ImpbmHK9w/Bm9zbVny4hBIO1Qx4QrejM8fLvBG5Kk+Fei6CPk+kG5YxBgOk+h6kUMT8GySkRm8KuaKk6eoh0cNSaA8f1JbV307KFMAWNcDpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dZTOirfKBBeNb7s08lEC8V0r27bySKbH/qk9ugB6INw=;
 b=e8bBiChSvaysykhZ6czEcCMX3V6MNE9dgrvB4in/dA2QFEFWO5kztqZDS7hIsrBUi06GBmjZLZ2CikKc4RGCBFsMIudUjdJwImBiWMg6XphB7cpku5h7QwU5pClY6GqePvzlECitbL7MkemMK7AI8LCZ0vEyc+/c0xynLeHQY0rO80yz7IgdUQD3Ewet3EOjvlHkq2zqzgeJY5CC7/71nwviLJ/R3ocr7pOedi+LWt9Uj5Cket5H+W4b0Xut1/gDkVAMsv2SmwIqkNFV5ANIhTJu6SKKCcbVImN+CHiRKcYSrV2dBsQH51rzsgLWVgTdgUcqauIYvkG+2tfC2FtToQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dZTOirfKBBeNb7s08lEC8V0r27bySKbH/qk9ugB6INw=;
 b=UrEmAVSYCDlVw/HJuUA/TVdzqMVLfGDZ/mar/i8YUno8s1MVSZq2b738bqx2L13r3ahN3yJyu1b5whsywPLnzkX7BxQfDmvV/oBVhr2/Ynqi3BN3BxsOLR4XELLnvW8damep4ZOGKYDeZ1FJQb3CP2T0OMXPL1T67+oTifZtkLw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM4PR08MB2900.eurprd08.prod.outlook.com (2603:10a6:205:e::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.18; Thu, 23 Dec
 2021 08:53:20 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b118:483a:d003:3112]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b118:483a:d003:3112%5]) with mapi id 15.20.4823.019; Thu, 23 Dec 2021
 08:53:20 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: richard.henderson@linaro.org, peter.maydell@linaro.org,
 vsementsov@virtuozzo.com, eblake@redhat.com, qemu-devel@nongnu.org
Subject: [PULL v2 0/7] NBD patches
Date: Thu, 23 Dec 2021 09:53:08 +0100
Message-Id: <20211223085309.511450-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0067.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::21) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 81a625fe-881b-44e6-6733-08d9c5f1ab3e
X-MS-TrafficTypeDiagnostic: AM4PR08MB2900:EE_
X-Microsoft-Antispam-PRVS: <AM4PR08MB2900FB10666C5B68B9B0FB58C17E9@AM4PR08MB2900.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:299;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: p2umPFNIWEw3fvwnd0WWfYNeNmi2uqsjOkt9UkpHp3nr5hoZl/r5lNkr2RpZR3DkAcXjQXYiLLUYSU/5VXKUyk2h+mqF/wzAONfR2+IK4p5HT53GyVqxMS2a+u8UVOCRduV0SIkG4Q7h6hTcaQd7f16zXlvSYuEwtqdS7w5xsfNw0AePOzpfwTsl/41gu7ZqXV6FW2Mrleb9MDnwvj6dMfLfUAbSyJ9feYcahUKo4RrkaJ/bTm4eatnzY7NBH2l5wfnK/GKkPipH8MY/duR2828ctPepAcT0BxATFhnWLh3y3YlX/jLAxW7PB151sn9i200EvQxFiC3zql33fIkK0vICeR5OD8JqtIUZ+g/rbuU2ElVz43MqMlrXUG8kNZPwpHYmkKhKryIe2Qtu7OQPm/uKF5S9gFME5X/WOonFJjRP1qQKb/7lPzQSrSs/9uYyQyFiXf05gRbEqvEpy3zgNQhagVmeEoAob76tROBCk1ri8QjYtxXVjfJlwAGA4C0hF5q3tz/T4DEuwGNz7hARfT1XQlpqSuYuHGgxmlnCRb9bSj5ebXYUIyUSV0Gk9U+dTdfttIa55QTFKOXt4iQJW6HpGCaqX39lKmiazGxR/88zq8s9izj8mfU7vsmevRMcGZIn23Qlp+sVR1L3gLL7MnxjXyPY1WBKGzeI7yZypN9Zro7XbDneX1Hn0c8bXvv+SizZbR5DzNRkCyr9Zfu8ylI7lqWJfQy/0briS742wCEB7GHBiZZjdY/M3mk2MHSsGxR5ccQOXXrDyS1MCTbkAD+wCpK/x5Lgie2XXtGNg/s=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6512007)(38100700002)(5660300002)(6486002)(83380400001)(4326008)(1076003)(66476007)(66556008)(38350700002)(66946007)(2616005)(4001150100001)(6506007)(186003)(316002)(2906002)(36756003)(26005)(6916009)(508600001)(8936002)(8676002)(86362001)(966005)(6666004)(52116002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zjxoM4BRcTQZPJ9Ko4Uk+lcvnH4kEteqIRfQqEvlVqcOiowAT+sLdiwlro6I?=
 =?us-ascii?Q?PebD4gYFqvJ0PJ9/jkSndlzasNbx0Sm3T91bFz1VCMZuM27ElV4zbGP8DPC3?=
 =?us-ascii?Q?OwfdKhxMil6FHbpQugXr8apU6Jz9UbobDNE4wL+FG8mnntlqPEawofNMrtfV?=
 =?us-ascii?Q?nhBSxx1faKR+X98f1DG8bnL2BOUmrFoq755hGQ0rj5dRnVVPdjKEeyVmSpRB?=
 =?us-ascii?Q?lCZqSDgRClhxYQ47fgyMDI9EfE6oFi+EGh89B6ox4a16ZUFph8mGelzv3mOf?=
 =?us-ascii?Q?qlUnPyud1xW3MuetJTm8iRXNzQNpPG30XpUEEtjvCG8XjkYVwZCqKExnW7+y?=
 =?us-ascii?Q?YtL5yVdSnwhzGcxbGXDRWBJmMZM5yVrI0jSW7tNetBIFtlywnpeg7ukua12j?=
 =?us-ascii?Q?fGjp5c5Bs8eaKrtzDyUasgEThn4SCku+9/mnA22x8HjUrkiOONeHr4NPSRnN?=
 =?us-ascii?Q?WRfPu1JkPPmfi8SDfOIuwUpsdyBuRhG8hUcRn7ouZZs5NigxC5P8iQ8tjvmz?=
 =?us-ascii?Q?s3nuyFELA3LP8IJ6bzpuMirLX4Rr8oD32/JeRrig7s6F6j8mY9e1FeYsR4Zc?=
 =?us-ascii?Q?ptlGLavhtAhhqEhzCbndhqyWZF5dy4G1pOELJqbFA6+7Twv2WBhvq7JjoRaf?=
 =?us-ascii?Q?lhBUE4CN+UfLqWTlqySGIiwihV8fRuArbXW8y85yTw3+4P8PTB/iPtQeDrQJ?=
 =?us-ascii?Q?sLA8ajnauxzo8fOFPs5guJUHb1n9RJMVTmffaOTAk2u1HRKpC6vLFTFtIbgX?=
 =?us-ascii?Q?y0TENByS7v0uBjKLUbCBNpm4J87B0XUg2X4v51pPPPDwzRffFQl4cd6/QxzM?=
 =?us-ascii?Q?F78KDPq1GIetL7pL3ISAZ/iudwOGQY8PvNpUinusPAxlA70ijSV+yW+dQNuP?=
 =?us-ascii?Q?TOfxfHytuMsBV1Lov/TABKQEYEr6wOqmMD05gZlEDyKH0ZNsVD5cDN/FNFO3?=
 =?us-ascii?Q?m3CyTOg9cCunotkokxmGS1CXNs49NvVEv4++zRl9cqJcbBRZ0isW4HQTYG7d?=
 =?us-ascii?Q?vNcuv/6iNtHr+tldgxTMuGsEhUMGcW5zcpWvk8H3fph9SN0C54W3SMavcjAC?=
 =?us-ascii?Q?kjn2Xe3+6zYqxncQo6l9Mp9CV8+cjZFpQ3T5EYUeMLXnhrYDG3ruGtJa93J4?=
 =?us-ascii?Q?zIDicEvEHm55ZAazoz62F4otZibp/HHrAZweJBza6be8GI/1NcviEqPLUsR3?=
 =?us-ascii?Q?MvoDZRHrFPnWZNtCA3h8xcAYJCoklUOqstTjMvS84YR4OcEA1lMPMpzpo+SG?=
 =?us-ascii?Q?s73NkGBxIzCmr9iatKmPXUs0lpwvkD1chIzb+myjyyvjlt4t7j/Z2ZadxYY8?=
 =?us-ascii?Q?vDmYX/ANR116RywsnCqo4ZnxXg1I71IV4BZOnmmxdADD2D0ge+nxM/ced5CN?=
 =?us-ascii?Q?VoQwzsdzHYshWKQ0M5zYCn+rH9P7s+m19eofLpbqqvohBcUcfwKpbRElOYXX?=
 =?us-ascii?Q?2SQTxljVJLCvr2HAC2WxBhUQo7f3if1glyC7CVrdIa08zYw66kP5Um7iF1Pg?=
 =?us-ascii?Q?rH0a3m2qo0uhZYBzXj/4NfTrbVel9NFbdNxEh/SFWyX0JIQ2cHD2Pd/sweVJ?=
 =?us-ascii?Q?b96/Am0eSsuP2cf6syC4GUOcLfA9OoqN6kL/Jfp+juVgO0J81gb3TmiZa8Iw?=
 =?us-ascii?Q?lPL3N8go5qeLXai84b85/GlU8HvvbMcLZRVOCPwLxgkVO6bIWHQl9tjELWzW?=
 =?us-ascii?Q?vjawog=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81a625fe-881b-44e6-6733-08d9c5f1ab3e
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2021 08:53:20.2606 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mhqnxbke1TuAMF2NVzmEdq+Uoc7pEbK0HgqkX482yWMPQtE8CLTIleAo/wR+6dw09yeRn/FDVVA43FUFQpvrbxjaFj9P7Yrt4u7AzgOSMGM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR08MB2900
Received-SPF: pass client-ip=40.107.21.106;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 2bf40d0841b942e7ba12953d515e62a436f0af84:

  Merge tag 'pull-user-20211220' of https://gitlab.com/rth7680/qemu into staging (2021-12-20 13:20:07 -0800)

are available in the Git repository at:

  https://src.openvz.org/scm/~vsementsov/qemu.git tags/pull-nbd-2021-12-22-v2

for you to fetch changes up to ab7f7e67a7e7b49964109501dfcde4ec29bae60e:

  iotests: add nbd-reconnect-on-open test (2021-12-23 09:40:34 +0100)

----------------------------------------------------------------
nbd: reconnect-on-open feature
  v2: simple fix for mypy and pylint complains on patch 04

----------------------------------------------------------------

Vladimir Sementsov-Ogievskiy (7):
  nbd: allow reconnect on open, with corresponding new options
  nbd/client-connection: nbd_co_establish_connection(): return real
    error
  nbd/client-connection: improve error message of cancelled attempt
  iotests.py: add qemu_tool_popen()
  iotests.py: add and use qemu_io_wrap_args()
  iotests.py: add qemu_io_popen()
  iotests: add nbd-reconnect-on-open test

 qapi/block-core.json                          |  9 ++-
 block/nbd.c                                   | 45 +++++++++++-
 nbd/client-connection.c                       | 59 ++++++++++-----
 tests/qemu-iotests/iotests.py                 | 37 ++++++----
 .../qemu-iotests/tests/nbd-reconnect-on-open  | 71 +++++++++++++++++++
 .../tests/nbd-reconnect-on-open.out           | 11 +++
 6 files changed, 200 insertions(+), 32 deletions(-)
 create mode 100755 tests/qemu-iotests/tests/nbd-reconnect-on-open
 create mode 100644 tests/qemu-iotests/tests/nbd-reconnect-on-open.out

-- 
2.31.1


