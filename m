Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C6462DC128
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 14:25:08 +0100 (CET)
Received: from localhost ([::1]:36726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpWnj-0007Aq-3T
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 08:25:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kpWlb-0006OL-1u; Wed, 16 Dec 2020 08:22:55 -0500
Received: from mail-eopbgr70134.outbound.protection.outlook.com
 ([40.107.7.134]:1446 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kpWlX-0006TM-DZ; Wed, 16 Dec 2020 08:22:54 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XYTsEAFQLu3IY36rTvsq0BY9/21psmaxtScSkieIvoUlimT4DPzOCV/wf//uBJ/0kc90FlREwXBoAVsum0IZUrKvsTMRn6mSTggJA8xNOJvkE0YjIK5OHHatuj4JmF1wkbB4Mr8oKCxzTdFVK/O/SB7hr0XMhDhxZircTPf9wLETuxKigqMjo1rca4R34FWxHmDs3TtmNLG/OKOM/4466BYYaHhUSV2R+erwKdz4gSNHZBc9E0DaZc8H+mk7C8hH9zcealZ7N18avfqx3cfICjLDPiWqjadpY5dW55frMgYvGCf8RXFIOPbbhygniG+6rI5TI2AS/K17H9OwmE4woA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pZ6fm2mRiWbNm3MvsdtkRTYQ5QTHTTqee83mb37oFho=;
 b=icpm0ma8oLer5CQRie6GpNwbEPRxl6GyYYmJXwpXcPESNGNKtST8yE+MxLmoiPy6q0awMRm+oEyYtL/zlsbhG8RkhpipMTy2dmUvarUH9pDNyt+ALIQ4zsE3F+nG6Mxqf39CdlD9ps6Dn/aeW+0Pv1xZoX487Dwh5hmGdak9M+iVhsLJzX+ngmeci9IDjETOqguE+uJJInJh/arLUiNOL0qJDKVMIZnaDAy4Ntd26ofix6+jStc5FrDAteXA6BA7iEs27+/gW1J4+5nYzCG3bSWSU+qU8b2Pn+qbOMYhJNpIEyJPGsBKBRKsZWpqdCHl//FWenqu7jiWvgzPCqAzSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pZ6fm2mRiWbNm3MvsdtkRTYQ5QTHTTqee83mb37oFho=;
 b=EAkBnJSJbEmQcqKf4LVLsDl3pblE/YCH9iq2wR01prJTJQLed7Ma98IWROsTGI0psO1bo6ojiNCH7qB96WeDq1K/hJYf6tRK/+rvFyvK7yHH+FCK1TPYDBD1GK5J2ia8JEJfcI7NzQOv6T/AHGqXh3+VfKAh6wm8+0zx9fgXSc8=
Authentication-Results: smartx.com; dkim=none (message not signed)
 header.d=none;smartx.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB5080.eurprd08.prod.outlook.com (2603:10a6:20b:e2::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.19; Wed, 16 Dec
 2020 13:22:48 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478%4]) with mapi id 15.20.3654.024; Wed, 16 Dec 2020
 13:22:47 +0000
Subject: Re: [PATCH v5] file-posix: detect the lock using the real file
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <1608029636-31442-1-git-send-email-fengli@smartx.com>
 <05c96a12-b343-fec4-4060-7110bb0850d0@virtuozzo.com>
 <20201216094959.GC189795@redhat.com>
 <e719c240-a232-c017-73e9-45dbcda619fd@virtuozzo.com>
 <20201216104122.GE189795@redhat.com>
 <b87bc8a5-0635-aa2e-9aa1-4b5c67ca65e5@virtuozzo.com>
 <20201216125723.GH189795@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <830a519e-ac53-2b9b-f2cb-47209b62c187@virtuozzo.com>
Date: Wed, 16 Dec 2020 16:22:41 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
In-Reply-To: <20201216125723.GH189795@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.92]
X-ClientProxiedBy: FR2P281CA0029.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::16) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.92) by
 FR2P281CA0029.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:14::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3676.12 via Frontend Transport; Wed, 16 Dec 2020 13:22:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 24ac4f6e-3939-4ecf-0625-08d8a1c5ae69
