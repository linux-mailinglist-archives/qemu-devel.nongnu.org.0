Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6485E6B81B5
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 20:23:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbnjT-0000t5-SU; Mon, 13 Mar 2023 15:21:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pbnjS-0000su-Ef
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 15:21:18 -0400
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pbnjQ-00078R-Vc
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 15:21:18 -0400
Received: by mail-oi1-x22a.google.com with SMTP id bh20so10226863oib.9
 for <qemu-devel@nongnu.org>; Mon, 13 Mar 2023 12:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678735275;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Y7iOYN/Sh/oU3wyprpv8sEQcj6ZQYGluDbk3+b6GEQ4=;
 b=Is7zz496vq7/y8N/AYrdn5FyQOz114f2kF6C1ARFNp9/UHIU/tqhO6ronC3fobZ2qY
 Uy7XWOEnpMR8Ci2L+3LGSMnKD3jKdL4jFH4mFL0ggGWT0Ve9mL9B6lj+uSlmFNXjicXB
 yy8rMh1VBllfDQ0isthE2O2zoFFb3bj3EsAfqNbO3v7LUYtrnqA2J7Lw40XH94uWT4mt
 Ayh1vDKYc7YZsGv466UYWMTpydgTCzk9LKI0vSxnj9g8BAMVVgFa9s5kCcnMLsdnvKJE
 wj/DVqMP72kM5wAHQuNtqfcpxk+Sad6eBW7LAfxF+RgXltDMyAkQqLDJ2qE9jNLuYO4v
 HKPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678735275;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Y7iOYN/Sh/oU3wyprpv8sEQcj6ZQYGluDbk3+b6GEQ4=;
 b=iM1TbxJzvTFd9fYDCuTXHtpot9Mpe2+C7JiDzCcjLPYy7aLtIgjsIQrYsbIKDNWvI0
 wgxggeAqbo63HKPoJfy3k41dyQFkLJTwGIeS0kK+1uso1+0JZkCXjYTRHc84HlUkYLS/
 MsPHVfDTxurcvS1RJyEdE9YDLPL+NZZgNjlyp73epfKMyTC7aFHWx/+dWU33HApLPzWB
 rIUIK95QkPwZdxq6NXXG9KcEDpJ5YflQ/00WipLpRfxCX+3EsmjHTMTm/d4SSZmpshVB
 PYzJSKd/rPzqzXVEYA4fgLwLBQpT+EoUoFtf8JtgEFUDRL3ysDa5YbJIhHu0sX9mX4uX
 3y9A==
X-Gm-Message-State: AO0yUKW1qHmQbkAQdWtcZNuPxwXRK6RMNj1GDztBO5GNbySWxmQdXj8k
 7eO2nAjkMHfRSHMQs82xaStVXA==
X-Google-Smtp-Source: AK7set+/ZDRsXZrD46cTXCy7Krzmm9pxrkboCPJAvPazMmiKK7N2erANM01Ht0AmrguymfDlsL9/Cw==
X-Received: by 2002:a54:478d:0:b0:378:a144:f7ad with SMTP id
 o13-20020a54478d000000b00378a144f7admr6890206oic.17.1678735275612; 
 Mon, 13 Mar 2023 12:21:15 -0700 (PDT)
Received: from [172.20.4.181] ([50.232.40.61])
 by smtp.gmail.com with ESMTPSA id
 o187-20020acaf0c4000000b0037d7f4eb7e8sm136307oih.31.2023.03.13.12.21.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Mar 2023 12:21:15 -0700 (PDT)
Message-ID: <29307e46-00f1-9e02-94a3-de8b4a399ada@linaro.org>
Date: Mon, 13 Mar 2023 12:21:12 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 09/11] tests/tcg: disable pauth for aarch64 gdb tests
Content-Language: en-US
To: Luis Machado <luis.machado@arm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-devel <qemu-devel@nongnu.org>
References: <20230310103123.2118519-1-alex.bennee@linaro.org>
 <20230310103123.2118519-10-alex.bennee@linaro.org>
 <CAFEAcA89K6_-Uc0XmEa1q+_z_yuppq1kvh=uPfv9V80MBH=aQg@mail.gmail.com>
 <87wn3ocwqz.fsf@suse.de> <87sfeclb8o.fsf@linaro.org>
 <CAFEAcA8SFtzMAFPaE=_CJtwXDYiJQ8rDWgEE+Nx2Qz=-FjCmMA@mail.gmail.com>
 <9bb8ab52-c6ae-95a7-e6c8-64bcce166c19@arm.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <9bb8ab52-c6ae-95a7-e6c8-64bcce166c19@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22a;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22a.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 3/13/23 04:44, Luis Machado wrote:
>> Luis: I think that rather than doing (2) with a QEMU namespace,
>> we should define a gdb namespace for this. That makes it clear
>> that this is still a gdb-upstream-sanctioned way of exposing
>> the pauth registers.
> 
> That should be fine as well, and would work to side-step the gdb 12 bug so it doesn't crash.
> 
> We could name the feature "org.gnu.gdb.aarch64.pauth_v2" or somesuch, and slowly stop 
> using the original
> "org.gnu.gdb.aarch64.pauth" feature. I can document the requirements for a compliant 
> pauth_v2.

What if we leave the original two registers, pauth_[cd]mask, in org.gnu.gdb.aarch64.pauth 
and move the new *_high registers into a different feature?  That would maximize the set 
of gdb version for which the original user-only support is functional.


r~


