Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 200EE410D9B
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 00:24:19 +0200 (CEST)
Received: from localhost ([::1]:36970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mS5EP-0003OH-Mo
	for lists+qemu-devel@lfdr.de; Sun, 19 Sep 2021 18:24:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mS5DP-0002WW-Lo
 for qemu-devel@nongnu.org; Sun, 19 Sep 2021 18:23:15 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:38508)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mS5DO-0008Mk-4e
 for qemu-devel@nongnu.org; Sun, 19 Sep 2021 18:23:15 -0400
Received: by mail-pg1-x536.google.com with SMTP id w8so15441100pgf.5
 for <qemu-devel@nongnu.org>; Sun, 19 Sep 2021 15:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=nA4szRw8XawE9C3V6GRhMA0rrZGOp+NAQpOeeyLaO5E=;
 b=xUx8YaMCTpf8BSwP/bhzu+58UrlRcbp+PodSZLBBx2HQxH/9EP1TQkT4LngOIwy+Hv
 ckdZordqr0lxpXucszzUfzcCGhRITUdXLrR78qOIR5Tl26CKXRrTkrUPRvyXu3D8SsJg
 YCRQgj5h7/3cLE1LffJHxIz/bETZXl0PcNBI/HfF1UbOYHIKkfqLKYcYL/jMYsW36iOn
 52UDZ8BIbTY/YeoDnGu6Q0/A+IIx1lrUi4lRPvTSlXuRfsFD6qNVHlqItV3fAOpBPph2
 IOd1MiMuQTzEFoDh9wMMNprCvRM4OgP19MAfXxfe6SOQ7LOQrqbagr1/VckmbVkB4deT
 Eepw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nA4szRw8XawE9C3V6GRhMA0rrZGOp+NAQpOeeyLaO5E=;
 b=P6rfD5yen/qvjJpYcMLRXAST6DT8fp2hmNd2QpmXeHIEXwM67I7oAh7MnQk44YscJH
 c3MwSczaRXLFGKsAksXBRgu+agdBKsUMzquU5fbcNN3pr/iQmBK2+rk4DygPe0douClZ
 zmyNwqbY1YDwscCHAVUADgMk3eqxAvlcj3pii7q0NaBlLyH2kqHVYGVQfRzRliZnh8xc
 GrIXl9qkKhjbcQx+Br57BMB7DgudNf20ObO9uJGaHUh+RqmhunU0TNa3iGPzaypG5/YY
 MQ+qund4OxElgq0xp9KXi4Jx5LFyT6cvc7HVd/5NeXdItLM4cZqYUlbCasS0S9zONGPW
 9Wtg==
X-Gm-Message-State: AOAM5338Dbmvpgk8IQaVHbCHNHZ/tTqrZkqDyUSZqnNmkJRf4NU06RuZ
 1ltmnDqTrMNX+m0blVO3VQairA==
X-Google-Smtp-Source: ABdhPJxZg0Fas0AP/G972wIcbW8ii018j0WO76HagzcwOE9rQvGAlMdmJCNX3CQs+tOvukD1WPEfiw==
X-Received: by 2002:a63:741b:: with SMTP id p27mr20859143pgc.140.1632090191861; 
 Sun, 19 Sep 2021 15:23:11 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id t68sm13023463pgc.59.2021.09.19.15.23.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Sep 2021 15:23:11 -0700 (PDT)
Subject: Re: [PATCH v2 4/8] linux-user/arm: Report SIGBUS and SIGSEGV correctly
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210821195958.41312-1-richard.henderson@linaro.org>
 <20210821195958.41312-5-richard.henderson@linaro.org>
 <CAFEAcA82iZptWmCcgonZvLTU4g+5nnEEQDdtHD5y=X7m82N1Yg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4a65af02-ae19-20c5-9ffa-3e3a7d0401d4@linaro.org>
Date: Sun, 19 Sep 2021 15:23:09 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA82iZptWmCcgonZvLTU4g+5nnEEQDdtHD5y=X7m82N1Yg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/26/21 6:31 AM, Peter Maydell wrote:
>> +                si_signo = TARGET_SIGSEGV;
>> +                si_code = TARGET_SEGV_ACCERR;
>> +                break;
>> +            case 0x5: /* Translation fault, level 1 */
>> +            case 0x7: /* Translation fault, level 2 */
>> +                si_signo = TARGET_SIGSEGV;
>> +                si_code = TARGET_SEGV_MAPERR;
>> +                break;
> 
> Side note: for cases like this where we can tell MAPERR from
> ACCERR based on info the exception handler passes to us, should
> we prefer that or the "check the page flags" approach that
> force_sigsegv_for_addr() takes ?

FYI, the v3 version of the sigsegv+siginfo patch set makes is vastly easier on the target 
code.  For the most part the target code goes away entirely.  For the specific case of Arm 
(both a32 and a64), we retain it because we are supposed to report the ESR and FAR as part 
of the signal frame.

I'll note that a64 isn't filling in the esr_context and far_context structures.  The 
latter was invented for MTE, I believe, where the normal si_addr is untagged.  I should 
have a double-check around those at some point...


r~

