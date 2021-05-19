Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40BAB388B99
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 12:22:30 +0200 (CEST)
Received: from localhost ([::1]:53174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljJLR-0007jr-C6
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 06:22:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ljJBY-0006v3-SU; Wed, 19 May 2021 06:12:16 -0400
Received: from mail-eopbgr150125.outbound.protection.outlook.com
 ([40.107.15.125]:44964 helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ljJBU-0005Am-9J; Wed, 19 May 2021 06:12:16 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mt1KuFsfAWAe1B22P52ZSdP5gGHDcmtyQuyn22FeQlcT922oRDIUAlUqryHNT74icjYOQZ6wrarDT5cm80E+VqkAppK7hgow+yLECPtKZdy4/ciQiTCF9vF0aFkqvEft18rm5lSDHlRJ6fE9AzZgyklE8BKjiMe10Nr6/Wmh9auasCxlHUlw8KzpvHE5V8O7c4t5NJhK+gZyT9QPF/fRbvFAVfShXMOqPg/7OSM1l4TghEXoZhCRG29Et5X40P1YCgZC8jzX6QPKYYT2d2Xcq0CLV+bWvQgIUztp4qbLI0c7pFMz0JSRgYnMreYRsewcQpZHLkRfZ67hbyx7niBGzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gc93+oKKx0a0240+eGSJXvuTvWBMCYiUz5dUsxiJGA4=;
 b=Dz+hRWLF+8tX8oIGD+R56hZzSBQpqDGu/AnSF5Sp7wJ9XrAYzvcSrvmZKD8X9D6KKaDj+Bqk3BtPHnYAqbx2d/gb89UB5ZtXNGn1M4ZRNvFZl0AFG4O3uSY+Du0qVZEpqjAtLSbSmkI+tvAThuLQOMLvVmIYlhxhhjzZM4qNyrzr3VFAPNX3C5ooMBU1XexDih4n0/Oi9ynHQctZuFdrAzKYTiNhRQxEzZLXrM5yOm13pI0SSVp9k1qIy5Afu8IYPsxNvkBC6XfCnGv1oKhS+2RBT0GjCS0yWlJRPImP9TdkCpr1ppCZe4a1uXYawdSRApILVOyhEvnunoNzBaTzrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gc93+oKKx0a0240+eGSJXvuTvWBMCYiUz5dUsxiJGA4=;
 b=IMAXeACVJUXTtVkiDdXm6hQ3ZFX2n4ANWERZTfD1rYsQL01X7Q7ahTtrpklBJdDXPg0btM3IQX+kTZoof3xcmwbWvUS/lc1mjMelworlk6yPZsZh93E80eDGW2bAMbqwWY2m/MRTDpRZObaNnsDiQJV/5lbhwoYLwyDBvrT5/4I=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6946.eurprd08.prod.outlook.com (2603:10a6:20b:345::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Wed, 19 May
 2021 10:12:07 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4129.033; Wed, 19 May 2021
 10:12:06 +0000
Subject: Re: [PATCH 01/21] block: introduce bdrv_replace_child_bs()
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 ehabkost@redhat.com, berrange@redhat.com, pbonzini@redhat.com,
 jsnow@redhat.com, kwolf@redhat.com, den@openvz.org
References: <20210517064428.16223-1-vsementsov@virtuozzo.com>
 <20210517064428.16223-3-vsementsov@virtuozzo.com>
 <ee302de8-bd22-b43c-f30f-eedce438d825@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <7291edd6-f5e2-63d3-0633-9d55fd14cfc6@virtuozzo.com>
Date: Wed, 19 May 2021 13:12:04 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
In-Reply-To: <ee302de8-bd22-b43c-f30f-eedce438d825@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.218]
X-ClientProxiedBy: FR3P281CA0011.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::17) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.218) by
 FR3P281CA0011.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1d::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4150.11 via Frontend Transport; Wed, 19 May 2021 10:12:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a96adce2-d85f-4500-2875-08d91aae8e82
