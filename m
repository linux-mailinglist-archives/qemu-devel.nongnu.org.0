Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88DAC2D9CB9
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 17:29:53 +0100 (CET)
Received: from localhost ([::1]:60238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koqjP-00017N-NS
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 11:29:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1koqi6-0000Ny-Mh
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 11:28:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:37232)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1koqi4-0006pr-6F
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 11:28:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607963306;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hdcDuuLuuChlHmYq6mMZOYHxWlqWMYyu9pJHmS77Tq0=;
 b=SFQn81iOtPwZbRSi+ELwU58uDbtHvLrEOcaEfz4kynArw5f0s2KV8gaG8xcLWxVw+mHpkJ
 H5211Kizp6eTWpLgX5qkPzNgJcepytjl61d6J3XU7W0Mx9p0uri0lBFavYPL7/wqZMJ/YN
 zHxDmYvNCZ3FfgSPK3Sfb/yRGs0QLEI=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-456-CiBhImdTOPiUTCZF3v5wJA-1; Mon, 14 Dec 2020 11:28:23 -0500
X-MC-Unique: CiBhImdTOPiUTCZF3v5wJA-1
Received: by mail-ed1-f71.google.com with SMTP id g25so8517548edu.4
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 08:28:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hdcDuuLuuChlHmYq6mMZOYHxWlqWMYyu9pJHmS77Tq0=;
 b=XrrWlZk7r/VqdgFzTgUBD8NyOyuY0BE+PLTmuegrey+F00B5Bk40bn5TGi/MmxOd1e
 +UIhAqTHJGu8NszHOrKGQtTskfRb1WM2Bvi+Q7MVrl2m1ZY8XMyDPjesnwooi0hd7f/h
 K1ID8WgXItpcwczXiqcq7JMbf5fESQOPJfzLLAbpJ0eK2Y94Li30JqKg/kgfThkRF27Y
 x0bhR4XNj57EBS/5gauFDd2xOgHZHjHbjaoaka5Kxkdvj05NQVs++ZQfR5a+2dF2XxOB
 Obp9YqwcLxSCng0UgSB4G5WUagPk1nQ6kXHM/+0yM8sRezdQyf8hedSS2DgoztnTx9/w
 hlVg==
X-Gm-Message-State: AOAM53041KrjSNUrTUekd4z7/GdXCevIhR+yLRzlU06YW2ABYrIIZ/fp
 qoMaFLia3IazZZSx88oXtaKKR9Idcsy8aNqZGu2Y6vzRB0t2M8WhlbDaZCll8YRwQ2KNVfmQJ10
 NL4JCBQ54vxi/kOEWnHRfm2NNl3MIsToephZvsbAlOSd0dN1/oXeGvgv36iIZyxdi8O4=
X-Received: by 2002:a50:d88c:: with SMTP id p12mr8099739edj.370.1607963301726; 
 Mon, 14 Dec 2020 08:28:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwTaKmxIuuF5dcafN7PALiaQY9rKNEADWKUmsDFhKF3mnTGjpKTCu/bOUMZBztrgojcvDYLrQ==
X-Received: by 2002:a50:d88c:: with SMTP id p12mr8099715edj.370.1607963301459; 
 Mon, 14 Dec 2020 08:28:21 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id lr24sm13995473ejb.41.2020.12.14.08.28.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Dec 2020 08:28:20 -0800 (PST)
Subject: Re: [PATCH] build: -no-pie is no functional linker flag
To: Christian Ehrhardt <christian.ehrhardt@canonical.com>,
 qemu-devel <qemu-devel@nongnu.org>
References: <20201214150938.1297512-1-christian.ehrhardt@canonical.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <aaddf07e-fab6-d268-7d1d-ecdd446a6c12@redhat.com>
Date: Mon, 14 Dec 2020 17:28:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201214150938.1297512-1-christian.ehrhardt@canonical.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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

