Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D2EF3C466E
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 12:08:22 +0200 (CEST)
Received: from localhost ([::1]:45090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2srN-0004XN-C6
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 06:08:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m2sq6-0003iX-DK; Mon, 12 Jul 2021 06:07:02 -0400
Received: from mail-eopbgr30102.outbound.protection.outlook.com
 ([40.107.3.102]:55502 helo=EUR03-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m2sq1-0002o2-Fh; Mon, 12 Jul 2021 06:07:01 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YHk3TgycPs3/H/Z+kLyURWOtE3WIM/tHBFyGFIp2bswAmTIe/Z/8Ygx/K3oweGNDTgIa2YMxoklMgauL1Bd8zbsfaxaT+pCkeHZDRFA1ZM5U9drhQBdIalijJzmY/FEe6s47+X72gXe1BaOxyAM2RWIELv5xiKAPvS3kvXjRLqjvD5mCkYGI4l8WgIhMFrpbHY2Xh9/qBISZFxpxZzNNXtbwyGaepQi0Uv0aq0SGsehf7o3XKR/m5FIvODUxzwvwS6SZpBVjrLeC9D7i4LWMwOFr+voxoGe7CsEBFTKhY2GYq3EPEgbW3aeY2fD7lMopH5aRfdb+ShijKZyL49yKjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wLyR9XykiuTOrOwB2SEPfkxlJDKG37m6C8rFZOU44YY=;
 b=gpoJwfgVKBpLouT8cFINQ8kgmcCNF6Cyh5JZXLdqp4NyzMen1/LCAqGNy6pCqXlH8wIJ7OHt3idmBt8US/fbiTqkEG9fvXmTTzzpVzZM4nXrd4dJsgFBiLpvRsDp4BhQmhYYJfKtX3Fxn2AbeYLXBnRgbHNqSY7H2Cu7qL/JXSj5qDkHtMY2MZN8P9Ekg8trTGK2szMoWKvi0/83M6knmsG9bciIG/ASdT1JVRucOgQjyp69M/6dbgBTunzPJi+MmqF9fsPIY0NVK7CESYv0OZT6OwKhlyOfdhRB9QdeYXmwRDEHBDB9hNpM8B5orbKSPzrpIuJH8vweJigoOrohMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wLyR9XykiuTOrOwB2SEPfkxlJDKG37m6C8rFZOU44YY=;
 b=JRTGeubGwyWq7vObCC/0OWx1WL+uT3/Hu93Fh7KJfLH3Xbj3cIgulxNrNmPUAgiT3XFlCqY4vxE9AXlA7CGbhGn7A7w/Hnhl0/NNrZlEsgN5KfNyuOUDlpNSdCo9HjP/HCSVNIBF+28oEssyTd0XOtWbFBq3b1BICA9If7xzT/Y=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6533.eurprd08.prod.outlook.com (2603:10a6:20b:33e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.23; Mon, 12 Jul
 2021 10:06:53 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%6]) with mapi id 15.20.4308.026; Mon, 12 Jul 2021
 10:06:53 +0000
Subject: Re: [PATCH v3 4/4] replication: Remove workaround
To: Lukas Straub <lukasstraub2@web.de>
Cc: qemu-devel <qemu-devel@nongnu.org>, qemu-block <qemu-block@nongnu.org>,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>
References: <cover.1625680555.git.lukasstraub2@web.de>
 <906c163474aa1fcdf4ffa3cdfb4ad39cb7fc49cb.1625680555.git.lukasstraub2@web.de>
 <1d86fa67-930c-2a6c-ab01-37a798c794d1@virtuozzo.com>
 <20210711223318.65e8e50c@gecko.fritz.box>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <3dfeee12-4803-36fe-504a-77537e8ebad7@virtuozzo.com>
Date: Mon, 12 Jul 2021 13:06:19 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210711223318.65e8e50c@gecko.fritz.box>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P192CA0023.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:102:56::28) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.215) by
 PR3P192CA0023.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:56::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.24 via Frontend Transport; Mon, 12 Jul 2021 10:06:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 49b739fd-0f6f-4df8-1ee1-08d9451cc5f1
