Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E62A429336
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Oct 2021 17:27:11 +0200 (CEST)
Received: from localhost ([::1]:55846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZxCn-0008BQ-Q8
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 11:27:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mZxAn-0006ye-6M
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 11:25:05 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:44022)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mZxAl-0007Zy-5j
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 11:25:04 -0400
Received: by mail-pf1-x434.google.com with SMTP id 187so15108652pfc.10
 for <qemu-devel@nongnu.org>; Mon, 11 Oct 2021 08:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hFKZUEwZ3orj5PFfNoQn1dvb7AST1G0RstaiQajawt4=;
 b=Ro5nExklCPiuvKBWSEIVWbwNR0v2X1S5mxsajanJ8PA8MtfY61WFNCb2VBkM118AbZ
 ivYc32HbuHWTJRs6hduSXACj+9L5jm+b0pCBNpKB/+E231A/wZK4lAXXZGrP3fwTDk/7
 E4AANkSIpVr3IGErgT3PtylL4mnQw8KjsFNAuycBLxZLH+w55E90Si+y+udkiP9Cty6y
 D4fJKY/9LHtGZmt5O1WInjvmaSS2/yAENUuSa7hIFvPuZZdXcBTI2BrIgCYW9EkdzNUB
 TaQuc+1wq3p4tvyfZmhrEis+hOlhcvV9KI+IVYu+0io6SBAJd4+cOUHE7mI5WVI35Di/
 hATg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hFKZUEwZ3orj5PFfNoQn1dvb7AST1G0RstaiQajawt4=;
 b=6HZsjOA9KStJ7sxIRk7u21nsjp92tQhc/zHc5u1ZR918btugJXLRwiuSZI8bvStaHk
 hmjgNcXuSGpXnodOFtr3UowKf8bgLB5y/KNMjab+MVOOb7VA846vkoaGhck05+jQzpaj
 qKewGiHxzj4TWK8hH0UacJd0WUcFdmhi3yLc1BxJG+275p6fifCmGBYFKBqOfnIMvks0
 4x+q7MfQg5KVuCle+CLnb7RRKesYGTeCvQxc+0KIXtkynRr4LmNV9M9wj7O/1e3VDLBO
 P7TgxPdwNYpSWBxNArp4Ovzce7hCZxdO6lu6lOQpxzJ6aU0ykjYtZSE+Iea88ZPN9cRf
 w6OA==
X-Gm-Message-State: AOAM5312qGkeMZAuCKpLVEXy6O1awEsEEHfJ96wfdMvmZvLqVpiyXiCY
 7II/l282wvYdUazVcXb/dxmazqAdEJNxJA==
X-Google-Smtp-Source: ABdhPJzC/AP7PrBg5sN3BqE8RIMO8ReGdnFuJbq0tqMK4G60SJDqI1yOZpLDN9Ml/q3GDj+qJv2mdA==
X-Received: by 2002:a63:bf45:: with SMTP id i5mr18480769pgo.161.1633965901606; 
 Mon, 11 Oct 2021 08:25:01 -0700 (PDT)
Received: from [192.168.71.106] (50-205-213-50-static.hfc.comcastbusiness.net.
 [50.205.213.50])
 by smtp.gmail.com with ESMTPSA id b11sm8337106pge.57.2021.10.11.08.25.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Oct 2021 08:25:01 -0700 (PDT)
Subject: Re: [PATCH 6/8] tcg/aarch64: Support TCG_TARGET_SIGNED_ADDR32
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20211010174401.141339-1-richard.henderson@linaro.org>
 <20211010174401.141339-7-richard.henderson@linaro.org>
 <877dejyhrb.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5e3693da-301b-cc99-e3ac-844c9be622a4@linaro.org>
Date: Mon, 11 Oct 2021 08:24:59 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <877dejyhrb.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
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
Cc: git@xen0n.name, Alistair.Francis@wdc.com, f4bug@amsat.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/11/21 3:28 AM, Alex Bennée wrote:
> 
> Richard Henderson <richard.henderson@linaro.org> writes:
> 
>> AArch64 has both sign and zero-extending addressing modes, which
>> means that either treatment of guest addresses is equally efficient.
>> Enabling this for AArch64 gives us testing of the feature in CI.
> 
> So which guests front ends will exercise this backend?

All 32-bit guests.

> Is this something we can exercise in 32 bit user mode tests?

Yes.

Which is why I enabled this for aarch64, so that we'd have a major platform testing it daily.


r~

