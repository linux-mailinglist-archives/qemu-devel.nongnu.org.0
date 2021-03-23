Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F6E9346625
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 18:19:50 +0100 (CET)
Received: from localhost ([::1]:59760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOkh3-0000Ql-9s
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 13:19:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lOjnp-0007XF-75
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 12:22:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52496)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lOjnm-0003NO-Hw
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 12:22:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616516561;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h4em2myByfUZq6aD+qNSwicdK69Ha4YNIvNP1dylNU0=;
 b=WR+irMIo9gQMrNvw5hVd/TVPl4L4c5PA9jjKJMXVP9p6dm5j4lATZSmqDXwmMB0q0fWqQ5
 pvU6Q3ghSXddAz0rx3EqgEP4nADzdtYofe2b7p6SoZhyLO8EL+Makbh7HOIh4Z9odhVv9e
 2sLTJKrBtqmEcnH9aEccI8B9hggq44Q=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-525-xpwc2mn4O8GfcjtRBaYVXQ-1; Tue, 23 Mar 2021 12:22:39 -0400
X-MC-Unique: xpwc2mn4O8GfcjtRBaYVXQ-1
Received: by mail-wm1-f70.google.com with SMTP id y9so680876wma.4
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 09:22:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=h4em2myByfUZq6aD+qNSwicdK69Ha4YNIvNP1dylNU0=;
 b=LEQPOfSpFEuyXq1aiT5fZ7kSU4cIBjXv0+op0B23BARw68//FZFY3gAVgXjxC9Zl2m
 0LvTuhN/3VwsXSzK0K53s9oK1rl5A4CkH4QEhxEcsv/ZE37In5z6uHK2zN8aTN+Krogi
 /ANzqXq4p4FiGqhBCbG7gFheMIm4XdHGhG7FK5JrHZ13M3KwLRHh/0bmbCx07ynif+cj
 9cWruu6jDLjWcgPglw7kkGsMcAXBWLMUx9ar6rw3snmCt62n/WSUx6MYD0SfxZ0SqiwN
 72leaGBXgs6BhTa1f7Xo5V7M36kpI1vS48NU0IK0hDRbzx1N6yVqHrWA9R9vb1gnBBHa
 gcPA==
X-Gm-Message-State: AOAM532kmrTzndvPYMHLNQ7xauhjUKr/Ct03DqM0ytAxWw93UR2hMIID
 gSDQH2CdEfkmndgdnv/kDrTj8jHuKv/BLiRyllLmI2pk4Q1X2i4mKQT1MOnSdionQ7rJx8LP77g
 i1KF7hcGcFzV/7xU=
X-Received: by 2002:adf:ec46:: with SMTP id w6mr4751725wrn.213.1616516558326; 
 Tue, 23 Mar 2021 09:22:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwPgcSsYk5YLTR2dM7RnQe7QAdS0ujAsMa/qj6lMVGgP6Jphxdg0YTSp9OMyi9C7M31hXO8Tg==
X-Received: by 2002:adf:ec46:: with SMTP id w6mr4751708wrn.213.1616516558121; 
 Tue, 23 Mar 2021 09:22:38 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id v189sm3173558wme.39.2021.03.23.09.22.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Mar 2021 09:22:37 -0700 (PDT)
Subject: Re: [RFC PATCH 01/13] blobs: Use Meson source_set to store blob files
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210323155132.238193-1-f4bug@amsat.org>
 <20210323155132.238193-2-f4bug@amsat.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <2dd5d098-4b8e-8deb-6756-2a97588d3184@redhat.com>
Date: Tue, 23 Mar 2021 17:22:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210323155132.238193-2-f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23/03/21 16:51, Philippe Mathieu-Daudé wrote:
> As we want to conditionally install blob files,
> declare them using a source set.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   pc-bios/meson.build | 10 +++++++---
>   1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/pc-bios/meson.build b/pc-bios/meson.build
> index f2b32598af7..1c4074bcb0d 100644
> --- a/pc-bios/meson.build
> +++ b/pc-bios/meson.build
> @@ -1,3 +1,5 @@
> +blobs_ss = ss.source_set()
> +
>   if install_edk2_blobs
>     fds = [
>       'edk2-aarch64-code.fd',
> @@ -22,7 +24,7 @@
>     endforeach
>   endif
>   
> -blobs = files(
> +blobs_ss.add(files(
>     'bios.bin',
>     'bios-256k.bin',
>     'bios-microvm.bin',
> @@ -81,10 +83,12 @@
>     'opensbi-riscv32-generic-fw_dynamic.elf',
>     'opensbi-riscv64-generic-fw_dynamic.elf',
>     'npcm7xx_bootrom.bin',
> -)
> +))
> +
> +blobs_ss = blobs_ss.apply(config_host, strict: false)
>   
>   if get_option('install_blobs')
> -  install_data(blobs, install_dir: qemu_datadir)
> +  install_data(blobs_ss.sources(), install_dir: qemu_datadir)
>   endif
>   
>   subdir('descriptors')
> 

If you have no conditions, you can also use an array.

Paolo


