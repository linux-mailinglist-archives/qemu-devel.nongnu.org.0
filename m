Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39FD13139A4
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 17:39:43 +0100 (CET)
Received: from localhost ([::1]:58314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l99Zd-0003nN-2P
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 11:39:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l92wo-0000Qh-WE; Mon, 08 Feb 2021 04:35:19 -0500
Received: from mail-eopbgr80139.outbound.protection.outlook.com
 ([40.107.8.139]:25056 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l92wO-0007xz-En; Mon, 08 Feb 2021 04:34:57 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KtlaDgLTzSqPiw/RT0bnWKRiwAPSHCWA/cZlI4Ey1WNrZQbiXpmIoNQ+70QjZYzXbXxSovVMh4xNOYNcOSSXj1bezfXh2MbeukiYR5YYknZPNAJ2nlFpimyWRkCYVE5Eob060i/U/76fd7RQgwDffEAFO9eNcVW+lkNkOZt1KbDqR5I0rXOovwfuKG+ARiIHg8XcBjQwiEGyyxAy6+S5W1S8RsIzpx3/z96USMqUY/Hhudz6mpGV9yXvqnYGdIaLcp0j8zL6W5lTzC54IBYtkBkT0z+P2cIr3/+lrcCxIkRs9gP37x0l5JahiasW6aVG/tcqf2G+ZI1rpU/nuASW5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HuA7f1vivmBzOmfdzYIy8JbernY94rnNY3eWKKJCw3o=;
 b=EskCGsiaOqLZxHLE5EwlK20yUQuHNhq7sNfwHS2O8hKxdFqpvtOhRa/4YnKSfEUO+MIuO9gNiM/qPkngiH1lku5DH/3DVR5iFagaX2UDkSj0qli9gZlU/EdLE0tMtrFUtCCTElD+LJSZmXzMG9RB8DWzIKRpyIa0UoOl2RWHIiXyCRz4MUdYwulYAg6VCM/3la28uhbksPX1O2kLDO8qHjoPaadzH0wi5TcRDw6Mgyp+F67Z1elMhZfVi9vwgryduppTmdQhVkOjrEMOKGJfcCqHj7+UBz8LU3za8uvVjxGLJJ3VHbYIOpGpzzZB4+lfsAy5b1HzQo/vaFeXCM+vVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HuA7f1vivmBzOmfdzYIy8JbernY94rnNY3eWKKJCw3o=;
 b=F7HumeQx7rwzXLItgt97wWJWJGsOxWW2NasF3NnvQQzkZMkM2Zebnk6YTFjCQtHGUri8r8oFFThj6pxgnKgEV84i2Ytm3fyxg0iryV2vlVZZ+cR6MHZLhiAPVbSUf/xUCnlWN1hUhIYBDYYTAXWzy8v02qT0j5B1WmCbhcjNKnE=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3895.eurprd08.prod.outlook.com (2603:10a6:20b:81::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.25; Mon, 8 Feb
 2021 09:34:21 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%9]) with mapi id 15.20.3825.030; Mon, 8 Feb 2021
 09:34:21 +0000
Subject: Re: [PATCH v2 28/36] block: add bdrv_set_backing_noperm() transaction
 action
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, armbru@redhat.com,
 jsnow@redhat.com, mreitz@redhat.com, den@openvz.org
References: <20201127144522.29991-1-vsementsov@virtuozzo.com>
 <20201127144522.29991-29-vsementsov@virtuozzo.com>
 <20210205162639.GF7072@merkur.fritz.box>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <2103686a-4dfd-11f5-92ab-10b3f6686d29@virtuozzo.com>
Date: Mon, 8 Feb 2021 12:34:19 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <20210205162639.GF7072@merkur.fritz.box>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.199]
X-ClientProxiedBy: AM0PR10CA0022.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:17c::32) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.199) by
 AM0PR10CA0022.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:17c::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.19 via Frontend
 Transport; Mon, 8 Feb 2021 09:34:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 46486424-a476-4e9e-15d6-08d8cc14b6fb
