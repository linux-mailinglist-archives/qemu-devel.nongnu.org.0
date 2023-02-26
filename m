Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 762A76A2F60
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Feb 2023 13:13:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWFsJ-0004nn-FM; Sun, 26 Feb 2023 07:11:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pWFsG-0004nd-VF
 for qemu-devel@nongnu.org; Sun, 26 Feb 2023 07:11:28 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pWFsE-00032b-I5
 for qemu-devel@nongnu.org; Sun, 26 Feb 2023 07:11:28 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id E154774632B;
 Sun, 26 Feb 2023 13:11:20 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 5D198745720; Sun, 26 Feb 2023 13:11:19 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 5BA5B745706;
 Sun, 26 Feb 2023 13:11:19 +0100 (CET)
Date: Sun, 26 Feb 2023 13:11:19 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Max Filippov <jcmvbkbc@gmail.com>
cc: Damien Zammit <damien@zamaudio.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH qemu] timer/i8254: Fix one shot PIT mode
In-Reply-To: <CAMo8BfKm1DAfKRo+8rO7rjiQ3N_BwPFPsMmUjwRA=mx1QJqa3w@mail.gmail.com>
Message-ID: <59513eba-4cd3-2e0f-c81a-fac19407cb3d@eik.bme.hu>
References: <20230226015755.52624-1-damien@zamaudio.com>
 <20230226035018-mutt-send-email-mst@kernel.org>
 <2a62e6fa-3c80-5d07-2b65-0ef27ceabb86@zamaudio.com>
 <CAMo8BfKm1DAfKRo+8rO7rjiQ3N_BwPFPsMmUjwRA=mx1QJqa3w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1113033189-1677413479=:89088"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1113033189-1677413479=:89088
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Sun, 26 Feb 2023, Max Filippov wrote:
> On Sun, Feb 26, 2023 at 1:18 AM Damien Zammit <damien@zamaudio.com> wrote:
>>
>> Hi Michael,
>>
>> Thanks for reviewing this on a weekend!
>>
>> On 26/2/23 19:51, Michael S. Tsirkin wrote:
>>> On Sun, Feb 26, 2023 at 01:58:10AM +0000, Damien Zammit wrote:
>>>>       case 0:
>>>> -        out = (d >= s->count);
>>>> -        break;
>>>
>>>
>>> I think you need something like
>>>       /* FALLTHRU */
>>> here otherwise some gcc versions will warn.
>>>
>>>>       case 1:
>>>> -        out = (d < s->count);
>>>> +        out = (d >= s->count);
>>
>> It seems that there are quite a number of these consecutive fallthrough cases
>> without /* FALLTHRU */ in i8254_common.c
>>
>> Can these be fixed in a separate patch?
>
> I believe that the comment is only needed when there's code
> between the labels and is not needed between the labels that
> follow each other.

I think so too, I have some of these consecutive case labels in my code 
and never had a problem with that. Only when you have a statement between 
labels without break is when a comment is needed.

Regards,
BALATON Zoltan
--3866299591-1113033189-1677413479=:89088--

