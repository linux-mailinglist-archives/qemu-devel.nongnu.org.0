Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B6623EBAB1
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Aug 2021 19:00:48 +0200 (CEST)
Received: from localhost ([::1]:40458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mEaY0-0004Du-40
	for lists+qemu-devel@lfdr.de; Fri, 13 Aug 2021 13:00:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mEaWe-0003WB-Lc
 for qemu-devel@nongnu.org; Fri, 13 Aug 2021 12:59:20 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:43849)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mEaWd-0006EE-9Q
 for qemu-devel@nongnu.org; Fri, 13 Aug 2021 12:59:20 -0400
Received: by mail-pl1-x635.google.com with SMTP id e19so12767284pla.10
 for <qemu-devel@nongnu.org>; Fri, 13 Aug 2021 09:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=tx2BDxgM4oTCK2/YfPUe/1TSdcdpeGlG8g0sX8XfyMM=;
 b=q5mrxYFw3eVNC+G10nmb0AOBrJRNMfzBe4sqWn46Mc1fbxpCh4ypgZfT6bg0+BZXdE
 rUy+wTDr0t/Weo6iKqmukwhaiEX9usrpFPQIL6EOuiml1PnRVVYdGdjhvrekXElKRlTZ
 57xYMhbAGaC+zJw6PncD1PpfzCmuRuNkdc+POkqNeBeLfMvo0BvamYkms8MncYLWAL0o
 A2vV3IRaKy6FMvc9p9Q4LHMoSNsm6VlLmArd2FwwDdxcTP+1urIFbymtpFUmRt3LEMcr
 MrMEjMw7uJFepme2hLnCmRqz+rWGGmyA4e3MJNGl+P5GuicgIUJ22qrcdxnuBJDrBy0f
 uuVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tx2BDxgM4oTCK2/YfPUe/1TSdcdpeGlG8g0sX8XfyMM=;
 b=ArasZQ3B8PE/VAlQyXEjW3N4UBOC5RS2nXk+g5JVo7XKUuT69kYcm1Cww2SctEKhJ+
 0RW4DVlsA8lLHWk4x/bIOcuzA1vrILdXQ0XbUv2i2vHht8UIIjnbSbDiokTuyn1TdP7I
 43oY8jcXraF8oDEg3Fcz9EkmcL6XexadrdALTGVeCrak+8ni25UwfGv7ayBx3V1zDg6m
 HWV/xDQ7QjD2ZJ1ugQ5bY5NtDcppOQ1PujDFj6nil1EW7XgCS7gyxuv8mo+Q8iEx9o6x
 3+ku1hi5XQ//vwAKx66uI6ULuqTM69Q2mF0LRN8kc0zCnR31WoT+dnlOxZG00XX3tt1H
 VgSg==
X-Gm-Message-State: AOAM531OJ2hlpIsjTFAdP20ZyyG8Pl+Og9r6PcWUthLkMDrQNC4IDaLT
 UNwq/kWeOcMthk6zxNXYwOaYVoS3jMToiQ==
X-Google-Smtp-Source: ABdhPJxBfbAFvNR/x6Ead3lgaEKlb1RwKsyC1tDhwJ3rOn3sNPaKsCcq72VRTZzaLqLEdcChjT7oSA==
X-Received: by 2002:a63:e04a:: with SMTP id n10mr3171779pgj.381.1628873957667; 
 Fri, 13 Aug 2021 09:59:17 -0700 (PDT)
Received: from [192.168.6.169] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id x1sm2913122pfn.64.2021.08.13.09.59.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Aug 2021 09:59:17 -0700 (PDT)
Subject: Re: [PATCH for-6.1] tcg/i386: Split P_VEXW from P_REXW
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210810232530.1033519-1-richard.henderson@linaro.org>
 <CAFEAcA8J4WBFiLUTJAXduST4v+cz7-5s3KPJJY05LVizN_9PcA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <184409c8-a983-8581-d263-9119607dc55d@linaro.org>
Date: Fri, 13 Aug 2021 06:59:13 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8J4WBFiLUTJAXduST4v+cz7-5s3KPJJY05LVizN_9PcA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/13/21 12:37 AM, Peter Maydell wrote:
> These changes look OK as far as they go, but it's not clear to
> me why the other places that set P_REXW are all OK to use P_REXW
> and not P_VEXW. For instance tcg_out_mov() sets rexw = P_REXW
> and some of the codepaths there will then pass that into
> tcg_out_vex_modrm() which ends up in tcg_out_vex_opc().

This distinguishes between 32-bit and 64-bit transfer between vector and general register. 
  Which of course doesn't make sense for i386.

> More generally, is there somewhere we can assert that we
> didn't try to use a REXW prefix for i386 codegen rather
> than just silently ignoring it ?

I guess tcg_out_opc might be a place.  But mostly we try to avoid generating those places 
in the first place.  E.g.

#if TCG_TARGET_REG_BITS == 64
# define OP_32_64(x) \
         case glue(glue(INDEX_op_, x), _i64): \
             rexw = P_REXW; /* FALLTHRU */    \
         case glue(glue(INDEX_op_, x), _i32)
#else
# define OP_32_64(x) \
         case glue(glue(INDEX_op_, x), _i32)
#endif


r~

