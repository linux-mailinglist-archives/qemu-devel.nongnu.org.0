Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 088E240DB42
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 15:32:01 +0200 (CEST)
Received: from localhost ([::1]:34484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQrUc-0006K3-Nb
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 09:31:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mQrRb-0004NW-8O
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 09:28:51 -0400
Received: from mail-eopbgr70117.outbound.protection.outlook.com
 ([40.107.7.117]:63877 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mQrRW-0007N9-2P
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 09:28:50 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hoSqIQuf/1liwmIeqTzUxXZ8n1kpyE3dT0+PRGuS39QbqXiIvxi2cxu5a04qWSITmSERstJyfIY0vtocDvV23vsITOKyIFqKxekfWgajhMDHr2l0RzZiz3qZ2HlT67vb5Xge5YDZlWrzT8GANRqF8SWGkrxM6U+qjrxdEhvO10UC72gOxtIWyD5J9w+myzL2FvHW921q/OfP7MYbkqgnQN7RFMNzMBvLX/xcMDTBCN0iZViI/W4TrcU/Ley9IdSGOszl4Z4DCIvloCFP59Em+dFojoiRptjM6xGcX53tjzIIcEAQwq9dxXd9IFRnb56rGgBQ0xqqsCXBpVRG2YHpcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=NJiJfW0zF11ho0yr2AzXqzYJUgWVT713Jqf30ekgnO0=;
 b=jmzl3hdbjEmX4vSSSXRd5XQNOw8NJyXRId2QNGb2+h8lIox9VTxZmtPetyapVirlZX1dX1uhVY+qvkIDNthKMwdVhb7jX+DROY+9g/ajqbfzcU7k5i//8zAu1H7VoQX+3s1Ie2bgFfPFo2k4wE9ecwD+VQPnairbLz8ltM1KgUqGN0vkhqBa5tizGGp1eG4Uh8NXwhTTaTKrcXhh7OP5dBaHs7SKZszwX5Q/nNffluzoHqptq9bv/34nTDgCZ4OG4XomwJO/CWpuCInTHcyAzsQDxAHsgaK4JI/2/juYSZtTVzC9k0H7flWgiIbhwX2tFh3Lz8LDlP2ImBHlqG23lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NJiJfW0zF11ho0yr2AzXqzYJUgWVT713Jqf30ekgnO0=;
 b=vMi1UOC9sbjaoNkBRemTAQL8FC4MVMab4dM/kR71PtjQ//HeZ2E1KbRROqo7rvxRSJlP98Ja6k1/0ZG0FLrvFL+YSrsghH1PPmCDEaUIr/TZCyWq3Dc8iYus2tCTPIo/X26oSxr83tBQ3/gv7swdOzYT6g6A3gKK3NzeGqANs6o=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0802MB2450.eurprd08.prod.outlook.com (2603:10a6:203:a0::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.17; Thu, 16 Sep
 2021 13:28:42 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%9]) with mapi id 15.20.4523.016; Thu, 16 Sep 2021
 13:28:42 +0000
Subject: Re: [PATCH RFC 0/5] Subject: [PATCH RFC 0/5] qapi: Add feature flags
 to enum members
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, eblake@redhat.com, jsnow@redhat.com,
 marcandre.lureau@redhat.com, mdroth@linux.vnet.ibm.com,
 libguestfs@redhat.com, libvir-list@redhat.com, berrange@redhat.com,
 pkrempa@redhat.com, kwolf@redhat.com
References: <20210915192425.4104210-1-armbru@redhat.com>
 <5b9b9fe9-12e2-c6f3-8430-450f55255d55@virtuozzo.com>
 <87r1do65kl.fsf@dusky.pond.sub.org>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <1df50f40-1385-9119-126a-56938fde9a92@virtuozzo.com>
Date: Thu, 16 Sep 2021 16:28:40 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <87r1do65kl.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0085.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::9) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.205) by
 FR0P281CA0085.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1e::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.6 via Frontend Transport; Thu, 16 Sep 2021 13:28:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c0f8122a-389b-429c-4957-08d97915e68d
