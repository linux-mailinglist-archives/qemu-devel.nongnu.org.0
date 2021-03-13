Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2F96339AD5
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Mar 2021 02:28:55 +0100 (CET)
Received: from localhost ([::1]:52628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKt5K-00078X-D3
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 20:28:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lKt3v-0006en-Ln
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 20:27:27 -0500
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735]:42913)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lKt3u-0007fk-4S
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 20:27:27 -0500
Received: by mail-qk1-x735.google.com with SMTP id z190so26318352qka.9
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 17:27:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=zeKQx7qsPhVEqTtB7/gkAiVeo9DLB7psjrKKewhaXyM=;
 b=Cy3reNB+ij1qFSCbI1L9UGwuXsCxEIyu1bE2zFsfOS/M84DgeW+oz/tPrOPvK+kJ9s
 K87siDHs9PKImxqWpp3cbJxlFZxkyD+LmOZJnTlSrR3fQUpybvYZ5YXfTyjTfCOojckk
 yhLDRQ8w7mexLzufx7LOhQxiXn1C40nt+oEwYf5RYIOyIVaAuUbTXliTzPc9+MsXN6P7
 thDAK67iQhX2MjYj6DdNkmksewku2U/dXcv3KcvghAnDGgKXF+fPGUaly/rmbLG3H2wU
 VCTVye1D3W03VZEhatUbsOnFMXJy4TOu73jKafdujn55u7cRVFG7CgywkrxR+ny1rgse
 iPmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zeKQx7qsPhVEqTtB7/gkAiVeo9DLB7psjrKKewhaXyM=;
 b=rkr7SAdWx2uZryjEDW396U6IJlXjaM6WXTsRTSgmEb5L6ne4wEMmB029WI58lP70s8
 iq38a3ADn+GuOVPj0beUpKKfRvJJ/VGm8bQj6XVpBy6BfOUdGjTxVVK9WVr4vR/4lj4t
 DeDlI5JUw7q1OIOh42C22p7QCUrOgIMYTqFdO3PecNoUdwwG8Bnj4LDmjOEK9L5DRxuV
 89Bdg3e1emPY7cGay1V37ptX3ggAnqBX60+kwqvFsHc8XyR6d5l62MMC+Iw/ppAEzFyn
 gZEWnOxC/vYCTwhDh5xXBW1ZEUKsVGzaPXIo5NZzN39lLgfBONvX4BLbE93wPGZScCF3
 HUqA==
X-Gm-Message-State: AOAM531NiZNf4lmpGd6gnG3hbc6pQOPyEkAiemNjc7WeHL11daBZmcFt
 qhwDrO9HfHKe7sQRDv1v2BOZrg==
X-Google-Smtp-Source: ABdhPJyLBcue2IuqVPNziNLe5dyQp2np6eYoRIe2Lim2TXVnW0X53qvjBfUrk9TRgJom5/8ylWJ/+Q==
X-Received: by 2002:ae9:f706:: with SMTP id s6mr15804997qkg.163.1615598844812; 
 Fri, 12 Mar 2021 17:27:24 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id v2sm5186078qti.94.2021.03.12.17.27.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Mar 2021 17:27:24 -0800 (PST)
Subject: Re: [PATCH v6 1/2] target/s390x: Implement the MVPG
 condition-code-option bit
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20210311194426.149044-1-david@redhat.com>
 <20210311194426.149044-2-david@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <580976ca-ed71-f9ba-c384-1d3f223249ca@linaro.org>
Date: Fri, 12 Mar 2021 19:27:21 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210311194426.149044-2-david@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::735;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x735.google.com
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
Cc: qemu-s390x@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/11/21 1:44 PM, David Hildenbrand wrote:
> +    if (exc) {
> +#if !defined(CONFIG_USER_ONLY)
> +        if (exc == PGM_PROTECTION) {
> +            stq_phys(env_cpu(env)->as,
> +                     env->psa + offsetof(LowCore, trans_exc_code),
> +                     env->tlb_fill_tec);
> +            tcg_s390_program_interrupt(env, PGM_PROTECTION, ra);
> +        }
> +#endif
> +        return 1;
> +    }

Only the lo-core store should be within the ifdef.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

