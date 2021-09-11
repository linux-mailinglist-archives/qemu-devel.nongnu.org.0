Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DA3940765F
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Sep 2021 14:04:22 +0200 (CEST)
Received: from localhost ([::1]:34920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mP1k3-0008Hy-PC
	for lists+qemu-devel@lfdr.de; Sat, 11 Sep 2021 08:04:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mP1gf-0006We-9G; Sat, 11 Sep 2021 08:00:49 -0400
Received: from mail-eopbgr80135.outbound.protection.outlook.com
 ([40.107.8.135]:45662 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mP1gc-0000VH-Ju; Sat, 11 Sep 2021 08:00:48 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k4hX9nIZUWMtjFBmghnI8A6JVJy53NmSXWewpEEf/A8l1vlkprg3AFN4NIJaz9VW3iSojdUvzuULoWrqSP1bmgRBPu1ARRHweAIvL2DWhNRJ8ranxXZ1NsZOESxl7o5UfxCMNLEIFfaCUtY/RJ2wd47phznJqOOoued2Hh2JcYXNXTqs//erzIvA12UMFgGcJ8h4/YK4RyTmdIcX5iEzqJPg1YxGpREcsVrDhnljBK7nZPJoRggCvyhz5mDpR9EdCDKrArStA/HWLCwHHKL4q034Da3+D+ORRECG/GmKD4pBxZ3GTOjOtzHBWoqyqfIAXqSgQvfnVC9m77DMk0B1hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i7J+PLuX8sBKTLVFPtXsGNknhoBbx4bEV1NkRVwQjwc=;
 b=Wr0j0p1YS2G617DQiB/EKPX/MbP9kcIe/3knfCE5MGWZxgRKyWgBW7DUnYllNcClUwUrkEZqWfD6lACivcmKemu0flSCM07/l4aS5ii57uKGjA3iC2hqMfKL13MVBjvletRuX6J4tdY9KI3FlXsGVsPU/yg1yupJayaU2nCFSZy/VMaJ5fUUBRw2nkxm0ygQJ4yCODyBBbpLSkwQh6/BssQsFezTQE3CazidG0b50azcB0SqetChvQjQPMwmX9rx5F2KLqSzGwWVZhmuXV4ImPxEMOlmJV/w+BnLqMaqgYuiLGU+aDpTrO2SuRM5ydTA2UqO7PoODxoAZcewKQt89w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i7J+PLuX8sBKTLVFPtXsGNknhoBbx4bEV1NkRVwQjwc=;
 b=FNn7HDcxYeue1aHMy4RH9optcSH/0vJ7qM3KVRYDcQWFx2wmTxdRjrI633f1VvlteCdlLbWcz8EQKTDrh/fBjUBJFZgiOrxM01uToxx1UC7kPdH0CCyvuBNvoH471nHpNdHKdB+BBlKWpND6NW0jyBFwPTiHsPoxuuTJi6YohgU=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB5080.eurprd08.prod.outlook.com (2603:10a6:20b:e2::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Sat, 11 Sep
 2021 12:00:40 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%9]) with mapi id 15.20.4500.018; Sat, 11 Sep 2021
 12:00:40 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, hreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com
Subject: [PATCH v2 0/2] fix crash if try to migrate during backup
Date: Sat, 11 Sep 2021 15:00:25 +0300
Message-Id: <20210911120027.8063-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR3P281CA0054.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::18) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.196) by
 FR3P281CA0054.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4a::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.8 via Frontend Transport; Sat, 11 Sep 2021 12:00:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0f58f837-06fe-4b05-377a-08d9751bc68e
