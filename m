Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0380D3B2961
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 09:34:51 +0200 (CEST)
Received: from localhost ([::1]:58416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwJsw-00025B-3R
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 03:34:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lwJri-0008RY-5S; Thu, 24 Jun 2021 03:33:34 -0400
Received: from mail-eopbgr140090.outbound.protection.outlook.com
 ([40.107.14.90]:50766 helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lwJrd-0002sH-75; Thu, 24 Jun 2021 03:33:32 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LNevx3lwyjVjpjfOJ3AfkQnBvsKeBatiiAl3RfCT08r0DSIRULCAAz2CL17PJ4REVb5Sp2hSEQqcmwHZiRK89i1Pyj8zsd0yqSvh8k6rb5NWQ5OqO5WvZgGpuJ/aA3o2yEors8Hr3HyXdg9UVVt/aCqjClMaUSpnDkd+X49A9PgWGxs7oZYtmxdosWFLAIEjGKAz/moSFyky1hMhqRTNeF1V4FxKBopWEJp2XA7sWbln9fzSHen/1uuYE+Jn2kKzPhPUXPyNe274xroHA8JwWMQBW86CxuEN5ksjw4rua8R9iGvCEGqJ/HXGZUPw6a//lAIrcfaT6oVsZMhSGZKD9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IZCY9Upr+wZ7ILDCB7dZuKDE6xVUapiuTkgrt5CmNOg=;
 b=OzSj88TWhIcFf9Mq5ogrjIhQJm7MdMfR8mv0bhq49lWs8zJJ4XxTpFz+MOrHoi7v3gCMLh1W3N7QegZ1N+RCdyak1o1PsrP/LHZFvvZch6pD+zlX1XpIwvGq0ZrnFMEc1t1YW7nP0R3xQcaH3/zaQTkdQWYMdcdkyWtueCwncI3G4xmQpj4Y9iWo8br0/N/TNG1yie9JxNt1Y0h9ZAsLlfipekLs+gok+0qCLS2ELG7s4hGOOcACQkn357lH2AzfskNsmaRCEOwwMzq5mK2TIS4EapBTwLf9tEbfEA3pXXTIgUwvjwK9q+hIegeSe/Hdiv1da02NAve5RXgBRoA1oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IZCY9Upr+wZ7ILDCB7dZuKDE6xVUapiuTkgrt5CmNOg=;
 b=IinBRC535NQ7t1jBBrD3gl32aC4/9FmmT2+tjieykvlQe7XEk7SexfWRTfkGmWNHHa+3Wt7502rI7dhN7w90DGhZDlqKSHreLXpfEd7kXcD3HR5c7qumiWrKrz1ZAmj3DiH8SE789tlkYo54efdaFXm5jVUioX5b07AUD02PzrM=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1714.eurprd08.prod.outlook.com (2603:10a6:203:3a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.20; Thu, 24 Jun
 2021 07:33:06 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955%6]) with mapi id 15.20.4264.020; Thu, 24 Jun 2021
 07:33:06 +0000
Subject: Re: [PATCH v4 1/7] file-posix: fix max_iov for /dev/sg devices
To: Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, kwolf@redhat.com
References: <20210608131634.423904-1-pbonzini@redhat.com>
 <20210608131634.423904-2-pbonzini@redhat.com>
 <c8fcf5db-fe39-a2f7-08a6-95ed29619704@virtuozzo.com>
 <370bcdef-15ae-f837-e5da-2293ca8f1342@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <20293f4b-2928-8bfd-c584-d4546eb7ba8e@virtuozzo.com>
Date: Thu, 24 Jun 2021 10:33:04 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <370bcdef-15ae-f837-e5da-2293ca8f1342@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.221]
X-ClientProxiedBy: FR2P281CA0009.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::19) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.221) by
 FR2P281CA0009.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:a::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.7 via Frontend Transport; Thu, 24 Jun 2021 07:33:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bf0a8edb-d7a4-48bb-c878-08d936e24ec6
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1714:
X-Microsoft-Antispam-PRVS: <AM5PR0801MB17140A13BFD07DD0C2BBDA60C1079@AM5PR0801MB1714.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: O/tE77zGQ+PJBxmlOUDNcJeG7NGq2m1HvohsZ09KYhFaQ17xqIPydZVQJFNifneseAIr9+S1fNizyshvQXyEMD/Gquj2F/2bOGRib0YtZtPY7GI8ZWKh5xoCQ5KkqmzQk/hX1ICPWwH32DC4TBTPfYbbJlQn4KunkAjrmm9kKLIof/N5V5StuFf9pEG26DG4PzJMqbGx4CsJPCVXHcEin+aea9jAn0seCwS06NAFqcX+sEfx4rNtQAXGFohKiPFIhxpq+X7HHfhOG1ipnYwTMS5nD6dfkBbu7YqJe0BxePGKEkuiXa4ovW9Vdc00dcADZ7CkJSAQG0LprwQZ9f8N9fpU1gkW3uqZHXs+g05doPdkyEu68oIKORlIL3xg1a1C24fiqf5lwhx4ykmHlouA6GoaUqZGhrdQBR8+Zpj91kVvA4sdXnxQO6h7n6vKfYAhE0ADQ3GFBP/3G9Mhnl0TkBVUo5ro7BuUPsAnv8tX/3HIRVf9oyEy7JA6fywky2X8UbU/nC43B2RxRQ/BY672zHlctOVcDHAAKwUjoDoK5Xj8Cc7AiAEY7xRF2SOiP4bcMzDypAUcDed+uLIvqAJPo4T1X3WCSNzcf6xdA76G9S7uHncsGZTDIXfHXn1c3V/BidNCfDZOm1fJ9p8IpzTPLV3zrTGfLwezklvEUWC2aC7W2ZvZFF6hsCV8IPmdzkOTTLgxctVjUZG6wAbJvHH18E7Xj1dBk5nzcjcG488Nh+HLJe9ttGZnJxlDMlH0iAKKXQcIFovWdUyQkHHa2fnbQw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(136003)(39830400003)(346002)(376002)(31696002)(83380400001)(66476007)(66556008)(53546011)(52116002)(6486002)(26005)(86362001)(31686004)(316002)(5660300002)(38100700002)(2616005)(38350700002)(956004)(4326008)(478600001)(8936002)(66946007)(110136005)(2906002)(36756003)(16526019)(16576012)(8676002)(186003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U1lMTE9tck01bHdVbTA2OFQvd3hJb2dCam9GTjNaZFNGREtxa3p4SnlTZDJr?=
 =?utf-8?B?UTk0c1B3MmpxbzFJRnZmQmJZNDFrWDhkT0MwNTVTRlJJSTErTTNURDdpT0FV?=
 =?utf-8?B?Z1lGYnVIM1NqWUVZa1pxOHUySENiL1kzWUJJUUkzUXFWVFlFRGRIa3I2bytG?=
 =?utf-8?B?YmxZam1qVGdML1daOTFoK1RxWTFsQ2UyczZJQytnbUltMHM4TGRVQTk2RTN2?=
 =?utf-8?B?WGdnRmtpM0RYMDh6TjBiUjROSnQvbTkvZ1l6czRIOHNTdlFtZlRjU2xLT0di?=
 =?utf-8?B?dDVVZllyUW82aWx3NUZCU3c3L1d5bVVrM3RlVnJKN0EzTkZkZUZpcklFOE1V?=
 =?utf-8?B?Q2daUDNkWm1sVUFJK2tNN3VoTm5oM2Y0bjFSYjJlOTA3amFMWEt4K2ZPcVZm?=
 =?utf-8?B?Ui92aHAvRkNCRmpObE9jNCs0cllqSFJ3MVhEWW92eGpIOUt1YnEwUU82Umx6?=
 =?utf-8?B?dTZjM2tJTWtRcEoza3ZiMnpvYlNZS1hKMzJadTJMOUhsQjA2YzVST3lVZFI0?=
 =?utf-8?B?NXN4ajE3YmJ4TUN2c1QzMFBMbElRVGMzRUNDN09IUmxwYzcwRzJCUWpmUTBi?=
 =?utf-8?B?d0Fra1dpaEw5OUxreHR2UVFoUlE0K0xsSStOSnZjc2VnQ3RxR2hYb2pBdEZY?=
 =?utf-8?B?Nmd3NDJiYUV2K0FhU3hZTWkxQU1Od3FwRWxjdFZCTCtkSXgvSEJENmh1a3ph?=
 =?utf-8?B?cTg5RDNVdmhIU0x5aTdMbm45cjhZdGxZUEZCRHFoMXE5eVY0MFd0SzZzcGlj?=
 =?utf-8?B?VkFncFZMMVRGdCs1eUhGS0FGeEw1WTdYY3FwTjAwTUNwZ3F1WFNQVTR4ZWFX?=
 =?utf-8?B?cDcwd2JKWHFYaHBlOFJKTzdmSUFKZEdMZ01ab0I1cHFsaFZjbUlwa1BCZU1x?=
 =?utf-8?B?T29WQ3M5cldLdC9VSGZtK01sR1QzWjViV2RZRHJ3bEtLeElvRGZvTSt6UGt2?=
 =?utf-8?B?bVhEYVZtZ0dKMnlFODVFVTMzRWticm1lQkxIalhBWCtMaGRQT3orNHB1ZGVq?=
 =?utf-8?B?VjArcWxwbEdGZjY2eVNUNUgzYTZVdmRHTnBYV3k0RGF6eVlRbkVyZGw1MHFl?=
 =?utf-8?B?cVpPNStPZlU2QkxJdWtURmN5SHRmZUpQNjZVQjc2N0Q5dlp2TENkRUlTdEFp?=
 =?utf-8?B?MWJhTlc3R0hWWDMzcEo0RHMzMVMvUCs1QWpTc1VBcmhVNjNXZTdtaHV5Tm02?=
 =?utf-8?B?eWJqcmRXaHJqSSs1dFpTeE9ybXg5QmZkUjdLaldwYk1pTm1qeU1wRndLTjlG?=
 =?utf-8?B?ODZDSXFMdDdkRCtzODdKUjZGd1NxWVl3cmYxQ1B4eG9uZzdtY3BhdEI5WmFR?=
 =?utf-8?B?V3VwbW4zRHJJMktBbmhBUFVqOTNxRDRTNEpWQlczNk1ENGhJc1JXQWNIZW4r?=
 =?utf-8?B?dkloaEVhZWFVYmJHWFl3UHRjVjBiM0E5dzlSeEhmWlZTdG5xaDkwNUYvdnpF?=
 =?utf-8?B?VEdCZmRLVEVoWUdoQ3lBd1NRTlNOLzZ1VnFQOG5RWVpYRStPQTl6eENzYmRj?=
 =?utf-8?B?V25yVURhT0FXUm1wVXlIMFVwV1BKbE9temg0WVdwb3dGZ2hYSzJSQWRDWWpq?=
 =?utf-8?B?emsxM2RnVk9zcVdjK0VMQ0tNK1hIdGV4U05WTXZ5dGhpalNSMWwybFo4NDZi?=
 =?utf-8?B?b3g5eStXMEFDN29nQTd6ZEpaZ2VnUzMxR2pFRWNIc2RJSER3VE1Nd1RmOEgz?=
 =?utf-8?B?U3dhemc5em4yeGxXR1FGc1ZiZG93Tlo3NEZLZVRDMHFwd1hXdFE3SjNiYkVt?=
 =?utf-8?Q?lrbVVDQx69YYeiKb1a7xGUUqHcQB0BtRnvjMnnx?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf0a8edb-d7a4-48bb-c878-08d936e24ec6
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2021 07:33:06.3447 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m6A8kXFYZTsoQsEeJfuSNDYx3TbYFJtYtYzGISFuwVMOve2QoKm1180gsa6/GXq3O80KZ4MI5ZMEyvbKMMqcI7Q8ZYoLfRq2eQhniMah1Kg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1714
Received-SPF: pass client-ip=40.107.14.90;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-VE1-obe.outbound.protection.outlook.com
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

23.06.2021 18:42, Max Reitz wrote:
> On 08.06.21 21:14, Vladimir Sementsov-Ogievskiy wrote:
>> 08.06.2021 16:16, Paolo Bonzini wrote:
>>> Even though it was only called for devices that have bs->sg set (which
>>> must be character devices), sg_get_max_segments looked at /sys/dev/block
>>> which only works for block devices.
>>>
>>> On Linux the sg driver has its own way to provide the maximum number of
>>> iovecs in a scatter/gather list, so add support for it.  The block device
>>> path is kept because it will be reinstated in the next patches.
>>>
>>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>>> ---
>>>   block/file-posix.c | 11 +++++++++++
>>>   1 file changed, 11 insertions(+)
>>>
>>> diff --git a/block/file-posix.c b/block/file-posix.c
>>> index f37dfc10b3..536998a1d6 100644
>>> --- a/block/file-posix.c
>>> +++ b/block/file-posix.c
>>> @@ -1180,6 +1180,17 @@ static int sg_get_max_segments(int fd)
>>>           goto out;
>>>       }
>>>   +    if (S_ISCHR(st.st_mode)) {
>>
>> Why not check "if (bs->sg) {" instead? It seems to be more consistent with issuing SG_ ioctl. Or what I miss?
> 
> I dismissed this in v3, because I didn’t understand why you’d raise this point.  The function is called sg_*(), and it’s only called if bs->sg is true anyway.  So clearly we can use SG_ ioctls, because the whole function is intended only for SG devices anyway.
> 
> This time, I looked forward, and perhaps starting at patch 4 I can understand where you’re coming from, because then the function is used for host devices in general.
> 
> So now I don’t particularly mind.  I think it’s still clear that if there’s a host device here that’s a character device, then that’s going to be an SG device, so I don’t really have a preference between S_ISCHR() and bs->sg.
> 

If I understand all correctly:

In this patch we don't need neither S_ISCHR nor bs->sg check: they both must pass for sg devices. Starting from patch 4 we'll need here if (bs->sg) check.

> 
>>> +        if (ioctl(fd, SG_GET_SG_TABLESIZE, &ret) == 0) {
>>> +            return ret;
>>> +        }
>>> +        return -ENOTSUP;
>>> +    }
>>> +
>>> +    if (!S_ISBLK(st.st_mode)) {
>>> +        return -ENOTSUP;
>>> +    }
>>> +
>>>       sysfspath = g_strdup_printf("/sys/dev/block/%u:%u/queue/max_segments",
>>>                                   major(st.st_rdev), minor(st.st_rdev));
>>>       sysfd = open(sysfspath, O_RDONLY);
>>>
>>
>>
> 


-- 
Best regards,
Vladimir

