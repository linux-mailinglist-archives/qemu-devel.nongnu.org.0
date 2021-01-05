Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E4D42EB226
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 19:12:18 +0100 (CET)
Received: from localhost ([::1]:55220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwqob-0003Wa-99
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 13:12:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kwqL8-0006Aj-Mu
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 12:41:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:50168)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kwqL5-0001XI-A3
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 12:41:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609868506;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pmpf1YmolH18+Qtn7MDxWafKLVLo4r74GHQ0m4FctLE=;
 b=SlEsyZNW/gAWjUeuRhlqmcIBDIIxyIITPiDx6HIm3APQ0m/hN1GPU4fRO0Pq7+m8iBzbbM
 877WyGGQ1BrpUKquBao8l4hgCx5mcvneb5/2DMjbdPcDNHP3h7g6nquDm/fimkASA0o93L
 rRfgqRtaTQoBhcMiHszWz/E9TQTK/8c=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-36-3SxovBmpPFGSuDuNOwzatQ-1; Tue, 05 Jan 2021 12:41:45 -0500
X-MC-Unique: 3SxovBmpPFGSuDuNOwzatQ-1
Received: by mail-wr1-f71.google.com with SMTP id e12so127177wrp.10
 for <qemu-devel@nongnu.org>; Tue, 05 Jan 2021 09:41:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pmpf1YmolH18+Qtn7MDxWafKLVLo4r74GHQ0m4FctLE=;
 b=Wl8DpnJJVPznX/A8MxHf+kW6ZI/BXeM+ifuE3dtALYBfcNiZSDCcvA9cw8RBJcMskb
 mJv4cieQ7ODbWcMD5NElH+xZNL1tvVtXkFGl7Dr2ic//dDg8XYL/WEFl/Wr/kSjdiqT/
 vEeAb6XmVmsHHGM8pfh/0VmWTqsoW6YHGB3/YZiXo+RPI4/LlyBqbMbzIMpcb1HSHffr
 lap3Knvg6yK0osoWJWr2iRF+oFJ2O6UiVLhsSfD3ZBZNutwa51BKB+s8BPY8RTCktvqf
 0pLaF6bU2qAPxjBz9rvcEaI8ZEVNNBiBiKQ80kPAlAe8xE5oifdm+iCy7Vcjmk7601Hk
 DbDA==
X-Gm-Message-State: AOAM531oFwxzJ49AaqfU2m6f5kikfokXNJmAOn+mhbZdp8pM4HRrjqfc
 zDkk89pz7aXtsBrINf52XTnECsII0aW81tqeQBD0C86/NojIYbmNRqGyOayRanydmhxr2O9XsKS
 5OmPGh3shaJklMaI=
X-Received: by 2002:a05:6000:c9:: with SMTP id q9mr618981wrx.259.1609868503943; 
 Tue, 05 Jan 2021 09:41:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwVM/6wQRYcrEywwOcEdQMQPWAdxeLqPRTD5f6ZVI8Ymhzxmh6Yylt4NXtZBC+jgn0hpfSh/w==
X-Received: by 2002:a05:6000:c9:: with SMTP id q9mr618953wrx.259.1609868503668; 
 Tue, 05 Jan 2021 09:41:43 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id s13sm676348wra.53.2021.01.05.09.41.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Jan 2021 09:41:42 -0800 (PST)
Subject: Re: [PATCH] meson: Propagate gnutls dependency
To: Roman Bolshakov <r.bolshakov@yadro.com>
References: <20210102125213.41279-1-r.bolshakov@yadro.com>
 <CAFEAcA-X6DSKeyS4bbNe3tu-QFGxc1VM+Eoz_UMk-8jb--zq9g@mail.gmail.com>
 <ea49da2a-47f9-8ffe-8dbc-1974f34cb6f1@redhat.com>
 <X/NPRqMkdM0/IxTh@SPB-NB-133.local>
 <af0194cd-cdcc-44a3-f023-80d73d96c9e8@redhat.com>
 <X/R5xtvMn4PcSkTf@SPB-NB-133.local>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <359133ac-9fd0-8fea-14ac-9c422bd85185@redhat.com>
Date: Tue, 5 Jan 2021 18:41:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <X/R5xtvMn4PcSkTf@SPB-NB-133.local>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.249, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05/01/21 15:37, Roman Bolshakov wrote:
>> Does it work if you do:
>>
>> crypto_ss.add(authz, qom)
>> libcrypto = static_library('crypto', crypto_ss.sources() + genh,
>>                             dependencies: crypto_ss.dependencies(),
>>                             ...)
>> crypto = declare_dependency(link_whole: libcrypto,
>>                              dependencies: crypto_ss.dependencies())
>>
> 
> I tried that approach before I sent the patch in the subject. It
> produces duplicate symbols:
> 
>    duplicate symbol '_qauthz_pam_new' in:
>        libcrypto.fa(authz_pamacct.c.o)
>        libauthz.fa(authz_pamacct.c.o)
>    [...]
>    duplicate symbol '_object_property_set_qobject' in:
>        libcrypto.fa(qom_qom-qobject.c.o)                                                                                                                                                                                                                            libqom.fa(qom_qom-qobject.c.o)
> 
> My impression that it links in every static library that's mentioned in
> dependencies of static_library, so they grow like a snow ball. Patch
> below:

