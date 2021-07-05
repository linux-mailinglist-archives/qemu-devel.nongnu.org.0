Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 610153BB87A
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 09:57:28 +0200 (CEST)
Received: from localhost ([::1]:45544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0JTr-0001z7-Fe
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 03:57:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m0JSX-0000RS-Ph; Mon, 05 Jul 2021 03:56:05 -0400
Received: from mail-he1eur04on0710.outbound.protection.outlook.com
 ([2a01:111:f400:fe0d::710]:40161
 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m0JSR-0006Uv-UR; Mon, 05 Jul 2021 03:56:04 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i+g+J1QOTMpbVJFQ/izG3XmL3/yqHZ5V5faXSyOgOqRwseAOSbPLO+sfCNgtXn8Bajsv1LZu7ApZEv9Fe7/sIeB+4Vf5jnNc+omr0a0L3HRM0dFNfpYqOeLd38fX5Wx5R9oA3FBjzPcmiZRQPXNmzMAEu4fgKNMmJrbm4WNkEyXL0s1lagXfliYqmQmkYnsoqwS50+5jUCyYyHC1EYezmr7sTJ3bHR6FBS7agC71gkVwE4ur6XIpbUw5J+iBl+QBq1qXeGtNN8lGsP19StmuyFU5CITQtuH56ggaPry9RLXHVYgyalRHgwvatiy9iq0dQ9vKxmIdki9YbhDNdTNuHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=twaREgH8uWlnM+PeWl0WtmxtsL4HEYnuQdmywYfoKWc=;
 b=kPsTltXWybg90heqF4djFGrcFc/HJtGzq+UqPATDNZ8D6Ssd+0em1ZXyypYwj669Rqy4mxQbGA4k42TlcXnj2LdCtOM9mq3vIIXfFloTvn4qYkuWQRSrLIbBDTUMroZOVsF640FBlOn53RBnOdzksh2w1TQyAEFntNlKVl5Eav+2BNuf75vX8oAlX+sK/N1ABr15ugerq1f1PYOI8HWcsSFwJAdQyxfTVcZPfxru2+Ctogy/rk/uGOy0tBdhs2fRFkR3hh4hPXa455FH62HTToNZxKef3V+cr//OGiSLzJEWanYMUPAjvhu2WC4smFh24dj4Xfk9D8b67zbPUwzmpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=twaREgH8uWlnM+PeWl0WtmxtsL4HEYnuQdmywYfoKWc=;
 b=LbNZ2bibP4IqYIqGV4U8rAy4DIw/5EtDpitA948f6Vlbk9IR9seO9xWiGQAWCCTcrOQPgtSN6zC//P9amePwXlajP+0X89EobKA2P1CHW3d6+CMfUG8XWYyGHBtmBuYfDTebzp0ut6NYlfzZ9o2hMXwU4wCOKjoq1FRUbNFGTwg=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6584.eurprd08.prod.outlook.com (2603:10a6:20b:33c::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.31; Mon, 5 Jul
 2021 07:55:55 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955%6]) with mapi id 15.20.4264.026; Mon, 5 Jul 2021
 07:55:55 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v2] docs: document file-posix locking protocol
To: Nir Soffer <nsoffer@redhat.com>
Cc: qemu-block <qemu-block@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Eric Blake <eblake@redhat.com>,
 den@openvz.org, Daniel Berrange <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
References: <20210703135033.835344-1-vsementsov@virtuozzo.com>
 <CAMRbyysqP+by8PrF7WQD4D2R7GXLwya4L1GMm8V8oHPS3AyJjw@mail.gmail.com>
Message-ID: <712bc1ec-8048-8d65-6328-7270ad121c66@virtuozzo.com>
Date: Mon, 5 Jul 2021 10:55:52 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <CAMRbyysqP+by8PrF7WQD4D2R7GXLwya4L1GMm8V8oHPS3AyJjw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.215]
X-ClientProxiedBy: PR0P264CA0072.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1d::36) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.215) by
 PR0P264CA0072.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1d::36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.22 via Frontend Transport; Mon, 5 Jul 2021 07:55:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 988d841a-d058-45aa-3438-08d93f8a511b
