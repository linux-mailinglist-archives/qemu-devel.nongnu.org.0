Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D219736792E
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 07:20:54 +0200 (CEST)
Received: from localhost ([::1]:47690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZRll-0004dV-T8
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 01:20:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lZRjR-00039l-Fx
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 01:18:29 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:33410)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lZRjO-0000aO-Aj
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 01:18:29 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 kb13-20020a17090ae7cdb02901503d67f0beso2121423pjb.0
 for <qemu-devel@nongnu.org>; Wed, 21 Apr 2021 22:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=aIUBvsOjX628UahTexFBv1fZMUdBiMYMLfP6LjIZTlc=;
 b=DgwJaFmr2IeXCbBVHEXQAz8BFTeKDULh5K92uFmfjj+SCoiGnjEPZoaxPaEZPVegxg
 AYiISMPhX6Z0IIP53X7JpRrDwUrekIeomP5LKNKmOrXHUwQn6HNt17+/pR8CNDxRXRnF
 fVgWoFuXXIavZb7GOMmEjfzmpknWc6EvE10HOQCp7B0UKD5A5MoQ9OwKBIuP3HAuOsuA
 RSJzZT0H/J4c26keVy648f/mt4cmGuoNNP7/HGsbSY91v/bjqLsEz1NiErtm8LKCaZhp
 jp1gg3n0zop79+tXlH5SEW/uXWP0pNsRVxg/l507ElLlgeNo7uqby5OOL35GnJy3GRSd
 xIxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=aIUBvsOjX628UahTexFBv1fZMUdBiMYMLfP6LjIZTlc=;
 b=m9j41OpVkbY7+MAQ4TqAR2inX5aoi/euJkM5qbD//4HunxhimASFgicoiqQ85LVGZw
 SbDv2ZyBE+L5mCmtYCJQKOnrUpUR26yINi4ZobT2q1Qr9XFUT5+PUYMr06IP3oXHCBgF
 g7b6TMIZwno9dIDPZ+S3vzC8BFMltdX5dFNXTY2uB3IST9zaY9lW6emLaf6sv9ofxF3W
 47QqbL5LRdShYQN79B9BA7amKE5XSJm5mZfEMJyvoJueSFuG804oNz368+JhnhDH5dEE
 ydF/obvS4OPitFJgzy00ULT67f0Q5CIgLCjoqM/MU2EzEnDa+nNhOmT020cp7Tv0mf/c
 ei7A==
X-Gm-Message-State: AOAM532onTA8EALkUkqhTx6NUWy9ltX0Gl+5+i99qAbM2iFBnRd/heIY
 Ux4liOu2Xh5b/qEb+txV3G6vbQ2rbKFanA==
X-Google-Smtp-Source: ABdhPJztW93cXflo/BQyFgInXbtXoz9Xv32prdkBKIqKi2faQAxPiFHhOfbD6yoW+faWCQqQbGWOfg==
X-Received: by 2002:a17:90a:bd8c:: with SMTP id
 z12mr2029328pjr.83.1619068704670; 
 Wed, 21 Apr 2021 22:18:24 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id 23sm941915pgo.53.2021.04.21.22.18.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Apr 2021 22:18:24 -0700 (PDT)
Subject: Re: [PATCH] tcg/ppc: Fix building with Clang
To: Peter Maydell <peter.maydell@linaro.org>, Brad Smith <brad@comstyle.com>
References: <YH98WLDMQ5c0Zf5E@humpty.home.comstyle.com>
 <CAFEAcA995L--csz+fX4MqkSPTPxQ7Nx=q-Lh70bi_zQGoj54mw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1ebc5a66-2763-1379-24e0-774739f2edbe@linaro.org>
Date: Wed, 21 Apr 2021 22:18:22 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA995L--csz+fX4MqkSPTPxQ7Nx=q-Lh70bi_zQGoj54mw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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

On 4/21/21 2:03 AM, Peter Maydell wrote:
>> +/* Clang does not define _CALL_* */
>> +#if defined(__clang__) && defined(__ELF__) && !defined(_CALL_SYSV)
>> +#define _CALL_SYSV 1
>> +#endif
> 
> This is trying to identify the calling convention used by the OS.
> That's not purely compiler specific (ie it is not the case that
> all ELF output from clang is definitely using the calling convention
> that _CALL_SYSV implies), so settign it purely based on "this is clang
> producing ELF files" doesn't seem right.

We can get pretty close though.  There are three ppc32 calling conventions: 
AIX, DARWIN, SYSV.  The _CALL_ELF symbol is a 64-bit thing, and AIX itself 
doesn't use ELF.

> I guess if clang doesn't reliably tell us the calling convention
> maybe we should scrap the use of _CALL_SYSV and _CALL_ELF and
> use the host OS defines to guess the calling convention ?

No, I'd rely on _CALL_* first, and only fall back to something else if they're 
not present.

I'm thinking something like

#if !defined(_CALL_SYSV) && \
     !defined(_CALL_DARWIN) && \
     !defined(_CALL_AIX) && \
     !defined(_CALL_ELF)
# if defined(__APPLE__)
#  define _CALL_DARWIN
# elif defined(__ELF__) && TCG_TARGET_REG_BITS == 32
#  define _CALL_SYSV
# else
#  error "Unknown ABI"
# endif
#endif


r~

