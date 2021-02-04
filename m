Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2893F30ED77
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 08:36:38 +0100 (CET)
Received: from localhost ([::1]:36896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7ZBt-0007CD-82
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 02:36:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l7ZAD-0006Y6-Dq; Thu, 04 Feb 2021 02:34:53 -0500
Received: from mail-db8eur05on2111.outbound.protection.outlook.com
 ([40.107.20.111]:39232 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l7ZA3-0002oX-34; Thu, 04 Feb 2021 02:34:52 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZNHmjsS+m2Cq9zAGPKg0bjuc08c3bhLU0gVM3KBl++YD9xpxSt+zLr2MopydabHf7OhB93sqgQ1CqyrdKmcd1Yr0tGYeCATEjMXW8ytMUD/bIXcC8veNNpz3FjFKgzOGg9GsfRalJamNP/k6srTgHwL6glea1dCJOYo3Jugv3rL7KOueFyBQlXjjS4ip9peIfHSqlnxRS3hg+tlWxuqeVfzxPqlF530ZFQW6paeOWH0cZvAt3+ygkojPq4eZYxGoOshWJrxZ5xZudPhI/2SFPh8QQWN5lpMcNBwFXNsqM0M7JwZTAgpFg8TJa/85TUpOW4OnE7ugE7hnNw+AH8JXEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EcFr+WL8Vh708whk98WYY6AWuNqDcfCPdwdhYNq2zEE=;
 b=PGffwTPl8XV35+8OaPmgECoE9ru7qILcxb4UaE/4gkmAIeImBi0zuVdzI7Omy8JYNKXpYDZYaXw3g2jvwwaTST5EApz0IrbE4+LWwsXTtEduHBWQX4wRWjrDT2LkYWMTuSKA7BUebiS5MAp/nAnNKkMwJUmDg1vjXNoATBpXHBlD6IjtN3qxgm51ViOXx86Ay321nWPuIhOxQjXoU+L52D/fB0cZ7NnRgsY+GSD8Ct8l7zR50do0FtTviNTOqzEVn6+rICchLcqakw1uRxLU+rVahLxAncNCvRnMdNigztn5sJA6S76jA1QOCMtu0uN5J3N4MjvI3xRq4JxdW+5s2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EcFr+WL8Vh708whk98WYY6AWuNqDcfCPdwdhYNq2zEE=;
 b=KPei27UpkeRwAgRj3cdqiIGc+OSHBwD0DM1/cHeHEnE7yOmOmdgRdDbY3JvAWlyTntWXvI0O32nHG/Bq4GLw+ocwaBVtKKnNX8m/73fD29WnlC5JOcTFNYGDJywK6Xk0wxDaebS8CMqbrafjvx6nsOZERpWLotnqk9NINKlIAWY=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1969.eurprd08.prod.outlook.com (2603:10a6:203:4c::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.16; Thu, 4 Feb
 2021 07:34:39 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3805.028; Thu, 4 Feb 2021
 07:34:39 +0000
Subject: Re: [PATCH v2 20/36] block: add bdrv_attach_child_common()
 transaction action
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, armbru@redhat.com,
 jsnow@redhat.com, mreitz@redhat.com, den@openvz.org
References: <20201127144522.29991-1-vsementsov@virtuozzo.com>
 <20201127144522.29991-21-vsementsov@virtuozzo.com>
 <20210203210104.GH5507@merkur.fritz.box>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <f7876ad8-482b-99be-6e92-072ff894e1a1@virtuozzo.com>
Date: Thu, 4 Feb 2021 10:34:37 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <20210203210104.GH5507@merkur.fritz.box>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.214]
X-ClientProxiedBy: AM3PR07CA0144.eurprd07.prod.outlook.com
 (2603:10a6:207:8::30) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.214) by
 AM3PR07CA0144.eurprd07.prod.outlook.com (2603:10a6:207:8::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3825.19 via Frontend Transport; Thu, 4 Feb 2021 07:34:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 245ab700-ef85-4991-4c78-08d8c8df5477
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1969:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB19697EA513DAF8C9FD29F3BBC1B39@AM5PR0801MB1969.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CCeVmf1ohbGs079k57L6g3PLGoZahDA+vYeQP8IvaSZ5qG2av5v4KRVA0MJnTsgAhhcTvuyvIJqDHJe5rrCD1Gs1Ij+maIG/nYzsHAHlnHgqzuBj+suifzA0elm9qeDXmI+Po6rtDIVfF9Z9uigRPzF91qroYMoRV7qq1Yv9aGUsvi0X5eRz6m1WWVO4s+QXbKp4TxLuBrXvv58AJa7bmIeGt3FWI7ktr+vh68IQod66If/wp2j4lbvtflAWpqXEMXEVvwj2AuIRdKZJTKc1Yx4BFMjDnEJp2AqrbptRO9J5ExXWNP36KYtx356M8P1NNB67S+NBpkq+Ug8vMuHOJS/kpJaaUgAHJV+FeRmUcOTqWXbJaABJLyC8ATAorLvmHm/N682ATtOdFHP72hQhJU7auI/tfTawPmYxabvDyVwz32fNpwb/Ke8Xaw2bnEdKv9KfoPSDy9vtPC5++cTCfbYq2CEsUvIdsc7aUMoE+x51VaPMlbMhT9Gf2tPgpjDEMCCm9S0c5Q5+rGszdUuD+Qr6bG9ttLa59dFpKHcYnithrxPKyPh74/P3lOAPHKO6KxkhefOA/DKaPfLmrppZTwrx/ghBXcJ2HXVy+2ZW3gQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(376002)(39840400004)(366004)(346002)(956004)(2616005)(31686004)(186003)(6486002)(478600001)(16576012)(16526019)(107886003)(4326008)(26005)(36756003)(66556008)(2906002)(316002)(31696002)(8936002)(66946007)(8676002)(6916009)(83380400001)(86362001)(5660300002)(66476007)(52116002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?V21hNHlCcmtuRHZLdTQvQ2ZuL0tURU1MUVRqcEErenh1MWVrcFd5cUYwNWNR?=
 =?utf-8?B?NE5qK25XWmFXQ3VQNHI4WmsyK1JFQmZEYVVDT2VFRTFQT1U1bUw3eUhDVU5W?=
 =?utf-8?B?VE1tYmN1TlQ4Y2RPWG5XbjAxeHVnb0NWajkrS3JXNjVpRkJ0bS94Sk03VGVa?=
 =?utf-8?B?K3Jyblh1RlNrV3U5cnNYMFRCQlNJMDNmb05oeVFOZzhXNXlKWEYrQkdhUE5J?=
 =?utf-8?B?Um02TUtjQythMVNySFJ3Z1hJMnRETHlaaFpUN1M3TVNoTFpzUHY5TkNZNkRp?=
 =?utf-8?B?aGRzSE5GRWx4Z05aNjFvZDdOVGM4MUx0aERCblZlcUwySlNTOXlxclRMTSt0?=
 =?utf-8?B?Um8yOGR2SFgyWFNRankwcEpWNURJOFNJM1BjRHZlSXNJN2ZqL0dyS285T0p2?=
 =?utf-8?B?OTNkaVBna3RqQkdxdEljWHp5Mmp6S0gvUVZlM1Y1VTdpNXpFQkxyanRvMnFi?=
 =?utf-8?B?cjlCMDB2SUYrRFhPa29QdVc3UE9UZnJLS1JHQkM5ZWwvMVlGY29NT3BoWTM5?=
 =?utf-8?B?cm9DRXdSeURYQlIrUHNHY1c2cDl0a0ZVK3dCUGtqQk5NcTRZMU5SVVBzOTAw?=
 =?utf-8?B?cUFUQkxHcFhiQUlFNDBBWDBBRXQ2MGZUT1lUV24rTGFFaDZMOUROU3ovd1Q4?=
 =?utf-8?B?dmhIa0hrNVZOUmhINURuSGcvWFpHZDBnQXdPSEtQL1plVG9pQ1pKUS9RZFJu?=
 =?utf-8?B?OXRvOW5oemduKzVDellIUVJXSU1VZlVQQzQ5Sm1WZk1LWWVBMWR3WmlRM0Z6?=
 =?utf-8?B?SmdhVFdkZ2tvaHo4bE11eXlqQ1I1alowajlYUFJnZlJWNUI5UGw1N1ZDdFps?=
 =?utf-8?B?ODErdnBUeTRSdlNSUkxjb3RWWDZka3IwcFJ4OU9jbzlpYW0zYlRIaWorZmRN?=
 =?utf-8?B?VzRwQVM2UU1nTXN5eWlYNmlMa0ZuWDloK0gzYmpjWTBNd1QyQWlHNG1wOUVO?=
 =?utf-8?B?QWh2OFg4VXRnOGppVllRbDljVnA0MmlNUGtCSWFvRVBiSHNDSStFaDZ5VEU4?=
 =?utf-8?B?TFVrT2VFQk1Lek9vT0t4Ukg5bEM3SHZ4eExCTlovM2xBWWJnTWtEZllDQWdX?=
 =?utf-8?B?V21iVkd3R1p4L1lXcTJyd21BMlUxcmduT2hmTjhzbmVpZHZJMmVaeUhlVlBy?=
 =?utf-8?B?NzFGWDhwUnl4dTlxakdsNGZSR2Q5UjZIbkVJbW41ditsYklvUC9FbDUxVjN4?=
 =?utf-8?B?WGZRWURhV2pLS0szVXdiZHBUWXFUTWh2Mi93VVBZUExuZGExNkZVOHFOS3Rl?=
 =?utf-8?B?QVVtZ2hRa2pkbDhhczh4TzZKU2IzWHlFc3puYkdjV0RNWVJFc2ZCclIwY0NW?=
 =?utf-8?B?WnA1SGxUZllvN05XY1NVMHFpdlZMakxqT3hwV1JPSHdFRUI4S0dHTWhZTi94?=
 =?utf-8?B?REM1K2VlUEFWZFNpdVNJbWdGNmllT2pPSHhwajErMEtCc29KUDhjbXpsZXhR?=
 =?utf-8?Q?ZuoCKx0B?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 245ab700-ef85-4991-4c78-08d8c8df5477
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2021 07:34:39.4297 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qAO1tqk8G0N1W5U+A9Gy4qyFyIcRIcj5DFOkobZyDTDhjXPLNFHHp5nNsPLvx/RDoj07QCyFrTQUEzoezs3WE1xX2UkANu6hewkazwKZRNQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1969
Received-SPF: pass client-ip=40.107.20.111;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.178, RCVD_IN_DNSWL_LOW=-0.7,
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

04.02.2021 00:01, Kevin Wolf wrote:
> Am 27.11.2020 um 15:45 hat Vladimir Sementsov-Ogievskiy geschrieben:
>> Split out no-perm part of bdrv_root_attach_child() into separate
>> transaction action. bdrv_root_attach_child() now moves to new
>> permission update paradigm: first update graph relations then update
>> permissions.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   block.c | 162 ++++++++++++++++++++++++++++++++++++++++----------------
>>   1 file changed, 117 insertions(+), 45 deletions(-)
>>
>> diff --git a/block.c b/block.c
>> index f0fcd75555..a7ccbb4fb1 100644
>> --- a/block.c
>> +++ b/block.c
>> @@ -86,6 +86,13 @@ static void bdrv_parent_set_aio_context_ignore(BdrvChild *c, AioContext *ctx,
>>                                                  GSList **ignore);
>>   static void bdrv_replace_child_noperm(BdrvChild *child,
>>                                         BlockDriverState *new_bs);
>> +static int bdrv_attach_child_common(BlockDriverState *child_bs,
>> +                                    const char *child_name,
>> +                                    const BdrvChildClass *child_class,
>> +                                    BdrvChildRole child_role,
>> +                                    uint64_t perm, uint64_t shared_perm,
>> +                                    void *opaque, BdrvChild **child,
>> +                                    GSList **tran, Error **errp);
> 
> If you added the new code above bdrv_root_attach_child(), we wouldn't
> need the forward declaration and the patch would probably be simpler to
> read (because it's the first part of bdrv_root_attach_child() that is
> factored out).
> 
>>   static int bdrv_reopen_prepare(BDRVReopenState *reopen_state, BlockReopenQueue
>>                                  *queue, Error **errp);
>> @@ -2898,55 +2905,22 @@ BdrvChild *bdrv_root_attach_child(BlockDriverState *child_bs,
>>                                     uint64_t perm, uint64_t shared_perm,
>>                                     void *opaque, Error **errp)
>>   {
>> -    BdrvChild *child;
>> -    Error *local_err = NULL;
>>       int ret;
>> -    AioContext *ctx;
>> +    BdrvChild *child = NULL;
>> +    GSList *tran = NULL;
>>   
>> -    ret = bdrv_check_update_perm(child_bs, NULL, perm, shared_perm, NULL, errp);
>> +    ret = bdrv_attach_child_common(child_bs, child_name, child_class,
>> +                                   child_role, perm, shared_perm, opaque,
>> +                                   &child, &tran, errp);
>>       if (ret < 0) {
>> -        bdrv_abort_perm_update(child_bs);
>>           bdrv_unref(child_bs);
>>           return NULL;
>>       }
>>   
>> -    child = g_new(BdrvChild, 1);
>> -    *child = (BdrvChild) {
>> -        .bs             = NULL,
>> -        .name           = g_strdup(child_name),
>> -        .klass          = child_class,
>> -        .role           = child_role,
>> -        .perm           = perm,
>> -        .shared_perm    = shared_perm,
>> -        .opaque         = opaque,
>> -    };
>> -
>> -    ctx = bdrv_child_get_parent_aio_context(child);
>> -
>> -    /* If the AioContexts don't match, first try to move the subtree of
>> -     * child_bs into the AioContext of the new parent. If this doesn't work,
>> -     * try moving the parent into the AioContext of child_bs instead. */
>> -    if (bdrv_get_aio_context(child_bs) != ctx) {
>> -        ret = bdrv_try_set_aio_context(child_bs, ctx, &local_err);
>> -        if (ret < 0) {
>> -            if (bdrv_parent_try_set_aio_context(child, ctx, NULL) == 0) {
>> -                ret = 0;
>> -                error_free(local_err);
>> -                local_err = NULL;
>> -            }
>> -        }
>> -        if (ret < 0) {
>> -            error_propagate(errp, local_err);
>> -            g_free(child);
>> -            bdrv_abort_perm_update(child_bs);
>> -            bdrv_unref(child_bs);
>> -            return NULL;
>> -        }
>> -    }
>> -
>> -    /* This performs the matching bdrv_set_perm() for the above check. */
>> -    bdrv_replace_child(child, child_bs);
>> +    ret = bdrv_refresh_perms(child_bs, errp);
>> +    tran_finalize(tran, ret);
>>   
>> +    bdrv_unref(child_bs);
>>       return child;
>>   }
>>   
>> @@ -2988,16 +2962,114 @@ BdrvChild *bdrv_attach_child(BlockDriverState *parent_bs,
>>       return child;
>>   }
>>   
>> -static void bdrv_detach_child(BdrvChild *child)
>> +static void bdrv_remove_empty_child(BdrvChild *child)
>>   {
>> +    assert(!child->bs);
>>       QLIST_SAFE_REMOVE(child, next);
>> -
>> -    bdrv_replace_child(child, NULL);
>> -
>>       g_free(child->name);
>>       g_free(child);
>>   }
>>   
>> +typedef struct BdrvAttachChildCommonState {
>> +    BdrvChild **child;
>> +    AioContext *old_parent_ctx;
>> +    AioContext *old_child_ctx;
>> +} BdrvAttachChildCommonState;
>> +
>> +static void bdrv_attach_child_common_abort(void *opaque)
>> +{
>> +    BdrvAttachChildCommonState *s = opaque;
>> +    BdrvChild *child = *s->child;
>> +    BlockDriverState *bs = child->bs;
>> +
>> +    bdrv_replace_child_noperm(child, NULL);
>> +
>> +    if (bdrv_get_aio_context(bs) != s->old_child_ctx) {
>> +        bdrv_try_set_aio_context(bs, s->old_child_ctx, &error_abort);
> 
> Would failure actually be fatal? I think we can ignore it, the node is
> in an AioContext that works for it.

As far as I explored the code, check-aio-context is transparent enough, nothing rely on IO, etc, and if we succeeded to change it we must success in revert.

And as I understand it is critical: if we failed to rollback aio-context change somewhere (but succeeded in reverting graph relation change), it means that we end up with different aio contexts inside one block subtree..

> 
>> +    }
>> +
>> +    if (bdrv_child_get_parent_aio_context(child) != s->old_parent_ctx) {
>> +        bdrv_parent_try_set_aio_context(child, s->old_parent_ctx,
>> +                                        &error_abort);
> 
> And the same here.
> 
>> +    }
>> +
>> +    bdrv_unref(bs);
>> +    bdrv_remove_empty_child(child);
>> +    *s->child = NULL;
>> +}
>> +
>> +static TransactionActionDrv bdrv_attach_child_common_drv = {
>> +    .abort = bdrv_attach_child_common_abort,
>> +};
>> +
>> +/*
>> + * Common part of attoching bdrv child to bs or to blk or to job
>> + */
>> +static int bdrv_attach_child_common(BlockDriverState *child_bs,
>> +                                    const char *child_name,
>> +                                    const BdrvChildClass *child_class,
>> +                                    BdrvChildRole child_role,
>> +                                    uint64_t perm, uint64_t shared_perm,
>> +                                    void *opaque, BdrvChild **child,
>> +                                    GSList **tran, Error **errp)
>> +{
>> +    int ret;
>> +    BdrvChild *new_child;
>> +    AioContext *parent_ctx;
>> +    AioContext *child_ctx = bdrv_get_aio_context(child_bs);
>> +
>> +    assert(child);
>> +    assert(*child == NULL);
>> +
>> +    new_child = g_new(BdrvChild, 1);
>> +    *new_child = (BdrvChild) {
>> +        .bs             = NULL,
>> +        .name           = g_strdup(child_name),
>> +        .klass          = child_class,
>> +        .role           = child_role,
>> +        .perm           = perm,
>> +        .shared_perm    = shared_perm,
>> +        .opaque         = opaque,
>> +    };
>> +
>> +    parent_ctx = bdrv_child_get_parent_aio_context(new_child);
>> +    if (child_ctx != parent_ctx) {
>> +        ret = bdrv_try_set_aio_context(child_bs, parent_ctx, NULL);
>> +        if (ret < 0) {
>> +            /*
>> +             * bdrv_try_set_aio_context_tran don't need rollback after failure,
>> +             * so we don't care.
>> +             */
>> +            ret = bdrv_parent_try_set_aio_context(new_child, child_ctx, errp);
>> +        }
>> +        if (ret < 0) {
>> +            bdrv_remove_empty_child(new_child);
>> +            return ret;
>> +        }
>> +    }
> 
> Not sure why you decided to rewrite this block while moving it from
> bdrv_root_attach_child().
> 
> We're losing the comment above it, and a possible error message is now
> related to changing the context of the parent node instead of the newly
> added node, which I imagine is less obvious in the general case.

Don't remember:( Will try to revert, and if find that it's really needed, will leave some good comment on it.

> 
>> +    bdrv_ref(child_bs);
>> +    bdrv_replace_child_noperm(new_child, child_bs);
>> +
>> +    *child = new_child;
>> +
>> +    BdrvAttachChildCommonState *s = g_new(BdrvAttachChildCommonState, 1);
>> +    *s = (BdrvAttachChildCommonState) {
>> +        .child = child,
>> +        .old_parent_ctx = parent_ctx,
>> +        .old_child_ctx = child_ctx,
>> +    };
>> +    tran_prepend(tran, &bdrv_attach_child_common_drv, s);
>> +
>> +    return 0;
>> +}
> 
> Kevin
> 


-- 
Best regards,
Vladimir