X-MS-TrafficTypeDiagnostic: AM5PR0802MB2450:
X-Microsoft-Antispam-PRVS: <AM5PR0802MB2450BCC52D8179090CAD2DABC1DC9@AM5PR0802MB2450.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zgrV1Tn9Ysw7oPoFTqXdI2lM8Z42NuYoDHIwwELhEv7fWu4CmYyldH+sFbp3IYfJiwgll5PpFjCVbhndmQA8pYrvBjKyPPNMvSdFJIalwQ23tRugMU0VuXQHAKu6A1y8j9eUo46ig3ksNdX7c3/SxUuJKBIYmNGxi6kNJ/8z3KdpwNmYFCnMsfBdDrvdcSiT44DM81G12/E46/SF5s41ogF5HHfmaS6gGEOwu9lByJQU1+f/JB66jmri1WEeBVecJaZ4ZdsstBVuCADHaySWtGDUB8BBPz9i4i9XH/Q9DAq3/YW4UMV5hUyLU0atLTV8RnjulEEEV1hZd/tW87uHfFLFf9Bi1c0OsfmzEKNX0ShyZG8t1gzCxP7wikrLaP7FMc8xfoKUdVqeElkL2koib20miikUk0NPR/LiaRT+yCPU4CUVso1HJOGPNaoDLa6DjRR4DXjUnc+Qy0SjxmA/UcE2z5ZMEkyV7LqDCWMWHP29FGPGMHzKMvn2q7A68IjuzTu7ABU8+oZp2dcqQ/PgnUa0MCgLs9qGqywtiu0jm7O3S7Qz1XZXhdmb1RAbgKBRo0hGJED9ZAsu6psIm9CU+Qx0pfu+iQRo7+nHGIhhB6KN/4dXgePpHRhC/1ghGoe+WrSQhOy4QeZQ/wwP1CwL2/DpFXXAp8UAas1eEZ/ycukAyxMu+PmpSeKsPKXqJBq79BCCEKrs0bBTZH8HaDgV2hG13GH93kO0rpv4GcxGwxG0iduaZhUQlcWA4qqu8ke2+nlg2V0VUfQMBSgcMT+UOg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(376002)(39850400004)(136003)(366004)(6916009)(36756003)(38100700002)(86362001)(16576012)(38350700002)(6486002)(52116002)(31686004)(7416002)(8936002)(316002)(31696002)(83380400001)(478600001)(5660300002)(8676002)(66556008)(66476007)(66946007)(26005)(2906002)(4326008)(2616005)(186003)(956004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UnhXdUZld3hWU0pDSlZBZHJXUHVWTy9VeDV4cjJibDR6VG5yR0k3S1NVMENU?=
 =?utf-8?B?MGV5NGp2M3VONlBqNzlBM2E0Q2JqcUZ3TksrSk5QU05QbmhQb3NVc1A2S1ZK?=
 =?utf-8?B?Nk1hVGJtMFN1ZzRPclVqbXpsMFh3bGlEa3RzM0FKcjQ4TkpOS2xZTTJQZXlW?=
 =?utf-8?B?amZOUCtObFI3NDNuTUZlTTl6Q09iUzZKbDZSOWNlcUxad1hPbTZKNWU4Z2Yx?=
 =?utf-8?B?cDFCaHFTcWcrVytXbWxJUTFOZ0pUQm9GU0J4YnhmK1lVN0IrclU0djM4azAw?=
 =?utf-8?B?bWJVR3I0Z3pIQWhtOUpDYmNrM0hSNGR6UkUxbDI2WkxSY1Y1YUhMemIwbjY1?=
 =?utf-8?B?WisxV3JIbitYT0RJZ1R6KzVsdWxnQ0o0VVBJNDNYTjFQdnFXODVqVWNad2Mw?=
 =?utf-8?B?dWhRbHdwajZ1aElsSGhkZ1RRY0UzZ0QzZjlUQ0xOd0cyZFMvU29NaTlMaC9Y?=
 =?utf-8?B?cHVWNlJzRjhrSWY5dGZHL3VmQU5xMHVkRUdLT3B1Ym5PbSttd0VWZGd3ZTJF?=
 =?utf-8?B?ZlZLeVdzc0xvcXh1MGV0UTlvN0puRE9TeWJ4clhSNEJTTENWTkdyQUlIU2I0?=
 =?utf-8?B?K0pPbVlTOFA0QThPbGVQVEQyNlovcTNvcExYYldjdFdsMDZIazE4WUZiVTRa?=
 =?utf-8?B?QmF0QWdrTXN4czJxTzRjMlg0bUVGQWJSQnUxQUh5ZWtnUi9mNlpiQ2dHS2hY?=
 =?utf-8?B?RksxbjJKRGhZZDk2c1RSODQ1NEk0K21GaERmaEtia01WS0pkRitmMTFyOHBa?=
 =?utf-8?B?dm9USm5mRWcyRWorT1M0ZWlRNnJIdi9iZ1diRmZZZ0FqTVdWWk12SWtOMDNh?=
 =?utf-8?B?bWdGbk9BKzJueGNwaHZjZm93YmVMdHcrSGZRQ1NZV1J3aHZHZHpFZnQ4eDFJ?=
 =?utf-8?B?eUpXOGdKZ0pSeUxVMmZTYmpuMGVtcjFObHVwSFZmQmZVb3lqVDdpb2NxWFhz?=
 =?utf-8?B?UVJ3S0Jud1pZWS9vc0Q2cGdNMTdpMTV4NmJFeWhRbkxIMW5JTmV2YnZ4YS9a?=
 =?utf-8?B?L0ZqUE0yZVJieHNGdldZekR5ejFIR2lDaVFSUCt4WDVXUjk4RUxsTHlYSDJz?=
 =?utf-8?B?L2crR2xMbG1ySGRXZWN3MCthSlVsWGNpeldhb3psR3Z5TVFhNTZJWkRxTFpw?=
 =?utf-8?B?YkRaRzJET0ZrdUJBckx6QkhQQktOcDdnVUdsMTBFL0MwUUpVNjAwam9vTUxu?=
 =?utf-8?B?eDBKeElwem5pbU5WNXZNTE8vR3ljd3kyNkNzY0VPbW9rTUp2bTZ5RnlCVmxl?=
 =?utf-8?B?Rm5sbHh2RkVpbmZsVDZkREFESW1GR1ZUTUpzd1cyc0huakVrRmNzVHZaMVRu?=
 =?utf-8?B?R0FKMkZ2c3BUMWh6NWUvSHI4S2krWGh0UEtwT1BSRFdQNXhlWlU3OG1pbHNS?=
 =?utf-8?B?ckRoWlprdHFzWGdUTytJWVdabzBLOEJWdmloQ3cyaFcyTEVXWlR4dGY5bFdp?=
 =?utf-8?B?cGk2YVU3RWZJdXFyakwrcGhwTDI4V0xKdkF1YUNLVWtMcklFQjd1R05lYnNE?=
 =?utf-8?B?d01sY09rVVZZdnkvczNlbU5EUGFyWFh6TmFpQSt3VCtSaFFUSG55ajBGZTBl?=
 =?utf-8?B?NUpVdlpCZHZIT3FnZy83eXZhTFQ4MnJIa0lNcFdKcDcrWFBjbDRqMUczWlJX?=
 =?utf-8?B?SW5qeTlxSGZQaWRkanlyaGZ4bEY5TWliclhXa1Z2d2RmMHloQUkxbjBoR3Zx?=
 =?utf-8?B?TTRnbW5KVFdTV2xiR25Tc0M3M1VpcXR1VW80WlRpbld4bTZJNkdQZ1lOVlpx?=
 =?utf-8?Q?KkiEhVeoGyqhTUW1njFqLIexldZFu2Cvm7JmOAC?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0f8122a-389b-429c-4957-08d97915e68d
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2021 13:28:42.0596 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3o0ZnWggrF3LPNtd1mO/7UhvSL308WN2p/yswjN4aQMnUX/GTwDzaJ7MVD+HmY8aczx6ZDE32hALF/uIGmP7jJdC8NMlkqAPlGNHV/SGX9w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2450
Received-SPF: pass client-ip=40.107.7.117;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-1.488, RCVD_IN_DNSWL_NONE=-0.0001,
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

16.09.2021 15:57, Markus Armbruster wrote:
> Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> writes:
> 
>> Great! Thanks for working on this!
>>
>> 15.09.2021 22:24, Markus Armbruster wrote:
>>> PATCH 1+2 add feature flags to enum members.  Awkward due to an
>>> introspection design mistake; see PATCH 1 for details.  Feedback
>>> welcome, in particular from management application guys.
>>> PATCH 3+4 implement policy deprecated-input={reject,crash} for enum
>>> values.
>>>
>>> Policy deprecated-output=hide is not implemented, because we can't
>>> hide a value without hiding the entire member, which is almost
>>> certainly more than the requester of this policy bargained for.
>>> Perhaps we want a new policy deprecated-output=crash to help us catch
>>> unwanted use of deprecated enum values.  Thoughts?
>>
>> I think crash policy for output is doubtful. If we have query-*
>> command that returns a lot of things and some of them are deprecated
>> the whole command will always crash..
> 
> Policy "crash" is not quite as crazy as it may look :)
> 
> The non-default policies for handling deprecated interfaces are intended
> for testing users of these interfaces.
> 
> Input policy reject and output policy hide enable "testing the future".
> 
> Input policy crash is a robust way to double-check "management
> application does not send deprecated input".  This is not quite the same
> as "testing the future".  A management application may choose to send
> deprecated input, detect the failure and recover.  Testing that should
> pass with input policy reject, but not with input policy crash.
> 
> Output policy crash could be a way to double-check "the management
> application does not make QEMU send deprecated output".
> 
> Example: Say we deprecate BlockdevDriver member 'vvfat'.  We know that
> output of query-named-block-nodes can contain 'vvfat' only if something
> creates such nodes.  Input policy reject will reject attempts to use
> this driver with blockdev-add.  But what if the management application
> uses some other way to create such nodes, not (yet) covered by input
> policy?  Output policy crash could be used to double-check it doesn't.
> 
> Except it doesn't actually work, because as you said, testing will
> likely produce *other* deprecated output that should *not* crash the
> test.
> 
> Perhaps a policy hide-or-else-crash could work.
> 
>>                                         Deprecated is "use" of the
>> deprecated field, but we can't control does user use a specific field
>> or not.
>>
>> If some deprecated output is a consequence of deprecated input, we'd
>> better always show it.. Or in other words, we shouldn't deprecate such
>> output, deprecating of the corresponding input is enough.
> 
> Deprecating only input may require duplicating definitions used both for
> input and output, unless we replace today's feature flags by something
> more sophisticated.
> 
> Example: BlockdevDriver is used both as input of blockdev-add and as
> output of query-named-block-nodes.  Deprecate member 'vvfat' affects
> both input and output.


If we deprecate a vvfat, but still have some not deprecated ways to create vvfat node, that's a kind of bug[1] in deprecation system: if vvfat is deprecated, all ways to create vvfat should go through input compat policy.

So, making qemu crash on trying to output "vvfat" for me looks like a workaround for that bug[1]. And it's strange to create and interface to workaround the internal bug..

May be, we can just enable hide-or-else-crash behavior automatically, when user choose input=crash and output=hide?

> 
>> So, we are saying about showing some internal state to the user. And
>> part of this state becomes deprecated because internal implementation
>> changed. I think the only correct thing to do is handle
>> deprecated=hide by hand, in the place where we set this deprecated
>> field. Only at this place we can decide, should we simulate old
>> deprecated output value or not. For this we'll need a possibility to
>> get current policy at any place, but that doesn't seem to be a
>> problem, I see, it's just a global variable compat_policy.
> 
> I'm not sure I fully got this.
> 
> Compat policies are not about optionally providing older versions of an
> interface ("simulate old deprecated output value").  They try to help
> with testing users of interfaces.  One aspect of that is optionally
> approximating expected future interfaces.
> 

-- 
Best regards,
Vladimir

