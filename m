Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1860E40C294
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 11:13:48 +0200 (CEST)
Received: from localhost ([::1]:52092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQQzD-0000ib-4J
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 05:13:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mQQxH-0007aC-KP; Wed, 15 Sep 2021 05:11:48 -0400
Received: from mail-db8eur05on2110.outbound.protection.outlook.com
 ([40.107.20.110]:23136 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mQQxA-0002iS-Op; Wed, 15 Sep 2021 05:11:45 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LpxhJbGkukkpN5YvWgMTKi0cbnwBYXR2rH14/nBJi8lI0r3EMplLWMIa71rTxNcwCrr7iFawlpsxFjP0FjOZYfdgx3RBE2BsNoGHf8B2eX5q/Z3iRtfT+THj+bQNloF8DH1gq5xEyQEExK3VWl3ehBKfXaAC+dNdP75DaBnyBcRz9vqL+KF3XH3qfjWDc37DEjyKgVQkzLyKmlTWmPkEzzedGugxkxyU7TA0vL0R/Xr8xqNfACw+QMJgDLCzrGOh3MCJlMctRJRYN8BMT3CfwovJ7mK0HqRtVShD5Ula+STKxss5Y5QCPbuJ+EXmblnCemBZWcOJsL8c+0lfbl+9Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=FGDIngKFhsdsFwDG0jSGdywmtrf/A4IDdhvbkxD/Yu4=;
 b=WtB+rdsO2ObCwuLPrweOu98QW/PGvahmwvptfk8+g1geW0EusydNRDh59CK2ucHOD3vMEvpQNy+TueKqanNpQuFad7UdS0X+tWavJyFb8gWRfdITN7Roe+iE6LsUic0mNhz6EWLra+pKmiuSXvH5BkVx7vrr4dipjU+VObEy1016IkXQmtS5NKlSpHqqZjSEWdBH3X63EN5eUbTtBSg4n95rPJIz9u/xghDqsN4IzAw5FmfLx+T60o5uNcZpd8vEfbNJHRQeR0FlaEHoT0d4m8o9fM0z0lm4I96mBiHS8TjrQwF3wPB/plxbwjhYbi27EkT5sLvb+Amq/CHixH3EVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FGDIngKFhsdsFwDG0jSGdywmtrf/A4IDdhvbkxD/Yu4=;
 b=Jlzvdd/EQcEYmAAPotJCXvkAKyQXAM+TSCEpuceevObXoxpp4tyOPbf8J7dG5GXnFY90RSVQK9qZkBjvOIF6dCmKwhvzipzs8Rqo6FyE39Xkz5SRFtDawR48E2Ht0XeMf8ImkSi+/qOdNmz1TaSozVzVm0bbtMI8RtZPRFTPQiY=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4278.eurprd08.prod.outlook.com (2603:10a6:20b:71::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.17; Wed, 15 Sep
 2021 09:11:37 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%9]) with mapi id 15.20.4523.014; Wed, 15 Sep 2021
 09:11:37 +0000
Subject: Re: [PATCH v2] nbd/server: Suppress Broken pipe errors on abrupt
 disconnection
To: "Richard W.M. Jones" <rjones@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, kwolf@redhat.com,
 eblake@redhat.com
References: <20210913151936.392705-1-rjones@redhat.com>
 <6c59b070-b9b4-6ecb-8557-3ea54af3d45a@virtuozzo.com>
 <20210914145200.GJ26415@redhat.com>
 <997fe8b4-3610-2336-c7f3-67a0e2cbf34e@virtuozzo.com>
 <20210914163232.GN26415@redhat.com>
 <0bdef3d9-df05-f49d-038c-9930c2677f54@virtuozzo.com>
 <20210915090025.GP26415@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <637d695d-7910-9bdf-3b6e-18408c556825@virtuozzo.com>
Date: Wed, 15 Sep 2021 12:11:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210915090025.GP26415@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0051.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::9) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.196) by
 FR3P281CA0051.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4a::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.9 via Frontend Transport; Wed, 15 Sep 2021 09:11:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a114b370-2ef5-46b4-2a8e-08d97828d20f
