Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ED804C97A3
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 22:17:38 +0100 (CET)
Received: from localhost ([::1]:38324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nP9sH-0002Ib-05
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 16:17:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nP9pB-0000RD-6S; Tue, 01 Mar 2022 16:14:27 -0500
Received: from [2a01:111:f400:7d00::71e] (port=41121
 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nP9p6-0005Ia-Sy; Tue, 01 Mar 2022 16:14:22 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TFziBG28oRGH2IL9SNTBGTiyOvqiBlbHPY+OVgaJTvvjeK/yhv41hz/ia9fSTKX79g2ZTOk4eE0KXBB3XBAHnsdoyMbptHF3TKurxI9TNDdX6xC0yl5JN6pwnAIJiGMOYihx+nLrFZD60R2oohst+sBD1ZA6h7p/f+oMFRKy0rLp7+ojctXWwV+R2zvBFKZnHVAjEfnuyjTn5Ezl/PxgmUi7a65+tuf9Pi+2wT7ni12w2fRklYCAS2SefkH/pw8G5y6y8JynNqfpVAOSbf1mbvUxoEhR/z9CWlUfB/NIXxtMmOaiYubyipF6G7HNQao7isOvwey2ACVJ8stGPGdDHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7aWig67wKni59oIT1WZVjgw/PEMSnRelt9NI7O1sVJA=;
 b=FXdVawlRjVPtJf7IINJtscdCdHw1ETbxOLWCgjKaaS9mG9BN04Z+IBSzoXcN9YC7Ehi5Y8BpRefIfk5sHbc2gG8mw3jVEKv+/QGYMAGFNC/8cD3o3apUJ9W5cOaUfBqqjbwQ/ADm07blNlphImIRuwzRTHGFR902W3DLn917mdtl2bVoNcdIRj/bjbA0VbVfGvd3vXCygtnjsVBxAvhXwc96cujXbxU1TtH5p1FCRSqkf+2yCWA9+EQ/NwVacJIbhzzxmCVId/2I+jcdSs6+2Ydrlz3Hx5D9Yv8MhNLPPIsfPtfHv6iVZvNaRmDXRS/SRvPYTwiH8VujjKknYtiI6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7aWig67wKni59oIT1WZVjgw/PEMSnRelt9NI7O1sVJA=;
 b=CSP0q+MZ2gM+hZvLuMHMZVtlkizSF/11QB3+4UB4BNIOCsy1eywJqLiVzxh6vb+fcQdQYpPpi18D6vErwk+3ySeHVFJDGJ2HTDRhCB/BRJpV7CStguqUCiAudJUCLJU/eH+tuqEVVj/FxK5SQNQAXbdh338H86gzvy/DpDW4YCQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from DB9PR08MB6748.eurprd08.prod.outlook.com (2603:10a6:10:2a7::16)
 by VI1PR08MB3710.eurprd08.prod.outlook.com (2603:10a6:803:c5::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.25; Tue, 1 Mar
 2022 20:59:44 +0000
Received: from DB9PR08MB6748.eurprd08.prod.outlook.com
 ([fe80::c52a:4f5:95c1:7f1e]) by DB9PR08MB6748.eurprd08.prod.outlook.com
 ([fe80::c52a:4f5:95c1:7f1e%8]) with mapi id 15.20.5017.027; Tue, 1 Mar 2022
 20:59:44 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 hreitz@redhat.com, kwolf@redhat.com, vsementsov@virtuozzo.com,
 jsnow@redhat.com
Subject: [PATCH 0/3] block: copy-before-write: on-cbw-error behavior
Date: Tue,  1 Mar 2022 21:59:26 +0100
Message-Id: <20220301205929.2006041-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR0P278CA0107.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:23::22) To DB9PR08MB6748.eurprd08.prod.outlook.com
 (2603:10a6:10:2a7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 49605434-d279-43c1-665c-08d9fbc6691c
X-MS-TrafficTypeDiagnostic: VI1PR08MB3710:EE_
X-Microsoft-Antispam-PRVS: <VI1PR08MB3710D20849610540DDD145F6C1029@VI1PR08MB3710.eurprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6Ppgwkv1ShQ+yoqm0tm5AQ1ZQszLUJzIpmScFMFCzmMsgHSMQKOSF9hK5UM5e0rcx9ROrOnwcTu26/DwnoNSjogEdrcXNmGtkZmBAgd7TuTYailWR7SYQJq3y1+MmzBBxq4EW3mvAiyzjwoEu8sOUUjqWAmCjlVSlB0gi8gb5yNL4KlQwmztuyK9bEIysHxjdjwZslCVSfGQQcS5X7I8hFdeSYNB76M7HAZyfelgUgfcdMt3Kv9dRChlyzZ/RS+brsh2CAXdEc5ZZFtpbpRAjABn++qK9wjU3B0kTL4gQJZO41aSn5vkhLkLzsmLPS8Gv/IY+pcRrkr1UQYbJiRupDYvNoztwHXFpxQGR2Ne3a8d2apNayTEGw+wO8FlYa8OZ1zFpY33FluY3fZ5ecfxPaKvg1NFyy24sUhMmSFWZjABUpOH86a4Un7lzkXipUWsiJU8i8E1QoVWVEX7Js5mF/QNklbD8z3FV/k2rpASmIMVu+ezEDXutKRYUkIvQQ2EzZBub5c8q8tQ5PklrbzwdVfXtTIaVaQwigJ7iKvivkaVvhgtBDysopPxh2UQhoL9a8RHrXRVolqO3QljuhCdeLqXgpgKWXNFOwftUtLlksTpOUZPDZI7xKyJkf/O7+hRFMp06XpN/wz0rvIC7DLXwcWxquYADXhOgWjZ2XtPgJKG2h/FfhJaSTk8t8+Vks4I4oTOzu4MfYnpsnLLRvNFgA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9PR08MB6748.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(26005)(1076003)(186003)(2616005)(83380400001)(6512007)(5660300002)(8936002)(4744005)(6486002)(508600001)(4326008)(2906002)(52116002)(6506007)(6666004)(66476007)(8676002)(66556008)(66946007)(316002)(6916009)(36756003)(38350700002)(38100700002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?X4V7S9PI1bEFcttwKQm/zqNzrvdc1RLKD92VC86nG5eWQa9I20mvUONGANYo?=
 =?us-ascii?Q?pKfiirwWBU+2vAm7d6PKu/0Xw4IY2H2kqwvR8Rx/dhbLdN59q5BzDoHtXCGL?=
 =?us-ascii?Q?VvMSTcq2TSRa+NczYfOw6CVRdtAOz9RJo1qGTSgnS9cyUcSIcHHlPbooJvS0?=
 =?us-ascii?Q?LigV1W3MZ+JPSTodQ4qbbaQo/PCdOZd0jI5063dAOl4UvVmUabvBnzpkiGhI?=
 =?us-ascii?Q?kU+C+aZ3lNvsp8p6dmZvogn2L2lR6kIV//kQK3lJ4rSQxkldcv79FfMXnOIj?=
 =?us-ascii?Q?Moop7pSs1Br6MhIbc69FnGJa96QJJ5zxbTLBtY6pUohYDairkE+0B324lMod?=
 =?us-ascii?Q?elaj2SsWUAM57OTwmXryUhhCT0sJCSdAx8lRUG0rx+inKFywrFXiT6a8/74w?=
 =?us-ascii?Q?whYAMR5R799fFYu4+N8IMDPe4u4oyU50yehuMCuF8RaUtJkCEKHToY2AFD36?=
 =?us-ascii?Q?QIz0quAm+Lr/7PHzvmqOzMG40G8NgC2RVUa+90DJC83+rGFtPk1Asm0keCxT?=
 =?us-ascii?Q?VCxrwX/Qa9QtQXvNWqV9DOdYahOPz5SIlUZ4qyAUxzHdlSmGKtVLDUJYCAWj?=
 =?us-ascii?Q?EkyuWDmiTzEm7PNHR3ViCBzMRpdMyrKaeTHKFjv80CXulUTSl76F/TxkKI/7?=
 =?us-ascii?Q?pYEAZYFK8aH8f8QzRimSLHRJwQrDEelGiYMf/B2tSPyslvK0jIlQeVwnPBOL?=
 =?us-ascii?Q?B39JLFY6yrT9Z2N8eQzJiN4nkaIMsyO+WT05kcrj6+u5T9F4GmT85v/S2H8Y?=
 =?us-ascii?Q?+TW7T90tS0rhgpvGEcf+X5sTp6MW+HN0kG847uAysrcVcT5E0NWg4u5wFVI0?=
 =?us-ascii?Q?+7KPQoqHPBzT0dntVaGJfpD9b+kpHtYoSalTkdcKCVQ1CPyq/rCJXbgOHr2x?=
 =?us-ascii?Q?juXDe+4HuD1VKwjppUc9RU7/gwSR+v0eTcDL5YHpmEBTlCULbJs0d8zcs96F?=
 =?us-ascii?Q?22tP8q2ubsXEZPpeH7VqTT6DoEwgmRGkiPZQjiYxIFrVlHJcPQdATtUnFN6v?=
 =?us-ascii?Q?iKbOSrys/9rX/SWD3Rp95GNUTZ1alPzxIK2CRXq7hZIMEW8rQ2ROaNeQsSy1?=
 =?us-ascii?Q?zi2EN9FIxdgDzLZMyDQX/QPC6IaFqRkDWkgoDjQ0L/yQoQYfrcvUgXuBP0j6?=
 =?us-ascii?Q?0kr9j+ErOh7XSJuWYSTtupCXWlRaloJZKY7ly4La2PPh/K8urHb4Yz2yBFOH?=
 =?us-ascii?Q?V/mMngkYBtAbXH+SSYtVrFOmKU36M2epewz7AnHR0too9B0yovTK4O9D7kj9?=
 =?us-ascii?Q?d/T3ebCJcdvMNC3ethhkzPyMMQ6huuXnLfYkScm6iTeX8HrPi2vAqU7S/KSN?=
 =?us-ascii?Q?2HmIfOogh+cCqMc7X/MGO3nUD4wcSas9phgP/9ZQSXHh3AfVQSco2FGgE5Im?=
 =?us-ascii?Q?vntkKRhOvuDsjxusuFKSdyiz6sEGySXni+8uLvA7VDX8wqeU1VJ/Bm7GiGaS?=
 =?us-ascii?Q?eRRdvdTNOSBD3ijyc2fmGWsAR284qArcf9jbYOzdNPPsADi2NiU+HGc3dLTx?=
 =?us-ascii?Q?YrAGDs4FoOjg3+C04XlNHhBBsnNKByOkQyXAWP3ipfQNVHoflQNstpIvRlu8?=
 =?us-ascii?Q?FvdrZQxb5VD5ON1hx1eto44+ALZLVloao4XZjKfBzwCS2/tiDHI+rWw1cGYy?=
 =?us-ascii?Q?m36kgaaiNz/pR2+aj/v4P6MhBS/V//6dwdnWH61rk3z6JkVhNmWlAVE/2Li7?=
 =?us-ascii?Q?3njccQ=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49605434-d279-43c1-665c-08d9fbc6691c
X-MS-Exchange-CrossTenant-AuthSource: DB9PR08MB6748.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2022 20:59:44.1606 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9iiNha3fjuhQup8Gs3z1cEcHpLv13MJPdDrL8AtDuAptDiwn0HVPciBon954ggtsG6rZinkiau1aP24X8UvPNlpIokAMxZNPvQ5/B7WyrsI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3710
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:7d00::71e
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:7d00::71e;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Hi all!

Here is a new option for copy-before-write filter, to alter its behavior
on copy-before-write operation failure.

Based-on: <20220228113927.1852146-1-vsementsov@virtuozzo.com>
   ([PATCH v5 00/16] Make image fleecing more usable)

Vladimir Sementsov-Ogievskiy (3):
  block/copy-before-write: refactor option parsing
  block/copy-before-write: add on-cbw-error open parameter
  iotests: add copy-before-write: on-cbw-error tests

 qapi/block-core.json                          |  27 +++-
 block/copy-before-write.c                     | 123 ++++++++++++-----
 tests/qemu-iotests/tests/copy-before-write    | 128 ++++++++++++++++++
 .../qemu-iotests/tests/copy-before-write.out  |   5 +
 4 files changed, 248 insertions(+), 35 deletions(-)
 create mode 100755 tests/qemu-iotests/tests/copy-before-write
 create mode 100644 tests/qemu-iotests/tests/copy-before-write.out

-- 
2.31.1


