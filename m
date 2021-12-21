Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E7DD47C843
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 21:34:21 +0100 (CET)
Received: from localhost ([::1]:55526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzlq0-0003JP-DC
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 15:34:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzloJ-0001H3-QC
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 15:32:35 -0500
Received: from [2607:f8b0:4864:20::435] (port=43786
 helo=mail-pf1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzloI-0002zH-3f
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 15:32:35 -0500
Received: by mail-pf1-x435.google.com with SMTP id 196so286823pfw.10
 for <qemu-devel@nongnu.org>; Tue, 21 Dec 2021 12:32:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Qce8gPQnlFbWC7LdvbrepzT3u8gHt3l39EUNkqUkfDI=;
 b=BP9SzbJPJ1rpy2Sn/1rYRVmRERwip4BYEal1+YHok1usDB3p1QPw0uB82DzGrOi3uT
 AsnGULN/zxg4nxl/T0hdCf6YrG8QIFnOTbzNc8Vvfmkg4ZjKFXE69V3vI1Jx//CMBpsa
 sqx8ngFKsPEVY0cyOdKNr4fyDIcgQfiFUUglSe2hcFHLxtM8SXAH4U628RZhqhGjxlaF
 ru7ZQBsO4XMaqsTunkS2j74WXCwXVV+q695YrspaWfNDFj9a5I9HFs5AdVnuhY4wjM+F
 ejuTnj9DNOKJATer1ZB12RgzqGp/p2fDrHBuxE60RBqeQ8DrCoL2mxYLXzlWWuHlGfiM
 eq/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Qce8gPQnlFbWC7LdvbrepzT3u8gHt3l39EUNkqUkfDI=;
 b=7i4S6HgYgizxcsC0rfVNjBhisjQ9RWxDQPBY85aVwuq97M7gp3+AWI98+9CZ0oKzFH
 9agie34jZ2u7zsfgA8Z5JOcLzpqjlKPNxo+s3Dncz8ZOSpNa4chicZDeeIuRgdCWD3yf
 0r1sVnPweq96tjpVbA7j1QcbckBM8snqYpk9kDVdSwxinYXlyN8QhT5Quc5edIrCVE3p
 gIYTr/Q5OOp5+gpjpl8jyJ9oVNn7Ua8iFG3FhAizBiTId+K11jan9kzwL/Y1GBPSxMca
 EJGxqjwak/KiIue0UH/MI4pkZuM9/QjGeSfG2ubNU7dqMYq1d0lyAeKS7xKbUEJNrNtd
 x5RA==
X-Gm-Message-State: AOAM531NP+5ck5FPBKuoHjhZa9LFe+iEAagujlhP/Jn07hHKz43olZBP
 l4m5XQuxPfMcRlcmq1AW0zGi4d65/Vh9Tg==
X-Google-Smtp-Source: ABdhPJx3Y5xxiLO526Ubkb597wqxmy8ouPIgKfsHo9oXGA3YFT/lo4l9Y/+isZs3miArJZgntEv/7g==
X-Received: by 2002:a05:6a00:1311:b0:4ba:1288:67dc with SMTP id
 j17-20020a056a00131100b004ba128867dcmr4930382pfu.43.1640118752925; 
 Tue, 21 Dec 2021 12:32:32 -0800 (PST)
Received: from [192.168.4.112] ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id t4sm23224468pfj.168.2021.12.21.12.32.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Dec 2021 12:32:32 -0800 (PST)
Subject: Re: [PATCH 2/3] user: move common-user includes to a subdirectory of
 {bsd,linux}-user/
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20211221163300.453146-1-pbonzini@redhat.com>
 <20211221163300.453146-3-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <23cf60a2-0ac0-90ec-fbc1-4b396e50f708@linaro.org>
Date: Tue, 21 Dec 2021 12:32:30 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211221163300.453146-3-pbonzini@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::435
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.012,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: lvivier@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/21/21 8:32 AM, Paolo Bonzini wrote:
> Avoid polluting the compilation of common-user/ with local include files;
> making an include file available to common-user/ should be a deliberate
> decision in order to keep a clear interface that can be used by both
> bsd-user/ and linux-user/.
> 
> Signed-off-by: Paolo Bonzini<pbonzini@redhat.com>
> ---
>   bsd-user/{ => include}/special-errno.h              | 0
>   bsd-user/meson.build                                | 2 +-
>   linux-user/{ => include}/host/aarch64/host-signal.h | 0
>   linux-user/{ => include}/host/alpha/host-signal.h   | 0
>   linux-user/{ => include}/host/arm/host-signal.h     | 0
>   linux-user/{ => include}/host/i386/host-signal.h    | 0
>   linux-user/{ => include}/host/mips/host-signal.h    | 0
>   linux-user/{ => include}/host/ppc/host-signal.h     | 0
>   linux-user/{ => include}/host/ppc64/host-signal.h   | 0
>   linux-user/{ => include}/host/riscv/host-signal.h   | 0
>   linux-user/{ => include}/host/s390/host-signal.h    | 0
>   linux-user/{ => include}/host/s390x/host-signal.h   | 0
>   linux-user/{ => include}/host/sparc/host-signal.h   | 0
>   linux-user/{ => include}/host/sparc64/host-signal.h | 0
>   linux-user/{ => include}/host/x32/host-signal.h     | 0
>   linux-user/{ => include}/host/x86_64/host-signal.h  | 0
>   linux-user/{ => include}/special-errno.h            | 0
>   linux-user/meson.build                              | 4 ++--
>   18 files changed, 3 insertions(+), 3 deletions(-)
>   rename bsd-user/{ => include}/special-errno.h (100%)
>   rename linux-user/{ => include}/host/aarch64/host-signal.h (100%)
>   rename linux-user/{ => include}/host/alpha/host-signal.h (100%)
>   rename linux-user/{ => include}/host/arm/host-signal.h (100%)
>   rename linux-user/{ => include}/host/i386/host-signal.h (100%)
>   rename linux-user/{ => include}/host/mips/host-signal.h (100%)
>   rename linux-user/{ => include}/host/ppc/host-signal.h (100%)
>   rename linux-user/{ => include}/host/ppc64/host-signal.h (100%)
>   rename linux-user/{ => include}/host/riscv/host-signal.h (100%)
>   rename linux-user/{ => include}/host/s390/host-signal.h (100%)
>   rename linux-user/{ => include}/host/s390x/host-signal.h (100%)
>   rename linux-user/{ => include}/host/sparc/host-signal.h (100%)
>   rename linux-user/{ => include}/host/sparc64/host-signal.h (100%)
>   rename linux-user/{ => include}/host/x32/host-signal.h (100%)
>   rename linux-user/{ => include}/host/x86_64/host-signal.h (100%)
>   rename linux-user/{ => include}/special-errno.h (100%)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

