Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36EBE4093CF
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 16:25:48 +0200 (CEST)
Received: from localhost ([::1]:34434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPmu3-0004gH-88
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 10:25:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPmgi-0003Vq-Qg
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 10:12:01 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:41802)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPmgX-0007LO-00
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 10:12:00 -0400
Received: by mail-pf1-x434.google.com with SMTP id x7so8934607pfa.8
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 07:11:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=NkG7nzRVGW2Lc6Zfq4Iglexdt1ElmjMZkrUFZFMqCeA=;
 b=PvLU9MkJ3C9PrCrcaHqfBzHD4NjGSyk6flWOYRXL1QzkNCvFRGwqen8XL5ADIxhA1T
 QlsSwCMxeWlo5R1hnnouc+7m83HZfg5E+IG9X+92t26LF42tHe0szsdHlHV4d+nOio47
 AGHC/6x2/n6SNPXxCmBLe9+CrUEFf52OjdOnmS/TjKFQvgmS+5qGftpVR7iegJSYt1ic
 D/sSZddwJXOfItpyDLrFEVQp/tTxUlKd7JOhvOmVuLN8AmS/F+GoKU92o01VOumxysQl
 T2S7YFYXzd60whBMwRpniQ4ndoOuKEeeRUgEBDqyn6R/EJuQXCuTksw0OZAalOyP4TDH
 zH9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NkG7nzRVGW2Lc6Zfq4Iglexdt1ElmjMZkrUFZFMqCeA=;
 b=T+F9g77coUf4DqsjEzY5tskkNa9qzyEjvL/2ABVn7ZyCMlvZEFhnPsJxE40ckTVaO1
 k1wQ+cOxMk6ceITUZFeJdpGTU+mTqiC69fvmACwLBPz/gE8TjH8ECNuf76AhTD3jlkmt
 2YvdZviu/e0pZleAHjIhm3aXBvJ1qJiFb2TCMUf4pDim71CqkuDJ+GufoT4JZpJOz/rK
 BiftSJ2WK4v2ZsXuLahRKJX2up23ycrdZNrEs+RF1Fr+naW+wA/X/XzyzeZiAtEQ+1Z5
 YH9zKVxZuLBUDiopz2UOzfNb8qa8cWB0Nssfs36XONZLGxCawAKoBriVUIma29l0UTL+
 QnAQ==
X-Gm-Message-State: AOAM531NhlNg0pzQpDlV7g3vAuKphv75K811PKnJPf/mKN0uZPkAHUxG
 M2+L8pwkqNz7ZgFD8mc9o6Yh6w==
X-Google-Smtp-Source: ABdhPJzA8gCnqrUM9Ng4mzAxra5pIWgfZaOX+s+8YMeEqP5yrJfIrJT7tOlW7DNoTbzgD2T6gd7R/A==
X-Received: by 2002:a63:7455:: with SMTP id e21mr11404398pgn.188.1631542307696; 
 Mon, 13 Sep 2021 07:11:47 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id d63sm7044212pjk.17.2021.09.13.07.11.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Sep 2021 07:11:47 -0700 (PDT)
Subject: Re: [PATCH] accel/tcg: assert insn_idx will always be valid before
 plugin_inject_cb
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210903145938.1321571-1-alex.bennee@linaro.org>
 <36bc7691-c0d9-9e18-dade-4d95405dcd62@linaro.org> <871r5swztj.fsf@linaro.org>
 <a925ce89-7134-c26a-c967-942f98b71a29@linaro.org> <87h7eova8w.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <eda0add7-18a3-e96d-98cd-3b62be709302@linaro.org>
Date: Mon, 13 Sep 2021 07:11:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <87h7eova8w.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.969,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/13/21 7:06 AM, Alex Bennée wrote:
> Hmm so we have a separate list for speedy access:
> 
>      /* list to quickly access the injected ops */
>      QSIMPLEQ_HEAD(, TCGOp) plugin_ops;
> 
> I wonder if we should drop that and just scan QTAILQ_HEAD(, TCGOp) ops
> so we can be properly aligned with the current instruction.
> Alternatively we could just emit INDEX_op_insn_start to the plugin list
> as well?

I suspect that just scanning the whole list would be easiest.  Then you don't need to 
maintain your own separate list.


r~

