Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B7C32193BD
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jul 2020 00:45:47 +0200 (CEST)
Received: from localhost ([::1]:52060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jtIp0-0007K3-Cv
	for lists+qemu-devel@lfdr.de; Wed, 08 Jul 2020 18:45:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jtIQk-0000FN-CR
 for qemu-devel@nongnu.org; Wed, 08 Jul 2020 18:20:42 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:46759
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jtIQi-0000xY-8X
 for qemu-devel@nongnu.org; Wed, 08 Jul 2020 18:20:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594246837;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=2v5buOX8cXrZxODG1qED969k6BlLesjQgiUhtmCibew=;
 b=HprrbvUdzEEbkXDZGDhrv/vq3wZEM2h4nowN5tV/jEmodYAf3MCuaXdKHH7jUT7vhItzYF
 0o71+oiX7uv47bifMwS2Ol0OS10OT0oAABBJ8/h1Ae+J2UEv49KtfeP0YaMkOjcFmz4YYA
 7xzDLwFljOmfTvpnG8CIgWOLlaAeM0w=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-500-e_2mMxOfOz2HoeaDUHcPkQ-1; Wed, 08 Jul 2020 09:19:12 -0400
X-MC-Unique: e_2mMxOfOz2HoeaDUHcPkQ-1
Received: by mail-ed1-f69.google.com with SMTP id y92so54520920eda.12
 for <qemu-devel@nongnu.org>; Wed, 08 Jul 2020 06:19:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=2v5buOX8cXrZxODG1qED969k6BlLesjQgiUhtmCibew=;
 b=GtJFiyYo2Zykz96YshcSmC7NBXhjhXThhTd+5Mn+5Kv2WZAx3wHD7UVCD94fjg71VR
 kb/wpDWRSIE1dwl0y3zjK5plLO4Z44aQFI9t7jFpMNHIYswVso4byCVWYAbU+0lhtErm
 ERuTJlmrg5PZZxUeLTG2V0uwr4QbTAddJGFzTLmEI4X3F5i+7x1TVa7Dg/VmjwJu67FJ
 /qUF4mFg83mwNKzVdUTDWcf8o2tFFV0E1+CPpG6nUiEADFrCfJ/dc2LTyHOBaQq4CoY4
 iGtTgb5nglxaseIyF/2VY97dnbJSmqBbMy8O6SsYXO6Txvd3SCwwIRbhBxPIrJKVoEL6
 BJXw==
X-Gm-Message-State: AOAM5337rXbUXrCaHqQvBSIPEecQoDRlKZdfqTi1GtCVOQPhlDeOiy8Y
 JkyrcbEm1aKvUOd4d0tuHqGy0Y0DyGUTI1YCdtXrpC1srLW3PZ50dMlPAkVgKfx9RhTxjGDN0JH
 4VMWhQ9EDF6UMe3U=
X-Received: by 2002:a17:906:4c2:: with SMTP id
 g2mr48907805eja.299.1594214351334; 
 Wed, 08 Jul 2020 06:19:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwfIM1pCPAO4SBggEb1Kl2MsMTMsNe0qWLPbH7U8992475NJtCfqCoF5aUCjIPcKVZJbpE3Vw==
X-Received: by 2002:a17:906:4c2:: with SMTP id
 g2mr48907785eja.299.1594214351098; 
 Wed, 08 Jul 2020 06:19:11 -0700 (PDT)
Received: from [192.168.1.36] (138.red-83-57-170.dynamicip.rima-tde.net.
 [83.57.170.138])
 by smtp.gmail.com with ESMTPSA id d16sm1979049ejo.31.2020.07.08.06.19.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Jul 2020 06:19:10 -0700 (PDT)
Subject: Re: Migrating custom qemu.org infrastructure to GitLab
To: Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Stefan Hajnoczi <stefanha@gmail.com>
References: <CAJSP0QV3uB4QY6mzw2JFDedr0PJhGkU5FdmLF5PbjMPyxiYSuw@mail.gmail.com>
 <20200708105353.GE3229307@redhat.com>
 <477ce8e8-283e-6f3e-d3ed-c7f758eaebdb@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Autocrypt: addr=philmd@redhat.com; keydata=
 mQINBDXML8YBEADXCtUkDBKQvNsQA7sDpw6YLE/1tKHwm24A1au9Hfy/OFmkpzo+MD+dYc+7
 bvnqWAeGweq2SDq8zbzFZ1gJBd6+e5v1a/UrTxvwBk51yEkadrpRbi+r2bDpTJwXc/uEtYAB
 GvsTZMtiQVA4kRID1KCdgLa3zztPLCj5H1VZhqZsiGvXa/nMIlhvacRXdbgllPPJ72cLUkXf
 z1Zu4AkEKpccZaJspmLWGSzGu6UTZ7UfVeR2Hcc2KI9oZB1qthmZ1+PZyGZ/Dy+z+zklC0xl
 XIpQPmnfy9+/1hj1LzJ+pe3HzEodtlVA+rdttSvA6nmHKIt8Ul6b/h1DFTmUT1lN1WbAGxmg
 CH1O26cz5nTrzdjoqC/b8PpZiT0kO5MKKgiu5S4PRIxW2+RA4H9nq7nztNZ1Y39bDpzwE5Sp
 bDHzd5owmLxMLZAINtCtQuRbSOcMjZlg4zohA9TQP9krGIk+qTR+H4CV22sWldSkVtsoTaA2
 qNeSJhfHQY0TyQvFbqRsSNIe2gTDzzEQ8itsmdHHE/yzhcCVvlUzXhAT6pIN0OT+cdsTTfif
 MIcDboys92auTuJ7U+4jWF1+WUaJ8gDL69ThAsu7mGDBbm80P3vvUZ4fQM14NkxOnuGRrJxO
 qjWNJ2ZUxgyHAh5TCxMLKWZoL5hpnvx3dF3Ti9HW2dsUUWICSQARAQABtDJQaGlsaXBwZSBN
 YXRoaWV1LURhdWTDqSAoUGhpbCkgPHBoaWxtZEByZWRoYXQuY29tPokCVQQTAQgAPwIbDwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4AWIQSJweePYB7obIZ0lcuio/1u3q3A3gUCXsfWwAUJ
 KtymWgAKCRCio/1u3q3A3ircD/9Vjh3aFNJ3uF3hddeoFg1H038wZr/xi8/rX27M1Vj2j9VH
 0B8Olp4KUQw/hyO6kUxqkoojmzRpmzvlpZ0cUiZJo2bQIWnvScyHxFCv33kHe+YEIqoJlaQc
 JfKYlbCoubz+02E2A6bFD9+BvCY0LBbEj5POwyKGiDMjHKCGuzSuDRbCn0Mz4kCa7nFMF5Jv
 piC+JemRdiBd6102ThqgIsyGEBXuf1sy0QIVyXgaqr9O2b/0VoXpQId7yY7OJuYYxs7kQoXI
 6WzSMpmuXGkmfxOgbc/L6YbzB0JOriX0iRClxu4dEUg8Bs2pNnr6huY2Ft+qb41RzCJvvMyu
 gS32LfN0bTZ6Qm2A8ayMtUQgnwZDSO23OKgQWZVglGliY3ezHZ6lVwC24Vjkmq/2yBSLakZE
 6DZUjZzCW1nvtRK05ebyK6tofRsx8xB8pL/kcBb9nCuh70aLR+5cmE41X4O+MVJbwfP5s/RW
 9BFSL3qgXuXso/3XuWTQjJJGgKhB6xXjMmb1J4q/h5IuVV4juv1Fem9sfmyrh+Wi5V1IzKI7
 RPJ3KVb937eBgSENk53P0gUorwzUcO+ASEo3Z1cBKkJSPigDbeEjVfXQMzNt0oDRzpQqH2vp
 apo2jHnidWt8BsckuWZpxcZ9+/9obQ55DyVQHGiTN39hkETy3Emdnz1JVHTU0Q==
Message-ID: <67032ba5-41fc-8890-29b1-44d27d75f313@redhat.com>
Date: Wed, 8 Jul 2020 15:19:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <477ce8e8-283e-6f3e-d3ed-c7f758eaebdb@redhat.com>
Content-Language: en-US
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/07 17:25:10
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Cleber Rosa <cleber@redhat.com>,
 Jeff Cody <codyprime@gmail.com>, qemu-devel <qemu-devel@nongnu.org>,
 Michael Roth <mdroth@linux.vnet.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/8/20 1:48 PM, Thomas Huth wrote:
> On 08/07/2020 12.53, Daniel P. Berrangé wrote:
>> On Wed, Jul 08, 2020 at 10:52:38AM +0100, Stefan Hajnoczi wrote:
> [...]
>>> With this in mind I propose moving qemu.org infrastructure to GitLab
>>> incrementally. [...]
> 
> FWIW, I think moving the QEMU infrastructure zoo to GitLab is a very
> good idea!
> 
> Daniel already mentioned most of the things that I had in mind after
> reading your mail (well, actually he mentioned way more things that I
> had in mind), but let me add some sentences below anyway...

Same comment ;)

