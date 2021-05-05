Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBBA8373881
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 12:21:42 +0200 (CEST)
Received: from localhost ([::1]:41930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leEez-0001YQ-SB
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 06:21:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1leEbS-0006UE-I1; Wed, 05 May 2021 06:18:02 -0400
Received: from mail-eopbgr130134.outbound.protection.outlook.com
 ([40.107.13.134]:27454 helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1leEbO-0004Ht-GN; Wed, 05 May 2021 06:18:01 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f3VOOKkMd2VurV/a6dgLsZWQ53prLhSww3J5YJUBUYkkWYpq47kY8EnBQ7wrU5QCLchMqcglxs30oCOd6E7Nh79245l/3riMjFCNlzBxI95rGArlJV0PtJB4kHXouO+sww2hiMPkZ4MCLW/SzNetgMX4YrXygpc+ohEFz5JdzaMAoYMHB38jCKfDpP9gpnrb2mgy1xoEH0nIyPxNSlrYH7zDhtjiB6gfm/+zAi2SM/Km16DHjlrD5HtRG1Twc2qAPTJScH0++5/nT2HnKeOUW4ytoYG6BQ1SY0Jrar0Qk0VVtdZLA1U3kHdFVR4wdCow0RLNHdhdwVNEEJGtTeaKDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=owANvEP8ALe8OoQ8LSU2uUxEK5BEpqXvQ7m+aM6+7zA=;
 b=oHM4ut8S5J4Ts7IPMDLAcaDb+agh5du98KQp+NU5gzY+PmjPhUKB+OgoE5n6GOLaq4pd0iRRo/0m8rpHRPbeVb5mcIxea1cEccpv5FybYLvPvAk3s82L9LQ5D5pTWhwMZ35APEKAV40YdWyWEQxsusQRkl1CF/Wklywby8Zea4z6Q5KU9uROT6XZUGOFv7JLv6jBSOC4yw9BreDvJHgbbHapzfQ66JJUW1MWNy/NVm0m+OoEKsatoSanvL+ezpxj2eUBM5KWjkgit/zJ301HE1EH8hgU6kQHdy8BhUwwuSiLFXcy/YIQyZMcqt6x5mc0hgRAGGhtLvT5Ull2ipCY2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=owANvEP8ALe8OoQ8LSU2uUxEK5BEpqXvQ7m+aM6+7zA=;
 b=qzXXOwnhv7BboHXaeTsLwsuBce/hIW8u5b/wNZF5aAXqLj+nSM5OA3H8a/yiF+s4j67dkn+vUR3GytJiFHzVLTxgNZt7MzGtNnzDG0Kc5eoHbHTO9ECN+UtRfSV6impEtCQD3s8pp8IxAWy35M37z6+AkLFN3LM32Dukq6nJD+g=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3541.eurprd08.prod.outlook.com (2603:10a6:20b:51::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.35; Wed, 5 May
 2021 10:17:54 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4108.026; Wed, 5 May 2021
 10:17:54 +0000
Subject: Re: [PATCH] block: simplify write-threshold and drop write notifiers
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, fam@euphon.net,
 mreitz@redhat.com, kwolf@redhat.com, pbonzini@redhat.com, eesposit@redhat.com
References: <20210421220950.105017-1-vsementsov@virtuozzo.com>
 <YJJvC3OsOj9Z3+4G@stefanha-x1.localdomain>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <1e872925-2ddd-1072-9d35-d94f9cee63eb@virtuozzo.com>
Date: Wed, 5 May 2021 13:17:52 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
In-Reply-To: <YJJvC3OsOj9Z3+4G@stefanha-x1.localdomain>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.236]
X-ClientProxiedBy: PR3P192CA0028.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:102:56::33) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.236) by
 PR3P192CA0028.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:56::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.24 via Frontend Transport; Wed, 5 May 2021 10:17:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 190c0c33-6919-4096-fdbf-08d90faf0bcf
