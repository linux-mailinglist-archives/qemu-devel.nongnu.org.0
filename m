Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D1541AF1B
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 14:33:47 +0200 (CEST)
Received: from localhost ([::1]:45588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVCIs-0001vm-9B
	for lists+qemu-devel@lfdr.de; Tue, 28 Sep 2021 08:33:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mVCE2-000704-Vc
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 08:28:46 -0400
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e]:38629)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mVCE0-0001hm-Mq
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 08:28:46 -0400
Received: by mail-qk1-x72e.google.com with SMTP id q81so36651743qke.5
 for <qemu-devel@nongnu.org>; Tue, 28 Sep 2021 05:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Y9Ry2MPLG3CF2tUcrqwDsMtMuxyW8WXlXl/f10tWnlI=;
 b=jUWR5nfQDcred1ED2l8V3p7l3tsUo2z0E0e/8hsQtoiFiP9CfygsV3/THRRdQjlp1m
 gh/0pve1py+pNvPrFdUr1wd9rVJjVZvhHRFaNs44gjB4v6FnFuYf6c1mI2dsbcnfWuEt
 t1sVI4FjGZV/mpiTSjnTEQOnjuNeBv+lsxBbMH0IqrUv0UTOl8p0XVi/Ztdrb7xxHNUk
 h4rLDbZPzt3J2yWypBr4uLOglPHEgi0kRfGMEzKagtazFRGPrOa1VRHnO1lch7MtpSBF
 43G3STh+9H2CMtIDWt9Nu8lUfWhFMHE3p6mH2evj2XrFra48eQbv406ufMKR1L5rDyFF
 M6+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Y9Ry2MPLG3CF2tUcrqwDsMtMuxyW8WXlXl/f10tWnlI=;
 b=tS+0GszV1ssPm9N5l9v90tzMJH8aQiJOpZb41m1yLV48TYPARqYteAcJQPH7G92KUc
 8FlnvDxaOaoWkiOzlgz4/UkXrGsRL1E0VKJwGI+SL+IUpVl2C4ZpqVR3fRG6mVN5AQTv
 NHKNYXh/zlyD0qfuZtwh/vzDo+xT4FHisLBwPO7BI9MnxrZtvjPJYFBr0xx4Bd8dVFRt
 OruHtVAtWlEGCXqFCdcB2WnHm1VGgnd4p3IyAcUiMHpztJj87DIbaDFhv9g1FFqHA83r
 974j0EH198PZJVKODnaSjyYndoHzX3OioNEnUpHs5v0AG0CFhEPb0PTD8y5h8rhjvzwg
 rGYg==
X-Gm-Message-State: AOAM532VJxRwU3Z0sbDTtVFUk0NBHlrCqA3fqyLfdPnEraznbGR1N5Fj
 56bD4vLpEIL8+7pEXWoOG9NOQkEGRRNDQg==
X-Google-Smtp-Source: ABdhPJwfYCONs0rboIzBG+ByZMKTJsoMoQKapDXTVKtzmkxgYiep2tkEng/Won90w01gfU0ZSuHd6w==
X-Received: by 2002:a37:a253:: with SMTP id l80mr4796538qke.314.1632832122946; 
 Tue, 28 Sep 2021 05:28:42 -0700 (PDT)
Received: from [192.168.3.43] (cpe-24-31-215-130.sc.res.rr.com.
 [24.31.215.130])
 by smtp.gmail.com with ESMTPSA id z10sm13069974qtv.6.2021.09.28.05.28.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Sep 2021 05:28:42 -0700 (PDT)
Subject: Re: [PATCH v4 05/25] linux-user/arm: Implement setup_sigtramp
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210928020039.184412-1-richard.henderson@linaro.org>
 <20210928020039.184412-6-richard.henderson@linaro.org>
 <CAFEAcA9Neuczc-g_xbe-NELJ+rejJTPF=7TUJe7=T9q-id0=TA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3044403d-7bfb-b935-8d5f-ab5bcd1362c2@linaro.org>
Date: Tue, 28 Sep 2021 08:28:39 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9Neuczc-g_xbe-NELJ+rejJTPF=7TUJe7=T9q-id0=TA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72e;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72e.google.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.562,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/28/21 5:31 AM, Peter Maydell wrote:
>> +        uint32_t *host_rc = g2h_untagged(retcode);
> 
> ...but here we treat it as a normal guest address that we can
> convert into a host address and dereference. If the signal handler
> is being entered in Thumb mode this will be a misaligned pointer.

Oops, yes.

I've no idea why the kernel works so hard to match the mode of the signal handler to the 
mode of the trampoline, but I presume it's ABI at this point.


r~

