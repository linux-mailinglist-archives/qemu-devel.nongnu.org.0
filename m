Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7423449BE13
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 22:58:49 +0100 (CET)
Received: from localhost ([::1]:55242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCTpw-0001Yu-1b
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 16:58:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nCTmi-0007Xb-0Y
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 16:55:28 -0500
Received: from [2607:f8b0:4864:20::42d] (port=42711
 helo=mail-pf1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nCTmf-000228-UE
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 16:55:27 -0500
Received: by mail-pf1-x42d.google.com with SMTP id i65so20980614pfc.9
 for <qemu-devel@nongnu.org>; Tue, 25 Jan 2022 13:55:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=VIqU6uiOEXEPjU52Y7VBunIRJfFUvLIXvOVt0UC99oM=;
 b=QW5wvvwL4XOthkrdG/yQA7ljLSG7gxBPUrAv2mAyAkv+nVJmiRRIgt2kZsUSBwjcoj
 jOuw0uywNDncP+Us7qoX+LzDSVH9yeTIug2mmUMab5h6dZmWbnNYPyEG8uTNuBnqK1kf
 vCrGn4MhwdXoQwsc10IpZu3qLjSwHG85wJE+mgEfEbsEy1s4hZpmBKqeFmQXRJbNEyRg
 e/EzA9pAemycZAPmF/sUofW98QR6H/jt9NX8nP4EveFur8BHqXe3g3hv5zM1QJfUiDK5
 YQdAXRhzoY8iQe5nYqpBcbnW+yKsULN0hgz8Pr9qpSrL4kUPfB5VCxB4L+ksUlT/I2g+
 Ld6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VIqU6uiOEXEPjU52Y7VBunIRJfFUvLIXvOVt0UC99oM=;
 b=gOrvjGYtSRUi8oOc802PfHQxvmdQy7RI3Eh/tOqJoSGAcF/Odpkm6vs89Z4Q8wr4AO
 EwfOwYOJH76W90raTFneawwG/FMdWt+Nyb7wsr1NPLsivvA2ebI5NmirtI5DB5sp4jBn
 WLAZTN/XnwiJz4fTyH6SK9GvEtzy0MHHaAQ6A8A5THKAQFWbaxzTHXrb7zgQLmPjpTqY
 2xxab9ugVxR3QBNwqySkytOPO1yB0leghxU0zuFTmw1ToMfmn3d68Y7NVdtnSlHH+p5x
 1Wz9Gw0jmzfRpB9HJZ3BiCqOqp+uPFLvSjA+iNqiq2v+YxL33hmH7qaOkpa9Z5XeFcBf
 kZLA==
X-Gm-Message-State: AOAM533z8LiK9aICnSeiR3ccKTEngD3y4uBqMPw34Z3pX/AS8um+On5F
 R/wo3JhamfJCCCda29nHHK6S1w==
X-Google-Smtp-Source: ABdhPJxBSEkTE3EwbPhTrXgqhn/SuDCaWGNNmAfMyJhiSoF7IgzhG2XSLlFSpnLpACjpkFta0BLusg==
X-Received: by 2002:aa7:9f5c:0:b0:4c8:fc66:e4a1 with SMTP id
 h28-20020aa79f5c000000b004c8fc66e4a1mr11543109pfr.22.1643147724378; 
 Tue, 25 Jan 2022 13:55:24 -0800 (PST)
Received: from [192.168.15.44] (alanje.lnk.telstra.net. [120.151.179.201])
 by smtp.gmail.com with ESMTPSA id gb5sm1356711pjb.16.2022.01.25.13.55.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Jan 2022 13:55:23 -0800 (PST)
Subject: Re: [PATCH 1/2] accel/tcg: Optimize jump cache flush during tlb range
 flush
To: Idan Horowitz <idan.horowitz@gmail.com>, qemu-arm@nongnu.org
References: <20220110164754.1066025-1-idan.horowitz@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <156b4c0b-a425-0121-cf91-4b118bd8dd3c@linaro.org>
Date: Wed, 26 Jan 2022 08:55:18 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220110164754.1066025-1-idan.horowitz@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/11/22 3:47 AM, Idan Horowitz wrote:
> +    /*
> +     * If the length is larger than the jump cache size, then it will take
> +     * longer to clear each entry individually than it will to clear it all.
> +     */
> +    if (d.len >= (TARGET_PAGE_SIZE * TB_JMP_CACHE_SIZE)) {
> +        cpu_tb_jmp_cache_clear(cpu);
> +        return;
> +    }
> +
>       for (target_ulong i = 0; i < d.len; i += TARGET_PAGE_SIZE) {
>           tb_flush_jmp_cache(cpu, d.addr + i);
>       }
> 

Hmm.  Valid.  It looks like we could reasonably rewrite tb_flush_jmp_cache to be more 
efficient, by passing down len.  But this is a decent intermediate step.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Queued to tcg-next.

r~

