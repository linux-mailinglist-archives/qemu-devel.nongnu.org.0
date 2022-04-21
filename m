Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B4250A7E7
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 20:16:01 +0200 (CEST)
Received: from localhost ([::1]:36274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhbLU-0003w2-Kj
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 14:16:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhaKP-0005DG-Bn
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 13:10:49 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:51013)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhaKN-0007xZ-Qo
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 13:10:49 -0400
Received: by mail-pj1-x102b.google.com with SMTP id iq10so1768812pjb.0
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 10:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=eGHd/tuU4mXAhYXQ5+arUSgy2U8c2QyphILcOMPXiIM=;
 b=AQYNoKrN7r4NZn0c5FEniTTWwjKya0epf3/mMUPVGoVrRdmxDnkjYsO+i9dvd97P6v
 k/q3wOOBHTAdPc5d004FcvQ1Ju/ByaXgyfHziED1RY+6gokFv159JH2U+GLWLVdXnHCo
 jTVrgLD4JMb57Lvfm4v0/fTmS3GfmygCDA8eckfH0mTAwpW5Tn3MnUxx1rkvi3f4otUa
 yO6/SRwnDckL2ckNWtveH22Gqvsg+r/aRoL5u47lAiIEp8+7lAWbrxSa6Hd/6NSgkQUp
 r1611NwvfzFFlpBGcbbUNRw8kLnIGOHPvF+BzZbBFOtj9XukNr+wII9kHprNPDVA1vBO
 jR6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=eGHd/tuU4mXAhYXQ5+arUSgy2U8c2QyphILcOMPXiIM=;
 b=LEDOg3omVFlOsZNF4y+gN/qP82g5Z482N5Ia9I89lrU7a/WRkIu1eUILIFxmKxZT2y
 Glq0Vsaj/22Xc9J75Sz49dDo86D0uE6bF8j5k29YPDFdqlagDvyRcYTJd/mI13xh37fQ
 fh6h6Y9w3G1D+rkQvoEVGG8WpLw8YXIxLLcIOXYVp43vtWEpoUOJ+xy4bwN365Qdx7yH
 IV53g13jfqdqBY6My+GuGszeznLoYd5hBgiRZOhU/rQhohKIo8r6N+t4lC0rKjxB0Lhu
 YJBNtwvT+vwMz/RuTfjb46d6QEvV4zk7lZ+7fEcTYQxCiC2slVxJcDiGnONZezq3cm/S
 fYgw==
X-Gm-Message-State: AOAM532MFb9QuCc93V7wsfXAIYpHjwsVCR1TEkPRMzeFvSoFcz1UAGag
 L8Mm6bkTgvvOY8msAJ8Mj9Fkeg==
X-Google-Smtp-Source: ABdhPJxivkRRC+XfZ/oNdGHq0UNiZGgaFKSbbNhJ+2kbC4UKUzYGvRLVYDqisduMdkCZeYuSnRfWSQ==
X-Received: by 2002:a17:902:f688:b0:15b:45ea:b682 with SMTP id
 l8-20020a170902f68800b0015b45eab682mr266882plg.134.1650561046321; 
 Thu, 21 Apr 2022 10:10:46 -0700 (PDT)
Received: from ?IPV6:2607:fb90:80c1:f8a5:3d1f:84a9:7713:bf09?
 ([2607:fb90:80c1:f8a5:3d1f:84a9:7713:bf09])
 by smtp.gmail.com with ESMTPSA id
 z7-20020a056a00240700b004e1cde37bc1sm25423511pfh.84.2022.04.21.10.10.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Apr 2022 10:10:45 -0700 (PDT)
Message-ID: <c11ce181-04a9-627f-d2f8-77b040e5d1e9@linaro.org>
Date: Thu, 21 Apr 2022 10:10:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] target/rx: update PC correctly in wait instruction
Content-Language: en-US
To: Tomoaki Kawada <i@yvt.jp>, qemu-devel@nongnu.org
References: <20220417060224.2131788-1-i@yvt.jp>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220417060224.2131788-1-i@yvt.jp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/16/22 23:02, Tomoaki Kawada wrote:
> `cpu_pc` at this point does not necessary point to the current
> instruction (i.e., the wait instruction being translated), so it's
> incorrect to calculate the new value of `cpu_pc` based on this. It must
> be updated with `ctx->base.pc_next`, which contains the correct address
> of the next instruction.
> 
> This change fixes the wait instruction skipping the subsequent branch
> when used in an idle loop like this:
> 
>      0:  wait
>          bra.b 0b
>          brk   // should be unreachable
> 
> Signed-off-by: Tomoaki Kawada <i@yvt.jp>

Queued to target-rx-next.


r~

