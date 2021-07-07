Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07EC63BE02C
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 02:21:04 +0200 (CEST)
Received: from localhost ([::1]:49790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0vJH-0006u6-3K
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 20:21:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m0v6e-0000yg-Ga
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 20:08:01 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:38870)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m0v6c-0007qa-VX
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 20:08:00 -0400
Received: by mail-pg1-x52d.google.com with SMTP id h4so440750pgp.5
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 17:07:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=OrJKC3ek7k8X9hygoXhJCsq0XwIcKu6IF5/uack+q7c=;
 b=yzuUSqqM1kCy5W7vmjPg7bD5ljgjoDWHbAgERXlSCfg5L4E6IWeioLVycAgzFTI6lc
 8J4y+7qWfl7waU9wt4NNbmqqWP+V7kWFV6/7eCkLRCcGzsVyRkZJjAbn4Dt4Dq7rf1wB
 mT/UdZ+ayZtqb9FDATATneBoU0FEChRBj/tNAxJC5qGsb8/VFIiuzI8x0ps50VCc9l81
 fEQ/3vBo0Ymoot4dFxkv3+IsRoxv+thaLC9x03C3qppj1S0gQ8YEk5tXtQ2cvVsQaM6s
 EqKWVyKNRE//B0vQ9ilO7gPsH8djkA/V72Nl2Mw8ZpnFjhXArLYhDTQ5BlvSY6zRSArm
 f7Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OrJKC3ek7k8X9hygoXhJCsq0XwIcKu6IF5/uack+q7c=;
 b=bhW7nfdSNZXO3VuL2ExJxl7ejGF/jnTJXi5eFqSzniM0TpbVjCE/HMW8tZTr/lHMGw
 aIWd/kzWYocvk2zYbMu8jzVXFBfdIybvJk1NZi6nfxHYFubDKUb4BQnIXO9xitxo8jLY
 1SH1DP+Jwpo9NXLddDnGnaVPXD+oLvm8HhCWv3wA+e06NbXw8KDbrNP7h/ANaUtWAjyw
 Uq09Urmcl0JtAUf9jFQ6Hth5cUMtgfufgdhaFmginuY9jLiAoYds32AKVKIZNhQqFLE6
 Q8VHnlo2p5OXJr4oVEvQYl4g+bjU0mhASOPW+tkE1r4Qqcj7vJW6soeN5ewub4neVRwt
 mpkg==
X-Gm-Message-State: AOAM533D+LKG846aXSBN680W2j+aM8WTkjkg0EGo1kBiMohXsJxfij7g
 wM1j3Z/Ojd6Jx7hxb/d9Y21NpKpfTTUrQA==
X-Google-Smtp-Source: ABdhPJzvbNIEBBODThsJ/J4saHJQ0P2+kyXH3mkYh4JcuaBV32lMzscA2/VtIqULFWLKSRdFRbQCsg==
X-Received: by 2002:a62:ab10:0:b029:31e:4a34:b78f with SMTP id
 p16-20020a62ab100000b029031e4a34b78fmr14272805pff.69.1625616477241; 
 Tue, 06 Jul 2021 17:07:57 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id k19sm15821141pji.32.2021.07.06.17.07.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jul 2021 17:07:56 -0700 (PDT)
Subject: Re: [PATCH v2] tcg: Avoid including 'trace-tcg.h' in target
 translate.c
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210629050935.2570721-1-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <dc9635ad-7100-fab9-c452-06349352d96c@linaro.org>
Date: Tue, 6 Jul 2021 17:07:55 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210629050935.2570721-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/28/21 10:09 PM, Philippe Mathieu-Daudé wrote:
> The root trace-events only declares a single TCG event:
> 
>    $ git grep -w tcg trace-events
>    trace-events:115:# tcg/tcg-op.c
>    trace-events:137:vcpu tcg guest_mem_before(TCGv vaddr, uint16_t info) "info=%d", "vaddr=0x%016"PRIx64" info=%d"
> 
> and only a tcg/tcg-op.c uses it:
> 
>    $ git grep -l trace_guest_mem_before_tcg
>    tcg/tcg-op.c
> 
> therefore it is pointless to include "trace-tcg.h" in each target
> (because it is not used). Remove it.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
> v2: Rebased due to mips-next conflict (was already queued)
> ---

Queued, thanks.

r~

