Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B669F3B43FD
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 15:03:47 +0200 (CEST)
Received: from localhost ([::1]:42984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwlUo-00045J-Na
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 09:03:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lwlRc-0000c0-93; Fri, 25 Jun 2021 09:00:28 -0400
Received: from mail-eopbgr40100.outbound.protection.outlook.com
 ([40.107.4.100]:22342 helo=EUR03-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lwlRY-00069v-7z; Fri, 25 Jun 2021 09:00:27 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nKcA2YFZT05RZjysiCj42pIwnuDJP08m0u0pZ8TxVT2H2mhR2OmFVq2vbFRj5yO8umlKZHPYqz1Ibm4MQxm8IrIrA6KC2PiRPVh+mS1n+ykVklpLeh4VSxaW4Eo5xKAeoZ6pYOtKfiDeWc67WPcvYirpnIKYWCnsuhu94TKwvTcN9+g/8aYUuDdoSoVVAGUO9834JSEgsvDQns80jwGrj1jdXlLV+UD3GC1UAfajVb0vG/nUgHEf/4LQf4dvFXjv4Sz7A0Ic4rgQNuBSjVcH5shUGfk5wF7S1TWsWK1nwAjiQFR9MIqGJhkvNwlGLmfvEBLS8DYd+PyznrjSsa53FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l0haBo0NJnyb0RgirJq7jXHyIAAFdVt5s9pZ77KM2aA=;
 b=Kre5JojJyNmUytnhsH1G7wS7a55xHVz4eIWCs3sxsvuZ9/z6UjYGk7jbgvNnPt5QklHqCkMXNAtzWVye2GXcoM09gHz36pB43Mgtw2+ZR5y/ircwKxj7G5gDbS6brw1It1KktH/Ial4O8xFVuXOHKolf+iQaQmQI2ILoCOk0G2eoK84jGEeYKXI4FWQj8x6BQQ4U6fKSaocnvj0vz61Py34GL+ZK7MxXnIrB9HeZgau9KxC3UJo7XkTJwb5AViC36V+DWK01hFctKF9g6rZ824BVSo+URKmLzx/o1zL2CsYCZ0YxTzPPhwXuoXwkWkANT8UbnPWSU45BxRffwulAmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l0haBo0NJnyb0RgirJq7jXHyIAAFdVt5s9pZ77KM2aA=;
 b=lPmQnTO6M+I5ZRpdwicWskwPEy9TwtsO4NNJBgxLIzU7jnBmcTJbphgSh8zxjim8JoYC6+PVzPWqgMK5FhB2QmNINvE02UO9HQxOj8YD/VQCEQX+ZRNfL1aqbzXLnbtpcCUK01cK4BMerw6SxviCMng+CzhZ6bYHtbJ5UBnqenw=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.20; Fri, 25 Jun
 2021 13:00:21 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955%6]) with mapi id 15.20.4264.023; Fri, 25 Jun 2021
 13:00:21 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 jsnow@redhat.com, vsementsov@virtuozzo.com, pbonzini@redhat.com,
 stefanha@redhat.com, eesposit@redhat.com, peter.maydell@linaro.org
