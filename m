Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8655525DCC
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 10:49:52 +0200 (CEST)
Received: from localhost ([::1]:55404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npQzf-0008C9-Qy
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 04:49:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1npQro-00018y-KY; Fri, 13 May 2022 04:41:44 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:33409)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1npQrm-0003gE-TK; Fri, 13 May 2022 04:41:44 -0400
Received: by mail-ej1-x634.google.com with SMTP id gh6so14950556ejb.0;
 Fri, 13 May 2022 01:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=xHBhBF8qv6TA6Tk9ReeG9TZibSmBpeo/4yMLXUYEBKA=;
 b=SNrzKWTIWF0ibrvkgVC2RnFqCCs+HOmJjyNhvgWAphMDU3WF11VBKff/Qb2usSGyIT
 AWoQznHUx6HmW2C60EvW0bG2XS8Rc641BIqUW44CPRJCNA2Dg/WMZczVnGXRgH+Zw38A
 QM1Hnly2kWzMOSd0LnoJEOW/qZrAOV8qxllX6VFU5EsZyZmijO5NVNKbvvNoe1VLS0R+
 dQWf2/zkqfJAgCjEcL1Q9dDHzjozkVpn9WhiVKFi9QFN6nqTuWn5aNs6G/yXNznf8f5X
 QnsvsMfSCw0GyAoqjUERkkMpGMVnWUPlXYRc6HXY4yzqCV70A7p/YPP4JoDsVwGutPxp
 YWww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=xHBhBF8qv6TA6Tk9ReeG9TZibSmBpeo/4yMLXUYEBKA=;
 b=gNksMxC2/awXJR5SJ3p0Yz/xn9cMXArxBWYtDfEIxFR1DDhVvufAv+QWixtn3FfLEN
 0BaKz7QgQQ/r1uqxp3bYf82pqI/Dz3wFcwhF9PUBRSzc9yLxbzSj88umfAJwg8NUHQD+
 4Wr82TsvKr1zGQH/VIutlXWZ+NWI1cak6W/nFzq0AjZsm+QHDqjxPClr3HkzznDudJzh
 kAqAGmR53Crq4aMkvMw7qC234A6Mogcs+VC/lXUu2lCkSi2zIrK8ZL08sjw30qAcypZ/
 yuWbk0Dh5lHJHNa1hjHWAK7R44yUVSSfqdQS9l6+kROt8lGt/dD5kv04XXt7YlwX43Es
 YGpg==
X-Gm-Message-State: AOAM532jEFsi0mbN5DUSaOfwXIvBNK8f6tP/vWmBOKG+G1Dd3e/vYpU3
 Pf/mZvehk98khflquOun7iM=
X-Google-Smtp-Source: ABdhPJw/dwgX7Dhf+e8v1L4EwxqJBHQ8oTzmpJ1SpBHuR1ExK8CKmDV4YO3egYXhe/8vwrYub4A4iw==
X-Received: by 2002:a17:906:a5b:b0:6f4:55f6:78af with SMTP id
 x27-20020a1709060a5b00b006f455f678afmr3306875ejf.238.1652431300975; 
 Fri, 13 May 2022 01:41:40 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 k2-20020aa7d8c2000000b0042617ba63d4sm646150eds.94.2022.05.13.01.41.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 May 2022 01:41:40 -0700 (PDT)
Message-ID: <112d526a-6f43-5ed7-8beb-21dad37f6ec5@redhat.com>
Date: Fri, 13 May 2022 10:41:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [RFC PATCH 7/9] tests: add check-venv to build-tcg-disabled CI
 recipe
Content-Language: en-US
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Hanna Reitz <hreitz@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Daniel Berrange <berrange@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20220513000609.197906-1-jsnow@redhat.com>
 <20220513000609.197906-8-jsnow@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220513000609.197906-8-jsnow@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x634.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/13/22 02:06, John Snow wrote:
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   .gitlab-ci.d/buildtest.yml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
> index 0aea7ab84c2..5c6201847f1 100644
> --- a/.gitlab-ci.d/buildtest.yml
> +++ b/.gitlab-ci.d/buildtest.yml
> @@ -245,6 +245,7 @@ build-tcg-disabled:
>       - make -j"$JOBS"
>       - make check-unit
>       - make check-qapi-schema
> +    - make check-venv
>       - cd tests/qemu-iotests/
>       - ./check -raw 001 002 003 004 005 008 009 010 011 012 021 025 032 033 048
>               052 063 077 086 101 104 106 113 148 150 151 152 157 159 160 163

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

(unless you add it to "all").

Paolo

