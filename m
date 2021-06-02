Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 421B73989A1
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 14:34:43 +0200 (CEST)
Received: from localhost ([::1]:33970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loQ54-0000Ag-Bg
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 08:34:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1loQ2u-0005x6-21; Wed, 02 Jun 2021 08:32:28 -0400
Received: from mail-eopbgr00096.outbound.protection.outlook.com
 ([40.107.0.96]:14360 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1loQ2l-0004f4-IF; Wed, 02 Jun 2021 08:32:27 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lad6GVlYEIvntlA4DyazAVf9oDHZFJHZNQYUUejrvUVSssRs0z2XRfFeSBy1z+v3Tysk8DeU7YnLiuC+KlA+A2qYprklD1THx5D/dpt7f2Qcv+wmiWENVinX7KpY7nZEHJ6eDqUIWFAHM5TcVbH8G4z0P8/aqFL5qYIFj/1ZjqVVdNMGVyoNrXhWzKdNsOckdQxKBhWDBxXrHYuejHORsugM7jz2Yb0CA5ZTSPNaxS2eGy+haFBtg9XEBvLWTL4hYz2ltulg1UfyZyYXEmVS4DRw8A2yMPzx7wpPErlqRD6x4gs519rs4oVbWcLjCno31zYmCJ4yaI+4AMG+RW56VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nxDyGWEULRtwwWasfiHutCe0NQLWXc9BPCheDqjupls=;
 b=cFLwTkR4quoNkavyTZC4VvDgKNuAntw+l28eLjJFtobu2nejZnlbqIGRKwNISVvayqBZJBqzhhyI1rpEpgNrcmqqKCMz+vL0Gm8f1tF6P583KP/LgGJ1uWAQNlu/7jkzdECo/h0TOg/uL2KsgcstSMsGIQiFinRnunFPQKvvyVfJ1Wd1IEkZByCXyUfGweU5nV6EabQHJgYbdI+Ph8cVe8U3Z3cxSyV2D6rj7b7npdRuROBtup0xhUGl9PCJWNDbAklrGm8C/4qZYW9qPVuXHmv4DurarCwcDKYmiJpnlWlkbexB4cR8J2nGg6RD8eiojgsYnOUzJqBcM418spTz3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nxDyGWEULRtwwWasfiHutCe0NQLWXc9BPCheDqjupls=;
 b=W7T27qttqdrS9/d8W1heLwU9VvEdtrMPSJhI4AodWvEhgrRlEWbkaX6rpX9WQQbPO8mk8d+f16FZN3uylmixtgiEsbGAoo02PFz4CZPJE9PAXEbjqEWVnqwiiPJ9zDK41TCDWtyAV6f26kUKKtnLarthu90AVCb0zGfQPtoQBos=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1713.eurprd08.prod.outlook.com (2603:10a6:203:34::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.20; Wed, 2 Jun
 2021 12:32:15 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%7]) with mapi id 15.20.4173.030; Wed, 2 Jun 2021
 12:32:15 +0000
Subject: DROP Re: [PATCH v3 00/35] block: publish backup-top filter
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, jsnow@redhat.com, mreitz@redhat.com, kwolf@redhat.com
References: <20210601165026.326877-1-vsementsov@virtuozzo.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <47a7e491-a6d7-c21b-3c4b-dbf3fde00f16@virtuozzo.com>
Date: Wed, 2 Jun 2021 15:32:12 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
In-Reply-To: <20210601165026.326877-1-vsementsov@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.211]
X-ClientProxiedBy: PR0P264CA0084.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:18::24) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.211) by
 PR0P264CA0084.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:18::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.22 via Frontend Transport; Wed, 2 Jun 2021 12:32:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a3b0b3bf-7257-45b2-d39f-08d925c2742f
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1713:
X-Microsoft-Antispam-PRVS: <AM5PR0801MB171341F33861A799526BCE11C13D9@AM5PR0801MB1713.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1824;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xv2qFruE9hjK+PiDJtDS9u9CtWcD01JvV4D6LbocC/8huGnRnrLqbyGFBM05hkYR0h9Q4lVi3UqLriRethLEk852w7KvK42a0h4WcuvLLceGGvXxMSTYlKEnqzUXv9AVfLUtQA/QO/7fZExQu34tlrqsDA0E+5+nCUeKnBDrAi1s3lI22cZcOwumgY9Z8D9WJPcY7ACu3neEbAhZNilrJSEbg+7tN8s+pqtSpHbCQN5buqigeIxoQvjU8QxuRWkwSCAiLUKfU2dR8yxB1liSCA0HKN8+m1Ia/iNCymD1oNNyUE2QrSbkApCsjXmDs61aZWnFAGubICCRBuiokvNrF5o/hm0Pk3MgIUmB3zNei8usjQ1TEg6RJU/zdAJj4cVUfhZEB1lPEhCOqlzMEDZQ28WtAytI2uuURuZA6Z9AZYKKQyo49dXHLqjssb+6/a11xJKeCAfXn6qcOAe59vZBQ2ZgoBOOk3rtTd7QzSEpzJWpCyPVal4zSa5RqXJo3ZiDDWAU9iozn4gl8R+xfwjwqC77e+LESSqtvu/HPqB+JcLiDVY3VdRlwxMihaLRbNeKvfN46eKRGeBnbxkhfTwv0Us7to9iz3vaaMyvwGq310ADmFNi48ExvjM7MZ4Tt8Gx9KcLojxUslkmihI35zvwJnggBVEcs4BdBdJVHWB/Y9cBzEm/dvbHWOiengs3Dvwh0QeGmEckLTAwKa8G3MJZez4EPQ8S9AtqJ1jPAD/SBOs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39830400003)(346002)(396003)(376002)(366004)(6486002)(52116002)(31686004)(956004)(5660300002)(6916009)(26005)(36756003)(2616005)(31696002)(478600001)(66476007)(38350700002)(66556008)(38100700002)(16576012)(8936002)(7416002)(4326008)(8676002)(2906002)(86362001)(83380400001)(186003)(16526019)(316002)(66946007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?cGhNYll2ZjZyUVBXeVNoMUNMN25UT2pDMVFqOXd1Q2VGT2dWWHNBSVNiOGRx?=
 =?utf-8?B?Skt2YWU0V3c2OENRMVMxRXQzbFU1WkFkZkxQMEltYUd4QkM3cyt3RUZsY2NC?=
 =?utf-8?B?NHVLanUvNXpHNmxmR21LOGFzRHVkNlVGaEVucXRYZFNneVF0aFdNMEo2alBZ?=
 =?utf-8?B?RnFSVDNxeHRjNjZ3SDFoOEovdXNaR3pXck1HNDZvZjZCTnJZMWk0eHVXbFE5?=
 =?utf-8?B?K3lteG1zTG5VcU0zK2ZiRjhuK2dCWWVvRTA1VG5Hd2RLZDg1cUZHZWR3Mjdm?=
 =?utf-8?B?NmJVdFY5ZWR3NloxVWU1c3ZuTHMzWVk4Y0hsV212S1dEMUQyQjJ6eWMrRCtp?=
 =?utf-8?B?YitWTHVHSDllNGllOXFtQWVwYnRadSs1bGlJdElHbTZ2QlAwdytwZ2pOY0k3?=
 =?utf-8?B?QW0xWGlFMnRMSlZBQittNENQOFFxSEVxTHViU0ViY2hUWFZja0dKZGdWTlRE?=
 =?utf-8?B?YVpYb241UEwzNDY1eEtxbWNDL1RCQlkvMVliTE1pUVI0STU2T28wWkhMTkU0?=
 =?utf-8?B?MFIrNWNQWDVsUDVUS2paTk51b1F2RlpXeG1keXhqNlQvQ2xoM3BhU3gzNjRt?=
 =?utf-8?B?RGNPOEQvWUM4Zm1vRUxsOXdHZmczTEljUEMyc3U4SzFxOFZhNUp3K2ZCc1NS?=
 =?utf-8?B?WlZGYVoxWHRTTndkU3dKOUllT0crTVFjMjFjUWRwZE9XNzU5Smxmc2FCcVBi?=
 =?utf-8?B?UGhwbzZKVCt6UUZZdTZPMlhKMVRjVDAvNDdaclNpZjRCZTM5bUdYbm9oY3Fa?=
 =?utf-8?B?T2Z6QkVJT2NucHg0SFJZM1ovRmFFeXkzZnlKZUFHKzF0S24zU2pmVWVZZ0xT?=
 =?utf-8?B?VGhncTZLemVrTk9vWFFwRjBoMHczRUtIYll2ZFRVNUxFbTZqTFB0Wm5HczVJ?=
 =?utf-8?B?cHhKbXc1bVRudExrbVBoSE9YRW0yeWNhSjdQd1VJMm4xUXNOdTZ6SGFHb0Zr?=
 =?utf-8?B?ZUlHalNueFNLMlY4ekJSWlF4SXhzNGJ0WHRPcExqRDdnZXMxZTJQV0lEeUto?=
 =?utf-8?B?VDZOUzJEL3piMTdjVkZPVUdZMXJiYmx3eHJXRE5DTTRsYWR4cHlOV0hPTDJY?=
 =?utf-8?B?V0pWUkZZZDlPYU91bWtRc0NmUDczYlNhcWN3bVpIUXNUWUVOMlhBN05QWFdl?=
 =?utf-8?B?cDd5Yk1HNjhGSmJaV29RNFRHY3hOSUhkZm1BQkVzQWZuQXZvTGIxdzJna2tR?=
 =?utf-8?B?NTVzSndndEVaOUpJNXphNTFSc3U5Ym5yZWpQNE03ZEV0Tlc3dEw4bitiYjgx?=
 =?utf-8?B?cldMUEpNR0ZzaU1TbDZCTnRVY2tYUlkxaU8rb1pmTUU2a1dqaGVRVkdQRHZh?=
 =?utf-8?B?eGRoQko1ZCtmRDJhaDVFaGtDQms0ekNvb05Bay9YMHp3dnkxdllYL0tIcmlu?=
 =?utf-8?B?dEV2TFpUK2gvVE02STlxeFRCNksvRC8xRnBTMlRiRkN1aWtYUHlGbzZxT0k3?=
 =?utf-8?B?N1Q4OFBNWEhjS1RBbEZpeEd3a0VXNGlsc2MwRVVBTnR2cm1UazdUcUF5U3dM?=
 =?utf-8?B?OXluL21hQkpYN0JLdVRSTFd0elM4MzJ2dVVjeTFSZHJxdUxocVM4eDdaQzBE?=
 =?utf-8?B?SEYyYmlHUHhOZkM3Qnd1YjdzVDV1eExZLzFPUURjMTRqMFNocCthSFlKL0Rq?=
 =?utf-8?B?Mm1xWmNhSGMvR0ZHcDlMY1l3bC9idW1RYTVXSFRUZklpTTA1V3BXNVFmbUMw?=
 =?utf-8?B?YlByakRyQTMvZ1J6SnZYVFdsWDZOcUFFMWhJNlk0bFlYL3lJd0YwM1VZWlRD?=
 =?utf-8?Q?k6r/nrJANfAJ8QjMwhDCWJRQeabHDPRi/sfdPw+?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3b0b3bf-7257-45b2-d39f-08d925c2742f
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2021 12:32:15.3537 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WIiAONcHbIcfgIgBCEHj3EZIKZQg9/PB4Q7XkHeAq1+nhIVeKk7iElMptIib4aFExXgZHA8wHo5skGVYIXpq/EkRxyHs1mtWq4LhBQdMXig=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1713
Received-SPF: pass client-ip=40.107.0.96;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-AM5-obe.outbound.protection.outlook.com
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

Actually, I should rebase it now on Kevin's block branch. So, ignore this, I'll resend.

01.06.2021 19:49, Vladimir Sementsov-Ogievskiy wrote:
> Hi all!
> 
> v3: Keep x-perf.copy-range backup option.
> 
> So, additional function is added to set copy_range in block-copy after creation.
> And if we do so, it's better to set "compress" option same way instead of handling
> x-deprecated-compress option.
> 
> 8: rebased on not yet remove @perf argument, keep r-b
> 11, 21, 23: small related rebase conflicts, keep r-b
> 9, 10, 19: new
> 20: drop x-deprecated-compress option, drop r-b
> 24: fix typo
> 34: fix qmp( , **{}) to qmp( , {})
> 
> also, add a lot of Max's r-bs, thanks!!!
> 
> So, patches without r-b: 9, 10, 19, 20
> 
> v2:
> 01-02: new
> 03: don't bother with supporting empty child: we should never have such
>      at this point
> 05: add comment
> 06: keep checking conflict with global
>      add realized_set_allowed to qdev_prop_drive_iothread
> 07: improve cbw_cbw() name
>      improve commit message
> 10: rebased on unchanged backup_calculate_cluster_size(). keep r-b  CHECK ME
> 12: new
> 13: drop extra bdrv_unref()
> 18: add compress local variable
>      add comment about x-deprecated-compress
> 19: new, replacement for "[PATCH 17/21] block/block-copy: switch to fully set bitmap by default"
> 22: improve qapi documentation
> 23-33: test: a lot of refactoring
> 
> We have image fleecing scheme to export point-in-time state of active
> disk (iotest 222):
> 
> 
>                                        backup(sync=none)
>                       ┌───────────────────────────────────────┐
>                       ▼                                       │
> ┌────────────┐     ┌────────────────┐  backing             ┌─────────────┐
> │ NBD export │ ─── │ temp qcow2 img │ ───────────────────▶ │ active disk │
> └────────────┘     └────────────────┘                      └─────────────┘
>                                                               ▲
> ┌────────────┐                                               │
> │ guest blk  │ ──────────────────────────────────────────────┘
> └────────────┘
> 
> 
> Actually, backup job inserts a backup-top filter, so in detail it looks
> like:
> 
>                                        backup(sync=none)
>                       ┌───────────────────────────────────────┐
>                       ▼                                       │
> ┌────────────┐     ┌────────────────┐  backing             ┌─────────────┐
> │ NBD export │ ─── │ temp qcow2 img │ ───────────────────▶ │ active disk │
> └────────────┘     └────────────────┘                      └─────────────┘
>                       ▲                                       ▲
>                       │ target                                │
>                       │                                       │
> ┌────────────┐     ┌────────────────┐  backing               │
> │ guest blk  │ ──▶ │   backup-top   │ ───────────────────────┘
> └────────────┘     └────────────────┘
> 
> And job does nothing here. In a new blockdev world user is intended to
> operate on node level, and insert/remove filters by hand. Let's get rid
> of job in the scheme:
> 
> ┌────────────┐     ┌────────────────┐  backing             ┌─────────────┐
> │ NBD export │ ─── │ temp qcow2 img │ ───────────────────▶ │ active disk │
> └────────────┘     └────────────────┘                      └─────────────┘
>                       ▲                                       ▲
>                       │ target                                │
>                       │                                       │
> ┌────────────┐     ┌────────────────┐  backing               │
> │ guest blk  │ ──▶ │   backup-top   │ ───────────────────────┘
> └────────────┘     └────────────────┘
> 
> 
> The series prepares qom-set to make possible inserting filters above
> root node (patches 03-06), rename backup-top to copy-before-write, do
> other preparations for publishing the filter, and finally publish it,
> add qapi interface and test new fleecing scheme in 222 (first, some
> good test refactoring).
> 
> Vladimir Sementsov-Ogievskiy (35):
>    block: rename bdrv_replace_child to bdrv_replace_child_tran
>    block: comment graph-modifying function not updating permissions
>    block: introduce bdrv_replace_child_bs()
>    block: introduce blk_replace_bs
>    qdev-properties: PropertyInfo: add realized_set_allowed field
>    qdev: allow setting drive property for realized device
>    block: rename backup-top to copy-before-write
>    block-copy: always set BDRV_REQ_SERIALISING flag
>    block/block-copy: introduce block_copy_set_copy_opts()
>    block/backup: set copy_range and compress after filter insertion
>    block/backup: move cluster size calculation to block-copy
>    block/copy-before-write: relax permission requirements when no parents
>    block/copy-before-write: drop extra bdrv_unref on failure path
>    block/copy-before-write: use file child instead of backing
>    block/copy-before-write: bdrv_cbw_append(): replace child at last
>    block/copy-before-write: introduce cbw_init()
>    block/copy-before-write: cbw_init(): rename variables
>    block/copy-before-write: cbw_init(): use file child after attaching
>    block/copy-before-write: bdrv_cbw_append(): drop unused compress arg
>    block/copy-before-write: cbw_init(): use options
>    block/copy-before-write: initialize block-copy bitmap
>    block/block-copy: make setting progress optional
>    block/copy-before-write: make public block driver
>    qapi: publish copy-before-write filter
>    python/qemu/machine.py: refactor _qemu_args()
>    python/qemu/machine: QEMUMachine: improve qmp() method
>    iotests.py: VM: add own __enter__ method
>    iotests/222: fix pylint and mypy complains
>    iotests/222: constantly use single quotes for strings
>    iotests: move 222 to tests/image-fleecing
>    iotests.py: hmp_qemu_io: support qdev
>    iotests/image-fleecing: proper source device
>    iotests/image-fleecing: rename tgt_node
>    iotests/image-fleecing: prepare for adding new test-case
>    iotests/image-fleecing: add test-case for copy-before-write filter
> 
>   qapi/block-core.json                        |  30 ++-
>   block/{backup-top.h => copy-before-write.h} |  25 +-
>   include/block/block-copy.h                  |   6 +-
>   include/block/block.h                       |   2 +
>   include/hw/qdev-properties.h                |   1 +
>   include/sysemu/block-backend.h              |   1 +
>   block.c                                     |  52 +++-
>   block/backup-top.c                          | 253 -------------------
>   block/backup.c                              | 116 ++-------
>   block/block-backend.c                       |   8 +
>   block/block-copy.c                          | 148 ++++++++---
>   block/copy-before-write.c                   | 256 ++++++++++++++++++++
>   hw/core/qdev-properties-system.c            |  43 +++-
>   hw/core/qdev-properties.c                   |   6 +-
>   MAINTAINERS                                 |   4 +-
>   block/meson.build                           |   2 +-
>   python/qemu/machine.py                      |  30 ++-
>   tests/qemu-iotests/222                      | 159 ------------
>   tests/qemu-iotests/222.out                  |  67 -----
>   tests/qemu-iotests/283                      |  35 ++-
>   tests/qemu-iotests/283.out                  |   4 +-
>   tests/qemu-iotests/297                      |   2 +-
>   tests/qemu-iotests/iotests.py               |   9 +-
>   tests/qemu-iotests/tests/image-fleecing     | 192 +++++++++++++++
>   tests/qemu-iotests/tests/image-fleecing.out | 139 +++++++++++
>   25 files changed, 910 insertions(+), 680 deletions(-)
>   rename block/{backup-top.h => copy-before-write.h} (56%)
>   delete mode 100644 block/backup-top.c
>   create mode 100644 block/copy-before-write.c
>   delete mode 100755 tests/qemu-iotests/222
>   delete mode 100644 tests/qemu-iotests/222.out
>   create mode 100755 tests/qemu-iotests/tests/image-fleecing
>   create mode 100644 tests/qemu-iotests/tests/image-fleecing.out
> 


-- 
Best regards,
Vladimir

