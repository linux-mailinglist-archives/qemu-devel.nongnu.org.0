Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DBE069D2D0
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 19:38:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUB1a-0002su-5f; Mon, 20 Feb 2023 13:36:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pUB1V-0002sB-AZ
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 13:36:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pUB1T-00031o-9K
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 13:36:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676918182;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Iff1snzDDehOioWpJJfbhIB/fkqMc2kt9RFtFj3lTrk=;
 b=PGUY5LiSs0YRNbi3GJIgjGxbl05+E5FUM7tua3KQEJ/65e4vvryxjhUHTqYHjmI+Ihy6Le
 mfyH4rNqA3y53lpbOPmluTh6/LC7pCF0yNI5zQnP2fW6OVp+/WwXE/j6aNDbpiZDMumd5T
 82DDOYrbImhnWe8RoIAZ0xbz2r+9Bmg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-617-Vsr5mbY1PtOHdXd0IZnDLA-1; Mon, 20 Feb 2023 13:35:16 -0500
X-MC-Unique: Vsr5mbY1PtOHdXd0IZnDLA-1
Received: by mail-wm1-f72.google.com with SMTP id
 e22-20020a05600c219600b003e000facbb1so818751wme.9
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 10:35:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Iff1snzDDehOioWpJJfbhIB/fkqMc2kt9RFtFj3lTrk=;
 b=IinnuJ4Rle47terjmoXZpNVWfHFDgu4hGZIPzQcZdGeR1BWrKO9HWCr03XDM23gqcm
 LO+MiGKi2DLiDVU9Pk6aTElsmI4flMrLvEb3ATmmIdshrtVRa/shGPsjhu7mvewzHYtZ
 OTQ79DyTqeV1vEGu3OTHo9uGb5Lxl59Mp8NfHvQTuMGF9PKuQ/yTpRgF+EE8wSN/7cz/
 2wTau7G9WgUVOeNmSZWLcdtMRrH8mOI+ypSdc/o1eD/A9DgmIrnw23Cwh8j9QzDARL1W
 DDZIsZ5dz4phvPi/cA91yS4CR3TcH48eoUjtfa8aX7E7satAZPhslij/uS9TeWR2G5so
 QE5w==
X-Gm-Message-State: AO0yUKVDuMQzD1rBZgzHcrb3NCp/KvKUoXWDaDrAWoyH3Wq+jkbnBCar
 MLbHqTrGlv98Y0Wt2jwtMfFzwRpK4famIAVY1YEn82uklLaoCZKS1swd3nfXmkCyYM43lCSm9wd
 cNuBLBw3Ftm8zAbk=
X-Received: by 2002:a5d:4208:0:b0:2c3:db4f:f336 with SMTP id
 n8-20020a5d4208000000b002c3db4ff336mr2263769wrq.39.1676918115862; 
 Mon, 20 Feb 2023 10:35:15 -0800 (PST)
X-Google-Smtp-Source: AK7set89QqYoRj232eL62Lbq1FhbmKA8MULE47OhtCu3blN7jom5dIr0PEKL4APOZgugrSn68G1e9A==
X-Received: by 2002:a5d:4208:0:b0:2c3:db4f:f336 with SMTP id
 n8-20020a5d4208000000b002c3db4ff336mr2263755wrq.39.1676918115562; 
 Mon, 20 Feb 2023 10:35:15 -0800 (PST)
Received: from [192.168.8.104] (tmo-100-40.customers.d1-online.com.
 [80.187.100.40]) by smtp.gmail.com with ESMTPSA id
 p14-20020a5d4e0e000000b002c5a790e959sm4844951wrt.19.2023.02.20.10.35.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Feb 2023 10:35:14 -0800 (PST)
Message-ID: <2bbc1ede-e2fa-d2f0-c77d-8c66d0130a5b@redhat.com>
Date: Mon, 20 Feb 2023 19:35:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH V2] meson: fix dependency on qemu-keymap
Content-Language: en-US
To: Steve Sistare <steven.sistare@oracle.com>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philippe.mathieu.daude@gmail.com>
References: <1675708442-74966-1-git-send-email-steven.sistare@oracle.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <1675708442-74966-1-git-send-email-steven.sistare@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 06/02/2023 19.34, Steve Sistare wrote:
> When qemu-keymap is not available on the host, and enable-xkbcommon
> is specified, parallel make fails with:
> 
>    % make clean
>    ...
>    % make -j 32
>    ...
>    FAILED: pc-bios/keymaps/is
>    ./qemu-keymap -f pc-bios/keymaps/is -l is
>    /bin/sh: ./qemu-keymap: No such file or directory
>    ... many similar messages ...
> 
> The code always runs find_program, rather than waiting to build
> qemu-keymap, because it looks for CONFIG_XKBCOMMON in config_host
> rather than config_host_data.  Making serially succeeds, by soft
> linking files from pc-bios/keymaps, but that is not the desired
> result for enable-xkbcommon.
> 
> Examining all occurrences of 'in config_host' for similar bugs shows one
> instance in the docs, which is also fixed here.
> 
> Fixes: 4113f4cfee ("meson: move xkbcommon to meson")
> 
> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
> ---
...
> diff --git a/pc-bios/keymaps/meson.build b/pc-bios/keymaps/meson.build
> index 06c75e6..158a3b4 100644
> --- a/pc-bios/keymaps/meson.build
> +++ b/pc-bios/keymaps/meson.build
> @@ -33,7 +33,7 @@ keymaps = {
>     'tr': '-l tr',
>   }
>   
> -if meson.is_cross_build() or 'CONFIG_XKBCOMMON' not in config_host
> +if meson.is_cross_build() or not xkbcommon.found()
>     native_qemu_keymap = find_program('qemu-keymap', required: false, disabler: true)
>   else
>     native_qemu_keymap = qemu_keymap

Seems like this is breaking in the CI:

  https://gitlab.com/thuth/qemu/-/jobs/3802437551#L2356

Not sure why it's only happening now, and not before...
maybe the build was picking up a locally instlled qemu-keymap before your 
change?

  Thomas



