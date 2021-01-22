Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B12C300B2C
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 19:26:05 +0100 (CET)
Received: from localhost ([::1]:54414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l318G-0000LP-EI
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 13:26:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l313D-00011d-Dh
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 13:20:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:43428)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l313A-0007XY-W6
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 13:20:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611339648;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cccbrQUYKsX4M33r570q31j287A4JahzmcAjvmDhSaw=;
 b=EhIMW0dqfvNENLLL1rks4KzHljIaQqrkUj3xtLvP6e2j5Mzggdqv3MLww9am3QBWbFR04Q
 1gcT8/Rp/qaUhJG/HCf0abmDOMyO+ihtx5GuvaWo3QPVYWfQ6GdBwqd8Hv4ASsxcIak30G
 VHSKXhNxYlsZWQi+1sBvTYingA2nwmI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-210-gsEK7lpiNWStq7pootChBg-1; Fri, 22 Jan 2021 13:20:42 -0500
X-MC-Unique: gsEK7lpiNWStq7pootChBg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B5644DB8F0
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 18:19:49 +0000 (UTC)
Received: from [10.3.113.116] (ovpn-113-116.phx2.redhat.com [10.3.113.116])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0C89A2BFE9;
 Fri, 22 Jan 2021 18:19:45 +0000 (UTC)
To: Max Reitz <mreitz@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
 qemu-devel@nongnu.org
References: <20210122102041.27031-1-mreitz@redhat.com>
 <10be5fcc-5e7a-3e44-3229-8526ad3b4547@redhat.com>
 <3e6b417c-eebb-dc6a-da7d-af2295118c6a@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Subject: Re: [PATCH] coroutine-sigaltstack: Keep SIGUSR2 handler up
Message-ID: <30d27bfa-770f-4edb-6f4b-9a1cd2eb2833@redhat.com>
Date: Fri, 22 Jan 2021 12:19:45 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <3e6b417c-eebb-dc6a-da7d-af2295118c6a@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.182,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.221, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/22/21 11:58 AM, Max Reitz wrote:

>>> +    if (!self) {
>>> +        /*
>>> +         * This SIGUSR2 came from an external source, not from
>>> +         * qemu_coroutine_new(), so perform the default action.
>>> +         */
>>> +        exit(0);
>>> +    }
>>
>> (2) exit() is generally unsafe to call in signal handlers.
>>
>> We could reason whether or not it is safe in this particular case (POSIX
>> describes the exact conditions --
>> <https://pubs.opengroup.org/onlinepubs/9699919799/functions/V2_chap02.html#tag_15_04_03_03>),
>>
>> but it's much simpler to just call _exit().
>>
>>
>> (3) "Performing the default action" would be slightly different from
>> calling _exit(). When a process is terminated with a signal, the parent
>> can distinguish that, when reaping the child. See waitpid() /
>> WIFSIGNALED() / WTERMSIG(), versus WIFEXITED() / WEXITSTATUS().
>>
>> So for the "default action", we'd have to:
>> - restore the SIGUSR2 handler to SIG_DFL, and
>> - re-raise the signal for the thread, and
>> - because the signal being handled is automatically blocked unless
>>    SA_NODEFER was set: unblock the signal for the thread.
>>
>> The pthread_sigmask() call, made for the last step, would be the one
>> that would not return.
>>
>> *However*, all of this complexity is not really useful here. We don't
>> really want to simulate being "forcefully terminated" by the unexpected
>> (asynchronous) SIGUSR2. We just want to exit.
>>
>> Therefore, _exit() is fine. But, we should use an exit code different
>> from 0, as this is definitely not a pristine exit from QEMU. I'm not
>> sure if a convention exists for nonzero exit codes in QEMU; if not, then
>> just pass EXIT_FAILURE to _exit().
> 
> I’m fine with calling _exit().  I hope, Eric is, too (as long as the
> comment no longer claims this were the default behavior).

Using _exit(nonzero) is fine by me as long as the comment is accurate.
There are signals like SIGINT where you really DO want to terminate by
signal rather than using _exit(SIGINT+128), because shells can tell the
difference [1]; but SIGUSR2 is not one of the signals where shells
special-case their behavior.

[1] https://www.cons.org/cracauer/sigint.html

> 
> Given that SIGUSR2 is not something that qemu is prepared to receive
> from the outside, EXIT_FAILURE seems right to me.  (Even abort() could
> be justified, but I don’t think generating a core dump does any good here.)
> 
> (As for qemu-specific exit code conventions, the only ones I know of are
> for certain qemu-img subcommands.  I’m sure you grepped, too, but I
> can’t find anything for the system emulator.)
> 
>> (4) Furthermore, please update the comment, because "perform the default
>> action" is not precise.
> 
> Sure, that’s definitely easier than to re-raise SIGUSR2.

Works for me as well.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


