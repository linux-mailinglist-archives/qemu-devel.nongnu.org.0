Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34BDC30F33A
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 13:35:13 +0100 (CET)
Received: from localhost ([::1]:59362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7dqq-0005C0-6Y
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 07:35:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l7dpi-0004gJ-3i; Thu, 04 Feb 2021 07:34:03 -0500
Received: from mail-db8eur05on2090.outbound.protection.outlook.com
 ([40.107.20.90]:12801 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l7dpY-0003TB-Cp; Thu, 04 Feb 2021 07:34:00 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AnBgl1m/S8ISGEwWq5CFtWOJLlh2oqJKfFYeF/1DD7tpKsXOccb7l+jHS1qA9ZR90ArnvhZhsGG4FcfgentNG6tmsNgMHQ6MtcJDtAhoDNmZiZFIK2PS8OSFz+6435IF5Q34sieoUwzPbFFYCu7zmmuijuMHlFb2bLXp2Nv8yhBAxMImY2TULWrIFOMfFNKcoGUMClrruM+WF4ER01K7MP0GAtRSmA83vyyo4HS69cl+lrvGAMTVZIzy0AlHA71phXXZEnRMMmqV5z4N/Rfbnl8J3NXon7wQaHNAmWe2WcU4cKFpQeQ24gnZMscFJ6yO87kbwIdhSuu98Xmpe+w6PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zP4202QCxdm5dtzyUY911Ch3vrjORTx6pkgrVs91cq0=;
 b=bV8SSG3ZxdX6md+NJ+s4tKJtYID/j7ma4W7/k/R+pPLxSSUwlRchz2oo+VP+ARugHSMhmNYbyAZDRPlc66Jagmccx62KfTUNYJemHq/lq8WPa1kZgPqF2ggMKGDRpVgTLWic53WXjofVN9t3MU/gnwjTqTNHWGf9tZ2Nbeq6HfqtDFyk4lMX7ri7xeDTpsfphMw//llKsbUL0keAlL75ywzIowp+Vy+rdHcUGomxksvOmJxKbmmwwyR4nkEDZfiFsOHOv5B/WvOkqMFArKeqw/tlnM9r079kvj3wQuv7MHX9cR9LiegGImDdqujiq/2jLDSYRgQ34j9k/K3S9uwoOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zP4202QCxdm5dtzyUY911Ch3vrjORTx6pkgrVs91cq0=;
 b=EOLpVbks9OdiyS92fcitB/kNR2ABVW17mBM03f1/EN9/2lxkMyauFyGmDfyUFdja/P+pI+yF+2bQ2eyv7McQKO6klC6b5uRgRp290USfI9R6YyPK0pCxzhRoUmxVbU+0oQk135OrgBKmKlpsB5UeO/ZiXKaPKrNXDAmuV1XYJYk=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3285.eurprd08.prod.outlook.com (2603:10a6:209:4b::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.12; Thu, 4 Feb
 2021 12:33:48 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3805.028; Thu, 4 Feb 2021
 12:33:48 +0000
Subject: Re: [PATCH v2 26/36] block/backup-top: drop .active
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, armbru@redhat.com,
 jsnow@redhat.com, mreitz@redhat.com, den@openvz.org
References: <20201127144522.29991-1-vsementsov@virtuozzo.com>
 <20201127144522.29991-27-vsementsov@virtuozzo.com>
 <20210204122651.GE6496@merkur.fritz.box>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <e29d97df-3a05-0164-09c3-c0336719c78f@virtuozzo.com>
Date: Thu, 4 Feb 2021 15:33:44 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <20210204122651.GE6496@merkur.fritz.box>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.214]
X-ClientProxiedBy: AM8P189CA0020.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:218::25) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.214) by
 AM8P189CA0020.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:218::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3825.19 via Frontend Transport; Thu, 4 Feb 2021 12:33:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4de5b344-bbc0-4ebe-8876-08d8c9091eab