X-MS-TrafficTypeDiagnostic: AM6PR08MB4278:
X-Microsoft-Antispam-PRVS: <AM6PR08MB427852117AF14419FB773952C1DB9@AM6PR08MB4278.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MRYPXRqCIHNQPPe6SPLG025YssNMKWnAgTlStEeiMG3ogrklD7jljsDH9LcLAEavzenZ/9zkCDC4g0LloS71YPl2CpnhyKOjNcQ1qz46ERk68IjWr/mslD0Ctu+JmbApwJGKPViSKWMZWGE9aj3E02O1MGGKf06C87EOKrfJdYt5pYQAEdZFdyf4G3Z2+SzSkRJsfNMsUQE6pjINWPOfWY0y+/xm0JEuNjJx2Akn/ImPN1gdlZ0SyjhGPkDheDn3YfzLjQWAI0XdLgd0qXfaDIe8M77vlXP3iP2DmxvPwzafgw6w734Os75+Jx+OKKdONaJAY8KgxQ7TiywDDvdb1ndKWsdxEey+pWOZ3lX9N9/JSd4SOUo7rOAkO04yvA+flcAQUoeMHoY8i1QE7iyeP0uupMh0b7Spkks6y6Yk48WadO9xoXi47p6pdC0/s9nuuCKZi5PdUb2Jr1GnMEJvy9MF3EoG7IEyawtzumoFAWr8DbBFEnHGn3qDlWgjCeQbPhOAQEmpwgfOBeBuPdNawABKt80XRsOABOmOXK7gec8OymfUrwsZEtsf0pMNq+RVMoWxC7jgNBAgjHj58Tv9HSdm1Z4XW7LBMThzMWa8HVp5/ADtE7EWweIMQQAq3fyAKZONFZY2Fz3yEXHb+kfjZRdsJo6sM3k9lnn2f5V6uIuRm6Z+ijjy6uqEZi+MDNrG+PmqwzduX8OWhVSuybIxYaFBYpcyMnHj5/yn7CH11j0XwJOLnh9q7mPPObTetC+IqUmvw6V971GVspetrcBFiJVxbupOclLmAgtrnFOv0jMb0PBWH5f+ESKJdSHFT20y5IG9G0AnZ5eQ8at2nMvz/yAWthyKa3Mrt7kpV8gicW4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39840400004)(396003)(366004)(136003)(346002)(4326008)(5660300002)(2616005)(86362001)(31696002)(38100700002)(316002)(66556008)(66476007)(2906002)(66946007)(31686004)(38350700002)(966005)(478600001)(36756003)(186003)(83380400001)(6916009)(66574015)(26005)(956004)(8936002)(8676002)(52116002)(6486002)(16576012)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WE1Bc1FtSjhqQkxMOWNYZWs1MDRWbVlWV1dCb283K1hWZlZpV1RSYXduYWtD?=
 =?utf-8?B?OHkxZDRFZmJEb0hZYmdxQnFMTHpLdGtrUUR1VUM2L3djNlpqdmtncWQwSWxG?=
 =?utf-8?B?cU8xa1E0V05Ma0RlbThhUjdMQ2pBZ1UrdVcxV2svNTFDZFlpSU5rTmc3emh4?=
 =?utf-8?B?em5ySjJHOEZjL2dDQzRRclRoZmpheXBwbU1rdS9neGRDYzQvZEd5V1lUN0VP?=
 =?utf-8?B?eUM5b1pGZ213dThTUEZFV2Q4NjJUK3lVN2JSY2lqTnV4Rmd2YnRTakJObG9O?=
 =?utf-8?B?MG42cG1DWG1QZ0RNTkZ6dzl0MWt2cjJRV3hIWW41NGcyWVBEL1FObUY1UWsv?=
 =?utf-8?B?Zy95MGNocDcvUUV4OGhtOUZQMzNvL3BPMy9mZGd4dEF2T0FKUWVRaUo2a2kw?=
 =?utf-8?B?MDJoa0gvN0FYR29sQ0h2S1QvSWJ5RWMrY2I4RkhFWE16ZGhsczZ5RVRhSDF2?=
 =?utf-8?B?YWdtRkllZjZqSTUvSURjTTZrUUZtQk14OWVqb3JlMTZraWhxVmdSM2Q3S2tU?=
 =?utf-8?B?ODl0K0psS041WEFDZUlhMVJ2Tm9EbEJhNnBhYVVzYjRLeTc4TCtDd1M4SDY2?=
 =?utf-8?B?eUI4Wng1QXNSNEM1NWsydy9MaHFVQjlNQ3lkbW56WXRVK2NiL0hodzR5S0xH?=
 =?utf-8?B?YlFVMFdtYlBoSEp5cTlubDVPaTU1Yi9NUUVBYmVFVnV4M3Rmdkt4aXRkclc5?=
 =?utf-8?B?NFdkN2hRYjFSMjQ0Z3ZvUkFQMjcwTDcvSFlNZktTdTU1emJVTitDa1QvM3BD?=
 =?utf-8?B?ZTRyNGc4V2NwZ0h4cExHeUs2TVlMbGo3cEROdExFSmVhRUdXM3NScUF0NWZE?=
 =?utf-8?B?aUd6VWFLc1RYV210UHhvamsrbFhsLzZZcnVSWENMNWg1OEVTd0ZoanlubWVn?=
 =?utf-8?B?RTJrZzZYaXJybU5IRkR2ZUp1Ylp3eHh1TG5sMFhWWCtLczVTMXllMmdLczg1?=
 =?utf-8?B?RkxoTFFZTWc0RWJ1Qkw2VGJrQlhNc2swWE40cjFsa1RsOGx6b2p0SFBLV1FM?=
 =?utf-8?B?blZvcmhvSmY4V3NsS1ZHY3VkZVN0dzZzN2FiYk5aQXIxTTRNYzltU24wYk9S?=
 =?utf-8?B?dGE3U0piVEpWZzAzTTc4c2M2RWNhTkwvTHJsa3ZBWVpkNDJoYmp5Uy9QV3VB?=
 =?utf-8?B?Ti95L3JVb2p6bUxjZVdCWHpsWlBlWGpCdXdPYjAyMXoySmwrZmJrU01KK2Ji?=
 =?utf-8?B?dCt1R0J5ZkVLK3lVMUVibndyeHhmS0lXRGovSTlZUE5rbjQybUFCKzlqUXBL?=
 =?utf-8?B?SXJla0E4b0NMY25OaHVERHRMY0R3SldkTGJhemlxUGVsVHdBVGpkVExMeWFa?=
 =?utf-8?B?K2c1MHpkNHBwN2JoRkZuOUtTdmJwVXBkNUhzdE9DTzdZWUhYdHRzdStQYzYv?=
 =?utf-8?B?c2J1UFRSR1RKbFd4aVRBZEpHcG12Yk5TV1R6QzVxa0tRRWExenNPRmRoL3NN?=
 =?utf-8?B?STQyNFA2dFkxRTdmNnFFdTBwM1YrSGovaVlyanJ1WlAydE5rT0pYREZkK2Jv?=
 =?utf-8?B?VUZLQThaeFkrUjN6NWJMQlVIZTN2c0VRUmFKUFNNc0NjeTM4VDh4ODRIeFI3?=
 =?utf-8?B?bkE0dS8vb2krU2RjUWp3MnV6N2lOVm5hZ0RONXRieVJCVGVMNm0zZFRUai9P?=
 =?utf-8?B?Mk9OQXM2SUNnTUF4WTI4U0NNRHRDcko4M0dWcDFSYm81MXEzZVNkck53ZFY1?=
 =?utf-8?B?RG13cEZhUGpoM3d2ZjlqaGFNbFVvM2VKYitwTDcwZUhQMnpYcHlPVE51YUVH?=
 =?utf-8?Q?AfinRcVf5DDZXlFbAJdleNR+0JhBToSwnb6B5LE?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a114b370-2ef5-46b4-2a8e-08d97828d20f
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2021 09:11:37.5103 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XnPOkjNWnfK4+CM1pWRpkNJ/nPcmgejdNWibHra/NcO49ihaBtMcQegTLaYE8XyayTj5D8kc6nsujm8K8FkQ4RFzPSRf5XQ+vENpxWFr6z8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4278
Received-SPF: pass client-ip=40.107.20.110;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-1.969, RCVD_IN_DNSWL_NONE=-0.0001,
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

