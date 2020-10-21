Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49CC929505E
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Oct 2020 18:05:36 +0200 (CEST)
Received: from localhost ([::1]:57760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kVGcI-0004D6-OL
	for lists+qemu-devel@lfdr.de; Wed, 21 Oct 2020 12:05:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kVGY5-00085B-Ub
 for qemu-devel@nongnu.org; Wed, 21 Oct 2020 12:01:14 -0400
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:46634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kVGY1-00010g-QW
 for qemu-devel@nongnu.org; Wed, 21 Oct 2020 12:01:13 -0400
Received: by mail-pl1-x644.google.com with SMTP id t4so1413694plq.13
 for <qemu-devel@nongnu.org>; Wed, 21 Oct 2020 09:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=0xLJwhjUoNXO/jjblBKyHUPr4cOn9Tt9inel8+vWTsM=;
 b=KouGEELL1+36VIs3VSLVLN0kBmjcEnusw4TvQ5XDgL/VEl0Nem9D6QTBW43ts2s6Ie
 0YLaNMarjXtDUm+uar2YRlxpS7vBZqbo5K1CU9xB6AYzEXB0QyHnpIJWdclh3jez2rh9
 0mKoUmCehl3WZ70nkOOCK5s3xAlluPO36641EhYl7KQhsIztUQq8Ns9I8WNOf4UO0iiO
 kydqwdaPPmJZE5UKUoFKtTfZWi7+OHyMJnYxSuz6VETyWRZlGbGtPVHcQ7ttziGamGHY
 +ojUWNbV4Omk5DBQJEAJnkd2hZo702jhE8ugfzSOLsZzDJTgy9jqzL3soTvRDQGpahgj
 N0iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0xLJwhjUoNXO/jjblBKyHUPr4cOn9Tt9inel8+vWTsM=;
 b=ft9QO7pW493QYijzq0rlqlYqfAYKr++kBVXgYZkVRodKpjiaQgbmGT5tcq0bw/TdC6
 zRkbt0ykBcJzxywPeCoAkFgWt8eHC37M4cyEr7ZxAiPS9xgV2/zEFEwlPKb1vpdfio/4
 bwTBqehveo6vfLP0xkrpnXVtxjI4udQ6dFtJ5AKulSjR73HiDlTMmfmR0Bol4DqLRZSv
 DLTM6rhRP1gi4W0o16dDviPaw9XMmk86rjg83Pwiw+qu7xjHlBJK0rTRnZuti7sIzl6w
 Pi2Jr5iSC+jsE3W7wodzA5QzRy1T8KmlpLMHapfKBhoGKmc+sU68TTgD634+yuwdfCSB
 CFWg==
X-Gm-Message-State: AOAM530rZ54oIYkkxuoJPKQjPWYpWt6p3i+LaAMFpWOC5B9+zlxivEAl
 4jtrgGnjR9sJXQdF3PDYDrMulA==
X-Google-Smtp-Source: ABdhPJxxKrA8zNMrn6CV1QpiKCJiRpMSn1aD8K1essNmuMh7xkpfyRzATUMzdSNOtlLmlDt4von+gw==
X-Received: by 2002:a17:90a:109:: with SMTP id b9mr4174567pjb.35.1603296068354; 
 Wed, 21 Oct 2020 09:01:08 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id v129sm2794886pfc.76.2020.10.21.09.01.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Oct 2020 09:01:07 -0700 (PDT)
Subject: Re: [PATCH v4 2/2] util/oslib: Assert qemu_try_memalign() alignment
 is a power of 2
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20201020111743.2074694-1-philmd@redhat.com>
 <20201020111743.2074694-3-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9c578c16-ad57-33d8-9900-b6513cf207e1@linaro.org>
Date: Wed, 21 Oct 2020 09:01:05 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201020111743.2074694-3-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::644;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x644.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Stefan Weil <sw@weilnetz.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/20/20 4:17 AM, Philippe Mathieu-Daudé wrote:
> @@ -200,6 +200,9 @@ void *qemu_try_memalign(size_t alignment, size_t size)
>  
>      if (alignment < sizeof(void*)) {
>          alignment = sizeof(void*);
> +    } else {
> +        g_assert(QEMU_IS_ALIGNED(alignment, sizeof(void *)));

This is redundant with the if above, and the assert below.

> +        g_assert(is_power_of_2(alignment));


r~

