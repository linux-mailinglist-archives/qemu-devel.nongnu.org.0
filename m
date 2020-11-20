Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA6F92BAF60
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 16:57:50 +0100 (CET)
Received: from localhost ([::1]:46058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kg8nF-000208-Ow
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 10:57:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kg8h1-0004Wq-Nj
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 10:51:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25094)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kg8gy-0004tD-LC
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 10:51:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605887479;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Arb26DKu/FN/dworWqOQ0tggMs+kYdAjhb+kHvuzadE=;
 b=bahC6eog2vwi0Km2IlEAxJ9M0vAGlhifX42femMt3HPq5oycklpf3zx0uYAOK46dPZ/rs5
 J9b76HyPDPjOBnDZqGKpZW05R26w2ma6iYtBkgxes2OCkNcG1b0+fGI1M3VPlVz6FbERoj
 QmYy5/3rol6jVZDNUyfmql8lHHLwtoM=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-567-YmJwx05aMKK9zKyGEpSi2Q-1; Fri, 20 Nov 2020 10:51:17 -0500
X-MC-Unique: YmJwx05aMKK9zKyGEpSi2Q-1
Received: by mail-wr1-f71.google.com with SMTP id e18so3526060wrs.23
 for <qemu-devel@nongnu.org>; Fri, 20 Nov 2020 07:51:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Arb26DKu/FN/dworWqOQ0tggMs+kYdAjhb+kHvuzadE=;
 b=ienDodsdkohwlbBCIGlJY472vFliK7sUn66GBX97EGWbj7AcgOHtHW3FWmRZQGtOPp
 4jA8tyXyDb5cDzJjB5wy/ph+QWOBbEVlyAUBIGTP5d7mN1CAp3NjHBhu6Sn12sS1BSve
 hJ/QFemGKaXbE9SMmzPtt0L35vD8L6zcVAglxcMPWeVm4TpEGbQDXGuxPsbaxIbv1/j3
 2vNE7a0G+IRPXoVqXt3rX8QfGlgGhjMCDmLTGn3Kwd3e3vdygx3uO2Y4RJb3517K96MV
 l+XlwkyvrWfv6lmWsPytn8N/oCYQUwF9SmiL3OXW9DzNEydYXZ3UvsM5jkaGKN2DVqAq
 UTqg==
X-Gm-Message-State: AOAM531f39DpHtOFqBDvSY89STUrd9o4ZlydV1/neWag/92xHq6RREo7
 a+AcT9QY6ZYK2KkiD3VdXQTwPoD0h3GLCpenPK4sTclr25XBEpJbWra/xzLP5JQXpn1/qQVs0Wc
 P1Iiel3Zlkn3v8KI=
X-Received: by 2002:a05:6000:1d2:: with SMTP id
 t18mr16806573wrx.14.1605887476815; 
 Fri, 20 Nov 2020 07:51:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyI3J/QIG8CmfZbEQggWhFcddNlDrDSFj4J41v2U1GRgCAcYZLg++BSXvL9Ap6rsa19pmRzrg==
X-Received: by 2002:a05:6000:1d2:: with SMTP id
 t18mr16806559wrx.14.1605887476597; 
 Fri, 20 Nov 2020 07:51:16 -0800 (PST)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id d3sm5617060wrg.16.2020.11.20.07.51.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Nov 2020 07:51:15 -0800 (PST)
Subject: Re: [PATCH] qboot: update to latest upstream
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20201120152408.164346-1-pbonzini@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <27102428-0218-c518-2f3f-86365d05b4eb@redhat.com>
Date: Fri, 20 Nov 2020 16:51:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201120152408.164346-1-pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
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
Cc: Michael Tokarev <mjt@tls.msk.ru>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/20/20 4:24 PM, Paolo Bonzini wrote:
> This also brings in two patches that Debian had to include,
> qboot_stop_using_inttypes.patch and qboot_no_jump_tables.diff.
> 
> Reported-by: Michael Tokarev <mjt@tls.msk.ru>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  pc-bios/qboot.rom | Bin 65536 -> 65536 bytes
>  roms/Makefile     |   8 ++++++--
>  roms/qboot        |   2 +-
>  3 files changed, 7 insertions(+), 3 deletions(-)
...
> diff --git a/roms/Makefile b/roms/Makefile
> index 7045e374d3..5ffe3317ac 100644
> --- a/roms/Makefile
> +++ b/roms/Makefile
> @@ -186,9 +186,13 @@ opensbi64-generic:
>  	cp opensbi/build/platform/generic/firmware/fw_dynamic.bin ../pc-bios/opensbi-riscv64-generic-fw_dynamic.bin
>  	cp opensbi/build/platform/generic/firmware/fw_dynamic.elf ../pc-bios/opensbi-riscv64-generic-fw_dynamic.elf
>  
> +MESON = meson
> +NINJA = ninja
>  qboot:
> -	$(MAKE) -C qboot
> -	cp qboot/bios.bin ../pc-bios/qboot.rom
> +	mkdir -p qboot/build
> +	$(MESON) setup $(if $(wildcard qboot/build/meson-private),--wipe,) qboot qboot/build
> +	$(NINJA) -C qboot/build
> +	cp qboot/build/bios.bin ../pc-bios/qboot.rom
>  
>  npcm7xx_bootrom:
>  	$(MAKE) -C vbootrom CROSS_COMPILE=$(arm_cross_prefix)
> diff --git a/roms/qboot b/roms/qboot
> index cb1c49e0cf..a5300c4949 160000
> --- a/roms/qboot
> +++ b/roms/qboot
> @@ -1 +1 @@
> -Subproject commit cb1c49e0cfac99b9961d136ac0194da62c28cf64
> +Subproject commit a5300c4949b8d4de2d34bedfaed66793f48ec948
> 

Maybe include shortlog in description?

$ git shortlog cb1c49e..a5300c4
Lorenz Brun (1):
      Fix initrd base address for PVH boot

Marc-Andre Lureau (1):
      Update README

Marc-André Lureau (1):
      Add meson build

Paolo Bonzini (2):
      limit C headers to freestanding ones
      record minimum version of meson that is needed

Sven Eckelmann (1):
      qboot: Disable PIE for ELF binary build step

kaihuan.pkh (1):
      support smbios


