Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CADD130796C
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 16:18:35 +0100 (CET)
Received: from localhost ([::1]:36196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5946-0000r1-R9
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 10:18:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l591n-0007wr-IZ
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 10:16:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:56481)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l591j-0002nu-Dt
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 10:16:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611846964;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DYMmxn0WY/aIAyBB2C/ZnyCi4mWfwlYJFky34Bmk+Q4=;
 b=HcqvNyVDO4xGAYLNmW7KverXcSsssFpVt46l0mockOKNC8VVME7ToietifWzsEoi/awCF1
 HVW1K5oNWModJWa2QM64UkAUGDNPSW0eO7yIkkoNn8lklWrz2vftOGEhOp6dSrvVIosuNM
 DA2suqQfurgHZofbixpX2vQ3qaGHIwM=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-352-Xx0Fzt5POoSZudM79ZY2aA-1; Thu, 28 Jan 2021 10:16:02 -0500
X-MC-Unique: Xx0Fzt5POoSZudM79ZY2aA-1
Received: by mail-ej1-f72.google.com with SMTP id d15so2306655ejc.21
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 07:16:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DYMmxn0WY/aIAyBB2C/ZnyCi4mWfwlYJFky34Bmk+Q4=;
 b=ftfjOtDI8Y1Mti41ClWxSeUZF3y6E5wSzpqWhW8gMQ6O4dugFGOkJ8ALa0HwknGQgT
 d+NN/8sEocF54I6xK1/8Wq/HcpNMx6C7/44t+B4V7gDpA/sTjryw3M2VDOucGjplMbH4
 6cXdHnHYbDxRqqZ7eMpaCKzcmmdJYiIAPAncTv6yKCCa3o7S8zw8f5UoD16/dcFj5T4+
 Q+xl5LMnH25BW7oEf9+zfmzMAuA4WE8Q0ATE0DNLLyKyG1vmBPXkJJva7orNZNbgNHsR
 t/z9JasQ8NOwtKkgC/2AWakcI8aUcSsJdfQhOGlisTaizisW6+zn5GUxJK6wYY/Cdras
 qMag==
X-Gm-Message-State: AOAM530h2TaNTjh6O3jfffw3xgFoyk71y9en5F6wEOPGz3xX4jdhth8/
 wJgtvKQ+lBwykL3StZg57gNIdsvjOV4OurYSBupL545tFDr4n/92537orFjgoqCzUpnewDs7N5E
 DNoFfiTA89ArdyLc=
X-Received: by 2002:a17:906:f991:: with SMTP id
 li17mr11746456ejb.31.1611846961318; 
 Thu, 28 Jan 2021 07:16:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzvvH5DkbiANuzqAUhjdEjO07V5dfsXS5adFl/7E3xjgMEq8N2UYhT3cJpmjqCo5tV3F0R0rw==
X-Received: by 2002:a17:906:f991:: with SMTP id
 li17mr11746426ejb.31.1611846961006; 
 Thu, 28 Jan 2021 07:16:01 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id y8sm3040908edd.97.2021.01.28.07.15.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Jan 2021 07:16:00 -0800 (PST)
Subject: Re: [PATCH] docs: don't install corresponding man page if guest agent
 is disabled
To: Stefan Reiter <s.reiter@proxmox.com>, qemu-trivial@nongnu.org
References: <20210128145801.14384-1-s.reiter@proxmox.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <aea9ab28-61ab-a162-f2fc-20613e74fd4d@redhat.com>
Date: Thu, 28 Jan 2021 16:15:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210128145801.14384-1-s.reiter@proxmox.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 28/01/21 15:58, Stefan Reiter wrote:
> No sense outputting the qemu-ga and qemu-ga-ref man pages when the guest
> agent binary itself is disabled. This mirrors behaviour from before the
> meson switch.
> 
> Signed-off-by: Stefan Reiter <s.reiter@proxmox.com>
> ---
>   docs/meson.build | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/docs/meson.build b/docs/meson.build
> index bb14eaebd3..f84306ba7e 100644
> --- a/docs/meson.build
> +++ b/docs/meson.build
> @@ -46,9 +46,11 @@ if build_docs
>                             meson.source_root() / 'docs/sphinx/qmp_lexer.py',
>                             qapi_gen_depends ]
>   
> +  have_ga = have_tools and config_host.has_key('CONFIG_GUEST_AGENT')
> +
>     man_pages = {
> -        'qemu-ga.8': (have_tools ? 'man8' : ''),
> -        'qemu-ga-ref.7': 'man7',
> +        'qemu-ga.8': (have_ga ? 'man8' : ''),
> +        'qemu-ga-ref.7': (have_ga ? 'man7' : ''),
>           'qemu-qmp-ref.7': 'man7',
>           'qemu-storage-daemon-qmp-ref.7': (have_tools ? 'man7' : ''),
>           'qemu-img.1': (have_tools ? 'man1' : ''),
> 

Queued, thanks.

Paolo


