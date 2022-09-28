Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F003A5EE1E5
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 18:31:38 +0200 (CEST)
Received: from localhost ([::1]:43212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odZyD-0006Kq-Go
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 12:31:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1odZsQ-0000J5-Lh
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 12:25:38 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:35722)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1odZsO-0004st-Tk
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 12:25:38 -0400
Received: by mail-pg1-x535.google.com with SMTP id u69so12684267pgd.2
 for <qemu-devel@nongnu.org>; Wed, 28 Sep 2022 09:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=kVqJtmVBmc8Wxze+lxYQwwSyGzsY62s1YugOwDGwy3A=;
 b=J4Vdb1PtlqonoyzegYNSfoWMupZO7GTM8mXYY57NUsmKJMPSDWFLGGbr1VrBOkn5b8
 Vu+4soZfQrgpXuKqgOzDUojayquk5yhqVOi68ixyIP9xEMegjJlmpdRZHjDhUEvcYkkT
 PaWfTba/wHr19nEpecM3SiUo+xLq4qOpSsnjmPQ6SYhTKaGNsNWvqzEAVGK0Y4n+acYR
 XqtaeNpCcncYrRV0OvxL3lJoQpxgp/tvR6i24n645HB1fNlMONs7b5iqpPqn5WqLQnEJ
 9/iU9xQ+xBD8RVCSlow9YbkzrDm7eGsqo0YG0+nkr8K0tsrhz8nrlF1lX6vIYhd2F6Y8
 yPgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=kVqJtmVBmc8Wxze+lxYQwwSyGzsY62s1YugOwDGwy3A=;
 b=lHxg83zyGZggJhCNZgOvY+XsH+zFyPYnA+oGs428SFt0K9Hc8YBSiuinK/fjGwFeK1
 UkyMmJNlszcsW+VT92CTySCYoKEN+31TBicOcBB/2oG5tiW9XHpaQyXqk6t9SavQrEXb
 TjrWd9NnXCvfAVLMbVe7qbVZPMHJWv6SeZgqgdiW7tgVVjjHqFJNnymmlP4gp5pDFKi8
 HsMhHF7LWN9Hnq8by5/TVVVe0tozD48FgOagwXvfi8ykt0WAWMr+O6l114s9St3xT336
 ieJx1n1CsINCfVSSe6HRj7gRU5d5rQbJk/asGRtqCdNIkpNI1DEvU144XdGz0jjmVmhY
 IxcA==
X-Gm-Message-State: ACrzQf2cR6jxpClg2Crpyt4ugCyF+n3rVtfIttE6tKSpgCaCp7Ru+dSr
 lIWi9hdCPJoC2JqLcKrbVlGY5Q==
X-Google-Smtp-Source: AMsMyM75ZG7Ywu34GN07KMWikWxzydUC4KV/PPHIUgu+0tWphoy/g7nUqFq9/mERKwCcOMFpFE0j8Q==
X-Received: by 2002:a05:6a00:2446:b0:52b:e9a8:cb14 with SMTP id
 d6-20020a056a00244600b0052be9a8cb14mr35675552pfj.32.1664382335464; 
 Wed, 28 Sep 2022 09:25:35 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:986f:cb56:6709:4057?
 ([2602:47:d49d:ec01:986f:cb56:6709:4057])
 by smtp.gmail.com with ESMTPSA id
 q15-20020a170902f78f00b0016c9e5f291bsm3881067pln.111.2022.09.28.09.25.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Sep 2022 09:25:34 -0700 (PDT)
Message-ID: <afb177dc-ab07-5167-e559-5b5280150c46@linaro.org>
Date: Wed, 28 Sep 2022 09:25:32 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 4/5] configure, meson: move C++ compiler detection to
 meson.build
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: marcandre.lureau@redhat.com
References: <20220927095921.261760-1-pbonzini@redhat.com>
 <20220927095921.261760-5-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220927095921.261760-5-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.319,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/27/22 02:59, Paolo Bonzini wrote:
> The test is slightly weaker than before, because it does not
> call an extern "C" function from a C source file.  However,
> in practice what we seek to detect is ABI compatibility of the
> various sanitizer flags, and for that it is enough to compile
> anything with CC and link it with CXX.

Maybe just wait a moment on this one?
We have patches on list to remove the last use of C++.



r~

