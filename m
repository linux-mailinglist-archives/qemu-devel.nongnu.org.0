Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 278102D5E19
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 15:39:56 +0100 (CET)
Received: from localhost ([::1]:36238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knN6p-00016S-4a
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 09:39:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1knMvM-0001oO-Gb
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 09:28:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:39815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1knMvI-0007tC-VU
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 09:28:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607610480;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H6gmFIInvImD2kayUKLyvQaKlpV11gJ7jcME2e0PUB8=;
 b=hz+/Z64fpHPN+Lnbx9W3iPDGU+MQHJdxRQ+oo26mGExJuL/FV7HqjQK8gTqJUlYTw1G8VN
 U5FRUoxmxLwt39oxykDtFwT7nTw/OxEo+EUlHK4UZm68aMSpjsas7IxCn97hYFWsxS5CA4
 BeB0Oz5RslNAcdEEqta+amALbfGQiRU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-318-YKQBJrmiOUmXKFIprmbr0w-1; Thu, 10 Dec 2020 09:27:58 -0500
X-MC-Unique: YKQBJrmiOUmXKFIprmbr0w-1
Received: by mail-wr1-f69.google.com with SMTP id o17so2001450wra.8
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 06:27:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=H6gmFIInvImD2kayUKLyvQaKlpV11gJ7jcME2e0PUB8=;
 b=gMKZNf/avnOKZWrbXN5h+/ktmP5tju56cdrcscwx+7dHP/ej1+iYQGj5jhUJ3GsZDI
 TWCJvg3NbVRsfZVJKITtrS/WQjOPrccYOLgAM8nXGOJ6qKvs4waFYGK1r1oM6RtTMPSl
 BWeDy0ktna6JScHjOId9FKxOaRqkAUYwGFXgbqRJojWFZp+5a/7aBQWjOvPNmpSgH27I
 WgInH6XBK4wL1zRaP4CJG+v/xxywJh6GNq6ncG1a6IrDchXrtQrqWS3xSiH0mJUjFPaS
 aqwLwmum9B2dPQt4MVmMp5CFU4wN7aZCNPI2YJcgooX5vTvxHaFGA767NCP/jkQJi8JC
 711g==
X-Gm-Message-State: AOAM531AaH9rJI1Jmh3SaLiZUsnT6uE0HEJAbwR7wVOqPCB2sadMA7P0
 jEH6a3GYWdveKhGKGG/uu7/tq8kEiIeyvSmd1MQ5SFMyLmt2MJfjazZSZ2SQ7dYVcMVYcxZJ2sg
 xfb5G5ThHrVlz/sg=
X-Received: by 2002:a5d:6045:: with SMTP id j5mr1454235wrt.223.1607610477558; 
 Thu, 10 Dec 2020 06:27:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy7bHwU1JSlDFVxpuvOX/Iiux9ODs4iDn2SnVkkhqy/VoN5VHkkduwq/x4vp8pvjDYzkbi8dw==
X-Received: by 2002:a5d:6045:: with SMTP id j5mr1454216wrt.223.1607610477406; 
 Thu, 10 Dec 2020 06:27:57 -0800 (PST)
Received: from [192.168.1.36] (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id c81sm10499615wmd.6.2020.12.10.06.27.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Dec 2020 06:27:56 -0800 (PST)
Subject: Re: [PATCH v3 12/13] linux-user: remove GNUC check
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20201210134752.780923-1-marcandre.lureau@redhat.com>
 <20201210134752.780923-13-marcandre.lureau@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <b87fb20f-5b0e-2995-fe03-968391d3dce9@redhat.com>
Date: Thu, 10 Dec 2020 15:27:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201210134752.780923-13-marcandre.lureau@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/10/20 2:47 PM, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> QEMU requires Clang or GCC, that define and support __GNUC__ extensions.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  linux-user/strace.c | 4 ----
>  1 file changed, 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


