Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 559FD2B78C0
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 09:34:38 +0100 (CET)
Received: from localhost ([::1]:39312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfIvF-0003ZX-83
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 03:34:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kfIrJ-0007dd-0v
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 03:30:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37338)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kfIrH-0004RE-1h
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 03:30:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605688229;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UX7dvaKeBv8SKBcNyc1gXrxC2CdqoQDAWZVSb3yzJx8=;
 b=g/bahk5ca2jixjwXPK7aV+5oiD/U818AyfJ0smxGCITVEgR/PzKkg6bmX9tSkvi0G1H7dg
 4qPOeU/wR+iujS8/6ERBec/evzVvCS4gZGnKBDhOelBGR8tgyd8vschKDEs8ieCJfEowln
 aoa9vsIo+y3lomJotGtSxFrpT6JLyUw=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-409-aHGNnzNOMcup5zEfdUsWig-1; Wed, 18 Nov 2020 03:30:27 -0500
X-MC-Unique: aHGNnzNOMcup5zEfdUsWig-1
Received: by mail-ed1-f71.google.com with SMTP id bm10so502244edb.1
 for <qemu-devel@nongnu.org>; Wed, 18 Nov 2020 00:30:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UX7dvaKeBv8SKBcNyc1gXrxC2CdqoQDAWZVSb3yzJx8=;
 b=ueBxXaNucygPMMiAktyLE+4K3p3LErKicqKh3fBDUxG9nT9gutrRoM8xP5nv2MkE/b
 ecz43mKervfiVeX30KCMPj38j0nmXZMEvucIy5WnIDJWvCORNNfIeIOYl3iW1ar08Y9g
 SjmDe/OYxQy9S8Ndc4i+uzaBv1eA5Gek7LOqjkCF4XW6YBqfSJoONk4hWNkX6aeJjQWB
 EdaYNKF0hW6yFo8Z1DmU9NaJPcOVZ1MKwAh9f0Zxbqg3ZWMghOlLb8sZxgGF/e8tSl6F
 G41A+/Z7K13wHg9364f7Llz//wHwcR8SmbGs0cSMZF0AhkGEf+85hqO2lMREd9DWREtG
 BP2g==
X-Gm-Message-State: AOAM533wuPpxeDf7l24Oq0ozRusNIorQBkt859lVlUqcK0H+1ByeFd2C
 5wIh+yswNz1xZgxhXveSvcbtyVRhWmFGUOQoxv85tuqqgqzEsje59frFftdasOmCID+yA3LTO1L
 mYfIKXLfsvsd6Br8=
X-Received: by 2002:aa7:ce8d:: with SMTP id y13mr11627021edv.65.1605688225941; 
 Wed, 18 Nov 2020 00:30:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzUbmxpAQzTnoTky76A04hpMJRRzuHdZ5MlacnhheMT1rv2qgQ6rZnVbW6plNTJPTK30G0Row==
X-Received: by 2002:aa7:ce8d:: with SMTP id y13mr11627003edv.65.1605688225723; 
 Wed, 18 Nov 2020 00:30:25 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id n11sm13114373eds.3.2020.11.18.00.30.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Nov 2020 00:30:25 -0800 (PST)
Subject: Re: [PATCH for-5.2] meson: Fix build with --disable-guest-agent-msi
To: Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org,
 Michael Roth <mdroth@linux.vnet.ibm.com>
References: <20201117201834.408892-1-sw@weilnetz.de>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <f631a213-1e8c-3ca7-5adc-5590b5897bbc@redhat.com>
Date: Wed, 18 Nov 2020 09:30:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201117201834.408892-1-sw@weilnetz.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/18 00:38:29
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17/11/20 21:18, Stefan Weil wrote:
> The QGA MSI target requires several macros which are only available
> without --disable-guest-agent-msi.
> 
> Don't define that target if configure was called with --disable-guest-agent-msi.
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>   qga/meson.build | 36 +++++++++++++++++++-----------------
>   1 file changed, 19 insertions(+), 17 deletions(-)
> 
> diff --git a/qga/meson.build b/qga/meson.build
> index 53ba6de5f8..520af6ce9b 100644
> --- a/qga/meson.build
> +++ b/qga/meson.build
> @@ -61,23 +61,25 @@ if targetos == 'windows'
>       if 'CONFIG_QGA_VSS' in config_host and 'QEMU_GA_MSI_WITH_VSS' in config_host
>         deps += qga_vss
>       endif
> -    qga_msi = custom_target('QGA MSI',
> -                            input: files('installer/qemu-ga.wxs'),
> -                            output: 'qemu-ga-@0@.msi'.format(config_host['ARCH']),
> -                            depends: deps,
> -                            command: [
> -                              find_program('env'),
> -                              'QEMU_GA_VERSION=' + config_host['QEMU_GA_VERSION'],
> -                              'QEMU_GA_MANUFACTURER=' + config_host['QEMU_GA_MANUFACTURER'],
> -                              'QEMU_GA_DISTRO=' + config_host['QEMU_GA_DISTRO'],
> -                              'BUILD_DIR=' + meson.build_root(),
> -                              wixl, '-o', '@OUTPUT0@', '@INPUT0@',
> -                              config_host['QEMU_GA_MSI_ARCH'].split(),
> -                              config_host['QEMU_GA_MSI_WITH_VSS'].split(),
> -                              config_host['QEMU_GA_MSI_MINGW_DLL_PATH'].split(),
> -                            ])
> -    all_qga += [qga_msi]
> -    alias_target('msi', qga_msi)
> +    if 'CONFIG_QGA_MSI' in config_host
> +      qga_msi = custom_target('QGA MSI',
> +                              input: files('installer/qemu-ga.wxs'),
> +                              output: 'qemu-ga-@0@.msi'.format(config_host['ARCH']),
> +                              depends: deps,
> +                              command: [
> +                                find_program('env'),
> +                                'QEMU_GA_VERSION=' + config_host['QEMU_GA_VERSION'],
> +                                'QEMU_GA_MANUFACTURER=' + config_host['QEMU_GA_MANUFACTURER'],
> +                                'QEMU_GA_DISTRO=' + config_host['QEMU_GA_DISTRO'],
> +                                'BUILD_DIR=' + meson.build_root(),
> +                                wixl, '-o', '@OUTPUT0@', '@INPUT0@',
> +                                config_host['QEMU_GA_MSI_ARCH'].split(),
> +                                config_host['QEMU_GA_MSI_WITH_VSS'].split(),
> +                                config_host['QEMU_GA_MSI_MINGW_DLL_PATH'].split(),
> +                              ])
> +      all_qga += [qga_msi]
> +      alias_target('msi', qga_msi)
> +    endif
>     endif
>   else
>     install_subdir('run', install_dir: get_option('localstatedir'))
> 

Queued, thanks.

Paolo


