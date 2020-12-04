Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2797F2CF5B0
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Dec 2020 21:35:38 +0100 (CET)
Received: from localhost ([::1]:58674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1klHnk-0002sq-Il
	for lists+qemu-devel@lfdr.de; Fri, 04 Dec 2020 15:35:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1klGkR-00011v-Az
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 14:28:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52059)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1klGkK-000714-LX
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 14:28:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607110078;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=15FC1l+fkDpoAmO+qXyYAUYkTcDX7yWXEiMLF2/go6o=;
 b=aCjPS/0rXDL9WS/4QFu9bOg+6BYb3rqh4ZlH9L1djDKweeAfnR+hg5gU9DscxdT2Xwyc/v
 Vuzt00eUPAs6SJ7XVvmCiuSEGIBao7woRKT1xFlz1RJRL6CMg8eon9ykOwABZ8D9cu2CfR
 uSqH3fkUXWg9UhLpq4MahXzDejmNhyU=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-231-cowycircMLa_WxnEERvBZA-1; Fri, 04 Dec 2020 14:27:56 -0500
X-MC-Unique: cowycircMLa_WxnEERvBZA-1
Received: by mail-ej1-f70.google.com with SMTP id f2so2436396ejx.22
 for <qemu-devel@nongnu.org>; Fri, 04 Dec 2020 11:27:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=15FC1l+fkDpoAmO+qXyYAUYkTcDX7yWXEiMLF2/go6o=;
 b=Idbcm4/9+9llQB6ptzvyAOeKlbnOadk3ithNa9XOLTFaM1KIeHdA7oTLuSu2MXuvhI
 dzEukEbcZq+9McbLPfk6c0bHBvYkj7HeFpfg+TirXLMT0o33pTGbHMz5L31ZTn5veDhd
 9+CRqVF72PWCiQIk6ZGapOlfQ+IR5hye9B0Mf0fh5fgtlJD4WrVLgE6eO/up3vpN7Ymu
 gNQAEesng82Lu0IWT0M7mzc6HeLhVdqpcd5vEBU4jdVXjOf20fQY9NI3EgMLFjF2OrUp
 IiTWMNUp3pWjeivq47yMlA4fjhyaUSmOq9RbfeT3THJ/6Ww15u/finFtHtVZDm8cplFO
 beIg==
X-Gm-Message-State: AOAM533PXruoSyuSr3bFj5CX7xDOjaUhyhQUGkF+Y73FT5d3zcUA1Vx1
 6V0EKWGXT7hEP+kilSBy/gcx6YU3vmX8xEUtSTO03NVwoWWs7W+pjObpu6oJ0Z9Wgr/yObDSqMe
 wOaSsJU6exdHg7dU=
X-Received: by 2002:a05:6402:411:: with SMTP id
 q17mr9134613edv.125.1607110075447; 
 Fri, 04 Dec 2020 11:27:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzj3/cdaKRUBPFPR9GcI3FrS9nMo6NT93CjILLUMSPu+SFergwaL4WmkxLeIpLSp05YxewZfw==
X-Received: by 2002:a05:6402:411:: with SMTP id
 q17mr9134576edv.125.1607110075235; 
 Fri, 04 Dec 2020 11:27:55 -0800 (PST)