On 14/12/20 16:09, Christian Ehrhardt wrote:
> Recent binutils changes dropping unsupported options [1] caused a build
> issue in regard to the optionroms.
> 
>    ld -m elf_i386 -T /<<PKGBUILDDIR>>/pc-bios/optionrom//flat.lds -no-pie \
>      -s -o multiboot.img multiboot.o
>    ld.bfd: Error: unable to disambiguate: -no-pie (did you mean --no-pie ?)
> 
> This isn't really a regression in ld.bfd, filing the bug upstream
> revealed that this never worked as a ld flag [2] - in fact it seems we
> were by accident setting --nmagic).
> 
> Since it never had the wanted effect this usage of LDFLAGS_NOPIE, should be
> droppable without any effect. This also is the only use-case of LDFLAGS_NOPIE
> in .mak, therefore we can also remove it from being added there.
> 
> [1]: https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=983d925d
> [2]: https://sourceware.org/bugzilla/show_bug.cgi?id=27050#c5
> 
> Signed-off-by: Christian Ehrhardt <christian.ehrhardt@canonical.com>

-no-pie (not -fno-pie!) _can_ be passed to gcc when it is used to drive 
the linker.  But indeed since the only use is in an "ld" invocation, the 
patch is okay.  Thanks!

Paolo

> ---
>   configure                  | 3 ---
>   pc-bios/optionrom/Makefile | 1 -
>   2 files changed, 4 deletions(-)
> 
> diff --git a/configure b/configure
> index 3f823ed163..61c17c2dde 100755
> --- a/configure
> +++ b/configure
> @@ -2133,7 +2133,6 @@ EOF
>   # Check we support --no-pie first; we will need this for building ROMs.
>   if compile_prog "-Werror -fno-pie" "-no-pie"; then
>     CFLAGS_NOPIE="-fno-pie"
> -  LDFLAGS_NOPIE="-no-pie"
>   fi
>   
>   if test "$static" = "yes"; then
> @@ -2149,7 +2148,6 @@ if test "$static" = "yes"; then
>     fi
>   elif test "$pie" = "no"; then
>     CONFIGURE_CFLAGS="$CFLAGS_NOPIE $CONFIGURE_CFLAGS"
> -  CONFIGURE_LDFLAGS="$LDFLAGS_NOPIE $CONFIGURE_LDFLAGS"
>   elif compile_prog "-Werror -fPIE -DPIE" "-pie"; then
>     CONFIGURE_CFLAGS="-fPIE -DPIE $CONFIGURE_CFLAGS"
>     CONFIGURE_LDFLAGS="-pie $CONFIGURE_LDFLAGS"
> @@ -6768,7 +6766,6 @@ echo "QEMU_CXXFLAGS=$QEMU_CXXFLAGS" >> $config_host_mak
>   echo "GLIB_CFLAGS=$glib_cflags" >> $config_host_mak
>   echo "GLIB_LIBS=$glib_libs" >> $config_host_mak
>   echo "QEMU_LDFLAGS=$QEMU_LDFLAGS" >> $config_host_mak
> -echo "LDFLAGS_NOPIE=$LDFLAGS_NOPIE" >> $config_host_mak
>   echo "LD_I386_EMULATION=$ld_i386_emulation" >> $config_host_mak
>   echo "EXESUF=$EXESUF" >> $config_host_mak
>   echo "HOST_DSOSUF=$HOST_DSOSUF" >> $config_host_mak
> diff --git a/pc-bios/optionrom/Makefile b/pc-bios/optionrom/Makefile
> index 084fc10f05..30771f8d17 100644
> --- a/pc-bios/optionrom/Makefile
> +++ b/pc-bios/optionrom/Makefile
> @@ -41,7 +41,6 @@ override CFLAGS += $(call cc-option, $(Wa)-32)
>   
>   LD_I386_EMULATION ?= elf_i386
>   override LDFLAGS = -m $(LD_I386_EMULATION) -T $(SRC_DIR)/flat.lds
> -override LDFLAGS += $(LDFLAGS_NOPIE)
>   
>   all: multiboot.bin linuxboot.bin linuxboot_dma.bin kvmvapic.bin pvh.bin
>   
> 


