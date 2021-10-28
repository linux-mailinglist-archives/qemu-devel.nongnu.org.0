Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBA5E43E8E7
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 21:13:58 +0200 (CEST)
Received: from localhost ([::1]:55314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgAqc-0000Xv-03
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 15:13:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgAnZ-0006Ln-4q
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 15:10:50 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:41600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgAnV-0001NY-42
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 15:10:48 -0400
Received: by mail-pl1-x629.google.com with SMTP id z11so5114411plg.8
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 12:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=l/uSBLWQYIiBbBYaUx525t4K0p+5rMO+XBCGUkbraDw=;
 b=RvGQ8tlQOXkzJ0p+pD2WZsXpGSzf74M4vGwlmX8x0Gct/8Iw6C1IoDlRjDyh/8EfkI
 hIlDcBmKrlgNx8ALE7jO/rfhmfsWhUZxHNnxrhWvPFU482TLPzGtvGFKa8krYwUF8S7K
 ZcY2uGNgtpDvrpGzOqq9Wpk7B6Kxj0ZelmoV8tfrdmct+peOgpBFzSvU6MquycB8QUgo
 7krwsBfhc3q9AoRvJPDSOlyEbiR8HTrO1My3x2fCCRywzb+nR8OdmYngEw1Ld9qaNQhW
 Jo7GtKMZb7t7TRHjZ5wb0OfmHgvClVIOkEdY1AY9TfjtjXB8o8vvtEUns+SHvPJPtlaL
 AgSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=l/uSBLWQYIiBbBYaUx525t4K0p+5rMO+XBCGUkbraDw=;
 b=ebQe8J5wMvEPvN3mloyD3I4bg26ytxfhCBh5LXlMdcSXr6OJGpv59I6qlHwC9Xx360
 3LB7rrXh3LAJVdRlkllq+0Ic+6d3xvxtuhe1oL376nn+oxjdiN9xsjY5gB4xZIP6pK0b
 jTLWrUc2NC87QxFYEN7a11GxkcpxizkwMJRS89JVFJqZAeRZlFSBPK1ifKjWa6JRRCY8
 kIVX71VkkXNv/vWP/LCixl9iaFjIAFmbHU51ke5DO/BzATOkk3MHXuRx40bISVsdMzej
 3ufGSofic3lxUNPD77mXBScU0LYCN4uhQLoyxyCWj1B0wzDELwHhfzYPZLfAtFM46Iv7
 ZZ4A==
X-Gm-Message-State: AOAM532QhRofSZaOHACOsPpLPpTYK2upesPMNWwWGvP8hR3t2WIk872k
 H2/5r2JcBN0no61WwV7KcH8azQ==
X-Google-Smtp-Source: ABdhPJzDOB/6bmu9Ifx6YH0VFwFVAA7XJsxMiLMSZnrbO9BWlogxTx4JrTyMfHoAgc7/vRVhFh1LxQ==
X-Received: by 2002:a17:90a:110:: with SMTP id
 b16mr6398992pjb.154.1635448243733; 
 Thu, 28 Oct 2021 12:10:43 -0700 (PDT)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id on13sm3832290pjb.23.2021.10.28.12.10.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Oct 2021 12:10:43 -0700 (PDT)
Subject: Re: [PATCH 2/4] softmmu: remove useless condition in watchpoint check
To: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>, qemu-devel@nongnu.org
References: <163542167953.2127597.8760651610734002929.stgit@pasha-ThinkPad-X280>
 <163542169094.2127597.8801843697434113110.stgit@pasha-ThinkPad-X280>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0ad5f9f1-4ad4-18bc-b4a9-c3b191113101@linaro.org>
Date: Thu, 28 Oct 2021 12:10:41 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <163542169094.2127597.8801843697434113110.stgit@pasha-ThinkPad-X280>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.847,
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
Cc: pbonzini@redhat.com, alex.bennee@linaro.org, peterx@redhat.com,
 david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/28/21 4:48 AM, Pavel Dovgalyuk wrote:
> cpu_check_watchpoint function checks cpu->watchpoint_hit at the entry.
> But then it also does the same in the middle of the function,
> while this field can't change.
> That is why this patch removes this useless condition.
> 
> Signed-off-by: Pavel Dovgalyuk<Pavel.Dovgalyuk@ispras.ru>
> ---
>   softmmu/physmem.c |   41 ++++++++++++++++++++---------------------
>   1 file changed, 20 insertions(+), 21 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

