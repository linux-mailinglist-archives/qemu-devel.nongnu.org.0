Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B8FD346028
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 14:51:25 +0100 (CET)
Received: from localhost ([::1]:35564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOhRM-0001ts-86
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 09:51:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lOhOM-0007Au-0I; Tue, 23 Mar 2021 09:48:19 -0400
Received: from mail-eopbgr130102.outbound.protection.outlook.com
 ([40.107.13.102]:31392 helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lOhO9-0001rq-5I; Tue, 23 Mar 2021 09:48:14 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ckq01Y9cibTKOjaizR1Y9TxxLklZrafG+w8wUFRG6HQrQITi4hxVjv2ZI0cO8mDut86cZ+iTG9Rnd5JSV1Y/Wby+Txdye52ic211mxgoDPm05cxtEXfUb9O4xFEAhJiav7ODe/Inh+pe+v7298PbS1d2Pcc88UhBfr3yHTi2yaODW1MBqhLiFddJmw3WuFiW+x2FtzM4ehM3dHBeXOfsE4g9fS2OoMp/yJVSETZ3h3dFLcbkdI/sG+3pAENtNP3Ocm/SjvCbNuydwQwy9AsNsU6HEWAQ2jXaLHo1BT96k9o8wnWk2kBcocG2RJPh8stFIODWBJSAVYb4RrLMqYcPtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6sDxMOt9My8DccGt+JYmhPUyW7ZvSb+Rwko8SZfUyHY=;
 b=jgLobwfVDQgieOb1yN8aNX8VJIfQI/4+l88d9QGVN7CqakFXF3JkELE0EHDgtjHidjgo8fJTwYwt2FJ0HmGJhjD7QWWt737DgLkapvST72xK5RY5u+EJ1whNauZwx9yU27etqOZ5fJ7hceypxqFDjBl9vXZYZXG2fm9FoZ1CHxTgAGnzcrGVF3bIyvzGPqf2hOxcTNe/qzQqaHYTK6gJb5U1mabvV/STRmq4lZfyXqweymgXFDdJkl2i00qkX3+iesbshMsbajVc0QFKMA6hWH+lieRQ0xtsJoqvVlFN1AbCAodqMa5ZCj8+72HwpcFnJRBhBwV+afZ/6BpUyzSFEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6sDxMOt9My8DccGt+JYmhPUyW7ZvSb+Rwko8SZfUyHY=;
 b=ET/Rh5HsPYj2p0HzXitcQZwnpCHW8+Q5qET/oSOvphQgjRXrRhq6Vr/qVLbaHhWanfWIXwMpMjJ8jfEUY/3lJg/eK+v8yoPAjHNDAaTX/I6YkyR9f4rBnX4U3fCY/Rb8JqOUrZjac/4cN9QA48kqqnoVeNAJy1GgaPwVKmAS3qs=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4070.eurprd08.prod.outlook.com (2603:10a6:20b:a3::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.27; Tue, 23 Mar
 2021 13:47:59 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%7]) with mapi id 15.20.3955.027; Tue, 23 Mar 2021
 13:47:58 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, den@openvz.org, vsementsov@virtuozzo.com,
 mreitz@redhat.com
Subject: [PATCH v3 0/9] simplebench improvements
Date: Tue, 23 Mar 2021 16:47:25 +0300
Message-Id: <20210323134734.72930-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.202]
X-ClientProxiedBy: HE1PR05CA0184.eurprd05.prod.outlook.com
 (2603:10a6:3:f8::32) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.202) by
 HE1PR05CA0184.eurprd05.prod.outlook.com (2603:10a6:3:f8::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.18 via Frontend Transport; Tue, 23 Mar 2021 13:47:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 24060a74-00c6-43ba-b395-08d8ee0244ef
X-MS-TrafficTypeDiagnostic: AM6PR08MB4070:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB40703ABC8F6D01CDBE483AB9C1649@AM6PR08MB4070.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1360;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5K6linopgRqbvxVx2sPkqlSvBaXgAdH32fYgwK7F2RcXf9DYde0/sKkXT1n2rpxrQtP6Mz66hTl2t6QyIBmPPJLsDaBPU6JcDjmt8RLQenH4wExzHwuT31BpG1sp19mCJ4Q2J/QTcXEVWw1L99HUuGOULldrRJ1OT0wGRZ4GWkWGwoC+107XuczABLAn2JEBHiYwrASJ0IN44QB7a8UaidwvdNdLH/2PWk4sqp2DKrUI1eY+Ec58iHVinusitKH++JG13oZ3Rk82XOQz4Eker+gsKgQ8RJCWO6dbfJ3fVEBXDdn0t3wKkL1Ei/0rIGiWz7lXmM8CMePo8cgB/JAnPg+MemJLzVt33QjTmR4wmPeUleJ0N9tk8PZ3gAb+wvZtgJfLlw58LO0S5P65ugeEUU1/ir+KsF7zrUZaQ1NsIJOtOvin8da6U15JrGR0iT+daEDUJI6XmVtH8zL1XwIqP9qqGJYDLlxnhyxJaMU14oUM0rBZbioEIjMh/dKL4NzJ5fNXmEC8Aor3JeoQnhMFc/wwbrgup1Dk5jUzqmSRpwpbOOc4JzaDFrHdfZ1UtwWBR//N4xWWgr0D9X/Q4eCro3D+VjqCXHYahMftyIVp/LG81q5ucLAo9MK9Hn0AyBwbU8hwlLFpPWxYw5CZEbb5n6PgIIy83v+yAe0ppmnuIpnQPq+XbppgyuT1SOs53Ws7
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(396003)(376002)(39830400003)(346002)(69590400012)(52116002)(8936002)(6916009)(8676002)(1076003)(66476007)(6506007)(956004)(83380400001)(66946007)(4326008)(6512007)(5660300002)(2616005)(36756003)(38100700001)(478600001)(66556008)(316002)(26005)(16526019)(186003)(86362001)(6666004)(6486002)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?xmAdnl2xdGqC4WGSy2ii8HY7gcyWJjCiRDzg3cnEpkCskbklPDIFWqyMHze3?=
 =?us-ascii?Q?iq4o0furASgQ1UF2LC3OM17DZv8sDOpRrBiy9M82YCa8VD7SVAisyVkhsTrk?=
 =?us-ascii?Q?Oheou7ld/Q26HrNaZnvk+lnPCitYPh9RDFv6oBmqqsDUf3o7I8511I5EIipa?=
 =?us-ascii?Q?AIRoB+YqgUUUGyiUkpTGWBT5BDIOPfMkdH+qewUQR7LWyXO5VSQIitNc5imw?=
 =?us-ascii?Q?NKDQ8ZtUpBC+pcrM4WbLLt8WXr3fcC1PDWD2S6FTJrW88fKi6H8DEF8/i3hI?=
 =?us-ascii?Q?w5SFwlWXjfoS4iOGqwzYZV6GSCZSgpmrUqfWwookxv9dkUAi+gjKVPICKFvJ?=
 =?us-ascii?Q?+mZbwQTgNL25sWgCHznIVRCRGk/3UtqaxnsDIO3o+3KHwPZVtk1dTH4dS4Sj?=
 =?us-ascii?Q?Kn47qs0CBuEg4zeoLez//Zp+Sq9WO5JK1r4SGwpcRDwAFjdtkpqZB/81T4mN?=
 =?us-ascii?Q?07cTzG7hvivJ/txuYY/NZdThUOcctNCPMfZQeSa4Y05BMWvicipRS5bR6tJM?=
 =?us-ascii?Q?w2aJ9oiJoO1eLqorlnqK//Dwr0uAdcSbweSdg1IOJ+o1AiJq16R8yF+hJbxz?=
 =?us-ascii?Q?R3c4mU6+lNtrCnkqMsM/wsNY11RtwAu3YTd2nY/2vRTTEi16vdZzqqlmalyk?=
 =?us-ascii?Q?RE+Ip+BkGU2wyy6E53/Mzm6mWKeCxHz7vTnSu3FAhrVMG0m5WpyTGcMvlnGm?=
 =?us-ascii?Q?2H96n+VvIn3MzDSQndla8J7c5sSpFaWUPiOQHKg/7ZoSR/zFUKnoK3QVyGJx?=
 =?us-ascii?Q?/ihEys2xzNufFDueLGEZUGZmhqrrjuJ+apG68tu5gkO1TCL/N0CNBVfaPeOn?=
 =?us-ascii?Q?Ys0fO6lIYhHu+SO3IYfecYpj8h2H9x1gZgZC5e1UKuddnm365DUeCwUt8jXq?=
 =?us-ascii?Q?vIfpxqbAti+0VpDzsH9ODW/9U8Qr+q9BglbEuXHyxb+gcLsG77B2YF3QdHti?=
 =?us-ascii?Q?kOFIASE3HrxJLBeHW6M4krg56/8ZVcua1Trkm4tK0PigmHfxBgWcZSh4/ffm?=
 =?us-ascii?Q?8ZwZYS1KijBsC16PvFR7MEchyxaTgaNZUna1V0GAA3S/1VZz26eeI8Bkp3f7?=
 =?us-ascii?Q?4h5W6XwPs7+RVmHWD+uXA/g+Z+CI5q1+fv9iuFVe5E2ceWq8xuKXqHEqZrPj?=
 =?us-ascii?Q?S9a39UYK/4Inzk+jzAhmgraqwzGgNZmw/vDLfMOV25AH00g2/bds0PslEWmS?=
 =?us-ascii?Q?OOF/th9f1J1H6Xb/rmVLDwwWisJI04yeIjB+oq2W3CGoowPyHFS/wOE1/CXm?=
 =?us-ascii?Q?r0bXSdWF0bzOAUVebyV7A47LvPnM/LZGhqDvEHWD4nBFQgy3YUBEbNW1pni+?=
 =?us-ascii?Q?Do5vRYHGL7XFZhWhWmjFAg56?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24060a74-00c6-43ba-b395-08d8ee0244ef
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2021 13:47:58.9070 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pengDzCVf/L72aTpkzOnSNttrw7c9o2tO8tCYFJMkuBIi0kO8bY98c0xrN8FkeQgUCfIzyYBy7c2nqUd4kB8nVsIPVI9jpkv95OprtwFors=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4070
Received-SPF: pass client-ip=40.107.13.102;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-HE1-obe.outbound.protection.outlook.com
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

Hi all!

Here are some improvements to simplebench lib, to support my
"qcow2: compressed write cache" series.

v3:
01: use simpler logic
02,04-06: add John's r-b
07: use BooleanOptionalAction and
    initial_run=args.initial_run
08: rewrite so that we have a new --drop-caches option

Vladimir Sementsov-Ogievskiy (9):
  simplebench: bench_one(): add slow_limit argument
  simplebench: bench_one(): support count=1
  simplebench/bench-backup: add --compressed option
  simplebench/bench-backup: add target-cache argument
  simplebench/bench_block_job: handle error in BLOCK_JOB_COMPLETED
  simplebench/bench-backup: support qcow2 source files
  simplebench/bench-backup: add --count and --no-initial-run
  simplebench/bench-backup: add --drop-caches argument
  MAINTAINERS: update Benchmark util: add git tree

 MAINTAINERS                            |  1 +
 scripts/simplebench/bench-backup.py    | 95 +++++++++++++++++++++-----
 scripts/simplebench/bench_block_job.py | 42 +++++++++++-
 scripts/simplebench/simplebench.py     | 28 +++++++-
 4 files changed, 144 insertions(+), 22 deletions(-)

-- 
2.29.2