X-MS-TrafficTypeDiagnostic: AS8PR08MB6584:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6584C021F736E30A5C990784C11C9@AS8PR08MB6584.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1hFkdyvDcUF2XIUxD6sNDYI9LytjysgUzJ0nAt2LM5aysO5uEefi0K9bWKxWfKmgeDsQrrDzb+/EnkmlFP1jDsBZITuoAvnJbXzHLm66BOvL17IR0HMW9aOMz6PTXGILKtPVoEVpFkxSvrdI9RlwocU8jLOLqNUbAMV8AtL/sfIMYDt8R8jy+PBnMboKEknz/TvX6OQ1ndlWNygS0ipzO7lUehd4sU3MsL4k00pe6IGXsVc9ZU2iDtq+00yKZ0o7YoDNwOGmK7aoKCPgKmh3o69nL/W3KOwdd7sEAKHDPkY50hgmSp3jfs6XLeAs9sa05ti5K8He6KitDZYqu0RMzJvCSsAEgwQ/tshP57GRTfsLTjsVzwXkE5tG41shMgrpImNYfClxYTKXOLaJzoG9RkyL033ItGJHjreAsTfUgfuUx9ipOh8yxkkO75D5GlS8tFLZd0J7mTrEHX7PxsrolmVPNobaZOE4O77QLV4PVW4jQeMu4BL5UhzTpVeGE5t+OV4+cBmsA8ULQP/YCmMWy2SP+4FxnOleDRzZbp0t9IPfv5GpImtgWGLfUT5/I3HGB03YyfNQHKOSpcJ2rWu7QOyQv4lmxhYyT3m0YFA33NE24STuaD/qBYvRv5gK7bx1Ae6LW62Z/wy4xzq308MLEbdLOveC0j2FbReOQglyiFI+Es7RicGAICi1cMGwNwT8rSaEpapIxkGVJ0eOtXPUNjT23lIoLQGdXkXbScfXKzhy8ISnLyKzTc3ualG/E06/
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(346002)(396003)(366004)(39830400003)(36756003)(2906002)(54906003)(16576012)(316002)(38100700002)(83380400001)(4326008)(31686004)(38350700002)(86362001)(52116002)(5660300002)(31696002)(66556008)(956004)(8936002)(6486002)(6916009)(53546011)(8676002)(66476007)(478600001)(66946007)(186003)(16526019)(26005)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MFJjQ29TUFFWR0pueDVxQkxvajMzbG5vK3ZXa2NsMjdJNVRnbWdYWWVRQnZB?=
 =?utf-8?B?REJkdkMrczEzdkxNSVR4VHVYdDJ4Ulh0eW5BYWY5aml6NHhBZHgxWENpbHBz?=
 =?utf-8?B?RDhXYWlobk9YdElUWHp4WitBdXlJT3ZOZ1Mwd2hKcXJaeTF0c0hXbzh2UmhY?=
 =?utf-8?B?MWFtSmJWay9YSXNqdm1ZbTdHSFBhWDhYdy9TREZVNUpDblMvdEtzK3JMNFhH?=
 =?utf-8?B?eTdSeDBmd21vK29VcDRYaDNQZE40a1h1Z3dPaC84YURIRTJ6R2dSTDE1a1l3?=
 =?utf-8?B?RzFKRlVMdEVYWDNGYXhFckswRkh0cmZWQnFuQTVydlVSYi9mKzZWSXgzSHI3?=
 =?utf-8?B?cHFOTTFpS281YUp6Y2ZuQUFYWkg3VU5Cc0NNc2J6VkxucC9pL2FlRFRGR29u?=
 =?utf-8?B?WUoxT04xSHF2K3AzQllVck0rbnNkM013cm9FMWlTNXVoRGt5SFY3WE5GUWNH?=
 =?utf-8?B?clZrZTFVcnBaa0hOZ3hpMVZpUjJjQ0N5eUROMmRSVlBuejRocWdyYnIwNWlJ?=
 =?utf-8?B?b2p1dWFObXRZR21yUnA2Znl3MlFoMEl4RHA4YmoxWDk5bkxrVGRHeVBoelo4?=
 =?utf-8?B?MlFDWWJ3T1dSTE9YVGh5Q1pGaUFxVnhiZVdDVWlBdmlLYmxEKytwOThyZWJr?=
 =?utf-8?B?V2xnKzNCSVZGMHpGWGpndTJLNmoyaFdRcGVEVDVGQkl6ekJsTHdmNUdLNTFW?=
 =?utf-8?B?a2ZLME9vVllsSlo5dThpMjZSK2RmT21zOVVGZHVWTWp5ajEyVHFqZU81WFM5?=
 =?utf-8?B?bVZGUndoSXV1UmhWbklIdGpJbzk2b3VjVzlCTjZ3aU5YOCthQkd1Qm9FL1p2?=
 =?utf-8?B?RlA5c05ldkVtTjIyUGdTQVBULzVpazUyR2pPcVZDOEovK1J0WnRkM1dzVmMy?=
 =?utf-8?B?WGxOU2tuZ3BXZDVrQlBYZFdTQ2l3NVRHOThUeU5BcFQ1TkVmRDVuWTFaUmYy?=
 =?utf-8?B?eGlvWFBpZzRFejJrMnBBbk1vWXlFdnErb0Q0MUl2WmlPdk1qOEVTNUk3SER5?=
 =?utf-8?B?WEFPeERhNjMxTkNNOXhPYlFiQU4yWGl0dVlFQzFCM1p3d1Fua3dnRmoyN3Av?=
 =?utf-8?B?MnZZbGJXRVZCVTZDVGdoaEU4WDM1SjBKNlN0SWR5QlZiM0t0MmtHZkZlQnVh?=
 =?utf-8?B?SGRvaHFKV1VXOFhxMlBjYm9oWmFiQ3Fqc2FxekVlQ3dqT3JOR0NJd2JmazdC?=
 =?utf-8?B?VjRsQzFCanprRHB4dVRBOTkrSytjS2gvKytVd2ZldXg0RHRQbHJCQXhneW9t?=
 =?utf-8?B?U1pnbndXajhUUTkvaW5tOG5KNFBzaHN0NFoxckM4S2NwUEhoT0wwVHpOTWhZ?=
 =?utf-8?B?aG5pNEwrb3luZzFzNlRnTVZQRU9HcTNiV0NsK1dYeGlZaUl1UVV0Z3A3S3lY?=
 =?utf-8?B?VE9sMnRHb09aMDQ5bG5YaExVTlBqaFRybDlnM0JsMmVrRnBNeXVKdDU0OFVp?=
 =?utf-8?B?WVR2aUN4SXBXcXUzNmEyb1JKMkFrOWRJUGt4d05XYXVLUDd3R25xdE9tejZE?=
 =?utf-8?B?Mnl4c1B2UWxNeTYzcGFRU3gxVW4yYmJ1SU1RbENUZVJLSWZDMXNDa3NJK0ts?=
 =?utf-8?B?MWlRdXR6OUkrTS9QRUtFMFBVNmcrSnZsa0w5WktLbzdKSU1aYjZmcVV0Ry94?=
 =?utf-8?B?RUI2aVJnN0pxRVUweXF0dTFGbUJ4eVFxTnhZeXdkdGtLaHZkOFpRMUFEN2lz?=
 =?utf-8?B?UXlyUXBhalhpZlJYMUxKcHVoMG9ieFNlcU1CRHZLUTVYU05Wc1RmRnlXWTZp?=
 =?utf-8?Q?vU4M8UezLbmgvZlxw7c9g2l0kla3Ss7R7ASS7B2?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 988d841a-d058-45aa-3438-08d93f8a511b
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2021 07:55:54.9893 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LFCPegT+PJ9Ll4Ku9FbjIScGyfayXFMXQjuzn0hm3rz4O7CtzTKM0UR90PCc0EeQmkGxA+vRsMyudZpJ/80m5NmpQdIfS1rkhqavxh5mWj4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6584
Received-SPF: pass client-ip=2a01:111:f400:fe0d::710;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

