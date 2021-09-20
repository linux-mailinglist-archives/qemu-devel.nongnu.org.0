Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB704117FC
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 17:18:20 +0200 (CEST)
Received: from localhost ([::1]:50354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSL3j-0006qf-4r
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 11:18:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSKbs-0007cZ-OK
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 10:49:32 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:43601)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSKbr-0008CS-0j
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 10:49:32 -0400
Received: by mail-pf1-x436.google.com with SMTP id c1so13548160pfp.10
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 07:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=yJUfulamHn1rZbwj5nJmq0QZp11FAc79QmKIxIhajjg=;
 b=erpQ5sluxRd5e/Z+V7/+wHkamCBjwmi2Q3+XiChgzZawhaj0iXgfezYOdWUDJdRwOB
 n9+UfGxFPhoCmReo0uyiciaAP0us4f9n8AlZKtXs70PuCUUyeRwSxHu0xtnyvBqcRyBC
 xQB1bI2fpxCY3Qy0Ncx9ldSygunOLLaPyIf4MXV+jp3Lg2K9V3ZfsqWkDN+aeUvEJDvi
 rNcIgM8Sz+crJsG3ptazMCwFRLngrMSFtkH5Sam8kKA4PIgXItDzvKY8cvi/a5/dFIQ1
 wnVes2y4C3NpDnxJz7dnq16QgMONvvwz0v9DCqJ9usg4p0t7DIj64oqa+YgvrQ9mX6n8
 QFMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yJUfulamHn1rZbwj5nJmq0QZp11FAc79QmKIxIhajjg=;
 b=bEC20sPB+8VBIEbV/KVRl9DyZcWPtbcQSdhpaVo45yN4e0eymDG0OyoJEpR1F4hvGV
 3jVhS8LPYDXt8LjAwiBFAjGZGiTibdFEbhaDs6BjxkaOh6G8khHlP77CV6vs+0Vh1nm2
 IvBXMwulNtxRjyC9qftB7i4LkIDvKmU/4gCtkCxkNYnALFw1ogXbrKY/GJOb4K8D/Uyx
 vLKfyg29FMUrH4kH21FveWBg5/QDVigg1zZL5egI0IkHqJ8xPL6UdYye/jNJ67gD3fVY
 PhIRrBLcj2Bx+7aZr7a3b7TJGOI+YT3GBLPNFoj1DXEMArwXwLQ35YC/sclZyHflAqAs
 Njpg==
X-Gm-Message-State: AOAM532ATH1oEPaOddrnwZBMZx//Lhgj+PMK19YVr1WkOiDo3PAjE8OK
 ru9tlqezLmPgyVfQMyK7iqdFDCPLs/JjRQ==
X-Google-Smtp-Source: ABdhPJxWO/67Ay36X7p6ldNjU0TzToQxuZ52lDURpHJ48xGnmBtk9xoe72bG9oLlkc00B+AJM4BxRA==
X-Received: by 2002:a65:5a81:: with SMTP id c1mr23295449pgt.74.1632149369634; 
 Mon, 20 Sep 2021 07:49:29 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id f205sm14038636pfa.92.2021.09.20.07.49.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Sep 2021 07:49:29 -0700 (PDT)
Subject: Re: [PATCH 10/30] tcg/loongarch: Implement goto_ptr
To: WANG Xuerui <git@xen0n.name>, qemu-devel@nongnu.org
References: <20210920080451.408655-1-git@xen0n.name>
 <20210920080451.408655-11-git@xen0n.name>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f9e9d1e2-dfc8-8f64-3a50-c1f846cac57e@linaro.org>
Date: Mon, 20 Sep 2021 07:49:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210920080451.408655-11-git@xen0n.name>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
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

> + * Define LoongArch target-specific constraint sets.
> + *
> + * Copyright (c) 2021 WANG Xuerui <git@xen0n.name>
> + *
> + * Based on tcg/riscv/tcg-target-con-set.h
> + *
> + * Copyright (c) 2021 Linaro

Too much cut and paste.  Otherwise,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

