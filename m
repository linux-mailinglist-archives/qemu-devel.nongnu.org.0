Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A87360D5F1
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 23:00:30 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onQxk-0004Xd-BS; Tue, 25 Oct 2022 16:55:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1onQxi-0004Sx-Bj
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 16:55:50 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1onQxg-0001jI-Id
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 16:55:49 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 3-20020a17090a0f8300b00212d5cd4e5eso155023pjz.4
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 13:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=znlETNbGa7A9xef9G0qrLlszHxIBdxjEp6tpD6JJyE0=;
 b=Vd8yQdjFRZ4ZOH62DJBbsyVtwhzGIIo9ZvIPp0aQW/09AbqpTr5RHlaqZXuW2UcuUx
 LjFp5mzvgCMEfQpEe2SfGpOP9L5WriCFismZjXgyHSMA/0AASg43jw0b9IsE2qsJRpq0
 UeVKmMduudpXUdhQnDIm+1ZM5PaNZlYHxM+3wwS681HSanBDeuRMnHdm03tKExM4wDCv
 vciB8Eo3/TwxB+hA02zpv6y4h/QatPBib/iHiThAD3E7sX/3p+Wgx90DgLCdtmnvdBE0
 /h8qk21FpjdKk5/q7aX0gcD1ODU2x6Lo+co7h5tQPiCOBzxuaWK3CJoXTP7jJjclsKvn
 0Wrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=znlETNbGa7A9xef9G0qrLlszHxIBdxjEp6tpD6JJyE0=;
 b=WNbbT5F6zASyoJJ1ty5DFxc8Ryxzr1m7HwXBExU0oBSEUiku8/G17qOQ5bsIfNFePz
 JnNKjH76rp0ZeADRdCA/9ivg+8bEmd1Jo1nzNwMvsZ4LYYeYi+DQKy8KKMeWhe6d740z
 fZXZ6l1JfYhNPLssfnV/dUIWskPiEfGIVZQqB2D7AJF2aY5z9oA0N9tgCHuXwnhpGJF1
 XSGAH5VRQBLZCbRPtORJgXSt97amNDXDhl2eAQOWmN5KELSe6Q85YGmpOQxuNIm/NQyR
 7plQai2aqi2Pk6c7BZ6fMd3OLRGx7lfEWwCh0WbfAHtCYQ/cWVmO1jDXgDSvUVi94dPB
 oNxA==
X-Gm-Message-State: ACrzQf3BsqWKiXeMZ3XM4G4X03J8845nq7dGCh9FUSU7YNnZ5HDWscpm
 NNsRtEZUzdroj0VpWNHrxGPMfQ==
X-Google-Smtp-Source: AMsMyM6DCU3trua2dYfNfFzfQQZXbe9iKfV28U4cO7Qrdv05nP+3auE/PxOwPRwmyGc0K9tGi/2Z0g==
X-Received: by 2002:a17:903:32c2:b0:186:9cf5:68c7 with SMTP id
 i2-20020a17090332c200b001869cf568c7mr14772893plr.143.1666731346774; 
 Tue, 25 Oct 2022 13:55:46 -0700 (PDT)
Received: from [172.31.50.139] ([103.100.225.182])
 by smtp.gmail.com with ESMTPSA id
 k17-20020a170902c41100b00177faf558b5sm1590002plk.250.2022.10.25.13.55.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Oct 2022 13:55:46 -0700 (PDT)
Message-ID: <768d3507-1c23-cc00-057d-2618fffc7836@linaro.org>
Date: Wed, 26 Oct 2022 06:55:39 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 14/24] accel/tcg: Call tb_invalidate_phys_page for
 PAGE_RESET
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, laurent@vivier.eu, pbonzini@redhat.com,
 imp@bsdimp.com, f4bug@amsat.org
References: <20221006031113.1139454-1-richard.henderson@linaro.org>
 <20221006031113.1139454-15-richard.henderson@linaro.org>
 <871qqv7vim.fsf@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <871qqv7vim.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 10/26/22 01:42, Alex Bennée wrote:
> Not a problem with this patch but I was a little confused by PAGE_VALID
> because its the one "special" flag not documented in cpu-all.h:
> 
>    /* same as PROT_xxx */
>    #define PAGE_READ      0x0001
>    #define PAGE_WRITE     0x0002
>    #define PAGE_EXEC      0x0004
>    #define PAGE_BITS      (PAGE_READ | PAGE_WRITE | PAGE_EXEC)
> 
> The above are self explanatory as they mirror the mmap flags. But what
> does PAGE_VALID really mean.

It exists so that unmapped pages have flags == 0 and
mmap(..., PROT_NONE, ...) pages have flags != 0.

Perhaps a better name would have been "allocated".
You are perhaps 25 years to late to bikeshed that name.  :-)

> The only place
> that ever seems to clear the flag is the PPC mmu_helper code in a
> response to a particular TLB operations. Should that code instead be
> doing page_set_flags(PAGE_RESET)?

Heh.  ppc seems to have re-used the symbol for its own internal data structure.
Well, considering that it's got to pass on "prot" to tlb_set_page at some point, re-using 
those names isn't a horrible idea.

Anyway, you can see target_munmap clear PAGE_VALID here:

         page_set_flags(start, start + len, 0);

PAGE_RESET exists to distinguish mmap replacing an exiting mapping (old backing storage 
replaced) from mprotect (old backing storage retained, new permissions applied).


r~

