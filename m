Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E7E42BB89D
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 22:55:41 +0100 (CET)
Received: from localhost ([::1]:56920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgENX-0002NK-V5
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 16:55:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <0x7f454c46@gmail.com>)
 id 1kgDne-00042C-MZ
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 16:18:34 -0500
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:40706)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <0x7f454c46@gmail.com>)
 id 1kgDnb-0006jZ-P2
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 16:18:34 -0500
Received: by mail-wm1-x344.google.com with SMTP id a3so11316642wmb.5
 for <qemu-devel@nongnu.org>; Fri, 20 Nov 2020 13:18:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=gyNq+CXGsH0qwkvX6VyZpOW+xtz/kz2LyOf6/jkzaO0=;
 b=ehMwCniHhcWcyq6QySNwedlwnXYGa9deIPoyuONBTcSfF1FK8u/PL9bJ6Ivzmw97L7
 es8dC7wve9Gj4FH7Bku6rHJaJwFj5pfaK8oL0YZbUt6yW7TkLxlnskqzr/0nigNQejej
 31uUxyrDVHao3tUMNruC8EXD4h5sZxOA1bmnFamo84NFMiTfTUBS7DKt+63TqiE2ZlHH
 9uVZxffrCFe7ucCXTVHqop+bHNzRtmUXaiS3GhOqM4t5KJYBrFmvQEvr+lzv8Zj1m7H7
 uy6W36pavFI1h0qtlmGfHjXEfePkfw0IzcewzRmEOfY/nvKRhB0DMfOsN9+Pg2tmBMGt
 edVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gyNq+CXGsH0qwkvX6VyZpOW+xtz/kz2LyOf6/jkzaO0=;
 b=hDX7FG3HGsJ/dbgXNhlue1OzWlbt7fKAlqVLARH1jyGZPnHCSe1oL1KVgFRCuzCtLl
 HU2m+UwDrK4v6ijSYJnYnHas3cEd0WOqltfTVn/ncox61P90lvabRiQeuY4EVMk+J6qT
 gKsv/V3ZN9StLvuRM3Y1pjmmFAccPrtv76MHFNdAOgif3X5sibf5aKbykTSvQA9s7Uf1
 ePs9olm9g7Z/AqvqWkT8TmXcPmoPkAPrijMyZ8tYIWgwRw+5t/j0uWIW9Wd8r3c3fJ8r
 6vSHb/e10DmdyfTHJFwftB/fMny4OjWfXF9MInZnFVmVYM/hn6EUhOM+1H0Hp66HNG65
 3wFA==
X-Gm-Message-State: AOAM530fzN3RtHlW9sn+9TP9PeRhP0swZOe03E951J4p53+Mk1ONso2O
 Q3vsBuB5zTZTz1FlFq9p35Y=
X-Google-Smtp-Source: ABdhPJy54UaB/Is5YjbhHOh/4TR/x7nVnHPWkMhJBXmzcWxv+thgpOMjrr4M7YOcmS0x8HNw60Afyw==
X-Received: by 2002:a05:600c:2158:: with SMTP id
 v24mr12266035wml.107.1605907106503; 
 Fri, 20 Nov 2020 13:18:26 -0800 (PST)
Received: from ?IPv6:2a02:8084:e84:2480:228:f8ff:fe6f:83a8?
 ([2a02:8084:e84:2480:228:f8ff:fe6f:83a8])
 by smtp.gmail.com with ESMTPSA id o4sm5516370wmh.33.2020.11.20.13.18.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Nov 2020 13:18:25 -0800 (PST)
Subject: Re: [PATCH v2] drivers/virt: vmgenid: add vm generation id driver
To: Alexander Graf <graf@amazon.de>
References: <3E05451B-A9CD-4719-99D0-72750A304044@amazon.com>
 <300d4404-3efe-880e-ef30-692eabbff5f7@de.ibm.com>
 <da1a1fa7-a1de-d0e6-755b-dd587687765e@amazon.de>
 <20201119173800.GD8537@kernel.org>
 <1cdb6fac-0d50-3399-74a6-24c119ebbaa5@amazon.de>
