Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E3756C2E0B
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Mar 2023 10:38:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peYQk-00060p-U0; Tue, 21 Mar 2023 05:37:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1peYQi-00060U-Io
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 05:37:20 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1peYQg-0008WM-Pf
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 05:37:20 -0400
Received: by mail-ed1-x530.google.com with SMTP id ek18so57125352edb.6
 for <qemu-devel@nongnu.org>; Tue, 21 Mar 2023 02:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679391436;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+nVNNNXCepDeIvVC5VlRF3rmcNXYkGSiJTKo+4aa8JM=;
 b=XuRmO+pDsuVcP3xuc55J8P53T5ZY7vFd016RYDnF+kCG7SNOtfoBbjdGBXKIxjcNEn
 zmF4qicD8EAl4/9KiojIUPxkb4hfCVlYEPXy9lTQcVoRMwTGToDiPlYChmm9StmIiz8d
 w89zfVguqxJWmSJpMJb0cRX6iwICBVPBn/iP4bpDAg+0SJMiYGwcgkmzoN9TRYPeBHad
 RbBrdgbUfuLkSZ4EGiOEduX2iN5w1f5lZt7VAVVu5oNpXyvU+GjV91TjbQ/qHJ+iCN1G
 l2HDpgcAYEAFxk15AwjSKe1u3N8z76pQ/balFpmB6h4OEbMzxzp7RJqUs/q5gAHt76VC
 05Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679391436;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+nVNNNXCepDeIvVC5VlRF3rmcNXYkGSiJTKo+4aa8JM=;
 b=rktMq7GgCp8kFdECe0l7B41Ja4fyyyvIFexfCe2zaahmcBsJHeJMDojJUkT2aP20O2
 lPcuGXpu+Cn2zp0buKtjwwhCb66rgYWe761G9oVP9f6npd/kdQUOOGVjoLnjIRTlD8Cr
 OzkCekzB61pFQetKL+mH753bOpeBhvtk01L/mIdFUbowoFFmGzQxCQwHmWl9E/q8NQ5r
 IfnRKE1dYhDSkkdo1nWVPNMYYftE9U0qaVLVv1xPLf9tMs1wS0fZuK9yG9UUEo0vC38R
 91wHBIX8/rxmllIrXrKKqQTP1KoTkN4FGHM2S8jlY9eWzN5Xbo1lj8GsaURxPTlrC6kw
 k/kg==
X-Gm-Message-State: AO0yUKXmniFWbG13jFWI1bEAlgn34DZQsa7clDjgXfeZ0toaedt/xkE7
 EtASuk9EppXgcD+9HEjNmZ1J+w==
X-Google-Smtp-Source: AK7set9v4zOkRDJl0TAkdEVCfNe2vCieV4tSrrVsjNJxz7joFA6dB8h2wELuafbpYWE4g+nixBuMxQ==
X-Received: by 2002:a17:906:6992:b0:886:ec6e:4c1 with SMTP id
 i18-20020a170906699200b00886ec6e04c1mr2052329ejr.59.1679391436707; 
 Tue, 21 Mar 2023 02:37:16 -0700 (PDT)
Received: from [192.168.69.115] (did75-h03-176-184-22-219.dsl.sta.abo.bbox.fr.
 [176.184.22.219]) by smtp.gmail.com with ESMTPSA id
 sd24-20020a170906ce3800b00931024e96c5sm5624159ejb.99.2023.03.21.02.37.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Mar 2023 02:37:16 -0700 (PDT)
Message-ID: <a5224f2f-4a05-b575-d109-c7ffbef8ff6b@linaro.org>
Date: Tue, 21 Mar 2023 10:37:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PATCH for-8.0 2/3] target/s390x: Fix float_comp_to_cc() prototype
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>
References: <20230321083322.663561-1-clg@kaod.org>
 <20230321083322.663561-3-clg@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230321083322.663561-3-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x530.google.com
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

On 21/3/23 09:33, Cédric Le Goater wrote:
> From: Cédric Le Goater <clg@redhat.com>
> 
> GCC13 reports an error :
> 
> ../target/s390x/tcg/fpu_helper.c:123:5: error: conflicting types for ‘float_comp_to_cc’ due to enum/integer mismatch; have ‘int(CPUS390XState *, FloatRelation)’ {aka ‘int(struct CPUArchState *, FloatRelation)’} [-Werror=enum-int-mismatch]
> 
>    123 | int float_comp_to_cc(CPUS390XState *env, FloatRelation float_compare)
>        |     ^~~~~~~~~~~~~~~~
> In file included from ../target/s390x/tcg/fpu_helper.c:23:
> ../target/s390x/s390x-internal.h:302:5: note: previous declaration of ‘float_comp_to_cc’ with type ‘int(CPUS390XState *, int)’ {aka ‘int(struct CPUArchState *, int)’}
>    302 | int float_comp_to_cc(CPUS390XState *env, int float_compare);
>        |     ^~~~~~~~~~~~~~~~
> 
> Cc: Thomas Huth <thuth@redhat.com>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Ilya Leoshkevich <iii@linux.ibm.com>
> Fixes: 71bfd65c5f ("softfloat: Name compare relation enum")
> Signed-off-by: Cédric Le Goater <clg@redhat.com>
> ---
>   target/s390x/s390x-internal.h | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


