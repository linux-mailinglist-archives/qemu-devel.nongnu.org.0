Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF342E699F
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Dec 2020 18:17:46 +0100 (CET)
Received: from localhost ([::1]:45380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ktw9Q-0002xf-Mj
	for lists+qemu-devel@lfdr.de; Mon, 28 Dec 2020 12:17:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ktw7y-0002La-4Y
 for qemu-devel@nongnu.org; Mon, 28 Dec 2020 12:16:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:54964)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ktw7v-0007NV-BM
 for qemu-devel@nongnu.org; Mon, 28 Dec 2020 12:16:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609175769;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JoRPp2DkT8Xon7HlnW+0Ndmusha4GWVpen/8P2ucKiI=;
 b=MkC8KUu4eakyTqgCoJMwGGYqfABMtTIHMwPfq6GSiwt4ejzp92V3cyPdVhv0J5CJigNnN9
 C01/jeYySPgbEWnxfEYo4i0Gfgm8GRrcPRqraSPI0bz/qF85d0Eo0yxXJoDInz4HiIInM/
 rEtXN7D3AvLhImP+kpdgzucFNpZPMO8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-470-YMqDZmwpMe6T8Lk9WH23KA-1; Mon, 28 Dec 2020 12:16:03 -0500
X-MC-Unique: YMqDZmwpMe6T8Lk9WH23KA-1
Received: by mail-wr1-f72.google.com with SMTP id v7so6536724wra.3
 for <qemu-devel@nongnu.org>; Mon, 28 Dec 2020 09:16:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JoRPp2DkT8Xon7HlnW+0Ndmusha4GWVpen/8P2ucKiI=;
 b=PH7+t+cPMAMa1uXkwVfcRL3Dr2xCCFrx31hOpSSplLFv3Fu9XhmuGmDka57iySC3NU
 W5C9ojk0CvyOfU2zbLkgKVq+qY/7sACcq4w72fWLIzMKlralS/xBLe3Zu7uusjsxfem5
 fJmW69EHtFcvxvodVxw4B7aBFMgIpRHpLBneQgeBLg16oLSWFisjxPh3lcN4ELpT0Fi5
 thEVSCSON5KpcDavpcXv7XHqwSN3hw6EOAdOWdE+I8FbYIrw9TffCXcq5TnxWq/794nj
 TbbuKw8ZqBVlXOnX94HfBdIH7B/vghstuDRjoQst/N1VCS+GhawSvbRnvAc5QtTNyiK5
 UbTA==
X-Gm-Message-State: AOAM533o+EDzJR5hlmdo3fD9iXnN1ch3HUmq7Oi9OblM0uoEAxBBlVnV
 9zL+YF8Qpi5m9flq57b/jeOzTlnKBIuNJft06Z0FUKjpfSQ8ZiCovm98h0qPud8pE1al6FOReWl
 osOoDNzJ9S+n7YSA=
X-Received: by 2002:a5d:6751:: with SMTP id l17mr51447140wrw.73.1609175761846; 
 Mon, 28 Dec 2020 09:16:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxWoS/bxiNi097Ft32afRT8J9WKjFguco5BACdYXsx0UufP7mCpYwcTM1Ix3fTUGYKUksIhAw==
X-Received: by 2002:a5d:6751:: with SMTP id l17mr51447127wrw.73.1609175761638; 
 Mon, 28 Dec 2020 09:16:01 -0800 (PST)
Received: from ?IPv6:2a01:e35:2fb0:49e0:98dc:fe2:8fe8:bc3b?
 ([2a01:e35:2fb0:49e0:98dc:fe2:8fe8:bc3b])
 by smtp.gmail.com with ESMTPSA id s133sm20540774wmf.38.2020.12.28.09.16.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Dec 2020 09:16:00 -0800 (PST)
Subject: Re: [PATCH] meson: fix Cocoa option in summary
To: Chris Hofstaedtler <zeha@debian.org>, qemu-devel@nongnu.org
References: <20201228150958.232564-1-zeha@debian.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <8bb0e3b7-3d15-3dfd-6ef9-fc639a07ed48@redhat.com>
Date: Mon, 28 Dec 2020 18:15:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201228150958.232564-1-zeha@debian.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -56
X-Spam_score: -5.7
X-Spam_bar: -----
X-Spam_report: (-5.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.178,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.698, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: peter.maydell@linaro.org, Chris Hofstaedtler <chris@hofstaedtler.name>,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Chris,

On 12/28/20 4:09 PM, Chris Hofstaedtler wrote:
> From: Chris Hofstaedtler <chris@hofstaedtler.name>
> 
> Regression introduced in f9332757898.

Isn't it commit b4e312e953b? If so you could add:

Fixes: b4e312e953b ("configure: move cocoa option to Meson")

> Signed-off-by: Chris Hofstaedtler <chris@hofstaedtler.name>
> ---
>  meson.build | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meson.build b/meson.build
> index e864cdd155..9c152a85bd 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -2112,7 +2112,7 @@ summary_info += {'strip binaries':    get_option('strip')}
>  summary_info += {'profiler':          config_host.has_key('CONFIG_PROFILER')}
>  summary_info += {'static build':      config_host.has_key('CONFIG_STATIC')}
>  if targetos == 'darwin'
> -  summary_info += {'Cocoa support': config_host.has_key('CONFIG_COCOA')}
> +  summary_info += {'Cocoa support': config_host_data.get('CONFIG_COCOA', false)}
>  endif
>  # TODO: add back version
>  summary_info += {'SDL support':       sdl.found()}
> 