15.09.2021 12:00, Richard W.M. Jones wrote:
> On Wed, Sep 15, 2021 at 10:15:20AM +0300, Vladimir Sementsov-Ogievskiy wrote:
>> 14.09.2021 19:32, Richard W.M. Jones wrote:
>>> On Tue, Sep 14, 2021 at 06:21:58PM +0300, Vladimir Sementsov-Ogievskiy wrote:
>>>> 14.09.2021 17:52, Richard W.M. Jones wrote:
>>>>> On the
>>>>> server side when the server receives NBD_CMD_DISC it must complete any
>>>>> in-flight requests, but there's no requirement for the server to
>>>>> commit anything to disk.  IOW you can still lose data even though you
>>>>> took the time to disconnect.
>>>>>
>>>>> So I don't think there's any reason for libnbd to always gracefully
>>>>
>>>> Hmm. Me go to NBD spec :)
>>>>
>>>> I think, there is a reason:
>>>>
>>>> "The client and the server MUST NOT initiate any form of disconnect other than in one of the above circumstances."
>>>>
>>>> And the only possibility for client to initiate a hard disconnect listed above is "if it detects a violation by the other party of a mandatory condition within this document".
>>>>
>>>> So at least, nbdsh violates NBD protocol. May be spec should be updated to satisfy your needs.
>>>
>>> I would say the spec is at best contradictory, but if you read other
>>> parts of the spec, then it's pretty clear that we're allowed to drop
>>> the connection whenever we like.  This section says as much:
>>>
>>> https://github.com/NetworkBlockDevice/nbd/blob/5805b25ad3da96e7c0b3160cda51ea19eb518d5b/doc/proto.md#terminating-the-transmission-phase
>>
>> Hmm, that was exactly the section I read and quoted :)
>>
>>>
>>>    There are two methods of terminating the transmission phase:
>>>    ...
>>>    "The client or the server drops the TCP session (in which case it
>>>    SHOULD shut down the TLS session first). This is referred to as
>>>    'initiating a hard disconnect'."
>>
>> Right. Here the method is defined, no word that client can do it at any time.
> 
> I don't read this as a definition.

