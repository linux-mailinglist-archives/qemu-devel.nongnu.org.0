Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6630F2F6BAA
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 21:01:48 +0100 (CET)
Received: from localhost ([::1]:42370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l08oV-0006Qn-CH
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 15:01:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l08kU-0004p3-AC
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 14:57:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43747)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l08kQ-0005pZ-IW
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 14:57:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610654253;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+5yC+KLi/APW8J5hB7ILfWSHbreCpAp8Yk0AsF9+wAk=;
 b=GCXutmY7rP1aBfq6RZoHYw0xO8eT1N1t/jpALNusuJIYxCfEvv7p4Ub5b8BaXxWt5jz1CJ
 /YrKnf9Co6qLtuaVSwf3ZGLorPztwNKXqcK9R35QcacKqVwQUqx/rXpmkoOERSOlxHlUT1
 bazjQDuV4sRCRAa6H1eFfx31A8pY1gw=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-469-CdC4QFqyOB-ec4jOI1mouQ-1; Thu, 14 Jan 2021 14:57:29 -0500
X-MC-Unique: CdC4QFqyOB-ec4jOI1mouQ-1
Received: by mail-wr1-f69.google.com with SMTP id r11so3062609wrs.23
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 11:57:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+5yC+KLi/APW8J5hB7ILfWSHbreCpAp8Yk0AsF9+wAk=;
 b=ltBSEKy/EcaDySXIM9qCXvDT3RM0BtRu2cFCHYx0u8rQwzWypm8kTxtMiNMXco14iy
 rhxoDt3LHmgrI/bmthE/NCHNVrkBfohbdT6fKdsqhYPFD116KbipWawuoEdmviBwx0fU
 SWHYrC+wjkvCZR4cPfNwvo/Uf5M7ZKKlS3MvT1R9Dq31SjUFyVz+8soun1quqkKCIF0b
 T1ApQnFfLv+YiiOrEwwrJFPeFZepI28Hc4w9bOLhufFqshn5qPxW3rFfFrKquRE0UR7y
 /lEHSwUmF2VsyP4fAE0o+xnzvLb7Hk8mq1ZLZXPADQIMpDTRC6ojI9tm7Fzr0un0yOrv
 VQ5g==
X-Gm-Message-State: AOAM53396/ayR6p5jYethhMglIB0cReexnf3KgHOOddW0+rH6sklahWj
 iutIVySVKdFx2YNcvsCIUn84hV0ve9o3L90f82HaRlXH4J0LnQONYO7jnqLIcQOnHLqpOafyt3d
 NPoQIshyNBddoqE4=
X-Received: by 2002:a5d:4d4f:: with SMTP id a15mr9539989wru.315.1610654248511; 
 Thu, 14 Jan 2021 11:57:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyLLCN19zsYvCEXta/ET194pw8EjmInW+wR84gb86TLSTEBAdMlCLFl+U7TDoiQ3I+xcNZ0Dw==
X-Received: by 2002:a5d:4d4f:: with SMTP id a15mr9539979wru.315.1610654248303; 
 Thu, 14 Jan 2021 11:57:28 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id d13sm11638912wrx.93.2021.01.14.11.57.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Jan 2021 11:57:27 -0800 (PST)
Subject: Re: [PATCH 1/2] meson.build: Declare global edk2_targets /
 install_edk2_blobs variables
To: Laszlo Ersek <lersek@redhat.com>, qemu-devel@nongnu.org
References: <20210114174509.2944817-1-philmd@redhat.com>
 <20210114174509.2944817-2-philmd@redhat.com>
 <a0990c43-c2f9-503d-782e-e4002709e53b@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <dec726cf-5247-dcbe-914a-a54b0d4b2b03@redhat.com>
