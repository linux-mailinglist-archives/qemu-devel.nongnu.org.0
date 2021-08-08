Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E929B3E38F6
	for <lists+qemu-devel@lfdr.de>; Sun,  8 Aug 2021 07:17:13 +0200 (CEST)
Received: from localhost ([::1]:42364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mCbBQ-0004oK-Ro
	for lists+qemu-devel@lfdr.de; Sun, 08 Aug 2021 01:17:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mCb9L-0002fz-Cj
 for qemu-devel@nongnu.org; Sun, 08 Aug 2021 01:15:03 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:36764)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mCb9J-0000Gd-VM
 for qemu-devel@nongnu.org; Sun, 08 Aug 2021 01:15:03 -0400
Received: by mail-pl1-x632.google.com with SMTP id f3so2238950plg.3
 for <qemu-devel@nongnu.org>; Sat, 07 Aug 2021 22:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+GoXYfxWrlXRpd3kPEDvvJt0Sn3tZ7cFXXe4OTb/RHU=;
 b=OL05fYRpUuH7/c+Ff2JG6+tQBvn0/d40OYBVxB7GSya2z3zf9G2h65MK7wTY5Y5uK9
 BXfmgbNv8Zij6gvDL62E1k2LMfuNMa1vZh8Dpp2jmSsxWF7ytrJpLIdN8I9wgazHd12s
 hbVxYASN9AD3yUhwXVB47irv9ZXv3HCJwAJV63y/WDG8GLO5nxI55uyg3bEoo9VMYjih
 qrErFErPA3H9m2Q39MOHTn1jkUL6Ko3nr3++u1MX8jIQai6lSBdnjNbzA+04GHVWTNJU
 bGCm92BZqveFebB5kN0eBiGgJ91o9LeWY12avln/rRAnzwIXt1CCpZHyckkh1/Kjsoji
 4sYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+GoXYfxWrlXRpd3kPEDvvJt0Sn3tZ7cFXXe4OTb/RHU=;
 b=HzWX16Fi0id3QqkNNHIyAg29qJlgH8PE9nPj4fLdlsvGte3zfnhUCMHqsYTk6weEc+
 yLXN72d/MA8VedCBUZGOiJc2w89+RInvBt3MP1ZuCVhEt7vkiZEvvWmeP+5ZJIf/+ZN2
 3Bmv7L/6znq59hW3sB2PdrGZg0Q5frpARUbkIDidKSxY7oya8/sQfohRCfl3J9YLomTI
 m5bkP6f3b8I3cAtAadku7yeHJpOuGSCzpuCSdDrKWJDUer+rKqH4FGwQYevg1rNYPv5+
 RNwXyTo5Myf2JDPu7EC2SShaP87wiJm6vBkZMrwNJUZeWcy7Yk1xCDahxsjSCP+rWX06
 AkMA==
X-Gm-Message-State: AOAM532E2qL1ZP2aaMdt/q+crQW/PkYNznv5thvPSukUaA3ghbWgQhxm
 TTtMgMCEakFT0dvlr2nye3Xz5r3zIjg6wA==
X-Google-Smtp-Source: ABdhPJw3jv9J8rNIvUImfcpO+XzRvL6qvHkeKfxBkEmKQOyZEP6ezLtEXmtxYtVXe+Ia1rG6F4qi2w==
X-Received: by 2002:a63:3113:: with SMTP id x19mr306974pgx.260.1628399700077; 
 Sat, 07 Aug 2021 22:15:00 -0700 (PDT)
Received: from [192.168.6.169] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id x13sm14070271pjh.30.2021.08.07.22.14.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 Aug 2021 22:14:59 -0700 (PDT)
Subject: Re: [PATCH for 6.2 14/49] bsd-user: remove a.out support
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20210807214242.82385-1-imp@bsdimp.com>
 <20210807214242.82385-15-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <831e40a0-5149-9786-93d1-9d9864768756@linaro.org>
Date: Sat, 7 Aug 2021 19:14:57 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210807214242.82385-15-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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
Cc: kevans@freebsd.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/7/21 11:42 AM, Warner Losh wrote:
> Remove still-born a.out support. The BSDs switched from a.out to ELF 20+ years
> ago. It's out of scope for bsd-user, and what little support there was would
> simply wind up at a not-implemented message. Simplify the whole mess by removing
> it entirely. Should future support be required, it would be better to start from
> scratch.
> 
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/bsdload.c |   9 +---
>   bsd-user/elfload.c | 105 ++++++++-------------------------------------
>   bsd-user/qemu.h    |   2 +-
>   3 files changed, 21 insertions(+), 95 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