Subject: [PULL 00/10] Block Jobs patches
Date: Fri, 25 Jun 2021 15:59:56 +0300
Message-Id: <20210625130006.276511-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.221]
X-ClientProxiedBy: HE1PR0202CA0024.eurprd02.prod.outlook.com
 (2603:10a6:3:8c::34) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.221) by
 HE1PR0202CA0024.eurprd02.prod.outlook.com (2603:10a6:3:8c::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.18 via Frontend Transport; Fri, 25 Jun 2021 13:00:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 06ecfdfd-afb7-40fd-b784-08d937d9308e
X-MS-TrafficTypeDiagnostic: AM7PR08MB5494:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR08MB549458BDBAE7B6D296230448C1069@AM7PR08MB5494.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:364;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AHhyljZE2yidlhpLzHSz1fzVU3VtinD5FCkHfKdjNYDhp1qe0dsHugTByLHOATTT1DOapjBJwKb4pVw3ZzEWpBdzyjyZNF1jM9gVQK0ZwgAMimZeMS4Eq8nMMPfdS/8a4XTcEIy8LsOIz2zZ91NMDTPCRQ+lv8iX0u7WQ7jgArS21tSsFDw2nj+XtCutSSwF4+sdtqt7KgHUurRCjeXkhRpFs0Q69mczYAD+4XH7Vco5P9zKFg4rz1aYo91Ly4YAmpfqcLZsF/Wwkh/Jd0UXbFJ02Bk6i1ZhpsBbktU/qKL+yi3ap0i13+shjHSSQgkmKN7ojjJfgGA3f9wPI2+uBsvuNZ60lGP308o10GZ2095JwTzRkMr3ReDz26dwP9LUlpU9UUDRVMOtajetn17QXI84H62k+dXCASIZyxnZXA/8YPi97cWdYvWrL/6/xCyCxwo8kQHibt8G6CvPTMoC1qkzBDtPrRdPfl+7Y8N/PbwIc/98eF97jVssxc5Rse6nY/17gvAATGnGBG0jTUkUF5Vq4qa833Ni6tfukcjb+0/qe7umyQCO23V9bHO5LWykdI3roRj2HFExQYnvAM1ssLmKQMpEB3Z4H2ktzRmkLgqjDkpsfzakd9RsUa5/PQZYcW7O7skishBN4iRqnw0n0cpeT27ZpNiK78x+kuMyU6HhqDOzKW9CR0pbmR8YPsV+
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(136003)(39830400003)(376002)(396003)(52116002)(6916009)(186003)(16526019)(26005)(5660300002)(6666004)(2616005)(6506007)(478600001)(8936002)(8676002)(316002)(2906002)(956004)(38350700002)(38100700002)(1076003)(4326008)(36756003)(83380400001)(86362001)(6486002)(66946007)(66556008)(66476007)(6512007)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7z9TZJ8mhYZI+Rvobu+WDPW+4qIottYe8MjvP86PpiOfdq+M22GDDenbY1qv?=
 =?us-ascii?Q?/5B/JD/Gp4FIaSbYjeAc11mdv+e1fLgnR0cUgx5FuyyM/wSApdYB/rD0lH+B?=
 =?us-ascii?Q?JCxo3RAATThWN9kt+tA25zobq1PMk1IGD6Uy8cZRSed7oA9xTL2WEv+5DWck?=
 =?us-ascii?Q?3GSmJyr1cjsdwI2dm57bbdh2WgUXT4tmOUPFALWdnRx36c53YNIUV5D4bqnB?=
 =?us-ascii?Q?GaJwRzeoJUKHaLtNXYMS8uPl6WjeGuhrHDvwJgsFj4HXhwYigF9CfVWS+yjK?=
 =?us-ascii?Q?rRhuREVvDrMc12Qs8eV8Vj25D4sOFGHys1cPUPSVsmMsCQx/xDWgtlVv7oFI?=
 =?us-ascii?Q?XHA7Rj92EJb1T76se8HwomeLGFYOrU4Ukuaf29QGUFIwIISRqDzOqYBMGlQ4?=
 =?us-ascii?Q?qvco8jFg1UuWxbeA/aeEqRNNYDv/8SE5QKtEEENkeLXNtbrMCcYxQhKnTmXb?=
 =?us-ascii?Q?CnqAlpT3SccZzwK+zxmm3RpeaV7MIuwYTre3ZbPayCWIk3nkhybSdi4twkfJ?=
 =?us-ascii?Q?utqtcWsyxrQWKve9COkgryDc0omhXJU6REq8estKVtfNsARsA6eJ6k/OLbxR?=
 =?us-ascii?Q?rtXnWO5jctrG7EmXRw+pU3XSm6oSQ72xsiXe/VsaRRbt0JcLy5mwzZU5aEiX?=
 =?us-ascii?Q?lzBWYvDeLNbzFvujP5K4Zx//rMXhYjMCcTAthP36wFpssPzXrf9UOUSW4AQp?=
 =?us-ascii?Q?KTiEgT/seaFDEfaFT/Fukn9SCCiRXiiUQJg4hztoivnvrzvA+wo28NsU2kal?=
 =?us-ascii?Q?LyTBUa3h5WhMb3WpnH5M9OtaVwpxKD6tf3OCN+UYbXbmGGLWAOg8KtIErtv2?=
 =?us-ascii?Q?k8PBi8+S9/Qfyj5BR+w2DFTCt/ttau5J7faDAKX5jqtM1ThUeEzj6tzyvtPv?=
 =?us-ascii?Q?7sisPGonU6mwG30I6C+QIiEKxKrSolmZ5jipYjv8ze7T+ZhJx/qJN/tpD9fW?=
 =?us-ascii?Q?/javoDI649PDnebwGfHX0dQsHSylGQDlc74hFeL21jSewI0sDavShqIkoYqF?=
 =?us-ascii?Q?uV8fa7G8SvXiDfytGi6GzDHdSaygsv5aq8ukWm0afdqNtW/4d3ybCWYAvRnS?=
 =?us-ascii?Q?4qqwC9w4tcXEFJ/aoiwIJQbrTcObY/Dyg7dfBTN7K+LmdUWEZdf2ZBEf4ezJ?=
 =?us-ascii?Q?Rma1wov09Tw2cBHx7Sr+DjwaBgNvYhDbGQ4J1PkpoGAZLElaZXmLMZkW+Nx6?=
 =?us-ascii?Q?ygYAUet4i4XCDJV12cxGigJhfQDk0OA/dKTxZjoH8NsiV2p0JHgK4njh45di?=
 =?us-ascii?Q?FMUxfsxE24kCMgThx3VfFlNcx45vdW17Ia7DFfokyZCdJe0Twbj7ruJCEajt?=
 =?us-ascii?Q?vnm4O3ueCTbNa4RpF/mMwIU/?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06ecfdfd-afb7-40fd-b784-08d937d9308e
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2021 13:00:21.2861 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l7qYPvru9c6cDftfcxqkmtOORGrIcaC+RSQATnLuyGJFt6WPOYdp+OEyEgmp98v0Pe/b/eaAROmksd+m4OA1bAAPmewiQ3tpa1QfxlOBqSU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5494
Received-SPF: pass client-ip=40.107.4.100;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-DB5-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

The following changes since commit e0da9171e02f4534124b9a9e07333382b38376c6:

  Merge remote-tracking branch 'remotes/kraxel/tags/ui-20210624-pull-request' into staging (2021-06-25 09:10:37 +0100)

are available in the Git repository at:

  ssh://git@src.openvz.org/~vsementsov/qemu.git tags/pull-jobs-2021-06-25

for you to fetch changes up to 149009bef4b4b4db37b3cf72b41dc2c6e8ca1885:

  block-copy: atomic .cancelled and .finished fields in BlockCopyCallState (2021-06-25 14:33:51 +0300)

----------------------------------------------------------------
block: Make block-copy API thread-safe

----------------------------------------------------------------

Emanuele Giuseppe Esposito (6):
  progressmeter: protect with a mutex
  co-shared-resource: protect with a mutex
  block-copy: small refactor in block_copy_task_entry and
    block_copy_common
  block-copy: move progress_set_remaining in block_copy_task_end
  block-copy: add CoMutex lock
  block-copy: atomic .cancelled and .finished fields in
    BlockCopyCallState

Paolo Bonzini (4):
  ratelimit: treat zero speed as unlimited
  block-copy: let ratelimit handle a speed of 0
  blockjob: let ratelimit handle a speed of 0
  block-copy: streamline choice of copy_range vs. read/write

 include/block/block-copy.h        |   2 +
 include/qemu/co-shared-resource.h |   4 +-
 include/qemu/progress_meter.h     |  34 +--
 include/qemu/ratelimit.h          |  12 +-
 block/block-copy.c                | 396 ++++++++++++++++++------------
 block/progress_meter.c            |  64 +++++
 blockjob.c                        |  46 ++--
 job-qmp.c                         |   8 +-
 job.c                             |   3 +
 qemu-img.c                        |   9 +-
 util/qemu-co-shared-resource.c    |  24 +-
 block/meson.build                 |   1 +
 12 files changed, 399 insertions(+), 204 deletions(-)
 create mode 100644 block/progress_meter.c

-- 
2.29.2


