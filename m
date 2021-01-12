Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3EE02F2E7D
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 12:57:00 +0100 (CET)
Received: from localhost ([::1]:45892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzIIF-0001wv-Nh
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 06:56:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kzIE2-0006PC-85
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 06:52:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:60053)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kzIDz-0001D5-Di
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 06:52:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610452354;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YvQC13fsUl8gaVS1HnN/F4cOZro/xSSBEVG93EvmOdc=;
 b=b8Rpt6VMwFiyT8a0tkjY/jtiABDVWY6Brdl22TRZ1+zrVuLYBw6rglHEYp6ajcOz7mEadl
 elrp85vPQE1D9IyrqswbsVyusfQVhrPPLSHInXlvUUUluaoPep5jXNahUR5uAD0u502UBf
 +eGdhWbLJvM3WQ8hycQqlPD01lLqwik=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-572-oZAWT5RePDW7PjPT8xoGbA-1; Tue, 12 Jan 2021 06:52:31 -0500
X-MC-Unique: oZAWT5RePDW7PjPT8xoGbA-1
Received: by mail-wm1-f70.google.com with SMTP id g82so392246wmg.6
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 03:52:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YvQC13fsUl8gaVS1HnN/F4cOZro/xSSBEVG93EvmOdc=;
 b=oUkwaVfqnnK1uwVtV33GiZl1RjCFabe6oWxZjKPiHrqnHyzhYRmCJ1blWd6w4X2oEg
 7xcScLDltW+ljwrHJRNYkL6rAHgW1E3ZImrDPU0ZcjaDtyq0YxNA7N1nbfwK8E/Smei0
 I/jUWGC4lw2+FIaSG+3y0E5K1pBX/yw4Z0jHE3tD1OdieeFyJ+8fzgWW0VP4k089dYb1
 gJZ6pEchUIiKshsgg8yP7SDgWjjwtUzwZB4njdjGH/3tiyOjo0IirdpAmc9kTMVTpJlR
 P5YaHIc9TjwmNJKyvsJpFPyJWm1nDr6+UhKrzgMOH00RvUQI214IuCAVcbEpGD5BXnhj
 ZFGg==
X-Gm-Message-State: AOAM530hgTHW6s3Y/6q7SASMYHDiKwgJ9hvMb2zUQqYBazmZmlE1SGs1
 ygsbDiXN53312yh04vVYyWMMDHfoEviVXY3gzKfBdlFgSyKI10Zg8nG8UYtpqXT9h6iuj4Ws2pF
 +jrvt9BcZjTNgqqw=
X-Received: by 2002:a1c:7c19:: with SMTP id x25mr3184736wmc.145.1610452350187; 
 Tue, 12 Jan 2021 03:52:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxKyFy58Nqf94WL/Kk0229rTiXLbNeE+QvCahVlxsVkP191qwYohsqPUtoDukBxR0iGyCZgTA==
X-Received: by 2002:a1c:7c19:: with SMTP id x25mr3184711wmc.145.1610452349966; 
 Tue, 12 Jan 2021 03:52:29 -0800 (PST)
Received: from [192.168.1.36] (190.red-83-57-173.dynamicip.rima-tde.net.
 [83.57.173.190])
 by smtp.gmail.com with ESMTPSA id w17sm3547524wmk.12.2021.01.12.03.52.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Jan 2021 03:52:29 -0800 (PST)
Subject: Re: [PATCH v6 6/7] slirp: update build flags for iOS resolv fix
To: Joelle van Dyne <j@getutm.app>, qemu-devel@nongnu.org,
 slirp@lists.freedesktop.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20210105022055.12113-1-j@getutm.app>
 <20210105022055.12113-7-j@getutm.app>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <1b4c4f34-8b27-3b45-7de8-19eed100f6f8@redhat.com>
Date: Tue, 12 Jan 2021 12:52:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210105022055.12113-7-j@getutm.app>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Joelle,

On 1/5/21 3:20 AM, Joelle van Dyne wrote:
> A future libslirp update will use libresolv on Darwin systems, so we add the
> flags in QEMU build now.
> 
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> Signed-off-by: Joelle van Dyne <j@getutm.app>
> ---
>  meson.build | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/meson.build b/meson.build
> index 900dbc36c8..d8951d4d6c 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1205,6 +1205,8 @@ if have_system
>      slirp_deps = []
>      if targetos == 'windows'
>        slirp_deps = cc.find_library('iphlpapi')
> +    elif targetos == 'darwin'
> +      slirp_deps = cc.find_library('resolv')

This is done in libSLiRP commit 9f82a47 ("Add DNS resolving for iOS").

Maybe this commit need to be backported in the stable branch,
or QEMU should use a newer commit. Cc'ing Samuel and Marc-André
who maintain the project (and the SLiRP list).

>      endif
>      slirp_conf = configuration_data()
>      slirp_conf.set('SLIRP_MAJOR_VERSION', meson.project_version().split('.')[0])
> 


