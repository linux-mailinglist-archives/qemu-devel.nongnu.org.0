Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51B5A6362C9
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Nov 2022 16:07:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxrKK-00079P-Dk; Wed, 23 Nov 2022 10:06:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1oxrKF-00077q-3l
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 10:06:11 -0500
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1oxrK9-0002B1-Oc
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 10:06:10 -0500
Received: from pps.filterd (m0127838.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AN8sGP5018869; Wed, 23 Nov 2022 07:06:00 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=proofpoint20171006;
 bh=HJPxmcBYyibT1sH6ksMX1yUYMxYST/loy4hoNvL3TBM=;
 b=pVmZvtpZwLXpXs2+BkCrTlK/b2YQOqVJKotRhk06uynxTnCzvN8witCzipVsZQPSD3ks
 1Cjh2efJIUj5kBYY2Y+00pFeoOyXewcPccaLVxZX5ncR6rCzpgEp4Ml05dGJgEiFQwXE
 RxIEzsFdxLhq6jUFFbp23MB9eDtV2G8+SH+YsYtSkbMcZVWwLoQkcgex7tP23NL+FSGp
 p9Jly2iO0K+mi1D1sEJojcVQaf3d6EsmOq5DjwduMzoR7TBiaV7ZMAGOqeAnjHC9LbUs
 S6ydPIwlTdNNhfrjfl+MMUcHTMEejep2N9ly6FzoD/KivpXjM4FYLTmqVM7abEzt+5WY Sw== 
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam02lp2048.outbound.protection.outlook.com [104.47.56.48])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3kxyk3abnn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Nov 2022 07:05:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zg2ze78+24rA5JrL73dSO45npE8zYWXhblzmH9L8OwLV31TouOpxlooUMn9YqnEqeRgelyO5NADJJrAgAhMSIYLGZPMedw/tvdO6G07VQc+ElgBIAiFkyaP5vX+16wuNVdrs6Tf75dViqppPEhB1dOo0sbAbF9Vo5MqWeGSqfT2kxMlvHpq09n/f/E9jlRDp+wQg52CyIvFY1r1+FkTEJiqpUQE4ioDcb9QpCrfb7ASskiDvEe83vIotDBaM8hen8QWhV7b9yw1a1Hx2YD6y8ldRb8jKkRRyikj4+t0BgmTFJO7FLaF7yqmjTUzZowrcMTDNvIN/wwsQVrVdv+FU2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HJPxmcBYyibT1sH6ksMX1yUYMxYST/loy4hoNvL3TBM=;
 b=BnLi8n8nD+mlsM4qkMboX7NW9S4obSkxDOn161dv31SFDUdV0CI2S4laH8KJZyESyjIHBXeScowU1jOgWvQO5i0mUOHripH8KHpno/RN1I6HTsUTp2H+D6ChXkVLGksjLK/sngO6ZffDLmiHF8H1y20QuQ+xtUUi+2Mvl/N4EvDfXe35627kwPimhLvbQdT3LREOsqsNamwowq0/Y7Vhx6Bnu/ku2Ha79Tvqd11eJsy9kwCKT0e9gZQ8RUExtzzMAQNvlt/ianALh5tLAb3Qi63Yq7NRmOIv2vR7AlPne9dfCWsWXRmbjS65JwCyFIJ3uXlhyHE0HxwF/Q4ChXIs6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HJPxmcBYyibT1sH6ksMX1yUYMxYST/loy4hoNvL3TBM=;
 b=KJvhkjTOs/MpK8DYG6d6iYELb+MUsSUhEM04msaeaIYJFUgctDICQ0J24oH8t4daGBm/WDkbA+qrZQ1Pv3U/YUf+rsxvmbIa8NZ9cMjWFFg04IFMEX386hbcMYPmiNPCmqlyrBSm/J8KYErMqWdXl91ggH+JFQg9R3k1i4fg5baSbljdrPopuV+lHUMzKT6jxz1C9ZMHbmEKlzqQDXMURhFzaZaU2wZ3cDrw3GUJ5L9oZW1CmJ6lcpUMBHao2o8714IEuYab8KwBAsPCHEWTIVevsUTAvwsViarrfopjBh/BoLGwSUfqfcI1yXdQZW8cuJBRLEFvr6I2N9fIhdubNg==
