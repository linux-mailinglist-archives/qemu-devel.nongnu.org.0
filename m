Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B1AE3832CA
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 16:52:54 +0200 (CEST)
Received: from localhost ([::1]:41922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liec1-00047l-I6
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 10:52:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lieJh-0004mm-PC; Mon, 17 May 2021 10:33:57 -0400
Received: from mail-am6eur05on2091.outbound.protection.outlook.com
 ([40.107.22.91]:4923 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lieJe-0001vx-Oo; Mon, 17 May 2021 10:33:57 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lvx3mus4JLi4SdO+y9j7ky0o9Ph93De6h4O149Z6y01+Pc29FyAz8oTT4rvyszKMFoeqd6i7apE4MV4IDcfYCkuOpKjXo0RiMPL8iKpTj3Y+D8KZcjW02W+rV8axkiT4cZNsYN+S3XV1GZyAoQbe41AY4ZvbD8ydFRxC+fEbYtjpi2ZrlnW6/PZ2xRzRpXrckFD1qAE8V0V1zXGQ0EqFrMAQJhvXy15JVTUbstk0SO5Dt9xg+LdpLqHi6+jzXDPCq2ZQjDWc2rxUuTsa2Si3IpBiBh9X9d7hjgSkITL6TVBRQpKlo1VkDtGfSPkX/LkH6lv1AgpN38nvgoWYlmfP4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RT2HXkUDSxLxM1C6zWCYBCD06k4zfXXOiIq9RVTOXlE=;
 b=G0ED18bh1RlmQ8s8sFlADw6zuUJilGIsP/nMCNWCVyutcGCZGuqczoJj44kF0fIwp3z9emsrbyDayOOWQolLsGxEzZeDVhOvoRzAMN5XZ/BihsykDtIuTVJ/pF2TkvLPXMlzHsmWR6ZCLfkKjIftffnNNHRmYHC3FLQkziDofZDsLUUyfXT3wXsfIt4wM0oaGDA//The3wlS8BEaUfBISuFaJmJfR8mesgZ/JDbcgVK3iS5IzT6o+LN17y4ySzETLlgOLXlE5BFD2Ql8se9UE3ZmFMxa5ar8yMRAUOE00y5xFLLtF/RwHHam2Uqsd9KDBQ98CFMqoVZta/0yn/WMHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RT2HXkUDSxLxM1C6zWCYBCD06k4zfXXOiIq9RVTOXlE=;
 b=sf2ZYeXwf8Jo7tSaPPgAFTGgUU5WRTOpS7IWwd0J4kLvRqoI9mIHysbE6cL3tYMYHmTiLUnSTA/oDl5mztpyz8GpjuV1r3/tAIkfvZTYmpTdjMp8nx+Oc+T1grR3oLpSpZCsbrnewCVFCibrZvVO2bAprh8zKq9uYfl1lWNNqrY=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6357.eurprd08.prod.outlook.com (2603:10a6:20b:31b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Mon, 17 May
 2021 14:33:51 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4129.031; Mon, 17 May 2021
 14:33:51 +0000
Subject: Re: [PATCH 03/21] qdev-properties: PropertyInfo: add
 realized_set_allowed field
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 ehabkost@redhat.com, berrange@redhat.com, pbonzini@redhat.com,
 jsnow@redhat.com, kwolf@redhat.com, den@openvz.org
References: <20210517064428.16223-1-vsementsov@virtuozzo.com>
 <20210517064428.16223-5-vsementsov@virtuozzo.com>
 <0f0cd3e2-f098-dd45-7e57-0f58eb08ef96@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <4e328083-513f-6e72-1adb-7d32139a6107@virtuozzo.com>
Date: Mon, 17 May 2021 17:33:48 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
In-Reply-To: <0f0cd3e2-f098-dd45-7e57-0f58eb08ef96@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.231]
X-ClientProxiedBy: PR3P191CA0002.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:102:54::7) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.231) by
 PR3P191CA0002.EURP191.PROD.OUTLOOK.COM (2603:10a6:102:54::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4129.25 via Frontend Transport; Mon, 17 May 2021 14:33:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b8a49ce2-1b12-404d-87d3-08d91940ca22
X-MS-TrafficTypeDiagnostic: AS8PR08MB6357:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB635704030D817DA2E05EC758C12D9@AS8PR08MB6357.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZBJMsE1uV7/pXl5nObgWxD88gDqg9UQD2klUZ/ffywtSWTSfg4brn+5YnZsWQQGpYoqIYeEIaDfYHdN3/UbfDJv6B9ncdJNJXJcrAVQQPB6TTRV7Z0p0j8M3/wg6+MUNYgvEmVhXmCmSaPjTuBadMWi+0ghGv4NBY0/BCMu3gjTYO6WzFWQPWTvPmz3bOXSpAcmSFE+wvuQIZmTHLLWADj/0GtfVayDde4dwYXcRiYq1PL3DvWbnoGbHADKPNMguXcA9kNySwhZ3uL7XYZYRIxyt9EdgGsklyMXkTNw+lwL7sf2WrziuXv2nFXZ0K5EwuSI+YR89wkElj2rngfBt1WtRb2CKWh5BNe+R7aBfbjW0O+iYSKq3Q6rvXeK9jHdm9GBWtWxwcIdlinkmQ6TZjlsikXI1AAhk6H7QWQq8sCqUiV4R9hMyMq3Z8U+U94Cvj383IQWycw+umDMVawwjOpz9JDWwmjF8ULPh/1zOE+wfg35D2Fq55EdJ9gLG8ZdrUQH3VVMhzFgldcoj/0pVAl5EZga25dmqVxUFj6XrR6Fai1qvZ3OM2D9qsATIQZqDUiyyMOYfU/1OH7ac7JgY5IveCD89JXI2l4epVLs+Wlgy07P1MkX+mgNzrJjFInoFv8AyQQzCoKzA9iNUoxFKI5xYB8sdNxv8PGNifN9EX4iT93NIGm8/ykkRvmGfwjOyxjVRILjzPYIwtkqoLXKBuryZZzcnaqVr5nGG2MXsmYo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(346002)(396003)(39830400003)(366004)(66946007)(66476007)(66556008)(956004)(6486002)(316002)(26005)(7416002)(478600001)(186003)(2616005)(16526019)(107886003)(8676002)(16576012)(52116002)(4326008)(2906002)(8936002)(31686004)(36756003)(31696002)(86362001)(53546011)(5660300002)(83380400001)(38350700002)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RWxlWUloVGJyajlCWFF0VDRzV2lWcmtOeXFidTBaZS8yRWJBalNUeEdhS3N2?=
 =?utf-8?B?MjBDTnIrRndxcmV1NUFVNFlCRlEwRjdHcGRtcnlyMHpoeGs4RlFOSjR3S1ZE?=
 =?utf-8?B?NmZCTVdYN3lIRDcyOHlmNHF2UzhTM2tTUlZRTGxYUG94NkNRNFhTZGJ0QXFD?=
 =?utf-8?B?SzNIZHhOUnkxTGtteFhLOGxrYlNvbjBsaXJoMTlTWjBzYWxlL0JybEIzQ05L?=
 =?utf-8?B?Um5FR1hrTjBXdWdPbm1kTllMcFZKbkR6NlJlckJHdnNhQjhGZTNBcUs4bzFv?=
 =?utf-8?B?SThKUFRabjV2NWUwSGwzVE9maldnNFhRbFZ5T0w4S0xsVlprdGFGWFlSWGU3?=
 =?utf-8?B?d0xKT1ExS0FCK2docUhjbE9RbmRxZWFUUVh1MWxKVlVnY095ZEgwdklRVHR5?=
 =?utf-8?B?WnM0Ynp2TlFSWldWRjBNNGZTRHBrQXlzN2haUGw5MTVQaGxqdUdCTzVNSUJh?=
 =?utf-8?B?YUQ2WFVDOW5pL29jVWdRMHJsek04cVFKYldyYzZiU3BRQk04OFJSbWxFQkdS?=
 =?utf-8?B?QXJMTGxoN3RZWXJGTUovVC9keHplSmQxYnhNbGRycXVaZGY4ZWYyQ21ldXda?=
 =?utf-8?B?WW9vLzRMa3ZLYjRNcEFQN2l0VzhBWm1pZkplSURpeFZicUVPMkRvVmxYWUo4?=
 =?utf-8?B?aXNDbCtLNmhLVW5ST2Q2Vm54VUo5TGNEOC84QitodUN5NHlPSHBVbmJEQXZE?=
 =?utf-8?B?RTkxMDF2bFozV0haSUppM3g1allLaG9UNDRLT3dGVklJOHFHNUhXSVlPM2Rj?=
 =?utf-8?B?NGNGNnY3WkQyaGxPclo0c1I3OTVYYW53MTh2OGFmTFJPM2tNa3B1T2NHZkRS?=
 =?utf-8?B?RDI2Z1p5TTFlY2JjMExXcE5SNUIrYWlpVTQzSjFpOWdHVkg4WXMxSkVRaHlK?=
 =?utf-8?B?QVU2dmc2ZDBhL2twZDk3b0tMWlk4NmdJWS9pWUg2TktRdGRod29kQ0llK3pN?=
 =?utf-8?B?cTByWXc2M1RHdk5YcEtnSnJpVk9LZ0E1d2lseHJIcGJzZnR0RVQ0N1huTitR?=
 =?utf-8?B?Q2JQQ0ZzUDhFODFySzBNR2c3NWJVVEt2eE8xd2tsWFRyL2dDU3QwOUxKYmdk?=
 =?utf-8?B?TzZmN2FxWDl2SW5tNHU1aEkvL0xNdVJ0TDhObHM3Vjc0UTB6dk94Tm91YVlV?=
 =?utf-8?B?U1BvbWJiSzV5N2R3NXdIbHBacGV1ZHZVUTBnQzZPUUZwYWo4WXBLUVVKM2cv?=
 =?utf-8?B?YVZZTm9OS1RsZXBsYjFZYWxLdzd2MExYQU9zekJVWFBCRUIwQ3Nqenp4Q1RG?=
 =?utf-8?B?REpuOGhBM1g2YkdsNWp4VmxZRnRTNFBqa29MQnhHMUozdWdjN1hURFNpV25P?=
 =?utf-8?B?RldQd3c2dnZWZDN6ZktRZGcrRXl2NGttRVl0VjFZSTFYSEZYb0VpckJGK0M5?=
 =?utf-8?B?VWFSVk9UNlpZamR3c3l4SSs5WmM3K3VJaERQanNxZXJQUHcvWTB4RzFjeXBK?=
 =?utf-8?B?MWNnS2ljVWR2OGVYNmtkSENTSG1WZlUrUDBwWTZxdkxSbkFROEdYOHpBNWpE?=
 =?utf-8?B?ZkgvdWNPMFN0Q1lYTnJqMnBBRy9IOHJYa0RnMW5KVnJjTHZsSjhPRkgxa3BP?=
 =?utf-8?B?czhud2I3UFI3WlJJUVlzSEVseGV2MU9vVGZnNC9GZEdQTnAxcXk0NTFSMTY2?=
 =?utf-8?B?ZzlkTUJ2RkUrKzYwYkt0NzA5K29JUTdOMXhQU09ib3hlZkhqVFovNkplQ1hE?=
 =?utf-8?B?TWxZcTNvTS8wbWl2UE5MNm0wMTB4RFNKeGIyMU91bW9mR1RjWUJvaXp5UU9K?=
 =?utf-8?Q?v2/+HmSC3lqT2rTaRvgaSjS5CCgTA08q4Ozta0k?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8a49ce2-1b12-404d-87d3-08d91940ca22
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2021 14:33:51.0413 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zzViZ+5yA0rGgfxcJwgQOS4njw6Lj8u2hcGNu7k3tKs/DyGEsakCeRotNjttcNUwZfcTRRloSIkDynfJAPi+fqHh4iVM2351V24TRkoDz+A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6357
Received-SPF: pass client-ip=40.107.22.91;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
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

17.05.2021 15:40, Max Reitz wrote:
> On 17.05.21 08:44, Vladimir Sementsov-Ogievskiy wrote:
>> Add field, so property can declare support for setting the property
>> when device is realized. To be used in the following commit.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   include/hw/qdev-properties.h | 1 +
>>   hw/core/qdev-properties.c    | 6 +++---
>>   2 files changed, 4 insertions(+), 3 deletions(-)
> 
> Looks OK to me, although qdev isn’t my specialty.

Neither my :) Thanks for looking anyway!