X-MS-TrafficTypeDiagnostic: AM6PR08MB5080:
X-Microsoft-Antispam-PRVS: <AM6PR08MB5080AB3B98F4C9566730DD52C1C50@AM6PR08MB5080.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VFSG9M3ERJcpUf6TZFvmhLBfvnMc1CyFWPyqt57D1l3aO78uN/4tQwCFSS7Lb4wFVgi/nN34kIzYKuD/9MgDw21yAc4Jvy0OffE17rhSn2r9HzNUMi3NoLQB8kE6MgSG5KtMYxBgCul1pYUHpyH1VC2QQeerdwdOboUhKFm9G6keTxBDxS0EXXOiePJrhVJaOol4gAKKtdac6XxJVjt/gNejXmQDQ1Jx1lxYSpAXRksLR/szBNcINTKv05owQHiiraaX+ujTaRKQSf+dJUIS7vRi+1UZS8gGO8Kq1t818fEjNDjiAfi3SfhTaU26yfuwDn6bGMpTWoLkEK3mYKmseUNbvNczfJ7Tkg2cKJNV2Wsx7/+XpH2TAF5+xFFsGruLhHX9Ot4v0lCBUhaBCayAWjJzUr55W9s4ziOcryuziZ8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(376002)(396003)(366004)(39840400004)(316002)(16526019)(54906003)(16576012)(26005)(66556008)(66476007)(2616005)(6666004)(478600001)(186003)(8936002)(83380400001)(5660300002)(66946007)(8676002)(6486002)(52116002)(31686004)(31696002)(956004)(86362001)(36756003)(4326008)(6916009)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?clZCZHdkQWRYaHU4ME44dktpMXBrcTdWSHB6TjJJUnFINWZWSTFaZDFHd2sy?=
 =?utf-8?B?UnBPVitCa1JRaDZ1QXVpWTVTV1ZpbTBtN3UyZnRRRko4SDJPSmcyMkdBTVhI?=
 =?utf-8?B?REFXSjZxdE1PZnQ5WDNOb2hFc3VwY2V1cSt0enI0SWVCdjdnb2d6V2ZLaFBs?=
 =?utf-8?B?V1RYNURVQ2JreWxkL3cwTXJsbG1TUUxEdjBOLzRIWk5qVGpGSTlQeEZYME1S?=
 =?utf-8?B?N1dFRnJNcW1NVlVVUGxQbVRSWW1zNnVFWFNMekFFdjU2dUtCRmwyYVpwY2hM?=
 =?utf-8?B?aHRpLzRZSkRWLzUvQ0dBQnhsTjM3R2NrZTRyYjBhWmhNRkhwSjBuUS9HSVN4?=
 =?utf-8?B?U2lBbXBWdklJVlBJVVBwQkR2RmlocVRHY2FLZXRETjIrVFpkT244ak5oeUdT?=
 =?utf-8?B?elBjTVl2cndSOE1pUEJFZ09tVlo1T3pPdG5aNDhoWFpNYlc3eWtWcjVhbTVN?=
 =?utf-8?B?enNRVTY0K3c2ajZnRm9SZEk1VFRRRk9sckZXZUkwT2R0bUhVRitZVlBueTNh?=
 =?utf-8?B?eklJV3BYbHFuancwTzlQWTJiRFB6bjcrZ016MmJBcGNRbTcvVVFEdytPT1Ro?=
 =?utf-8?B?bWo0dHgyTW9keXRvdlovRVZDZDdBOC9hblcxaVZaVTFzcENGbVhKMlA3ZmVB?=
 =?utf-8?B?b3o1L2hvcDcyUXJ2Z0xhYXJ6ZVJnTDJUWnE2ZXRPWTA3dnkyNEw0R1VQQm0z?=
 =?utf-8?B?b3paeGFpY29ueEdKQk1oTDlsQ2h6VXhBSWE1VitlNkYvNzFna2I2TGJKaTlS?=
 =?utf-8?B?cXlqZTBSR3grZFh1QjNDMi9RMnl4V1B2bGRmWWtHeSs2VWdhMWwvcCtkeXA1?=
 =?utf-8?B?eXFvN296SDhxRDExUG5oTjZoWnd1VXNoTzRuaWpLRU4yM3duZUhoL3ZaUTFL?=
 =?utf-8?B?aE5BSUxRTHpOL3NSd2RHdDFpclR3NFlJclpVamo2US9YUUZWUmo2WUhLbzYr?=
 =?utf-8?B?OW9UOVUxVFhqVmQ1bWpFTHdvY3lIbzJNeUlWZTZMK1djSTJ6eWI1eFJaVG8z?=
 =?utf-8?B?b0Iyd1pWT1dkd2dkZWxjaUFEaXZOSnZFUkFqUFVGOTN5N0JoVWQ2ZkI4cXVM?=
 =?utf-8?B?MGlBbCtYN3JRZHRzSHdDZEM5bGIwZ1FKcTNOUmJmclljNkovN0c3eVRBeG4y?=
 =?utf-8?B?RERYUlJwYko1UGN3c29IQzM4UTBBS25HUTNPTW54RytlV3YrcGYvYUhsYW1L?=
 =?utf-8?B?UG5uSGxsa2JReFpPRE1lZUJCSEJuNGVGbDNvSU1CM2oveWJmdDZWWjhpKysz?=
 =?utf-8?B?REl6VExpelVtbFppSG1zTHlDUmxWdDFNU0RNNFRBR0F1THpkdkp4YnJ5VWhw?=
 =?utf-8?Q?X6hEKHCSA/Ok89ql192cQWoPC+Pjjnl7E2?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2020 13:22:47.9304 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: 24ac4f6e-3939-4ecf-0625-08d8a1c5ae69
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OOLj2upIGi4mZ5Vqp6aFVyvmvWM5CSBkmZNVTZNTJNFkKndIIaz5kpWyJTMDFyJ0iKiyrlzgzYR/vPBV6nWDBKEcmYYZZlYZAhKHTXkk9Ko=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5080
Received-SPF: pass client-ip=40.107.7.134;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, lifeng1519@gmail.com,
 "open list:raw" <qemu-block@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Max Reitz <mreitz@redhat.com>, Li Feng <fengli@smartx.com>, kyle@smartx.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