X-MS-TrafficTypeDiagnostic: AS8PR08MB6946:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6946D66267B87003193DFC81C12B9@AS8PR08MB6946.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: l1vO1vpWmof1NzS/6pQ/+AI4E8Z9IavSm9E9By1rFqtigLgG1wiPZUp28O7PYDTU+C6pbzmtkOWeaV9qzUuyQYrmvGj4TRZFLdp8dpO0TCMZReP/EOJcBisgmp1L2UoqvbLWi6w+e19vtOdG3ZkPEagM7lDlyuDm41k/sZns431BWhMX3HDtaEO3HosRDIJStJceAOK9aQCj7B0jj5UFJrj+hAr+AFasrnfDYcFyJW2t0duq7qp9Puoj9M8N4Agt2K6yi3CtRbCNSpowqmZFjAMTFnUDdxnhWMMCWwpQCov0DB8gasz8sPBbEZNeB4fyR6uUOI9NRfn4HmFyUeq+ruR0wBMW30pe6PGQcylFt9VZSKdXwvMYzl2wNBzAtxR3rRXO5l0c+OXXhl3OiFYgYIFT5KtEhQWwzv+hBN520t8mp4qBJWt4Kr0leFnZSMR1dO0Y4AGLlgxKlgm0SgNNoRUbgA3EN+XTggStOkfp+9LOQ/Yj4+RzkcSLVoFr14KoAVs3nNbfL1snaCeJMIPlx7LwFMBD3z7FVmhOR4UMXN6L9WZLvrlB+7EKpUak8X748AUcZbDguMuS8vQGbeEpL8Wcxxs1zaMPKvG7L2G+JU6Zu0/JWrMMNeZRNeji0hVahh1VhsxjLtr2gINQjWTyxaRV38kQMKAWZ+9dj6BS9vE0lpTmBL+aW7Wgn2OFUjpWs/1e+xVMKRCseo4xOmBAFfstLgMWpwWXEQRksq4V4V4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(366004)(396003)(376002)(346002)(136003)(5660300002)(38350700002)(38100700002)(7416002)(86362001)(26005)(52116002)(186003)(31686004)(8936002)(2906002)(83380400001)(16526019)(53546011)(66556008)(316002)(6486002)(66946007)(4326008)(31696002)(36756003)(66476007)(478600001)(956004)(8676002)(2616005)(107886003)(16576012)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NmdJOE9YVlJIRVpvdVc2Mms1bnVKbkRIMFN4TDVnWkdCR2ppMmhqT3FSelBU?=
 =?utf-8?B?Q0NqWjNVejBKVjNvTnVUUm9PSDlYU2tldk1oZTdZOENnMjdNU1lXNElSMWY5?=
 =?utf-8?B?azFTL3ZKUm4zVWRHSWRFSU1icUdiN0tSdVN1TjFUL0ZhYUEzZFRGbE5xeS9F?=
 =?utf-8?B?bWcxdGRFNkpNQWdtaTJPeUNUbHcvS3dpMmRXNDBUVjBqMFc1QU5TcmRab1Y3?=
 =?utf-8?B?RDJ0aWxUaGxoM3VuTVRUN1dJalR1NXN2WGp4em9WTll2TEZUUTMyK2pGQkNZ?=
 =?utf-8?B?L2hGQWY5RkloRk11OUtXL2RPUVZ3cUpPOXVUaXYxenpmaGczeXVHenUxa1l3?=
 =?utf-8?B?NGZHVW01RTJ5UjVPRSthVnNCSEhuQzE2eEx3emRId01RdklmNytmdkFUeStl?=
 =?utf-8?B?b2RnSVJGT0NtdDlOWkRjcDBuMmRPMEc0eEQzczduVTIza1NYWTEyeXdvZFUr?=
 =?utf-8?B?a2kwbXl4TjlIaThTUnVmL0ZENkZ1TWNtS1pkbkllOUdHZDlQaldkUnhRdXlM?=
 =?utf-8?B?RFJ0dzVNc0MvOWF3N0I4dmpTQnExR25vcjlkZTJuZGdUbDA0QWZBcnVyaGVQ?=
 =?utf-8?B?a2lSSEhqYVVPbEFnMDFVOTdoaTBpcFF5NTJGRFhSeE9VOGlyYXVCanZCY0RW?=
 =?utf-8?B?ZDZMb3VXdVdpeHhYS2tZQjFmeWQ0VUUzSmU2Z0pOQnZRUEdiUGoyUjhuQnIv?=
 =?utf-8?B?RnluZFpoWUYwbWhTczB6VUErbFRSbGxxbTdsWGlGdndrZjR6dEEvMmY4MHlw?=
 =?utf-8?B?cVlEVlFKNHUwZzdNUExFcUs5MjJWREVuTm1wblRoN0lMUG9jSDZlcTlJU2oz?=
 =?utf-8?B?NEx1V3Q1a1ZnVWYvMzRJR1kwYUdQUDg4eTM1bW5CR3phajJqSSswcE5CTDJh?=
 =?utf-8?B?ck9HY2J0Zy80bDlWODJPYU42YzlhVTF4YkNkWmNxV3hLOEtha2Rpd3BWayty?=
 =?utf-8?B?REVyblhwRVRCYThkcVFhRVI4ZU5jK0p5azdpVGgzdUVzYy85MUxzWjl0Vmx4?=
 =?utf-8?B?S3BObzZHdjdsRTh1dld2YTBvYitlLzFIeExWV3IwQTREWkh3Q2Jsek1ScThQ?=
 =?utf-8?B?OVNzUkg1TFZRbFR6a3FUVUp1YnE3OEhjYWdwTnZTaklHTmhZdnJrcWxodUhT?=
 =?utf-8?B?eGx0eGFTUTUvT3J1QUozOGYwdnNyYmpiZ0IrWGllRDM0Nkt5cEI1b0VRdHlZ?=
 =?utf-8?B?alJFNG1pWCtHbHc1S244RytqZTFudCtrR1hDMVFxaHlSdlVIcnNGMEtmVUg0?=
 =?utf-8?B?N25VWmMwaVp5TTJEcExUWTVneE5FYTJoaTErKy84bHYvVXhObXRjS1d6TEFE?=
 =?utf-8?B?RmZlVXRlejZMOVkrVmxNd1VCMjBIUjB0ZlZiQ2tGMHhSTTZ3QVozUDd2dVNC?=
 =?utf-8?B?S1BMQklveUtpelpiWXlCUlF6aWQxaVAzM0VCc1M1blowbys1TnpoQmtzbllq?=
 =?utf-8?B?RVRCQy84VHo4OFFCZTlQY21nV3FybTZ2T0l6aDREbE1IR1FaQVRtalpsTC9E?=
 =?utf-8?B?ZlVOdy9WNzNUaCt1bjhSbmRxYmZjVHo3ZUg1S0J4SVh0T3FwWEZyMzZLYjJ2?=
 =?utf-8?B?K01sMXhESnplUkhsbUcxdEVDdVFWY0VKY3RUdFptZ3l0Sm5xWHBwRmlSKzlL?=
 =?utf-8?B?NVhqY1lsQm43N3lDZHpqdCs5bHlhZzNjRHhwNzFTc1NLOGZIV0FRMEhubmNU?=
 =?utf-8?B?VEI2ZDhMZlBveUJUZkNwZjdlTkVjeXdPb3VnZjBJaWhOTFhQQzluZHI3aThR?=
 =?utf-8?Q?k0AQFztnKBed3Uyy8dL3qiGU/kY5zbFVhSgKFhA?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a96adce2-d85f-4500-2875-08d91aae8e82
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2021 10:12:06.8356 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: flc2XjkYUaIQU/lz/XmhI9wZnfy19UnXgfUgKWddlVd5AZHQFVh5MyVQ4z0+IXkqy4XBd5QE93sG+kxBgogzgROhOz4Bn7Psd1nPrL03FhA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6946
Received-SPF: pass client-ip=40.107.15.125;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-DB5-obe.outbound.protection.outlook.com
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