Received: from [192.168.1.36] (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id i13sm3752666ejc.57.2020.12.04.11.27.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Dec 2020 11:27:54 -0800 (PST)
Subject: Re: [RFC v7 15/22] cpu: Move tlb_fill to tcg_ops
To: Claudio Fontana <cfontana@suse.de>, Eduardo Habkost <ehabkost@redhat.com>
References: <20201130023535.16689-1-cfontana@suse.de>
 <20201130023535.16689-16-cfontana@suse.de>
 <4c7fe436-7c2d-e55d-1139-8aa30e91965f@redhat.com>
 <20201204173703.GQ3836@habkost.net>
 <6233d4db-546a-2ec3-376d-154af8ed2cdb@redhat.com>
 <dc731d70-cf85-0735-4335-44f685343a9b@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <bfdb4225-2104-bee7-ea81-3e687141c1f0@redhat.com>
Date: Fri, 4 Dec 2020 20:27:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <dc731d70-cf85-0735-4335-44f685343a9b@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Emilio G . Cota" <cota@braap.org>, Paul Durrant <paul@xen.org>,
 Jason Wang <jasowang@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Dario Faggioli <dfaggioli@suse.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Cameron Esfahani <dirty@apple.com>,
 haxm-team@intel.com, Wenchao Wang <wenchao.wang@intel.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Sunil Muthuswamy <sunilmut@microsoft.com>,
 Bruce Rogers <brogers@suse.com>, Olaf Hering <ohering@suse.de>,
 Colin Xu <colin.xu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/4/20 7:14 PM, Claudio Fontana wrote:
> On 12/4/20 7:00 PM, Philippe Mathieu-Daudé wrote:
>> On 12/4/20 6:37 PM, Eduardo Habkost wrote:
>>> On Fri, Dec 04, 2020 at 06:14:07PM +0100, Philippe Mathieu-Daudé wrote:
>>>> On 11/30/20 3:35 AM, Claudio Fontana wrote:
>>>>> From: Eduardo Habkost <ehabkost@redhat.com>
>>>>>
>>>>> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
>>>>> ---
>>>>>  accel/tcg/cputlb.c              |  6 +++---
>>>>>  accel/tcg/user-exec.c           |  6 +++---
>>>>>  include/hw/core/cpu.h           |  9 ---------
>>>>>  include/hw/core/tcg-cpu-ops.h   | 12 ++++++++++++
>>>>>  target/alpha/cpu.c              |  2 +-
>>>>>  target/arm/cpu.c                |  2 +-
>>>>>  target/avr/cpu.c                |  2 +-
>>>>>  target/cris/cpu.c               |  2 +-
>>>>>  target/hppa/cpu.c               |  2 +-
>>>>>  target/i386/tcg-cpu.c           |  2 +-
>>>>>  target/lm32/cpu.c               |  2 +-
>>>>>  target/m68k/cpu.c               |  2 +-
>>>>>  target/microblaze/cpu.c         |  2 +-
>>>>>  target/mips/cpu.c               |  2 +-
>>>>>  target/moxie/cpu.c              |  2 +-
>>>>>  target/nios2/cpu.c              |  2 +-
>>>>>  target/openrisc/cpu.c           |  2 +-
>>>>>  target/ppc/translate_init.c.inc |  2 +-
>>>>>  target/riscv/cpu.c              |  2 +-
>>>>>  target/rx/cpu.c                 |  2 +-
>>>>>  target/s390x/cpu.c              |  2 +-
>>>>>  target/sh4/cpu.c                |  2 +-
>>>>>  target/sparc/cpu.c              |  2 +-
>>>>>  target/tilegx/cpu.c             |  2 +-
>>>>>  target/tricore/cpu.c            |  2 +-
>>>>>  target/unicore32/cpu.c          |  2 +-
>>>>>  target/xtensa/cpu.c             |  2 +-
>>>>>  27 files changed, 41 insertions(+), 38 deletions(-)
>>>>
>>>> With cc->tcg_ops.* guarded with #ifdef CONFIG_TCG:
>>>> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>>
>>> Thanks!
>>>
>>> Are the #ifdefs a hard condition for your Reviewed-by?
>>
>> No, as you said, this is fine as a first step, so you can
>> include them.
>>
>>> Even if we agree #ifdef CONFIG_TCG is the way to go, I don't
>>> think this should block a series that's a step in the right
>>> direction.  It can be done in a separate patch.
>>>
>>> (Unless the lack of #ifdef introduces regressions, of course)
>>
>> I'm worried about the +system -tcg build configuration.
>>
>> s390x is the only target testing for such regressions
>> (see "[s390x] Clang (disable-tcg)" on Travis-CI.
>>
> 
> which exact configure options are concerned about?
> 
> --disable-tcg --enable-kvm --target="*-system"?
> 
> Or something else?

Basically --disable-tcg --enable-$ACCEL [--enable-$ACCEL]

> 
> this is something I am testing (and found the issues).
> 
> I am currently testing (and a result fixing) for each patch:
> 
> --disable-tcg --enable-kvm

This one is meaningful to check the host, so I run it on:
- x86 [ok]
- s390x [ok]
- aarch64 [done, waiting for your effort before respining]
- ppc64 [done, I was postponing the series submission waiting
         for aa64 to be merged, but I might go back to it as
         aa64 is taking too long].
- mips: no hardware access

> --enable-tcg --disable-kvm
> --enable-tcg --enable-kvm --enable-hax
> --disable-system

I also use:

* --disable-tcg --disable-kvm --enable-xen
  [x86 host works]
  [aa64 host needs Alex Bennée patches]

* --disable-tcg --disable-system --disable-user --enable-tools

* --disable-system --static --disable-capstone
(experimental, not supported, don't waste time with it).

The most useful is --enable-tools with all accelerators disabled,
as it quickly triggers linking errors when you miss-place a
handler between #ifdefs.

> With targets (when compatible):
> TARGET_LIST="x86_64-softmmu,x86_64-linux-user,arm-softmmu,arm-linux-user,aarch64-softmmu,aarch64-linux-user,s390x-softmmu,s390x-linux-user"

"first class KVM users" include PPC64 too.

> 
> and yes, should offload much of this to CI..
> 
> Ciao,
> 
> Claudio
> 


