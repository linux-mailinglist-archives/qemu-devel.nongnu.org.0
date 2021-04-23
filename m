Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F2543698A9
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 19:50:38 +0200 (CEST)
Received: from localhost ([::1]:48784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZzwr-0005LM-Ht
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 13:50:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lZzvf-0004kb-9M
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 13:49:23 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:41587)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lZzvb-0002NF-0j
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 13:49:23 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 y22-20020a17090a8b16b0290150ae1a6d2bso1695367pjn.0
 for <qemu-devel@nongnu.org>; Fri, 23 Apr 2021 10:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=vvJ3HCIrV21GInYL5XCzcMQccuE6GqW7StNTHuuAmpc=;
 b=vQYy34UHElNd56KW5OoByE3cVG/j+ZueO5UvfO5hljzi1WlHB5Hy4089zHwkmuSlxT
 zTgAiAzGM8L2ftG6dkGYMMSwu3lcTStFvJrUdQcQWRiP7mZcmBJGDMZc1VnHziNPLmhN
 7XPjPynjdqLDweb3HG1kMlxiE3LMAwr57eACexHIwAbVkOabJ1pFCrDm0QfRkQZPofWZ
 1SNvtEQMUKKsskG8ZAqqLvYG8AKYdkE5jyZSEoUMquzuQNL1EmabuXmCTs6o1Gsr0rmO
 ktSr+JvwaR4zftyUPr7Fj1mpXSrkXTnp9c5d512/6CrP/7SjxKUmcu9vu2nwFLf+TdXt
 hcSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vvJ3HCIrV21GInYL5XCzcMQccuE6GqW7StNTHuuAmpc=;
 b=Fn7rjL0hHeUGqYZpWnIil2CwV/K0QXgT2yN879IGHRzlgX9oj2GR/M4SI4LWA3zAjM
 bZeqwpHJVkBTGlpBaadmvwkFeYsvv1JRCXETgqYHhEHp10Yr0PKZEL+JN//+zP/MKIqy
 m3CgaSiiX0cPQUpM8z/OddEue1bLbytcJq0VST5VW2EdVwQmXBGNK7uUnEUXhNM89XgM
 YwjjjFb6ggkgJygOplWnpupBT1FL7o+SBxIrsKzHgGmz0+nov/R9H3Vlnip3b9d7p8Kk
 PlFU78ZcoBlDQcAyOdd3JquBkH0DxW+04pPdVbvYW9S/cHkBz7C5jCWKKvEvDeL0qz8e
 PLzQ==
X-Gm-Message-State: AOAM531KngtMr/PoMoRKUFxPTIpFGDjEttVAYN1R86CB4fMMWsiYcuhf
 HoAJhe9Jfcd3xq6RsT4zrvd9pA==
X-Google-Smtp-Source: ABdhPJzHD42wIDLQHdQ0A7fdhnRxQblc6AMrB0bPR87kxOqyQWGp0f8icypMW30sfiZ9KC0dipADVg==
X-Received: by 2002:a17:902:fe8c:b029:ec:a2ef:4e3f with SMTP id
 x12-20020a170902fe8cb02900eca2ef4e3fmr4776715plm.36.1619200157443; 
 Fri, 23 Apr 2021 10:49:17 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id l21sm4897351pfc.114.2021.04.23.10.49.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Apr 2021 10:49:17 -0700 (PDT)
Subject: Re: [PATCH v5 2/4] target/arm: Make sure that commpage's tb->size != 0
To: Ilya Leoshkevich <iii@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Max Filippov <jcmvbkbc@gmail.com>
References: <20210416154939.32404-1-iii@linux.ibm.com>
 <20210416154939.32404-3-iii@linux.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e8f40a9d-6404-e87b-856b-d15e460025ec@linaro.org>
Date: Fri, 23 Apr 2021 10:49:15 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210416154939.32404-3-iii@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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
Cc: Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/16/21 8:49 AM, Ilya Leoshkevich wrote:
> tb_gen_code() assumes that tb->size must never be zero, otherwise it
> may produce spurious exceptions. For ARM this may happen when creating
> a translation block for the commpage.
> 
> Fix by pretending that commpage translation blocks have at least one
> instruction.
> 
> Signed-off-by: Ilya Leoshkevich<iii@linux.ibm.com>
> ---
>   target/arm/translate.c | 2 ++
>   1 file changed, 2 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

