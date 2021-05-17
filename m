Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5726383C1E
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 20:21:10 +0200 (CEST)
Received: from localhost ([::1]:34306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lihrZ-0004jh-UP
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 14:21:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lihgL-0001Tw-1W; Mon, 17 May 2021 14:09:34 -0400
Received: from mail-db8eur05on2099.outbound.protection.outlook.com
 ([40.107.20.99]:38240 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lihgI-0002AT-SL; Mon, 17 May 2021 14:09:32 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lxzXmSqlPJjZI0b+aOTQiFUiPnUjNu3n28T7Ur9eAUXriNfF8eHdNpFCGU6L7wAB1D3MU9kGPYyhYSDZLNn39mgC+2XJgQtTCsSwWL3z+rF+bx2pFNoDXavZgRpawZ5+5v4BKGRMeTDMf2Ks+u1rSGel/lZFfnU9hm1C31UFaDDuPdq/vq6D2UwWaipknrTjgiHlCgQWuA7shvmCEoiBvY99vYl6CJHR08zkGARDhDgMOim9dLdm31xQD0IMevES1RnIbz/sZYtkOzfFM+6R3s/z2PF6EA0ilQ96MzDif0bvQmWtkLoxOOH34Ddf7yzFYRl1JKIJXU+oImneCv86Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V+isGFPgOJroASqPybMEJK3xDbtWIbBGR6VNexgZ7GQ=;
 b=c0SoIixOaZquq5hmpPjLprh2YAkkWW+ZZY2M/SWGL8bsdSaijo2mhdZ9rYyrc8H+8vNfA1Xa8gorzQgXo+PnEiZF1BGGSKKK2x4AeiIjWKqzylkOiaEvoosihDNAf7XBP5vnkJuhPVAAxZhJuiAE1E/3gBMjYUaCOMKctc2VjSAxO4jCbGoE5cOjgY/2W9BatgWLTCDc9ClAgj6mk01mk+4La4IZWsVaeYhHNsRw6IQtoD+niQW9OQXov5XiHeBZCOPkG0vwJ+gUbcQ0EVczG70uNhXtzHL26zKkSIwyRtZIJjIo3ox164e9JSNTzkFvYCjyljdCWezx1lbV1vSpxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V+isGFPgOJroASqPybMEJK3xDbtWIbBGR6VNexgZ7GQ=;
 b=FbaVRuXA9THrVaVpteEReV1r2h48Ru9vo0Wh4wU5Tlt6Qe2pdOy7vY2YCYWzfzfCZzbs+h5kKWz0J3MqrjW+8FRUGOWART+8rg/epV0ExFJxodmltkea6NaHVBaR2IAgfiblXiDEnhzyFYtDI3LfoYqoWOH8rrXR+bRV8yJRgjo=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3383.eurprd08.prod.outlook.com (2603:10a6:20b:50::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.28; Mon, 17 May
 2021 18:09:28 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4129.031; Mon, 17 May 2021
 18:09:28 +0000
Subject: Re: [PATCH 04/21] qdev: allow setting drive property for realized
 device
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 ehabkost@redhat.com, berrange@redhat.com, pbonzini@redhat.com,
 jsnow@redhat.com, kwolf@redhat.com, den@openvz.org
References: <20210517064428.16223-1-vsementsov@virtuozzo.com>
 <20210517064428.16223-6-vsementsov@virtuozzo.com>
 <90135147-4b08-3af2-cfde-aaa3dd397c17@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <c0c45ac4-46a1-bf33-f563-634a7fd5670a@virtuozzo.com>
Date: Mon, 17 May 2021 21:09:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
In-Reply-To: <90135147-4b08-3af2-cfde-aaa3dd397c17@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.231]
X-ClientProxiedBy: PR3P193CA0019.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:102:50::24) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.231) by
 PR3P193CA0019.EURP193.PROD.OUTLOOK.COM (2603:10a6:102:50::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.25 via Frontend Transport; Mon, 17 May 2021 18:09:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4f27df19-95fe-4922-567f-08d9195ee938
X-MS-TrafficTypeDiagnostic: AM6PR08MB3383:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB33834B2290F4898DB8F55DEEC12D9@AM6PR08MB3383.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pNvoh0xwANHCAuAm7QBnSA8Qx1DLfDdZsnsnYgHQikByTAD5IpZrfT1u2dTPLpEkxV2A+WvoWwiebGN05jk6X4+/k8sT7dPXbB8rCWrLOO+3vK/MUI5h/1v3liWQdK0JnqKmYRYQzyX4dHRIQqgOyoa7tpYcHzS+twkrw1ElrE07HzQeXVwRexm9R56KXxW9qPXugokrQHiFLXuwZLQOeTDdJ+LbZleLPatECec39goEX/lpd5WX/uPDi8Xtsc0u2Sj5avYgAVwKFedxoz6hMjUcMtFh+Q7+lL8HZKiKQu760Rsjc5Dew8uwy+/CS8fVHilgKMpjnkAQLA3JYxiBN4vJWtILkETBrvnT9dIgwQVzBLJcB42AjciE0kGrJiH/bYdcfVV04Rj541Oom/Xk/uCx6O4H03n7y/1aXgLTTvcK/jJiTzmk6APYUJNU6gUbr41d4fPY2p8tmMTkmZxYospHN4TdOU2KJ+QWftuFjOxrWPx8vcHROcfxfimeRydxO0VBRQOfhq/t/b7EtgLKlyGmjbkspHgrfUVq6eOQvb+kO1WRVs03YJRQvEB8quSHHhB7WY2CvJPspFoW/+8QIW2sA5r7B9sc9gySd1gvHANHhYh6ibX60yTESNyU2kEPeBDdTOTmogvfLvEwOxrCtV/hDuNb6SVXgTkXrO9MiFuW2tt9SHOhq0mpvO1EFs38zbAolcQ4pvg5elXyGNtT6MIfyiqohGiKPvCqFiPiQ54=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39830400003)(136003)(346002)(396003)(376002)(36756003)(6486002)(2616005)(66556008)(31696002)(956004)(478600001)(107886003)(66476007)(38350700002)(83380400001)(38100700002)(26005)(16526019)(66946007)(31686004)(16576012)(316002)(186003)(5660300002)(52116002)(4326008)(2906002)(8676002)(53546011)(86362001)(8936002)(7416002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bDdwMnBFV0gzMEZaSUphUUwwVjY1d2htbkpIUFN5aWJiNXBINUpIVms3QlN1?=
 =?utf-8?B?Y25MRGFNQXAraVFrODRIaXU1RUFhaFYxNm9UdVI5WDRjMklVTGIyNDFuV2pR?=
 =?utf-8?B?cVBxdG1PY3J1YkR4SFRwVjVGN0RxRW9nUjhKZWtyeHErOXBXMGcxOXRBYjg1?=
 =?utf-8?B?NlRSWDJCK3cvaW5jVXlwUG5DM0xraVFLQW5KeHNCWWkyZURFblRhdE1wQUFJ?=
 =?utf-8?B?MXdqNG9pRWJvdURkbzVnK21WQ3c2clgwRUJrSlFXU1JDUnN2c0pLcU9GNGVq?=
 =?utf-8?B?SWhhcmd6MDlRL2EwWi9QMWVyNlZNcWxHZ1BPYkxYQklKNWhSV0ZUTzUwM3NG?=
 =?utf-8?B?QXpsYVhYbXBYdFJYQmFMWUpGa1BRRS9NR1c5RzVvN1RkNVNQOU94OWh3Z0dT?=
 =?utf-8?B?NnhkLzJzUFFBOTNzVXJlSlU2SkpEclJhS1c1WVVHK1BLeDJidEp1ZU1iVFZk?=
 =?utf-8?B?S3MwQURSUmlsMVhQd1lyZFFHOVZSUmlreTExanBqbnZwdm5ZaGYySkVXUkxi?=
 =?utf-8?B?SUhGdlVHMEFNUy9VclZNRndOZTJ0Rms4VkpsMWN6RzROakEvaWxERkpvZGlR?=
 =?utf-8?B?VmFQWkF4Z1liY1JpMUo4SSsrdXZLMTFzOGtmYlJickpmS1BEaFBJeGZBTi91?=
 =?utf-8?B?alU2TWZ2NElpK005Z2hDQVJFL3dwMkZFUDlKMjNUVHVtSlFOVi9iREVMVk5s?=
 =?utf-8?B?SnV0RlhBZ1NTQnFvNUw0QUxWcFBqd3A2b255SVZXZGFaMDBzdlU5Q3JoVlJK?=
 =?utf-8?B?ajRiK2QwemFrbE9URGRNK05iK1BPQjZOVjIrKytxRkpqV1N3NUl5bHZVQnl1?=
 =?utf-8?B?RVAzK2hpTkwrUEdSY3lpaW5TdXhZSjlhZlZkVkNvUU5iQ3d0QkQyU2RjMGx4?=
 =?utf-8?B?N2xibk9yd01kZ1FsSlB1Zmo1UWt3VFZrTG5McEkzM2pNbnRMNjZ2bkZsQ0M4?=
 =?utf-8?B?VlZTQUlBaE9RbUVaa0c5TWlJTDVkN21WdHZXTjQ3T0ZtQWpZeDBGamxqQjh1?=
 =?utf-8?B?clFSblFXTU9MZGgzWGs4aVZGL1dUZE5DVGt0cXRwNWNyRFEvbGJXRDJjWVlR?=
 =?utf-8?B?cXEvQW8vTm8vc3FLU2JsUVRNZHdUWmNDWUt1NDNaQlR0eURBNExUdWo3THhp?=
 =?utf-8?B?U3JIN1dDTU1ucDhEZFFMbm05aWltTzl1ZmI3ZzR0dE03QjNFQ2ZXMjIrdFJr?=
 =?utf-8?B?UzNRT2hOUWRSM2NSZnozMEh3SVA2Z0lMU0JEVjZDSjJubGpFckE4VXlEOXc3?=
 =?utf-8?B?aWFicmg4NDBiejAwOERSbWwvK0ExUGNSRUhBU0tFcFVWa01EMHJ3K0FCMWVK?=
 =?utf-8?B?WGpISXg0aFMrb29hZnFZN2VRVXMvOWhLVXZ6RDBUK2RPZGRDZEV5b1NITDlp?=
 =?utf-8?B?WlVIa1R3QWhNdVpmTDBpazY0UjE0b1ZWR2oyZDgxejNmbGdDelVwQmI3SWxI?=
 =?utf-8?B?V2JKZlBoOXBtZFRNdW5TNXAvOGxZRi9pTWlXNmg2bG1peUNad09POXAwaFdq?=
 =?utf-8?B?ZGNqWEEzRi9WZlVQZzVUblBqbkhmOVB2V05PREtwWGRTbnJRQlpueHNEanFa?=
 =?utf-8?B?QXB5TkduS1lsa2NXZ1pFOXpzbmpnQjdQV0NHVVhZKzJ6SmtnQTN2ZXZXVURp?=
 =?utf-8?B?ZWE2UFp0RFc2QkQ5UGhFQmxRS3hzcjBoY1B1RFhPM0plWENnM3lFN0N5R24y?=
 =?utf-8?B?dzFDaFowZHl5SzJFMzZCNUM2bHU0cUliWi94bGJjQXZJVGFoalE3VFBNNXhU?=
 =?utf-8?Q?zk+jqERXu+yWP87fft1Nwtlu+nMlknDy8mBzonp?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f27df19-95fe-4922-567f-08d9195ee938
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2021 18:09:28.1224 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1MXKAsLSRlfJA8mKGNy3GovE/wazeUiZ/Shy1VpB7DF7dfjF+NxWQwLesEwHMIGkVjqMAJgcHwjpBeKUC78qNKYe1yCimNNskOQpksSna78=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3383
Received-SPF: pass client-ip=40.107.20.99;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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

17.05.2021 18:48, Max Reitz wrote:
> On 17.05.21 08:44, Vladimir Sementsov-Ogievskiy wrote:
>> We need an ability to insert filters above top block node, attached to
>> block device. It can't be achieved with blockdev-reopen command. So, we
>> want do it with help of qom-set.
>>
>> Intended usage:
>>
>> 1. blockdev-add, creating the filter, which child is at top node A,
>>     attached to some guest block device.
> 
> Is a “not” missing here, i.e. “not attached to any guest block device”?  I would have thought one would create a filtered tree that is not in use by any frontend, so that the filter need not take any permissions.

node A is attached.

So, we have [blk] --root->  [A}

And want to insert a filter between blk and A.

We do

1.

[filter] --file--\
                  v
[blk] --root-->  [A]

2.

[blk] --root--> [filer] --file--> [A]

> 
>> 2. qom-set, to change bs attached to root blk from original node to
>>     newly create filter.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   hw/core/qdev-properties-system.c | 30 ++++++++++++++++++++++--------
>>   1 file changed, 22 insertions(+), 8 deletions(-)
> 
> Looks good, just one question: (well, two, one was above)
> 
>> diff --git a/hw/core/qdev-properties-system.c b/hw/core/qdev-properties-system.c
>> index 2760c21f11..7d97562654 100644
>> --- a/hw/core/qdev-properties-system.c
>> +++ b/hw/core/qdev-properties-system.c
> 
> [...]
> 
>> @@ -196,6 +209,7 @@ static void release_drive(Object *obj, const char *name, void *opaque)
>>   const PropertyInfo qdev_prop_drive = {
>>       .name  = "str",
>>       .description = "Node name or ID of a block device to use as a backend",
>> +    .realized_set_allowed = true,
>>       .get   = get_drive,
>>       .set   = set_drive,
>>       .release = release_drive,
> 
> Why not for qdev_prop_drive_iothread?
> 

Hmm, the only reason is that I missed that part of architecture around here, I'm new to qdev code. Will add with next version


-- 
Best regards,
Vladimir