> 
>> diff --git a/include/hw/qdev-properties.h b/include/hw/qdev-properties.h
>> index 0ef97d60ce..007e1f69f4 100644
>> --- a/include/hw/qdev-properties.h
>> +++ b/include/hw/qdev-properties.h
>> @@ -32,6 +32,7 @@ struct PropertyInfo {
>>       const char *name;
>>       const char *description;
>>       const QEnumLookup *enum_table;
>> +    bool realized_set_allowed;
> 
> I think a comment would be nice, though.
> 

Agree, will add.

> 
>>       int (*print)(Object *obj, Property *prop, char *dest, size_t len);
>>       void (*set_default_value)(ObjectProperty *op, const Property *prop);
>>       ObjectProperty *(*create)(ObjectClass *oc, const char *name,
>> diff --git a/hw/core/qdev-properties.c b/hw/core/qdev-properties.c
>> index 50f40949f5..c34aac6ebc 100644
>> --- a/hw/core/qdev-properties.c
>> +++ b/hw/core/qdev-properties.c
>> @@ -26,11 +26,11 @@ void qdev_prop_set_after_realize(DeviceState *dev, const char *name,
>>   /* returns: true if property is allowed to be set, false otherwise */
>>   static bool qdev_prop_allow_set(Object *obj, const char *name,
>> -                                Error **errp)
>> +                                const PropertyInfo *info, Error **errp)
>>   {
>>       DeviceState *dev = DEVICE(obj);
>> -    if (dev->realized) {
>> +    if (dev->realized && !info->realized_set_allowed) {
>>           qdev_prop_set_after_realize(dev, name, errp);
>>           return false;
>>       }
>> @@ -79,7 +79,7 @@ static void field_prop_set(Object *obj, Visitor *v, const char *name,
>>   {
>>       Property *prop = opaque;
>> -    if (!qdev_prop_allow_set(obj, name, errp)) {
>> +    if (!qdev_prop_allow_set(obj, name, prop->info, errp)) {
>>           return;
>>       }
>>
> 


-- 
Best regards,
Vladimir

