Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB051376917
	for <lists+qemu-devel@lfdr.de>; Fri,  7 May 2021 18:54:11 +0200 (CEST)
Received: from localhost ([::1]:41724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lf3ju-0003Yt-SB
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 12:54:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lf3i3-0002J5-TV
 for qemu-devel@nongnu.org; Fri, 07 May 2021 12:52:16 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:46772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lf3i0-0000tZ-Ka
 for qemu-devel@nongnu.org; Fri, 07 May 2021 12:52:14 -0400
Received: by mail-pf1-x430.google.com with SMTP id q2so7972176pfh.13
 for <qemu-devel@nongnu.org>; Fri, 07 May 2021 09:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=uYonLK7xhyQrIkfcST35QE2pOcGEKQCXaCVmFvykYks=;
 b=pdpm0gfnqsB6sqa/xUpxSvZPA3Dj1kf7aUr7xbJnUreChGuH4+S0h5GbZPWkMfRKM5
 0XyIZT/I7YwCI4i/IuWI9FAcPOf29F8NaHEhn66SZu3dh/yNQuDDiHpDrY9IeCdiX23Z
 Rodn42r+qwNOzrj7nEbDy4ZUTZi4PbeACBUbq0XQRgVtP7UjdpYETrgVsvl+QYEfCgTS
 zy5shBFfpEVdR28V2uf9aXs3QwRz4+6L4teiOOR5JF7PKe2zuXA93FdewbH/IZaIzz0d
 6s95w/zqPg0Op3IoRmKWVzL0CXBbo6TzfuvJqprGd4y/zcEsy5DhddIhFmk8ijuWsJ4H
 GiMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uYonLK7xhyQrIkfcST35QE2pOcGEKQCXaCVmFvykYks=;
 b=GkWDvfg+lbYSHCV9CLLI0La06l4g2Nr7WXhz4uBi4E44YnNwrDR96A2RwynEresB4a
 4l/9E4Vj+9tf2yh2RGGq6KaZjn7Jd0sw8mLBcK+/2SN7mMRb9j5H0fqcWD9sT4ZpxQsU
 18L2ceI9LKXn+HQKOC0kpJ6EqSXQ4BeytcLA93qGQi3lTb8StutxeZrrbm1pbzLn0E8F
 NAcMfTBGkfF5GRMwPAEqgDzkRzGbpPsdU3Dy2WWPqr8LAAZW6xWUHvtYDA66yjtEyVp1
 x0ZLNvXz8eVH0rspC0J3sWqFiN2jSPRswCsxhY4zqYLl2rxfCCOmXxyE6svaSWVgt7iK
 33/A==
X-Gm-Message-State: AOAM531wH/RFaMEinNoVyvTuHnOdO+ikauWUyyTIuSu6dZBQvh8zcNLM
 GTETCRHvTVEC0SJUWjEFZ5u6EA==
X-Google-Smtp-Source: ABdhPJxTJMn7M53AGWcOg75JZZHR/rPhJUCrmgHAO9DGnGHp+PN9CLPLBhWnqbyqPrODYtb9tSsgTA==
X-Received: by 2002:a63:4c55:: with SMTP id m21mr11140333pgl.251.1620406330605; 
 Fri, 07 May 2021 09:52:10 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id j79sm3159806pfd.184.2021.05.07.09.52.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 May 2021 09:52:10 -0700 (PDT)
Subject: Re: [PATCH 22/23] tests/unit/test-vmstate: Avoid dynamic stack
 allocation
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210505211047.1496765-1-philmd@redhat.com>
 <20210505211047.1496765-23-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b38fb601-9c1b-c16e-71ca-2feb9c26770a@linaro.org>
Date: Fri, 7 May 2021 09:52:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210505211047.1496765-23-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, qemu-ppc@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/5/21 2:10 PM, Philippe Mathieu-Daudé wrote:
> Use autofree heap allocation instead of variable-length
> array on the stack.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@redhat.com>
> ---
>   tests/unit/test-vmstate.c | 7 +++----
>   1 file changed, 3 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