03.07.2021 17:50, Nir Soffer wrote:
> On Sat, Jul 3, 2021 at 4:51 PM Vladimir Sementsov-Ogievskiy
> <vsementsov@virtuozzo.com> wrote:
>>
>> Let's document how we use file locks in file-posix driver, to allow
>> external programs to "communicate" in this way with Qemu.
> 
> This makes the locking implementation public, so qemu can never change
> it without breaking external programs. I'm not sure this is an issue since
> even now qemu cannot change without breaking compatibility with older
> qemu versions.

Yes, that's my thought too. I think, that's enough to say that we actually have "public" protocol, just undocumented.

Note, that breaking that compatibility may break shared migration, and migration without one host (which may be used for live upgrade of qemu).

> 
> Maybe a better way to integrate with external programs is to provide
> a library/tool to perform locking?
> 
> For example we can have tool like:
> 
>     qemu-img lock [how] image command
> 
> This example will take the lock specified by "how" on image while "command"
> is running.

Having a parallel process, that takes locks "for us" is a pain. At least we should handle unexpected death of that process. Some filesystems may not allow opening file in two processes in some circumstances. And it just breaks normal operation with file locks: lock should be taken by the process that use it.

Library has GPL limitation of use.

> 
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>
>> v2: improve some descriptions
>>      add examples
>>      add notice about old bad POSIX file locks
>>
>>   docs/system/qemu-block-drivers.rst.inc | 186 +++++++++++++++++++++++++
>>   1 file changed, 186 insertions(+)
>>
>> diff --git a/docs/system/qemu-block-drivers.rst.inc b/docs/system/qemu-block-drivers.rst.inc
>> index 16225710eb..74fb71600d 100644
>> --- a/docs/system/qemu-block-drivers.rst.inc
>> +++ b/docs/system/qemu-block-drivers.rst.inc
>> @@ -909,3 +909,189 @@ some additional tasks, hooking io requests.
>>     .. option:: prealloc-size
>>
>>       How much to preallocate (in bytes), default 128M.
>> +
>> +Image locking protocol
>> +~~~~~~~~~~~~~~~~~~~~~~
>> +
>> +QEMU holds rd locks and never rw locks. Instead, GETLK fcntl is used with F_WRLCK
>> +to handle permissions as described below.
>> +QEMU process may rd-lock the following bytes of the image with corresponding
>> +meaning:
>> +
>> +Permission bytes. If permission byte is rd-locked, it means that some process
>> +uses corresponding permission on that file.
>> +
>> +Byte    Operation
>> +100     read
>> +          Lock holder can read
>> +101     write
>> +          Lock holder can write
>> +102     write-unchanged
>> +          Lock holder can write same data if it sure, that this write doesn't
>> +          break concurrent readers. This is mostly used internally in Qemu
>> +          and it wouldn't be good idea to exploit it somehow.
>> +103     resize
>> +          Lock holder can resize the file. "write" permission is also required
>> +          for resizing, so lock byte 103 only if you also lock byte 101.
>> +104     graph-mod
>> +          Undefined. QEMU may sometimes locks this byte, but external programs
>> +          should not. QEMU will stop locking this byte in future
>> +
>> +Unshare bytes. If permission byte is rd-locked, it means that some process
>> +does not allow the others use corresponding options on that file.
>> +
>> +Byte    Operation
>> +200     read
>> +          Lock holder don't allow read operation to other processes.
>> +201     write
>> +          Lock holder don't allow write operation to other processes. This
>> +          still allows others to do write-uncahnged operations. Better not
>> +          exploit outside of Qemu.
>> +202     write-unchanged
>> +          Lock holder don't allow write-unchanged operation to other processes.
>> +203     resize
>> +          Lock holder don't allow resizing the file by other processes.
>> +204     graph-mod
>> +          Undefined. QEMU may sometimes locks this byte, but external programs
>> +          should not. QEMU will stop locking this byte in future
>> +
>> +Handling the permissions works as follows: assume we want to open the file to do
>> +some operations and in the same time want to disallow some operation to other
>> +processes. So, we want to lock some of the bytes described above. We operate as
>> +follows:
>> +
>> +1. rd-lock all needed bytes, both "permission" bytes and "unshare" bytes.
>> +
>> +2. For each "unshare" byte we rd-locked, do GETLK that "tries" to wr-lock
>> +corresponding "permission" byte. So, we check is there any other process that
>> +uses the permission we want to unshare. If it exists we fail.
>> +
>> +3. For each "permission" byte we rd-locked, do GETLK that "tries" to wr-lock
>> +corresponding "unshare" byte. So, we check is there any other process that
>> +unshares the permission we want to have. If it exists we fail.
>> +
>> +Important notice: Qemu may fallback to POSIX file locks only if OFD locks
>> +unavailable. Other programs should behave similarly: use POSIX file locks
>> +only if OFD locks unavailable and if you are OK with drawbacks of POSIX
>> +file locks (for example, they are lost on close() of any file descriptor
>> +for that file).
> 
> Worth an example.
> 
>> +
>> +Image locking examples
>> +~~~~~~~~~~~~~~~~~~~~~~
>> +
>> +Read-only, allow others to write
>> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>> +
>> +So, we want to read and don't care what other users do with the image. We only
>> +need to lock byte 100. Operation is as follows:
>> +
>> +1. rd-lock byte 100
>> +
>> +.. highlight:: c
>> +
>> +    struct flock fl = {
>> +        .l_whence = SEEK_SET,
>> +        .l_start  = 100,
>> +        .l_len    = 1,
>> +        .l_type   = F_RDLCK,
>> +    };
>> +    ret = fcntl(fd, F_OFD_SETLK, &fl);
>> +    if (ret == -1) {
>> +        /* Error */
>> +    }
>> +
>> +2. try wr-lock byte 200, to check that no one is against our read access
>> +
>> +.. highlight:: c
>> +
>> +    struct flock fl = {
>> +        .l_whence = SEEK_SET,
>> +        .l_start  = 200,
>> +        .l_len    = 1,
>> +        .l_type   = F_WRLCK,
>> +    };
>> +    ret = fcntl(fd, F_OFD_GETLK, &fl);
>> +    if (ret != -1 && fl.l_type == F_UNLCK) {
>> +        /*
>> +         * We are lucky, nobody against. So, now we have RO access
>> +         * that we want.
>> +         */
>> +    } else {
>> +        /* Error, or RO access is blocked by someone. We don't have access */
>> +    }
>> +
>> +3. Now we can operate read the data.
>> +
>> +4. When finished, release the lock:
>> +
>> +.. highlight:: c
>> +
>> +    struct flock fl = {
>> +        .l_whence = SEEK_SET,
>> +        .l_start  = 100,
>> +        .l_len    = 1,
>> +        .l_type   = F_UNLCK,
>> +    };
>> +    ret = fcntl(fd, F_OFD_SETLK, &fl);
>> +
>> +RW, allow others to read only
>> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>> +
>> +We want to read and write, and don't want others to modify the image.
>> +So, let's lock bytes 100, 101, 201. Operation is as follows:
>> +
>> +1. rd-lock bytes 100 (read), 101 (write), 201 (don't allow others to write)
>> +
>> +.. highlight:: c
>> +
>> +    for byte in (100, 101, 201) {
> 
> Using python syntax here is a little bit confusing.
> 
>> +        struct flock fl = {
>> +            .l_whence = SEEK_SET,
>> +            .l_start  = byte,
>> +            .l_len    = 1,
>> +            .l_type   = F_RDLCK,
>> +        };
>> +        ret = fcntl(fd, F_OFD_SETLK, &fl);
>> +        if (ret == -1) {
>> +            /* Error */
>> +        }
>> +    }
>> +
>> +2. try wr-lock bytes 200 (to check that no one is against our read access),
>> +   201 (no one against our write access), 101 (there are no writers currently)
>> +
>> +.. highlight:: c
>> +
>> +    for byte in (200, 201, 101) {
>> +        struct flock fl = {
>> +            .l_whence = SEEK_SET,
>> +            .l_start  = byte,
>> +            .l_len    = 1,
>> +            .l_type   = F_WRLCK,
>> +        };
>> +        ret = fcntl(fd, F_OFD_GETLK, &fl);
>> +        if (ret != -1 && fl.l_type == F_UNLCK) {
>> +            /* We are lucky, nobody against. */
>> +        } else {
>> +            /*
>> +             * Error, or feature we want is blocked by someone.
>> +             * We don't have access.
>> +             */
>> +        }
>> +    }
>> +
>> +3. Now we can read and write.
>> +
>> +4. When finished, release locks:
>> +
>> +.. highlight:: c
>> +
>> +    for byte in (100, 101, 201) {
>> +        struct flock fl = {
>> +            .l_whence = SEEK_SET,
>> +            .l_start  = byte,
>> +            .l_len    = 1,
>> +            .l_type   = F_UNLCK,
>> +        };
>> +        fcntl(fd, F_OFD_SETLK, &fl);
>> +    }
>> --
>> 2.29.2
> 
> Having this is great even if the locking protocol is not made public.
> 
> Nir
> 


-- 
Best regards,
Vladimir

