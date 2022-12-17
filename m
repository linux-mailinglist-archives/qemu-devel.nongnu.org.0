Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27DB464F918
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Dec 2022 14:28:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6XEf-0007rB-ET; Sat, 17 Dec 2022 08:28:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p6XEd-0007pa-8u
 for qemu-devel@nongnu.org; Sat, 17 Dec 2022 08:28:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p6XEb-0001e2-Ic
 for qemu-devel@nongnu.org; Sat, 17 Dec 2022 08:28:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671283692;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Fs8KztNSdXaBcBM/anC7iseVMZweNElky7BkV/WDXRU=;
 b=EFIuBF7s50baVHfL5ZaJhh4GBUeUs8e9iM30tBfzPnXYemWKVR4w+D2PvDctw8adyN8V1X
 0pds8cgicr7cBeghdn91J1yA1lfRxP/NlJiHAophqn5TltT5bCKA444j4ZDbLp7fIEkw4N
 bcVjC2AjeB2Y6I+qkEvTG+V5LUTUObs=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-50-2u1UX3W6Pc2j64e5HeIkxQ-1; Sat, 17 Dec 2022 08:28:10 -0500
X-MC-Unique: 2u1UX3W6Pc2j64e5HeIkxQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 b18-20020a056402351200b004761159f677so2540859edd.6
 for <qemu-devel@nongnu.org>; Sat, 17 Dec 2022 05:28:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Fs8KztNSdXaBcBM/anC7iseVMZweNElky7BkV/WDXRU=;
 b=T0MJlrDIgB++T+IUxwhWz69P2nMI3UpJtF94byVdYXGFkybFW3APus1ZIb1loDS++R
 LtAFPhJnjLdtuWvDL9LjMqzcyne4gZyuxMqfFy7fnnngA0Vq1WaHyrVhDW1vIJ4EH6y0
 koS2Fzqf/quYekovfPxPe21WNXp0JYLDeloRg0SorrkGRbZj05CEgSsj4ee+Zbr1Plea
 pspYcZWbcZw2ZCsA7pJ8UJsDQtDF+pAFpnOJUGLvn6M9qSWM8gOSOfFWGrY+WrrtM+/T
 lS9Nq0rXLYm0CgrSWscqiPxy+Tl7gYQbrW4MGv24Tyn3x4MugW0T8Oy+E+6Ora7TcLCH
 U/8w==
X-Gm-Message-State: ANoB5pnxFo6maynSUtiMs9i1R52XCWykDpUUIs40minUZr2swWh/AcCE
 1V/hPPZm/0WFB1ahhgSkrORuY5PyOQm2E+XL1mZZK6b2eXyh7QJGiFT4NItyRtuCmxuZ4dFMkZi
 8Qxx6/zHEjufrhPg=
X-Received: by 2002:a17:906:8610:b0:7c0:f5d7:cac7 with SMTP id
 o16-20020a170906861000b007c0f5d7cac7mr41153187ejx.67.1671283689673; 
 Sat, 17 Dec 2022 05:28:09 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4QdSaFxCvJvCTEBxKHmhr8sIxdp4eBJyZW2L9Qn78k7jMdieQvsfilbgi1I5fok259cq7yog==
X-Received: by 2002:a17:906:8610:b0:7c0:f5d7:cac7 with SMTP id
 o16-20020a170906861000b007c0f5d7cac7mr41153181ejx.67.1671283689461; 
 Sat, 17 Dec 2022 05:28:09 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:e3ec:5559:7c5c:1928?
 ([2001:b07:6468:f312:e3ec:5559:7c5c:1928])
 by smtp.googlemail.com with ESMTPSA id
 up2-20020a170907cc8200b007aea1dc1840sm1987586ejc.111.2022.12.17.05.28.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 17 Dec 2022 05:28:08 -0800 (PST)
Message-ID: <31003f9a-5392-67ee-9ef2-01794c09510c@redhat.com>
Date: Sat, 17 Dec 2022 14:28:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH] meson: Clean up some dependencies regarding qemu-system
Content-Language: en-US
To: Helge Deller <deller@gmx.de>, Markus Armbruster <armbru@redhat.com>,
 Michael Roth <michael.roth@amd.com>, qemu-devel@nongnu.org
Cc: Michael Tokarev <mjt@tls.msk.ru>
References: <Y5zB+5t5K0AEj6Rn@p100>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <Y5zB+5t5K0AEj6Rn@p100>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 12/16/22 20:07, Helge Deller wrote:
> @@ -3581,7 +3581,7 @@ subdir('qga')
> 
>   # Don't build qemu-keymap if xkbcommon is not explicitly enabled
>   # when we don't build tools or system
> -if xkbcommon.found()
> +if xkbcommon.found() and have_system
>     # used for the update-keymaps target, so include rules even if !have_tools
>     qemu_keymap = executable('qemu-keymap', files('qemu-keymap.c', 'ui/input-keymap.c') + genh,
>                              dependencies: [qemuutil, xkbcommon], install: have_tools)
> @@ -3596,7 +3596,9 @@ if have_tools
>                  dependencies: [blockdev, qemuutil, gnutls, selinux],
>                  install: true)
> 
> -  subdir('storage-daemon')
> +  if have_system
> +    subdir('storage-daemon')
> +  endif
>     subdir('contrib/rdmacm-mux')
>     subdir('contrib/elf2dmp')
> 
> @@ -3611,7 +3613,7 @@ if have_tools
>       subdir('contrib/vhost-user-scsi')
>     endif
> 
> -  if targetos == 'linux'
> +  if targetos == 'linux' and have_system
>       executable('qemu-bridge-helper', files('qemu-bridge-helper.c'),
>                  dependencies: [qemuutil, libcap_ng],
>                  install: true,
> diff --git a/tools/meson.build b/tools/meson.build
> index 10eb3a043f..740d572a94 100644
> --- a/tools/meson.build
> +++ b/tools/meson.build
> @@ -5,7 +5,7 @@ have_virtiofsd = get_option('virtiofsd') \
>                error_message: 'virtiofsd requires libcap-ng-devel and seccomp-devel') \
>       .require(have_vhost_user,
>                error_message: 'virtiofsd needs vhost-user-support') \
> -    .disable_auto_if(not have_tools and not have_system) \
> +    .disable_auto_if(not have_system) \
>       .allowed()
> 
>   if have_virtiofsd
> 

These are wrong.  qemu-bridge-helper, virtiofsd, qemu-storage-daemon and 
qemu-keymap *are* tools; if they fail to build due to any dependencies, 
or due to other compilation issues, you need to add tests to meson.build 
and check for the cause of the issues.

The rest is okay.

Paolo


