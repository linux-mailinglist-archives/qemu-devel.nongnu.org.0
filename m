Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B7EE2FF35C
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 19:42:57 +0100 (CET)
Received: from localhost ([::1]:58816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2ev2-0005Ti-F7
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 13:42:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l2enN-0000rR-1l
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 13:35:02 -0500
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:46285)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l2enC-0008J3-Ma
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 13:35:00 -0500
Received: by mail-pf1-x436.google.com with SMTP id f63so2010317pfa.13
 for <qemu-devel@nongnu.org>; Thu, 21 Jan 2021 10:34:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Ex8FaTw4uspRlsv7UajOm5UBHG1EF0BQNRyRPEN8dps=;
 b=cL7JcLSWitZJK84Dp0vSswgr2yEnMCnN4JU452RU3IdkbMoCabjLzJuu2DdrVqTEgJ
 KgPNn9UMI1XFLp/staOAyjA/mImaXMQvIzylRFeRNe5a58NgN5k8XX2uuzdh0w/uc2zZ
 6XOar0JVii05UIf6o2/BBO96CYImOu2h0A0dpJIucgQ4gANmizoSXm6tsJvVwhmRnGh/
 9uyJxHkzVYCnCITonPN1dLEQjanRzLdivNZkt17qtxpJtBnVhAFvkumqXH/jLjLTdsAE
 yGN0jfRI1rfiswUNB7Xays67YTI0qMIoKimqfaHKda2ewy9t/dTXwZdbAQ9hol7QlhOW
 5nKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Ex8FaTw4uspRlsv7UajOm5UBHG1EF0BQNRyRPEN8dps=;
 b=nTU4EPaK2gWON2WOmV4H0lkz80zIXpIsmbM8FRx9RLislSj9x47G/sF6puit/GULx8
 cdXBqcuZ3G6Ok6ioIouCGw+xsQ7voS1NXDuQ7jF6REG0UFNSkN+TndUywUYblEz9+HXU
 vWp9xw//zFSVH8XUKrcKe86VOPYyrS9R87EEPSF67ltPnE0YM/XiV+9FVHgQPrCarRQp
 p04cNgtHwb905N9RCmwE+zvnF+syWBjAbhU8N37BnPAXjhz9QqLxIvFPwqhhLVR6fLgG
 mp9IveLT5fNTZIG/JG9cjAemH9OpMYW9Hu7trtVhR0FQQ7AY0Om2kbXFCzNSb5CLBDaw
 Krqw==
X-Gm-Message-State: AOAM533FEXMmfDato0Fx+OBBPGLZZhKEt4CLVkPOui2HBAgN9ceDFhRP
 0AF99IOwclxdr93J8ddeRkVwvw==
X-Google-Smtp-Source: ABdhPJxBed+3spmkvuziw6ploeKvOgJEV30fRkxrtQip8pym8RF0XVPmHXsl0+WQYaGicS+IytG7uQ==
X-Received: by 2002:a62:2c50:0:b029:1b9:1846:b490 with SMTP id
 s77-20020a622c500000b02901b91846b490mr677859pfs.76.1611254088893; 
 Thu, 21 Jan 2021 10:34:48 -0800 (PST)
Received: from [192.168.3.43] (cpe-66-75-72-126.hawaii.res.rr.com.
 [66.75.72.126])
 by smtp.gmail.com with ESMTPSA id m10sm6534477pjn.53.2021.01.21.10.34.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Jan 2021 10:34:48 -0800 (PST)
Subject: Re: [PATCH v3] tcg: Fix execution on Apple Silicon
To: Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org
References: <20210113032806.18220-1-r.bolshakov@yadro.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e0b70beb-2905-9520-e825-219278fe4ed7@linaro.org>
Date: Thu, 21 Jan 2021 08:34:44 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210113032806.18220-1-r.bolshakov@yadro.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Alexander Graf <agraf@csgraf.de>,
 Joelle van Dyne <j@getutm.app>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/12/21 5:28 PM, Roman Bolshakov wrote:
> @@ -1083,6 +1083,12 @@ static bool alloc_code_gen_buffer_anon(size_t size, int prot,
>  {
>      void *buf;
>  
> +#if defined(MAC_OS_VERSION_11_0) && \
> +    MAC_OS_X_VERSION_MAX_ALLOWED >= MAC_OS_VERSION_11_0
> +    if (__builtin_available(macOS 11.0, *)) {
> +        flags |= MAP_JIT;
> +    }
> +#endif

This hunk should be in alloc_code_gen_buffer, where we do the other flags
manipulation.

I'll drop this hunk and apply the rest, which is exclusively related to
toggling the jit bit.

> --- a/util/osdep.c
> +++ b/util/osdep.c
> @@ -606,3 +606,23 @@ writev(int fd, const struct iovec *iov, int iov_cnt)
>      return readv_writev(fd, iov, iov_cnt, true);
>  }
>  #endif
> +
> +#if defined(MAC_OS_VERSION_11_0) && \
> +    MAC_OS_X_VERSION_MAX_ALLOWED >= MAC_OS_VERSION_11_0
> +void qemu_thread_jit_execute(void)
> +{
> +    if (__builtin_available(macOS 11.0, *)) {
> +        pthread_jit_write_protect_np(true);
> +    }
> +}
> +
> +void qemu_thread_jit_write(void)
> +{
> +    if (__builtin_available(macOS 11.0, *)) {
> +        pthread_jit_write_protect_np(false);
> +    }
> +}
> +#else
> +void qemu_thread_jit_write(void) {}
> +void qemu_thread_jit_execute(void) {}
> +#endif

I will move these inline in osdep.h, because it's either (1) a single function
call or (2) a nop.


r~

