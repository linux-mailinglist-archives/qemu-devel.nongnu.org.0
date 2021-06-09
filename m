Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3FD53A1B24
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 18:40:26 +0200 (CEST)
Received: from localhost ([::1]:34596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lr1Fg-0005vq-UP
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 12:40:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lr1En-00054n-4u
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 12:39:29 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:38645)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lr1El-0006zU-Bt
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 12:39:28 -0400
Received: by mail-pg1-x52a.google.com with SMTP id t17so3379942pga.5
 for <qemu-devel@nongnu.org>; Wed, 09 Jun 2021 09:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=I5IRu80lLOMpanm9WUAqchFMOp+9/CtG6qdClPI2OkQ=;
 b=EM5p6O0l0hGQPJMOA7iex5AVFOFie4PRF7AxV75SM6YBBrsY1KWkZTUZKvtAOk3DGQ
 SGuQjkzS+5YH6QqW0xssrRDPr0F7EHYcZ8rtI8KwzZUnNzOIr+o0WFR+6ciWnSo5nemX
 SixrWcZiF6TLBxO0BecUfswnY2zBCrzygvT2auCpb+hetQuseq0hpLMhARfGUZsDzV4F
 6NEB4IcAmO3GVA5i74C4cY9aRX1L17qracsfUVgI0EVxAOCkB1MP1NMEgyGNnKanQBSm
 GvgRaF9pWUk9dC0KrQrpUcJ7ECLnXVMqnGVMgBEBIUs9fOOBcQH2zFB4/bbye+5cFZS5
 FZuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=I5IRu80lLOMpanm9WUAqchFMOp+9/CtG6qdClPI2OkQ=;
 b=fdosepbMd9r5fasfMaFMKDHDIJoNYc+kOAX3iyAFDTt19Ni3SjZN68aOd4nRjJyPLR
 F9HJDemTBmD/wxTYP23MaX921zYOzROmxDTqoaL/RlmD/ue+6Fa3orFOzlS7f9BMWr7B
 PIKro9r1NR8kVBbkWi0BStFsmDpmFrdQ6sBsPGbC325EKzEhsxagfkoO5Nzj2kVyOFpK
 Lxi6KSLizmY9vuuDo3gRR1Q1iAJO2HiajF7pDCujLsYv578miLpoZeu3RCakqYKPH7o+
 FjEDfYT6AGFUWktISqPBHGIKu1JHmP6h8zu16MkElR1Yq0b7SjgAe9JRSWNEJLJ2Yk3K
 4rFQ==
X-Gm-Message-State: AOAM533xOCN2qB0JJF8ORWnghTw3FrbJyw2d5sXeuem7qXAl9PaOoMkT
 HM0ECmTHdRg1wvRZivCmYKcIDQ==
X-Google-Smtp-Source: ABdhPJwuukpJodVsO8TyVswLFt/TEpQOLV4fvlghgHNiCWaPkNw2Q9SZmRn9f0OMx344ohzBSasIMA==
X-Received: by 2002:a63:5c4:: with SMTP id 187mr574095pgf.368.1623256765351;
 Wed, 09 Jun 2021 09:39:25 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 u5sm122576pfi.179.2021.06.09.09.39.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Jun 2021 09:39:24 -0700 (PDT)
Subject: Re: QEmu ARC port - decoder implementation feedback
To: Cupertino Miranda <Cupertino.Miranda@synopsys.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <a882003d-4949-06ac-d111-8f41cb2d54b9@synopsys.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0c90a8c4-0977-b11b-b543-9eef4d4d14c3@linaro.org>
Date: Wed, 9 Jun 2021 09:39:23 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <a882003d-4949-06ac-d111-8f41cb2d54b9@synopsys.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
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
Cc: "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 Shahab Vahedi <Shahab.Vahedi@synopsys.com>,
 "cupertinomiranda@gmail.com" <cupertinomiranda@gmail.com>,
 Claudiu Zissulescu <Claudiu.Zissulescu@synopsys.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/9/21 2:58 AM, Cupertino Miranda wrote:
> We started to do that and in the process we realize that the approach
> would bring us yet another encoding language description to maintain.

Why would you be maintaining another description?  Your approach below with the 
simple recursive algorithm appears to be no different.

> Also that decodetree alone would not allow us to properly disassembly
> code, still requiring to keep the initial structure.

Why is that?

The current uses of decodetree are quite complex, so I sincerely doubt that it 
cannot do the job.  You've asked no questions, nor have you described any 
problems you have encountered.

That said, decodetree was merely a suggestion based on what appeared to me to 
be a trivial automated textual rewrite of your current data set.  If you want 
to use something else that performs equally well, fine.

> So far, we did the following:
>     - converted opcodes.def to macros instead of table entries.

Sure.

>     - created a script that reads those entries and outputs macros that
> directly translate to a switch/case decision tree (example below), just
> like the ones produced by decodetree. The difference is that the switch
> will return the enum entry for the proper decoder structure instead of
> calling a translation function.

An enum result is fine, sure.

The example is not especially enlightening because you don't show the macro 
definitions, or the expansion.  Have you a link to a git repo that you can share?

>     - the script can either be contributed in C or python language as it
> is based on a simple recursive algorithm.

Either is fine.  We currently use both as build-time generators.


r~

