Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D0452793BA
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Sep 2020 23:47:35 +0200 (CEST)
Received: from localhost ([::1]:54462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kLvZ0-0000FA-55
	for lists+qemu-devel@lfdr.de; Fri, 25 Sep 2020 17:47:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kLvXC-0008D5-JN
 for qemu-devel@nongnu.org; Fri, 25 Sep 2020 17:45:42 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:36186)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kLvXA-0004yR-Rb
 for qemu-devel@nongnu.org; Fri, 25 Sep 2020 17:45:42 -0400
Received: by mail-pf1-x442.google.com with SMTP id d9so4526284pfd.3
 for <qemu-devel@nongnu.org>; Fri, 25 Sep 2020 14:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=fk9y9M/6QRAsxfJCP4zLm+z7ditHc4iMfHmK7NLKmh4=;
 b=W7ZIMzZytMKjp5eAiwE8Iurt1Ot3fmJrF/JAcb2VCf4dx+CNFWvLGdE8mgX2pXTw0R
 kMov0WIJrpGNROKSyhj17KyowYcsjoQ41tSAqykWo5E7DP8zeCxmVVjWjvk99KYL3O29
 3MS763pB7zvxyDalI09o6NijP/xqdOSpCXzcz/e4WZFHV8kn5Bx9FlCwq+QGrD9AIBvw
 X5GlRv3OjLh2a3JIgStu4NsNIkSx3rua4FsrbieWZn9iav3nu1/ffYuLDkILa8R3zwvF
 h/5pGz7TpGbpFdofTyVjIVctGUijxc/X6hVgmkHXOnF1eTw4UY5mZsPNiDTW/zGuFE8+
 vKJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fk9y9M/6QRAsxfJCP4zLm+z7ditHc4iMfHmK7NLKmh4=;
 b=e1OqtDoKImzk4qIn8qOJsYoydPmXUEjm91hB7cCzRAZgbZykS62j85mwAY8nhkmQza
 bgBpW+WwCPc7NUkwT9q9Fl0EgCbth8IbKk/dvODK64tyJoZXMjvEaw5cDc5QnoPnGRPb
 Hm3tLU4qyhP94nWsdAI1BmKJwCFVDnSlD+66z+fYvK8aFEBufncVBRuUta+dftMk1FfT
 ojdtfVekczNOZ1Xe62w7RCU1P7mdRJItwciJpBK9wYQYjFkyQdIqYfFx6ONOWYqd/bQY
 ERyr890VeiL4HfQjmpLVyuiFs+H5x1Ki12XrlW39FY2kj7RlW1AfTF+UkyJPAJYoR+mH
 z4mw==
X-Gm-Message-State: AOAM532xEqfVre+cFLzGiwrLAUKoPS4Kx8grpoAIl0l/rbHyK8KsV89z
 1Bam/MeKVDPRu6f0v93eB9L2KA==
X-Google-Smtp-Source: ABdhPJyc9JnH3tDmf0su8z8xqMUVS1I/DrVBvLO+c5Xf9eTe7AvXVZaxsFbrJtVKLe8JSL4s/F5Ggg==
X-Received: by 2002:a63:a554:: with SMTP id r20mr752042pgu.306.1601070339290; 
 Fri, 25 Sep 2020 14:45:39 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id 137sm3585756pfb.183.2020.09.25.14.45.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Sep 2020 14:45:38 -0700 (PDT)
Subject: Re: [PATCH v1 5/8] s390x/tcg: Implement BRANCH INDIRECT ON CONDITION
 (BIC)
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20200922103129.12824-1-david@redhat.com>
 <20200922103129.12824-6-david@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <06b8deaa-75c3-b95c-398b-8dac0efc6718@linaro.org>
Date: Fri, 25 Sep 2020 14:45:36 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200922103129.12824-6-david@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::442;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.238,
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
Cc: qemu-s390x@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/22/20 3:31 AM, David Hildenbrand wrote:
> +/* BRANCH INDIRECT ON CONDITION */
> +    C(0xe347, BIC,     RXY_b, MIE2,0, m2_64, 0, 0, bc, 0)
>  /* BRANCH ON CONDITION */
>      C(0x0700, BCR,     RR_b,  Z,   0, r2_nz, 0, 0, bc, 0)
>      C(0x4700, BC,      RX_b,  Z,   0, a2, 0, 0, bc, 0)
> diff --git a/target/s390x/translate.c b/target/s390x/translate.c
> index b536491892..383edf7419 100644
> --- a/target/s390x/translate.c
> +++ b/target/s390x/translate.c
> @@ -1626,6 +1626,11 @@ static DisasJumpType op_bc(DisasContext *s, DisasOps *o)
>          return DISAS_NEXT;
>      }
>  
> +    /* For BIC the address came from memory, we need to wrap it again. */
> +    if (s->fields.op2 == 0x47) {
> +        gen_addi_and_wrap_i64(s, o->in2, o->in2, 0);
> +    }

I'm not keen on this sort of per-opcode checks.

I'd prefer to add an in2_m2_64w() helper that performs the load and then wraps.


r~

