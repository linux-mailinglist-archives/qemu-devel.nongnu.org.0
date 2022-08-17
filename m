Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D990B597757
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Aug 2022 22:06:34 +0200 (CEST)
Received: from localhost ([::1]:50194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOPJB-00037e-HC
	for lists+qemu-devel@lfdr.de; Wed, 17 Aug 2022 16:06:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1oOPEe-0007dN-SA; Wed, 17 Aug 2022 16:01:52 -0400
Received: from mail-am6eur05on2133.outbound.protection.outlook.com
 ([40.107.22.133]:11745 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1oOPEb-0007pi-RB; Wed, 17 Aug 2022 16:01:51 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nCc8u/RxWLWl2DzikKKHoo6MGgRlOB2TliRhq8Bjb5YpIGp+ARoiMIULw4CCItIQ8Hl+s9qSoPzS00IU5mvd67j/dra5FiHqgge1qrU+300v8Xcw+mGUyKzzKFRoCzYkKdIwp4a+occ1q+SJEPwdTXwsIdE1sFlGwnzq1nM43EXd98FuANMidI+UquDXGzpSb13SO7N9fDp+DMKE8xFsNPR0qCrHNjdZUttUW6hGKu9WO2Kqc4QrUo4Ef4dBMDKhxVYiqFr8I+H65RIDqPUXqSsnl0T5HSPw2ICZ+xWtI4RbUoSAlkY09nttKplfHFscciYovys/O4teDEMdtwfu2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VS5cIEh5qw1lOv7vi6JGNATgpiH59IOS4Fl3Hqn4hZk=;
 b=jyAhYoLXaa/H6yWZmzK3lVyenTAPnNjPgNKobyguW9KdpgYocUPakhs0HQ8DmUZ/AAQT6jJx0e0qzvPjTnyEmpXDr512OfDWkCrfrGt4Ku8bjUf9mjiw2KJqC+L4Sji2tPVxNnjbYIxIJEaa6F4habAXZVidecxql08HAm+W1bj4N0otVfEk8jWQqmopPi2ywBhkgrn+x0XGxYSG+MRtW2CGxOAYat98EN03Yyv+PiQnziqZGb0X2LNweFz9GJBhDD5fXDM8qm48ss3OVD/KyKQYIT8gIZjNC05LEb1E+cywT5hJ9MyG/izJKzkZMoFrXR8hMn7AOQB1ytLDpZ23fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VS5cIEh5qw1lOv7vi6JGNATgpiH59IOS4Fl3Hqn4hZk=;
 b=fIg6zLdvFmWWj/sxS+Qk1gx/E9t7Cd5kAXCXrcdFJRyFfwxF72X35sbn1/Jv1HP/1Rl15uZHEOZs2oPxlD+jO2v6HwAFfcQr9otOzNjh4EWhGtiq4NvAdTDSP5mhNpYa7ev17U7F5TzrnYbzGg3/v6apjLsYRlatWNswTsGsDWXJB4dmIxJyQO+7rFeU40JG5UdRC1rkcVKdbymrJRV2ItbBIsx/DvJHfT2Rxu3GIFerjoSJIX6PfvYJoiGpnve7esoevtbfDs2VMK/MRT8fkvDK6Hf6eZ5/vYuzV8zX9MCj6T7/4o1hMMSh1F16JYyg6WtALPmInlwhqnGLjmcIQg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com (2603:10a6:102:1db::9)
 by VI1PR08MB3312.eurprd08.prod.outlook.com (2603:10a6:803:46::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Wed, 17 Aug
 2022 20:01:39 +0000
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::813d:902d:17e5:499d]) by PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::813d:902d:17e5:499d%4]) with mapi id 15.20.5504.028; Wed, 17 Aug 2022
 20:01:38 +0000
Message-ID: <cc96d636-10ec-17ec-6316-e1409ed5c041@virtuozzo.com>
Date: Wed, 17 Aug 2022 22:01:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 3/8] parallels: Use generic infrastructure for BAT
 writing in parallels_co_check()
Content-Language: en-US
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Alexander Ivanov <alexander.ivanov@virtuozzo.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, stefanha@redhat.com, kwolf@redhat.com,
 hreitz@redhat.com
References: <20220815090216.1818622-1-alexander.ivanov@virtuozzo.com>
 <20220815090216.1818622-4-alexander.ivanov@virtuozzo.com>
 <d9416fb0-d227-aecd-0dcc-047067360291@yandex-team.ru>
