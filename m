Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0AB357464B
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 10:02:55 +0200 (CEST)
Received: from localhost ([::1]:56672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBtoE-0006G5-9V
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 04:02:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1oBtkn-0004er-F5
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 03:59:21 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:40717)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1oBtkl-0000tN-Kc
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 03:59:21 -0400
Received: by mail-ed1-x52f.google.com with SMTP id r6so1356192edd.7
 for <qemu-devel@nongnu.org>; Thu, 14 Jul 2022 00:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=tFpLVeynJ9yed3ARjrxkCpgCeowmB6/2TNRegVatC90=;
 b=Eo+WInK0qkJJ2IWdLXz6JW7wyqKYC9wbe0UaesG9JRAPNaWjdNVbeQIXRQ5VeeOU6x
 4CKNlrPvVLrLA1Cm0EulXexyTrg1w+kIX7lw/hnJaLnk60YRx2t0rGg7nmLOMyfKYACb
 e0y5rHJ11E31umTtK+EGpN3RYZt+nKvUpuraLzCHWGMlOSh6324wkp9UuFzJ2OP7dSSK
 LKt/JhJFZZQrS2ysfvwn7AO7eYAH6T24Tj2/wiumLMqhJOy9uYPfqEgjf3UhVbq16kZt
 PB54yRCXCfY37VfUNFcCC1OPGLkik3TmysCAbb/5oCJKv1Y7BK3aBuhkfeBShWJizhXH
 ABTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=tFpLVeynJ9yed3ARjrxkCpgCeowmB6/2TNRegVatC90=;
 b=F2LRErs8kUsWK9y9pZ7J14SAPwynSWg/PHE0l96mWH3/O92PG6X/wecj3IsgZt/Gu9
 S2aDMKO/fTxytc9KtTGsmcTZ6FfgmQAeuNYGwZcMf5EFk17Ut8NrC0uouDoXlbAxEAxG
 ABDRzJoqelQ0sFMXk0198iZMp4UD0uOyAPx3S6tfzi+dKJ3SpOQoP0Txo2cXGOUFNHJb
 QySoTHFYMKuQpqo4T1uQfVloeaxO44UgQyqmvauB5hWrbe5vNqk9gwhHL8ot4ELcLP5g
 obvgY0QwsaycUfgiqzLDs7MILbcHFliq+UvSutnVHghV4phc5mrpHt4yXpaZ99FMTnMI
 smIA==
X-Gm-Message-State: AJIora9UDt/HmEXx67p0OUlG7vobc/cx6qXIgNeFva6gxn/uL071BSts
 eeH6T8WbzrvfHUFi/Hii1Cc=
X-Google-Smtp-Source: AGRyM1vd+Xr9Oe5Zkf0llp4ObfIOYSD0K3KGYvQakyyWzclK9RQ5IqSn6V+JY+NaTP4E/3st27ABSQ==
X-Received: by 2002:a05:6402:414c:b0:435:1e2a:2c7f with SMTP id
 x12-20020a056402414c00b004351e2a2c7fmr10739690eda.132.1657785557084; 
 Thu, 14 Jul 2022 00:59:17 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.googlemail.com with ESMTPSA id
 ku5-20020a170907788500b007262a5e2204sm386042ejc.153.2022.07.14.00.59.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Jul 2022 00:59:16 -0700 (PDT)
Message-ID: <e7ec3a99-2c2c-81b7-9f02-80958dce5fbe@redhat.com>
Date: Thu, 14 Jul 2022 09:59:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2] target/i386: Restore TSX features with taa-no
Content-Language: en-US
To: Zhenzhong Duan <zhenzhong.duan@intel.com>, qemu-devel@nongnu.org
Cc: ehabkost@redhat.com, xiangfeix.ma@intel.com, xiaoyao.li@intel.com,
 seanjc@google.com
References: <20220714053631.417152-1-zhenzhong.duan@intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220714053631.417152-1-zhenzhong.duan@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On 7/14/22 07:36, Zhenzhong Duan wrote:
> On ICX-2S2 host, when run L2 guest with both L1/L2 using Icelake-Server-v3
> or above, we got below warning:
> 
> "warning: host doesn't support requested feature: MSR(10AH).taa-no [bit 8]"
> 
> This is because L1 KVM doesn't expose taa-no to L2 if RTM is disabled,
> then starting L2 qemu triggers the warning.
> 
> Fix it by restoring TSX features in Icelake-Server-v3, which may also help
> guest performance if host isn't susceptible to TSX Async Abort (TAA)
> vulnerabilities.
> 
> Fixes: d965dc35592d ("target/i386: Add ARCH_CAPABILITIES related bits into Icelake-Server CPU model")
> Tested-by: Xiangfei Ma <xiangfeix.ma@intel.com>
> Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
> ---
> v2: Rewrite commit message

Why wouldn't the fix be (in an Icelake-Server-v4 model) to remove taa-no?

Paolo

>   target/i386/cpu.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index 14f681e998cc..25ef972a3eed 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -3423,6 +3423,9 @@ static const X86CPUDefinition builtin_x86_defs[] = {
>               {
>                   .version = 3,
>                   .props = (PropValue[]) {
> +                    /* Restore TSX features removed by -v2 above */
> +                    { "hle", "on" },
> +                    { "rtm", "on" },
>                       { "arch-capabilities", "on" },
>                       { "rdctl-no", "on" },
>                       { "ibrs-all", "on" },


