Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0902437D3E6
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 21:36:16 +0200 (CEST)
Received: from localhost ([::1]:52776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgueV-0007Fk-2y
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 15:36:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lgu4J-0000gM-EN
 for qemu-devel@nongnu.org; Wed, 12 May 2021 14:58:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26455)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lgu4E-000143-BO
 for qemu-devel@nongnu.org; Wed, 12 May 2021 14:58:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620845925;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ejNSliYLzN/dMH8dC7Vanhun9axgFcIn4uIkzo9x45E=;
 b=jJtHVdp8FtgFVlgr7+iFqHWEF1nWPvL3vkKSUFtx8hPUgtF3NyFxRzQ58IvBftNMD5lAK2
 3nn57CeyZe3ZhxouAmW7rZTkye8E/+t9MRpYCDxo1U1jJVb0f9AexUt2/wFVQnUF8kOoH0
 wYeJ6OeK7WemrBnADJI4EjZbG468LZ4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-6-BZgYR_8EMeyiGbWO2BQM1g-1; Wed, 12 May 2021 14:58:42 -0400
X-MC-Unique: BZgYR_8EMeyiGbWO2BQM1g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 247318015D4;
 Wed, 12 May 2021 18:58:41 +0000 (UTC)
Received: from [10.10.117.64] (ovpn-117-64.rdu2.redhat.com [10.10.117.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B17325D9D7;
 Wed, 12 May 2021 18:58:40 +0000 (UTC)
Subject: Re: [PATCH v3 0/9] qapi: untie 'if' conditions from C preprocessor
To: Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>
References: <20210429134032.1125111-1-marcandre.lureau@redhat.com>
 <YJq2SXW1kSyDZ7WX@stefanha-x1.localdomain>
 <CAJ+F1CJ4FNGJj7pVP90njGeyB0REoeBOf=29_6u-QCmJM+LSzA@mail.gmail.com>
 <87im3ndf10.fsf@dusky.pond.sub.org>
From: John Snow <jsnow@redhat.com>
Message-ID: <d1cf00bb-edb7-696b-0172-cb532fa573ab@redhat.com>
Date: Wed, 12 May 2021 14:58:40 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <87im3ndf10.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Stefan Hajnoczi <stefanha@gmail.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/12/21 1:43 PM, Markus Armbruster wrote:
> Marc-André Lureau <marcandre.lureau@gmail.com> writes:
> 
>> Hi Markus
>>
>> On Tue, May 11, 2021 at 8:53 PM Stefan Hajnoczi <stefanha@gmail.com> wrote:
>>
>>> On Thu, Apr 29, 2021 at 05:40:23PM +0400, marcandre.lureau@redhat.com
>>> wrote:
>>>> From: Marc-André Lureau <marcandre.lureau@redhat.com>
>>>>
>>>> Hi,
>>>>
>>>> This series makes the 'if' conditions less liberal, by formalizing a
>>> simple
>>>> expression tree based on bare boolean logic of configure option
>>> identifiers.
>>>>
>>>> (this allows to express conditions in Rust in my QAPI-Rust PoC series)
>>>>
>>>> This is based on John Snow QAPI pt4:
>>>> https://patchew.org/QEMU/20210421192233.3542904-1-jsnow@redhat.com/
>>>>
>>>> Based-on: <20210421192233.3542904-2-jsnow@redhat.com>
>>>>
>>>
>>
>> The patch series applies cleanly on top of master now. I checked no
>> regression between each commit, including python style checks.
> 
> Appears to conflict with John's "[PATCH v2 00/21] qapi: static typing
> conversion, pt5a".  I didn't examine the conflicts.
> 
> Since I reviewed John's v1 recently, and git-range-diff to v2 looks
> fairly innocent at a glance, I'd prefer not to rock that boat.  Let's
> discuss what to do as soon as I reviewed John's v2.
> 

It should hopefully be very minimal. I advised Marc-Andre to rebase on 
master as this series did not appear to touch the parser. Conflict 
should be minimal-ish.

(Maybe it's clashing in Schema just a little bit? I do touch schema.py 
very gently...)

>> If you are overloaded, can I make a pull request for it?
> 
> Not yet, please.
> 

As soon as I am done sending a new version of my Python packaging and CI 
series I will run this through the wringer and give my reviews.

--js