From: "Denis V. Lunev" <den@virtuozzo.com>
In-Reply-To: <d9416fb0-d227-aecd-0dcc-047067360291@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1P194CA0058.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:803:3c::47) To PAXPR08MB6956.eurprd08.prod.outlook.com
 (2603:10a6:102:1db::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a3626884-46ba-4298-fa15-08da808b4bdc
X-MS-TrafficTypeDiagnostic: VI1PR08MB3312:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pFw/D04g8FKRJkaNbpaOc8aROenbKNo8/+rQNzH7yh/0i3+UeXIAAt20E2Sev1ZY4cufrQU+xETwjU7EdAJlYCqRE0bDRTtWEWr15oNQ4oAdDikTi2833Se7hWHmpAfVvCGbN5J5HhVfEyF1+ewXqKk7csKQAWIguKu1LbHenQTrJ4q/G2PV1BJRhfz2/wSW4KnfcwzeI9KqOY2oLDwXI/6riFPUg7kP5mLv9X05pqiE5b+QX9Dm19oYwbPEsdf418nFpxWBZCWp/aD4LrzDveF2AKAU3dVqdmfVK9UqCqZO0pqttKm3Nb0qT6yUIKwjUVoY16kp1bLoERQQzOkSC5Fn9C5GIiXXvTg2R/yw6rMB8YFIferuOft/dPA1QCdiHInG0DyHyyOn4K3EPlBrMngZn476CAJPuMHIwsl4vxk2IMXt+MOC2WA8q29WVdYms1l+JVlUv9fBekduRS/lJe35DDXWzKfPx3PPKfuj5gPsp+SdIZDF42baewOEG96cmTNdJds+sEu9pNcgjm0sSk4isjcbaAXECUR0QNYFXaxq1pEJAl+uNhwl7ntrHMdVOFTs8k4/ntQhP7/Vl4gxABUpe779rty8EYNnPKCVGvkS3XDmoKPEEElgc8fn8PQZs0i5e6Hb2+M5VSejXNzm4rPTEcMjM3hkgeASq6Jin2voV6V7v1SQa0Xs4r0RdG4SEMOTNRB29lTUIu8VinkP/g2uZ1CIvtrfdZ8zZrU8Qvl3NLBe1CZDSmY3elZmaSHGwT1pzWb57MLEF1GDdcMqrWmYPUfKcBoALcDu0PwKsP7ueOM1EY2JBj0WfHZce5qC/WdyCYYoJazWEewsI8QXE6bEtGT1vvoeECGnDB/h4gI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR08MB6956.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(396003)(39850400004)(346002)(376002)(136003)(31686004)(83380400001)(38350700002)(86362001)(316002)(31696002)(38100700002)(66946007)(66476007)(66556008)(4326008)(8676002)(2906002)(110136005)(8936002)(5660300002)(53546011)(52116002)(6512007)(41300700001)(186003)(26005)(2616005)(6506007)(478600001)(36756003)(6486002)(41533002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bTV1Q2JIcHZkS3RyQjJJT1p6SC8rdjhPTTdnRklOem5tZmNzTEFpbXBUY1dx?=
 =?utf-8?B?ZjlBSzVVYVdQalhRdDBITzZMZXB1Sy9wRDVzQkpxTzJUVEFjNC8ySHBNcG1T?=
 =?utf-8?B?MmU0RnowY0JMUGhNaW1jdE1mNFUrS01yeXpKV1dBL1ZzV2s0ZzVZdlZpdGxq?=
 =?utf-8?B?NFRmNVYrR1NMNlhFUDN4blI0ZlkrZENJVlRpSkRLNURiUGM2NXlzczlGNW5E?=
 =?utf-8?B?Z1NiUnQ5ZmVRK3VqWndDTENMbmpXSE5OQUVyd2MrazRjVjFZZ2dLZ3hlSjNK?=
 =?utf-8?B?bkhYeElkc3lJbUd6b2N6MzhkQ0E1ZDhvU1NzSkQwM0lPWVlxdS9CZWJ2MDNh?=
 =?utf-8?B?ZWxOY3FFLzFhNk1PS09XbFpHTm5KaUphODVvd0dtazAzQXRNd2d1T2plUFpt?=
 =?utf-8?B?L3B4TGpwc01vRnFiaG5qTFFwdmhadndicXY5ejBWZFI1QnBrYjlJZWFHTXg1?=
 =?utf-8?B?WDkxWXJDOHVUME9sTm13YnVZQ3NWSEtqUVdFYTJjQXpWMHMyTDZTQ2JLblJD?=
 =?utf-8?B?c2pFVS9GMFFTSTV1Rm9DQ1pOQ29mOCs0bEpVVy9wcjgzb3EwMkwxVml5ZjB6?=
 =?utf-8?B?MVQ5aWFFNEY0WGJ5dVVnbzU4QjBsV0lPWTlnZkN0WTN6S3hJNWZhOGZSTFU4?=
 =?utf-8?B?ZkNSUnpXSWF3WGs1a09DYkEwelptRTMrU0RyaHRvaWkxT3hFVmFxajhpZ0lF?=
 =?utf-8?B?L3VvckN6aEdIOTQxK3c0WGtzV1FpSTlybTh4ejlmOTZKNkJzaU1NY1VVVkpE?=
 =?utf-8?B?Z3h1bG9NVTBFeGZkR3pReUZQVVlhTC9UbHNpSndWN0RHaDUyMmM4TkM5VXNs?=
 =?utf-8?B?aHNEZkN1VHMySk1TK25QSkhkYUZ3RDdPNkFSdU04WSsxL01MbTZ4TjNTMi9s?=
 =?utf-8?B?K3BRaDRNWVQzS2JYZHZ1WWd5Z0JGWnRVRFRUeW5vb2NWU01TZ2VTMm94RmFZ?=
 =?utf-8?B?ejNyWGdPN015TWI3T1hOQlB3ZGJRZ04zNDFZci9uYlU2bm14eWJNQUtCQWpC?=
 =?utf-8?B?dTRsMkpNTkZRMmQzblpRY1l6VTFwa3NYem13Nlpla2Y2QU9GQ2JpOGpMVFNk?=
 =?utf-8?B?dXdsQzU2Q2xPQWs1ZGcxVWFtSGtsZ1JnejZlOS9LQURYMVVwK1V0bSt4UU9o?=
 =?utf-8?B?SVdZTHJaSTdCU3ZOMUFMOWVTRDVjT09SaitNRGZqTmxpWGxyZEZBdngxeTJY?=
 =?utf-8?B?UjJ6MFo2bDhxajlFTjJhTWEwU0kyRTRLWVVKSnZQMlhLQ2dWTGhDUTV4R2w3?=
 =?utf-8?B?SE9Mc1A0dzVsd3kzNndLODVUWTFCRGZtYUorU0hNV0lLRU1jOTJreHBNWkx5?=
 =?utf-8?B?VlFpdS9vSEgrT2N3NWVPRDVpa3hWUmlpTnp6WFJQK3VsWktudXF6YzFIcXBF?=
 =?utf-8?B?cVpWZm9NOEkxL2d4VXg4YVdkY04vWTByOHc4YlFhaElBZzhsN3QwSS9xM0Rh?=
 =?utf-8?B?aUUxbXFac2tpbGZSTUtZS0pGeHFQOTBPTnR2TkFtUUxscnhucnpTWnVaY05P?=
 =?utf-8?B?RHBQUEdlL1JVVVlFeHFFMklFZVI0NkxKTHNTczdXcFZ5QVh1c0xnWDgxVkRw?=
 =?utf-8?B?Y1pYZnBjdFRJTi85cjhXNEkwQW9pc2ZNSWFjOHF6dTVxTXIrdVpiM2JkaU5B?=
 =?utf-8?B?SHN6aGtQSDhZZVRvRldnK1phY0labmhmblJDdE1QZFM4eGVialB4MzJwZ3Q4?=
 =?utf-8?B?K2RFUHZnaWtORWMrV05CV1hNRk5TRWZiSmt1VmdodDlKQ21rcFNtVGNISU1t?=
 =?utf-8?B?R1U0R2pjUU1IMDFDc0N1OHJQNldma2J3Z1N6WXJUbmlodlhsc1JZbm9GeUFx?=
 =?utf-8?B?TXFjTHdXUWd2WngrRmRjcmY5M0VQSUNWVEVqZjJxYmNaeTNOMVdJRVBsTmd5?=
 =?utf-8?B?MTJIUld1Qm85QmxUaDh6WXJ4Y2NnTDFRaTdqNVpyZ1NJMmVuZEVid3NnRGY1?=
 =?utf-8?B?c2kvY3B4aVhzSnptV0pKZjVybHlFdTFwZTFReWk2NU55dHRFMVBaWVNhVm1i?=
 =?utf-8?B?Z2RPMmFmQlR4OU52YWJWZVRPVFpuM0hpZlYyNVBnTzV2WjhYN0l5eXg5ando?=
 =?utf-8?B?dVZpWWdQOVNVSGZsMWRvZmFRNXJyVTZFVXVyZnRqL2laSUpRbTNSK1pFaFB6?=
 =?utf-8?Q?F8VI44T+hHscTvDCao1uANu61?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3626884-46ba-4298-fa15-08da808b4bdc
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6956.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2022 20:01:38.9022 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Raq+hLC+GPqg+mcPzALZYB96gKtuKeseC58IkmKgQeLJURqS1nfWkpxdSrlARTXXq1UsAjHOxWm5Xcv01cPTZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3312
Received-SPF: pass client-ip=40.107.22.133; envelope-from=den@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

On 17.08.2022 21:48, Vladimir Sementsov-Ogievskiy wrote:
> On 8/15/22 12:02, Alexander Ivanov wrote:
>> BAT is written in the context of conventional operations over
>> the image inside bdrv_co_flush() when it calls
>> parallels_co_flush_to_os() callback. Thus we should not
>> modify BAT array directly, but call parallels_set_bat_entry()
>> helper and bdrv_co_flush() further on. After that there is no
>> need to manually write BAT and track its modification.
>>
>> This makes code more generic and allows to split
>> parallels_set_bat_entry() for independent pieces.
>>
>> Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
>> ---
>> v2: Patch order was changed so the replacement is done in 
>> parallels_co_check.
>>      Now we use a helper to set BAT entry and mark the block dirty.
>> v3: Fix commit message.
>>
>>   block/parallels.c | 19 +++++++------------
>>   1 file changed, 7 insertions(+), 12 deletions(-)
>>
>> diff --git a/block/parallels.c b/block/parallels.c
>> index 7f68f3cbc9..6879ea4597 100644
>> --- a/block/parallels.c
>> +++ b/block/parallels.c
>> @@ -428,7 +428,6 @@ static int coroutine_fn 
>> parallels_co_check(BlockDriverState *bs,
>>       int64_t size, prev_off, high_off;
>>       int ret;
>>       uint32_t i;
>> -    bool flush_bat = false;
>>         size = bdrv_getlength(bs->file->bs);
>>       if (size < 0) {
>> @@ -467,9 +466,8 @@ static int coroutine_fn 
>> parallels_co_check(BlockDriverState *bs,
>>               res->corruptions++;
>>               if (fix & BDRV_FIX_ERRORS) {
>>                   prev_off = 0;
>> -                s->bat_bitmap[i] = 0;
>> +                parallels_set_bat_entry(s, i, 0);
>>                   res->corruptions_fixed++;
>> -                flush_bat = true;
>>                   continue;
>>               }
>>           }
>> @@ -485,15 +483,6 @@ static int coroutine_fn 
>> parallels_co_check(BlockDriverState *bs,
>>           prev_off = off;
>>       }
>>   -    ret = 0;
>> -    if (flush_bat) {
>> -        ret = bdrv_co_pwrite_sync(bs->file, 0, s->header_size, 
>> s->header, 0);
>> -        if (ret < 0) {
>> -            res->check_errors++;
>> -            goto out;
>> -        }
>> -    }
>> -
>>       res->image_end_offset = high_off + s->cluster_size;
>>       if (size > res->image_end_offset) {
>>           int64_t count;
>> @@ -522,6 +511,12 @@ static int coroutine_fn 
>> parallels_co_check(BlockDriverState *bs,
>>     out:
>>       qemu_co_mutex_unlock(&s->lock);
>> +
>> +    ret = bdrv_co_flush(bs);
>
> Oops that's wrong. Here we probably rewrite previous error of 
> bdrv_truncate stored in ret variable.
>

You absolutely right, we have missed this point.

Good catch!

>> +    if (ret < 0) {
>> +        res->check_errors++;
>> +    }
>> +
>>       return ret;
>>   }
>
>


