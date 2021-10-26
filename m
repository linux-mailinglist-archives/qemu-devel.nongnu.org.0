Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B687943B703
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 18:22:20 +0200 (CEST)
Received: from localhost ([::1]:56830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfPDP-0002JX-RJ
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 12:22:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfP2K-0005kd-3G
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 12:10:53 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:33564)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfP2I-0003vv-8K
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 12:10:51 -0400
Received: by mail-pf1-x433.google.com with SMTP id t184so13025pfd.0
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 09:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=TKXPk1mzKW64+n66jLup5c9RHRl72GnttIod5PYjA9c=;
 b=DtDFRw7sTWwPusfh/WFOA6OmEuhFHJXCSKgAkYlQJBjeCGSiGhZkIXae0LVbnf58i4
 yqzx/ro7bNtmHLjkLZb0muYl9m+6oXT2HIILRrkYS3JqFyC+N6fOh9KnWAQhvHEsx0hf
 FqCpq5J4z4mFrDhPWFfPWrQsgkLkIDQ+DWF7bBwNDLyri4sHvLpwUjL/o4ETmvzk2ftq
 01QNvI7jMtG1M+7lDm9Mex8HWzKM7UiclCKfXskMO7P2xZqAjyuSbBOaj96EWINU2z3m
 fbo5RI4W9hjlnW07Wy4Vd0ChJZequel8fphTkRfw1i8y81pEhu53xf8sXa25pDig95tU
 ERLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TKXPk1mzKW64+n66jLup5c9RHRl72GnttIod5PYjA9c=;
 b=hcTXUmdlJWPwbw6svckmkvxZ1bkcoCXF2dGdoRyiuZxmax57b49jFnh8/M6D6iac2t
 Q1ULoYNtI8DH81Y/XtOXy34/DvozbkiB6XysCSnAh6XHYQQ4p/qpUua8BbpCs8p+RWDz
 kS7R3DPV2uZbMo88PYOdSnHj2oALvPo/4i8Ab+W1pv4yQAT5n5HTBHfqI3XRiUrMc1y+
 4xwVQGJv8yUgKbu3dJv/OKdld6Q1qc3CRq8jexnM+g+lfDnQDiozq7XiilWRfOVFjsUV
 IfgLfA1suN2P00cvTCy2cyb8oja65Js1qBLB0m9eJsffgKfsrT2YWlXQNwB+kJQcfrx6
 U4VA==
X-Gm-Message-State: AOAM5306F+KgDe0vf8ZbfZJRXz6DQEZBaIVr1JArvVYlx5MF/JrsEj18
 oW3//wC6pm7F9mXO2cEZMuXgiQ==
X-Google-Smtp-Source: ABdhPJxwbu4/VU5BPoBYMw4Skt3A/++muP+9kVLiCcmd/ll6vBgQ6tz2rCRV61S3bnKTkyD8Dy1fpQ==
X-Received: by 2002:aa7:9043:0:b0:44d:13c7:14a5 with SMTP id
 n3-20020aa79043000000b0044d13c714a5mr26566194pfo.86.1635264648667; 
 Tue, 26 Oct 2021 09:10:48 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id w185sm22894637pfb.38.2021.10.26.09.10.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Oct 2021 09:10:48 -0700 (PDT)
Subject: Re: [PATCH v2] hvf: arm: Ignore cache operations on MMIO
To: Alexander Graf <agraf@csgraf.de>, Cameron Esfahani <dirty@apple.com>
References: <20211026071241.74889-1-agraf@csgraf.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <13a13852-4fb4-a0f8-6740-354c8054aed1@linaro.org>
Date: Tue, 26 Oct 2021 09:10:46 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211026071241.74889-1-agraf@csgraf.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.215,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, kettenis@openbsd.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/26/21 12:12 AM, Alexander Graf wrote:
> +        if (cm) {
> +            /* We don't cache MMIO regions */
> +            advance_pc = true;
> +            break;
> +        }
> +
>           assert(isv);

The assert should come first.  If the "iss valid" bit is not set, then nothing else in the 
word is defined.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

