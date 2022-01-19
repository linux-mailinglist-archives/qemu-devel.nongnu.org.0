Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F2E9493C09
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 15:39:37 +0100 (CET)
Received: from localhost ([::1]:60746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAC7b-0006r9-Ks
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 09:39:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nABGJ-0002kl-2z
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 08:44:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52251)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nABGF-0003ZZ-0T
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 08:44:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642599861;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fUSmrgsN9eydas2Uu0d0fekvt0zTHNokOXxF35vlWc8=;
 b=ELxdL6iQLx1eU8imf6N9585VrNMe3AzsqAd4rFFvC6hBWHpoR9TahrzwHhkssXJJDbPRpb
 VaGUY27gwgmarUagBcVHKV8xNWp9Efnu01XoS4gW5/TcxQwGPwhML7TJplUhguIKjkYOZP
 d17T4LTrSDJ5oL2AfmN1f2eazoekyR8=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-611-rZyN5crWMwCJo_exbcHE9w-1; Wed, 19 Jan 2022 08:44:19 -0500
X-MC-Unique: rZyN5crWMwCJo_exbcHE9w-1
Received: by mail-ed1-f72.google.com with SMTP id
 z6-20020a50eb46000000b00403a7687b5bso2413590edp.3
 for <qemu-devel@nongnu.org>; Wed, 19 Jan 2022 05:44:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=fUSmrgsN9eydas2Uu0d0fekvt0zTHNokOXxF35vlWc8=;
 b=b9HnqPVD02ngCPp1HotFldS2dHoJoCYK4jmK4hCUkbgMOE97kuU1WuKEXtP0NoUy49
 /3ZYsmmmZGn4/DKwRJ/HcyWmtFi9UqP8yeqAXFw8JBc2vsUXGQlgBwoT57gyZIyambUd
 X8KfVl3YSB4vrBAayLOW6OS59XMw3iW1YOT0feCjw8MI1UbSvbFmH4QorXyPtuE9qOnB
 2lpppbno7wD1VQcz6Hjy/l+7I+T0lEIBm5OWlgK5brMHBRUn7KL2D52LJPSo2RAp1cWI
 k8YTJ9VFn5BySBU8lTi+bNBVO9vniImQIRNJP1hg8T7uIMNpmgkm5Q5DdYJ0Faz0pY24
 loug==
X-Gm-Message-State: AOAM5309NhWStFfk7M1s9jcO8aTE8zqUjXXSoHzvfK/Zs+Pp79lEe1iy
 vgUsMi4L1kfp3aT5AD32Gj3g8flJgiAP1ah5JATCq9XCEOykZIjm5p9kQH6MItN8G4KI2DjXMSk
 wjPYuKmK1BctSuD0=
X-Received: by 2002:a7b:c10b:: with SMTP id w11mr3715067wmi.192.1642599858638; 
 Wed, 19 Jan 2022 05:44:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzJ20xw1WNElreaMQT4cJhPuKngVZAJaAU4HMRUcG/0+tw5G4uYz0pN5gmDC667AzycTLb6Ug==
X-Received: by 2002:a7b:c10b:: with SMTP id w11mr3715038wmi.192.1642599858381; 
 Wed, 19 Jan 2022 05:44:18 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id a3sm23993239wri.89.2022.01.19.05.44.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Jan 2022 05:44:18 -0800 (PST)
Message-ID: <4a15fbad-b177-f35c-1468-ef14f7ab1887@redhat.com>
Date: Wed, 19 Jan 2022 14:44:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 1/3] qsd: Add pre-init argument parsing pass
To: Markus Armbruster <armbru@redhat.com>
References: <20211222114153.67721-1-hreitz@redhat.com>
 <20211222114153.67721-2-hreitz@redhat.com>
 <87zgnrubkf.fsf@dusky.pond.sub.org>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <87zgnrubkf.fsf@dusky.pond.sub.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19.01.22 13:58, Markus Armbruster wrote:
> Hanna Reitz <hreitz@redhat.com> writes:
>
>> We want to add a --daemonize argument to QSD's command line.
> Why?

