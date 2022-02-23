Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E84C4C10AF
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 11:48:36 +0100 (CET)
Received: from localhost ([::1]:37938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMpCF-00074s-Lr
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 05:48:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nMp85-00050M-Nm
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 05:44:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nMp83-0001ft-PB
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 05:44:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645613054;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DSClAh+/BpsGDpLcay94ZQKPi3EdcET1mlOXzVozaFs=;
 b=DTtQLD9i56ozUF7uQ65NqGQTaHT35WqnPpPCVnIRp1z5uwtjr/XM+pVL9jSH39WCX5EqU8
 VLLebWh+MNalSPyC1Ood2eVMqvGMPCEVaYG8S411zF+rcL2HVD4s2vgEXT5DnA2O293Qg/
 tR9lcjHS84B+LfjAkGqQrcLmxb6uksQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-20-67o0mN1aONay4wJgSR72vw-1; Wed, 23 Feb 2022 05:44:11 -0500
X-MC-Unique: 67o0mN1aONay4wJgSR72vw-1
Received: by mail-wr1-f69.google.com with SMTP id
 q12-20020adfbb8c000000b001ea938f79e9so2020370wrg.23
 for <qemu-devel@nongnu.org>; Wed, 23 Feb 2022 02:44:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=DSClAh+/BpsGDpLcay94ZQKPi3EdcET1mlOXzVozaFs=;
 b=DYb28dhfXSdQB7nyAXF4p0dX7nD7BJ7JSCdvt0TV8HruclsQkUzIKjoGowuqizb89+
 sqQeD0C0NOq1paihPfLNEcBaFW24HXwlxxKSFlmwb1iJteLRqhXcS4dY1fy/bTY5X2rl
 GnO7cf/3DSEFEZtnAjy+a/pnJtfKJFCAfcB6xlZmcDPWDI3ZyqdREt7s4dxKfo6Bnvar
 RQ+p3nzKzyMQI+6x9C5E9XKt93Wa0KNsUFxIiSHfh2AeqswmAfn+YDt80NvP0gZO+jQp
 voEriY7pUUKx71ZJL/oyYTWQNqGZoB0F/pptwrAn66M7vNylK2YKq/BYeTMJL2T5iudn
 B3bw==
X-Gm-Message-State: AOAM530SUoRizUb/jFNCX/HWBC7JWEv9MBzYuKoyhmOGQghsjyKtttCf
 y5YmQevBCOC+1vAan8epLEAHSGIX5tYmutK0rnXj9AMplN+BnUonuY/0LU07q65S813eriIFTh0
 rICzrdbEeN5MP8pQ=
X-Received: by 2002:a05:600c:4ed0:b0:37b:e983:287b with SMTP id
 g16-20020a05600c4ed000b0037be983287bmr6914152wmq.156.1645613050327; 
 Wed, 23 Feb 2022 02:44:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw6cCogN5/969C15LMKBczwOvOygjyr82Y/7pasgdjCGKulGdIzBzCYEKUrTTlWtneE9oTYXQ==
X-Received: by 2002:a05:600c:4ed0:b0:37b:e983:287b with SMTP id
 g16-20020a05600c4ed000b0037be983287bmr6914126wmq.156.1645613050049; 
 Wed, 23 Feb 2022 02:44:10 -0800 (PST)
Received: from [10.33.192.232] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id u15sm68603493wrs.18.2022.02.23.02.44.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Feb 2022 02:44:09 -0800 (PST)
Message-ID: <e0b1e009-6684-6a4a-a8f3-1fd6048a89ad@redhat.com>
Date: Wed, 23 Feb 2022 11:44:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v6 4/4] tests/tcg/s390x: changed to using .insn for tests
 requiring z15
To: David Miller <dmiller423@gmail.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org
References: <20220217231728.13932-1-dmiller423@gmail.com>
 <20220217231728.13932-5-dmiller423@gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220217231728.13932-5-dmiller423@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: farman@linux.ibm.com, david@redhat.com, cohuck@redhat.com,
 richard.henderson@linaro.org, pasic@linux.ibm.com, borntraeger@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18/02/2022 00.17, David Miller wrote:
