Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A102D2ECF18
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 12:52:06 +0100 (CET)
Received: from localhost ([::1]:58822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxTpl-000213-N5
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 06:52:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kxTlA-0005MP-Eq
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 06:47:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:34457)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kxTl6-0004cd-Oi
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 06:47:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610020034;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i/KNuwG0WlXOVd+hwXHwF9R8bbEw0106uJpTvLKcWSo=;
 b=HmqEQuC+hh+mZPlnv8yew1qLphAjyuaDTQlVq5sLdkdW0BeSl8BiGaoYlIbVPjTH60NTUH
 8UIRQDHTrO85MbTW2D/KiHnQ7QGfMQ7zdCxq/g3LHraTXu8x76/R52L321gzP4m3AJUUm6
 rHFA2P/fCeffjQ+U7Xz2RJOAzMNtFL8=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-466-45cE2MdkPBOul-tXh4tncQ-1; Thu, 07 Jan 2021 06:47:12 -0500
X-MC-Unique: 45cE2MdkPBOul-tXh4tncQ-1
Received: by mail-ed1-f72.google.com with SMTP id u18so3256180edy.5
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 03:47:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=i/KNuwG0WlXOVd+hwXHwF9R8bbEw0106uJpTvLKcWSo=;
 b=Mkx2fRbGK1fTYDZQTHyQvf+TQP5ZLrim/ANHMEl693f3MSTyWvvT0iRNdLVDX0Yqqt
 y0v9d0T71IBLGsGoxIQhWlKKCiqHVeh20wEStWXzWgObjkrKp+cAgsUCH8tz4IpiWRk1
 LhW7oY3sPDPQCA37M4sAbGnwhaTCbWJtY3DGk1+sHJY6BfTpG3dUvreWPp5nsS9Kynt9
 5i0Ovgi654IMdMI6WZGvII97FbRh3O08VOxuJ516q8XnBhz6htjlZwfW4tL09107ABOf
 yQU2vm0/OARqB7aS9GNLu67eP8z6HYS6/ppAEhpmxxGRI5xWl13lQ0K7IaXS9kIEg/9A
 z9Ww==
X-Gm-Message-State: AOAM531nMIL27pYd9Lgp1OJxiALAIJ83NpKYkzkn+nhc78i2tE46hmWI
 vyvTlZW/UtjpSRq3xwnZoxUkWzwk0Mi16QTNfEEckPecNeZccd8JyC5b6BVThEYTQ0RxnS1N/F8
 KwnDT22uRGNN5YtCJNzOUAyD6OY7FynpAmWN7oCe2aW6QS+bXgL1g8Zi+TBmMc+ng+iE=
X-Received: by 2002:a50:a6c2:: with SMTP id f2mr1388564edc.7.1610020031199;
 Thu, 07 Jan 2021 03:47:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyrq712TNlWSxcKRcWsmrNDzYar1htG15VQf0cm770j16EbDWctJzVTcH2pivLAaAU+SiIikQ==
X-Received: by 2002:a50:a6c2:: with SMTP id f2mr1388552edc.7.1610020030939;
 Thu, 07 Jan 2021 03:47:10 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id n8sm2346720eju.33.2021.01.07.03.47.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Jan 2021 03:47:09 -0800 (PST)
Subject: Re: [PATCH] meson: fix ncurses detection on macOS
To: Chris Hofstaedtler <chris@hofstaedtler.name>, qemu-devel@nongnu.org
References: <20201228151652.235542-1-chris@hofstaedtler.name>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <509d7467-3747-cbfd-61e2-f92f3a9c67f8@redhat.com>
Date: Thu, 7 Jan 2021 12:47:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201228151652.235542-1-chris@hofstaedtler.name>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 28/12/20 16:16, Chris Hofstaedtler wrote:
> Without this, meson fails with "curses package not usable"
> when using ncurses 6.2. Apparently the wide functions
> (addwstr, etc) are hidden behind the extra define, and
> meson does not define it at that detection stage.
> 
> Signed-off-by: Chris Hofstaedtler <chris@hofstaedtler.name>
> ---
>   meson.build | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meson.build b/meson.build
> index 9c152a85bd..7b9d92c14a 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -510,7 +510,7 @@ if have_system and not get_option('curses').disabled()
>     endforeach
>     msg = get_option('curses').enabled() ? 'curses library not found' : ''
>     if curses.found()
> -    if cc.links(curses_test, dependencies: [curses])
> +    if cc.links(curses_test, args: '-DNCURSES_WIDECHAR', dependencies: [curses])
>         curses = declare_dependency(compile_args: '-DNCURSES_WIDECHAR', dependencies: [curses])
>       else
>         msg = 'curses package not usable'
> 

Already fixed by commit 0dbce6efb5ff2e7113734d3a0cabbf87fc56feec

     meson: fix detection of curses with pkgconfig

     Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
     Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Sorry for the delay in applying it.

Thanks,

Paolo