17.05.2021 15:09, Max Reitz wrote:
> On 17.05.21 08:44, Vladimir Sementsov-Ogievskiy wrote:
>> Add function to transactionally replace bs inside BdrvChild.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   include/block/block.h |  2 ++
>>   block.c               | 36 ++++++++++++++++++++++++++++++++++++
>>   2 files changed, 38 insertions(+)
> 
> As you may guess, I know little about the rewritten replacing functions, so this is kind of difficult to review for me.  However, nothing looks out of place, and the function looks sufficiently similar to bdrv_replace_node_common() to make me happy.
> 
>> diff --git a/include/block/block.h b/include/block/block.h
>> index 82185965ff..f9d5fcb108 100644
>> --- a/include/block/block.h
>> +++ b/include/block/block.h
>> @@ -361,6 +361,8 @@ int bdrv_append(BlockDriverState *bs_new, BlockDriverState *bs_top,
>>                   Error **errp);
>>   int bdrv_replace_node(BlockDriverState *from, BlockDriverState *to,
>>                         Error **errp);
>> +int bdrv_replace_child_bs(BdrvChild *child, BlockDriverState *new_bs,
>> +                          Error **errp);
>>   BlockDriverState *bdrv_insert_node(BlockDriverState *bs, QDict *node_options,
>>                                      int flags, Error **errp);
>>   int bdrv_drop_filter(BlockDriverState *bs, Error **errp);
>> diff --git a/block.c b/block.c
>> index 9ad725d205..755fa53d85 100644
>> --- a/block.c
>> +++ b/block.c
>> @@ -4961,6 +4961,42 @@ out:
>>       return ret;
>>   }
>> +int bdrv_replace_child_bs(BdrvChild *child, BlockDriverState *new_bs,
>> +                          Error **errp)
>> +{
>> +    int ret;
>> +    Transaction *tran = tran_new();
>> +    g_autoptr(GHashTable) found = NULL;
>> +    g_autoptr(GSList) refresh_list = NULL;
>> +    BlockDriverState *old_bs = child->bs;
>> +
>> +    if (old_bs) {
> 
> Hm.  Can child->bs be ever NULL?

Seems it can. For example we have hmp_drive_del command, that removes bs from blk :(

qmp eject and blockdev-remove-medium seems do it too.

> 
>> +        bdrv_ref(old_bs);
>> +        bdrv_drained_begin(old_bs);
>> +    }
>> +    bdrv_drained_begin(new_bs);
> 
> (I was wondering why we couldn’t handle the new_bs == NULL case here to replace bdrv_remove_filter_or_cow_child(), but then I realized it’s probably because that’s kind of difficult, precisely because child->bs at least should generally be non-NULL.  Which is why bdrv_remove_filter_or_cow_child() needs to add its own transaction entry to handle the BdrvChild object and the pointer to it.
> 
> Hence me wondering whether we could assume child->bs not to be NULL.)
> 
>> +
>> +    bdrv_replace_child(child, new_bs, tran);
>> +
>> +    found = g_hash_table_new(NULL, NULL);
>> +    if (old_bs) {
>> +        refresh_list = bdrv_topological_dfs(refresh_list, found, old_bs);
>> +    }
>> +    refresh_list = bdrv_topological_dfs(refresh_list, found, new_bs);
>> +
>> +    ret = bdrv_list_refresh_perms(refresh_list, NULL, tran, errp);
> 
> Speaking of bdrv_remove_filter_or_cow_child(): That function doesn’t refresh permissions.  I think it’s correct to do it here, so the following question doesn’t really concern this patch, but: Why don’t we do it there?
> 
> I guess it’s because we expect the node to go away anyway, so we don’t need to refresh the permissions.  And that assumption should hold true right now, given its callers.  But is that a safe assumption in general?  Would there be a problem if we refreshed permissions there?  Or is not refreshing permissions just part of the function’s interface?
> 
> Max
> 
>> +
>> +    tran_finalize(tran, ret);
>> +
>> +    if (old_bs) {
>> +        bdrv_drained_end(old_bs);
>> +        bdrv_unref(old_bs);
>> +    }
>> +    bdrv_drained_end(new_bs);
>> +
>> +    return ret;
>> +}
>> +
>>   static void bdrv_delete(BlockDriverState *bs)
>>   {
>>       assert(bdrv_op_blocker_is_empty(bs));
>>
> 


-- 
Best regards,
Vladimir

