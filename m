Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C0A56B861
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jul 2022 13:24:52 +0200 (CEST)
Received: from localhost ([::1]:42946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9m6N-0003lM-8M
	for lists+qemu-devel@lfdr.de; Fri, 08 Jul 2022 07:24:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1o9lxc-0003N2-M5
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 07:15:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30258)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1o9lxb-0003mn-0L
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 07:15:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657278946;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9M4fHzFks6tniK5V+FjbHKTX9kV74WvmeG5iGnP1nT8=;
 b=Vj8h91Zh3IXcIOpe+Pg3cTv07ePwldYCbtg52X7ohPV6trImTPzqO3kEaxCoGAoF3mItxl
 M5m34tsVSag2nLJGbDf9Ey/J+xUDqX0cKAJontdWg44+HsbcI3P408IkFlXRIl5EjGBiJ8
 ObOEWBuL89c3OoEU+lWLlUq+Cu2QQis=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-651-rU9swZJuPD-zxFFaNg23MA-1; Fri, 08 Jul 2022 07:15:45 -0400
X-MC-Unique: rU9swZJuPD-zxFFaNg23MA-1
Received: by mail-wm1-f72.google.com with SMTP id
 a6-20020a05600c348600b003a2d72b7a15so846391wmq.9
 for <qemu-devel@nongnu.org>; Fri, 08 Jul 2022 04:15:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=9M4fHzFks6tniK5V+FjbHKTX9kV74WvmeG5iGnP1nT8=;
 b=MlNy0pPtwB4gtc/kcAXNxh5X3kx276OJYYK0Mp9PEM38Ax5Ve3JXDFMd0uRmDE0D6v
 E/wIvqy81VBmuvMhfvEsgHQO6A4LBELEmj5nWcYzBfRbzgHfBW6YyycoxiposjeHvMUU
 ed4RG50+iotGH0xnr4gV+HH2CXsJT2JDx+kRgsnBs72nAIt0IO3WY8hUP7xHKOsTt4f6
 2DC738CPJkgfOZfdwnUl/cL2dYlUsH9qmtz1cx0prz3gOfDm6zRYQIcZ2bPEJnWWu+wp
 +5aH1fzn5P4WuuB25IiD3P+08h7niAzBAhwc75SNLyYBbPGOlZ1CPkcvKEVwVqUB+r0H
 KDEQ==
X-Gm-Message-State: AJIora9j4eXzrSL7Vy2EuJALwA6yplSUXaDIzMAMa1HSWPWORWG3EXJl
 lob81klvSgm+vfKLGIpO2fVB59csa78pycvgZJgJLkuqs0UxNmIPTnaoEvRMNlQU/UJsjG7faPK
 SnOkl/7XBpTimkdU=
X-Received: by 2002:a05:6000:1d98:b0:21b:aead:9b6c with SMTP id
 bk24-20020a0560001d9800b0021baead9b6cmr2737952wrb.531.1657278943962; 
 Fri, 08 Jul 2022 04:15:43 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tCWvtInivnHaQgKe5DHOzU/GfbUHt0vTE4GBIOL25q1BRnI6dnQSXn+Sr5SPuEW3V6r4aXhw==
X-Received: by 2002:a05:6000:1d98:b0:21b:aead:9b6c with SMTP id
 bk24-20020a0560001d9800b0021baead9b6cmr2737923wrb.531.1657278943639; 
 Fri, 08 Jul 2022 04:15:43 -0700 (PDT)
Received: from ?IPV6:2003:cb:c702:6300:c44f:789a:59b5:91e9?
 (p200300cbc7026300c44f789a59b591e9.dip0.t-ipconnect.de.
 [2003:cb:c702:6300:c44f:789a:59b5:91e9])
 by smtp.gmail.com with ESMTPSA id
 j10-20020a5d448a000000b0021d888e1132sm3453666wrq.43.2022.07.08.04.15.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Jul 2022 04:15:43 -0700 (PDT)
Message-ID: <72f30c55-9f5f-0372-abf1-fde90f16de81@redhat.com>
Date: Fri, 8 Jul 2022 13:15:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 4/4] target/s390x: Exit tb after executing ex_value
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: svens@linux.ibm.com, qemu-s390x@nongnu.org
References: <20220702060228.420454-1-richard.henderson@linaro.org>
 <20220702060228.420454-5-richard.henderson@linaro.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220702060228.420454-5-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 02.07.22 08:02, Richard Henderson wrote:
> When EXECUTE sets ex_value to interrupt the constructed instruction,
> we implicitly disable interrupts so that the value is not corrupted.
> Exit to the main loop after execution, so that we re-evaluate any
> pending interrupts.
> 
> Reported-by: Sven Schnelle <svens@linux.ibm.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/s390x/tcg/translate.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
> index eac59c3dd1..e2ee005671 100644
> --- a/target/s390x/tcg/translate.c
> +++ b/target/s390x/tcg/translate.c
> @@ -6593,7 +6593,7 @@ static void s390x_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
>  
>      dc->cc_op = CC_OP_DYNAMIC;
>      dc->ex_value = dc->base.tb->cs_base;
> -    dc->exit_to_mainloop = (dc->base.tb->flags & FLAG_MASK_PER);
> +    dc->exit_to_mainloop = (dc->base.tb->flags & FLAG_MASK_PER) || dc->ex_value;
>  }
>  
>  static void s390x_tr_tb_start(DisasContextBase *db, CPUState *cs)

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


