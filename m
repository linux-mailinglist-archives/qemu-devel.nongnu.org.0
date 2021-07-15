Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17AC93CA008
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Jul 2021 15:49:35 +0200 (CEST)
Received: from localhost ([::1]:35102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m41k5-0008UB-MK
	for lists+qemu-devel@lfdr.de; Thu, 15 Jul 2021 09:49:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m41ip-0007gv-E3; Thu, 15 Jul 2021 09:48:15 -0400
Received: from mail-eopbgr130129.outbound.protection.outlook.com
 ([40.107.13.129]:48263 helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m41in-0007ZN-0M; Thu, 15 Jul 2021 09:48:15 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KnIVPj5QATcJmfeUEkaUOj0DOK/6ssJTMOo4SQxc95tKYnpjpF9efqKu6jlVT4XCtkBWtugt/7udHCNh4XHqM7v7xBhRl6v+lPmcv/ICNelgil3mU/5eGJ64vhdKdcAXiBR+Ni+2q0OsdWxBq/Qdb03QsmdEKMBQh2EPYKQCXnrQv+w7aOqcOeMSoLcJa8r2hRzAUR2cjpfs6B9lUHeDftkVvLerwcshMR1u8oeCDImOY7NAIibSTUjD4Yn2KizK3ctgvEfUL0pueq1Y2Jepuic3NbJ0dWaSKlNDby1Vq+2ZRGBe9RMi59/N2G/iKQ3mEApWhkWOkXTCC+uAREG84w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fVzS12UxKDIeuCV0G/WCeRAIDd04IpS5aHZh0ondaZg=;
 b=B2twcfuwKv5Jyg/0WKMXy61xZZ+l0e/73yJMVsxrrA+YNxujd++nwo3JQYFa5Gd49uGp6V+MXeAXlljJy8J+6N8heMHjvmPfu6L45WW2GO3j9DF1g2YNipZ6/HCcmpdo4n+9jqXPt+hAJCup7JKDCFcCWQDKyw9o/mOMtpBMGDQDDrrEprdr6zKzbxSIA2vHHk2hM8nk1w7UJ1+CBP3BerrxrokbTXmiHbx0Dz3Vn2iL9SjuR3nsrp7gJIq+GDPmD6xXd5E7GTRFFk5Jpa+xY7IBbg5sMD6tYF5tBiFAgVOQ+oDkwhISl8SFUPHwET2LyxfBDMSyPIof40ZiDb52iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fVzS12UxKDIeuCV0G/WCeRAIDd04IpS5aHZh0ondaZg=;
 b=FlN10YSg851Ik6CGZ4GgV1UN+bf2qJP0BDX61MqQQyPgWFYgXE5VFix3RXDbHVtqLxT2lpTiIG+glNKXExhrGSQMxdSfppFFBJ80VN1qKDp5rFHI1W0+Wr8NeVJMfzlCA4WwYg4Tt4BnAhgm5HYAPp2FLdMDhAp4LDbj66g4xWI=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5384.eurprd08.prod.outlook.com (2603:10a6:20b:10c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.22; Thu, 15 Jul
 2021 13:48:08 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%6]) with mapi id 15.20.4308.027; Thu, 15 Jul 2021
 13:48:08 +0000
Subject: Re: [PATCH v5 5/5] replication: Remove workaround
To: Lukas Straub <lukasstraub2@web.de>, qemu-devel <qemu-devel@nongnu.org>
Cc: qemu-block <qemu-block@nongnu.org>, Wen Congyang
 <wencongyang2@huawei.com>, Xie Changlong <xiechanglong.d@gmail.com>,
 Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>
References: <cover.1626090553.git.lukasstraub2@web.de>
 <bba4e56bd198578c6e52c2e07edbc6c706200205.1626090553.git.lukasstraub2@web.de>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <f8ac87c2-b1ea-4dd3-989c-21a46c142bc2@virtuozzo.com>
Date: Thu, 15 Jul 2021 16:48:06 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <bba4e56bd198578c6e52c2e07edbc6c706200205.1626090553.git.lukasstraub2@web.de>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR2P264CA0012.FRAP264.PROD.OUTLOOK.COM (2603:10a6:101::24)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.193) by
 PR2P264CA0012.FRAP264.PROD.OUTLOOK.COM (2603:10a6:101::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.21 via Frontend Transport; Thu, 15 Jul 2021 13:48:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9d5118db-5705-438d-0fca-08d947972db4
X-MS-TrafficTypeDiagnostic: AM7PR08MB5384:
X-Microsoft-Antispam-PRVS: <AM7PR08MB5384453D8D13051B44D7A9D8C1129@AM7PR08MB5384.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:140;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wtiFfVEMLkmQp8PFuYNU6dtc8XgasOv3fpeBrqmyv3BNtRW33vWIGgncv/RaZVOkV34HstgVqpV8SFetASYNQJppyjFcKxJ3U9TvcuLszx9IL08HxYue2QPMvO+h75UhRHl7mp7HtFSywR0zB/qC3i2GZm/z11hPifs1tWp4NRgnJpqWQzRDaDv7+3Ln0NInMj9CqzjxK+GpeAgcMAidOweCXx+KqIIqDvoviKT2tEKgr4IbqwxB8JD4S36yYbPqUcWanTaYop/5s9wQUnkACWQRgtAwoGcS1ppCF+TUz9Jh5isCc4L+oXMrkVAFzHobnJsg34v2i36URTKX2DW8Mb0NNRvD1zN3DjXb2UuPuHC/fFoYKmOOsSDDgpncTClMLBvb8HYxuZm1u1i/mkZaETys+XUsQYSoKSw6UUHkdD5I/S+GeJW2qbfMabweWstYzPDCeIeyj0cp46CnP1dY/npXAIdpwAoVLJ0NiLHuwzpNxXWQO2i0e5c6Xe9LNxwZfeYx49OspbkpJElnVae+f8aewzUs93/fdFERf64ZABXatBeb41OCgceCbvYwEkhc1VYQkxhvfF9R94tb1OHcd79wfT9/1HJWY/ag4vJjdwHNQOr+H4MCK061W+CIMI3X3qrrJJEnSEDyciV4OWg6d0HmZZ4Jsjz25i872G8xfYkFLiT0BCbLK+edzLTS8IVX5PEsclhelmdstA7QveNJ+JeNWEjPUr0VUhAeVahDNgjnhI+oOs1ti3zlTaWcejF2q76BiMDiScnzmNkh/lOKOA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(366004)(346002)(39830400003)(136003)(26005)(66476007)(16576012)(31686004)(2616005)(36756003)(2906002)(110136005)(54906003)(83380400001)(4326008)(478600001)(31696002)(316002)(956004)(66946007)(8676002)(5660300002)(86362001)(38350700002)(38100700002)(6486002)(66556008)(8936002)(186003)(52116002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?Windows-1252?Q?bM7wocQ5HNw11d+Cm8bjd6ZaLUYxhdz3VkZaGnLvNrzd3naZ3E2NWFeM?=
 =?Windows-1252?Q?NR28XFIx2oz4vmeReqk8+hWwIxwuV1OcEwbzj6SLHIMFmVuEXui4OTDF?=
 =?Windows-1252?Q?kFaaWQnV5h9SZFFNqrD53YtSjC9UYiC+odVt9gMMdIDFS8VuQRmahpId?=
 =?Windows-1252?Q?tzhCtqWrgrc8LEnxkq4hNyM/9YexwfwaY/FSwj7KwkQPXmYcwJaUkr4D?=
 =?Windows-1252?Q?nRBQ8hvGPeBARw/E9a+QOpyAmE2pUewYPeZj02PkRLP1NcHM4+cy7UpJ?=
 =?Windows-1252?Q?m2tHEmFzuj81jqxzsdjXdVt7M+PGz7931RfL/yQggEceWdUzeu+Eqbev?=
 =?Windows-1252?Q?FQNhSRzc0wa43pVrVtJpVrrb/BTvfczE0DDTUJgX+l26bDwifb893vBD?=
 =?Windows-1252?Q?Q4IykEGY2OrMulKVSjJ5EQemRjN/35OEi78IzEWJ7NzuaUbyyj6YmGtT?=
 =?Windows-1252?Q?5UtA+kf/Ff5WCCSXzxZsrWXWZz3w+lMbubKb6JkUIRijnf6GalIjG2Oh?=
 =?Windows-1252?Q?lLcRolqAn+vFQE8sM28YP9F1DZYHJgewGSiCS/8MthYWcEYRt44wUbZ7?=
 =?Windows-1252?Q?oehG4fooi5bfHYX4CY0Ten+q3BCoVAkMcuLqzQyLLrusrPlVaLVzKu92?=
 =?Windows-1252?Q?CLlbTbRGJBTMuw2y/iSNFVv5ZfOof1AR06GVmvphWezfyKpbNUo6kjhU?=
 =?Windows-1252?Q?+H/DgjwYN0o2Ir3PE63v+x06LvBOKFfLomSPKCShs2gGkR+VWaZJO5/l?=
 =?Windows-1252?Q?ORRLWcZHny5fjqk8UN5W20a3ywGj50RAIaZnqCwLShh4ag/b19X+WlIS?=
 =?Windows-1252?Q?Ki8FNA6N7+QepD1EdXBASj+bmbetyFb5jCIFzfb+esRew0Gfbw7+Ik0E?=
 =?Windows-1252?Q?W1mHyoZc/9DQKO/iSn7aCr43aXNe/2tiPqyKxRmzU70ZyFe1BvcjoDmR?=
 =?Windows-1252?Q?tSI8h/nK9uY9ToxuCncKffyj/EMSzOfwznnvSruhXfRiz3SFXC9jQSQi?=
 =?Windows-1252?Q?1DN9LdfmGXqkZFoeP9IxQq2zU/Vaf3SAz9miDEw1OCal+A4xAKgId0mh?=
 =?Windows-1252?Q?yI/ahwAlBaXtrUgacOhu5bfdP+Dd4XPBnxcDTJEhcaZTIU/sNDtet7sp?=
 =?Windows-1252?Q?XOGy+cBqCwiv22vBU3CDtQgKKPEQFiQlL+4jqPKy8R4lIEchjXItMLPc?=
 =?Windows-1252?Q?s4ON/o913U9tbprHLVo1keFfeq6cZOQcCmLRO911GjejSoKV7HmX7rMd?=
 =?Windows-1252?Q?jUgdZVdCMwzyMVwG5ucV4IZF/1hIHnssN8Zi+IOCoy3VYrKKYImZcSFh?=
 =?Windows-1252?Q?7E+heyJdqwYKLEVrdmiQGSn8X7DjsQRnqjsTwEaInLNXhFKhPGckKahH?=
 =?Windows-1252?Q?JJoxvtRQwd+JgFvzicWQ1n+5VgmLmWfecgb5o+ceXacKZOYRyQurfmJn?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d5118db-5705-438d-0fca-08d947972db4
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2021 13:48:08.3737 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: seXNCk0WYi054lxX0mKN1IovgURqU+PRVP+yRtIYyh4HuIc4DJE1xgYFMYc9slIlVRoR26I1BKIOVSnL1dZvGqC+DLDjxzpbhElkTOHJGks=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5384
Received-SPF: pass client-ip=40.107.13.129;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
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

12.07.2021 14:54, Lukas Straub wrote:
> Remove the workaround introduced in commit
> 6ecbc6c52672db5c13805735ca02784879ce8285
> "replication: Avoid blk_make_empty() on read-only child".
> 
> It is not needed anymore since s->hidden_disk is guaranteed to be
> writable when secondary_do_checkpoint() runs. Because replication_start(),
> _do_checkpoint() and _stop() are only called by COLO migration code
> and COLO-migration activates all disks via bdrv_invalidate_cache_all()
> before it calls these functions.

In replication_child_perm()
we have

  if ((bs->open_flags & (BDRV_O_INACTIVE | BDRV_O_RDWR)) == BDRV_O_RDWR) {
      *nperm |= BLK_PERM_WRITE;
  }

That's probably possible

1. configure a block graph like described in replicatio doc, but all disks opened read-only. so we don't have WRITE permission

2. start replication

3. crash on trying to make disk empty in do_checkpoint with no WRITE permission

Still, I think if it possible, we'll crash on first bdrv_make_empty of active disk, and that's preexisting.

So:

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

> 
> Signed-off-by: Lukas Straub <lukasstraub2@web.de>
> ---
>   block/replication.c | 12 +-----------
>   1 file changed, 1 insertion(+), 11 deletions(-)
> 
> diff --git a/block/replication.c b/block/replication.c
> index 772bb63374..1e9dc4d309 100644
> --- a/block/replication.c
> +++ b/block/replication.c
> @@ -356,17 +356,7 @@ static void secondary_do_checkpoint(BlockDriverState *bs, Error **errp)
>           return;
>       }
> 
> -    BlockBackend *blk = blk_new(qemu_get_current_aio_context(),
> -                                BLK_PERM_WRITE, BLK_PERM_ALL);
> -    blk_insert_bs(blk, s->hidden_disk->bs, &local_err);
> -    if (local_err) {
> -        error_propagate(errp, local_err);
> -        blk_unref(blk);
> -        return;
> -    }
> -
> -    ret = blk_make_empty(blk, errp);
> -    blk_unref(blk);
> +    ret = bdrv_make_empty(s->hidden_disk, errp);
>       if (ret < 0) {
>           return;
>       }
> --
> 2.20.1
> 



-- 
Best regards,
Vladimir

