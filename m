Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3887C2ECED6
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 12:38:00 +0100 (CET)
Received: from localhost ([::1]:50564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxTc7-0002bk-9I
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 06:37:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kxTag-0001KO-9H
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 06:36:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:22884)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kxTad-0007jz-5U
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 06:36:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610019386;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IA7Tk7F6pf1oHc/qQSZbRzJjcQjixlpuCtPJt8fSDxU=;
 b=PUmu007wZhk0RNnKoxfPMttjWMeL+pEBIEDdSogGYJi3ChwyH6LWvjyqzxb//cMP8X6adO
 BGkiIyyK3dIhHvGc0BEXwEPEzUYRk6x3y12i3WfgwsQcX2G6hcZOod05zSSX7uK1Qv9UZA
 ILR++fjw+p/Fxcw/wzVjPIwjxPeCh24=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-90-NtaUbKiUPNK4gIH6w0kVUw-1; Thu, 07 Jan 2021 06:36:23 -0500
X-MC-Unique: NtaUbKiUPNK4gIH6w0kVUw-1
Received: by mail-wr1-f70.google.com with SMTP id w8so2536191wrv.18
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 03:36:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IA7Tk7F6pf1oHc/qQSZbRzJjcQjixlpuCtPJt8fSDxU=;
 b=N6eq9NdxwdeMQkW1VBcIt+oCfJC+58loL+aKjq3WxE+DH/aM/nETjz+RNUvkwW82n7
 D1g4tXL3YG4bMFZ2FE0Q8tNVTyF/6IBXx6i7fOmE+lAJuXxK+Z//iItkDuXqXVyv6y68
 VFHXsOjc7ZeXVPOTq23x95IGrgm5yzeLvKGJzaRvRoTUrRYOrKZT3875sFe64R03NBrb
 YeUa4b268GLOeeucUKGf6ujSoKG/QmY10WIoHyMAJLiEC2f0eJmSct3L6/qAAc7MUZfU
 VPFa7ZW1gHFeu3b6mXjMHaO0VANdZRR343thHXrVWToMY8obKA005WhpaQwuOk6e6mz6
 Kr1g==
X-Gm-Message-State: AOAM530EIYIL0rlqg5spdMGEv5QxvNcGJyuShfonTzPafV9JzZJRRTSV
 808uKfi0A1waap8mNd98LsnI1KWHlIfs5MOZPrb+QCaXrQXlwq4zJZp9Uqo/PI73nVa3r2XxO9m
 XmB/TzcKe3ufong0=
X-Received: by 2002:adf:dc8b:: with SMTP id r11mr8770498wrj.131.1610019381902; 
 Thu, 07 Jan 2021 03:36:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwiyMSHHCML+janV+7SKhqF353FpQfasNTrMYDxNK/va2yR8KNgBo/ye8TAKAtjU3ra3ixxEA==
X-Received: by 2002:adf:dc8b:: with SMTP id r11mr8770484wrj.131.1610019381744; 
 Thu, 07 Jan 2021 03:36:21 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id b13sm7587668wrt.31.2021.01.07.03.36.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Jan 2021 03:36:20 -0800 (PST)
Subject: Re: [PATCH v2] meson: fix Cocoa option in summary
To: Chris Hofstaedtler <chris@hofstaedtler.name>, qemu-devel@nongnu.org
References: <20201230221623.60423-1-chris@hofstaedtler.name>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <d5ae54f9-0a9f-4e94-99f3-6d7ac143403c@redhat.com>
Date: Thu, 7 Jan 2021 12:36:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201230221623.60423-1-chris@hofstaedtler.name>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.249, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 30/12/20 23:16, Chris Hofstaedtler wrote:
> Cocoa support was always shown as "no", even it if was enabled.
> 
> Fixes: b4e312e953b ("configure: move cocoa option to Meson")
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Philippe Mathieu-Daudé <philmd@redhat.com>
> Signed-off-by: Chris Hofstaedtler <chris@hofstaedtler.name>
> ---
>   meson.build | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meson.build b/meson.build
> index 372576f82c..1112ca8fc2 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -2082,7 +2082,7 @@ summary_info += {'strip binaries':    get_option('strip')}
>   summary_info += {'profiler':          config_host.has_key('CONFIG_PROFILER')}
>   summary_info += {'static build':      config_host.has_key('CONFIG_STATIC')}
>   if targetos == 'darwin'
> -  summary_info += {'Cocoa support': config_host.has_key('CONFIG_COCOA')}
> +  summary_info += {'Cocoa support': config_host_data.get('CONFIG_COCOA', false)}
>   endif
>   # TODO: add back version
>   summary_info += {'SDL support':       sdl.found()}
> 

Using config_host_data makes sense, however "cocoa.found()" is more 
consistent with the surrounding code.

Paolo