OK, s/we/I/.  I find it useful, because without such an option, I need 
to have whoever invokes QSD loop until the PID file exists, before I can 
be sure that all exports are set up.  I make use of it in the test cases 
added in patch 3.

I suppose this could be worked around with a special character device, 
like so:

```
ncat --listen -U /tmp/qsd-done.sock </dev/null &
ncat_pid=$!

qemu-storage-daemon \
     ... \
     --chardev socket,id=signal_done,path=/tmp/qsd-done.sock \
     --monitor signal_done \
     --pidfile /tmp/qsd.pid &

wait $ncat_pid
```

But having to use an extra tool for this is unergonomic.  I mean, if 
there’s no other way...

>>                                                                This will
>> require forking the process before we do any complex initialization
>> steps, like setting up the block layer or QMP.  Therefore, we must scan
>> the command line for it long before our current process_options() call.
> Can you explain in a bit more detail why early forking is required?
>
> I have a strong dislike for parsing more than once...

Because I don’t want to set up QMP and block devices, and then fork the 
process into two.  That sounds like there’d be a lot of stuff to think 
about, which just isn’t necessary, because we don’t need to set up any 
of this in the parent.

For example, if I set up a monitor on a Unix socket (server=true), 
processing is delayed until the client connects.  Say I put --daemonize 
afterwards.  I connect to the waiting server socket, the child is forked 
off, and then... I’m not sure what happens, actually.  Do I have a 
connection with both the parent and the child listening?  I know that in 
practice, what happens is that once the parent exits, the connection is 
closed, and I get a “qemu: qemu_thread_join: Invalid argument” 
warning/error on the QSD side.

There’s a lot of stuff to think about if you allow forking after other 
options, so it should be done first.  We could just require the user to 
put --daemonize before all other options, and so have a single pass; but 
still, before options are even parsed, we have already for example 
called bdrv_init(), init_qmp_commands(), qemu_init_main_loop().  These 
are all things that the parent of a daemonizing process doesn’t need to 
do, and where I’d simply rather not think about what impact it has if we 
fork afterwards.

Hanna

>> Instead of adding custom new code to do so, just reuse process_options()
>> and give it a @pre_init_pass argument to distinguish the two passes.  I
>> believe there are some other switches but --daemonize that deserve
>> parsing in the first pass:
>>
>> - --help and --version are supposed to only print some text and then
>>    immediately exit (so any initialization we do would be for naught).
>>    This changes behavior, because now "--blockdev inv-drv --help" will
>>    print a help text instead of complaining about the --blockdev
>>    argument.
>>    Note that this is similar in behavior to other tools, though: "--help"
>>    is generally immediately acted upon when finding it in the argument
>>    list, potentially before other arguments (even ones before it) are
>>    acted on.  For example, "ls /does-not-exist --help" prints a help text
>>    and does not complain about ENOENT.
>>
>> - --pidfile does not need initialization, and is already exempted from
>>    the sequential order that process_options() claims to strictly follow
>>    (the PID file is only created after all arguments are processed, not
>>    at the time the --pidfile argument appears), so it makes sense to
>>    include it in the same category as --daemonize.
>>
>> - Invalid arguments should always be reported as soon as possible.  (The
>>    same caveat with --help applies: That means that "--blockdev inv-drv
>>    --inv-arg" will now complain about --inv-arg, not inv-drv.)
>>
>> Note that we could decide to check only for --daemonize in the first
>> pass, and defer --help, --version, and checking for invalid arguments to
>> the second one, thus largely keeping our current behavior.  However,
>> this would break "--help --daemonize": The child would print the help
>> text to stdout, which is redirected to /dev/null, and so the text would
>> disappear.  We would need to have the text be printed to stderr instead,
>> and this would then make the parent process exit with EXIT_FAILURE,
>> which is probably not what we want for --help.
>>
>> This patch does make some references to --daemonize without having
>> implemented it yet, but that will happen in the next patch.
>>
>> Signed-off-by: Hanna Reitz <hreitz@redhat.com>