If so, next paragraphs that specify client behavior doesn't make sense.

> 
> But we should probably clarify the spec to note that dropping the
> connection is fine, because it is - no one has made any argument so
> far that there's an actual reason to waste time on NBD_CMD_DISC.
> 

I agree that it's safe enough..

Hmm. If we update the spec to clarify that sending DISC is not necessary, is there any reason to send it at all? We can stop sending it in Qemu as well.


> 
>> Next, in same section:
>>
>>     Either side MAY initiate a hard disconnect if it detects a violation by the other party of a mandatory condition within this document.
>>
>> Next
>>     The client MAY issue a soft disconnect at any time
>>
>> And finally:
>>
>>     The client and the server MUST NOT initiate any form of disconnect other than in one of the above circumstances.
>>
>>
>> Or do you mean some other spec section I missed?
>>
>>>
>>> Anyway we're dropping the TCP connection because sometimes we are just
>>> interrogating an NBD server eg to find out what it supports, and doing
>>> a graceful shutdown is a waste of time and internet.
>>>
>>>>> shut down (especially in this case where there are no in-flight
>>>>> requests), and anyway it would break ABI to make that change and slow
>>>>> down the client in cases when there's nothing to clean up.
>>>>
>>>> Which ABI will it break?
>>>
>>> Our contract with callers using nbd_close(3), if nbd_shutdown(3) is
>>> not called beforehand.
>>> https://libguestfs.org/nbd_shutdown.3.html
>>> https://libguestfs.org/nbd_create.3.html (really nbd_close ...)
>>>
>>> Rich.
>>>
>>
>>
>> -- 
>> Best regards,
>> Vladimir
> 


-- 
Best regards,
Vladimir