X-MS-TrafficTypeDiagnostic: AS8PR08MB6533:
X-Microsoft-Antispam-PRVS: <AS8PR08MB6533A760FFE021CD49B276DFC1159@AS8PR08MB6533.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LWwT8gwjEOcknZHw72lae2+0h162+ToNtk9BP1vcypeFjkZq4WhlrC5s+dbXykFeUy2E2jeXeQ83AVBbrzvu/WBaNglD4Fv4rUeFECM0d+MA0O6t/HflqWIhkCdDdw3qDJtvtht0IWsc3O8RrVZBWCKgJ41zFNwOTC587V0fZYcsgBa+vCQQMyQUr1CsIHSL1OKzaHRoTqAAvjKILdTke6t787A3C2Xjm3pu4w8DAFVOWWJI6QsNPrR92YzCW8638RqPWT5KXlcCVz8dpl/2B0utGgY8vzseARLotgf/wObnHw9KdKl9xz2hH0mX4c1OV1YJLy2AKJNKUh1PSbxHsS3Cj4/2WQ/xNmydePnrrngW31P/uMOwTEtYwS0GiyaI2g/5VsS68pYE7Lr46BY3QILsS/Btvnc8MZ5HRdeBE23K2FpdGnTKgNgtvJYSi9WIJWBhcTmznA9G/fiEKMZao+JZNol/O0dOAn5AYwvOxCQzg2hOakChYLy4wc4SzWPMPTzNm+wae7bNtY3nEMv2uz+NZxP67i9KXaF9BZ8HU8+I7U/WP5a0cNK4WV98uPeeqTmMGFuVvC+tdHBvpvin1Yjc2oxnF4F/N6kSH6kQ/ZGu6tiZr3w9JBeOXzz84tPKd52wFwmOkYEnhql1zc/AC+x1W3nR0LLn9YlOBJnL7fJv8Qp0x1pRVFJ+UJ2FwGxLTzID1nvPeoXUcWuQDVnPRPkNson7FT1/Yph+ooL8V65aK8tlzZovT6y8cGQJi58MxQIByvwrTkUQl7feuOkh6w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(136003)(366004)(39830400003)(396003)(66476007)(956004)(5660300002)(86362001)(316002)(38100700002)(31696002)(8676002)(2616005)(16576012)(478600001)(6666004)(186003)(66556008)(66946007)(52116002)(26005)(6916009)(4326008)(54906003)(6486002)(38350700002)(83380400001)(8936002)(36756003)(31686004)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?Windows-1252?Q?/sOH4BlmJ/maK5lC0sq+zK18FUPM4fzBfg+tJFeebwc2AVinagG7zsxo?=
 =?Windows-1252?Q?DilEFFdbV2O/bS4LdYg3QrLsez+FMc3CV5+ukfOtMJI21C7Ooz720j63?=
 =?Windows-1252?Q?qx1DOuYvEOX08t+W8GzqofMFdWpDLTU8r7XMHzGiwPHDSrHWIs6z2+/C?=
 =?Windows-1252?Q?qeeVubkgHiGmIcEEH0Ud3I6d0eVK323Rne94Gtal2ZHaiw/gw5EyC7sw?=
 =?Windows-1252?Q?2vK26NxMm+K1jsv2My9Agbeuh3Qnj+n/WtZSBtATbpC9DNUrF8WOr3A0?=
 =?Windows-1252?Q?BJzeloo+C4NSzQpXJG6C2TJv/n2d1M9WKKgxMNvozsyXtQ+hqFc71L/f?=
 =?Windows-1252?Q?GXqxQhf5ZZEVu9DyQlXSnIwigCnyQ8ExvbLU/CSBCcMAa8E+MXSnEMP6?=
 =?Windows-1252?Q?oN2IWPgKtr9cKWbO1OkXz5+7MipslRo4t95UyvgV0+rXSfOflSJ0Mife?=
 =?Windows-1252?Q?aiUs9HCpIb5YumX+Fn+rijziL7dejW9x5Z7if8xXA0NUYDx1694RDXl8?=
 =?Windows-1252?Q?38xadNNWDpq6xPanCyATxRSslMxG9h5J/T0S9OG+gXqDEojoOGax2Gfu?=
 =?Windows-1252?Q?vYnsvreL9SIPAozDSx3l/2GfoO3wCi+RvH+bXE4DW3gPcyAWpxJmBjm8?=
 =?Windows-1252?Q?eBMUwF1/6H0X39zM7xg7MxJo8Tpmq6Wj++4vR6O+Ib7BGCNv3h+2zN93?=
 =?Windows-1252?Q?yQLdkYOqqISOphFpZt7QVAasBgb1TyNdxjtI6h8n2v8CX1azM6/yNxgp?=
 =?Windows-1252?Q?VGxTQB5e1b94neFMg4IrNqZo+Ie2DakeyMZaYkJaogO6kg3Hk7VcR/lV?=
 =?Windows-1252?Q?FvpQhmuz1QsmoxHf+viMn8Hl1BUGs4MBnUMhqsRzxjMSXuiPcVWTcflC?=
 =?Windows-1252?Q?N55S+WHqTuj5BVUBckM9QZ+RpQKM25FDbdnWuTUtptkJc8NMfllSnkkc?=
 =?Windows-1252?Q?EyNlyUYp76MPvj258s50VVS9SUN5dL0r+8gKR64u4zPO/wQKfBBRJc7A?=
 =?Windows-1252?Q?b8mcmLYPGY7rW5IcysHD49OrXkVblZex28SPHW9/saEsehQe01hZaxOc?=
 =?Windows-1252?Q?k/1dkf8mbKJz56LCmwGdS2YCmQ83g0v3KT4Ilvr6xsC+NSRxi/esqIRm?=
 =?Windows-1252?Q?uPRz7wlMjdaXepS6iw3SBdmlRZYHpo9rX/9yHA+te6wwGgsmAe4UUTgj?=
 =?Windows-1252?Q?T9xaAqQ8t7+3Dhodljr7jls8p/wg1nr/9qcV3YIw/u0ifboNpjGu9VMf?=
 =?Windows-1252?Q?NSv9vG6Rb8okZCie6QiXvf/0/0koGfZmjIW7smVx1RVq8/36ys6qRa1/?=
 =?Windows-1252?Q?/c0CFspj528g1As3+OLsDjpYMGTFeDG5rdXOqaLxKr/lOvEYs9Hi8Lk6?=
 =?Windows-1252?Q?ZBzy0czsEyZ4xA/cGqKwmyvnBYIVOeV081XK4w8Mr0aJvs2hGKw/icrZ?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49b739fd-0f6f-4df8-1ee1-08d9451cc5f1
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2021 10:06:53.3015 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N8oLy/zWJyaX3yV1ZMujHxH3lkWXsNLMEtz3kMCc8Sy2KfmPt32BL7ne6psHsyWhLNDoOHW/3/1TearSNGqVuGeTjy+/4NTOl90JH2uPH6o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6533
Received-SPF: pass client-ip=40.107.3.102;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-AM5-obe.outbound.protection.outlook.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.631, RCVD_IN_DNSWL_NONE=-0.0001,
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

