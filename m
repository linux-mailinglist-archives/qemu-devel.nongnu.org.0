Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 741C75B5CEE
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Sep 2022 17:09:02 +0200 (CEST)
Received: from localhost ([::1]:48328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXl3U-00042h-UQ
	for lists+qemu-devel@lfdr.de; Mon, 12 Sep 2022 11:09:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oXl1U-00024y-8u
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 11:06:59 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:46972)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oXl1S-0000FO-6p
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 11:06:55 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 k6-20020a05600c1c8600b003a54ecc62f6so7400678wms.5
 for <qemu-devel@nongnu.org>; Mon, 12 Sep 2022 08:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=dFRNNeq6H79B1UOBui48lqrBUDaCbNHBHchXQRDyCtc=;
 b=n4m5r/qJv9Y9UtZj20WctdOuhOjYymuCDVU1bo8E65Fgr7B6eLBd0Ck1fY+3ey83Uw
 3Vi0IQKfluyKMk+n5sUkheayNSnVoKPeBVkC6nPwePKrvNT3s6Cd4yYEPnn8E4m9w+h9
 Pf5YwSoyFhGM8GijtU2TEB7+1cUVv9VXdPuiT9hRbf6v3Vmq8V7bMKyvc9Y3Myzu2vZr
 M6rgpxhGeDOT9uoIdYBEEhIvo7zy60xNmgK/ezmYliCNp+nkYFYZRP1ZZuto7gcmLTcM
 S6h8t24qMukCeHa6wC26l+6XGVcRl1KTYNwfjkCnARkMT51SUyvDRz3MamGYwgKXzG5v
 tEfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=dFRNNeq6H79B1UOBui48lqrBUDaCbNHBHchXQRDyCtc=;
 b=Cv644fhJ8N7ja0SKzu/AVvmCA8K/bmJLOdN+YemRWIQpkp4bIK9h7Rq5zDuuhTlv+7
 BtAamV+FU2LoeLJKxbC39XZlYZhR0WS5eNO0EzOtNW1CG/oehpGs/echGIqDYuGz9NdX
 n33oFLTF6Ck3TGyH1IboeVDp+OZdHqo8iyzwVAbK5vu4AGFdWc21+4fbx4hgixeEDfuY
 8oJKfstFnGRdelPwDt9HZHlG44x19BDjcn4eFv3ipSon0iI/wnv2BUTQhwqDyaqSioI2
 zMbVRJMFPfH/+PDvdB4Q9VHkgTg53sBshYnDhtdKUzeZzk2wNqUXOcJMrNKE56kvtkI5
 t52A==
X-Gm-Message-State: ACgBeo38tUQiuMOqb6C0A9iiX9VFNSs7fXJtx4GzdPGbc6tHE2KuXZff
 CV3wkXZkVe5qahUjNPHu+m5xcQ==
X-Google-Smtp-Source: AA6agR4meGlcVVxzJRLwFq649dZ34xOMQJQM0r5o9oivS4Cx8xcNaiIlKImYAhb1pS+XkUgbSvnBhA==
X-Received: by 2002:a7b:ca53:0:b0:3b4:90c4:e07 with SMTP id
 m19-20020a7bca53000000b003b490c40e07mr2200788wml.150.1662995211930; 
 Mon, 12 Sep 2022 08:06:51 -0700 (PDT)
Received: from [10.119.17.153] ([89.101.193.69])
 by smtp.gmail.com with ESMTPSA id
 y25-20020a05600c365900b003b483000583sm5006903wmq.48.2022.09.12.08.06.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Sep 2022 08:06:51 -0700 (PDT)
Message-ID: <2b54c1ee-8779-795b-d120-2e5f95aab3f3@linaro.org>
Date: Mon, 12 Sep 2022 16:06:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 25/37] target/i386: reimplement 0x0f 0xd0-0xd7, 0xe0-0xe7, 
 0xf0-0xf7, add AVX
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20220911230418.340941-1-pbonzini@redhat.com>
 <20220911230418.340941-26-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220911230418.340941-26-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32a.google.com
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

On 9/12/22 00:04, Paolo Bonzini wrote:
> +    [0xd7] = X86_OP_ENTRY3(PMOVMSKB,  G,d, None,None, U,x,  vex7 mmx avx2_256 p_00_66), /* MOVNTQ/MOVNTDQ */

Cut and paste comment?

> +BINARY_INT_MMX(PMULLW,  pmullw)

tcg_gen_gvec_mul

> +static void gen_VCVTpd_dq(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
> +{
> +    SSEFunc_0_epp fn = NULL;
> +    switch (sse_prefix(s)) {
> +    case 0x66:
> +        fn = s->vex_l ? gen_helper_cvttpd2dq_ymm : gen_helper_cvttpd2dq_xmm;
> +        break;
> +    case 0xf3:
> +        fn = s->vex_l ? gen_helper_cvtdq2pd_ymm : gen_helper_cvtdq2pd_xmm;
> +        break;
> +    case 0xf2:
> +        fn = s->vex_l ? gen_helper_cvtpd2dq_ymm : gen_helper_cvtpd2dq_xmm;
> +        break;
> +    }
> +    fn(cpu_env, s->ptr0, s->ptr2);
> +}

Earlier decode?


r~

