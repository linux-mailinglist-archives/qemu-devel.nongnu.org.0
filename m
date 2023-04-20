Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14FE56E9C39
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 21:07:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppZcV-0003wy-KR; Thu, 20 Apr 2023 15:07:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1ppZcT-0003wp-NC
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 15:07:02 -0400
Received: from forwardcorp1c.mail.yandex.net
 ([2a02:6b8:c03:500:1:45:d181:df01])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1ppZcR-0001Cc-I2
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 15:07:01 -0400
Received: from mail-nwsmtp-smtp-corp-main-44.iva.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-main-44.iva.yp-c.yandex.net
 [IPv6:2a02:6b8:c0c:7f29:0:640:9a2b:0])
 by forwardcorp1c.mail.yandex.net (Yandex) with ESMTP id 39F335FE66;
 Thu, 20 Apr 2023 22:06:52 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b58f::1:1d] (unknown
 [2a02:6b8:b081:b58f::1:1d])
 by mail-nwsmtp-smtp-corp-main-44.iva.yp-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id p6kBuK1OmeA0-sMYMEZ5f; Thu, 20 Apr 2023 22:06:51 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1682017611; bh=IToRBkfJmmqjO9OmBo5mwP3BL+DstIIx8wAdbwxTtXY=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=MECXnl5RLbJiOO37JWqMv9hSVX4pX4p4/SC4RqtiyR+b9DUCt3bj1HXpyL0rUJPWf
 rtrczZwQZhvBKQ4fX5Mez3HQ6Pn3Ae4f+ooRFFOJaaROIzSSbOoGKfw7B/9yZFapaA
 DhEWwiOsDzV1as7okr6C3ytN42DE8svLx+/cD7x4=
Authentication-Results: mail-nwsmtp-smtp-corp-main-44.iva.yp-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <eb10c99a-a0c6-a1cf-72ee-76b796a1726e@yandex-team.ru>
Date: Thu, 20 Apr 2023 22:06:51 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] coverity: physmem: use simple assertions instead of
 modelling
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@gmail.com>
Cc: qemu-devel@nongnu.org, philmd@linaro.org, david@redhat.com,
 peterx@redhat.com, armbru@redhat.com, Stefan Hajnoczi <stefanha@redhat.com>
References: <20221226220351.754204-1-vsementsov@yandex-team.ru>
 <35c7e623-1433-5250-6188-29424814bccb@yandex-team.ru>
 <CAJSP0QWDcw8cYo8opfQ_+_U4p1DfQ49oo_ogOsnqJji+d1DzgA@mail.gmail.com>
 <CAFEAcA9qwYFpYOg9tG2Kh-dnR4sr6jYzmapqNjZKqie8L=WO4A@mail.gmail.com>
 <fea4486a-cb0f-3a23-eb5b-56fa4a6bca77@yandex-team.ru>
 <65a4bc93-ba15-7e60-765a-8691ebba94e5@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <65a4bc93-ba15-7e60-765a-8691ebba94e5@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a02:6b8:c03:500:1:45:d181:df01;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1c.mail.yandex.net
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.669,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 16.03.23 00:22, Paolo Bonzini wrote:
> On 3/15/23 15:28, Vladimir Sementsov-Ogievskiy wrote:
>> On 22.02.23 18:57, Peter Maydell wrote:
>>> On Wed, 22 Feb 2023 at 14:19, Stefan Hajnoczi <stefanha@gmail.com> wrote:
>>>>
>>>> On Wed, 15 Feb 2023 at 15:22, Vladimir Sementsov-Ogievskiy
>>>> <vsementsov@yandex-team.ru> wrote:
>>>>>
>>>>> ping
>>>>>
>>>>> [add Stefan]
>>>>
>>>> I'm not familiar with the Coverity models. Peter Maydell is the maintainer.
>>>
>>> We haven't run Coverity scans since September last year.
>>
>> What's the problem with it? May I help somehow?
> 
> The container broke when libslirp was removed, and I've been procrastinating fixing it. 🙁
> 
> Paolo

Hi!

I see Coverity works again. Could we give this patch a try?

Locally, I now run Coverity on master, on master with dropped model (half of my patch) and with my full patch.

The model, that this patch drops, fixes 94 issues. The assertion I propose fixes same 94 issues and two more resource leaks.

The model, that this patch drops, also bring 4 issues. The assertion I propose brings no new issues.

Of course, my local setup is different from QEMU Coverity cloud run.

-- 
Best regards,
Vladimir


