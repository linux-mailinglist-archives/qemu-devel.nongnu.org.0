Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85262452D81
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 10:03:40 +0100 (CET)
Received: from localhost ([::1]:57354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmuNP-0008Bw-DB
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 04:03:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mmuMU-0007MS-6D
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 04:02:42 -0500
Received: from [2a00:1450:4864:20::32e] (port=42513
 helo=mail-wm1-x32e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mmuMS-0005yi-9q
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 04:02:41 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 d72-20020a1c1d4b000000b00331140f3dc8so1797869wmd.1
 for <qemu-devel@nongnu.org>; Tue, 16 Nov 2021 01:02:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=de2aOMuZV18D3Rjk+Wy7CAs3yPedh+sJo73bnlCoe6U=;
 b=Xm/VethmhwnPRHDwQ5FY2ty/YHfRH5ru8Wxrx5h+6iNlVpZAjSf9sIt5WmIUKkzMTo
 kIjxGZOvZNCXgaTZmOicQ1/ao1gUTFO6uNiCWrz2+ag+H6w2d/+GGqtsEtV9ZLWBBzMW
 8rVcGne8/UV3TDJLxVA0PwI4uDuFJeoFF5YePy89Km4rdS+fVpXH/qNw7Mj4/Ngfwaw2
 BOdv6gFaXjpzEPtMqBySVvQ8KTnTh3+VTRc2WvN2QWgd2ZDIflPdtIJb42UZjqeeloZJ
 +t+7oLsBoCuslSHdSuqatjCPw7oQ6+mgz9rFS181VmCJ74vTAclxZwM5b6HQFJAorUf6
 p18Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=de2aOMuZV18D3Rjk+Wy7CAs3yPedh+sJo73bnlCoe6U=;
 b=uGSZvFj9ThaxqSAZwFtAHswduDIzts7bD1iWagZ61ogEaKkg6J+Q8yeBg93qaN+FZD
 r++RbX4bme7OdL8dfeotAvZKV42cmwQJJycqHtppRwxmOGpyLwlV3nkk151oKpeKlUP/
 k+wN35afAlkv1YZDPNsyIV2vH9aPu9XGg6Qd9YwfehRhePnZac9GMff7yxj/SnKyhUI0
 rcOWFLthV5gUqWd4bdaCxcLpH9+zq61/VWmEibywKYvSd85+ZnvqFTK3oNBIaTq8vvoY
 MGHCPQ78OuW7i5f65cH55/t3yfUDYx2+N2zewW8oiHuFXwyngiH88qhlqod5yYU6+OZs
 g6OA==
X-Gm-Message-State: AOAM5309gJp0ruf+ivThgIZOEZZFY1PjAE8iG2TYJAeWKMYN5hKP/BOg
 NnGAqjiOjI1pgllyxl67PzgLLA==
X-Google-Smtp-Source: ABdhPJwrG0RL/e7v3VXH4Q7TSVUFW1W57cM143Y+LdY1/A/ojeh0SeLz5H3/6oglAi6nhJzCD0gEwg==
X-Received: by 2002:a05:600c:21cd:: with SMTP id
 x13mr68576288wmj.52.1637053358899; 
 Tue, 16 Nov 2021 01:02:38 -0800 (PST)
Received: from [192.168.8.105] (145.red-37-158-173.dynamicip.rima-tde.net.
 [37.158.173.145])
 by smtp.gmail.com with ESMTPSA id f7sm19191700wri.74.2021.11.16.01.02.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Nov 2021 01:02:38 -0800 (PST)
Subject: Re: [PATCH v1 1/6] tests/docker: force NOUSER=1 for base images
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20211115142915.3797652-1-alex.bennee@linaro.org>
 <20211115142915.3797652-2-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <556a34aa-5473-c285-f35c-24de789d2f8d@linaro.org>
Date: Tue, 16 Nov 2021 10:02:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211115142915.3797652-2-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.446,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 f4bug@amsat.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/15/21 3:29 PM, Alex Bennée wrote:
> As base images are often used to build further images like toolchains
> ensure we don't add the local user by accident. The local user should
> only exist on local images and not anything that gets pushed up to the
> public registry.
> 
> Reported-by: Richard Henderson<richard.henderson@linaro.org>
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> Message-Id:<20211103171339.721910-1-alex.bennee@linaro.org>
> ---
>   tests/docker/Makefile.include | 3 +++
>   1 file changed, 3 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

