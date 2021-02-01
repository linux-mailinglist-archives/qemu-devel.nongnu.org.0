Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21B4330A350
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 09:33:02 +0100 (CET)
Received: from localhost ([::1]:47242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6Udp-0001xD-7b
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 03:33:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l6Ucx-0001SY-K4
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 03:32:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:31350)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l6Uct-00045J-Rz
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 03:32:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612168322;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xgcr5gCOh+Q58RJKGZSWT1eerahi5CZFcBxuWH5MWfs=;
 b=htZvit5xmEVOe5xsAdSBThxKtsJHzcq02RF3J/sLyvCf+dmUviphDFop64tw71gQY82t9a
 cHw+nYD3SanzIoW7DZIp7tfcVg3ZCNhDEqNcoRONjA14aVW19cbDqymjHsFRLc/joGew/i
 hdatWIrTofFNtuPZ91l/8yQ2N5J85mc=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-484-QwFd4gMjMY-Hv5GXu8R6qQ-1; Mon, 01 Feb 2021 03:31:58 -0500
X-MC-Unique: QwFd4gMjMY-Hv5GXu8R6qQ-1
Received: by mail-ed1-f71.google.com with SMTP id m16so7518557edd.21
 for <qemu-devel@nongnu.org>; Mon, 01 Feb 2021 00:31:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xgcr5gCOh+Q58RJKGZSWT1eerahi5CZFcBxuWH5MWfs=;
 b=M14PuAdXUkfppkZi5VeEC0gXRKsRQGW0uobomEUMM63ATrUJHL/zQDJuUUs9X4N+51
 OEIHijkyGDgiEe7NjgZ9C1cgZB8+POqGtc0nqNksSmf4wusX5QpKtEd2EDwM/iaCHMEz
 MPSPzs/89AwtCWHFFH3ekPGWVhmsUUcbS8dLFtsgSojHT+KVudpbF/41xc8VdSOiYTsV
 2gewL3ircsNLQRjNcjCFsIBcjfovwwGZ2bl4QbTb/ta2IawPx89cH/97zmokONzgh1F2
 OGhQNDjGTSUnbKQ7TPw6Mv6Dww+NFngsRmOJAxqjrNtRLsszLJRG7brpfV5F8Q5K4JOJ
 LbHQ==
X-Gm-Message-State: AOAM5335Sytr3uMTtCvkXoytieDYx+Ra9bacDvcSBw6Np6NlUdzY19My
 hUWWrPDoj58O+BJM8jGdMXSbcziLM3ghOz+Mk/v1n/ZAzepPt5Az3sbya8h3nkSVP75+KvYiA9D
 YSS9q+XULp2wo5r4=
X-Received: by 2002:a17:906:4955:: with SMTP id
 f21mr16625137ejt.384.1612168317422; 
 Mon, 01 Feb 2021 00:31:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyZ3Xvh20Ufm2yFyF4JwuNqgyzk6RZQEdOADAFyV3AYcH5dmnVejKgD9zRZYow2/XUFIGZUfg==
X-Received: by 2002:a17:906:4955:: with SMTP id
 f21mr16625128ejt.384.1612168317277; 
 Mon, 01 Feb 2021 00:31:57 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id f20sm8302004edd.47.2021.02.01.00.31.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Feb 2021 00:31:56 -0800 (PST)
Subject: Re: [PATCH] pc-bios/descriptors: fix paths in json files
To: Sergei Trofimovich <slyfox@gentoo.org>, qemu-devel@nongnu.org
References: <20210131143434.2513363-1-slyfox@gentoo.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <2133b6f7-9128-a98c-66c8-72ef223d23f6@redhat.com>
Date: Mon, 1 Feb 2021 09:31:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210131143434.2513363-1-slyfox@gentoo.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.079, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 31/01/21 15:34, Sergei Trofimovich wrote:
> Before the change /usr/share/qemu/firmware/50-edk2-x86_64-secure.json
> contained the relative path:
>              "filename": "share/qemu/edk2-x86_64-secure-code.fd",
>              "filename": "share/qemu/edk2-i386-vars.fd",
> 
> After then change the paths are absolute:
>              "filename": "/usr/share/qemu/edk2-x86_64-secure-code.fd",
>              "filename": "/usr/share/qemu/edk2-i386-vars.fd",
> 
> The regression appeared in qemu-5.2.0 (seems to be related
> to meson port).
> 
> CC: Paolo Bonzini <pbonzini@redhat.com>
> CC: "Marc-André Lureau" <marcandre.lureau@redhat.com>
> CC: "Philippe Mathieu-Daudé" <philmd@redhat.com>
> Bug: https://bugs.gentoo.org/766743
> Bug: https://bugs.launchpad.net/qemu/+bug/1913012
> Patch-by: Jannik Glückert
> Signed-off-by: Sergei Trofimovich <slyfox@gentoo.org>
> ---
>   pc-bios/descriptors/meson.build | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/pc-bios/descriptors/meson.build b/pc-bios/descriptors/meson.build
> index ac6ec66b00..29efa16d99 100644
> --- a/pc-bios/descriptors/meson.build
> +++ b/pc-bios/descriptors/meson.build
> @@ -9,7 +9,7 @@ if install_edk2_blobs
>     ]
>       configure_file(input: files(f),
>                      output: f,
> -                   configuration: {'DATADIR': qemu_datadir},
> +                   configuration: {'DATADIR': get_option('prefix') / qemu_datadir},
>                      install: get_option('install_blobs'),
>                      install_dir: qemu_datadir / 'firmware')
>     endforeach
> 

Queued, thanks!

Paolo


