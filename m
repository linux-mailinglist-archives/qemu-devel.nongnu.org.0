Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9699354C370
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jun 2022 10:28:51 +0200 (CEST)
Received: from localhost ([::1]:44784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1OOO-0004wW-W6
	for lists+qemu-devel@lfdr.de; Wed, 15 Jun 2022 04:28:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1o1OHU-0005Ns-Rv
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 04:21:40 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:40953)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1o1OHT-0000Ar-0c
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 04:21:40 -0400
Received: by mail-wr1-x433.google.com with SMTP id w17so6779918wrg.7
 for <qemu-devel@nongnu.org>; Wed, 15 Jun 2022 01:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=yjQ9PQCj3BzsLXJCh6tV2Co5qK5ki+EyDIWIKt4DL0o=;
 b=naNzcmps3jmyIfhCzfU/uiaZlo1DMqzwKp4FY8o1tndd1M4BozmD8MyGpZXaZoJT30
 l4g37cLzIysf7iGDWnT3IGXp56mLBYMrB+IbGbkatML4HBkP7WJ0LwZHmhtOo1bZlTVB
 njs0gU4C6D4z3ZBmrTxgt8c3j65wCWiKNVMI644GIUA3oAlGsNl2OPUWvsCKw5RTOKmw
 53Uz4gh+VPrzGCOrlpQjcbPTPVtpW3So7w7q0nWhYFqgYenO4W6CfQ8m6njZE5st5WP9
 7Zj7QlBpV+fPxykkbXFQnTfjf7gpsB6y4/3ZkezwcM0NQSvXGzZ3TFYmVw+laY0ZVldg
 wBHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=yjQ9PQCj3BzsLXJCh6tV2Co5qK5ki+EyDIWIKt4DL0o=;
 b=ReJ/oXejWWE/aqY4ie9HEJCcZcVdv1GVICMyKTy9s53AGJH0nfVduEjEIvmFdbjQoe
 7DsvEjQn6kEtU8dU9ERz5bhZEg+Bv55Sjn/1UMhZfZzAZYcxqeo8MBsVhMqg32xife6+
 TzqQ7xhQTQHg3sgay9E+jHcvKrFZ42l+25jT71PaUfGo33fxZQLfXedJV0FuhODqrkSp
 OTIhhyLicJccHThOGXhNps+lKAYDdCRYjPVysHJfS23JC1C+l82vw1PRahaKpXA3d9NU
 0q50SyBEpl8+i1gcC3VtarMod9f4OpibSMCtwkuE4RYak9MaOXtAo9IKeCvMDfh8y4kZ
 o9lg==
X-Gm-Message-State: AJIora8PVQzB1sLV9+MAImNyvwmQjGt638GV7ZspI6lA+RQ6gQxLsAob
 7kBK7HFPzdoPg400eXkjYfI=
X-Google-Smtp-Source: AGRyM1uDvISPcCkC8p+nOcJ1b367KyRewitPN/r8egaUms6768v8FvP8ZNqhY66PDhfCsiw2W5rwWw==
X-Received: by 2002:a5d:47a4:0:b0:218:5829:dced with SMTP id
 4-20020a5d47a4000000b002185829dcedmr9086295wrb.56.1655281297022; 
 Wed, 15 Jun 2022 01:21:37 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 p124-20020a1c2982000000b0039c7dbafa7asm1588237wmp.19.2022.06.15.01.21.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Jun 2022 01:21:36 -0700 (PDT)
Message-ID: <52cdf6e7-de8b-cb5e-8e88-c2ea3d4e1d04@redhat.com>
Date: Wed, 15 Jun 2022 10:21:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v4 2/4] datadir: Use bundle mechanism
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang
 <jasowang@redhat.com>, qemu-devel@nongnu.org,
 Programmingkid <programmingkidx@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>, =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?=
 <berrange@redhat.com>
References: <20220614210746.78911-1-akihiko.odaki@gmail.com>
 <20220614210746.78911-3-akihiko.odaki@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220614210746.78911-3-akihiko.odaki@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/14/22 23:07, Akihiko Odaki wrote:
> )
> +
>   roms = []
>   if unpack_edk2_blobs
>     fds = [
> @@ -20,6 +22,9 @@ if unpack_edk2_blobs
>                     install: get_option('install_blobs'),
>                     install_dir: qemu_datadir,
>                     command: [ bzip2, '-dc', '@INPUT0@' ])
> +
> +    run_command('ln', '-sf', '../../../pc-bios' / f, qemu_bundledir / qemu_datadir,
> +                check: true)
>     endforeach
>   endif
>   
> @@ -85,15 +90,11 @@ blobs = [
>     'vof-nvram.bin',
>   ]
>   
> -ln_s = [find_program('ln', required: true), '-sf']
> +install_data(blobs, install_dir: qemu_datadir)

This needs to be conditional on get_option('install_blobs').

Paolo

>   foreach f : blobs
> -  roms += custom_target(f,
> -                build_by_default: have_system,
> -                output: f,
> -                input: files('meson.build'),            # dummy input
> -                install: get_option('install_blobs'),
> -                install_dir: qemu_datadir,
> -                command: [ ln_s, meson.project_source_root() / 'pc-bios' / f, '@OUTPUT@' ])
> +  run_command('ln', '-sf', meson.current_source_dir() / f, qemu_bundledir / qemu_datadir,
> +              check: true)
>   endforeach
>   
>   subdir('descriptors')


