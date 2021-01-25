Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 463E5302D68
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 22:18:21 +0100 (CET)
Received: from localhost ([::1]:45760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l49Fc-0008KH-9g
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 16:18:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1l49Dz-0007ft-JL
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 16:16:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:45552)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1l49Dx-0000SJ-Ev
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 16:16:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611609395;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WU/RZqBKDjKgz1SwSlevNcuaVcDiYqz1mtFCR5Ifzhg=;
 b=DwTiI47CsTsuqxWwtSnBp3+7e+cCxfPFalhXeIU0w46Kk6aKa1qahMzs4LBlsYe6uB8rkz
 5f//yJUrqDQ4HDi/U9QqI7up/qkdfqlUc+3Xg2+kiUQtLsI9q7gqaTcIwAyYbMCFEDAyL+
 J3Di42KXLC3RScYY1S32MZaYvTO1+RA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-538-MYL0X6NROu-kyLu3lypPMg-1; Mon, 25 Jan 2021 16:16:33 -0500
X-MC-Unique: MYL0X6NROu-kyLu3lypPMg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 66B851007463;
 Mon, 25 Jan 2021 21:16:32 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-112-67.ams2.redhat.com
 [10.36.112.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DA02E60938;
 Mon, 25 Jan 2021 21:16:26 +0000 (UTC)
Subject: Re: [PATCH] coroutine-sigaltstack: Keep SIGUSR2 handler up
To: Max Reitz <mreitz@redhat.com>, qemu-devel@nongnu.org
References: <20210122102041.27031-1-mreitz@redhat.com>
 <d68e5cc9-d6ba-2dac-04ad-49d5509cd836@redhat.com>
 <eef8237e-293a-b6e6-20be-fa004509fa05@redhat.com>
 <1121a803-98e7-6d41-119c-3d82717976ec@redhat.com>
 <cba8919b-0480-3520-6ad6-920bf9d4186e@redhat.com>
 <95b1fd67-e980-be70-addc-6f1ac5f95f3d@redhat.com>
 <3cfa7f82-866b-e8b7-3e61-bb3dedff3226@redhat.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <1bf1290d-cd19-dd9e-5ce4-a4ceca0c04e1@redhat.com>
Date: Mon, 25 Jan 2021 22:16:25 +0100
MIME-Version: 1.0
In-Reply-To: <3cfa7f82-866b-e8b7-3e61-bb3dedff3226@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lersek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=lersek@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 "=?UTF-8?Q?Daniel_P._Berrang=c3=a9?=" <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01/25/21 11:57, Max Reitz wrote:
> On 23.01.21 01:41, Laszlo Ersek wrote:
>> On 01/22/21 22:26, Laszlo Ersek wrote:
>>
>>> I'm drifting towards an overhaul of coroutine-sigaltstack, based on my
>>> personal understanding of POSIX, but given that I can absolutely not
>>> *test* coroutine-sigaltstack on the platforms where it actually matters,
>>> an "overhaul" by me would be reckless.
>>>
>>> I didn't expect these skeletons when I first read Max's "Thread safety
>>> of coroutine-sigaltstack" email :/
>>>
>>> Max, after having worked on top of your patch for a few hours, I
>>> officially endorse your mutex approach. I can't encourage you or myself
>>> to touch this code, in good conscience. It's not that it's "bad"; it's
>>> inexplicable and (to me) untestable.
> 
> On one hand, that’s too bad; on the other perhaps it’s just for the
> better to get all of this out of our minds again (for now)... O:)
> 
>> I'm attaching a patch (based on 0e3246263068). I'm not convinced that I
>> should take responsibility for this, given the lack of testability on my
>> end. So I'm not posting it stand-alone even as an RFC. I've built it and
>> have booted one of my existent domains with it, but that's all.
> 
> FWIW, it looks good to me.  We should keep it in mind if in the future
> for some reason sigaltstack becomes more important, but for now I’m not
> too sad to abort any improvement efforts.

OK -- so do you plan to post your mutex approach stand-alone? (Sorry if
that's already been done and I've missed it.)

I actually feel somewhat safe regarding my patch, as long as it is
*only* executed on Linux hosts, and on other hosts that claim
conformance to POSIX.

But, of course, this whole thing has come up because of OSX... and I
don't have the first clue about OSX. (For example whether sigsuspend()
on OSX is prone to a spurious wakeup in response to SIGCONT.)

Thanks
Laszlo