From: Dmitry Safonov <0x7f454c46@gmail.com>
Message-ID: <106f56ca-49bc-7cad-480f-4b26656e90ce@gmail.com>
Date: Fri, 20 Nov 2020 21:18:23 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <1cdb6fac-0d50-3399-74a6-24c119ebbaa5@amazon.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::344;
 envelope-from=0x7f454c46@gmail.com; helo=mail-wm1-x344.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 20 Nov 2020 16:54:30 -0500
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
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 "dgunigun@redhat.com" <dgunigun@redhat.com>, KVM list <kvm@vger.kernel.org>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 "ghammer@redhat.com" <ghammer@redhat.com>,
 "vijaysun@ca.ibm.com" <vijaysun@ca.ibm.com>, "Weiss,
 Radu" <raduweis@amazon.com>, Qemu Developers <qemu-devel@nongnu.org>,
 Michal Hocko <mhocko@kernel.org>, Andrey Vagin <avagin@gmail.com>,
 Pavel Machek <pavel@ucw.cz>, Pavel Tikhomirov <ptikhomirov@virtuozzo.com>,
 linux-s390 <linux-s390@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 "mpe@ellerman.id.au" <mpe@ellerman.id.au>,
 "Michael S. Tsirkin" <mst@redhat.com>, Eric Biggers <ebiggers@kernel.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>, "Singh,
 Balbir" <sblbir@amazon.com>, "Eric W. Biederman" <ebiederm@xmission.com>,
 "bonzini@gnu.org" <bonzini@gnu.org>, Jann Horn <jannh@google.com>,
 "asmehra@redhat.com" <asmehra@redhat.com>,
 "oridgar@gmail.com" <oridgar@gmail.com>, "Catangiu,
 Adrian Costin" <acatan@amazon.com>, Andy Lutomirski <luto@kernel.org>,
 "gil@azul.com" <gil@azul.com>, "MacCarthaigh, Colm" <colmmacc@amazon.com>,
 "Theodore Y. Ts'o" <tytso@mit.edu>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Adrian Reber <areber@redhat.com>, kernel list <linux-kernel@vger.kernel.org>,
 Pavel Emelyanov <ovzxemul@gmail.com>, Mike Rapoport <rppt@kernel.org>,
 Linux API <linux-api@vger.kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Willy Tarreau <w@1wt.eu>, "Woodhouse, David" <dwmw@amazon.co.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

+Cc Eric, Adrian

On 11/19/20 6:36 PM, Alexander Graf wrote:
> On 19.11.20 18:38, Mike Rapoport wrote:
>> On Thu, Nov 19, 2020 at 01:51:18PM +0100, Alexander Graf wrote:
>>> On 19.11.20 13:02, Christian Borntraeger wrote:
>>>> On 16.11.20 16:34, Catangiu, Adrian Costin wrote:
>>>>> - Background
>>>>>
>>>>> The VM Generation ID is a feature defined by Microsoft (paper:
>>>>> http://go.microsoft.com/fwlink/?LinkId=260709) and supported by
>>>>> multiple hypervisor vendors.
>>>>>
>>>>> The feature is required in virtualized environments by apps that work
>>>>> with local copies/caches of world-unique data such as random values,
>>>>> uuids, monotonically increasing counters, etc.
>>>>> Such apps can be negatively affected by VM snapshotting when the VM
>>>>> is either cloned or returned to an earlier point in time.
>>>>>
>>>>> The VM Generation ID is a simple concept meant to alleviate the issue
>>>>> by providing a unique ID that changes each time the VM is restored
>>>>> from a snapshot. The hw provided UUID value can be used to
>>>>> differentiate between VMs or different generations of the same VM.
>>>>>
>>>>> - Problem
>>>>>
>>>>> The VM Generation ID is exposed through an ACPI device by multiple
>>>>> hypervisor vendors but neither the vendors or upstream Linux have no
>>>>> default driver for it leaving users to fend for themselves.
[..]

>>> The only piece where I'm unsure is how this will interact with CRIU.
>>
>> To C/R applications that use /dev/vmgenid CRIU need to be aware of it.
>> Checkpointing and restoring withing the same "VM generation" shouldn't be
>> a problem, but IMHO, making restore work after genid bump could be
>> challenging.
>>
>> Alex, what scenario involving CRIU did you have in mind?
> 
> You can in theory run into the same situation with containers that this
> patch is solving for virtual machines. You could for example do a
> snapshot of a prewarmed Java runtime with CRIU to get full JIT speeds
> starting from the first request.
> 
> That however means you run into the problem of predictable randomness
> again.
> 
>>
>>> Can containers emulate ioctls and device nodes?
>>
>> Containers do not emulate ioctls but they can have /dev/vmgenid inside
>> the container, so applications can use it the same way as outside the
>> container.
> 
> Hm. I suppose we could add a CAP_ADMIN ioctl interface to /dev/vmgenid
> (when container people get to the point of needing it) that sets the
> generation to "at least X". That way on restore, you could just call
> that with "generation at snapshot"+1.
> 
> That also means we need to have this interface available without virtual
> machines then though, right?

Sounds like a good idea.
I guess, genvmid can be global on host, rather than per-userns or
per-process for simplicity. Later if somebody will have a bottleneck on
restore when every process on the machine wakes up from read() it could
be virtualized, but doing it now sounds too early.

ioctl() probably should go under
checkpoint_restore_ns_capable(current_user_ns()), rather than
CAP_SYS_ADMIN (I believe it should be safe from DOS as only CRIU should
run with this capability, but worth to document this).

Thanks,
         Dmitry

