Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14B6E3AB2EE
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 13:47:20 +0200 (CEST)
Received: from localhost ([::1]:52434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltqUQ-0000vY-Jz
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 07:47:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ltqSo-00081d-1A
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 07:45:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60497)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ltqSf-0000S0-W6
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 07:45:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623930328;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KgECZGlktNvO6iTzzziGuQVff7msNCbyA4rFcT40gkc=;
 b=A5HvKU89p535FcXO5FqsAd9EE5v8r7Cy1MKFzjeN6ZL9zURKGUIphsZDRdalNcvmH8LSPF
 MVWPyTuK3HzPsA0lk6iraGgw154Xd5WFy9QxqLrZkJ3LTVqxBWuJQ0uilEHe5fIIeCGUIs
 w1GQqIorjRuQJPY6GUXofRUoMgWg6hQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-444-BPzKhSY5PXKyGncmhcfK2A-1; Thu, 17 Jun 2021 07:45:26 -0400
X-MC-Unique: BPzKhSY5PXKyGncmhcfK2A-1
Received: by mail-wm1-f70.google.com with SMTP id
 i82-20020a1c22550000b02901d64e84b3c9so482372wmi.5
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 04:45:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KgECZGlktNvO6iTzzziGuQVff7msNCbyA4rFcT40gkc=;
 b=dE5XPGyn3nUY9TmFdAOhdhvpbhQcxU/F/85fdo5pTy6lDOzbWZK6HDnmRpxyvx9E29
 LEjbHuT2eWzbKMi7lT1hFvzfsMhDVNm6AXFs+ZDkEsKfev1o7O3MsJugx97qUJUIM+TV
 D1mdNZt469mEgg4DjeSPVoC/BYwHlnW1oFU70GJWtiuBCf77oOp1J+v/Q6mlm+MwGJkb
 LXJ5piXICMryBTqCN2Yt7zlFmBSOyOiK7QAKVbUGWPu+GZokbIfWXqEGt2bES2vl/OVz
 yEfrZMnBY2qWterbNkmCM6kUmnk5dbk3KHMRMnmABv7Qc/lB2857/q3LnT+DEl1zuFYQ
 oBsg==
X-Gm-Message-State: AOAM531QRtZTI7SlcVDhg4DC6r+27TU7AKAN5Zp9aK2nMujcRqkeLOrp
 ltL5kFsdc4064lnKYWlyvdmjVXXVW/wz0WEjpI0X5G+sj6l9qkYpxQS1dprEmtU/Y23u3fQ2doh
 4YCCZKWIWEEZzJZw=
X-Received: by 2002:a7b:c098:: with SMTP id r24mr4451961wmh.35.1623930325690; 
 Thu, 17 Jun 2021 04:45:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw0yPA/DPMlxN/0MrDWWl/9PHrzi6n8gXIwJv86Ijz8qyLUjgu2L5UzuyD7/rp9ox7YEuNa1w==
X-Received: by 2002:a7b:c098:: with SMTP id r24mr4451939wmh.35.1623930325477; 
 Thu, 17 Jun 2021 04:45:25 -0700 (PDT)
Received: from thuth.remote.csb (pd9575d16.dip0.t-ipconnect.de. [217.87.93.22])
 by smtp.gmail.com with ESMTPSA id a1sm6841441wra.63.2021.06.17.04.45.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Jun 2021 04:45:25 -0700 (PDT)
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20210525152924.4171401-1-f4bug@amsat.org>
 <877disg3z7.fsf@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] gitlab-ci: Add jobs to build standalone machines
Message-ID: <81aca179-4320-f00b-d9dc-7eca449ebce7@redhat.com>
Date: Thu, 17 Jun 2021 13:45:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <877disg3z7.fsf@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.254, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Willian Rampazzo <willianr@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17/06/2021 12.42, Alex Bennée wrote:
> 
> Philippe Mathieu-Daudé <f4bug@amsat.org> writes:
> 
>> The --without-default-devices configure option removes the
>> 'default=y' from Kconfig files. It is useful to test missing
>> Kconfig dependencies for users wanting to have QEMU (system)
>> binaries with a particular subset of machines builtin.
>>
>> If a machine can be built standalone, it can certainly be
>> built as part of a set. So the best way to test for regressions
>> is to test each machine individually.
>>
>> As this is painful to test manually, add CI jobs to do it [*].
>> Since all jobs follow the same template, to ease maintenance
>> we generate the jobs using the jsonnet tool, which emit a YAML
>> file filled with all our jobs.
>>
>> Since there is no "--enable-my-config" option, we have to write
>> the standalone config manually, overwritting each target .mak
>> file in default-configs/devices/.

I'd appreciate if we could get such a --enable-config option first - that 
would also be very helpful for downstream RHEL where we also modify the 
default-configs with downstream-only patches.

>> +
>> +{
>> +  include: { "local": "/.gitlab-ci.d/standalone-jobs-template.yml" },
>> +
>> +    "alpha dp264": param_job("alpha-softmmu", "CONFIG_DP264=y"),
>> +    "avr arduino": param_job("avr-softmmu", "CONFIG_ARDUINO=y"),
>> +    "hppa dino": param_job("hppa-softmmu", "CONFIG_DINO=y"),
>> +    "nios2 10m50": param_job("nios2-softmmu", "CONFIG_NIOS2_10M50=y"),
>> +    "nios2 nommu": param_job("nios2-softmmu", "CONFIG_NIOS2_GENERIC_NOMMU=y"),
>> +    "or1k sim": param_job("or1k-softmmu", "CONFIG_OR1K_SIM=y"),
>> +    "rx gdbsim": param_job("rx-softmmu", "CONFIG_RX_GDBSIM=y", "-bios /dev/null"),
>> +    "triboard": param_job("tricore-softmmu", "CONFIG_TRIBOARD=y"),
>> +    "xtensa sim": param_job("xtensaeb-softmmu", "CONFIG_XTENSA_SIM=y CONFIG_SEMIHOSTING=y"),
>> +    "xtensa virt": param_job("xtensa-softmmu", "CONFIG_XTENSA_VIRT=y CONFIG_SEMIHOSTING=y"),
> 
> Do we really have a plethora of users running trimmed down custom
> configurations that we need to defend each of these exotic build
> combinations in the CI?

I think I agree with Alex - in our CI, we should test what users really 
need, and not each and every distantly possible combination.

So what I'd really would like to see:

1) Introduce a "--with-build-configs" switch (feel free to bikeshed on the 
name) to the configure script that allows us to use a folder with a 
different set of config files.

2) rename default-configs/ to configs/default/

3) Introduce some useful alternate config sets, e.g. configs/rhel or 
configs/lean-kvm or whatever people want to use, and change some of the CI 
jobs to work with those configs.

  Thomas


