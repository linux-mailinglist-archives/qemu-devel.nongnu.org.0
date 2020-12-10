Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4B1F2D5E26
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 15:42:57 +0100 (CET)
Received: from localhost ([::1]:42712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knN9k-000412-QB
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 09:42:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1knN04-0004S7-SK
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 09:32:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54242)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1knN00-00013z-Li
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 09:32:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607610771;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rtNjAtow8SQkrLmz8+XRRA+YtRhz+KF6e43NFXvxDSI=;
 b=TWjFleb5lvlkK2DaUKlbuIvAhYTHiiLwdUAgNzmAEBa4twQaCFMYCke73vmbl9Vi5UT0yZ
 25MSrD3Vh2weKk/n9sZD4ASph1LNyQcNneNxvNd+lim2WsPigP1NfE/z2WT1i1uLkXNfX6
 9XfC2KQff5rBV+aI3JZfKFUyIMKe6Ao=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-169-GXfhmJmXPiahFJ046SqmjA-1; Thu, 10 Dec 2020 09:32:49 -0500
X-MC-Unique: GXfhmJmXPiahFJ046SqmjA-1
Received: by mail-wr1-f71.google.com with SMTP id w9so739433wrt.2
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 06:32:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rtNjAtow8SQkrLmz8+XRRA+YtRhz+KF6e43NFXvxDSI=;
 b=Vh2txgbQyc/4/cGN6GVKFDIIt49caaDraBhlFzc2Zh8USB7a9MgdpmGZUM36R0F+5q
 Tzahec45ZcD7uKqSk7K6Uk/BZQ3bC78U6c7rUKIYjx8Y4NdVKcRNSxFkv3vW/fHflCIB
 TiqVlE7WIiCWXekH/+48vIa1U0UYZByWPBqUHZj55E9RVu+nkA2FEQvNl6qS2magQcQ3
 V6tCOr92qci4m+91ksV8KVVvS+0W9BoGBJR3bHD1FQYJoxUnFGZsYMoAA/OPwBQpf7iN
 eAybIyEHhe0a8Bu0pXbzZf0mOj7xiqfWHP8BqtJYWzKuDiLq/l7MVb9lwN+gLZYhTsFp
 bwJA==
X-Gm-Message-State: AOAM532ohnKYfZpXgc/QdwDGO64QeybPu7fH4VZje23PmijRMDys+0Yb
 7tXJbVd7zjptMrvYLKf0LHUHb4dIdJz8q9Q9GlYWTXuKPRgh+M+tyrqSG5jz+88FXPk/Qpr8IRY
 XxbxTV4WjgWcG3rU=
X-Received: by 2002:a7b:c04c:: with SMTP id u12mr8855729wmc.185.1607610768402; 
 Thu, 10 Dec 2020 06:32:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyvghq2Cu/Yzn0V6T8HyFCC4QgkWnmvztae8ydvZyqC4LvjfyNnoaYdKanep7mP2UKqi7czEA==
X-Received: by 2002:a7b:c04c:: with SMTP id u12mr8855692wmc.185.1607610768234; 
 Thu, 10 Dec 2020 06:32:48 -0800 (PST)
Received: from [192.168.1.36] (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id z13sm9898753wmz.3.2020.12.10.06.32.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Dec 2020 06:32:47 -0800 (PST)
Subject: Re: [PATCH v3 03/13] compiler.h: remove GCC < 3 __builtin_expect
 fallback
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20201210134752.780923-1-marcandre.lureau@redhat.com>
 <20201210134752.780923-4-marcandre.lureau@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <fead8bf1-7848-8809-c67a-e6354e7b5cf7@redhat.com>
Date: Thu, 10 Dec 2020 15:32:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201210134752.780923-4-marcandre.lureau@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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
> Since commit efc6c07 ("configure: Add a test for the minimum compiler
> version"), QEMU explicitely depends on GCC >= 4.8.
> 
> (clang >= 3.4 advertizes itself as GCC >= 4.2 compatible and supports
> __builtin_expect too)
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>  include/qemu/compiler.h | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/include/qemu/compiler.h b/include/qemu/compiler.h
> index c76281f354..226ead6c90 100644
> --- a/include/qemu/compiler.h
> +++ b/include/qemu/compiler.h
> @@ -44,10 +44,6 @@
>  #endif
>  
>  #ifndef likely
> -#if __GNUC__ < 3
> -#define __builtin_expect(x, n) (x)
> -#endif
> -
>  #define likely(x)   __builtin_expect(!!(x), 1)
>  #define unlikely(x)   __builtin_expect(!!(x), 0)
>  #endif
> 

Trying with GCC 10:
warning: implicit declaration of function ‘likely’
[-Wimplicit-function-declaration]

Clang 10:
warning: implicit declaration of function 'likely' is invalid in C99
[-Wimplicit-function-declaration]

Shouldn't it becleaner to test in the configure script or Meson that
likely() and unlikely() are not defined, and define them here
unconditionally?

Regards,

Phil.


