Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF60E50A71F
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 19:29:34 +0200 (CEST)
Received: from localhost ([::1]:37938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhacX-0002oX-TD
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 13:29:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhaXh-0004Tx-5b
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 13:24:33 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:42984)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhaXe-0001fU-IK
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 13:24:32 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 z6-20020a17090a398600b001cb9fca3210so5829110pjb.1
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 10:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=YAIVvOXO5pRhUvBabJj2SAz4lF9UAdf0AbwfCOQ0nOc=;
 b=nr1UaJLQdYoP9n7wPYwhM81L76ieMZgaZK3LP8cVV2Fzq/jUe6SWEc22kDNsPt8Xi5
 aKoiUSPZoqp3G9Oo9Ud+5WZ39ehJ5PSufIhSQDMZT+SvGMG+hEc4fDBlh9977M6KCR3R
 YnaEHw7Mc+oTOKAgads27ST2eKgITKYD7B65SiALNQjLFUenIjfqNilPnsREUnMsGjzT
 N2YwmF3p3b3LlW5Y2eOKEcgTKfxuhvKjSjOEkJH8l5fyim3TR67X+HUJ73e8xwSvW3Q0
 mHfKoUNjn8LQwy306GDaH4HCNICWPgFGo1KR63qunA8jTznwrz5OjkAbgjt2TNMkyUgH
 dczA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=YAIVvOXO5pRhUvBabJj2SAz4lF9UAdf0AbwfCOQ0nOc=;
 b=mwl89lLha5PbrQAw3uDfI2gaqORNMb+v1yVeGLyjQKKyrbvajlXk6tjmpsBm5bFTUV
 dZ2D7xsKTZ8pd3CoSzA6tmgFKgYTooq56X4TQkxxY/UjB3wCjMernCPQHgrjAo9Xk0sV
 wkbOzyvWSY8TnMRwtzFRc2Zz3pNq4OZ3ODmyglgLQoB/HH+bO4VZ5cuaGdYZxkyi7yh+
 8nRy1bNwIVvG/DWQvThv7likK4/xJUZTPQVYA8sEGLBDhOrH+op/xnCfDee7YXfPZ3F0
 qvgUBdPPyC7Z8roZnMm5Kw/4bM4XwuNAu9I7+WyxMu3hLTxGowJby9Asboum60kUWDko
 egjA==
X-Gm-Message-State: AOAM531bg3OFe+W2mQ7QfmLWpNMq1huv5ykNJxuswxjoRzwNWyItvbkt
 4zwgkvuxX6rtvLc7eDmpqYrn6A==
X-Google-Smtp-Source: ABdhPJwhYKmQjjeTH1dk4xVyAxQHVbEpQBtqLqtKfHnnxMYE+3t1xsu5+RFzjstK5SQMRM3khNBHRA==
X-Received: by 2002:a17:90a:ba13:b0:1cb:6296:ce41 with SMTP id
 s19-20020a17090aba1300b001cb6296ce41mr749312pjr.104.1650561869151; 
 Thu, 21 Apr 2022 10:24:29 -0700 (PDT)
Received: from ?IPV6:2607:fb90:80c1:f8a5:3d1f:84a9:7713:bf09?
 ([2607:fb90:80c1:f8a5:3d1f:84a9:7713:bf09])
 by smtp.gmail.com with ESMTPSA id
 d15-20020a630e0f000000b003a408836badsm18086460pgl.45.2022.04.21.10.24.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Apr 2022 10:24:28 -0700 (PDT)
Message-ID: <0a7a4ad7-e68a-4511-9c70-7a536fa5dc33@linaro.org>
Date: Thu, 21 Apr 2022 10:24:22 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PULL 13/13] dump/win_dump: add 32-bit guest Windows support
Content-Language: en-US
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>,
 QEMU <qemu-devel@nongnu.org>
References: <20220421124835.2831856-1-marcandre.lureau@redhat.com>
 <20220421124835.2831856-14-marcandre.lureau@redhat.com>
 <CAJ+F1CLcQ1x0L9v8UcxL+_6bRC9pVMxAK72i4ekgx5O_cnasdQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAJ+F1CLcQ1x0L9v8UcxL+_6bRC9pVMxAK72i4ekgx5O_cnasdQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: viktor.prutyanov@redhat.com, Janosch Frank <frankja@linux.ibm.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/21/22 06:59, Marc-André Lureau wrote:
>     -    check_header(h, &local_err);
>     +    check_header(h, &x64, &local_err);
>           if (local_err) {
>               error_propagate(errp, local_err);
>               return;
>           }
> 
>     +    hdr_size = x64 ? sizeof(WinDumpHeader64) : sizeof(WinDumpHeader32);
> 
> 
> The compiler is not smart enough here:
> ../dump/win_dump.c:416:46: error: 'x64' may be used uninitialized in this function 
> [-Werror=maybe-uninitialized]
> hdr_size = x64 ? sizeof(WinDumpHeader64) : sizeof(WinDumpHeader32);

The compiler might do better with

     if (!check_header(h, &x64, err)) {
         return;
     }

where check_header returns false on failure (which is recommended by qapi/error.h).  Right 
now, it can't see through error_setg() to see that local_err must be set when x64 isn't.


> I'll simply initialize the variable to true by default.

Or that.

I'll discard this pull request and expect a v2.


r~

