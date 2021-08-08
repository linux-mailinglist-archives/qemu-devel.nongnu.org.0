Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39CD43E38F9
	for <lists+qemu-devel@lfdr.de>; Sun,  8 Aug 2021 07:19:51 +0200 (CEST)
Received: from localhost ([::1]:49640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mCbDy-0001Du-9Y
	for lists+qemu-devel@lfdr.de; Sun, 08 Aug 2021 01:19:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mCbCz-0008TH-JD
 for qemu-devel@nongnu.org; Sun, 08 Aug 2021 01:18:49 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:45832)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mCbCx-0003UR-Ud
 for qemu-devel@nongnu.org; Sun, 08 Aug 2021 01:18:49 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 m10-20020a17090a34cab0290176b52c60ddso24438265pjf.4
 for <qemu-devel@nongnu.org>; Sat, 07 Aug 2021 22:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=czrXoOa0+Nue3JohDWFelagJwh9gC/eLyqFB01TWC/c=;
 b=cGTrb3s6/8H5jR09COtyazW5nNrnqw2+nHQr0ukBXFWhSvUcJ9G7XYaajdSAHmjVci
 LLn8E5wqGwZbI7BhuzSnUm50z0ewuCUT2C7PuVwY4boZ8zwHCui+gFSw+8ixEv4AyHFI
 t4RD6+mpnoPCqu6AI2zId+oNml7dLbu/Kn7lY6lm07Vqxw1wDNfqLa90x17yaNkNRYBl
 0X7BmBRrRNJa+EWQWh1rLxvsDPJlageKycSUbhIS7js7/UO6nS/G/OBOeHf594PyXP7q
 28kMtnQVX3p4EhjFmbDFeV6g/cXXtcYtwWbZxxTsE63dRJ9W6wPD+30GXvWlLkPfgJHw
 OTrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=czrXoOa0+Nue3JohDWFelagJwh9gC/eLyqFB01TWC/c=;
 b=XST+LzwAvVZPyW6wpA9iWmjrRAgAihRH2xNX+yEjK69ek/hd0HX2DBg6yte2XaEPkI
 LVecF8u2Lt4OZJaa+1OT4etogIcBUy13SLtoYOokncWIB4mlqeXHhwptecTWoBT8E/Sm
 pHnoTIahR28B24Hz/9shoEMcmlTCpBQ7dLSKixqma0R6Ga2vANFPTCVrEysqeRlJlQG7
 Pg7raUvWTsLd2p7HLBwPsuI7k5w9yR1iGlTjqeW9H6cFRVa4Mj3rL+YMqLxruFLralFk
 H62pw1uHAkWrMBHvGbQXZeaEmQlH2todQK4//g+q4D0xwRChIzVkvU7FPA/dFlo2Yu8B
 tArQ==
X-Gm-Message-State: AOAM533Fi5rj4RfExMT0rIMf1wvfCRrnawiiJNnAPLqQUmseIj9ENwWn
 JsYdrJccVyZAOS7hxfUEYde4PQ==
X-Google-Smtp-Source: ABdhPJxl6PLHybnfYUvdfbGy7srAWLQcKx7z1tDV6vHARRK8DBXng4MFWo9SOnd0uxoqCV4LbgeiLw==
X-Received: by 2002:a17:90a:e38b:: with SMTP id
 b11mr18630864pjz.70.1628399926464; 
 Sat, 07 Aug 2021 22:18:46 -0700 (PDT)
Received: from [192.168.6.169] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id b2sm13740936pjh.18.2021.08.07.22.18.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 Aug 2021 22:18:46 -0700 (PDT)
Subject: Re: [PATCH for 6.2 17/49] bsd-user: assume pthreads and support of
 __thread
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20210807214242.82385-1-imp@bsdimp.com>
 <20210807214242.82385-18-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d0295c36-881f-57d7-2d45-4d8a3f662c7a@linaro.org>
Date: Sat, 7 Aug 2021 19:18:43 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210807214242.82385-18-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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
Cc: kevans@freebsd.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/7/21 11:42 AM, Warner Losh wrote:
> All compilers for some time have supported this. Follow linux-user and
> eliminate the #define THREAD and unconditionally insert __thread where
> needed.
> 
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/main.c |  2 +-
>   bsd-user/qemu.h | 10 +---------
>   2 files changed, 2 insertions(+), 10 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