X-MS-TrafficTypeDiagnostic: AM6PR08MB3541:
X-Microsoft-Antispam-PRVS: <AM6PR08MB3541D2180C1010664881E8F2C1599@AM6PR08MB3541.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1265;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XPKSZ4wT9HD94i0JQNhzw1DRtt1UoTIx8p/2WJKRI8/YntFts3eFEngvgiMXdFdkSJOclWZVRdVNU1I5m/q8MhhIukWyVqLRsdC54o/4se3KI0PU7mYtEHtploDj7zKevTEkwYYeLRhKadymSqS1IgcXLZrTgCqeGFoCbcj9PaGd4MiSlClbkYjMIMUdJrKK5qlCHjIiKzblAPERgIWZOPpdQvdWWGb6FYhi45LO8y7+wWtv+w8yCYoosmYyZV3Gq+8ep4gMVNQ8DB/olbEhvDDQlhkTPsrFTESMjLzljqcXER96zlxAH4RZzkRMCfDVVIlggIhEFf733A/Dptg9OnKc3j7JivAPDSttkyZ3OZrevzv7h0NWcOFIcx9cwfg0ajcUGuElkrzN5+usxCtTiond1Sp2wFtORUYNjouBuiCq2O7d0GtJmg9GVbnFV+M9wm8u5a4sdJojlQhQ72y0l8nJxdtlL38qgsHke4Vki+GmnTJ4gurzLC16eBW3DOoQNRJ3ZlN0dvRPY3Su7o4jGuatRKn2Miu++GRX3+Mjd9Dim1/yaYu+F/HW41OWnLmt2aTfItE8L1veOUnwi4eAxZ4MDLBZ3eU/1y8ulQZZhZHC8u3X2xjlRTLSHi2fTWYiifUHs24EYsTzBU96xo/UdRpzVZ0OIdSSm169uHmAnDWEUwVJ5XrZpjo4Bg3XfTDedkXbR3CwHWeOyIFlLrJlZj4G7a6yClD1cCvfEccU0DU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39850400004)(136003)(366004)(346002)(376002)(396003)(6916009)(31696002)(83380400001)(26005)(36756003)(316002)(8936002)(2906002)(16576012)(66946007)(16526019)(2616005)(956004)(186003)(66556008)(66476007)(38350700002)(5660300002)(52116002)(31686004)(38100700002)(8676002)(4326008)(6486002)(478600001)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?Windows-1252?Q?IXf85jgPWti83uwWkQ6gwV9wPvNgLQV9gBC8oVpe0QPmhEs6D/iJSi7E?=
 =?Windows-1252?Q?118o9cICQRrwlFXwK+/n6Y4BvLao+CzWAnILr3E5sdC89hu1aTCmsWgK?=
 =?Windows-1252?Q?agswUQv/lsGd7Rb3YRwhYzBosSCB0x4wVSlN5yX0mgHVr3/0X07sWbhX?=
 =?Windows-1252?Q?VgNUbBybO1VM2e2517xQ15sBsaIc1/z/AFZRyPTX8YJnLq0opB9RSMd6?=
 =?Windows-1252?Q?ZQKmKzmJbUwOgzaFrWM1jIy397QspogAFdIlYIr8m1tGE4Ta1/9M90rm?=
 =?Windows-1252?Q?okvn+78IYgR9hLBrHyZqdlWJn6rDUsa1pkrpR1eExEY1yIuNIJ06kp4k?=
 =?Windows-1252?Q?wu2GBTvXYNskZs2FStJhAEAl7i+hg9L236032jyPHIX6lKtHutocz2cj?=
 =?Windows-1252?Q?Sb/WUNENEcBiQf7tcHZLoQ2w97NoBw+CdbN5jyIdikq+54xAslKPIJGO?=
 =?Windows-1252?Q?4BqYfe0Lqsa+HUf+VBzpiBanqetoAJo+CmM7dG5mXCDGO3fnAnH840hM?=
 =?Windows-1252?Q?nCy5eHwM8WNDQoiFIsYBedjvvVJ7DyOAfoQLAziRdKAHEeBgQENR6WCI?=
 =?Windows-1252?Q?buj4QHPu+EmXkobkvdWrmLIfJN5na3i3xoV8vbP4KKckN4V16QWWRlNg?=
 =?Windows-1252?Q?ujAMJvjIGqTRjlOdMgZKlKguqHJlVv7tSBkHqPRSj0rJp21ZjetU4gS2?=
 =?Windows-1252?Q?5nAqlzhTdHayfBhGPHoUY+MdwMgs1qmcD9XzrVRxcBcdd6Ov0Vn3GL1d?=
 =?Windows-1252?Q?eP3/0Le6YlGDq8HiRfso5zgVulrcwoQmP/S7xTLG8ht0bgZZO1SwNqHV?=
 =?Windows-1252?Q?0vLLNyZAI77WI62Bz1vifX235iKxrQaaikii7d2VduxVKoE1uAy+/8N7?=
 =?Windows-1252?Q?nCAbJbhEbyRjlvnXsEkOxcIcyoMbEFhfKC4fnJPqO8yNFhGPYFE9tDyo?=
 =?Windows-1252?Q?fXT8cK9fUF8fhb68UQO7pmUxNOhCkUCN5b+dDOIZ9mLCSo53pgUTNyOx?=
 =?Windows-1252?Q?CXBH/vRHNfFUaQRaawXwAjj/6d51gi/czg3sZSX31tScXiDAb5C/gWkA?=
 =?Windows-1252?Q?bsJYYLi8HpTygqQssFcuuom7NeOEwDK85ForMOPcfOdFLtTzqi9mloFh?=
 =?Windows-1252?Q?sga68G2Z9xvl+Tvf3hmO/CdrcrXeuh0i0cMiqfromwKCuV/TuuK2HHtG?=
 =?Windows-1252?Q?kSHOE+uI3wC+gLmieMlYMZuJz86+PeC/7/PrNIzs3x+w9lfqdT4wvRXc?=
 =?Windows-1252?Q?Be4E97/vQ+AYCUJrUmGmZQAUIgqkUOBppKszSnzPEBYjstin/nphx4rS?=
 =?Windows-1252?Q?BbGDNfPD9/l1TAiS/I0TvCgMlqY4b3lPp3Yyvo+Bxhl+xuM72K8h5ehq?=
 =?Windows-1252?Q?0ylpYn0kJ3XH3567y1duM7SNp2vJUlXQ4E6a8ZHlymET/yJUC2+aa7pX?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 190c0c33-6919-4096-fdbf-08d90faf0bcf
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2021 10:17:54.2574 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IOu9qCQDM1yVE8mzDlBJWkuUxF6FWMkDAoKRWxZK1l5cK6oILJuOtXKu5FkDUjccQNRbwnQj8gbOxKRZ6hHHzi3xybFacnM+OKIrrCgZ/eE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3541
Received-SPF: pass client-ip=40.107.13.134;
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