11.07.2021 23:33, Lukas Straub wrote:
> On Fri, 9 Jul 2021 10:49:23 +0300
> Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> wrote:
> 
>> 07.07.2021 21:15, Lukas Straub wrote:
>>> Remove the workaround introduced in commit
>>> 6ecbc6c52672db5c13805735ca02784879ce8285
>>> "replication: Avoid blk_make_empty() on read-only child".
>>>
>>> It is not needed anymore since s->hidden_disk is guaranteed to be
>>> writable when secondary_do_checkpoint() runs. Because replication_start(),
>>> _do_checkpoint() and _stop() are only called by COLO migration code
>>> and COLO-migration doesn't inactivate disks.
>>
>> If look at replication_child_perm() you should also be sure that it always works only with RW disks..
>>
>> Actually, I think that it would be correct just require BLK_PERM_WRITE in replication_child_perm() unconditionally. Let generic layer care about all these RD/WR things. In _child_perm() we can require WRITE and don't care. If something goes wrong and we can't get WRITE permission we should see clean error-out.
>>
>> Opposite, if we don't require WRITE permission in some case and still do WRITE request, it may crash.
>>
>> Still, this may be considered as a preexisting problem of replication_child_perm() and fixed separately.
> 
> Hmm, unconditionally requesting write doesn't work, since qemu on the
> secondary side is started with "-miration incoming", it goes into
> runstate RUN_STATE_INMIGRATE from the beginning and then blockdev_init()
> opens every blockdev with BDRV_O_INACTIVE and then it errors out with
> -drive driver=replication,...: Block node is read-only.

Ah, OK. So we need this check in _child_perm().. Then, maybe, leave check or assertion in secondary_do_checkpoint, that hidden_disk is writable?

> 
>>>
>>> Signed-off-by: Lukas Straub <lukasstraub2@web.de>
>>
>> So, for this one commit (with probably updated commit message accordingly to my comments, or even rebased on fixed replication_child_perm()):
>>
>> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>>
>>
>>> ---
>>>    block/replication.c | 12 +-----------
>>>    1 file changed, 1 insertion(+), 11 deletions(-)
>>>
>>> diff --git a/block/replication.c b/block/replication.c
>>> index c0d4a6c264..68b46d65a8 100644
>>> --- a/block/replication.c
>>> +++ b/block/replication.c
>>> @@ -348,17 +348,7 @@ static void secondary_do_checkpoint(BlockDriverState *bs, Error **errp)
>>>            return;
>>>        }
>>>
>>> -    BlockBackend *blk = blk_new(qemu_get_current_aio_context(),
>>> -                                BLK_PERM_WRITE, BLK_PERM_ALL);
>>> -    blk_insert_bs(blk, s->hidden_disk->bs, &local_err);
>>> -    if (local_err) {
>>> -        error_propagate(errp, local_err);
>>> -        blk_unref(blk);
>>> -        return;
>>> -    }
>>> -
>>> -    ret = blk_make_empty(blk, errp);
>>> -    blk_unref(blk);
>>> +    ret = bdrv_make_empty(s->hidden_disk, errp);
>>>        if (ret < 0) {
>>>            return;
>>>        }
>>> --
>>> 2.20.1
>>>    
>>
>>
> 
> 
> 


-- 
Best regards,
Vladimir

