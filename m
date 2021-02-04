Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A702430EE5D
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 09:31:58 +0100 (CET)
Received: from localhost ([::1]:53380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7a3R-0005Ef-Ec
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 03:31:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l7a1s-0004bf-GD; Thu, 04 Feb 2021 03:30:21 -0500
Received: from mail-am6eur05on2095.outbound.protection.outlook.com
 ([40.107.22.95]:60800 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l7a1p-0002KH-48; Thu, 04 Feb 2021 03:30:19 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K2TQkTizYj0floA+CjPveTbwGXUzNA80X8bu35FnwkWopqpvNN6zDePmReHDfTv3YMBrsFefpgCf3Ibrw6wjtyxSkEv6/MKxH1rG8Ej3mUNPmoEJ2/70K/gEjTrZjDxDw/ev4g1EJKnCAfcH0WpscfH2lfy+uiS/C/tZZWqI88TQEVMBCR4mctSHYc46JEm+A8bqIJgVcrS+BV7okswuuZYDlwdqq/wkSllP7HCQQys4LiuQoph9l5aZSEj+H1slFGn/4sfO5i+p/p0ep6JgiP0vUFLBKxM+Y24Qu89mevX+TtPlaiNgG1Y5+FVZG+/p+TkelmQdz5xIckFTmQ3t/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Bb07x2YER/534SEwlxIaV6A9cuvcX0mJi3ST5mNrNI=;
 b=nyxm0b4xCYfK1CRpA5McLscSnHbtv14ij9IJbPe+6D2Ivjk3whObBqukewlE0Egc0PNUAAalfLV1kdRxbJI7U0fXyBa6fE72ShCUmkHwud6eWKGw8UkuSDDtwmRCeExOFxLFHyjldSLbGuyWDQkp/44G5r7vzaEag8j+9vh3uJQL5MX3u4FUkvmMognuHb6b4ghcRu3X7itnG1qNtys8C7HcTkL9tnc38oV3X9ioO5Uztn8o+2C53h+WZV7wRu/+SAL4WpuMW3u0yootgpze70PJc9xEyRP9NCqS7vcvqlDLd0jRAk83su+k4Xet1U84QERjCGdi75vT2i+MXRuguA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Bb07x2YER/534SEwlxIaV6A9cuvcX0mJi3ST5mNrNI=;
 b=VOG+FY5WUyG/zitS1VewGF6mDsVbTNG9m7JwJsmfTPFAiMSe9HNgh9DgtAsNA7+OzpH0dgvo7tGt6EiwiKQvC+TCcza6Zutkvg72W5WvI/rQrPzgtR5ftMu6L0INquJL7iOaxmtskw+Ws9MCeRPdzUY1bHG4ej76NTBx9X09BoE=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6069.eurprd08.prod.outlook.com (2603:10a6:20b:29c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.23; Thu, 4 Feb
 2021 08:30:13 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3805.028; Thu, 4 Feb 2021
 08:30:13 +0000
Subject: Re: [PATCH v2 23/36] block: adapt bdrv_append() for inserting filters
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, armbru@redhat.com,
 jsnow@redhat.com, mreitz@redhat.com, den@openvz.org
References: <20201127144522.29991-1-vsementsov@virtuozzo.com>
 <20201127144522.29991-24-vsementsov@virtuozzo.com>
 <20210203213346.GJ5507@merkur.fritz.box>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <a68bc8ae-3cc5-5f9b-e3c0-6e39b23edc87@virtuozzo.com>
Date: Thu, 4 Feb 2021 11:30:11 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <20210203213346.GJ5507@merkur.fritz.box>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.214]
X-ClientProxiedBy: AM0PR08CA0033.eurprd08.prod.outlook.com
 (2603:10a6:208:d2::46) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.214) by
 AM0PR08CA0033.eurprd08.prod.outlook.com (2603:10a6:208:d2::46) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3825.19 via Frontend Transport; Thu, 4 Feb 2021 08:30:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 28eeb479-b585-4d90-3b68-08d8c8e717af
X-MS-TrafficTypeDiagnostic: AS8PR08MB6069:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6069124A29364BD52A8C2260C1B39@AS8PR08MB6069.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KwP13RaiWCPaBwvPPRh8w8TMNjNA0wep8NRxM0e5WBHcPdho5AtOQF3Baj9hMA9zL8e9ngKYEqnIi9BJQUUnWL8Wl1lFVJ2hYtmqsTpjzN3Qk2tfA4vKlFRCji0z1iCI4D2KzoTAvait53xP4zoKiMSBHjY7bZEZ+q7e41QnCaeJAWvpmsCTPVcJOEMCM21m+f1Ut2YWkhSlCByZz1zlXZXdoqFPg6NqGfS6PdrAeowSPxrhGZYJBt4PFuivKoHE75VaQlD6/Do9RDgTNvasAqHGFbJ69Z4EJ2gUybKg5pxVlHMkxNgJM2/cX0OvS7QXrBRxWpSWTFgrDJr0Noj9aDl0IrW2xEajPLHdtsBvBalxl/TG9tkhTNqG4NztW4LLD4MK+3uTqqy+sBh/lO0DBVc+53rzGaz5O19IsYH86OqJiikWcXkE/FGyOF+Py1QSkYZ44J6kvdLR+A8y2X3X8Q2U6PruzdHTakmsevsVbdJRDHNNeFBZL7aoRsROnQxj16swEUQqkBR/0MXJJbiK574XdmDei9MT36TeOGDADN/w8ps/HQTYOv+6mcrZcLNVxyJmk/gAw9lywBFASVoDvh9BeKRSZa5aGTpqLF7Hyxg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(376002)(39840400004)(136003)(366004)(5660300002)(478600001)(66946007)(6916009)(52116002)(86362001)(31696002)(956004)(8936002)(66476007)(2616005)(4326008)(186003)(16576012)(16526019)(26005)(8676002)(2906002)(316002)(107886003)(31686004)(83380400001)(66556008)(36756003)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?M3RBR0dPc2VIeWhNZEtKUEh5L0pxdkZEdzNZTjVmeXlTZTNoaTdjcEp5dWEw?=
 =?utf-8?B?VGxFcHNmK2t3MEN5VlRUYmJNYTNJTWl0dzcxU01JTnh4am54TXFvR3d5eW1P?=
 =?utf-8?B?MThkeUVIR0N5MjlXdy9KMXVnNmhYQ0x4dVVsMDVCT2NoMTRzenhRZTRVL241?=
 =?utf-8?B?MFo5eCs3UVhsZlNKMk1vTDZXWXpiOWNpRkxRcjdQdXlRRzVMTWJZQk8rNEJP?=
 =?utf-8?B?dlNzVXhRTzk5RklGTXk5b08vVU9hNmFKWHJFeFdidXNwb2pFR2NIYTNYTWNK?=
 =?utf-8?B?bmdqZDBHOEZzcGJlVld1R0tidHJhbXZZdko0S2ZNRGFFSkdONDFvUk1ubTc1?=
 =?utf-8?B?THdJdUhFa2ZFbHo0QkNmSVdXUGtnK3RLN2l3bEpmcnFhaTZjbGYvWXQ4dHZJ?=
 =?utf-8?B?ZCtsbVAwL0dBZXJHSTE4aXpWUThsdTREQWxPaS90L3U5aU15NzBhMkw0WDZj?=
 =?utf-8?B?c0hZN3E2Z3BqN21ubFRWazNybkZIT0tocWROZVE1MHRNOW5TR1hURm40T1FH?=
 =?utf-8?B?QlZtM1duWFRIaUk0ZTB4QnlrVmFRUExGallSbFg3dmRqMzI4K1JrcTkvaE12?=
 =?utf-8?B?OTdlZStXTm9yc3JwYlJPMklGeW1iU3dMOVBMODNpWldFclNEd1JaQnRhUmVO?=
 =?utf-8?B?YWNmM0Y0NkUvQ1lGMFlaV3lhN3R0R3h4eHhJRnhTMW4rdG9EaGxZd0x1dWpk?=
 =?utf-8?B?T3BZVUw5QlI4UVhNYzhsL3VwcFYyeGR0Mk1kWE5FdWwzem1KbDVHV3YyaHhX?=
 =?utf-8?B?b1FPcC96SXh4bURTRkNiNnU3ZEdVemwwemN2UTJINnRWaWxvZFQ0UXk5aCsy?=
 =?utf-8?B?TGhTZDJsNWhNYUV6cnlhOUFyNzYwMWszemRwUjVBNEFmNVoyVXJZYzRFTW9p?=
 =?utf-8?B?VXEvSVZDRm11dXdnUHpWZkxyeVMzV0pWaVkwcnRGNFg1cit4by90bVJ4QVpS?=
 =?utf-8?B?RXMxR2MxSFV0d0k5Vm1TQ2hPQ1dZYk5hbUJOWVA0bUlMUG1LYjVoaW5tNUIv?=
 =?utf-8?B?YXJVLzRjTjZqVXVkTkZPNzZPTHhQNVRXWDFuVzdvRUkwekZLNjVucWg1dGRX?=
 =?utf-8?B?YStuTUhrU2JsbzBlL1pUaFliQ3J4aEw4SVZnSVFBMDlid0U5NXFZQkpRaHlr?=
 =?utf-8?B?K0ZuSW82cG4vd0JESTVRVU9OY09odkxONU80MHJJeXBVZ0ZPdHY2alJmWVk4?=
 =?utf-8?B?M0NIMGxwU3JPb3QvKzZaSnNad1BZM0wrTDc3dkNnMUdJd3ZkZngrV2YrelRK?=
 =?utf-8?B?aU5TNnZyaGtXMVFQdTcva2V2ZHZWemdEWHhCS0R2RHpZbHBBOXBwVXpUaStu?=
 =?utf-8?B?d0dqOHpHYkZCKy9LZXhqSHpIOGFEN1J0S2ZLVXN3NlpSQTJDK09mZFVqMWt1?=
 =?utf-8?B?Z1loSGJ0dzBKbmhUbkxkOGdVcnlFa1NSdGNkTHBvbnZXOFpzOXFXVVJaMkFo?=
 =?utf-8?Q?rYUrcgtI?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28eeb479-b585-4d90-3b68-08d8c8e717af
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2021 08:30:13.5227 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FTTUbz8Ps2E/nX/VHLUKzkzQT3u3OxLSTzmi/Z+cgxMouDsBg0acNhQKsGiTJ2tsZye8/RClZ0lS3sN/gfzxhsqbdiZ81rexgjlxJRPyPtY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6069
Received-SPF: pass client-ip=40.107.22.95;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.178, RCVD_IN_DNSWL_NONE=-0.0001,
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

04.02.2021 00:33, Kevin Wolf wrote:
> Am 27.11.2020 um 15:45 hat Vladimir Sementsov-Ogievskiy geschrieben:
>> bdrv_append is not very good for inserting filters: it does extra
>> permission update as part of bdrv_set_backing_hd(). During this update
>> filter may conflict with other parents of top_bs.
>>
>> Instead, let's first do all graph modifications and after it update
>> permissions.
> 
> This sounds like it fixes a bug. If so, should we have a test like for
> the other cases fixed by this series?

Hm. I considered it mostly like a lack not a bug. We just have to workaround this lack by "inactive" mode of filters. But adding a test is good idea anyway. Will do.

> 
>> Note: bdrv_append() is still only works for backing-child based
>> filters. It's something to improve later.
>>
>> It simplifies the fact that bdrv_append() used to append new nodes,
>> without backing child. Let's add an assertion.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   block.c | 28 +++++++++++++++++-----------
>>   1 file changed, 17 insertions(+), 11 deletions(-)
>>
>> diff --git a/block.c b/block.c
>> index 02da1a90bc..7094922509 100644
>> --- a/block.c
>> +++ b/block.c
>> @@ -4998,22 +4998,28 @@ int bdrv_replace_node(BlockDriverState *from, BlockDriverState *to,
>>   int bdrv_append(BlockDriverState *bs_new, BlockDriverState *bs_top,
>>                   Error **errp)
>>   {
>> -    Error *local_err = NULL;
>> +    int ret;
>> +    GSList *tran = NULL;
>>   
>> -    bdrv_set_backing_hd(bs_new, bs_top, &local_err);
>> -    if (local_err) {
>> -        error_propagate(errp, local_err);
>> -        return -EPERM;
>> +    assert(!bs_new->backing);
>> +
>> +    ret = bdrv_attach_child_noperm(bs_new, bs_top, "backing",
>> +                                   &child_of_bds, bdrv_backing_role(bs_new),
>> +                                   &bs_new->backing, &tran, errp);
>> +    if (ret < 0) {
>> +        goto out;
>>       }
> 
> I don't think changing bs->backing without bdrv_set_backing_hd() is
> correct at the moment. We lose a few things:
> 
> 1. The bdrv_is_backing_chain_frozen() check
> 2. Updating backing_hd->inherits_from if necessary
> 3. bdrv_refresh_limits()
> 
> If I'm not missing anything, all of these are needed in the context of
> bdrv_append().

I decided that bdrv_append() is only for appending new nodes, so frozen and inherts_from checks are not needed. And I've added assert(!bs_new->backing)...

Checking this now:

- appending filters is obvious
- bdrv_append_temp_snapshot() creates new qcow2 node based on tmp file, don't see any backing initialization (and it would be rather strange)
- external_snapshot_prepare() do check if (bdrv_cow_child(state->new_bs)) {  error-out }

So everything is OK. I should describe it in commit message and add a comment to bdrv_append.

> 
>> -    bdrv_replace_node(bs_top, bs_new, &local_err);
>> -    if (local_err) {
>> -        error_propagate(errp, local_err);
>> -        bdrv_set_backing_hd(bs_new, NULL, &error_abort);
>> -        return -EPERM;
>> +    ret = bdrv_replace_node_noperm(bs_top, bs_new, true, &tran, errp);
>> +    if (ret < 0) {
>> +        goto out;
>>       }
>>   
>> -    return 0;
>> +    ret = bdrv_refresh_perms(bs_new, errp);
>> +out:
>> +    tran_finalize(tran, ret);
>> +
>> +    return ret;
>>   }
> 
> Kevin
> 


-- 
Best regards,
Vladimir

