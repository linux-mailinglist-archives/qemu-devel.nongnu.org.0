Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 169CD4256D3
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 17:43:03 +0200 (CEST)
Received: from localhost ([::1]:58292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYVXx-0005O5-KC
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 11:43:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mYVUb-0002Vd-Oh; Thu, 07 Oct 2021 11:39:34 -0400
Received: from mail-am6eur05on20719.outbound.protection.outlook.com
 ([2a01:111:f400:7e1b::719]:49281
 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mYVUX-0007Fx-OT; Thu, 07 Oct 2021 11:39:33 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XilOpVII3UZTNfCSakuKOHBcPZ9T9S/hafPwzTeajh3zeSYMGqqy1jwnH8ar4xaUpzVAa6L9tvjfX2PxS6J2SJnSUu9fGnqR+S1YrkeyzQFP2PZT0iYjN6ER8DOby6Hpo7HKSnueY6KWr1nS8VenU73y65oGNcLVtZz6JsgRafuMdPEoqLJGU02Ct45ekYlAD/iVGzzY/mYZfdYSloA023LwfDKhX9wIkLvsXH7edKF4kZWQB1XzF8/63nxYvZEKOd+wmvgaAuSkNlpzCF8ALB9+bJw1+Y4zptWqvjNT5X7QdScrBFZcNZNP5hw8vi/ah0FfUR8mo64oSiweEnO2eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kt98O8e4DjiOHIqMO9OCim4xETU+60XiQYONEBE/vwQ=;
 b=g9fO+lHYf4o/jdfk+sSN3+DAyhaNG4N3wXcJpMVVwr4j15TDklKjQkS/7OZel0+yVWY6RaPu/ZaXromjc4Dvs0Pswaam3DpN3g2tYYHCOWC8mb7Uq4EAbvT02JDsgIAqrKs9Hfm2p0BOlJTwlqIxfApii8fXG9pjdR07tKrrx+8l1uilnGLnBonevj4tTu+bBGuelS9orjl/FTfWSxhY2igl90ddLFLeCGaK6dUlLsuv1JwX+s1HwM3sogoYdresVW4aNlS6A7cibfs3QgaWKJLstyOJLHvavhHQNrGGahEgYauhqbg2mgNu1D4OM8oc2NUSmkO+egNm54yWmQAD0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kt98O8e4DjiOHIqMO9OCim4xETU+60XiQYONEBE/vwQ=;
 b=Bu6JlyWMpH1XOuVXLHNHuJwpn9J4cLv1clbgN2UequwRJFpQzSfQiuz6HAaQHSzCpD3ddhEGUPj6T8Yn+S3EsdwqeRx3p0YaqWflnbtKIbTfXud/pgmm5uG+BFwq43c8NWnIf6b4479R9oqKcyTugDjcSps1DaD7DNIQqs9Hny0=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6134.eurprd08.prod.outlook.com (2603:10a6:20b:291::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.22; Thu, 7 Oct
 2021 15:39:18 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc%4]) with mapi id 15.20.4566.023; Thu, 7 Oct 2021
 15:39:18 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org, kwolf@redhat.com,
 hreitz@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 richard.henderson@linaro.org
Subject: [PULL v2 00/15] jobs: mirror: Handle errors after READY cancel
Date: Thu,  7 Oct 2021 17:39:00 +0200
Message-Id: <20211007153904.445009-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS9PR06CA0347.eurprd06.prod.outlook.com
 (2603:10a6:20b:466::33) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
Received: from kvm.ch-qa.sw.ru (130.117.225.5) by
 AS9PR06CA0347.eurprd06.prod.outlook.com (2603:10a6:20b:466::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15 via Frontend
 Transport; Thu, 7 Oct 2021 15:39:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 161cc7c8-383e-45b7-3aa5-08d989a8a010
X-MS-TrafficTypeDiagnostic: AS8PR08MB6134:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB613431A6E42E93D33BC8D9BBC1B19@AS8PR08MB6134.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:83;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: X7E56qK9k2cJjOrGROUeGr0Az/6+n1aPdo0QmemWSIivzZaVKmgShc041Objp9X+7Ln34inOPvLCWklhqIVFAGox5Bf/NO4wQNQHgEBnPywIhkL/xL7NZdbOmHu0d4Vvkru14x/3/aeOV5vhP0WIbGSl9JK4vjmOHGQplEKwoCnzofB7OC11aST9ecqjb3kub5n1qEg7cg5RwWJ/vTih9D7fRKOgwtcMmXMx1wcgdlaNLqs6VuIgwF152hsHmymMFtMwOAK/hWqtDQgZnt4uJCwgqpKGNH+RQMUH6sPb5K6qdfTC8rMe2iUiUBAChma7AsefxEY+r971gMWiWPTI7ij8oX1O5769U0UuG3PPfrT9xLaFcds+oYbG3WrxyrGqG9sYuP+s9XL7FjBV2fNDhIv4lCM5KGP0QbSyc8KWJBiYLTzPeGaBg7s6GbwvUbYoVYVehkk3XiM+uJvzfGWYWz8kx3/11PVr8zZdMLa5yp9/a5fGCP0sThCeVMqqu3pp9olcf58RxC3WiSUoE4VZPQzMLff/2/y62/CcoNreCThMhiJR4dQ1fho/lXP3IyCa+fi0BX2+DVUhDpFDgIAiu+kdfU9nWbEqx532eTbAXRSTo/9dOO3sY3gq03heh7fMcxEAp68NDHODj2seVRS1nopicZHDeNTKbg4s9oywY7L/Uj77dVD6zJJixEDYUVSy++52TFAwWObD5yl/elDjcuodGOIQPhbt05u4ZYsT8Ldog/WtI4xL2CuGe2Gqs0OQqBrnkOLeNyhqpAztFNYGtCgV3EbfG+wSi3ArTLKdCrI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(36756003)(38350700002)(83380400001)(6486002)(2906002)(38100700002)(316002)(508600001)(4326008)(6512007)(8936002)(86362001)(966005)(1076003)(2616005)(8676002)(5660300002)(6666004)(6506007)(66476007)(66556008)(186003)(52116002)(66946007)(956004)(26005)(6916009);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 7FByHsc3VCKe4/kcQKjbIZzXyAvNeORiWGBN/F2c8l05yjuGYcqX34xFn00YlxZAj7oK98w7HtsfsRBOe+vQc7j+ohUcHesgdPbEFSkJlzQrPmor/z+MN4asvJV6vOuwA8KSWR+dHj6TInXJPvKNg3xiB2yI1UTPJGtwGgVQkiPemwJlLK63OHDO1TOBZK/Ud+bZziLoKm1UOgyDSAE6WLVeBZ8owughmgRN1xprzelk3OZWAxsbuFhynRCQ4ALj+XA15nl+L0TaEkAc6IJQCy/36OWwjLjco8fR77pHZkcSkBxQ5W5TBxLed9CQ1lsZezGHR2wteU9lqT5sUFAmpsE241JZuT2wl7+tSYVF4GDlMwu6PCTDPsCbiSYACnPnTeIuAUqR7cm/C+nwXVYjR2bpu1/wFadnbn7FX24xNO2dbiqSDBychjjSUJ9wwmnuwtwuymCL8hwM5hTWhNPQQPAWUaZdqrMxX2CqN7fcuiVmTp6X04m2p+S4zECDFCSIRUuPuZPDt7Sz05DoBSayyu6xNaeK3S4erC7vK7Hsk+QiyWDcBLHHNaiMo1KOH0p4UTRRX9hPQSgPEDsJdJ0sGxDJqRGG+WihkvEbHCn6rPp62pqKCPszaIypuWqKpxuI2U02Qdn3WcPRMwmoXLP4i89KfZehZaW+KlsUi59QBNqWSKXHtzyqXibhd49nKx4OM8Qx2X1SfnTBqsMZPMyjGuni3mme1Js2SpWgjX5PaTJjlaF5uG9aY8d4hdk7AC65
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 161cc7c8-383e-45b7-3aa5-08d989a8a010
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2021 15:39:18.4387 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HInOHHEq4uQkkmOBcY5TtYmzIw3Ky5VkwBi7iicc6ZTeI8oJ5b3NSKcNMdXuooia0s8tlRxCFrIrYW7etwQAuAJQNsWJ2PVbJekpYrFnI4Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6134
Received-SPF: pass client-ip=2a01:111:f400:7e1b::719;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
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

The following changes since commit 9618c5badaa8eed25259cf095ff880efb939fbe7:

  Merge remote-tracking branch 'remotes/vivier/tags/trivial-branch-for-6.2-pull-request' into staging (2021-10-04 16:27:35 -0700)

are available in the Git repository at:

  https://src.openvz.org/scm/~vsementsov/qemu.git tags/pull-jobs-2021-10-07-v2

for you to fetch changes up to 2451f72527d8760566a499b7513e17aaceb0f131:

  iotests: Add mirror-ready-cancel-error test (2021-10-07 10:42:50 +0200)

----------------------------------------------------------------
mirror: Handle errors after READY cancel
v2: add small fix by Stefano, Hanna's series fixed

----------------------------------------------------------------
Hanna Reitz (13):
      job: Context changes in job_completed_txn_abort()
      mirror: Keep s->synced on error
      mirror: Drop s->synced
      job: Force-cancel jobs in a failed transaction
      job: @force parameter for job_cancel_sync()
      jobs: Give Job.force_cancel more meaning
      job: Do not soft-cancel after a job is done
      job: Add job_cancel_requested()
      mirror: Use job_is_cancelled()
      mirror: Check job_is_cancelled() earlier
      mirror: Stop active mirroring after force-cancel
      mirror: Do not clear .cancelled
      iotests: Add mirror-ready-cancel-error test

Stefano Garzarella (2):
      block/backup: avoid integer overflow of `max-workers`
      block/aio_task: assert `max_busy_tasks` is greater than 0

 include/qemu/job.h                                     |  29 ++++++---
 block/aio_task.c                                       |   2 +
 block/backup.c                                         |   7 ++-
 block/mirror.c                                         |  56 +++++++++--------
 block/replication.c                                    |   4 +-
 blockdev.c                                             |   4 +-
 job.c                                                  |  94 +++++++++++++++++++++++-----
 tests/unit/test-blockjob.c                             |   2 +-
 tests/qemu-iotests/109.out                             |  60 ++++++++----------
 tests/qemu-iotests/tests/mirror-ready-cancel-error     | 143 +++++++++++++++++++++++++++++++++++++++++++
 tests/qemu-iotests/tests/mirror-ready-cancel-error.out |   5 ++
 tests/qemu-iotests/tests/qsd-jobs.out                  |   2 +-
 12 files changed, 316 insertions(+), 92 deletions(-)
 create mode 100755 tests/qemu-iotests/tests/mirror-ready-cancel-error
 create mode 100644 tests/qemu-iotests/tests/mirror-ready-cancel-error.out

-- 
2.31.1


