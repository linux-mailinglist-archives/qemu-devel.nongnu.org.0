Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E566133F2
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 11:50:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opSN1-0003mJ-M5; Mon, 31 Oct 2022 06:50:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1opSMt-0003gX-Br
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 06:50:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1opSMp-0007zO-Ev
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 06:50:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667213405;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CfVHDwL9uPqnzdg5hArVMDjFXPYbNat0F4nOVoxUHyE=;
 b=FysURgVyfPR8FlBDsNi/3xpRYG6GFLJgQBczHDJuR3stFLRbcOoWXr5bWgIQnBcwUgJCZM
 Kx6VudotwvFdAJqmouRiAUli1E/ACbwshCdjd4mG9svBvPBX7xuVq/ONIeRTY0YjNCVO5D
 qXvErKs9hjj9lKzeruMrRFRDcqlTb0s=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-332-mXhc0uJ4OyuGXjiJH-DJxg-1; Mon, 31 Oct 2022 06:50:04 -0400
X-MC-Unique: mXhc0uJ4OyuGXjiJH-DJxg-1
Received: by mail-qv1-f70.google.com with SMTP id
 h1-20020a0ceda1000000b004b899df67a4so5525897qvr.1
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 03:50:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CfVHDwL9uPqnzdg5hArVMDjFXPYbNat0F4nOVoxUHyE=;
 b=e6Vwm7Qvoy6LTaAPxzvYigl/vxov63lKzacaBq6Dd1KK+j9WxfP8uADRmv5BEyrema
 9ic083b4gbZaAhrgne+rFj9/sObgaUWVzlqCk5V+NWzEscS6wkZNOQeFwcDMrAqr3LYK
 Nf3M8k1miAu6ZBfe2by6peJCTHcF2svVcW5zhVCkJosgO8OAQs8+oAWdcKV9KN9ZEDZD
 /u48UzqrIQBCN0BxBSRzqGLM8tTTu9XrMeqb7sVAyv/QzXHxK7hTH3AkKlJTXCoEg2Ig
 qPykvLiSVKjOZB+MMIwDO/2s+pYMto81szBZYbg0/u6fgf8EldfCAx09RdX/NoHZAFuD
 dUSA==
X-Gm-Message-State: ACrzQf0L1NUDkpI6cFe1Dy78BDo7HQv1I5ttbF33tG7npZt5NPWJjSSr
 JVn1+hXGzZkZoEs+6wR5yd9gM7NKQnwkHVlQZqpZrShntgJVh1vl2+sKAmxqUGcvsi2u9ZnQzwq
 MbJK/7s7uqh9mD5E=
X-Received: by 2002:a0c:8c8c:0:b0:4bb:6928:2a24 with SMTP id
 p12-20020a0c8c8c000000b004bb69282a24mr10306937qvb.87.1667213404209; 
 Mon, 31 Oct 2022 03:50:04 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM51rrfTpXYmJr2nHe4WWIryJiu2plQDt2CVv+o2/9vb+7PYg5SPAxhxAYbxUW5t3UmpOFc6pw==
X-Received: by 2002:a0c:8c8c:0:b0:4bb:6928:2a24 with SMTP id
 p12-20020a0c8c8c000000b004bb69282a24mr10306926qvb.87.1667213403946; 
 Mon, 31 Oct 2022 03:50:03 -0700 (PDT)
Received: from [192.168.8.104] (tmo-097-47.customers.d1-online.com.
 [80.187.97.47]) by smtp.gmail.com with ESMTPSA id
 s7-20020ac87587000000b0039a9b55b829sm3106539qtq.29.2022.10.31.03.50.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Oct 2022 03:50:03 -0700 (PDT)
