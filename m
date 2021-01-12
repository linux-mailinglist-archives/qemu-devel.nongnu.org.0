Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4E4E2F3943
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 19:53:53 +0100 (CET)
Received: from localhost ([::1]:60186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzOng-0000ir-OV
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 13:53:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kzOkE-0007MG-DG
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 13:50:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52841)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kzOkA-0003aW-CT
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 13:50:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610477412;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fGe7dTF2HONS2AdIsLP4yVgdLgCaOWrVnjt97KzfM5Y=;
 b=inuJsLgRX52ki7y5qd7ZCAPbH1MTZwYpZGci1ZsZups+BRCrDfbwG0JpkvRSm8I+0JshSz
 rcAQ8wwfZTw/42vKI25rTQdTHYpfYw3b53wdJugqL0223VGFlX1gzu7zWxJpMaKgfQOOro
 iANK/UearlvvDJ4OWgAV6x9sKLDnc90=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-251-FVp-p04ZPy6zxed_j3DWmw-1; Tue, 12 Jan 2021 13:50:10 -0500
X-MC-Unique: FVp-p04ZPy6zxed_j3DWmw-1
Received: by mail-ed1-f70.google.com with SMTP id y19so1399480edw.16
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 10:50:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fGe7dTF2HONS2AdIsLP4yVgdLgCaOWrVnjt97KzfM5Y=;
 b=XoGj4OUZbS1pteeKkOw7c53VEzOYfqgfUfc/bbJ8RLunDCWlRQsdAYzGE8ZmqaV5F4
 ATUbghtxN3zoqXWVPNs4aIu+9rMzbxcr+/5Vr8ZEuewZhpkgXb2kQw79SVHsLj/bePgg
 Y3V9rFd4xXz7LQbCuNzOSKOFMg7RsYcTGtsLiUVVXLzOV2Mdainh1xxJMYJCBTWrvasI
 gMLzes3RJBAAUtvFpE3OBrMIOapXJJltbWVDV0kmOQq9r3I9J8P/rhvdPq31lqHgWuQE
 t10RWhLMcQV8IhNlq6qMwuj2cW4De50EAAV5kUAgi8rJYvIkbBlrlUOzOcGRWt4RHXpq
 kNvw==
X-Gm-Message-State: AOAM531WFl4jQeL+Qjlfcn5KjxI037m2zn5jD/+998T+TNANj1Q9e0Z8
 5g596+hqP/h+FK6T+Pb7Aaqk0HBdVKL8yH7CpiNJt2LgdQxVgttCWhbTGYdIAx2aMskWoKMUKof
 T+TIkDytXaxedwQo=
X-Received: by 2002:aa7:c1d2:: with SMTP id d18mr394488edp.261.1610477409767; 
 Tue, 12 Jan 2021 10:50:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxMGT+Wmd5N3bjEn6sSzMeau4qszV53vK9LFCMJKG10HiwzLnEOPhf7wP82z/R3oSYdkkUUgw==
X-Received: by 2002:aa7:c1d2:: with SMTP id d18mr394478edp.261.1610477409597; 
 Tue, 12 Jan 2021 10:50:09 -0800 (PST)
Received: from [192.168.1.36] (190.red-83-57-173.dynamicip.rima-tde.net.
 [83.57.173.190])
 by smtp.gmail.com with ESMTPSA id h12sm1501016eja.113.2021.01.12.10.50.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Jan 2021 10:50:08 -0800 (PST)
Subject: Re: [PATCH 1/2] trace: document how to specify multiple --trace
 patterns
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20210112165859.225534-1-stefanha@redhat.com>
 <20210112165859.225534-2-stefanha@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <4c0a176e-caad-0c63-bc12-2cf7a4e4a703@redhat.com>
Date: Tue, 12 Jan 2021 19:50:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210112165859.225534-2-stefanha@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/12/21 5:58 PM, Stefan Hajnoczi wrote:
> It is possible to repeat the --trace option to specify multiple
> patterns. This may be preferrable to users who do not want to create a
> file with a list of patterns.
> 
> Suggested-by: BALATON Zoltan <balaton@eik.bme.hu>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  docs/devel/tracing.rst | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/docs/devel/tracing.rst b/docs/devel/tracing.rst
> index 4ebf8e38ea..8777c19d14 100644
> --- a/docs/devel/tracing.rst
> +++ b/docs/devel/tracing.rst
> @@ -22,10 +22,15 @@ events::
>  This output comes from the "log" trace backend that is enabled by default when
>  ``./configure --enable-trace-backends=BACKENDS`` was not explicitly specified.
>  
> -More than one trace event pattern can be specified by providing a file
> -instead::
> +Multiple patterns can be specified by repeating the ``--trace`` option::
> +
> +    $ qemu --trace "kvm_*" --trace "virtio_*" ...

Yet another possible improvement is to describe the deselect pattern:

       --trace "virtio_*" --trace "-virtio_mem*"

> +
> +When patterns are used frequently it is more convenient to store them in a
> +file to avoid long command-line options::
>  
>      $ echo "memory_region_ops_*" >/tmp/events
> +    $ echo "kvm_*" >>/tmp/events

Ditto:

       $ echo "-kvm_irqchip_*" >> /tmp/events

>      $ qemu --trace events=/tmp/events ...
>  
>  Trace events
> 

Probably better in a different patch, so for this one:
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


