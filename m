Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4B64407D92
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Sep 2021 15:24:27 +0200 (CEST)
Received: from localhost ([::1]:41860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPPT8-0000Sj-7f
	for lists+qemu-devel@lfdr.de; Sun, 12 Sep 2021 09:24:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPPRf-0007q3-MV
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 09:22:55 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:56129)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPPRa-0007fw-Nl
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 09:22:53 -0400
Received: by mail-pj1-x102f.google.com with SMTP id t20so4442737pju.5
 for <qemu-devel@nongnu.org>; Sun, 12 Sep 2021 06:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=cm2tJZZ+eKC+cRDFQIltMVNb63iTuPYu4bhO5ith6WI=;
 b=KQ6UWsdCZoRi4OHuYlSxggDmP/6sIYuFP5Q7vTtzfBaBfOL0Av5r6XzFNRg9FdV/lO
 xLdMF7Hr+Bkz2U3Sn/jv8XI158SfMWsOYV/qX8kaWstcYkA9mZ25RPGBfTEhEB3QKZ6G
 7UJy7xR/4aH4NQXBFuwtePFOclkKJUF7CTNLW8xoMO53ZEkRWmSXOEVn1lelK6lYfYbu
 d7hRcmjmQYnbLu+dfiWQXlIR09yffQQoZKgHNnVt/T1SRqtI/fqTEK82TXE3jl4WVKV9
 9p5fKXwxCXW5rK+6tw7IgMqXOGblqzSBbpErjarlqDELt4gpSg6QsJIvldh17LsvSnQK
 ptFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cm2tJZZ+eKC+cRDFQIltMVNb63iTuPYu4bhO5ith6WI=;
 b=egmbVv1VaKHTG1lEf49T9sCuQ7sfmGk6WpCOL5EZ/9XydOkzDa/M46lUlFEWutoy5u
 noNKf3G3t2+OJaTrrWIqmHu6LY+n8q4BKoTUxpD0W7sqGJYP64OvF3INJqmzqmVhP6JL
 wme0Asqzp1QyExTR6taLxw9lwp7iCUyl6mwk3iySFTu843mDpKvKRVLQPQXJ6uNKbOXX
 R1CwBgbYXdbqXqTrs0tX/ScCLjqn5FjdsHR+uFnp901zxQ4Rr7A2EDz8Q0UOHN7mNR/m
 Xll89Ok99x81hqMHeceZbEZ5UuuKCC8EY4FvO4120zpcV9kjL+C2flWWT4ZjnOVisRnW
 4Uvw==
X-Gm-Message-State: AOAM5336d+H4KaluaEa1Mt6x0NUPk7AzDMzjnBlJUvJF5XBfhAd8dF8b
 SlmhvQlcb6VMBgSm3AYdCGhftQ==
X-Google-Smtp-Source: ABdhPJyUuZaUqX0Yce2HmrKIZDM+P7iZEan2P0BXeamWw5u8abVgylyqtC2eZTHVGvYSLSJYLaj4rg==
X-Received: by 2002:a17:902:a3cf:b0:13a:70c6:f911 with SMTP id
 q15-20020a170902a3cf00b0013a70c6f911mr6164025plb.42.1631452969019; 
 Sun, 12 Sep 2021 06:22:49 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id x10sm4339852pfj.174.2021.09.12.06.22.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Sep 2021 06:22:48 -0700 (PDT)
Subject: Re: [PATCH] qapi: define cleanup function for g_autoptr(Error)
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210912124834.503032-1-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <cb5face5-73fe-24e4-ba35-27ccb436fb79@linaro.org>
Date: Sun, 12 Sep 2021 06:22:46 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210912124834.503032-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -56
X-Spam_score: -5.7
X-Spam_bar: -----
X-Spam_report: (-5.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.584,
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
Cc: berrange@redhat.com, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/12/21 5:48 AM, Paolo Bonzini wrote:
> Allow replacing calls to error_free() with g_autoptr(Error)
> declarations.
> 
> Signed-off-by: Paolo Bonzini<pbonzini@redhat.com>
> ---
>   include/qapi/error.h | 2 ++
>   1 file changed, 2 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

