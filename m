Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5935E8FAF
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Sep 2022 22:34:06 +0200 (CEST)
Received: from localhost ([::1]:44604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocBqe-0006PT-Nf
	for lists+qemu-devel@lfdr.de; Sat, 24 Sep 2022 16:34:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ocBo9-0004Li-Ev
 for qemu-devel@nongnu.org; Sat, 24 Sep 2022 16:31:29 -0400
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732]:35616)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ocBo8-0003V5-0G
 for qemu-devel@nongnu.org; Sat, 24 Sep 2022 16:31:29 -0400
Received: by mail-qk1-x732.google.com with SMTP id u28so2078906qku.2
 for <qemu-devel@nongnu.org>; Sat, 24 Sep 2022 13:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=WuS5zzpqrxVN5w5hBro+GfNvAG/FZRPXtoQtqXXwVk4=;
 b=xKltF00wkvLIKrODwT9Wv6HKlz2p0iGj3/2wKpa26LHj1AispdtYKU2Rk4QdUXmegK
 BTOmgTRfxSUaBsROZteEF2K3852NbysCEHbuUdmIVOaAqHLCvjHHXaaCuP6QSFVkQNnw
 f/vr7FBjb3wCpqJoe5MRldzkIkfgGx3rs/ly1jRh0MsBW/zH4Dl+66hSLw6x3wunLC6F
 DX51KpbJzEQcUa5051SKuYryJ0WspybVKuvJHh2ob5KYGOhxIfwGNpNv3vS2+Qp3gt+4
 M9v/wdZ8Dlfnc4gaMV7ck6bfGs/cY9nXnCsfW+lOUOSAbGRiv+boeLZU6m6akoaymw9i
 pr0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=WuS5zzpqrxVN5w5hBro+GfNvAG/FZRPXtoQtqXXwVk4=;
 b=qTk00X7s63e/1cBMkzw0uU1HpN4K59cfTyUPhRZQ3XVNW8AwMorppeWRkU9ZWN/HjE
 aOJM9kNIEIXXmrIK7f0YhuScobsCyLHQy0/cW1OWe0nER2hiVq2T+S8gfwTVg20GQ1Dj
 q67X42ZstlsHoIdKULw3TY7yBAJ9b08Qfkwt6GAJwj62WlvXdtXBGkkX3b0xy61nTPTN
 O2l6Zt81i2EBBzw56DYGvDWvOSZQt06/PWGDU+4gIGHxDLlgNRXxaI0V0mgSlPzGslRC
 NP3S7ufYaO4DbhhBzxvOjp2xmeimmLnzx0kwMqPXAxaBMQygB3IhihxRr3qQpwwGiwL7
 CLJQ==
X-Gm-Message-State: ACrzQf17qLdb1EeSJmiyDqEmpf7ofBUF93G1YtBJz14Y4V4zacWMIIZJ
 Yj0/Do5VzmX8xpqufRNYbc3Gkg==
X-Google-Smtp-Source: AMsMyM4dzwIBtg6DkVuEBQWe+658EE9z0nM0EAwECQkuHFK8L41D4BWx6fTt2cG/oUrkClhhuGKF9w==
X-Received: by 2002:a37:348:0:b0:6cf:f30:9f0b with SMTP id
 69-20020a370348000000b006cf0f309f0bmr9999753qkd.735.1664051487004; 
 Sat, 24 Sep 2022 13:31:27 -0700 (PDT)
Received: from ?IPV6:2605:ef80:80b4:2f4d:42e1:8e60:a726:78e3?
 ([2605:ef80:80b4:2f4d:42e1:8e60:a726:78e3])
 by smtp.gmail.com with ESMTPSA id
 g22-20020ac87d16000000b00342f844e30fsm8678466qtb.31.2022.09.24.13.31.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Sep 2022 13:31:25 -0700 (PDT)
Message-ID: <b7d97b55-2823-29d2-8a05-29eaba1e0636@linaro.org>
Date: Sat, 24 Sep 2022 20:31:16 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 19/37] target/i386: reimplement 0x0f 0x60-0x6f, add AVX
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: paul@nowt.org
References: <20220920172507.95568-1-pbonzini@redhat.com>
 <20220920172507.95568-20-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220920172507.95568-20-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::732;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x732.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.118,
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

On 9/20/22 17:24, Paolo Bonzini wrote:
> +static void gen_MOVD_to(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
> +{
> +    MemOp ot = decode->op[2].ot;
> +    int vec_len = vector_len(s, decode);
> +    int lo_ofs = vector_elem_offset(&decode->op[0], ot, 0);
> +
> +    tcg_gen_gvec_dup_imm(MO_64, decode->op[0].offset, vec_len, vec_len, 0);
> +
> +    switch (ot) {
> +    case MO_32:
> +#ifdef TARGET_X86_64
> +        tcg_gen_trunc_tl_i32(s->tmp3_i32, s->T1);
> +        tcg_gen_st_i32(s->tmp3_i32, cpu_env, lo_ofs);

As before, tcg_gen_st32_tl and no need for truncate.  Otherwise,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

