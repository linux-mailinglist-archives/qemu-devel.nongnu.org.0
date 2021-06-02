Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E477398A3C
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 15:13:36 +0200 (CEST)
Received: from localhost ([::1]:44374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loQgg-0002tW-Rv
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 09:13:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1loQej-0008NP-Qr; Wed, 02 Jun 2021 09:11:33 -0400
Received: from mail-eopbgr70104.outbound.protection.outlook.com
 ([40.107.7.104]:36580 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1loQef-00035G-Tc; Wed, 02 Jun 2021 09:11:32 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T6W8NwwNUyLld2jtJJE0EbKrUZuHAyu6BzL+O8f0YjUYCzvxYxJXY78LX8/ym0sukKDhbgL8vf+XfQRmOT/OuVTPbZHB3iwi7yTkTUAUi7zqn/zlay2Wh8zXFDmDvD6F61a/GUyIsERnrxIr81I1xIBYroXi+g0+FiA+v3FpZQfXzj7QvUQwE/I77CSzpE9PjewI8vhRB3kwR1VvTGOH7kmIDIRExoLe4rRkRWWaRPhlIkpW9YgM7zKj+0vhgM4ZR7edBhSvPXETBwEmkm2yINdl0DJ5P6RbxMypaaSVxr5ECmmet/rBPVcVvsLR0o3ucK71Pud5oc1ivRVJxSZCqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+qLVjuYIXJnS9h2VJjw8Kzt6iWVa3BuXCXm255Wam5M=;
 b=BnLnqWJMWWjC+SUVDGiR9WobWLZ1hikWr+HR7sAe+E6NepWP6daPTX5Wc/v4TlpB6Sgb+fOveZ5m4GI7lW9cuPzmefnGmaup1PZfoLlRO+q32xcFzDrft1b5CyRHQwpH2ctfcxBsyvVj5Whof/2Pg/uwxnfldRyZGnlLzM/15qDzXC3YNm/Iwq8GxhBhyIP+0sO17jhaTC+Sc362ME0qbQRFkm078yBA7EsZ5N5lXBHW5uz+JDCgRX45m8+U/jyn1MVTLbaSR+1q5/feWPyZaTGFzJ/hQUi6MPwNLQoej5z5fu9itZT6y9gfwVQ4I0TWNKz09nyy648oAsFSBC8gIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+qLVjuYIXJnS9h2VJjw8Kzt6iWVa3BuXCXm255Wam5M=;
 b=PQns22XJPmsbPydwBGHgYEamRZKzJid0aTS/A9arAatwnctwtzoFbmrLRNB+oHv2xuhsidqPfxXCayHRNtG7qESt+pSDYGNq8QNsIcoXeoIT5pE570AUhMLDZG/7dlerdvxIYgwry+7bWBUP+r0RQfPCf+AjHOuidsMLdPNBu4g=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6376.eurprd08.prod.outlook.com (2603:10a6:20b:33e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.20; Wed, 2 Jun
 2021 13:11:26 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%7]) with mapi id 15.20.4173.030; Wed, 2 Jun 2021
 13:11:25 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v4 00/35] block: publish backup-top filter
