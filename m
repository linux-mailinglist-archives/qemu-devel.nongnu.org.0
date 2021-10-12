Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCC3042AA0E
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 18:53:28 +0200 (CEST)
Received: from localhost ([::1]:33518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maL1r-0004ve-L2
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 12:53:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maKq4-0006w5-18
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 12:41:16 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:43739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maKq1-0008Np-Ja
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 12:41:15 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 k23-20020a17090a591700b001976d2db364so70609pji.2
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 09:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=YK/0Dt+Fqnt10qTbTB1kCxjRu1CD0x4tbeYMeweceLM=;
 b=dWQmMqHZuPu/kY+tFWC30g7Mfm2GHOAW6xEPBS/gGp2y6XJY8SgohvscN7bw45V5Av
 w6r/7VqgDEONcxp07wfFC4dH+mXrkG2QdJv1Hl1g54ZOrrXJNQJTthn7seuH/PDgff86
 LLrE2LMKTuvnXByipnfr/yulCNpIdCyyhXBsmfWhT13HnRMqjP7OMrn5usruTS21j7n+
 EERSYMVaG+quCzMGWOpdONCJlN+M167RSyMGO2bBk5pJswxEx+cIf5+mVEbRLw0hyb2I
 Yjdf3sAjj2Z6mGyfsbjhNldixdc2bWVJValUycOQAUxN1V/3oiQ5yN7LULSwMPSAO+U+
 A7dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YK/0Dt+Fqnt10qTbTB1kCxjRu1CD0x4tbeYMeweceLM=;
 b=ddN2R0f7PYrHP3YDZBNNihUAjZcPw40QiJocJDkDXVPXWtz+zdsE1oAPKIK/8WmHDZ
 faXaRWY3w3Zj+aeCrthiJmESNj+vLK4hJTcs79bRKiF+qfIdfBK7z9e/DyMeaAsk7pfS
 bz6kbcMkW0pQMtL58inxP+pS2bQP4ZObRkMAACTnTVvT4B1oWq5fkc9MSx0bheS+yA22
 HKnbMLJ8PYvgCHynZm43+bxqBULUGr3kyAOZZoSdAg0z7UGZNuW6rE0QDxe0OpihNWpZ
 kjtL86ymOqSSwwQUMaqSc5gFmK+z2bQZ3X/sDAlEK9VeHBDM1y2mGAg2+NWYOP+8nIzO
 MSCQ==
X-Gm-Message-State: AOAM530PB3IpfT7X8SC/Cwpa62lMR+kPMtz1MvV69p/xBWXyU/GJnWT6
 pH+4+Uge+EfJJ/qcdWUbjJrqUw==
X-Google-Smtp-Source: ABdhPJzRolk4LUo8GZs3gv6Wk5VnWNli3TwfqGu+QmkQ4rHCX+J+h170xkKFEhAcuE3NBwZh6Rkcuw==
X-Received: by 2002:a17:902:930c:b0:13e:42b4:9149 with SMTP id
 bc12-20020a170902930c00b0013e42b49149mr30712357plb.86.1634056872088; 
 Tue, 12 Oct 2021 09:41:12 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id o26sm7470359pfp.177.2021.10.12.09.41.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Oct 2021 09:41:11 -0700 (PDT)
Subject: Re: [PATCH] ebpf: really include it only in system emulators
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20211012162252.263933-1-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f3407880-323a-45ea-19d5-4406bf4794e9@linaro.org>
Date: Tue, 12 Oct 2021 09:41:09 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211012162252.263933-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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
Cc: jasowang@redhat.com, =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/12/21 9:22 AM, Paolo Bonzini wrote:
> eBPF libraries are being included in user emulators, which is useless and
> also breaks --static compilation if a shared library for libbpf is
> present in the system.
> 
> Reported-by: Alex Bennée<alex.bennee@linaro.org>
> Signed-off-by: Paolo Bonzini<pbonzini@redhat.com>
> ---
>   meson.build | 2 --
>   1 file changed, 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

