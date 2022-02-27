Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F8CC4C5E45
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Feb 2022 19:47:54 +0100 (CET)
Received: from localhost ([::1]:49506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOOaG-0004hQ-8U
	for lists+qemu-devel@lfdr.de; Sun, 27 Feb 2022 13:47:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nOOPz-0000qD-TL
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 13:37:17 -0500
Received: from [2607:f8b0:4864:20::1032] (port=40736
 helo=mail-pj1-x1032.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nOOPi-0006Tl-0E
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 13:37:13 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 em10-20020a17090b014a00b001bc3071f921so12853774pjb.5
 for <qemu-devel@nongnu.org>; Sun, 27 Feb 2022 10:36:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=NczRF4VNTPD3sCmPDUQfKh3lDZ9pFF2yTB+Vi8uGxDU=;
 b=JupTsjrD97OetvD7S3hZryKXqTcrsyr8P0675gPsmk5FKDWEV9/vZxNOQ/7stihk2D
 7qWcN0u4eDbrHPLwy55o5c7Xx/a9iWw3gIlOIQgJs4+d9or7+RL/T2mefYI3PELXFWzm
 BhIAO3O2wplJGG0QCPjpdQptKfAJU2kWpureDCvwZfYdS5IwiJKKtt53va5M/YYOiLwD
 pvuRhn/r5WCKzFhGfy6KUwKW+LHhbiVyn1ZpY38kxEz4JY2DLare0W7lscCLCM/2Z6Gj
 6/k+sa8ebgsTOzfve8p3VlKBLlByOYuJUhkeADNF7YMApFiPnC0C+vZx4KSqyvzbjYUx
 YZQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=NczRF4VNTPD3sCmPDUQfKh3lDZ9pFF2yTB+Vi8uGxDU=;
 b=T7I9UwPJyLP1i70oJcRTQs4D1BkO2+HgfY94GD3RjhVIyv6XOIH7pLuj2cwwdQoNHk
 QEd+XmTam4ITInz+365rHySWJjJRCFFKihllS01cXvEtIzaoPG1AZwVhMpDJvplSAzbn
 aco9o7BWD227jMfT2y+hNwESegdrSbUE874GAtHjWxenJ8HMoNn2QQPgPM15hv33UNlY
 xJHy9GdF17l1JVycCgcznjtbNyNmfTFcYekQqklmDfSS8Luaq2AjGkM2EO+f10Q+NfdX
 MkbGgWkiq+Y3TTr/haVvwtvZVFAQjcuBq2er2V3X5UBBMzRhu5nS47N/WHSacgeNj+lW
 GOpA==
X-Gm-Message-State: AOAM530a6qAM+QqMOM6it8RXvdWrGNdqQqlQX1O0fQ6gY/8VC8mEz4KO
 blwSbnAdT6xw3v5fCtD6btv0cQ==
X-Google-Smtp-Source: ABdhPJyDyMcHPEqDQng5fb1BG2mCerKx2bGeoxII+IVpm9I/AxE3qow5EpE84U/LP7Md4qnEfQM+Ng==
X-Received: by 2002:a17:902:b189:b0:14d:6f87:7c25 with SMTP id
 s9-20020a170902b18900b0014d6f877c25mr17454697plr.31.1645987015912; 
 Sun, 27 Feb 2022 10:36:55 -0800 (PST)
Received: from ?IPV6:2603:800c:1201:c600:23be:43d9:7006:705a?
 (2603-800c-1201-c600-23be-43d9-7006-705a.res6.spectrum.com.
 [2603:800c:1201:c600:23be:43d9:7006:705a])
 by smtp.gmail.com with ESMTPSA id
 s7-20020a056a00178700b004e1a15e7928sm11099708pfg.145.2022.02.27.10.36.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Feb 2022 10:36:55 -0800 (PST)
Message-ID: <91cc02c4-8ea5-23e7-7384-6c6b2c8e12b5@linaro.org>
Date: Sun, 27 Feb 2022 08:36:50 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 4/9] util/oslib-win32: Return NULL on qemu_try_memalign()
 with zero size
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
References: <20220226180723.1706285-1-peter.maydell@linaro.org>
 <20220226180723.1706285-5-peter.maydell@linaro.org>
 <71304530-f1d7-13a9-c80e-f41a68a344c8@linaro.org>
 <CAFEAcA8J+pYScRp3KJAb0iLuS65nYVDYkiWPARAT5Ot9299VqA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA8J+pYScRp3KJAb0iLuS65nYVDYkiWPARAT5Ot9299VqA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1032
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/27/22 02:54, Peter Maydell wrote:
>>> +    if (size) {
>>> +        ptr = _aligned_malloc(size, alignment);
>>> +    } else {
>>> +        ptr = NULL;
>>> +    }
>>
>> Oh, should we set errno to something here?
>> Otherwise a random value will be used by qemu_memalign.
> 
> Yeah, I guess so, though the errno to use isn't obvious. Maybe EINVAL?
> 
> The alternative would be to try to audit all the callsites to
> confirm they don't ever try to allocate 0 bytes and then have
> the assert for both Windows and POSIX versions...

Alternately, force size == 1, so that we always get a non-NULL value that can be freed. 
That's a change on the POSIX side as well, of course.


r~