I find sometime confusing the see which GitLab features are restricted
to the paid version and which are available for open source projects.

>>> 5. Issue tracking. Launchpad more or less works, but the login always
>>> bothers me. If we move git repo hosting then it makes sense to do
>>> issue tracking on GitLab too.
>>
>> The big thing that always bothers me about launchpad is how easy it
>> is to get confused between issues for QEMU upstream and issues for
>> legacy releases in Ubuntu distro.
> 
> +1000 !
> 
> I was already thinking of suggesting to move the bug tracker to either
> gitlab or github or anywhere else during next KVM forum, since it is
> IMHO a real pain.
> 
> I've seen so many bugs that users tried to open against the downstream
> Ubuntu QEMU package but ended up in the upstream tracker instead. Apart
> from that, the Launchpad UI is partly really horrible in my eyes (for
> example you never know which action will trigger an immediate change and
> which needs to be confirmed by pressing a button). Additional many
> developers don't have a Launchpad account, so bugs can not be assigned
> properly and you just have to pray that people see the notification
> e-mails on the mailing list.
> 
>> There is a question of what todo with existing bugs in launchpad.
>>
>> Essentially three choices
>>
>>  1. Move all the open bugs to gitlab
>>  2. Move some relevant bugs to gitlab, but close outdated ones
>>  3. Leave existing launchpad bugs but don't allow new ones filed
> 
> I think we could set most (outdated) bugs simply to "incomplete" with a
> message saying that the reporter should open a new bug on Gitlab if
> necessary. Then after 60 days, the "incomplete" bugs will expire (i.e.
> auto-close).

