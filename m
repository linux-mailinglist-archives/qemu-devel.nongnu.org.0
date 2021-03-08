Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83DA9330C7E
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 12:35:41 +0100 (CET)
Received: from localhost ([::1]:38216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJEAm-0001Ov-Ju
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 06:35:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lJE9N-0000mt-PC
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 06:34:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lJE9L-0001R9-B7
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 06:34:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615203250;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DRdJx82Vn+UyWJhlFAgln3kyhC/StTF5NXCd+bg6S4M=;
 b=B3EM2HXSBqdHK4i6HJDr/TXHtDdEIZJP7uxLecG3DBfIWmpOe4oKXvvHO8veQ3p728lIac
 MVkMA3C56sf+gxeQezSaG9l1CzjytzjwAJtXvn54ZiE//18PYXYRkZWNIvFZrgnIJSwA66
 u+51kCahpZU9DVyYkluLUDy3t24xfsM=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-201-mWjyuRWGMmCBTkvgwtLZzg-1; Mon, 08 Mar 2021 06:34:07 -0500
X-MC-Unique: mWjyuRWGMmCBTkvgwtLZzg-1
Received: by mail-ed1-f70.google.com with SMTP id u2so4849959edj.20
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 03:34:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DRdJx82Vn+UyWJhlFAgln3kyhC/StTF5NXCd+bg6S4M=;
 b=O0djho3XHHi3uuGAbZdEK9p7K+RvhDH9z+7l80aC1WN4hJ6szSN+L/s0+BZcfeN4tq
 j9oZwAHtQE8ykq2022TDpikIRZfOTayzOQd7y5ytvqlX9YI9rABHavb9jEHQScIvT5km
 iVj1TmEfmi0EKipHBg686Qs46av9e8XhcVoQCOdluhdfpJy82O145LbcWnv7cEx9a4HQ
 AwgfN1eAxAEpl9uFuLrUGwgcfJauQa/7ioEr5ZbML8A+HcFlmLtEfir/f/z0ZNmj5MN7
 fss6PsB3q/nB4eZ57WjLGPwCZzwLl0xNOdv/hG0uOOTQq++vsnMzsRKjl+zfqNKME4A/
 Kqvg==
X-Gm-Message-State: AOAM532yWWnafFBNI18ImJ0syxecctVe9snJzrBtZCt506FBsfQTGv1M
 barH1n8AwIQFBuiAbwviutTke/HFhVzhXzi9AmN+INw4DemDVymIscT87E7FfeOe38oKE4Icc0d
 rWwKcuaVg5SJbn4s=
X-Received: by 2002:a17:907:7651:: with SMTP id
 kj17mr14653859ejc.127.1615203245826; 
 Mon, 08 Mar 2021 03:34:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyjhr9N/zZR18DkXypWrgpMA0vHluCZpeC7imrJlofDI35xi6LzXdbZpxK183bwdmqcujUOKQ==
X-Received: by 2002:a17:907:7651:: with SMTP id
 kj17mr14653844ejc.127.1615203245673; 
 Mon, 08 Mar 2021 03:34:05 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id f11sm6401485eje.107.2021.03.08.03.34.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Mar 2021 03:34:05 -0800 (PST)
Subject: Re: [PATCH v2 0/2] Update libslirp & make it a subproject
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>
References: <20210125073427.3970606-1-marcandre.lureau@redhat.com>
 <cb8c7d87-1f1d-a262-c35a-00b34f8240f0@redhat.com>
 <CAJ+F1CJb1tsjz=+8=rkB9Rm16Cn8JmA-SC3MSb53XxvXo2WM6g@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <7d27830c-d2c6-fa17-a2b5-e7c08e9328b7@redhat.com>
Date: Mon, 8 Mar 2021 12:34:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CAJ+F1CJb1tsjz=+8=rkB9Rm16Cn8JmA-SC3MSb53XxvXo2WM6g@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01,
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
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Paolo Bonzini <pbonzini@redhat.com>, QEMU <qemu-devel@nongnu.org>,
 Joelle van Dyne <j@getutm.app>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/8/21 11:23 AM, Marc-André Lureau wrote:
> Hi
> 
> On Mon, Mar 8, 2021 at 2:03 PM Philippe Mathieu-Daudé <philmd@redhat.com
> <mailto:philmd@redhat.com>> wrote:
> 
>     Hi Marc-André,
> 
>     On 1/25/21 8:34 AM, marcandre.lureau@redhat.com
>     <mailto:marcandre.lureau@redhat.com> wrote:
>     > From: Marc-André Lureau <marcandre.lureau@redhat.com
>     <mailto:marcandre.lureau@redhat.com>>
>     >
>     > Hi,
>     >
>     > Here is a few patches to update libslirp to git upstream.
>     > Since it now supports meson subproject(), adapt the build
>     > system to use it, and related fixes.
>     >
>     > v2:
>     >  - fix unused variables on macos
>     >  - fork_exec_child_setup: improve signal handling
>     >
>     > Marc-André Lureau (2):
>     >   slirp: update to git master
>     >   build-sys: make libslirp a meson subproject
>     >
>     >  configure            |  2 +-
>     >  meson.build          | 62
>     +++-----------------------------------------
>     >  .gitmodules          |  4 +--
>     >  slirp                |  1 -
>     >  subprojects/libslirp |  1 +
>     >  5 files changed, 8 insertions(+), 62 deletions(-)
>     >  delete mode 160000 slirp
>     >  create mode 160000 subprojects/libslirp
> 
>     Just out of curiosity, why "subprojects"? Should we move
>     other submodules there (meson, dtc, keycodemapdb)?
> 
> 
> It's required when you use meson subproject() :
> https://mesonbuild.com/Subprojects.html#why-must-all-subprojects-be-inside-a-single-directory
> <https://mesonbuild.com/Subprojects.html#why-must-all-subprojects-be-inside-a-single-directory>

Oh interesting. As this link is relevant information, can you amend
it to patch #2 description please?

> 
> 
> (btw, the patch series has conflicts with the current git, I'll send a v3)
> 
> -- 
> Marc-André Lureau