Date: Thu, 14 Jan 2021 20:57:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <a0990c43-c2f9-503d-782e-e4002709e53b@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.237, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/14/21 8:49 PM, Laszlo Ersek wrote:
> On 01/14/21 18:45, Philippe Mathieu-Daudé wrote:
>> Globally declare in the main meson.build:
>> - the list of EDK2 targets,
>> - whether the EDK2 blobs have to be installed.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>> Patch trivial to review using 'git-diff --ignore-all-space'
>> ---
>>  meson.build                     |  8 ++++++++
>>  pc-bios/descriptors/meson.build | 30 ++++++++++++++++--------------
>>  pc-bios/meson.build             |  5 +----
>>  3 files changed, 25 insertions(+), 18 deletions(-)
>>
>> diff --git a/meson.build b/meson.build
>> index 3d889857a09..ecc45d04d6a 100644
>> --- a/meson.build
>> +++ b/meson.build
>> @@ -88,6 +88,14 @@
>>    }
>>  endif
>>  
>> +edk2_targets = [ 'arm-softmmu', 'aarch64-softmmu', 'i386-softmmu', 'x86_64-softmmu' ]
>> +install_edk2_blobs = false
>> +if get_option('install_blobs')
>> +  foreach target : target_dirs
>> +    install_edk2_blobs = install_edk2_blobs or target in edk2_targets
>> +  endforeach
>> +endif
>> +
>>  ##################
>>  # Compiler flags #
>>  ##################
>> diff --git a/pc-bios/descriptors/meson.build b/pc-bios/descriptors/meson.build
>> index 7040834573d..ac6ec66b007 100644
>> --- a/pc-bios/descriptors/meson.build
>> +++ b/pc-bios/descriptors/meson.build
>> @@ -1,14 +1,16 @@
>> -foreach f: [
>> -  '50-edk2-i386-secure.json',
>> -  '50-edk2-x86_64-secure.json',
>> -  '60-edk2-aarch64.json',
>> -  '60-edk2-arm.json',
>> -  '60-edk2-i386.json',
>> -  '60-edk2-x86_64.json'
>> -]
>> -  configure_file(input: files(f),
>> -                 output: f,
>> -                 configuration: {'DATADIR': qemu_datadir},
>> -                 install: get_option('install_blobs'),
>> -                 install_dir: qemu_datadir / 'firmware')
>> -endforeach
>> +if install_edk2_blobs
>> +  foreach f: [
>> +    '50-edk2-i386-secure.json',
>> +    '50-edk2-x86_64-secure.json',
>> +    '60-edk2-aarch64.json',
>> +    '60-edk2-arm.json',
>> +    '60-edk2-i386.json',
>> +    '60-edk2-x86_64.json'
>> +  ]
>> +    configure_file(input: files(f),
>> +                   output: f,
>> +                   configuration: {'DATADIR': qemu_datadir},
>> +                   install: get_option('install_blobs'),
>> +                   install_dir: qemu_datadir / 'firmware')
>> +  endforeach
>> +endif
>> diff --git a/pc-bios/meson.build b/pc-bios/meson.build
>> index fab323af84e..6a341b6cea0 100644
>> --- a/pc-bios/meson.build
>> +++ b/pc-bios/meson.build
>> @@ -1,7 +1,4 @@
>> -if 'arm-softmmu' in target_dirs or \
>> -    'aarch64-softmmu' in target_dirs or \
>> -    'i386-softmmu' in target_dirs or \
>> -    'x86_64-softmmu' in target_dirs
>> +if install_edk2_blobs
>>    bzip2 = find_program('bzip2', required: true)
>>    fds = [
>>      'edk2-aarch64-code.fd',
>>
> 
> I vaguely understand what this patch does (I haven't followed the meson
> conversion), but I'm unsure why it does that.
> 
> Is this patch useful in itself, or only in preparation for patch#2?

Well, something I forgot to mention is it disable the configure_file()
calls when arm/aarch64/i386/x86_64-softmmu targets are not selected.

(currently if you configure a restricted set of targets, such
--target-list=riscv64-softmmu,ppc-softmmu, it is called, and
the json descriptors files are installed, even if these targets
don't require them).


