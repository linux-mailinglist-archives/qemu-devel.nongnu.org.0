Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 711336EA3A5
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 08:17:39 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppk4z-00070Z-TT; Fri, 21 Apr 2023 02:17:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppk4y-0006zp-0P
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 02:17:08 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppk4w-00021W-Dw
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 02:17:07 -0400
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-2fbb99cb297so1211465f8f.1
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 23:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682057825; x=1684649825;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dZAouoG07rYEiITf/0M4FoJTyfaJecUXjX+wVTKhFjQ=;
 b=gOaivThbpRspPCe0hMjRfT5HvGWSIYNEGgTo3hcQ06LOpkJd3YwiD5zFy8HSeppfB0
 yUJ4YQWUpavY5d+tAymgSW6f4aoNJfTTOfq4CWafMpoiexf/gZJ1KGQriXlsZFRYDUM0
 10f646rrIB1TYSjh3M40/IhQJWGRmJg0ip6/0LdIfngTz+KV/si21qy+4Fr9NAo1VT/K
 B2DSpkE9uwjL2h9paztY/0+EeR3BeokiDoMNbO5mCLHgtLakGY93X5kBSw2/8PAMT3lz
 0jQdGXVmi+Ez7eUIxOS0dMsRLOm4YjW9DY7dieRNxxOnYsdb4l80n61rhwfHfX35Rzl2
 o5Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682057825; x=1684649825;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dZAouoG07rYEiITf/0M4FoJTyfaJecUXjX+wVTKhFjQ=;
 b=Yv5mcaUWx+AdUjLyNVfR5me4JLWM0qciAFZq+WmyLO1UDMhV6YHZ3bmfUFAMUIK883
 a3O3Q11fTmt0MT8cA+U+uMVA95zroWc4n3oNfYTtdlbpjW+GbabA+I0Y8WDy2+XzTD+l
 Z0sTitJoLVjbf8QiT8OBjjQCxY/mgod7ZJHz82gGaQlYLzFL8etBfNkMx2xvR92ByJg8
 ZJRp7QhtkUkXiftz8DLYVVcq7TsXpiN6vp+PHITMaNdXzR1eUyFWLyxXq9eZqB7hi/o6
 m1tfUIuZY1cHhOsSAvJfUQ5Mb6ksBw2oPAaFzDvuTRb37ySC43UyMdhvyalxv1GD91hS
 eOwQ==
X-Gm-Message-State: AAQBX9dZ/mLKOTH5EFR/re76wQGcxvj4U3hOjnq8bmcp8HTRWvhQL3BY
 VcKk1GrWwhc8dqpfPUwnVI3Dew==
X-Google-Smtp-Source: AKy350aM8l8mf6X8GnTxTxz55OVZVWYT4DJ1OX9FamdLkk8Q41To4n3e9qRIVtcgxyFHPkbGmtW1KQ==
X-Received: by 2002:a5d:498c:0:b0:301:5615:26e4 with SMTP id
 r12-20020a5d498c000000b00301561526e4mr2480271wrq.32.1682057824889; 
 Thu, 20 Apr 2023 23:17:04 -0700 (PDT)
Received: from [192.168.69.115] (min31-h02-176-184-28-119.dsl.sta.abo.bbox.fr.
 [176.184.28.119]) by smtp.gmail.com with ESMTPSA id
 t15-20020adfe44f000000b002f00793bd7asm3659891wrm.27.2023.04.20.23.17.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Apr 2023 23:17:04 -0700 (PDT)
Message-ID: <1ce87a03-24e6-b765-1eee-4d97fddce9e0@linaro.org>
Date: Fri, 21 Apr 2023 08:17:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH 9/9] docs/style: call out the use of GUARD macros
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 peter.maydell@linaro.org, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Alexandre Iooss <erdnaxe@crans.org>,
 John G Johnson <john.g.johnson@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>, Juan Quintela
 <quintela@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>
References: <20230420155723.1711048-1-alex.bennee@linaro.org>
 <20230420155723.1711048-10-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230420155723.1711048-10-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.669,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 20/4/23 17:57, Alex Bennée wrote:
> There use makes our code safer so we should mention them.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> ---
>   docs/devel/style.rst | 36 ++++++++++++++++++++++++++++++++++++
>   1 file changed, 36 insertions(+)
> 
> diff --git a/docs/devel/style.rst b/docs/devel/style.rst
> index 0bd01f3fca..b50a981a86 100644
> --- a/docs/devel/style.rst
> +++ b/docs/devel/style.rst
> @@ -657,6 +657,42 @@ that declaration and the new code.
>   
>   See :ref:`qom` for more details.
>   
> +QEMU GUARD macros
> +=================
> +
> +QEMU provides a number of ``_GUARD`` macros intended to make the
> +handling of multiple exit paths easier. For example using
> +``QEMU_LOCK_GUARD`` to take a lock will ensure the lock is released on
> +exit from the function.
> +
> +.. code-block:: c
> +
> +    static int my_critical_function(SomeState *s, void *data)
> +    {
> +        QEMU_LOCK_GUARD(&s->lock);
> +        do_thing1(data);
> +        if (check_state2(data)) {
> +            return -1;
> +        }
> +        do_thing3(data);
> +        return 0;
> +    }
> +
> +will ensure s->lock is released however the function is exited. There
> +are often ``WITH_`` forms of macros which more easily wrap around a
> +block inside a function.
> +
> +.. code-block:: c
> +
> +    WITH_RCU_READ_LOCK_GUARD() {
> +        QTAILQ_FOREACH_RCU(kid, &bus->children, sibling) {
> +            err = do_the_thing(kid->child);
> +            if (err < 0) {
> +                return err;
> +            }
> +        }
> +    }
> +
>   Error handling and reporting
>   ============================
>   