> Signed-off-by: David Miller <dmiller423@gmail.com>
> ---
>   tests/tcg/s390x/mie3-compl.c | 21 +++++++++++----------
>   tests/tcg/s390x/mie3-mvcrl.c |  2 +-
>   tests/tcg/s390x/mie3-sel.c   |  6 +++---
>   3 files changed, 15 insertions(+), 14 deletions(-)
> 
> diff --git a/tests/tcg/s390x/mie3-compl.c b/tests/tcg/s390x/mie3-compl.c
> index 98281ee683..31820e4a2a 100644
> --- a/tests/tcg/s390x/mie3-compl.c
> +++ b/tests/tcg/s390x/mie3-compl.c
> @@ -14,25 +14,26 @@
>   #define FbinOp(S, ASM) uint64_t S(uint64_t a, uint64_t b) \
>   { uint64_t res = 0; F_PRO; ASM; return res; }
>   
> +
>   /* AND WITH COMPLEMENT */
> -FbinOp(_ncrk,  asm("ncrk  %%r0, %%r3, %%r2\n" F_EPI))
> -FbinOp(_ncgrk, asm("ncgrk %%r0, %%r3, %%r2\n" F_EPI))
> +FbinOp(_ncrk,  asm(".insn rrf, 0xB9F50000, %%r0, %%r3, %%r2, 0\n" F_EPI))
> +FbinOp(_ncgrk, asm(".insn rrf, 0xB9E50000, %%r0, %%r3, %%r2, 0\n" F_EPI))
>   
>   /* NAND */
> -FbinOp(_nnrk,  asm("nnrk  %%r0, %%r3, %%r2\n" F_EPI))
> -FbinOp(_nngrk, asm("nngrk %%r0, %%r3, %%r2\n" F_EPI))
> +FbinOp(_nnrk,  asm(".insn rrf, 0xB9740000, %%r0, %%r3, %%r2, 0\n" F_EPI))
> +FbinOp(_nngrk, asm(".insn rrf, 0xB9640000, %%r0, %%r3, %%r2, 0\n" F_EPI))
>   
>   /* NOT XOR */
> -FbinOp(_nxrk,  asm("nxrk  %%r0, %%r3, %%r2\n" F_EPI))
> -FbinOp(_nxgrk, asm("nxgrk %%r0, %%r3, %%r2\n" F_EPI))
> +FbinOp(_nxrk,  asm(".insn rrf, 0xB9770000, %%r0, %%r3, %%r2, 0\n" F_EPI))
> +FbinOp(_nxgrk, asm(".insn rrf, 0xB9670000, %%r0, %%r3, %%r2, 0\n" F_EPI))
>   
>   /* NOR */
> -FbinOp(_nork,  asm("nork  %%r0, %%r3, %%r2\n" F_EPI))
> -FbinOp(_nogrk, asm("nogrk %%r0, %%r3, %%r2\n" F_EPI))
> +FbinOp(_nork,  asm(".insn rrf, 0xB9760000, %%r0, %%r3, %%r2, 0\n" F_EPI))
> +FbinOp(_nogrk, asm(".insn rrf, 0xB9660000, %%r0, %%r3, %%r2, 0\n" F_EPI))
>   
>   /* OR WITH COMPLEMENT */
> -FbinOp(_ocrk,  asm("ocrk  %%r0, %%r3, %%r2\n" F_EPI))
> -FbinOp(_ocgrk, asm("ocgrk %%r0, %%r3, %%r2\n" F_EPI))
> +FbinOp(_ocrk,  asm(".insn rrf, 0xB9750000, %%r0, %%r3, %%r2, 0\n" F_EPI))
> +FbinOp(_ocgrk, asm(".insn rrf, 0xB9650000, %%r0, %%r3, %%r2, 0\n" F_EPI))
>   
>   
>   int main(int argc, char *argv[])
> diff --git a/tests/tcg/s390x/mie3-mvcrl.c b/tests/tcg/s390x/mie3-mvcrl.c
> index 81cf3ad702..f0be83b197 100644
> --- a/tests/tcg/s390x/mie3-mvcrl.c
> +++ b/tests/tcg/s390x/mie3-mvcrl.c
> @@ -6,7 +6,7 @@ static inline void mvcrl_8(const char *dst, const char *src)
>   {
>       asm volatile (
>       "llill %%r0, 8\n"
> -    "mvcrl 0(%[dst]), 0(%[src])\n"
> +    ".insn sse, 0xE50A00000000, 0(%[dst]), 0(%[src])"
>       : : [dst] "d" (dst), [src] "d" (src)
>       : "memory");
>   }
> diff --git a/tests/tcg/s390x/mie3-sel.c b/tests/tcg/s390x/mie3-sel.c
> index d6b7b0933b..32d434b01a 100644
> --- a/tests/tcg/s390x/mie3-sel.c
> +++ b/tests/tcg/s390x/mie3-sel.c
> @@ -19,9 +19,9 @@
>   { uint64_t res = 0; F_PRO ; ASM ; return res; }
>   
>   
> -Fi3 (_selre,     asm("selre    %%r0, %%r3, %%r2\n" F_EPI))
> -Fi3 (_selgrz,    asm("selgrz   %%r0, %%r3, %%r2\n" F_EPI))
> -Fi3 (_selfhrnz,  asm("selfhrnz %%r0, %%r3, %%r2\n" F_EPI))
> +Fi3 (_selre,     asm(".insn rrf, 0xB9F00000, %%r0, %%r3, %%r2, 8\n" F_EPI))
> +Fi3 (_selgrz,    asm(".insn rrf, 0xB9E30000, %%r0, %%r3, %%r2, 8\n" F_EPI))
> +Fi3 (_selfhrnz,  asm(".insn rrf, 0xB9C00000, %%r0, %%r3, %%r2, 7\n" F_EPI))
>   
>   
>   int main(int argc, char *argv[])

Reviewed-by: Thomas Huth <thuth@redhat.com>

... maybe best to squash this into the previous patch, though (I can do that 
when picking up the patch if you agree - no need to resend for this).