Received: from PH0PR02MB7384.namprd02.prod.outlook.com (2603:10b6:510:12::12)
 by BL3PR02MB7908.namprd02.prod.outlook.com (2603:10b6:208:353::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Wed, 23 Nov
 2022 15:05:57 +0000
Received: from PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::dff2:2d3c:e182:fb66]) by PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::dff2:2d3c:e182:fb66%3]) with mapi id 15.20.5857.017; Wed, 23 Nov 2022
 15:05:57 +0000
From: "manish.mishra" <manish.mishra@nutanix.com>
To: qemu-devel@nongnu.org
Cc: berrange@redhat.com, peterx@redhat.com, prerna.saxena@nutanix.com,
 quintela@redhat.com, dgilbert@redhat.com, lsoaresp@redhat.com,
 "manish.mishra" <manish.mishra@nutanix.com>
Subject: [PATCH v4 0/2] migration: check magic value for deciding the mapping
 of channels
Date: Wed, 23 Nov 2022 15:05:25 +0000
Message-Id: <20221123150527.24608-1-manish.mishra@nutanix.com>
X-Mailer: git-send-email 2.22.3
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR08CA0026.namprd08.prod.outlook.com
 (2603:10b6:a03:100::39) To PH0PR02MB7384.namprd02.prod.outlook.com
 (2603:10b6:510:12::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR02MB7384:EE_|BL3PR02MB7908:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c482e38-109d-47b2-46f8-08dacd6438b9
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lBqSRl1UK/5M02d3/GqHNllKaRtry1xTFjo6kCi+yAnhaAZO4J7PlwQQEJMrF6bsSZE7gLxzxBLcavzhed2LPF5qTXhnt6Q1CIjRBMEjkYWEex4ExDit2VM65kzksjSm0aqA5gYAEN9Mz2qCNYqn0JSEXDWdoWAY2/ArHWuGB+eEPV+dt7/0M4p0khAWrDMX+c4PFfIrgqup2OMuGMp4QbK34+X+Nc3yNbjfcCMvyzU5EYq6nVZnm35xiC96vRXDqV4YTtkWKlogChxG887Y0nv+861x+zhHHASZLbUSu70Gll8AS8Q3+7533TbcapvJGDf4/WXTlqCFZJRhXEoynNzdZkoDdKEhp4DYB3RBMG9cV6dnw8731O/N2Tn9P7XELk8u2if95mPJYOoQ4wahXKK30WYCSC964eoazDMb9Ua4T+Fu2NDOJduFJXmWdr3U9wDS9f4SKc++ckHuTwqM6+kx/uioaCek4/hhLQQ1FQd7mVL2m6omy0IVFlkb4hnFXbngVQidL09pdYs8oj/zqKycq154r0CpzAwXPbQdcL2EXR9sFMM4gFu/+LOxfVKGeq2sAuoXH1SnK1U3qS79jrZpocfLRJ5lLo7peHO8L7OgmQiwlvjQ25VdbPWozYpeunBwy23xWqTkPqyg3tEAxCVqZfMG0Y8BhRjkhHxuuxoeayU6880N+L7C1Xq/43tu
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR02MB7384.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(39860400002)(376002)(346002)(366004)(396003)(451199015)(36756003)(86362001)(6506007)(52116002)(38100700002)(38350700002)(66556008)(2906002)(83380400001)(8676002)(41300700001)(1076003)(8936002)(316002)(6666004)(26005)(186003)(107886003)(5660300002)(66946007)(6512007)(6486002)(66476007)(478600001)(4326008)(6916009)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?O/mmxCISbT/Udj72AYJPTpmLJDZT4toMWtEUln0qiFTxEoDPHXMQb5RVXVt2?=
 =?us-ascii?Q?pOUishmD6tvHsHQYQpurcpG4OoXvNop3DeptzZEe+ok2RjjxSwyF6OFYCmqh?=
 =?us-ascii?Q?nNBnHfaWxnu/j86ecQV/HW9B1APJMuSqywLSftaDYwFK/S96BjmC4+U4ur0W?=
 =?us-ascii?Q?rkGLjU9mdvuh5zY9585yw8dN0rHdqpEGI3b/o7xxS8HWNfJRzY3+3mzVx9bh?=
 =?us-ascii?Q?xXLkUkcpQonmi/G0QEQ2HRY4WRu2xndVBt+fMvq3gnTxmgknyblHP67K2mBj?=
 =?us-ascii?Q?SkyBG/GRdlUFkxm+6+WeilWZgTuxgUJ/htL92xao7G1oG3HwUeBp0qPXac80?=
 =?us-ascii?Q?/M3Q0pdk/JJF51vZ5Jwx4RbJ5nPwC4bK+Av8YVD+ylMitNMZY3ZbWK/tj1vz?=
 =?us-ascii?Q?tN+HS2JnCXLMZ+3hAKik+sLGMxjkpJu1BzJxJDZZSM295rkH0quVaHnOjghM?=
 =?us-ascii?Q?/uqqruVvpAgTttvY3/qX8T/wmrybutqbphD6Z49P75nlHs1nzoE1QdIAQEiz?=
 =?us-ascii?Q?2Ak/tydIra1pz/SdwJCfziMwlGHpdZuG8GI3aju5+3ByAl1Irq6qpA/thhQ6?=
 =?us-ascii?Q?wG6v8/8fQ3MU8evxwTh+0en0ajtpGh2cXcYM/u67O4z70INtt3M9Gzmvh7fH?=
 =?us-ascii?Q?pJqqwK8uas1bCfsPXauNUbz9K4EDCCJ89flkk2cNEsn+WjarG7wF/M3QlARQ?=
 =?us-ascii?Q?mvM6J5MkzNUQKkZF4jJe6ZzJfj7oTFvOcHZK3wb39hLl0OHNCsrAHEeJLO2q?=
 =?us-ascii?Q?0DkfoW4mT1xkINHTaO4rimtPobDrHv6zZfaTjHcOXLMRrW6Aiv+qJjchAzod?=
 =?us-ascii?Q?9QuOnNeeaWGY1TRQW757ZR+34GGWu60F068//A6mPsh18z7YvH0Xvm8HM9sJ?=
 =?us-ascii?Q?ZzRHLUY4PtCWtx2Jl9Pdz0D7P2RCoM9sjcVwD5KTJWIg2EthTiN+0ajzBiI+?=
 =?us-ascii?Q?XivX/LygLOsCyCFzSY0/QawKc37vj9pbbeAdiiuu8yWQLGCyb1Mf4FkRywdj?=
 =?us-ascii?Q?McjfUSGdu2pfDraFm0IS2TYvOHbsL/c0/tfaTqDGF924JOZ75sNwhbsfR2No?=
 =?us-ascii?Q?0mVm1V8WSXoJrx/tOaKNbKuwzvnOO8OGd+Gaj0eJJfzlv0U8dMRCFFqbqGWG?=
 =?us-ascii?Q?1hEQHPS3iqhCDKV5qoU1T0YIOTsvhikfPXrKRZSf1t1Xh8XpDkYo1J8qn4lw?=
 =?us-ascii?Q?hVMxog356bBBNS9yQ/FbUux9CQfjJz46BE/BhPteUhziOET0RbsYdq3Bnt46?=
 =?us-ascii?Q?o1x6k7Vr2mOg70NLcNH39gRVxQ7V0N4+o4MHHPBJUXFXsKbFuX3CmxerGx9p?=
 =?us-ascii?Q?FyzMBrzyl6ubS6AOxxBEoab8hoNlRWJoJd+05wczNrpjgwnWzfKwk8FMjH5a?=
 =?us-ascii?Q?A3+BG+VbeCqswyscn21X46+VTg8NwJw0IvZyjfwUlamuOPbTh8Zt5uquFL50?=
 =?us-ascii?Q?Pj71p3cbE6naOOSnUjaDR8OMGof63V9puQ4qspXm21nVTkvXRrc1cmU58gcZ?=
 =?us-ascii?Q?mAb0gjfStC73WrUEDFOFv+oTRI88k4sGIuXejD8HS6npYjlqYgLZrZtm7jo3?=
 =?us-ascii?Q?qIUm5phZ6kPyu+/0oeCy5amVkw92Nldnw8VoIuIthz4JKqzVXVeGk3mD9bDD?=
 =?us-ascii?Q?Uw=3D=3D?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c482e38-109d-47b2-46f8-08dacd6438b9
X-MS-Exchange-CrossTenant-AuthSource: PH0PR02MB7384.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2022 15:05:57.4236 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SAXR7fYwrt+j2bdiQenUl6yTVZrqKeMff0d/G6RlqIM2g7BUOQzQ53oOs+mPOCHzJ9lZj2oQQVmJ9raViY8uSvosK/2wBzCMz9aUsW4wRPM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR02MB7908
X-Proofpoint-ORIG-GUID: XvsqR1Ew_fAkRUGTyGuJHBn_wRmDat3W
X-Proofpoint-GUID: XvsqR1Ew_fAkRUGTyGuJHBn_wRmDat3W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-23_08,2022-11-23_01,2022-06-22_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68;
 envelope-from=manish.mishra@nutanix.com; helo=mx0a-002c1b01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Current logic assumes that channel connections on the destination side are
always established in the same order as the source and the first one will
always be the main channel followed by the multifid or post-copy
preemption channel. This may not be always true, as even if a channel has a
connection established on the source side it can be in the pending state on
the destination side and a newer connection can be established first.
Basically causing out of order mapping of channels on the destination side.
Currently, all channels except post-copy preempt send a magic number, this
patch uses that magic number to decide the type of channel. This logic is
applicable only for precopy(multifd) live migration, as mentioned, the
post-copy preempt channel does not send any magic number. Also, tls live
migrations already does tls handshake before creating other channels, so
this issue is not possible with tls, hence this logic is avoided for tls
live migrations. This patch uses MSG_PEEK to check the magic number of
channels so that current data/control stream management remains
un-effected.

v2:
  TLS does not support MSG_PEEK, so V1 was broken for tls live
  migrations. For tls live migration, while initializing main channel
  tls handshake is done before we can create other channels, so this
  issue is not possible for tls live migrations. In V2 added a check
  to avoid checking magic number for tls live migration and fallback
  to older method to decide mapping of channels on destination side.

v3:
  1. Split change in two patches, io patch for read_peek routines,
     migration patch for migration related changes.
  2. Add flags to io_readv calls to get extra read flags like
     MSG_PEEK.
  3. Some other minor fixes.

v4:
  1. Removed common *all_eof routines for read peek and added one
     specific to live migration.
  2. Updated to use qemu_co_sleep_ns instead of qio_channel_yield.
  3. Some other minor fixes.

manish.mishra (2):
  io: Add support for MSG_PEEK for socket channel
  migration: check magic value for deciding the mapping of channels

 chardev/char-socket.c               |  4 +--
 include/io/channel.h                |  6 ++++
 io/channel-buffer.c                 |  1 +
 io/channel-command.c                |  1 +
 io/channel-file.c                   |  1 +
 io/channel-null.c                   |  1 +
 io/channel-socket.c                 | 17 ++++++++++-
 io/channel-tls.c                    |  1 +
 io/channel-websock.c                |  1 +
 io/channel.c                        | 16 +++++++---
 migration/channel-block.c           |  1 +
 migration/channel.c                 | 46 +++++++++++++++++++++++++++++
 migration/channel.h                 |  5 ++++
 migration/migration.c               | 45 ++++++++++++++++++++--------
 migration/multifd.c                 | 12 +++-----
 migration/multifd.h                 |  2 +-
 migration/postcopy-ram.c            |  5 +---
 migration/postcopy-ram.h            |  2 +-
 scsi/qemu-pr-helper.c               |  2 +-
 tests/qtest/tpm-emu.c               |  2 +-
 tests/unit/test-io-channel-socket.c |  1 +
 util/vhost-user-server.c            |  2 +-
 22 files changed, 138 insertions(+), 36 deletions(-)

-- 
2.22.3


