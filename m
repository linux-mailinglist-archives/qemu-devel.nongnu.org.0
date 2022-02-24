Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A3254C3670
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 21:02:21 +0100 (CET)
Received: from localhost ([::1]:54042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNKJf-0004Wm-W7
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 15:02:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nNKG6-0001r8-Dr
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 14:58:38 -0500
Received: from [2607:f8b0:4864:20::431] (port=45881
 helo=mail-pf1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nNKG4-00086s-6q
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 14:58:37 -0500
Received: by mail-pf1-x431.google.com with SMTP id u16so2772396pfg.12
 for <qemu-devel@nongnu.org>; Thu, 24 Feb 2022 11:58:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=vlYjsnm+SCjtznd/+pUWifqqEevjASZVzMhG2Deu4AY=;
 b=uYXIC7k4j/ZwstfLuD3i3MLyC+JXUiDFF6nKbB8Zs92FA9gwCQo4nTNvzCDCi+mYpL
 /tcHHEwxXHQkmBtUdm/hJdT+pRnycWJHpdkJNHdBTdpo7yGUYOq1j/d1cpQvOZWg5W9e
 cZN0NtYi1Q6CE7B7NBE3ufllxtkwKK3hJVX34db0JVI/nVnoj/TDQ/TycMys8bDKY8DN
 EchrGodoz+OB/JRNnWIBAoBqgso4kf+tfAeBNTMcNo1zC9g4AOdwJwGJTIIBGcXQHpt/
 CLSWjBfG0c9GPn/GxzI5zcNDGb5V90nBZaZ5NOO03U+GthX9vWCTXoAdW8kFyD1KJ12e
 kcFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=vlYjsnm+SCjtznd/+pUWifqqEevjASZVzMhG2Deu4AY=;
 b=Xyh2omP+OcL7+bJ/wgEwgZRQbFJrqMFAF2g9ELX1/goQ/2pcpt8/o31VYH0+A6f++f
 STtCUMkDXWLr+Ab92/RRY73bJPx1JFhkcQhR9nXm5qduwGKTCfFQLWFAFpTMASljiPgW
 MJ5xPi+x0F+VxG6xUs7YiB0TqP7t6F/X7gw2zG6hPWpM27Pk1JcxuU4HHXhKZ+b+1bwI
 7XeN2N/15eYmZFpZ4tlUQ3kAMo4XByfDdwG4Qm0Ohzny/kmyPYEcoCJAhewvmerFuL+f
 5oetgIhlBi3BbDcWzLq+kRd9ZDwtk9e1P8IUop14ZXd9QdiZInTa0AppGsi8dOWFM0AC
 FwXw==
X-Gm-Message-State: AOAM5329VoubhdxLtf2Nxz25znFCjRg34DRbBopzWG2WJvOz9yOC/sZR
 p50VVMNiUozEmKE5w16bWU51zQ==
X-Google-Smtp-Source: ABdhPJy7LeYHt7Qn3LmJddrAZx5ssN7UFMOOZV0ZVJdOyawC7rooAfXkd6LJOKh2YZHUBV1YwY3Nlg==
X-Received: by 2002:a05:6a00:158c:b0:4cc:ed28:f9a1 with SMTP id
 u12-20020a056a00158c00b004cced28f9a1mr4358710pfk.48.1645732714716; 
 Thu, 24 Feb 2022 11:58:34 -0800 (PST)
Received: from [192.168.4.112] (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 t11-20020a056a0021cb00b004ce1a7d5ce8sm295115pfj.113.2022.02.24.11.58.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Feb 2022 11:58:34 -0800 (PST)
Message-ID: <33dc7d92-d15e-e42b-d00d-520a35585a2b@linaro.org>
Date: Thu, 24 Feb 2022 09:58:31 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 07/12] Simplify HOST_LONG_BITS
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20220224183701.608720-1-marcandre.lureau@redhat.com>
 <20220224183701.608720-8-marcandre.lureau@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220224183701.608720-8-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::431
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: peter.maydell@linaro.org, f4bug@amsat.org, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/24/22 08:36, marcandre.lureau@redhat.com wrote:
> -#if UINTPTR_MAX == UINT32_MAX
> -# define HOST_LONG_BITS 32
> -#elif UINTPTR_MAX == UINT64_MAX
> -# define HOST_LONG_BITS 64
> -#else
> -# error Unknown pointer size
> -#endif
> +#define HOST_LONG_BITS (__SIZEOF_POINTER__ * 8)

I guess.  I'll note that there are 128-bit pointers on the horizon, but that UINTPTR_MAX 
would not necessarily change to match __SIZEOF_POINTER__ [1].

Acked-by: Richard Henderson <richard.henderson@linaro.org>


r~


[1] https://www.cl.cam.ac.uk/techreports/UCAM-CL-TR-947.pdf