Some users hide their email on launchpad, so we would be hard to simply
re-import their bug on gitlab. Now if you ask them to import it, it is
easier. 60 days seem enough to react.

Something that always bugged me on launchpad is you can not Cc other
people on a bug if they don't have a launchpad account. I haven't
checked if GitLab allows that (Bugzilla does).

We should do some experiments first, because I saw various ways to use
the GitLab ticket tags, and none convinced me it is practical.

Should anyone add any tag? Should we restrict to a set of useful tags?

Current launchpad tags:

    35 arm
    21 linux-user
    17 qemu
    16 ppc
    15 windows
    13 testcase
    11 tcg
    9 mips
    9 usb
    9 qemu-img
    6 i386
    6 feature-request
    2 sh4
    2 patch
    1 s390x
    1 sparc

The patterns I see:

- user-mode vs softmmu
  (linux-user)

- one tag per architecture
  (arm / ppc / mips / i386 / sh4 / s390x / sparc)

- host OS
  (windows)

- accelerator
  (tcg)

- subsystem
  (usb)

- tools
  (qemu-img)

- feature requests

- testcase

I suppose tags are hints to maintainers, so keeping something similar to
the MAINTAINERS file separation could be useful.

Note the GitLab roles:
https://docs.gitlab.com/ee/development/permissions.html

    No access (0)
    Guest (10)
    Reporter (20)
    Developer (30)
    Maintainer (40)
    Owner (50)


