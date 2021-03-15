Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DB2033BF10
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 15:54:10 +0100 (CET)
Received: from localhost ([::1]:46536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLobh-0006UH-AV
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 10:54:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lLoa3-0005gI-Lb
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 10:52:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32012)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lLoa1-0003xs-7A
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 10:52:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615819943;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ycE2TIG643HvCSXR43RDIK6Io8PwJgG2X18NJh0lk2g=;
 b=RMrwVXSskvpLYzKRlWum3Wf5q/wX+0x/94fexogrlAEN/NZhoHtxs8qh2totCtny4CJ/x2
 kAZ1TTx+CbsQF3P5lCzNxrxkqr39bGQXGvjN7FLmcohCcQCWmvOXZ6GSQEZxjVTh9lfJLw
 3IMsfGe82l62Ib/kj1Hu9glkM64oe14=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-287-bIViwJ_cOpusTXBRhT8p0g-1; Mon, 15 Mar 2021 10:52:21 -0400
X-MC-Unique: bIViwJ_cOpusTXBRhT8p0g-1
Received: by mail-wm1-f72.google.com with SMTP id b20so2601152wmj.3
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 07:52:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ycE2TIG643HvCSXR43RDIK6Io8PwJgG2X18NJh0lk2g=;
 b=h8lrv2ogpstWj5zd+HAOsSlPvHXyyNYFqRetVIzKenZW4cd8ugZU7lZvGHyywhoZDs
 mkbQb302GhmcQfnt+buC6pwOnCVLH5uNPKwIMA/8vlprGe2+wYyxyXgp7CUSzRFqjctr
 GD7jtAx8AG7kzUG6gGORXqlKpqGE4i2J6dlYrBUY18UImUDgC5KNBnZ77tj4YAMcjPwX
 P2V2qDMFbBI7pb6NrMwUqDS8eAXGhDaqbj1xD2XDXj1urYicV99zomI5hSAufOwUx1Zg
 VElveqThDHHgNXJl0O2o3FSdGgIPk0CcAPl/fKJo4KhZiWHn5wAE4WARGN1608a7Yybo
 KW3A==
X-Gm-Message-State: AOAM531WjLVTAq8F/0WuI3DM1NxVsr2PFN12rsqrQ919IDyGZnXyPFqq
 AfBC530xTrHh6SDwZLXjY4Y9anvudp0e5pbK0A+hKcJ5GS3ZOze6OHXZsx3cazBOAx+7A0ZJuGI
 h0ymBl8n1XBc7N3I=
X-Received: by 2002:adf:e68e:: with SMTP id r14mr31046wrm.273.1615819940361;
 Mon, 15 Mar 2021 07:52:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwBRBROMV7YBA75kkKYpr9P8I8CvygJVm92LctGBEg0OFMWVhmy01RWTW2CukdQpDTOsX4c+A==
X-Received: by 2002:adf:e68e:: with SMTP id r14mr31037wrm.273.1615819940209;
 Mon, 15 Mar 2021 07:52:20 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id u17sm10270049wmq.3.2021.03.15.07.52.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Mar 2021 07:52:19 -0700 (PDT)
Subject: Re: [RFC PATCH] configure: Poison (almost) all target-specific
 #defines
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20210315135410.221729-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <5f8be2a7-5baf-7cdc-42a1-954ea3aeba82@redhat.com>
Date: Mon, 15 Mar 2021 15:52:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210315135410.221729-1-thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/15/21 2:54 PM, Thomas Huth wrote:
> We are generating a lot of target-specific defines in the *-config-devices.h
> and *-config-target.h files. Using them in common code is wrong and leads
> to very subtle bugs since a "#ifdef CONFIG_SOMETHING" is not working there
> as expected. To avoid these issues, we are already poisoning some of the
> macros in include/exec/poison.h - but maintaining this list manually is
> cumbersome. Thus let's generate the list of poisoned macros automatically
> instead.
> Note that CONFIG_TCG (which is also defined in config-host.h) and

IIRC we can't poison CONFIG_XEN / CONFIG_HAX because they are
pulled in via "sysemu/hw_accel.h".

> CONFIG_USER_ONLY are special, so we have to filter these out.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  RFC since the shell stuff in "configure" is quite ugly ... maybe there's
>  a better way to do this via meson, but my meson-foo is still lacking...
> 
>  Makefile              | 2 +-
>  configure             | 5 +++++
>  include/exec/poison.h | 2 ++
>  3 files changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/Makefile b/Makefile
> index bcbbec71a1..4cab10a2a4 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -213,7 +213,7 @@ qemu-%.tar.bz2:
>  
>  distclean: clean
>  	-$(quiet-@)test -f build.ninja && $(NINJA) $(NINJAFLAGS) -t clean -g || :
> -	rm -f config-host.mak config-host.h*
> +	rm -f config-host.mak config-host.h* config-poison.h
>  	rm -f tests/tcg/config-*.mak
>  	rm -f config-all-disas.mak config.status
>  	rm -f roms/seabios/config.mak roms/vgabios/config.mak
> diff --git a/configure b/configure
> index f7d022a5db..c7b5df3a5c 100755
> --- a/configure
> +++ b/configure
> @@ -6441,6 +6441,11 @@ if test -n "${deprecated_features}"; then
>      echo "  features: ${deprecated_features}"
>  fi
>  
> +cat *-config-devices.h *-config-target.h | grep '^#define '  \
> +    | grep -v CONFIG_TCG | grep -v CONFIG_USER_ONLY \
> +    | sed -e 's/#define //' -e 's/ .*//' | sort -u \
> +    | sed -e 's/^/#pragma GCC poison /' > config-poison.h
> +
>  # Save the configure command line for later reuse.
>  cat <<EOD >config.status
>  #!/bin/sh
> diff --git a/include/exec/poison.h b/include/exec/poison.h
> index 4cd3f8abb4..9e55d5aec2 100644
> --- a/include/exec/poison.h
> +++ b/include/exec/poison.h
> @@ -4,6 +4,8 @@
>  #ifndef HW_POISON_H
>  #define HW_POISON_H
>  
> +#include "config-poison.h"
> +
>  #pragma GCC poison TARGET_I386
>  #pragma GCC poison TARGET_X86_64
>  #pragma GCC poison TARGET_AARCH64
> 


