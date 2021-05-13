Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C870937F654
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 13:04:56 +0200 (CEST)
Received: from localhost ([::1]:56104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lh99D-0002ua-U5
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 07:04:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lh96i-0000Fb-0f; Thu, 13 May 2021 07:02:22 -0400
Received: from mail-vi1eur05on2097.outbound.protection.outlook.com
 ([40.107.21.97]:15905 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lh96c-00033B-8t; Thu, 13 May 2021 07:02:19 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ii3x11UjTRnOtFiFPtajdPjYQI6v3MpMiSTU2Ej73oQiVlszejhyffPaO8AvtFmN0LJNygJ+faBoJU+E4KRZc1yKCw1rgiR5V5+aPJLN49YvbNT18nn57yls4JC6TIcCgxh7acrFSOHgnRC0U55x994aRssNv58jWA5mWzNhKh3o89lr60ZbyOko1VXmjoTt24DYVnyQQSB4cdATpfsHtClDG2M+fIoLSTBK+pjSCA8RnocArTi00D2oTxvvX/lNVWXiCDEzkW8b8i9gV0kSLage0QBLypy17cjUwv2kcwOIjQljpjg9BRVHzJQdmEOZt1oPV4J/aQjWRL0lQd3cJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NAjuEzpJzOMOw1PohEsOUMiFpPvql8VoaWRvyXaOqIw=;
 b=i/QcjTCdx2GsKS1fUsEU/HLxUPJ8vd339RxEeV3cb2WwdNDoU2RWqiEyCmTNYX96zUZSUH27Q/sbzV9iTEerSsOVLloLeoTwsP35bCb2H4XYrPfjn38UUgW4jELtks7D9URLTQrJHbqlfNrqA4kAD6JcNW4eTxVAz16l505Tm4eMUy7NBVcKM13ENRik4HRE7PNnpr5VSS1hRxnbxQ6utqXz8xFteCPBa89rkw5biQP48lavJDpihqRcoeQmvuhidZupJrNbOPcc9wotN21mIeB0HxcNqcHjdrrYywSsvWSe1fFAa0ZCE1VEZVtPDDqV4L6KmABaIWMNhCoXmOg/Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NAjuEzpJzOMOw1PohEsOUMiFpPvql8VoaWRvyXaOqIw=;
 b=leWRL6Hff7B9D/5gPitHNQrIT/Gf9rsFukirvT9Ow5NXBPFabNxNeaMU4K0jZsU7GX2lTPqysXzV44FYciYEh58HG/51/wA2xVyZr71jbRU1oMuF83GI1WOx5/8WAzhQjQ/HIMpCcveD1OzwjG5x7DsXS9b1pbCVzaejLFjJ94o=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1969.eurprd08.prod.outlook.com (2603:10a6:203:4c::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.26; Thu, 13 May
 2021 11:02:10 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4129.026; Thu, 13 May 2021
 11:02:10 +0000
Subject: Re: [PATCH v3 21/33] qemu-socket: pass monitor link to socket_get_fd
 directly
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Roman Kagan <rvkagan@yandex-team.ru>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, eblake@redhat.com, mreitz@redhat.com,
 kwolf@redhat.com, den@openvz.org, Gerd Hoffmann <kraxel@redhat.com>
References: <20210416080911.83197-1-vsementsov@virtuozzo.com>
 <20210416080911.83197-22-vsementsov@virtuozzo.com>
 <YH1OuUYuLYkHY2ni@redhat.com> <YJuic4P8LxL2K3SQ@rvkaganb.lan>
 <YJunGNZSSBVq236l@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <bc2b0ee9-2221-e687-de85-ac91300edc74@virtuozzo.com>
Date: Thu, 13 May 2021 14:02:08 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
In-Reply-To: <YJunGNZSSBVq236l@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.219]
X-ClientProxiedBy: PR2P264CA0023.FRAP264.PROD.OUTLOOK.COM (2603:10a6:101::35)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.219) by
 PR2P264CA0023.FRAP264.PROD.OUTLOOK.COM (2603:10a6:101::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4129.25 via Frontend Transport; Thu, 13 May 2021 11:02:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 30507057-e0fc-4afc-5040-08d915fe8e2c
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1969:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB196990D6E9537BCA6C380B57C1519@AM5PR0801MB1969.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1923;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8RvVWREqSY/67XLug41dje0Nnif51ToYc2KUCNR/wb3B+LlRlvI2Z6iieDJnF6s74AlvxKLIQDrP1omsiV7+6NopSRLGOKgWN4WKvhKj1tVfIr/4WM5QaUJ3+8XDe9w9YyiMM2fWff33dFcq+c1suhqgbdiMy1nBODgM6tFH5tAN6W1kcRZgYuEjpuVwXzRmSz1Ja1OiXWRGfhV4/rCrx+0n/QBcE73mIHA0Q41mkSbebK1l3h6xFBUYGEtGS0cnuEFpccaVMxAJDBbcNXjFXxJVGFz//YM6cGJhrw9fI8T8N+d0FsqusMtce5lrRNzJRtFjl2xAaxcc96IZfYlgytBagRiG1rYcu7XLzpybnx2LT1WS33A7vGfUTCBickiGsmSHI1BfFJXFLeSzbwRVrajGsh94gZ8QfN45LYvHTzexKA9Xus2R48ysRmi5tOOESXr7C+uOAQ+wDy8w1sSH+s1/zXmT9eGILAhjQf0Zb88bAZ4jVKAT2pEdHwzdl+nE1dJWPUwpHuJE7MmHx0l25fAXXhaoHmFPS9iBMMBDIMgirwcDP8fc8X3XV7V+kYbf85fOPxbPqpsTLKFkptF57n8PmanhmGJBah+3H/V6RuupfoI+WuX+3Zr21wc8icImunpLU3A8O9jEwzYvwFifuC+vfqfkfHKdz/FWijYKYT9RdhB8Z8djdSmyLpagbXk9Uccpj0iVtZES6uVHkfqaGiL24L01F976D/B0d4ur/RU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(346002)(39850400004)(366004)(376002)(8676002)(36756003)(6486002)(26005)(83380400001)(8936002)(52116002)(478600001)(86362001)(31696002)(66946007)(31686004)(2906002)(38100700002)(38350700002)(956004)(110136005)(66556008)(66476007)(316002)(5660300002)(16526019)(186003)(2616005)(16576012)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?alVwQUNqRVpCYTlWUVNPQ2V1V0JSa2w3dDNsaDJBVU15WnRQT3B6anUrakhI?=
 =?utf-8?B?TlltYUFldDZEZHVJYUlKcHMzS2J4T3ZDSklTb1ltVFZENXV3QmFWaCt1OGhD?=
 =?utf-8?B?aktNU29MWkk1WUhFQ2RIV3Z2N2ZrTzhVdHlLZnYwdE1sUUVNdGJsLzNTcTZy?=
 =?utf-8?B?a3ptcWhlby9hRGlpVFhJNEpjMHlIbTJySTljYnVmelNRN3ZaKytjSzhhYWpZ?=
 =?utf-8?B?VGZnODlEa041dWVjVExVU25FYzR3akx1NmhwR3ZPa3I2TnhRaTNKYjB5bE1R?=
 =?utf-8?B?NHNVekxkV041WDlkd1R3ZVE2Y2xvbnpyb2I1cmo4ZEFyQm9QVUxGcHJwWVhX?=
 =?utf-8?B?OTNyaE8vRTFJa0RjVW1ucDJ0NEtLWitVSjhLcnp5bXE4VUtIcXFiOUZwQlJC?=
 =?utf-8?B?REZ2MnJSMEhKenlYZjZUUVJKZkJrOFNxK0tWR280c2JQZHpkL3Jrck9oQndS?=
 =?utf-8?B?NitLNVBZcUJXL0t1eDZnUENydENvbFBMMXFtaDVjQkRiTUN2U1dYRGJ1RVVS?=
 =?utf-8?B?RUlkZU9VOE14Qkp1Zm1TRzJuaVMwWFppbWh3eEp5bCt4TXNON1RHbDBIYkRS?=
 =?utf-8?B?S2dpeER5bHZwQkxoS0U5NFN0MTVUNUNTRzg5T3JSMnFqZyt0Y2R4NlA1cUdX?=
 =?utf-8?B?OUs0bFRoMEd2eExkUDBjcUpsejVDRkdlVUI1Y2NxYXR2cGE0d1JMRDlBUC9D?=
 =?utf-8?B?MDh5RjN1SjJIbUp1MkpyQ3lQUG5QLzgyVGRQdDUzb3NYbFEvWkNwTW15VEho?=
 =?utf-8?B?Sy9yZkRCOHNMSTRieFY0cG1naGNDVnIza3hla2kwVUtEUk5GT01vZlBZUmQz?=
 =?utf-8?B?clBUNzA5dFF5U1hkdGN2WDNUKzl3UkNSLy9wTGpSUWdtVi9CN0hGV09UY3c3?=
 =?utf-8?B?QWlVOGwrT2NnK1p5dXpBaTRqZHYyalQyWGhOVW8zU2J3UE5SM3pqbFFmVHNU?=
 =?utf-8?B?UkNld3Z5QTZVdjlUZlJEZVJJZ0hza2RiYkxXWi9iM2ZDMjFyYWJwU3V5VGQx?=
 =?utf-8?B?TU03UzZPMlpoVjZuTWg1bE5acVZpRmVkRjByREhFNkdJeVhIbVI5Y0h6NFVE?=
 =?utf-8?B?Sy84ei9GQ3UrWjIyZmVjenBXRDExZnlJeTFqdW1pNXltSVNldEppOGtpQVpY?=
 =?utf-8?B?a3VrNm1kRjd0NVJCVHRGS0hZY1IzK3ZYSUN4RTFhVmcydURVSDFJTWxaeUhh?=
 =?utf-8?B?QUFxamdGUU5hM0d5OWphVUNMVm1KakdRT2NFRTFyeHhqZkdvam4wYXJMRk1L?=
 =?utf-8?B?MDhRaDNPQU5PY2RUSmxOVitpd2lzeGNHVk9HNzJoR2ROUzhJbGNmcm5XVGd4?=
 =?utf-8?B?azlhYW9QZ21saFgrNS9NaHdyMVZ4TE1VSytza3JGV0Q0MWN1bWQzRmZJZXBO?=
 =?utf-8?B?ZDN5Mk5iRG5PVmYvL0ZOTDVFQlJxSEpzMXdCOForMzc4M1NYeGNiYUh6enZx?=
 =?utf-8?B?UWNEMlRxeDBQVW8yamk0SmxDZ3ppS2JhYkI5MHdwcmkza2N3M0FBa1VyRHdX?=
 =?utf-8?B?M1Z0NE1JazhjbDVybitobmNGOVhnQmZnRVQ3OGNnUmh0cWxmeHZoMkxxTHpI?=
 =?utf-8?B?L1NML0ZPY3I0RXNDbTI1YndHckZNdzRlbVRpZVA5ZjZHYWFzRUhtajlWUzky?=
 =?utf-8?B?TStTMHdyRTZnalVaQ1FXTFdoaUt4NnUwQVVQYjB2TEZvcjRLQ3BpekhRY2hH?=
 =?utf-8?B?KzBaVE82eSszRzBDRExBRnc2Slh2eUpMWmdmcEpaQ280OUZiRzV2Y2ZUMTh2?=
 =?utf-8?Q?cJwPvOeUnJHa+vf5/yUYQCnDyz7Xk1OJinTP9MO?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30507057-e0fc-4afc-5040-08d915fe8e2c
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2021 11:02:10.5799 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YpH6fPm+TWMqHO/+w5VUIaTfKhnZCfTKlh8tpRz4anXAkOCK+rtVwaeYNrBT33Koc900BlmLMM7LV7L2bGYTb6US/55Ji+KDXJ+3g3rMpvY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1969
Received-SPF: pass client-ip=40.107.21.97;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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

12.05.2021 12:59, Daniel P. Berrangé wrote:
> On Wed, May 12, 2021 at 12:40:03PM +0300, Roman Kagan wrote:
>> On Mon, Apr 19, 2021 at 10:34:49AM +0100, Daniel P. Berrangé wrote:
>>> On Fri, Apr 16, 2021 at 11:08:59AM +0300, Vladimir Sementsov-Ogievskiy wrote:
>>>> Detecting monitor by current coroutine works bad when we are not in
>>>> coroutine context. And that's exactly so in nbd reconnect code, where
>>>> qio_channel_socket_connect_sync() is called from thread.
>>>>
>>>> Add a possibility to pass monitor by hand, to be used in the following
>>>> commit.
>>>>
>>>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>>>> ---
>>>>   include/io/channel-socket.h    | 20 ++++++++++++++++++++
>>>>   include/qemu/sockets.h         |  2 +-
>>>>   io/channel-socket.c            | 17 +++++++++++++----
>>>>   tests/unit/test-util-sockets.c | 16 ++++++++--------
>>>>   util/qemu-sockets.c            | 10 +++++-----
>>>>   5 files changed, 47 insertions(+), 18 deletions(-)
>>>>
>>>> diff --git a/include/io/channel-socket.h b/include/io/channel-socket.h
>>>> index e747e63514..6d0915420d 100644
>>>> --- a/include/io/channel-socket.h
>>>> +++ b/include/io/channel-socket.h
>>>> @@ -78,6 +78,23 @@ qio_channel_socket_new_fd(int fd,
>>>>                             Error **errp);
>>>>   
>>>>   
>>>> +/**
>>>> + * qio_channel_socket_connect_sync_mon:
>>>> + * @ioc: the socket channel object
>>>> + * @addr: the address to connect to
>>>> + * @mon: current monitor. If NULL, it will be detected by
>>>> + *       current coroutine.
>>>> + * @errp: pointer to a NULL-initialized error object
>>>> + *
>>>> + * Attempt to connect to the address @addr. This method
>>>> + * will run in the foreground so the caller will not regain
>>>> + * execution control until the connection is established or
>>>> + * an error occurs.
>>>> + */
>>>> +int qio_channel_socket_connect_sync_mon(QIOChannelSocket *ioc,
>>>> +                                        SocketAddress *addr,
>>>> +                                        Monitor *mon,
>>>> +                                        Error **errp);
>>>
>>> I don't really like exposing the concept of the QEMU monitor in
>>> the IO layer APIs. IMHO these ought to remain completely separate
>>> subsystems from the API pov,
>>
>> Agreed.
>>
>>> and we ought to fix this problem by
>>> making monitor_cur() work better in the scenario required.
>>
>> Would it make sense instead to resolve the fdstr into actual file
>> descriptor number in the context where monitor_cur() works and makes
>> sense, prior to passing it to the connection thread?
> 
> Yes, arguably the root problem is caused by the util/qemu-sockets.c
> code directly referring to the current monitor. This has resultde in
> the slightly strange scenario where we have two distinct semantics
> for the 'fd' SocketAddressType
> 
>   @fd: decimal is for file descriptor number, otherwise a file descriptor name.
>        Named file descriptors are permitted in monitor commands, in combination
>        with the 'getfd' command. Decimal file descriptors are permitted at
>        startup or other contexts where no monitor context is active.
> 
> Now these distinct semantics kinda make sense from the POV of the
> management application, but we've let the dual semantics propagate
> all the way down our I/O stack.
> 
> Folowing your idea, we could have  'socket_address_resolve_monitor_fd'
> method which takes a 'SocketAddress' and returns a new 'SocketAddress'
> with the real FD filled in.  We then call this method in any codepath
> which is getting a 'SocketAddress' struct from the monitor.
> 
> The util/qemu-sockets.c code then only has to think about real FDs,
> and the monitor_get_fd() call only occurs right at the top level.
> 

Reasonable, I'll try this way


-- 
Best regards,
Vladimir

