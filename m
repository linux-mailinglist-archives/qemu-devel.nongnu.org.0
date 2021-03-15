Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB40933BF11
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 15:55:24 +0100 (CET)
Received: from localhost ([::1]:49076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLoct-0007kO-Ss
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 10:55:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lLobQ-0006m2-M1
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 10:53:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:50742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lLobO-0004nK-Hv
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 10:53:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615820029;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b3+aRkw1RhCxgnl1JDfuuaGjnhS7BH6kq6CwWUuFdRs=;
 b=IxsfF9CPp2arHeasP9jesmJbNzaFIi7t290CfYWqJxA+3qNlv/aLgto2WbVjZc//glSy1g
 ahOvswAff3pLFa6gEu7+qEffALoFEx7qR1JR1hL3IQLdkHE/4q8b7NGr9PlKfncrdV4zvX
 SQzoPbqx1GWYAKrJuYs+fasHJ9GUYfc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-480-b6udnjWcNpCVfbgZuJNKEg-1; Mon, 15 Mar 2021 10:53:46 -0400
X-MC-Unique: b6udnjWcNpCVfbgZuJNKEg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B061D80006E;
 Mon, 15 Mar 2021 14:53:44 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-72.ams2.redhat.com [10.36.112.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3F23F614ED;
 Mon, 15 Mar 2021 14:53:43 +0000 (UTC)
Subject: Re: [PATCH 2/2] util/compatfd.c: Replaced a malloc call with g_malloc.
To: Markus Armbruster <armbru@redhat.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>
References: <20210315105814.5188-1-ma.mandourr@gmail.com>
 <20210315105814.5188-3-ma.mandourr@gmail.com>
 <210a44d9-ab4c-5863-1556-d5a7c368adc2@redhat.com>
 <CAD-LL6g9Aha-PZpBPiNK09JkDavL0dM8cwKzcysj2MUxwQQ6Mg@mail.gmail.com>
 <87im5sfq9m.fsf@dusky.pond.sub.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <5d7e1480-ca56-b830-d51d-32d51eab18be@redhat.com>
Date: Mon, 15 Mar 2021 15:53:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <87im5sfq9m.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15/03/2021 15.25, Markus Armbruster wrote:
> Mahmoud, it's generally a good idea to cc: people who commented on a
> previous iteration of the same patch.  In this case, Thomas.  I'm doing
> that for you now.
> 
> Mahmoud Mandour <ma.mandourr@gmail.com> writes:
> 
>> On Mon, Mar 15, 2021 at 1:13 PM Philippe Mathieu-Daudé <philmd@redhat.com>
>> wrote:
>>
>>> Hi Mahmoud,
>>>
>>> On 3/15/21 11:58 AM, Mahmoud Mandour wrote:
>>>> Replaced a call to malloc() and its respective call to free()
>>>> with g_malloc() and g_free().
>>>>
>>>> g_malloc() is preferred more than g_try_* functions, which
>>>> return NULL on error, when the size of the requested
>>>> allocation  is small. This is because allocating few
>>>> bytes should not be a problem in a healthy system.
>>>> Otherwise, the system is already in a critical state.
>>>>
>>>> Subsequently, removed NULL-checking after g_malloc().
>>>>
>>>> Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
>>>> ---
>>>>   util/compatfd.c | 8 ++------
>>>>   1 file changed, 2 insertions(+), 6 deletions(-)
>>>>
>>>> diff --git a/util/compatfd.c b/util/compatfd.c
>>>> index 174f394533..a8ec525c6c 100644
>>>> --- a/util/compatfd.c
>>>> +++ b/util/compatfd.c
>>>> @@ -72,14 +72,10 @@ static int qemu_signalfd_compat(const sigset_t *mask)
>>>>       QemuThread thread;
>>>>       int fds[2];
>>>>
>>>> -    info = malloc(sizeof(*info));
>>>> -    if (info == NULL) {
>>>> -        errno = ENOMEM;
>>>> -        return -1;
>>>> -    }
>>>> +    info = g_malloc(sizeof(*info));
>>>
>>> Watch out...
>>>
>>> https://developer.gnome.org/glib/stable/glib-Memory-Allocation.html
>>>
>>>    If any call to allocate memory using functions g_new(), g_new0(),
>>>    g_renew(), g_malloc(), g_malloc0(), g_malloc0_n(), g_realloc(),
>>>    and g_realloc_n() fails, the application is terminated.
>>>
>>> So with your change instead of handling ENOMEM the QEMU process is
>>> simply killed.
>>>
>>> Don't you want to use g_try_new(struct sigfd_compat_info, 1) here
>>> instead?
>>>
>>>>
>>>>       if (pipe(fds) == -1) {
>>>> -        free(info);
>>>> +        g_free(info);
>>>>           return -1;
>>>>       }
>>>>
>>>>
>>>
>>>
>> Hello Mr. Philippe,
>>
>> That's originally what I did and I sent a patch that uses a g_try_*
>> variant, and was
>> instructed by Mr. Thomas Huth that it was better to use g_malloc instead

No need to say "Mr." here ... we're not that formal on this mailing list 
here :-)

>> because this is a small allocation and the process is better killed if such
>> an allocation fails because the system is already in a very critical state
>> if it does not handle a small allocation well.
> 
> You even explained this in the commit message.  Appreciated.
> 
>> You can find Mr. Thomas reply to my previous patch here:
>> Re: [PATCH 5/8] util/compatfd.c: Replaced a malloc with GLib's variant
>> (gnu.org)
>> <https://lists.gnu.org/archive/html/qemu-devel/2021-03/msg05067.html>
>>
>> You can instruct me on what to do further.
> 
> I figure this patch is fine.  Thomas?

Yes, looks good now, thanks for the update, Mahmoud!

Reviewed-by: Thomas Huth <thuth@redhat.com>


