Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 266D66937DD
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Feb 2023 16:08:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRDx2-00089X-Tj; Sun, 12 Feb 2023 10:07:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pRDwe-0007yu-O3
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 10:07:12 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pRDwd-0005aS-3x
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 10:07:12 -0500
Received: by mail-pj1-x102c.google.com with SMTP id
 on9-20020a17090b1d0900b002300a96b358so9973408pjb.1
 for <qemu-devel@nongnu.org>; Sun, 12 Feb 2023 07:07:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=f3xxBQN9GcNCJ9e6uf5bBBGYH9g6FrgRxB8QSQG1ltM=;
 b=AWg5s7grTDbd4lLbVOneoL2d2FSLnTUmUp/KuHWVidrjhEMpixF/DTYkMZxVs/sgJC
 lCwR09t8nOClLyPwNhvqvl9jaXJhcsJm2lAaDx+pwV/cJ5mCCSIIollHUZ1fhO6Nat/O
 H/qx6m1dTcyQhR7icxdoTXnBkr7JXLK+P5CGhk8FC1C0rySZmqTx/HZc+FQ1zhTJs1vt
 OSQcTLKuTBjLSDxJZHcMbQ3OANq+gibTefQheGCVZ+t+9SHq4aG1J2E+3XrZCalsKp7h
 vyGCPHEpeVjro1Z2rKfKVhjoxyWoc3dc0THq6ef6zoDTQHPRnLp6NuEY+joc0DGG2883
 Xl/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=f3xxBQN9GcNCJ9e6uf5bBBGYH9g6FrgRxB8QSQG1ltM=;
 b=vw5Y/3VT51d5kUq8hJyloxOLB14OBOWEiN3KVxHO3demKlnwaYQwlYdmekryIMeA8d
 jlLjpPurwt1D9EUH8dvZdugP0zPPhdh/r8xIHohA+lBOTbkGcd8KNJHQtGE3XVqvRq3q
 TOqdCK3oyLtGhN7iXC4pGHYRZQLLxrvJnVx3nsh/4NLwFgPM3JPiwNpoannHojrQUY5c
 ORbMe16BFKq+8xPfUeW0CIB49zEVWPHtGB6gcS1IQbta6ySKbv2mwGQbiQ2Tj0b84keO
 uDKuZAZOml8EwaayHh3W8euR+2JyQern4n9omUOF9Ll7NRU/S+ohJzHG6JbeeES2acWv
 Ve/g==
X-Gm-Message-State: AO0yUKXnRZNscS2WlHnh7HjsWAkN25DCXBAdTx7z34roydvIDRs3ZJu1
 rOQ62hQ6HoOZAyZtLxkCZEGL6Q==
X-Google-Smtp-Source: AK7set8U2Ry1HtSgLn0WY6hwgGxr7TWJbIsrIz2CQ636s1Xdn8Db/T79i0b7QoNH6zIqxhr30v709g==
X-Received: by 2002:a17:902:f0d2:b0:199:535e:8d09 with SMTP id
 v18-20020a170902f0d200b00199535e8d09mr11526131pla.40.1676214429147; 
 Sun, 12 Feb 2023 07:07:09 -0800 (PST)
Received: from [192.168.101.227] (rrcs-74-87-59-234.west.biz.rr.com.
 [74.87.59.234]) by smtp.gmail.com with ESMTPSA id
 w8-20020a63af08000000b004f27761a9e7sm5675810pge.12.2023.02.12.07.07.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Feb 2023 07:07:08 -0800 (PST)
Message-ID: <91bd9c01-83db-0144-3ea3-044fed1643c9@linaro.org>
Date: Sun, 12 Feb 2023 05:07:00 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 8/9] bsd-user: implement sysctlbyname(2)
Content-Language: en-US
To: Kyle Evans <kevans@freebsd.org>
Cc: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org,
 Thomas Huth <thuth@redhat.com>, f4bug@amsat.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20230210231829.39476-1-imp@bsdimp.com>
 <20230210231829.39476-9-imp@bsdimp.com>
 <16b47168-39fe-ac65-741d-5786663a7a9d@linaro.org>
 <CACNAnaHx1LD=7ksd_pZ2sPqHj84y-384ZtMJbgcPFcEmy94NhA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CACNAnaHx1LD=7ksd_pZ2sPqHj84y-384ZtMJbgcPFcEmy94NhA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.348,
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

On 2/11/23 18:23, Kyle Evans wrote:
>>> +/*
>>> + * This syscall was created to make sysctlbyname(3) more efficient.
>>> + * Unfortunately, because we have to fake some sysctls, we can't do that.
>>
>> Can't do what?  Directly use sysctlbyname?
>>
> 
> How about:
> 
> /*
>   * This syscall was created to make sysctlbyname(3) more efficient, but
>   * we can't really provide it in bsd-user.  Notably, we must always translate
>   * the names independently since some sysctl values have to be faked
>   * for the target environment, so it still has to break down to two syscalls
>   * for the underlying implementation.
>   */

Better, thanks.


r~