Message-ID: <2d9d7cfb-013f-4920-7155-0c56198d88ad@redhat.com>
Date: Mon, 31 Oct 2022 11:50:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [RFC PATCH] Add new build target 'check-spelling'
Content-Language: en-US
To: Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
References: <20221031074317.377366-1-sw@weilnetz.de>
 <280c2059-1b1f-85db-eca0-71e5e5800b21@redhat.com>
 <1ed28d1b-4b80-055d-5fac-d4d87ac187d3@weilnetz.de>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <1ed28d1b-4b80-055d-5fac-d4d87ac187d3@weilnetz.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.055,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 31/10/2022 11.44, Stefan Weil wrote:
> Am 31.10.22 um 08:52 schrieb Thomas Huth:
> 
>> On 31/10/2022 08.43, Stefan Weil wrote:
>>> `make check-spelling` can now be used to get a list of spelling errors.
>>> It uses the latest version of codespell, a spell checker implemented in 
>>> Python.
>>>
>>> Signed-off-by: Stefan Weil <sw@weilnetz.de>
>>> ---
>>>
>>> This RFC can already be used for manual tests, but still reports false
>>> positives, mostly because some variable names are interpreted as words.
>>> These words can either be ignored in the check, or in some cases the code
>>> might be changed to use different variable names.
>>>
>>> The check currently only skips a few directories and files, so for example
>>> checked out submodules are also checked.
>>>
>>> The rule can be extended to allow user provided ignore and skip lists,
>>> for example by introducing Makefile variables CODESPELL_SKIP=userfile
>>> or CODESPELL_IGNORE=userfile. A limited check could be implemented by
>>> providing a base directory CODESPELL_START=basedirectory, for example
>>> CODESPELL_START=docs.
>>>
>>> Regards,
>>> Stefan
> [...]
>>> I like the idea, but I think it's unlikely that we can make this work for 
>>> the whole source tree any time soon. So maybe it makes more sense to 
>>> start with some few directories first (e.g. docs/ ) and then the 
>>> maintainers can opt-in by cleaning up their directories first and then by 
>>> adding their directories to this target here?
>>
>>  Thomas
> 
> 
> Even without implementing CODESPELL_START as described above, the script can 
> already be used and integrated into CI scripts.
> 
> It takes about 60 seconds to check the whole source tree including 
> submodules on my (slow) virtual machine.
> 
> The resulting output has about 20000 lines or 1272 KiB. It can be filtered 
> for relevant parts of the source tree or used for a summary.
> 
> Sample script: grep "^[.]" spellcheck.log | sed s/^..// | sed 's/\/.*//' | 
> sed s/:.*// | sort | uniq -c
> 
> This produces a summary for the top level hierarchy of files and directories:
> 
>        3 accel
>        1 audio
>        1 backends
>       77 block
>        7 block.c
>       20 bsd-user
>      386 capstone
>       12 chardev
>        1 configure
>        8 contrib
>        6 crypto
>       64 disas
>       32 docs
>       31 dtc
>        8 fpu
>        1 gdbstub
>        1 gdb-xml
>        1 .github
>      537 hw
>        7 inc
>      114 include
>        1 libdecnumber
>       33 linux-user
>        1 MAINTAINERS
>      150 meson
>        6 meson.build
>       16 migration
>        1 nbd
>        5 net
>       12 pc-bios
>        7 python
>        3 qapi
>        2 qemu
>        5 qemu-options.hx
>       22 qga
>    14175 roms
>       43 scripts
>        3 semihosting
>       18 slirp
>        2 softmmu
>       59 subprojects
>      504 target
>        6 tcg
>        3 test.rb
>      175 tests
>        6 tools
>       20 ui
>        8 util
> 
> It shows that "roms" contributes by far the most typos. Omitting it would 
> reduce the required time to 22 seconds and the number of typos found (2947 
> lines in output) very much.

"roms" mostly consists of third-party submodules that we do not have direct 
control of. I think this should definitely be omitted.

> "capstone" (which has no entry in MAINTAINERS)

That's likely because it has been a submodule that has been removed a while 
ago. "rm -rf capstone" should solve that issue on your local buildtree ;-)

(yes, that's another nuisance of submodules - the checked out files don't go 
away when the submodule gets removed)

  Thomas


