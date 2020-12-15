Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 023F62DAAA1
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 11:12:16 +0100 (CET)
Received: from localhost ([::1]:43112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kp7JX-00087N-3V
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 05:12:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kp7GF-0006bp-Hj
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 05:08:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:54187)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kp7GB-0008I2-Ew
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 05:08:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608026926;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l6nxwOIy8U9rG3m7BWwxOAEGgtB8bDbUVfIZ7xKHMXA=;
 b=V+z+Ag8UNsxr/LeGA+LLnID4HeJuWdSOPUy8shLzDpL0GKRCg4+AItGuLKz4fwEzEC0F6c
 iJww/GheLbTi9WrEmeu95y57blmgGKlq1/7XyUFTunLAA7J1W7eycSqEohqwcHcruc+V0s
 GF5CdxPgUEm7EIei8ocKMNcxzuoQgbY=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-192-fKgDSZSJNcyw1fOndNR6OA-1; Tue, 15 Dec 2020 05:08:43 -0500
X-MC-Unique: fKgDSZSJNcyw1fOndNR6OA-1
Received: by mail-ej1-f69.google.com with SMTP id w6so2182966ejo.2
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 02:08:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=l6nxwOIy8U9rG3m7BWwxOAEGgtB8bDbUVfIZ7xKHMXA=;
 b=LyU9Z9i3pD/3AgN34UXtRnSJ0rLDbzHuyHO8QIzz9DivdESe9vAScpH+RCKG5sVD0p
 eRJ0fFn1a221G3D+AjjKg9rQorQUo5LV7LQglGeZHj6ZZMnuitPMfx3gzelDVlBjkyIX
 syh5VXA0pM092c3jl4+/fjDDDZdy72QFR+qWxS0XMi2RFPfaFYgjGPApqMZeBIOh14Dz
 juFQFpnlRt9zLRDxb7FY1iOQrlzOU35ChBusNUjyYAkUEMZFnsFg4vWzWfwBSlxFxCZj
 YvysTzRbnUN8fmQAKNcny2cxrQM6SpA7koOl6p7Su812gV6alF0Ca2vqqufeFfvWsGCj
 xaug==
X-Gm-Message-State: AOAM530fIOrWEXvOE2VCHWvnD8xZBcNzUo5Ap5min6jyJ/yj8TiwPsLQ
 LJHE3x5pLB7Apahlhrr1f23mw6yMIHFbDkm2R/0XD+g1MCRLVltcBbgrJ8Psmm2fg3QFkulZoQx
 8p0fC62q5mhq8k7c=
X-Received: by 2002:a17:907:1047:: with SMTP id
 oy7mr3880787ejb.134.1608026922189; 
 Tue, 15 Dec 2020 02:08:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwwdm6PvZN61FMLazN80vwTFpG+u6QClwDWtzUkdKr9X8W7c1ixqFlER4dBhEEBoQdiheTYjA==
X-Received: by 2002:a17:907:1047:: with SMTP id
 oy7mr3880779ejb.134.1608026922041; 
 Tue, 15 Dec 2020 02:08:42 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id d14sm17917924edu.63.2020.12.15.02.08.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Dec 2020 02:08:41 -0800 (PST)
Subject: Re: [PATCH] build-sys: fix -static linking of libvhost-user
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20201215080319.136228-1-marcandre.lureau@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <63dfdf60-1c38-ed53-d555-2b1e0cd25a9a@redhat.com>
Date: Tue, 15 Dec 2020 11:08:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201215080319.136228-1-marcandre.lureau@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: peter.maydell@linaro.org, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15/12/20 09:03, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Fix linking vhost-user binaries with with ./configure -static, by
> overriding glib-2.0 dependency with configure results.
> 
> Fixes: 0df750e9d3a5fea5e1 ("libvhost-user: make it a meson subproject")
> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   meson.build | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/meson.build b/meson.build
> index 9ea05ab49f..7ecd307952 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -268,7 +268,11 @@ endif
>   # grandfathered in from the QEMU Makefiles.
>   add_project_arguments(config_host['GLIB_CFLAGS'].split(),
>                         native: false, language: ['c', 'cpp', 'objc'])
> -glib = declare_dependency(link_args: config_host['GLIB_LIBS'].split())
> +glib = declare_dependency(compile_args: config_host['GLIB_CFLAGS'].split(),
> +                          link_args: config_host['GLIB_LIBS'].split())
> +# override glib dep with the configure results (for subprojects)
> +meson.override_dependency('glib-2.0', glib)
> +
>   gio = not_found
>   if 'CONFIG_GIO' in config_host
>     gio = declare_dependency(compile_args: config_host['GIO_CFLAGS'].split(),
> 

Queued, thanks.

Paolo