Date: Wed,  2 Jun 2021 16:10:33 +0300
Message-Id: <20210602131108.74979-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.211]
X-ClientProxiedBy: HE1PR0501CA0011.eurprd05.prod.outlook.com
 (2603:10a6:3:1a::21) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.211) by
 HE1PR0501CA0011.eurprd05.prod.outlook.com (2603:10a6:3:1a::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4195.15 via Frontend Transport; Wed, 2 Jun 2021 13:11:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cbb4b4da-8d3f-4159-fbac-08d925c7ed27
X-MS-TrafficTypeDiagnostic: AS8PR08MB6376:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB63765F35643BC657A0FE01FEC13D9@AS8PR08MB6376.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1728;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1yS56WNIW+e9kXy7BawWhKAljhk8WQyL2vElhQzlYmzwR4Y6cmC09CcOIkTjj+iOf4PfUxSftZscd3JWZCGdYUJOGaveDv00UpS6tg1evshUsaZIeT5xz3moEc9nV26Ncbkn+48+37QBdVebfWAZeYFIc+Qo+H0BYEMzfgMOoWJ1Y10n+Mx3LbWdRzwBUyxxiIJCJhXFgDXFdaXspyCv2ANnKIMp03AUVrTfj3x1hZIxq/WX7bw9wvuCXM5T1yfdCVXXiipDtj4iI0MAKaSvEINChDJkUUAQzkTPb3kq/vJgkI0xLnP/7CZVwi+/YgVskiCNp1F59//p4HJd95KAex86kkxk2kZ7t+Wqay6WuNtKOPXq8aOESwN1rqSObXr8iSPhBRpBsQhNiLq3bDACCapNTT4MAazCywpOC4jQTErT1IWzu7D6g0y5G7d2OfPA6CoyZ2RyyB/LDrtDcOfIo6Ov9RQTi7LDQ00eLVDR7IhtmqfSg+IVU3wehapGLSPR/Z1P9Te/n3bqIkG30RhJ4gumVa85gAxrsScDIPQ+RXdcBy0ELgYYicqvxdzd6eRrWj1YfSsbeta8UQ4bSSPBIfqIupadAdJ5DVOvTWtdAh6G+XapHXRY8ply6fGyxskWXmgZ4ic5qgvMSyVnkmITpvV1Dr2DS/hJtB7VJKy6qqg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(136003)(39840400004)(396003)(346002)(8936002)(66476007)(66946007)(6512007)(86362001)(1076003)(36756003)(6486002)(7416002)(956004)(2616005)(83380400001)(52116002)(38350700002)(6506007)(8676002)(5660300002)(26005)(6916009)(2906002)(16526019)(6666004)(316002)(186003)(38100700002)(478600001)(4326008)(66556008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?QmU5RDZteXcwdUdHWVhibDVNeUdRWElGaHY2dlp5Tlk0RlBaZFZvd3BkK1lO?=
 =?utf-8?B?TnRnVWJSMVJpV0ZjaFFaeUtDWGZWbVdBb2Y1TE42NVpFWkRRV0plWjVYMWRz?=
 =?utf-8?B?UHZibmpZekJIaXNXZVg3ZjRjbVlTZGRJRGEvUGxhdjNsVUJEYjJPOFRRYWRG?=
 =?utf-8?B?OUFtbW5ZZ3lvWTdUUmFzMmVueVh6WCtGT2xqcS9aS2NvRzdXZUdlVnJzWWR4?=
 =?utf-8?B?blNmUTF4WnAveEtrSGVyeGIwK3B3WmNTTkhOdTFEL2traVZ1VDU5UjlVQ1pQ?=
 =?utf-8?B?MWxGZkc4czdRZ3ZFZUl4aW1XNjR4NDZ3UE9qazRGL05nU29uUUt4T0VZckUx?=
 =?utf-8?B?MXVoYUtqZmRTOGlWVFNWeDA3WVNWMlBXKzkyMkhNMGJDaUoya2hEeTlNYVZU?=
 =?utf-8?B?QWJzZ2d4Y2lZMjNVVGxqdmIyZUx1MFQrV3JkNS9jTnI1MU44NmdyYlc1UlBX?=
 =?utf-8?B?NXVUeWlUSHY5ejhUNnhXR3dMVUlIVFJPUXV2YWc0YVVRejlkd1B1RW5QbGlz?=
 =?utf-8?B?WHF4ckFIVXZ0OEdTQmFFTzc1TlRXWVZqeXZTdFo0VWxET3ROd042Nno3aTQx?=
 =?utf-8?B?TER6bmJwNWliQm90b2FmNVJWNUJYdWJLUGRMZlhUSUpDNThyY0tLWkJ2aWVa?=
 =?utf-8?B?bWxjSm1BZUpMZnBPNjQwWW82cjlqbkExQWV5U29CS3o3SWtsVmpnRjFPWEVn?=
 =?utf-8?B?RnJ6aTVTTWlZb0hCREw0allCb2F6OE0xMENXS2pyVVJLdTZzSVY2RVBtOEd5?=
 =?utf-8?B?WHlFZkpGdFA2U1NWQWJvYkxxeEdkM1VQbEQ0WmpKelZ5My9kSGYzK1VuNGli?=
 =?utf-8?B?NDlJMmZaUGJkd1hGYklVWlJhSEpna05nTmNNLzRZL2dPOEdhSzBJa09JQ3Zm?=
 =?utf-8?B?RngxL084b2c1WDBmNHJmMlVrd2J1Nkc4ZmQ5YXpaL1ZDVFVCRUJwa1RaTTF1?=
 =?utf-8?B?bUhrRUFGM3hkbjl2NXBwVC9iUWN2aS94OUJUUzhvakc4SWZ6TkUxc1Q1SytE?=
 =?utf-8?B?R3hSaERGajByZFpHZEVlUjZqcDBjajN3eWNLL3kzRWsvVmpnWFZUWW5TQVI5?=
 =?utf-8?B?NCtVZFdqdUFBSndya3BIdGVOYzBKQURqZDZ0bFF3Z0dHMEp5Sk4yUW5xR29S?=
 =?utf-8?B?Vloxem1senBISjlZcXN0Y2xoc29GOWFDZ0tDZUFId2Z2b1l0aGJ1M29xSE1u?=
 =?utf-8?B?L1hud2NNNDB0QW5MUHljWEFETmxJajB3VWRBOTZtSEpOK2J0ajh4QUJUb3Fl?=
 =?utf-8?B?cTFZaXVhemlIZ25OMVlqenZWbmhSNjdHejRHRHZraVRmc1F6ekM0VmtUdmND?=
 =?utf-8?B?amIxV2h0ODFad0g5bThJQ0RCQ3BiV3prV0Rodmg3Tzdub0IwNzJ3MjRKbk92?=
 =?utf-8?B?ZmR1dDdmV2JaSVQ3MXE5d3lJVjUvNU12b0N4VFNKMUhpTEZyRjhxZnE4VWZO?=
 =?utf-8?B?aTZNUkNrY3hFcGUvM3VPY2FIU2pvOTBnNTM1Y28vYVdISlprU2NOakJFZFlH?=
 =?utf-8?B?QUdvODlncEJwWS9DRGVUOWlVN0xibXgvV1orckVwWFNCODFscVlHT0twRkFY?=
 =?utf-8?B?UTBUOC9pLzJGVTZtcXRCWWVQTDB5Y0RkbWpjYzFzV094aEUwNXZNYTR4eFBn?=
 =?utf-8?B?RnhzRmpmekpYbFZlZXBPci82QmxFK2FYQTJYQlh5VW1uMCtmb1FIbWNvVkpO?=
 =?utf-8?B?aG51cEFxbThMRG5QM3prdVptVFp2N3FQblVObVA1SzFCd1o2QWhleVVlMkpy?=
 =?utf-8?Q?6GZGorih1lOzB6gsTvpHjKE9KxLzq+ToKU1yHKk?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbb4b4da-8d3f-4159-fbac-08d925c7ed27
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2021 13:11:25.8211 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UPgEdigvipPTR4BQy8YShOaI16IC4kvfeur1tUV0vHgigm1afMc7+Vv6YW3oi/iNQBo6r3zm1EO8FmTDGo3dmiSqsw5yU02FwaFxj7MVJiw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6376
Received-SPF: pass client-ip=40.107.7.104;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
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

v4: rebase on Kevin's block branch
v3: Keep x-perf.copy-range backup option.

So, additional function is added to set copy_range in block-copy after creation.
And if we do so, it's better to set "compress" option same way instead of handling
x-deprecated-compress option.

8: rebased on not yet remove @perf argument, keep r-b
11, 21, 23: small related rebase conflicts, keep r-b
9, 10, 19: new
20: drop x-deprecated-compress option, drop r-b
24: fix typo
34: fix qmp( , **{}) to qmp( , {})

also, add a lot of Max's r-bs, thanks!!!

So, patches without r-b: 9, 10, 19, 20

v2:
01-02: new
03: don't bother with supporting empty child: we should never have such
    at this point
05: add comment
06: keep checking conflict with global
    add realized_set_allowed to qdev_prop_drive_iothread
07: improve cbw_cbw() name
    improve commit message
10: rebased on unchanged backup_calculate_cluster_size(). keep r-b  CHECK ME
12: new
13: drop extra bdrv_unref()
18: add compress local variable
    add comment about x-deprecated-compress
19: new, replacement for "[PATCH 17/21] block/block-copy: switch to fully set bitmap by default"
22: improve qapi documentation
23-33: test: a lot of refactoring

We have image fleecing scheme to export point-in-time state of active
disk (iotest 222):


                                      backup(sync=none)
                     ┌───────────────────────────────────────┐
                     ▼                                       │
┌────────────┐     ┌────────────────┐  backing             ┌─────────────┐
│ NBD export │ ─── │ temp qcow2 img │ ───────────────────▶ │ active disk │
└────────────┘     └────────────────┘                      └─────────────┘
                                                             ▲
┌────────────┐                                               │
│ guest blk  │ ──────────────────────────────────────────────┘
└────────────┘                        


Actually, backup job inserts a backup-top filter, so in detail it looks
like:

                                      backup(sync=none)
                     ┌───────────────────────────────────────┐
                     ▼                                       │
┌────────────┐     ┌────────────────┐  backing             ┌─────────────┐
│ NBD export │ ─── │ temp qcow2 img │ ───────────────────▶ │ active disk │
└────────────┘     └────────────────┘                      └─────────────┘
                     ▲                                       ▲
                     │ target                                │
                     │                                       │
┌────────────┐     ┌────────────────┐  backing               │
│ guest blk  │ ──▶ │   backup-top   │ ───────────────────────┘
└────────────┘     └────────────────┘

And job does nothing here. In a new blockdev world user is intended to
operate on node level, and insert/remove filters by hand. Let's get rid
of job in the scheme:

┌────────────┐     ┌────────────────┐  backing             ┌─────────────┐
│ NBD export │ ─── │ temp qcow2 img │ ───────────────────▶ │ active disk │
└────────────┘     └────────────────┘                      └─────────────┘
                     ▲                                       ▲
                     │ target                                │
                     │                                       │
┌────────────┐     ┌────────────────┐  backing               │
│ guest blk  │ ──▶ │   backup-top   │ ───────────────────────┘
└────────────┘     └────────────────┘


The series prepares qom-set to make possible inserting filters above
root node (patches 03-06), rename backup-top to copy-before-write, do
other preparations for publishing the filter, and finally publish it,
add qapi interface and test new fleecing scheme in 222 (first, some
good test refactoring).

Vladimir Sementsov-Ogievskiy (35):
  block: rename bdrv_replace_child to bdrv_replace_child_tran
  block: comment graph-modifying function not updating permissions
  block: introduce bdrv_replace_child_bs()
  block: introduce blk_replace_bs
  qdev-properties: PropertyInfo: add realized_set_allowed field
  qdev: allow setting drive property for realized device
  block: rename backup-top to copy-before-write
  block-copy: always set BDRV_REQ_SERIALISING flag
  block/block-copy: introduce block_copy_set_copy_opts()
  block/backup: set copy_range and compress after filter insertion
  block/backup: move cluster size calculation to block-copy
  block/copy-before-write: relax permission requirements when no parents
  block/copy-before-write: drop extra bdrv_unref on failure path
  block/copy-before-write: use file child instead of backing
  block/copy-before-write: bdrv_cbw_append(): replace child at last
  block/copy-before-write: introduce cbw_init()
  block/copy-before-write: cbw_init(): rename variables
  block/copy-before-write: cbw_init(): use file child after attaching
  block/copy-before-write: bdrv_cbw_append(): drop unused compress arg
  block/copy-before-write: cbw_init(): use options
  block/copy-before-write: initialize block-copy bitmap
  block/block-copy: make setting progress optional
  block/copy-before-write: make public block driver
  qapi: publish copy-before-write filter
  python/qemu/machine.py: refactor _qemu_args()
  python/qemu/machine: QEMUMachine: improve qmp() method
  iotests.py: VM: add own __enter__ method
  iotests/222: fix pylint and mypy complains
  iotests/222: constantly use single quotes for strings
  iotests: move 222 to tests/image-fleecing
  iotests.py: hmp_qemu_io: support qdev
  iotests/image-fleecing: proper source device
  iotests/image-fleecing: rename tgt_node
  iotests/image-fleecing: prepare for adding new test-case
  iotests/image-fleecing: add test-case for copy-before-write filter

 qapi/block-core.json                        |  30 ++-
 block/{backup-top.h => copy-before-write.h} |  25 +-
 include/block/block-copy.h                  |   6 +-
 include/block/block.h                       |   2 +
 include/hw/qdev-properties.h                |   1 +
 include/sysemu/block-backend.h              |   1 +
 block.c                                     |  53 +++-
 block/backup-top.c                          | 253 -------------------
 block/backup.c                              | 116 ++-------
 block/block-backend.c                       |   8 +
 block/block-copy.c                          | 148 ++++++++---
 block/copy-before-write.c                   | 256 ++++++++++++++++++++
 hw/core/qdev-properties-system.c            |  43 +++-
 hw/core/qdev-properties.c                   |   6 +-
 MAINTAINERS                                 |   4 +-
 block/meson.build                           |   2 +-
 python/qemu/machine.py                      |  30 ++-
 tests/qemu-iotests/222                      | 159 ------------
 tests/qemu-iotests/222.out                  |  67 -----
 tests/qemu-iotests/283                      |  35 ++-
 tests/qemu-iotests/283.out                  |   4 +-
 tests/qemu-iotests/297                      |   2 +-
 tests/qemu-iotests/iotests.py               |   9 +-
 tests/qemu-iotests/tests/image-fleecing     | 192 +++++++++++++++
 tests/qemu-iotests/tests/image-fleecing.out | 139 +++++++++++
 25 files changed, 911 insertions(+), 680 deletions(-)
 rename block/{backup-top.h => copy-before-write.h} (56%)
 delete mode 100644 block/backup-top.c
 create mode 100644 block/copy-before-write.c
 delete mode 100755 tests/qemu-iotests/222
 delete mode 100644 tests/qemu-iotests/222.out
 create mode 100755 tests/qemu-iotests/tests/image-fleecing
 create mode 100644 tests/qemu-iotests/tests/image-fleecing.out

-- 
2.29.2