X-MS-TrafficTypeDiagnostic: AM6PR08MB3895:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB38954A33427000616F7ABC03C18F9@AM6PR08MB3895.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vh6WzSO43VPfHJA1PINUB6BYc5T7XewGPb94Mdl1tQ2rrBOiSp4NFd66OgYFJdrAsl6WVuBVsHffQyBD2E4wmnIouXS0v1P7GfZyD7jZiIGu4Gtet3jty+g4Q9A7XKwjWUn+X6zuMBd+P98b0bhm+T8SNCVFTivdQtsZF/kgf6Q7z2GxIK1mBuy5K6g/oybJtceSvde0+G1Me2LCRvYgEuIb/BjR772bsnmFd9NeMWPnj1KHP1UE2ziRa2B8nV2hP+p0aW8VnKzvrgnfcVxJZjatNqhGMBpTX5HwUjjIv9HNhhUM+9PPVvVED2UNYWuLbZtJ5y+X3ftztF7auGlyXOhQfnWD4m6dZ2y6/UWDK6cTTyaR5XVWKEAzOmgq9J/IX6wytmowHFk8+gkSrA9GE+GvgPwq7FPYYLaV25aShefyUlmcP3lD2aT5+VMQSL2H87+0hPcZT/uNGE9Jqg/laiuYdEBbT1WrLLexqgO6njZQJ63zi1vq97bhnwsCiyNOmo8NArmmGpo9A2nGikVl96bTBApK+gmsAPx2Z5biNAOk3ECnmqUQIg3YPTxYSIsiHtpseuRScwvVmAyDIjonRBJOX6BivhAbpZ7NDSfex00=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(39840400004)(376002)(136003)(346002)(8936002)(26005)(16576012)(6916009)(186003)(2616005)(16526019)(4326008)(36756003)(316002)(86362001)(66946007)(83380400001)(31696002)(956004)(66476007)(2906002)(66556008)(31686004)(478600001)(5660300002)(8676002)(52116002)(6486002)(107886003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?L2pBM1dkZlVaWHhGYXFPamcwQ1pOZnhJdEx4WC9zaEY2SzJuV0d2cm5mL1E2?=
 =?utf-8?B?YWZCVFJteldHc3hWT1hXTm9EMnozYkNXN1hzczYxU2lvOEtjdXBIVXFjWHhX?=
 =?utf-8?B?Ky9KZ25VSDZUb0JtQURlSUdNMkIwUUNTVEpoYys3SE9EU2srbjRKaVRBbWlP?=
 =?utf-8?B?Ym1xRlZLWTdXbHRveFVWNkJnSGxPMnlvUE9xTkxsVHcrTnB1SFh3T0RRZ0J2?=
 =?utf-8?B?NWM4UnlPejFHL3BKeUZKVy9DOHdyVEpuOXJoMk5yVzNZRk9XRlVqVDZvUTFy?=
 =?utf-8?B?U3JCVHU0MWplVDBnNlkrMW1ESVkvS3dJbEFmUlNwazFBeXpkVWhWNnMvZmlQ?=
 =?utf-8?B?Tk8rMERvMWpaZjRHdEY3bkRXREJId3k1bWxaTllIWVNpRUZPSDJ5OER1am5G?=
 =?utf-8?B?QXlFNU1MbWZzTkZWcEQ3TGhKV2hHWUZwR1hHUm5RREZDZElSOE1LU2NONUNp?=
 =?utf-8?B?YkVVUWhYTkNJdUZ5NExycHRjVUQ1L0ZkbDlXZWxKSUxwZTB6R1NFeGNHYk1M?=
 =?utf-8?B?MVNzZGFJVFRyRCt4SXJkK0tVajJqY1c1OXRZbWNsb2t6dHl0TUR3VGtkbmpZ?=
 =?utf-8?B?M0J0MWVRMlVMRW1nVUtvNXpGZkx0NGl0LzVnajZwazBPWXMySVZkZ2w1TnNJ?=
 =?utf-8?B?aWxKNmd3eS9Uei85QmlmOVF3ZUc1VnI4WUtINldIN3NOdTJXVmJEazd3QkhI?=
 =?utf-8?B?UTBFM0VPbTJjQm1XRWpUckpsalVyaVU1OEJ2ZHd6TmM0MmhTMUZycmIvZWla?=
 =?utf-8?B?T0d5R2lEeXpzZFlTZDREV3JrZ1h6UW5XMENtY3loWCtHT1lEbDRHdTNNQ1cz?=
 =?utf-8?B?clh3MExJQVQxd01JSjlERnM4R2l3Q093V05lVWU1a3dQWXZKOVhyeGJnWE53?=
 =?utf-8?B?VzBZbTJyM3Z3dCtvSjh5eHNnY0FrRWtqUTUzMUEra0RqTzM0M2o2YndBa0hH?=
 =?utf-8?B?aGVlNmF5bTRGK2hCR1NoSTJVV0diNFlQOWpEUzl6dmhSRHF5Y0pCMmEwUnAz?=
 =?utf-8?B?bDgyYVQyMTdFR05JaTFHOFBTUldDZW5ieGc4RkEyeFZ0V2c4RTE0WDJSQlZT?=
 =?utf-8?B?Z09pTFZoTzVDUEtISWJ6TVVyODZhTGVhVDVGT241ZUIyR3BBUWRHK250anNr?=
 =?utf-8?B?MDU2cFZpWndzeEhrNzJwYTJoZVI0d1Nzb1FqZklRN2JxYUZiaFFmQk9sUG9m?=
 =?utf-8?B?WkRmYnA5UzlTbW1PUjNqdnBTTFB6UEtvWjIvNEZiNTlZQkN2d3FmZFpwcHB1?=
 =?utf-8?B?dEdMTVZOelhDc0tSQWt3Tnl3Vnk3MDZpS051a1VnZHJ0cWNQb3pjZEpyQkND?=
 =?utf-8?B?WHZqeVFhK3FvbDZQQ1VSUXVreWFFaDkyME5yWFBFeU5rbVQvNms2a1BnZnRz?=
 =?utf-8?B?N21rVGIwK21kTW9EVndWK1daaEprR0QrSm5VMnZuVEZ1R1BwR2M2Q0pPcU15?=
 =?utf-8?B?MjdOWUxoZVc3NDl2MkFXQU5lL0V6V1BBa1dPcy9Wd2hnRTl1bld2YWtnMTQx?=
 =?utf-8?B?ekl3ckt5eTR0UVlVQmlPT2dPa1IxT3IxbGQrV0VxK0JpcjBMdWU1dW9BNkxB?=
 =?utf-8?B?elgwdUh5SXFqMXN2YldXK3NLNlM3QXhnNTNWWmI0SEJkZC9NcXM1cnEvR2xU?=
 =?utf-8?B?MzI5WWFjS2FrcCtodHJKU1pMWEdjdkkwb3ZsNUdqY0VqajlNTEpJZGczWU9s?=
 =?utf-8?B?SmhUaW1XLzEwdEZsbjdzL1RjTkpCajRXc1JSNTdOQkhRQ1MrcG9SRjVyODg5?=
 =?utf-8?Q?IOKF1rMUz6ij6y24l1VjJahIiAqXTnB8VpfNmXC?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46486424-a476-4e9e-15d6-08d8cc14b6fb
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2021 09:34:21.7949 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m4LnSi3Mv7UOBmYsJvVHGBQmRSwVTRKl3Jv187lSUWf6n+CgIN5awth2zwWBzlXwFxdlGZvgCV9Q5A2vCR+IwL/D3UUtDp5zArWUw7B+G6Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3895
Received-SPF: pass client-ip=40.107.8.139;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

05.02.2021 19:26, Kevin Wolf wrote:
> Am 27.11.2020 um 15:45 hat Vladimir Sementsov-Ogievskiy geschrieben:
>> Split out no-perm part of bdrv_set_backing_hd() as a separate
>> transaction action. Note the in case of existing BdrvChild we reuse it,
>> not recreate, just to do less actions.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> 
>>   /*
>>    * Sets the bs->backing link of a BDS. A new reference is created; callers
>>    * which don't need their own reference any more must call bdrv_unref().
>>    */
>> -void bdrv_set_backing_hd(BlockDriverState *bs, BlockDriverState *backing_hd,
>> -                         Error **errp)
>> +static int bdrv_set_backing_noperm(BlockDriverState *bs,
>> +                                   BlockDriverState *backing_bs,
>> +                                   GSList **tran, Error **errp)
>>   {
>> -    bool update_inherits_from = bdrv_chain_contains(bs, backing_hd) &&
>> -        bdrv_inherits_from_recursive(backing_hd, bs);
>> +    int ret = 0;
>> +    bool update_inherits_from = bdrv_chain_contains(bs, backing_bs) &&
>> +        bdrv_inherits_from_recursive(backing_bs, bs);
>> +    GSList *attach_tran = NULL;
>> +    BdrvSetBackingNoPermState *s;
>>   
>>       if (bdrv_is_backing_chain_frozen(bs, child_bs(bs->backing), errp)) {
>> -        return;
>> +        return -EPERM;
>>       }
>>   
>> -    if (backing_hd) {
>> -        bdrv_ref(backing_hd);
>> +    if (bs->backing && backing_bs) {
>> +        bdrv_replace_child_safe(bs->backing, backing_bs, tran);
> 
> The old code with separate bdrv_unref_child() and then
> bdrv_attach_child() tried to make the AioContests of bs and backing_bs
> compatible by moving one of the nodes if necessary.
> 
> bdrv_replace_child_safe() doesn't seem to do that, but it only asserts
> that both nodes are already in the same context.
> 
> I see that iotest 245 doesn't crash, which I think it should if this
> were broken, but where does the switch happen now?

Hmm. Seems on path "if (bs->backing && backing_bs) {" we really miss aio context handling. Probably 245 doesn't check this branch? Or if leaves different aio contexts in one subtree..


-- 
Best regards,
Vladimir

