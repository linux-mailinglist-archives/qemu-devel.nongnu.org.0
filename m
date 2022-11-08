Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E08A620ECA
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 12:23:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osMhE-0001EN-R9; Tue, 08 Nov 2022 06:23:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1osMh9-0001AB-U0
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 06:23:09 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1osMh8-0007oW-8M
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 06:23:07 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 m7-20020a05600c090700b003cf8a105d9eso8848306wmp.5
 for <qemu-devel@nongnu.org>; Tue, 08 Nov 2022 03:23:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RwR6J/hx+PU96P/Dvk0asQufcjhW1Bt4kQZjdXSLBeI=;
 b=BtjB6ITlW1sOHKgpwh7RhJmlonM1yva6/civX0JGSh9ynZ9Odvl7lXAWFFvpPZCDRg
 aKatsR3pu9q02ISoOHu3oUNIFdv2peHvDFW7G6d9EmZuuvUPRpgB909fDzcqtP5VIwhf
 TGX5IosZsvC04qiZBvFqrZx2y24uoKwELVKfnS/SV9DMEPcYJW28XxEk7hjxtuJqezrH
 pOVUi6TWGzQqDxC6WYg9+eAcU7onlZaZisMkcY5mVi+Z9gAd6XNM0UyqHA4qErzsa+QS
 y5+A1Y3Gy0UbmV2sGxiLy8kOMO//2U1jOt9I0jJ1GhmC5CIAwq3dWlyjbVnq36aFsY03
 EvjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RwR6J/hx+PU96P/Dvk0asQufcjhW1Bt4kQZjdXSLBeI=;
 b=GSzfidUueDtOLD6pGtpHhsgXhHxMvVFL4XE8FLXJCNOl0Vh52z8Mby3NIu53efYMNv
 8H6kAOgVJfNav69+qDzoV1+K44hZg0IxYuSoVmO8pw32BPSlJ9xFXzIgGUzVnqOIE5xm
 k9HjDK4wE8j4YkxMT88wckTJeCqrAgNmjtB4sGHlGyx/ntAD0AhREN5NRCg4UvYFmd5H
 FhEewi2rsuT307kHAN4oWBYW7F1c7HKOL+6WEnYOz6LKOmFxLeVn/e3OmDIZRs/HL5C8
 AOWTLd9dsc1UIb8vTjv9UeIMqmnH7dhccqxruvg4F/tdzt96KR1IVh0OqKaAEFHrdjTP
 vjJg==
X-Gm-Message-State: ACrzQf0Qk/v4yjWEHC/Y+blMkqQEyK/aVHLaugUljXBQek2QX1A+9ki0
 DU/lZFDmE8sntKaTyCkzqBBYRw==
X-Google-Smtp-Source: AMsMyM57VLu/msrrDGT/4/SJjuNrhDZPkU3EfT8XNK/ZfIV+/V/HH6kw3xGEP1YNp1OIHj0Ay/7VNw==
X-Received: by 2002:a7b:cd07:0:b0:3cf:71b7:7a32 with SMTP id
 f7-20020a7bcd07000000b003cf71b77a32mr30833022wmj.202.1667906583528; 
 Tue, 08 Nov 2022 03:23:03 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 p25-20020a05600c1d9900b003cf77e6091bsm14503511wms.11.2022.11.08.03.23.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Nov 2022 03:23:03 -0800 (PST)
Message-ID: <327206ba-d7da-dacf-4f52-dcb5cee3cfc7@linaro.org>
Date: Tue, 8 Nov 2022 12:23:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH v1 2/9] tests/avocado: improve behaviour waiting for login
 prompts
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, John Snow <jsnow@redhat.com>
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org,
 aurelien@aurel32.net, pbonzini@redhat.com, stefanha@redhat.com,
 crosa@redhat.com, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20221108092308.1717426-1-alex.bennee@linaro.org>
 <20221108092308.1717426-3-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221108092308.1717426-3-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 8/11/22 10:23, Alex Bennée wrote:
> This attempts to deal with the problem of login prompts not being
> guaranteed to be terminated with a newline. The solution to this is to
> peek at the incoming data looking to see if we see an up-coming match
> before we fall back to the old readline() logic. The reason to mostly
> rely on readline is because I am occasionally seeing the peek stalling
> despite data being there.
> 
> This seems kinda hacky and gross so I'm open to alternative approaches
> and cleaner python code.

I'd have done it the same way...

> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   tests/avocado/avocado_qemu/__init__.py | 89 +++++++++++++++++++++++++-
>   1 file changed, 88 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/avocado/avocado_qemu/__init__.py b/tests/avocado/avocado_qemu/__init__.py
> index 910f3ba1ea..d6ff68e171 100644
> --- a/tests/avocado/avocado_qemu/__init__.py
> +++ b/tests/avocado/avocado_qemu/__init__.py
> @@ -131,6 +131,58 @@ def pick_default_qemu_bin(bin_prefix='qemu-system-', arch=None):
>               return path
>       return None
>   
> +def _peek_ahead(console, min_match, success_message):
> +    """
> +    peek ahead in the console stream keeping an eye out for the
> +    success message.
> +
> +    Returns some message to process or None, indicating the normal
> +    readline should occur.
> +    """
> +    console_logger = logging.getLogger('console')
> +    peek_len = 0
> +    retries = 0
> +
> +    while True:
> +        try:
> +            old_peek_len = peek_len
> +            peek_ahead = console.peek(min_match).decode()
> +            peek_len = len(peek_ahead)
> +
> +            # if we get stuck too long lets just fallback to readline
> +            if peek_len <= old_peek_len:
> +                retries += 1
> +                if retries > 10:
> +                    return None
> +
> +            # if we see a newline in the peek we can let safely bail
> +            # and let the normal readline() deal with it
> +            if peek_ahead.endswith(('\n', '\r', '\r\n')):

'\r\n' superfluous.

> +                return None
> +
> +            # if we haven't seen enough for the whole message but the
> +            # first part matches lets just loop again
> +            if len(peek_ahead) < min_match and \
> +               success_message[:peek_len] in peek_ahead:
> +                continue
> +
> +            # if we see the whole success_message we are done, consume
> +            # it and pass back so we can exit to the user
> +            if success_message in peek_ahead:
> +                return console.read(peek_len).decode()
> +
> +            # of course if we've seen enough then this line probably
> +            # doesn't contain what we are looking for, fallback
> +            if peek_len > min_match:
> +                return None
> +
> +        except UnicodeDecodeError:
> +            console_logger.log("error in decode of peek")
> +            return None
> +
> +    # we should never get here
> +    return None

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