Okay, I'll look more into it.

Paolo

> diff --git a/block/meson.build b/block/meson.build
> index 7595d86c41..7eaf48c6dc 100644
> --- a/block/meson.build
> +++ b/block/meson.build
> @@ -40,7 +40,7 @@ block_ss.add(files(
>     'vmdk.c',
>     'vpc.c',
>     'write-threshold.c',
> -), zstd, zlib)
> +), crypto, zstd, zlib)
>   
>   softmmu_ss.add(when: 'CONFIG_TCG', if_true: files('blkreplay.c'))
>   
> diff --git a/hw/nvram/meson.build b/hw/nvram/meson.build
> index fd2951a860..1f2ed013b2 100644
> --- a/hw/nvram/meson.build
> +++ b/hw/nvram/meson.build
> @@ -1,6 +1,3 @@
> -# QOM interfaces must be available anytime QOM is used.
> -qom_ss.add(files('fw_cfg-interface.c'))
> -
>   softmmu_ss.add(files('fw_cfg.c'))
>   softmmu_ss.add(when: 'CONFIG_CHRP_NVRAM', if_true: files('chrp_nvram.c'))
>   softmmu_ss.add(when: 'CONFIG_DS1225Y', if_true: files('ds1225y.c'))
> diff --git a/io/meson.build b/io/meson.build
> index bcd8b1e737..a844271b17 100644
> --- a/io/meson.build
> +++ b/io/meson.build
> @@ -12,4 +12,4 @@ io_ss.add(files(
>     'dns-resolver.c',
>     'net-listener.c',
>     'task.c',
> -))
> +), crypto)
> diff --git a/meson.build b/meson.build
> index 372576f82c..1a8c653067 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1538,6 +1538,34 @@ libqemuutil = static_library('qemuutil',
>   qemuutil = declare_dependency(link_with: libqemuutil,
>                                 sources: genh + version_res)
>   
> +# QOM interfaces must be available anytime QOM is used.
> +qom_ss.add(files('hw/nvram/fw_cfg-interface.c'))
> +qom_ss = qom_ss.apply(config_host, strict: false)
> +libqom = static_library('qom', qom_ss.sources() + genh,
> +                        dependencies: [qom_ss.dependencies()],
> +                        name_suffix: 'fa')
> +
> +qom = declare_dependency(link_whole: libqom)
> +
> +authz_ss = authz_ss.apply(config_host, strict: false)
> +libauthz = static_library('authz', authz_ss.sources() + genh,
> +                          dependencies: [authz_ss.dependencies()],
> +                          name_suffix: 'fa',
> +                          build_by_default: false)
> +
> +authz = declare_dependency(link_whole: libauthz,
> +                           dependencies: qom)
> +
> +crypto_ss.add(authz)
> +crypto_ss = crypto_ss.apply(config_host, strict: false)
> +libcrypto = static_library('crypto', crypto_ss.sources() + genh,
> +                           dependencies: crypto_ss.dependencies(),
> +                           name_suffix: 'fa',
> +                           build_by_default: false)
> +
> +crypto = declare_dependency(link_whole: libcrypto,
> +                            dependencies: crypto_ss.dependencies())
> +
>   decodetree = generator(find_program('scripts/decodetree.py'),
>                          output: 'decode-@BASENAME@.c.inc',
>                          arguments: ['@INPUT@', '@EXTRA_ARGS@', '-o', '@OUTPUT@'])
> @@ -1652,31 +1680,6 @@ qemu_syms = custom_target('qemu.syms', output: 'qemu.syms',
>                                capture: true,
>                                command: [undefsym, nm, '@INPUT@'])
>   
> -qom_ss = qom_ss.apply(config_host, strict: false)
> -libqom = static_library('qom', qom_ss.sources() + genh,
> -                        dependencies: [qom_ss.dependencies()],
> -                        name_suffix: 'fa')
> -
> -qom = declare_dependency(link_whole: libqom)
> -
> -authz_ss = authz_ss.apply(config_host, strict: false)
> -libauthz = static_library('authz', authz_ss.sources() + genh,
> -                          dependencies: [authz_ss.dependencies()],
> -                          name_suffix: 'fa',
> -                          build_by_default: false)
> -
> -authz = declare_dependency(link_whole: libauthz,
> -                           dependencies: qom)
> -
> -crypto_ss = crypto_ss.apply(config_host, strict: false)
> -libcrypto = static_library('crypto', crypto_ss.sources() + genh,
> -                           dependencies: [crypto_ss.dependencies()],
> -                           name_suffix: 'fa',
> -                           build_by_default: false)
> -
> -crypto = declare_dependency(link_whole: libcrypto,
> -                            dependencies: [authz, qom])
> -
>   io_ss = io_ss.apply(config_host, strict: false)
>   libio = static_library('io', io_ss.sources() + genh,
>                          dependencies: [io_ss.dependencies()],


