Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ED95319380
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 20:56:31 +0100 (CET)
Received: from localhost ([::1]:39692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAI4k-0004S8-Ah
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 14:56:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lAHOC-0006ED-47
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 14:12:35 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:46867)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lAHO6-0001u4-17
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 14:12:31 -0500
Received: by mail-pl1-x62b.google.com with SMTP id u11so3812392plg.13
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 11:12:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FAmoOdvdO1rgpzLvkHU+wH9+w/R8eOCwiRe85ARrfOQ=;
 b=lHTKlOPHG2uQFAk0zCrNMsqi0RAZ3PLo/c4Wk1oX7sMZ2QChlVS0HtmMYifSoduCrj
 U68z4WkOAVs1GcchG2ApmsOGnydRig9rMc3RT7oWYQis51WYg4QeIGWt+vh1VoAIsFmO
 IhO0eNc1Jk9kPseul257RuZEDGF8PNirHXMkAg+ISDT4bwKpHxqHxtES654JpbyC8EPo
 VouJ/DE5lnr8eKpQrdfn19zBnYQM5gUdXIt+QeivPyMeP+he2RLhpadD9wU0GQE7u+71
 bNkaJiprdmwkdgwRsEu7/T3j7xZ1+N1DejpwH9WeMBJGFKAfGdPr73jybswFh4oVitXi
 b3jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FAmoOdvdO1rgpzLvkHU+wH9+w/R8eOCwiRe85ARrfOQ=;
 b=X7YkIyehAkOxIQEuIXj7NdwiXvVpqDdbZUBuq/JATPbK7u7Tv1vyXoBqUHcC8JYoVG
 Ceg3oJJYBWvODGHy4a2kLX3Iw/ARlfcNlW6hOjEm7lH5iK8VkY+g7BauB7PfWYeP2JLE
 l5hX8euDYTFRfV7MyLpL5/G/Jc6+jKsfmy2D2fBI+VQOOecvXNiboOtwGpQMpS+JyJ3v
 /m2VJPvZFPNCVwkDgfdcszI8Gq3nZTom4KuCKKwePlcQM6vpyEj3uohKpqjyOHs2AylV
 SW0c+311h0mJEAry+Q28NmSUNNUaxoUzNiKVwiDcgn4b0uEDgGm18cdJ8+kXVW4VwPJY
 eeBw==
X-Gm-Message-State: AOAM530OjXg5pP7//0EqweAO3SlOTa5YOziV7hkVVhNtrwgoNLsHeX5U
 A85i3qX65Fz5hvo8AWfcjCy04Q==
X-Google-Smtp-Source: ABdhPJy8aaSLTJVB74/RWz7kT6mpCNMWZRaEMhJVGBAWmQixYw6BhDORnjBEWIGi8keRlP4/XdlDKA==
X-Received: by 2002:a17:90a:fb85:: with SMTP id
 cp5mr5062504pjb.98.1613070741468; 
 Thu, 11 Feb 2021 11:12:21 -0800 (PST)
Received: from [192.168.1.11] (174-21-150-71.tukw.qwest.net. [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id
 e3sm6251675pgs.60.2021.02.11.11.12.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Feb 2021 11:12:20 -0800 (PST)
Subject: Re: [PATCH v2 17/21] accel/tcg: cache single instruction TB on
 pending replay exception
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210210221053.18050-1-alex.bennee@linaro.org>
 <20210210221053.18050-18-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <67c46489-08b7-fce5-91c9-8416f9164456@linaro.org>
Date: Thu, 11 Feb 2021 11:12:18 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210210221053.18050-18-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.119,
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
Cc: robhenry@microsoft.com, mahmoudabdalghany@outlook.com,
 aaron@os.amperecomputing.com, cota@braap.org,
 Paolo Bonzini <pbonzini@redhat.com>, kuhn.chenqun@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/10/21 2:10 PM, Alex Bennée wrote:
> Again there is no reason to jump through the nocache hoops to execute
> a single instruction block. We do have to add an additional wrinkle to
> the cpu_handle_interrupt case to ensure we let through a TB where we
> have specifically disabled icount for the block.

Can you say more about this?  Because...

>      if (unlikely(qatomic_read(&cpu->exit_request))
>          || (icount_enabled()
> +            && (cpu->cflags_next_tb == -1 || cpu->cflags_next_tb & CF_USE_ICOUNT)
>              && cpu_neg(cpu)->icount_decr.u16.low + cpu->icount_extra == 0)) {

... this does not appear to match.  You're checking that icount has been
explicitly *enabled*?  Or am I reading the logic backward and only if icount is
enabled will we take EXCP_INTERRUPT?


r~

