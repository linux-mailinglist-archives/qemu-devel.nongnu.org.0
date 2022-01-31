Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D684A4BF0
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 17:26:58 +0100 (CET)
Received: from localhost ([::1]:58646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEZW5-00020d-2Q
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 11:26:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nEYwL-0004oq-Nj; Mon, 31 Jan 2022 10:50:01 -0500
Received: from [2a00:1450:4864:20::32f] (port=53795
 helo=mail-wm1-x32f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nEYwH-0002eq-73; Mon, 31 Jan 2022 10:49:59 -0500
Received: by mail-wm1-x32f.google.com with SMTP id n8so10541257wmk.3;
 Mon, 31 Jan 2022 07:49:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=FDvreU7ETbQnHxWepLWi3XnJy5mevJOVWTFzISdSmgg=;
 b=nZTYkRMy3JFwr5oUIPSKCvl46YG8E5DU4Ib+cj/Qk8jeL/pkGiEI3w3DqLkeGy4Kns
 f7xTjnDxPjz1obkXxEm99/R9yKHm9jtGz4dNIowAe9QJ+wq3Bk9em+zpswAHRBkj1vFl
 94pmUVO3+t4Gb1JzuzekbI/l8WbF1jsMH91d0Q4RwaKkff+uFttCjxVp1TRlv6YhndgF
 KVJkV+ZNnjtT17KYb3lQj+qgBXbj8dB0GJVqz5SRtaYY8uUiqOzzyS9tjSjK9WP3twUa
 fjOPhR/0nxY0i1axKBdimyK1waW94k8zH4HIolfxS22k5fQAvR21jWzwB38aQNb3NXn8
 Nk/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=FDvreU7ETbQnHxWepLWi3XnJy5mevJOVWTFzISdSmgg=;
 b=OJXTf7wRmh+vLcJ9IF/+P4kDxkOROWUY/QExYknJnYtKlK+YYTYVZKrZt9FUwF0E7y
 l0Aqhf1j9MmU4WOqmWU6gowmf17Buu4yCqDA/+RNbac+KYrPe68Am2nCMy8ohqsL1Num
 qeulGsq9NM9uMfmFKHUxR45E+e0AOzgQU35nyKx9+Fa0wEzkpFAQJYptIe5nY3WJhnS8
 1vcZX/oPdK1Aj9uF/lyYwhu1pLk7D3dljZ4pqEiXlgoUUV0v/w8nBbwK2S4ncQDGEHlV
 nGScXnLRHOhati8+Y+uMKGFshcZQt3b+APX7Yzn2ebn0yV0QPOgNRtuvoZvJLbUq/E/h
 +JHA==
X-Gm-Message-State: AOAM533S0Bd4JHiLR3iu4gL0thWn95/XOc4zdT02pXBHCivS52+sY1+k
 63LIlWJl6qEjRZXNXfMwwVk=
X-Google-Smtp-Source: ABdhPJz5Sr5lbuDVV0D1Y7q2PCoZuWXDo6IHZO30IcfVHm5V4KyIkr5OxLjmnQHWn8DqL0f7+Xbmag==
X-Received: by 2002:a05:600c:1e0f:: with SMTP id
 ay15mr18954162wmb.133.1643644179854; 
 Mon, 31 Jan 2022 07:49:39 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id k20sm6063449wmi.36.2022.01.31.07.49.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Jan 2022 07:49:39 -0800 (PST)
Message-ID: <3fa2d527-91f6-0869-d6b0-c82bdd04884c@redhat.com>
Date: Mon, 31 Jan 2022 16:49:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v6 01/33] main-loop.h: introduce qemu_in_main_thread()
Content-Language: en-US
To: Kevin Wolf <kwolf@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>
References: <20220121170544.2049944-1-eesposit@redhat.com>
 <20220121170544.2049944-2-eesposit@redhat.com> <YfJ6dsVcmB4Uc2rO@redhat.com>
 <7ada78d2-0978-8f5a-f0f8-318d2f26ba41@redhat.com>
 <YffzLaIhjgfBkcXf@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <YffzLaIhjgfBkcXf@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Eduardo Habkost <eduardo@habkost.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-block@nongnu.org, Juan Quintela <quintela@redhat.com>,
 John Snow <jsnow@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Greg Kurz <groug@kaod.org>,
 qemu-ppc@nongnu.org, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, "Denis V. Lunev" <den@openvz.org>,
 Eric Blake <eblake@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/31/22 15:33, Kevin Wolf wrote:
> I feel "use this function if your code is going to be used by unit
> tests, but use qemu_mutex_iothread_locked() otherwise" is a very strange
> interface. I'm relatively sure that qemu_mutex_iothread_locked() isn't
> primarily used to make unit tests crash.

qemu_mutex_iothread_locked() should never be used in the block layer, 
because programs that use the block layer might not call an iothread 
lock, and indeed only the emulator have an iothread lock.

Making it always true would be okay when those programs were 
single-threaded, but really they all had worker threads so it was 
changed to false by commit 5f50be9b58 ("async: the main AioContext is 
only "current" if under the BQL", 2021-06-18).

> Documentation and the definition of the interface of a function
> shouldn't be about the caller, but about the semantics of the function
> itself. So, which question does qemu_mutex_iothread_locked() answer, and
> which question does qemu_in_main_thread() answer?

qemu_mutex_iothread_locked() -> Does the program have exclusive access 
to the emulator's globals.

qemu_in_main_thread() -> Does the program have access to the block 
layer's globals.  In emulators this is governed by the iothread lock, 
elsewhere they are accessible only from the home thread of the initial 
AioContext.

So, in emulators it is the same question, but in the block layer one of 
them is actually meaningless.

Really the "bug" is that qemu_mutex_iothread_locked() should really not 
be used outside emulators.  There are just two uses, but it's hard to 
remove them.

So why are two functions needed?  Two reasons:

- stubs/iothread-lock.c cannot define qemu_mutex_iothread_locked() as 
"return qemu_get_current_aio_context() == qemu_get_aio_context();" 
because it would cause infinite recursion with 
qemu_get_current_aio_context()

- even if it could, frankly qemu_mutex_iothread_locked() is a horrible 
name, and in the context of the block layer it conflicts especially 
badly with the "iothread" concept.

Maybe we should embrace the BQL name and rename the functions that refer 
to the "iothread lock".  But then I don't want to have code in the block 
layer that refers to a "big lock".

>>> What are the use cases for the existing qemu_mutex_iothread_locked()
>>> stub where we rely on false being returned?
>>
>> I don't think we ever rely on stub being false. There are only 2
>> places where I see !qemu_mutex_iothread_locked(), and are in
>> helper_regs.c and cpus.c

We rely on it indirectly, here:

     AioContext *qemu_get_current_aio_context(void)
     {
         if (my_aiocontext) {
             return my_aiocontext;
         }
         if (qemu_mutex_iothread_locked()) {
             /* Possibly in a vCPU thread.  */
             return qemu_get_aio_context();
         }
         return NULL;
     }

which affects the behavior of aio_co_enter.  Before that patch, worker 
threads computed qemu_get_aio_context(), while afterwards they compute NULL.

This is not just for unit tests but also for qemu-storage-daemon and 
other block layer programs.

>> However, commit 5f50be9b5810293141bb53cfd0cb46e765367d56 changed the
>> stub to return false for a specific reason.
> 
> I must admit I don't really understand the reasoning there:
> 
>      With this change, the stub qemu_mutex_iothread_locked() must be changed
>      from true to false.  The previous value of true was needed because the
>      main thread did not have an AioContext in the thread-local variable,
>      but now it does have one.
> 
> This explains why it _can_ be changed to false for this caller, but not
> why it _must_ be changed.

See above: because it returns the wrong value for all threads except 
one, and there are better ways to do a meaningful check in that one 
thread: using qemu_get_current_aio_context(), which is what aio_co_enter 
did at the time and qemu_in_main_thread() does with Emanuele's change.

> So is the problem with the unit tests really just that they never call
> qemu_init_main_loop() and therefore never set the AioContext for the
> main thread?

No, most of them do (and if some are missing it we can add it).

Paolo

