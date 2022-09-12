Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51B845B5994
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Sep 2022 13:46:39 +0200 (CEST)
Received: from localhost ([::1]:56788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXhte-0003ze-Du
	for lists+qemu-devel@lfdr.de; Mon, 12 Sep 2022 07:46:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oXhTh-0006r8-2G
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 07:19:49 -0400
Received: from mail-oa1-x2e.google.com ([2001:4860:4864:20::2e]:37690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oXhTe-00007s-EX
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 07:19:47 -0400
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-127f5411b9cso22434091fac.4
 for <qemu-devel@nongnu.org>; Mon, 12 Sep 2022 04:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=xhb87wjKC6GAI69kIHQs1AKY57Ynp9KtnS3mubExrbg=;
 b=FrdEvi1pHix113S6tztiqY1YjPeXZj7/0S9rz+wCPbB7nHCYvAZaOBp+Worr5A94Pf
 CwF+BFPbRugB6u2dbAvDxIbpOKgQH62sReksE5GVSio5Dw9nZ7Fi8GzdkQSYgQVIaeiA
 JLPYM/spNV44ZlE5IKDbLt534ANlUC2tlq1bxLNcOs+apN5KLUcjtj0rH0ME3c68rMir
 BB2XSkmaDOrokgwV2CTM3VUG7ufy5rBPcvlqdknSXUj7buGFnJgSRVx0URzD3yM75lIt
 qC5omuhqyWEr4ev+1UQx0R5hIQorV1j5lFfpAC5ALq8lx2OP0mWEa1SDMsYfb1sY/KSu
 gwfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=xhb87wjKC6GAI69kIHQs1AKY57Ynp9KtnS3mubExrbg=;
 b=iHvG10oCSM4QLUouJ7VeJflTyzFjUBSV6to+VgbbgED+v/33XNnzAtsLnO6BMDb85q
 wdTKPJuqrfG/Vl5wE0H7bUaWe/uMHBdJRDW5TlgCid6ZPCV1kE9aIXBtI1fl6Sm6sP72
 15EWFneu01ei048mO7YtMvetZQsCMuuEHXvsjkVE0LXmS2S1fz+kx3/Uk2SjxdpwM4zQ
 1yDDFXYBuer9rXFccW82XzZyvSM0vkOSPlUQh8W81huClYgz/Jw8fEK00mNAGclJfBEp
 uS0sp1gXlE0lcT1RAKKrlLoXQ8lL0cBuzA720uCGa45KUhGGxB+MneBn1yTYhSvUcvZn
 O31A==
X-Gm-Message-State: ACgBeo3MnaZ5opLJa7PnYUVO4LCIYdn4USwrLgYHb6n2Tm4Gbtuazv9B
 AszllRyaiA5pNs02XJM+Tr/5nkshJKVup8U2
X-Google-Smtp-Source: AA6agR5BiiHE6pwRXLJjbY3R/h65Onhuq0AxkebDwnE3yAHeJGyrlhJ3OqhYvXZUdGqjeKINn3KVyg==
X-Received: by 2002:a05:6808:140e:b0:344:d2fb:43fe with SMTP id
 w14-20020a056808140e00b00344d2fb43femr8679610oiv.112.1662981585221; 
 Mon, 12 Sep 2022 04:19:45 -0700 (PDT)
Received: from [192.168.44.231] ([172.102.14.47])
 by smtp.gmail.com with ESMTPSA id
 v4-20020a9d4e84000000b00636956b3080sm4543949otk.43.2022.09.12.04.19.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Sep 2022 04:19:44 -0700 (PDT)
Message-ID: <476909f9-5b62-9d57-5cf2-631ad08fcad2@linaro.org>
Date: Mon, 12 Sep 2022 12:19:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 19/37] target/i386: Introduce 256-bit vector helpers
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20220911230418.340941-1-pbonzini@redhat.com>
 <20220911230418.340941-20-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220911230418.340941-20-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::2e;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2e.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.153,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/12/22 00:03, Paolo Bonzini wrote:
> The new implementation of SSE will cover AVX from the get go, because
> all the work for the helper functions is already done.  We just need to
> build them.
> 
> Signed-off-by: Paolo Bonzini<pbonzini@redhat.com>
> ---
>   target/i386/helper.h         | 2 ++
>   target/i386/ops_sse.h        | 5 +++++
>   target/i386/ops_sse_header.h | 4 ++++
>   target/i386/tcg/fpu_helper.c | 3 +++
>   4 files changed, 14 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

