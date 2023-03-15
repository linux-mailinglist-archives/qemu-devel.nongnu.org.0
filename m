Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F166BB5FC
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Mar 2023 15:29:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcS7S-00019x-Kr; Wed, 15 Mar 2023 10:28:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pcS7M-00018a-JB
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 10:28:40 -0400
Received: from forwardcorp1b.mail.yandex.net ([178.154.239.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pcS7K-0005xw-B0
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 10:28:40 -0400
Received: from mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net
 [IPv6:2a02:6b8:c12:5da4:0:640:ef2d:0])
 by forwardcorp1b.mail.yandex.net (Yandex) with ESMTP id F25DE5F35E;
 Wed, 15 Mar 2023 17:28:30 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:6409::1:13] (unknown
 [2a02:6b8:b081:6409::1:13])
 by mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id TSkpF20hviE0-PaxFkekY; Wed, 15 Mar 2023 17:28:30 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1678890510; bh=fqVFPaW5NgE0gWlveZFdbORKKmOcz2SPM75dSheqK/8=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=T2wESV8beLCrXaJCjaxOTtV9Y8DZV6ib3ORBKSh8DPg/0hehCe0bXG8lMVRrJxrjA
 D4vP3Aihe1s2LxRZKor1vLOkDe8xhFHW2egXxisV9FQGDiHVUvbcEbNT8frV3Ov6/C
 KFK9CvKzt8ZNBLjB9nKJtDMF9j6PXfZNaFcEkIh8=
Authentication-Results: mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <fea4486a-cb0f-3a23-eb5b-56fa4a6bca77@yandex-team.ru>
Date: Wed, 15 Mar 2023 17:28:29 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] coverity: physmem: use simple assertions instead of
 modelling
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@gmail.com>
Cc: qemu-devel@nongnu.org, philmd@linaro.org, david@redhat.com,
 peterx@redhat.com, armbru@redhat.com, Stefan Hajnoczi <stefanha@redhat.com>,
 pbonzini@redhat.com
References: <20221226220351.754204-1-vsementsov@yandex-team.ru>
 <35c7e623-1433-5250-6188-29424814bccb@yandex-team.ru>
 <CAJSP0QWDcw8cYo8opfQ_+_U4p1DfQ49oo_ogOsnqJji+d1DzgA@mail.gmail.com>
 <CAFEAcA9qwYFpYOg9tG2Kh-dnR4sr6jYzmapqNjZKqie8L=WO4A@mail.gmail.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <CAFEAcA9qwYFpYOg9tG2Kh-dnR4sr6jYzmapqNjZKqie8L=WO4A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=178.154.239.136;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1b.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 22.02.23 18:57, Peter Maydell wrote:
> On Wed, 22 Feb 2023 at 14:19, Stefan Hajnoczi <stefanha@gmail.com> wrote:
>>
>> On Wed, 15 Feb 2023 at 15:22, Vladimir Sementsov-Ogievskiy
>> <vsementsov@yandex-team.ru> wrote:
>>>
>>> ping
>>>
>>> [add Stefan]
>>
>> I'm not familiar with the Coverity models. Peter Maydell is the maintainer.
> 
> We haven't run Coverity scans since September last year.

What's the problem with it? May I help somehow?

> There's no point making changes to our model until we've
> fixed that. Paolo?
> 
> thanks
> -- PMM

-- 
Best regards,
Vladimir