05.05.2021 13:10, Stefan Hajnoczi wrote:
> On Thu, Apr 22, 2021 at 01:09:50AM +0300, Vladimir Sementsov-Ogievskiy wrote:
>> @@ -1981,8 +1985,15 @@ bdrv_co_write_req_prepare(BdrvChild *child, int64_t offset, int64_t bytes,
>>           } else {
>>               assert(child->perm & BLK_PERM_WRITE);
>>           }
>> -        return notifier_with_return_list_notify(&bs->before_write_notifiers,
>> -                                                req);
>> +        write_threshold = qatomic_read(&bs->write_threshold_offset);
>> +        if (write_threshold > 0 && offset + bytes > write_threshold) {
>> +            qapi_event_send_block_write_threshold(
>> +                bs->node_name,
>> +                offset + bytes - write_threshold,
>> +                write_threshold);
>> +            qatomic_set(&bs->write_threshold_offset, 0);
> 
> It's safer to reset the threshold before emitting the event. That way
> there is no race with the QMP client setting a new threshold via
> bdrv_write_threshold_is_set(). I guess the race is possible since
> qatomic is used and there is no lock.
> 
> I like the idea of dropping write notifiers:
> Acked-by: Stefan Hajnoczi <stefanha@redhat.com>
> 

Sorry, this is an outdated patch, I've sent a v2:

  [PATCH v2 0/9] block: refactor write threshold

-- 
Best regards,
Vladimir