X-MS-TrafficTypeDiagnostic: AM6PR08MB3285:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB3285F7C8C36BA1D72ACC4A14C1B39@AM6PR08MB3285.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2201;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gD74yDSg5nnvzcT0RaP6tMISDP5S0/ywouu1IuW6zvqHcNSRpBxfGI2knHav0/Cluk19i6HEXAlWcj8QDGr5Ln5eGpC3uukcpq3Y9BJKLYVoLOLr28N4DfHkQIklr4Azq5FLNKkzti+r6dXdnIn1fAsi2Xdgak4vS6/KcYCFa63qlbhcGSsjZB4YOu1Xp1Qiljp2zNEdbnsB/Pih/cnmJ3EzbpvoVE42k8EcoLNMr1hsB5IvK7wvhhQNS4GtW4dwRHe9Qb6qgozLeWMksNs5HWUAFSqUeAJJh3Suc97tV6hqMnCDdyVirfp4svXAYGgYc8PwWcSxtB3RZO5Tj56wRc24qmZM+HUag1BVoL4AtMNQgmirfLVe+V5m2A0UL09+E4nfoDet+rv99c2GeKMboNaaoCQ2RaO0NdaAckdnRP8RN/0Zeh1nxXmXFlpNSGXgWVHIBhsU9bnohB0Odn0JBax6Yf5x8Eisz3BuqJbpPxCNYUucU6cFjh5zMzqAel7+oOKSJSU/xvimB5ATDRWOc+WwBeK/DVWrVyQkkgp/oI9SbA39hvMupDZwimjVMMQgmGgJS+6ESA12FVJNEqneZ565/mE3cy3KmDZuCn0ab0NNYtV0q9C2+Q4j8jKnaaOXaabmG7CayfSzVMt2lxfsiQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(346002)(376002)(366004)(39840400004)(6666004)(31686004)(2616005)(66556008)(5660300002)(107886003)(956004)(6486002)(86362001)(6916009)(36756003)(478600001)(31696002)(4326008)(316002)(2906002)(16526019)(186003)(8676002)(83380400001)(66476007)(66946007)(16576012)(8936002)(26005)(52116002)(142923001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MHRYRDRrWXpsSjVkRWxxVnpBbjJOZnBuRnM2NDBIRGpDZ3NMZHQxaU9sQmNZ?=
 =?utf-8?B?MTFZeTZkbXpDRHRheFI0RWlCQUdHWHJIYUg0UkFJWHMxRVhyb1hWRVp5SndG?=
 =?utf-8?B?RlBReTJXZEEyWnBkRlRFZ2pQcHhWQTR2ckh2emV4Z2tMU2Q2Um55RzZSdFVk?=
 =?utf-8?B?UTNwMk1PUWZETmVTeGlBdUtOYVdPZVVaQzVKZHplUFhtYmpOZVdrVHZMc2hx?=
 =?utf-8?B?TVd0MXViOXFoYXVwQ2RFVTE1aTlIMTEyL1o3S3FDRlBjdS81YmdZa0cxM01J?=
 =?utf-8?B?QVdkVTYzMHpROEpIRWtvMitJTHlPMVJ1Y2duTFp4T29qR210ZERDVWRsYkx5?=
 =?utf-8?B?N25TOXAwU2t3dHBOTXhLeHBmZWJ1LzZUL20wS1F4Y2xmamczZWdydlNnMXYz?=
 =?utf-8?B?Q3FQVEUwVS9DWjRvQUhyYUxSZW04cVl3QjFaUVAzYWVNSkJZWUxXeU8wZzJs?=
 =?utf-8?B?RWhhcGQ0NGlRZG5iRnV6SGtRcE9wRHRqSUNvbFVnTU95MkZxMU9wYmdpSWha?=
 =?utf-8?B?UVhHZWlTWGN3RG5sckFXbXM1blRHMnRCd016SHJvdDNhTXN6VnVOWHJMeE16?=
 =?utf-8?B?QU1tUGxYZEQ1bHllME5DR0lneEZVZG9XaWdJdk1kK1RxTTZuK2RiZjY0cGk2?=
 =?utf-8?B?VG5xM0k3R1FXMTUzZytpZzc3TmlMdllLd0ZGOHFjSmJaa3hxK1RJa2tPQ2hX?=
 =?utf-8?B?bWZBekp6b1VmajdnelZMVUsxdnQ4a3VJLzlkUS9TUTVZYjdLUEVFOFZGc2RU?=
 =?utf-8?B?a3QrWDBiZ1l4bFlQankzc2o4Vi9BeEttNDczeFVaRkYzV2l3TVdEcU1xRlBJ?=
 =?utf-8?B?WEV2allOQVJicGV4dSt6SEdUVnJkcXVyUnJVeXFQNk0xNWFjbGdiU01MSllW?=
 =?utf-8?B?R3gvdEhxaDZXYWM0UHFSTFZIcWFObjYra0FFVzArc1REYkt5elRpV0doeWU1?=
 =?utf-8?B?bmt5Mk0vdFJva2l1MXVrZXJXeUNRcnp1U1J2RDBBdTF5QnFxTGphSkU2RVZw?=
 =?utf-8?B?N3oyd0xRRWREWGNrWjZvS1pSSStBaEQ1Y3JiRm1TNklsNVZGUG8zYTdIZ1Ar?=
 =?utf-8?B?NHpTblg5TTUrWElOdXZSZzI4djl6RHpwelNZL0hERjJweCtqdGt0VGl0eDAx?=
 =?utf-8?B?UWNuZkRWM0lzMXdFNFBSUnRnQ2VDQ3NMNFBJcTVtNXZTNmtDTWtjeGJUaktP?=
 =?utf-8?B?aGlUWWtFKzVjS0hNeDRFWFFKa1JWYkRXNi9NNnU5a0k4WXV0NnB4dThZTGU5?=
 =?utf-8?B?NnFNbEdkWkFmaTFVVUFnVHNxRDBrT3VsKzJ0WVdJSXFYWDZjTTZSTG9FS29G?=
 =?utf-8?B?VUlUeFVGT2xQbnRERmhRSkFrdk9jUVh6Z3Q3MlJHK0xGdEgzSU5oM1QwY01T?=
 =?utf-8?B?cnUvNEtMcGFJYzdQaW4vbDZrOXpVSXlrWEFuTjJLZzBNRmpYTlVEN1UwQnd6?=
 =?utf-8?B?OVZZbkY2My9GV1FzZnhRM2pmNHhmamJRNFR4K3FBPT0=?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4de5b344-bbc0-4ebe-8876-08d8c9091eab
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2021 12:33:48.0795 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PtWwRr9P/ieW62OOi/QVIUzUxdbrO5lmkrxzowfIgmZxH5PCZ9TRV49446oRq1ESw2jwmfVcXzTvB8rUzUPJLf6LXHpLkWseKN04dLuf5Ps=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3285
Received-SPF: pass client-ip=40.107.20.90;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.182, RCVD_IN_DNSWL_NONE=-0.0001,
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

04.02.2021 15:26, Kevin Wolf wrote:
> Am 27.11.2020 um 15:45 hat Vladimir Sementsov-Ogievskiy geschrieben:
>> We don't need this workaround anymore: bdrv_append is already smart
>> enough and we can use new bdrv_drop_filter().
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   block/backup-top.c         | 38 +-------------------------------------
>>   tests/qemu-iotests/283.out |  2 +-
>>   2 files changed, 2 insertions(+), 38 deletions(-)
>>
>> diff --git a/block/backup-top.c b/block/backup-top.c
>> index 650ed6195c..84eb73aeb7 100644
>> --- a/block/backup-top.c
>> +++ b/block/backup-top.c
>> @@ -37,7 +37,6 @@
>>   typedef struct BDRVBackupTopState {
>>       BlockCopyState *bcs;
>>       BdrvChild *target;
>> -    bool active;
>>       int64_t cluster_size;
>>   } BDRVBackupTopState;
>>   
>> @@ -127,21 +126,6 @@ static void backup_top_child_perm(BlockDriverState *bs, BdrvChild *c,
>>                                     uint64_t perm, uint64_t shared,
>>                                     uint64_t *nperm, uint64_t *nshared)
>>   {
>> -    BDRVBackupTopState *s = bs->opaque;
>> -
>> -    if (!s->active) {
>> -        /*
>> -         * The filter node may be in process of bdrv_append(), which firstly do
>> -         * bdrv_set_backing_hd() and then bdrv_replace_node(). This means that
>> -         * we can't unshare BLK_PERM_WRITE during bdrv_append() operation. So,
>> -         * let's require nothing during bdrv_append() and refresh permissions
>> -         * after it (see bdrv_backup_top_append()).
>> -         */
>> -        *nperm = 0;
>> -        *nshared = BLK_PERM_ALL;
>> -        return;
>> -    }
>> -
>>       if (!(role & BDRV_CHILD_FILTERED)) {
>>           /*
>>            * Target child
>> @@ -229,18 +213,6 @@ BlockDriverState *bdrv_backup_top_append(BlockDriverState *source,
>>       }
>>       appended = true;
>>   
>> -    /*
>> -     * bdrv_append() finished successfully, now we can require permissions
>> -     * we want.
>> -     */
>> -    state->active = true;
>> -    bdrv_child_refresh_perms(top, top->backing, &local_err);
> 
> bdrv_append() uses bdrv_refresh_perms() for the whole node. Is it doing
> unnecessary extra work there and should really do the same as backup-top
> did here, i.e. bdrv_child_refresh_perms(bs_new->backing)?
> 
> (Really a comment for an earlier patch. This patch itself looks fine.)
> 

You mean how backup-top code works at the point when we modified bdrv_append()? Actually all works, as we use state->active. We set it to true and should call refresh_perms. Now we drop _refresh_perms _together_ with state->active variable, so filter is always "active", but new bdrv_append can handle it now. I.e., before this patch backup-top.c code is correct but over-complicated with logic which is not necessary after bdrv_append() improvement (and of-course we need also bdrv_drop_filter() to drop the whole state->active related logic).


-- 
Best regards,
Vladimir

