Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0CC9310AAE
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 12:54:22 +0100 (CET)
Received: from localhost ([::1]:53082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7zgr-0006lc-PR
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 06:54:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l7zev-0005gK-Vp; Fri, 05 Feb 2021 06:52:24 -0500
Received: from mail-eopbgr70127.outbound.protection.outlook.com
 ([40.107.7.127]:62693 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l7zer-0000zv-Qy; Fri, 05 Feb 2021 06:52:20 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mqeszz7XqU0E9K1HJHvqIK36jHXauIDN4E4jmYlj7ecMYPvYd5Rtl9irLWlhWWR78SzuXfcygT8zO4IlZ8ODqtNphlfAQPHesejW1/VLgmbCqi8jgBZsszcMaOfYaDijUpGdxJMAvvh2ybN/noTWl8EEqZTc+reKyMRhneiTGdU4wZ/TIGq/beex8Htu1LuKCJh/qgnXU3xqajd+uozK8nVz+xfQb/x79iU4slOBA6yLm3CfA5QjD+gGtaNqKh9azCL2A9aUb/AeIj76bApD8UpuDLS4DzRx04yYcQX7ExmVA42EWM82XdNV1qlq643WvldZUc+uaDdceXr3WhZ4Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uBx5CGRMs5/0+Vj8eyV9klO39SpbGzuhGcIWB/vJ+X0=;
 b=IyrPXqmvXz2XE+vRbjf+71PuElGswWRdTshFL4vrNLIlSRUf1OCPZFVKV0bFK2SaiBvCF8FtGQ8U+e9ZkEkDLn9sX8BWxZjtk7aZL+9OMsZCeNF0YmkbaEup7WsQTqokhfFLQvA03y9d/ixoSlqdeT/2F6xhVHSdy50GAZAAm1LapjGN8bwVQ7kUJ3jJR74QWHtHNr615mr3k5ppaNOiCTtTxadBTGUbR4rsXPJ5FAgL1WQPTbEkmkXPk8BXv4P9hqcEtoxJ4nDEaXdHFVkqfjM02jjqvekG2ibIg6gG/i2CX4YwZR5Ohrgic0aVb4yjGEzV4Sv83Jh6Q3arFlVEDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uBx5CGRMs5/0+Vj8eyV9klO39SpbGzuhGcIWB/vJ+X0=;
 b=R/L9Zo9q3/EUH8UXOJ++vZbjIiJperqyu80mF6Do+J8snimNhjiXFnE0b7Khrpyh69jCjIn8AbuM+DaEPeAAna2ZGvw8bIpJjHpGugRphBeAFgGfhIBzFVcPjjpQqByqUx/99Hz8Seyvp1bXlXYaKD0Rfn910kpzB41yr7tIXmE=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4534.eurprd08.prod.outlook.com (2603:10a6:20b:ba::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.19; Fri, 5 Feb
 2021 11:52:05 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3805.028; Fri, 5 Feb 2021
 11:52:05 +0000
Subject: Re: [PATCH v7 08/14] block/qcow2: qcow2_get_specific_info(): drop
 error propagation
To: Alberto Garcia <berto@igalia.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 jsnow@redhat.com, stefanha@redhat.com, pbonzini@redhat.com,
 pavel.dovgaluk@ispras.ru, ari@tuxera.com, mreitz@redhat.com, kwolf@redhat.com
References: <20210202124956.63146-1-vsementsov@virtuozzo.com>
 <20210202124956.63146-9-vsementsov@virtuozzo.com>
 <w51lfc2bv08.fsf@maestria.local.igalia.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <f5c4c064-166f-a2bd-8d86-1c25a3c26646@virtuozzo.com>
Date: Fri, 5 Feb 2021 14:52:03 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <w51lfc2bv08.fsf@maestria.local.igalia.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.213]
X-ClientProxiedBy: AM0PR04CA0048.eurprd04.prod.outlook.com
 (2603:10a6:208:1::25) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.213) by
 AM0PR04CA0048.eurprd04.prod.outlook.com (2603:10a6:208:1::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3825.17 via Frontend Transport; Fri, 5 Feb 2021 11:52:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1b867f92-229b-4569-9188-08d8c9cc755b
X-MS-TrafficTypeDiagnostic: AM6PR08MB4534:
X-Microsoft-Antispam-PRVS: <AM6PR08MB453464AC9B4EDCECC1FF6B97C1B29@AM6PR08MB4534.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:883;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cNBMHOnRO2KDRHDRcR6lDYXn9mBpkzlC7anqLBxDdfRqnpVnKa/uIV6bUZafvw/W6vG6/weXsDehwaQhkqeM+uo5eoOCy3CHzsIwBNtccLcrFa3GMNEZ39b/MyuWhRhwrvXPVvXID6MHIpTzqtllgSATVKls26yLAne4/cf1MDnf/Rykz1X7TFeF43ks7QYauw5I7J43SkgCukb8P3UH5x94A4AjjFcUclLlUYh3n4WJEvhf1Ulg6CguJP76O5rRQ/agKeAJ+DZRLOGHal9E9Z4s+OdlO8flF7jSxQIpmA4XigcavyS42TkkEsqW/pAxkUG/81Ntc5ZVa/UI2AVumiljV9byAU/Pdkv9nIOAG7tX+f+tH114r21DliYPRCKVIPFhkPanv7pm2mWWrUMpGeGI7MWVEpGRn2tIqDqtW8YdPNtCng2XZo/WADOL/oXJfUQ56aRLGY1osfrZuOyozzSs7p6p6ojURpmrrCFw5Ro0YxsIficTnF3XrznzgRBCnGgOqbT+bxog2f8PkBafRmYCR+tEPhCIKO6q0xKyM2Q3tsIgjUb8DxuEtGsrqxVtWZ6sVmYohUoX4Rmn1OlmHWOPhRyuL9W2dglfeiR5c40=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(39830400003)(136003)(396003)(346002)(16576012)(316002)(31686004)(83380400001)(6486002)(2906002)(16526019)(8676002)(19627235002)(8936002)(31696002)(478600001)(4326008)(86362001)(186003)(66556008)(36756003)(5660300002)(52116002)(7416002)(66946007)(2616005)(66476007)(26005)(956004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NlViSmYrTEpXTkxnclpKMWtxc1g2Ynprb0NJNFlJSlVKZDFheGFqVkt4L0ZK?=
 =?utf-8?B?WkQ0bWJCS3hwZFQzaGVaSFIzV1lnc2ZwVDA1SVVOM1kzbTN5NHNINFRza2Z5?=
 =?utf-8?B?RWk1QkxuOWhGR00vUVpWTWVOMERNZk1BMjdCSEJFQ0VFK1JxMkhYejFtdmFl?=
 =?utf-8?B?ZStmTy9nL21YMmlFQWJvaHBOcHpUUEI5YnBQYkpBS3dYYWw4a1BYRFZHKzl4?=
 =?utf-8?B?MGZIZkVDbStwOG5YRGJNVk16S2Myai8vMG5Yd2c2cUJCQU9nUU1MUXQxc21w?=
 =?utf-8?B?MWdydFhlOFNMN0dLR1p5SGRzNlRXQlFPSzMweHc5aDZwOXo5WUl1K3prdms1?=
 =?utf-8?B?ekJLNXgxV2lXTGNRUXprbDcrcHRMT3dRS25WNVYydEV5THVVWGIwMFNORDd5?=
 =?utf-8?B?QkJDV210V1ZTRHZEd2xJZWRvc2hoUWlkYjJNL0d4NzRlTVQvUHRpWXp3eksx?=
 =?utf-8?B?VWE4bjhVbmJXWStXQkxjc0diYTBQZDhSQldQVzRpMXFySW45elU2QlVZeUw4?=
 =?utf-8?B?djF5amlaQ0tuR3hSTUxqQ05kV2kvZEtzQVVoQjhyOGQxV1dXMUcrQlB4dUVz?=
 =?utf-8?B?WUtvY05lV25mWGJwVjZqZmRzVWdGSXJiVUVYNi95SHhVVHpVQ1AvYjRGSSt5?=
 =?utf-8?B?dXgyWHBSMHlOL1hmT2I4SUh0QVZQczE0M1Nlak02c3I1RURJam5yNkdKdnI0?=
 =?utf-8?B?dDJCVCtLN0hCTWpKaDJva2VoTHJVaElRVjM4eFRjNmNNaTYrTGMyZytuUTVF?=
 =?utf-8?B?U2tqNUVSM2pGMkdtK0VQVjNTNm1hTFpYd1lmemhzOXFUQk95ekYvYzRBMHlN?=
 =?utf-8?B?VzVQejA1MC9FakkrT1FDUUN4eVJmN2xNeFcyRDAveXRxc3BYRXpWMlFDQkp6?=
 =?utf-8?B?SlkxajRJRTRrQ1RuSk5tN0pna3pRaDZKM2FGUU9lV3gzNnV0WWszUTQ5dkVF?=
 =?utf-8?B?dW0rTXFiaUZFd0FHMXhNZElUWlMzODVhZTFoOEhxOEpLdU5MK2FSSXBqZWhk?=
 =?utf-8?B?K0JQajNhODRuM2xCMjBoY2JJOXZMRFlIbWpGMUlkM293WGZBcXZFa3NWck1X?=
 =?utf-8?B?aW9PbGExb2wxcTRYaTd3Rk5ETjFhZXl3Z3BHeU55K2Y2VFFDMmgvaDJuYTJD?=
 =?utf-8?B?YkJrUEtxVjltNGxNSU5QaHdXOWFrYll3UExxWjVWMjZZZ0RUK1ZPRFR1R0Ey?=
 =?utf-8?B?eFplQ0JLb0NFdFcvQ1hVcVBKVnJVUzU2WHdRWFNVZWQxcHYvbG9mb3BNdVln?=
 =?utf-8?B?RDZhZFo1QlZBWmkva0dHSE5ha3hyK0pvUkZzbGg1ZTJoTUNBd2NHUHVUN0tw?=
 =?utf-8?B?d2o5SVl1YU1XaXVKQS9wVmozcXBSYW12VjNCRTZhVkcxUFZwRitFZnYzck5N?=
 =?utf-8?B?Wm9BbXlqRy92Yk1INUhyMHo0bS81ZDhqTTJMMGlTUW45ZTJKODdaSmg4QUNO?=
 =?utf-8?B?UE9yOUptSHYxdjRTcmtjTEduT3ozbU1TbXVITENnQ1lnMGxYZWQ2Z1lrczk1?=
 =?utf-8?B?STBKNko2MEJtOXJOa2tiQlFXMXREZDRSQTcrNEVKUHBXLzlMMS9hNzkyTGxx?=
 =?utf-8?B?Vzk0VU1wcW1GaHkvbWxrV1NFUGtmV2ZpWHlvZVh5Smp4TGg3c2tjMjhFOFV0?=
 =?utf-8?B?OTdLTkcvOTIwUyt2UlJRSlVLYUJVNjl2eXZsd1F6eVpXaHQyR0lhZnIxL3Ni?=
 =?utf-8?B?VVZMS3RIV1N0bTV4Y2UrNVByT1BZVnRVOHdvL3VpNGNqazFtRWZ4UTdMQmdv?=
 =?utf-8?Q?e1tKtJ0z99rr+Ox3ZfNa16NNms8nI6X5IX4fjiY?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b867f92-229b-4569-9188-08d8c9cc755b
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2021 11:52:05.3775 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: albpP/gF65rFRDmIph3AgM6L8FsRXodpQZKO8niadra03btYmzH2altZX74rHkxdVpfJ728STeeVad7stmI/w2+W/NcYBhLZjZIpIx3J0Bc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4534
Received-SPF: pass client-ip=40.107.7.127;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.33, RCVD_IN_DNSWL_NONE=-0.0001,
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

05.02.2021 14:43, Alberto Garcia wrote:
> On Tue 02 Feb 2021 01:49:50 PM CET, Vladimir Sementsov-Ogievskiy wrote:
>> -Qcow2BitmapInfoList *qcow2_get_bitmap_info_list(BlockDriverState *bs,
>> -                                                Error **errp)
>> +bool qcow2_get_bitmap_info_list(BlockDriverState *bs,
>> +                                Qcow2BitmapInfoList **info_list, Error **errp)
>>   {
>>       BDRVQcow2State *s = bs->opaque;
>>       Qcow2BitmapList *bm_list;
>>       Qcow2Bitmap *bm;
>> -    Qcow2BitmapInfoList *list = NULL;
>> -    Qcow2BitmapInfoList **tail = &list;
>>   
>>       if (s->nb_bitmaps == 0) {
>> -        return NULL;
>> +        *info_list = NULL;
>> +        return true;
>>       }
>>   
>>       bm_list = bitmap_list_load(bs, s->bitmap_directory_offset,
>>                                  s->bitmap_directory_size, errp);
>> -    if (bm_list == NULL) {
>> -        return NULL;
>> +    if (!bm_list) {
>> +        return false;
>>       }
>>   
>> +    *info_list = NULL;
>> +
>>       QSIMPLEQ_FOREACH(bm, bm_list, entry) {
>>           Qcow2BitmapInfo *info = g_new0(Qcow2BitmapInfo, 1);
>>           info->granularity = 1U << bm->granularity_bits;
>>           info->name = g_strdup(bm->name);
>>           info->flags = get_bitmap_info_flags(bm->flags & ~BME_RESERVED_FLAGS);
>> -        QAPI_LIST_APPEND(tail, info);
>> +        QAPI_LIST_APPEND(info_list, info);
>>       }
>>   
>>       bitmap_list_free(bm_list);
>>   
>> -    return list;
>> +    return true;
>>   }
> 
> Maybe I'm reading this wrong but...
> 
> In the original code you had the head and tail of the list ('list' and
> 'tail') then you would append items to the tail and finally return the
> head.
> 
> However the new code only uses and updates 'info_list' and it does not
> keep the head anywhere, so what the caller gets is a pointer to the
> tail.
> 

No. *info_list is modified only on the first loop iteration. And than info_list is switched to &(*(info_list))->next, so on second iteration we will modify @next field of first element, not original *info_list.



-- 
Best regards,
Vladimir