X-MS-TrafficTypeDiagnostic: AM6PR08MB5080:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB5080D47F6D592F446BE27884C1D79@AM6PR08MB5080.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2043;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Po2/r3tI/6mqUoMPCwmTOKFdgWodwtYHYi1zzhiNepXwQ9Jq/17ul5MJHaeFMICNb4BlPlIV4BzSz7/Et5efDJTDyjvgtLv3mDuPkM/14rlAP6J9kgdIjfG/IlI8p2/wGVDAmCv4vW7IPOq3Si4U/8PST4K08xIJF9P25HbnJnF/efRRPjxP1E/6m1C7K6RW0UlLHq9X6Dgqf6493+wMrLZWkac6v7y4Mdl6mhxWJPRnoDScd4XCELsq5lTw8yohvC+K3PqdMtPCicWkQamJsUypQdr6g/oOLkx+BdZRgDZByQSKFgp+jXaECYCR5BjzHC5qjsKjB32KHA8lZX/czKUqHnBEhJl29S8Efs7AJuYwNdbr0mRB/yo7UJBi4my1khPxqR4yK0bfFq/ThdYkVkG+xY03D6vHtWS3E0FYJuAP2kv9bj7Rhvteplh2ZhNFi7LZ8GbcPDjtoNBmAfDEc7qr/qAnymaRT8bY+qeyspE8SvNcVBKmEZfNeW1QXAEZqYQdns5s3Ifn5RQKSLkXnpCEERfSTpdVrQgFRhHaoPA3IknsDW+aqFpsea7RAc6CnMFNE3Oglqk5ynXai+6uajfZbdw7MIaPZ996S9m8FGILdYpUhHXPBnZ1oSASDf+93KJRwGEjJItVKpTo8I66GReuBbg3npLhWwMvN4Gtj+rc/thB+qaS84BSOHbsO0fM
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(346002)(366004)(376002)(396003)(136003)(6506007)(38350700002)(4326008)(6666004)(478600001)(6512007)(1076003)(83380400001)(2906002)(6916009)(66556008)(38100700002)(8676002)(316002)(107886003)(66946007)(4744005)(2616005)(6486002)(36756003)(86362001)(52116002)(66476007)(8936002)(186003)(5660300002)(956004)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HN7iGSetNbKuKtqrRESuuxynPoqjadtQoFRJaYdhgGq9RrIbFU9PmVCRabi6?=
 =?us-ascii?Q?BJ2ghSqMtuS1P2d1u4RNEqTq4m+dm0hUi4dm7DaEI8mpitm5TZyNgHTOn0zY?=
 =?us-ascii?Q?+Xpb4VYG+b5EQx0m68+lbdoqa+L0XAgDlamnmda9yD+HNRILmZw2Uz9SmYj/?=
 =?us-ascii?Q?z+VfHxw2iLMqoH08VxEAMItqkWVInYEnJzsYFOj71WNgDN8iOdDLEVrVmXsE?=
 =?us-ascii?Q?PbUJGIQr89yrZLQPKY7npHdndD0r958GAYNuwnGKg74GkJ69vAWGk9+C/QGR?=
 =?us-ascii?Q?i9ziY5os1t0A8a1b8XihwL7ZMqNybelesUKMo301VHtzogsK0wY9AIsQLIkM?=
 =?us-ascii?Q?7e8X49CK7KEgudHI/jBM3ZnNA34QYMlDTo1q5S439g30+rhxSFSSTnxwMT1Z?=
 =?us-ascii?Q?TYxJ1Z2/GRBp93o/L3eFAnC/HbnEn5G7u8BKSIbhK6oXJeIuZp03vZOAdzQW?=
 =?us-ascii?Q?F27oXJQPfyPE+vkdkaibSBfQAnPv4K4WQ/kNP0TPTwRQCIryXYAMqi+dsyau?=
 =?us-ascii?Q?6MttPDDovqfjY8rTcyr65koL3NsIjtMl6weLCR3zlTDMV7jvdrND9QNCLRHp?=
 =?us-ascii?Q?WhXDBvKGSNmlPMnZt2TxIvuOdXkBcZZTWZBkmR6NGdUd4pM2B9ifv/USWs7W?=
 =?us-ascii?Q?0d3QExPtOL/HM5fMv8XaCzNKmZxULmeQiX3eZSS/l/2FYI0RIeHMroECHD5p?=
 =?us-ascii?Q?RGPNQYiPnbqJjOmOl/49ucT0p9gucBM+HxpOxc4ya2KIS2MHqUpo5u9yVrD4?=
 =?us-ascii?Q?axwbXiR8+0VuDGcm3vOrrkplfSJQ4tLzuD25A73BhyIcs+h00/AucYGJX0Bb?=
 =?us-ascii?Q?38MY6P2XdgFyfgg8V+hJ/TUa4ndGhnUMt5+mwXaeMdOh2SXNfsfT+VBjYQg8?=
 =?us-ascii?Q?kNF0AqK8qytlXcEWUVcM9EgmB3iOUseKdHzHlC0LO7q6X3SYipBfF6OnpEpx?=
 =?us-ascii?Q?TqjmXg/3PGqrEdBZqZQD3yVMt7rbQt0Cu5ZyhRLdg72IMFmdpJMLu/1h+Kfg?=
 =?us-ascii?Q?mnzqZG/BkQlFIKI4ak4UIf2ii//dMa15RGF1Ct6K1jCdbBfoLy43UhNjcMqY?=
 =?us-ascii?Q?fY+PxfjZVb8YeJtHOnDKUctUvgOb90EzjNcrq7zPcO7nowWjuz79qyDzqUW+?=
 =?us-ascii?Q?oxCMgn9x7l1wwlyFWpM789yA/HJOPi2RWNcS98vsa0k3LEZ5un33cxJOO0cp?=
 =?us-ascii?Q?qJkSxdPHq487OQ4ZP3LauY80BWJ321iJbRgjQhNamc250vvvtidEhAv2lkms?=
 =?us-ascii?Q?NYsooQ7FXk+0tzSjwnmbdiJUoVbK0bxmr92Z1MOXXmVWmo1GXcqk1akrCk7F?=
 =?us-ascii?Q?O+TI0bkXbNzFasgfO1vSRyl0?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f58f837-06fe-4b05-377a-08d9751bc68e
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2021 12:00:40.8099 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DVm1FgHZB0ugYifLCs7onaB0asq0iX0E8li9KukqnpVz+zpjWuYrGHQ9GFEAfzABNc+03osaI1yAQUMAMc6xc2QPIbKDSrBDNsds51uRDyw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5080
Received-SPF: pass client-ip=40.107.8.135;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
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

v2:
01: check that migration fails
02: Add Hanna's r-b

Vladimir Sementsov-Ogievskiy (2):
  tests: add migrate-during-backup
  block: bdrv_inactivate_recurse(): check for permissions and fix crash

 block.c                                       |  8 ++
 .../qemu-iotests/tests/migrate-during-backup  | 97 +++++++++++++++++++
 .../tests/migrate-during-backup.out           |  5 +
 3 files changed, 110 insertions(+)
 create mode 100755 tests/qemu-iotests/tests/migrate-during-backup
 create mode 100644 tests/qemu-iotests/tests/migrate-during-backup.out

-- 
2.29.2


