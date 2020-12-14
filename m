Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EABF2D973C
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 12:18:25 +0100 (CET)
Received: from localhost ([::1]:57400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kols0-0005sK-JP
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 06:18:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kolpz-0004pW-Jx
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 06:16:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:22367)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kolpx-0008Kh-K2
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 06:16:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607944575;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OQdMLotxjpaz51sWXsbU/PEXVDKAqbWm1m7IWUWH82I=;
 b=g2SrX/i6KJUe9n3A0UF480MXjrPM91ixIp9yn7FjiE4vocYkmEC/vQcHByvQugfhjn/gzw
 R24XCAX6GBzarc6GHdiGQVdg89dEVvl4Zjh+ZQV7PDJaGa/7P08XKFWSDJm3G/aBQkidUb
 n8pKawKxJForp+qRrCmbSrhTKJuCYjo=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-196-DMxd1jE5NkK1LUMQmPep2g-1; Mon, 14 Dec 2020 06:16:14 -0500
X-MC-Unique: DMxd1jE5NkK1LUMQmPep2g-1
Received: by mail-wr1-f69.google.com with SMTP id b5so6437790wrp.3
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 03:16:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OQdMLotxjpaz51sWXsbU/PEXVDKAqbWm1m7IWUWH82I=;
 b=eqostIIKavjNuJdrZBIy3CFUm1cGPGA95/sIGJVz7yWHrjPKgEVxRov31Cge6Cb3RM
 qPJwxoLtjDz34a7toL39sRDcZsparf8WVO8jtt87VS/U7NBlUdqci7jZyu2HuWf5VEzj
 x4HEexbx7jZqmGIY0wLizX2xfyD+XiNqG0JIXXu05JPUp8YliNvDxE0AZhJXmHXE+4kd
 w+SqpA6Of6+YFsHTuQY8pzgNxk6BUexsjQcTTqshBeiig1B1Hq8pH7FVI7kaEgVHXl4+
 ouMyuM/Zsf6ooifn0dyo6TVnyo93xUmIHs2Emsh3qnaBRAy91XOzqMt0aa8yjtx4V2cN
 yViw==
X-Gm-Message-State: AOAM533cLMw4uDyNB9nasizPnlXOjQWywvF13bxgr4scqQZccKKzd9sg
 ZL4hEdvlsnVnRk3Z02NdnxQlh/CYJhSHvp40r1QYD3/qMaG82wdR1nMBphT8yhR78u1pjuFvJSu
 8Ct/ZSTlcHBnjSvs=
X-Received: by 2002:adf:fb03:: with SMTP id c3mr23545228wrr.248.1607944571472; 
 Mon, 14 Dec 2020 03:16:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwGgm+3dMjUKaeWCmtokAP0NXT0VSRSsKwFEfFGy9VU4sNgmwWcbwNSh8ircozFPUjZT+/51w==
X-Received: by 2002:adf:fb03:: with SMTP id c3mr23545193wrr.248.1607944571261; 
 Mon, 14 Dec 2020 03:16:11 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:63a7:c72e:ea0e:6045?
 ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id m17sm33867416wrn.0.2020.12.14.03.16.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Dec 2020 03:16:10 -0800 (PST)
Subject: Re: [PATCH] scripts/git.orderfile: Keep files with .inc extension
 sorted
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-trivial@nongnu.org, qemu-devel@nongnu.org
References: <20201213205132.243628-1-f4bug@amsat.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <c777aead-4080-09e7-7db4-30d56de83d76@redhat.com>
Date: Mon, 14 Dec 2020 12:16:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201213205132.243628-1-f4bug@amsat.org>
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
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01,
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13/12/20 21:51, Philippe Mathieu-Daudé wrote:
> Sort .inc files along with the extension including them.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   scripts/git.orderfile | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/scripts/git.orderfile b/scripts/git.orderfile
> index 3736c1d6aff..b32203b7106 100644
> --- a/scripts/git.orderfile
> +++ b/scripts/git.orderfile
> @@ -12,6 +12,7 @@
>   # Documentation
>   docs/*
>   *.rst
> +*.rst.inc
>   
>   # build system
>   configure
> @@ -28,9 +29,11 @@ qga/*.json
>   
>   # headers
>   *.h
> +*.h.inc
>   
>   # decoding tree specification
>   *.decode
>   
>   # code
>   *.c
> +*.c.inc
> 

Queued, thanks.

Paolo