16.12.2020 15:57, Daniel P. Berrangé wrote:
> On Wed, Dec 16, 2020 at 03:03:08PM +0300, Vladimir Sementsov-Ogievskiy wrote:
>> 16.12.2020 13:41, Daniel P. Berrangé wrote:
>>> On Wed, Dec 16, 2020 at 01:25:36PM +0300, Vladimir Sementsov-Ogievskiy wrote:
>>>> 16.12.2020 12:49, Daniel P. Berrangé wrote:
>>>>> On Wed, Dec 16, 2020 at 11:22:38AM +0300, Vladimir Sementsov-Ogievskiy wrote:
>>>>>> 15.12.2020 13:53, Li Feng wrote:
>>>>>>> This patch addresses this issue:
>>>>>>> When accessing a volume on an NFS filesystem without supporting the file lock,
>>>>>>> tools, like qemu-img, will complain "Failed to lock byte 100".
>>>>>>>
>>>>>>> In the original code, the qemu_has_ofd_lock will test the lock on the
>>>>>>> "/dev/null" pseudo-file. Actually, the file.locking is per-drive property,
>>>>>>> which depends on the underlay filesystem.
>>>>>>>
>>>>>>> In this patch, add a new 'qemu_has_file_lock' to detect whether the
>>>>>>> file supports the file lock. And disable the lock when the underlay file
>>>>>>> system doesn't support locks.
>>>>>>>
> 
> 
>>>>>>> diff --git a/util/osdep.c b/util/osdep.c
>>>>>>> index 66d01b9160..dee1f076da 100644
>>>>>>> --- a/util/osdep.c
>>>>>>> +++ b/util/osdep.c
>>>>>>> @@ -225,6 +225,20 @@ static void qemu_probe_lock_ops(void)
>>>>>>>          }
>>>>>>>      }
>>>>>>> +bool qemu_has_file_lock(int fd)
>>>>>>> +{
>>>>>>> +    int ret;
>>>>>>> +    struct flock fl = {
>>>>>>> +        .l_whence = SEEK_SET,
>>>>>>> +        .l_start  = 0,
>>>>>>> +        .l_len    = 0,
>>>>>>> +        .l_type   = F_WRLCK,
>>>>>>> +    };
>>>>>>> +
>>>>>>> +    ret = fcntl(fd, F_GETLK, &fl);
>>>>>>
>>>>>> I think we need
>>>>>>
>>>>>>        qemu_probe_lock_ops();
>>>>>>        ret = fcntl(fd, fcntl_op_getlk, &fl);
>>>>>>
>>>>>> pattern instead, like in qemu_lock_fd_test(). Otherwise, what we check may differ with what we are going to use.
>>>>>
>>>>> No, we explicitly do *not* want that.  This function is *only*
>>>>> about checking whether traditional fcntl locks work or not on
>>>>> this specific file handle.
>>>>
>>>> Hmm, than may be name the function qemu_has_posix_lock(), to stress that fact? All other qemu*lock*(fd) API functions do rely on fcnt_op_getlk/fcntl_op_setlk and work with lock type determined by qemu_probe_lock_ops().
>>>>
>>>>>
>>>>> Support for OFD locks is a separate check, and its result
>>>>> applies system wide.
>>>>>
>>>>
>>>> Still, I don't follow, why should we check posix lock, when we are
>>>> going to use ofd locks. What if OFD locks are supported by kernel,
>>>> but specific file-system supports posix lock, but not ofd? Than
>>>> we'll fail the same way as described in commit message and the
>>>> patch doesn't help. Or what I miss?
>>>
>>> That's not a scenario that exists. OFD locks are implemented by the
>>> kernel in the generic VFS layer, so apply to all filesystems. The
>>> filesystems merely have to support traditiaonl fcntl locks, and then
>>> they get OFD for free.
>>>
>>> IOW, there are two separate questions the code needs answers to
>>>
>>>    1. Does this specific filesystem support locking
>>>    2. Does the operating system support OFD locking
>>>
>>> The problem in the commit message is because the original code was asking
>>> question 2 only and geting the correct answer that the OS supports OFD.
>>> The image was stored on a filesystem, however, that does not support fnctl
>>> locks at all and hence locking failed. This failure would happen regardless
>>> of whether OFD or traditional fcntl locks were used.
>>>
>>> The problem is solved by also asking the first question before enabling
>>> use of locks.
>>>
>>
>> OK, thanks for explanation. Sorry, I was not attentive to previous versions, but I remember that something about this was discussed, so probably you explain this thing not the first time;( Hmm, still, what's wrong with checking fs by OFD lock trying? It will fail anyway? Or, it will NOT fail, because OFD knows that there is no locks, and will not ask filesystem driver and we will fail only later, when try to set the lock? If so, it worth a comment in file-posix.c.. As it looks like a design flaw of OFD locks.
> 
> We want to cache the OFD result check so we don't have to repeat the
> probe every time. If we check OFD per-FS it makes caching much more
> complex than it needs to be.
> 

So, to not check OFD per fd, we check posix locks, and use the knowledge that OFD rely on posix locks anyway? I don't see why is it simpler..

I don't suggest to modify qemu_probe_lock_ops(). It chose ofd or posix locks (and set fcntl_op_getlk) system wide on first call, and it's OK.

I just don't see, why can't we use chosen fcntl_op_getlk to do per-fd check for lock-supporting introduced in this patch. If for some reason using fcntl_op_getlk will result in false-positive, it worth a comment.

-- 
Best regards,
Vladimir

