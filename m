Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A48B58911B
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Aug 2022 19:17:50 +0200 (CEST)
Received: from localhost ([::1]:51352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJI0C-0003Sd-IE
	for lists+qemu-devel@lfdr.de; Wed, 03 Aug 2022 13:17:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oJHvQ-0000af-Hh
 for qemu-devel@nongnu.org; Wed, 03 Aug 2022 13:12:53 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:45602)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oJHvN-000382-OU
 for qemu-devel@nongnu.org; Wed, 03 Aug 2022 13:12:52 -0400
Received: by mail-pl1-x636.google.com with SMTP id w7so16957943ply.12
 for <qemu-devel@nongnu.org>; Wed, 03 Aug 2022 10:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=i/EgaXNgMwjgxQNPpYsePW57Ru4t30/MgfIOovzV/X0=;
 b=wda7PO0cxpjJk/PiKrzFoPSLKVY/o1XWFqni6FKTSmRU2S8F/qpRvRHfu/YvPcc54M
 EkKCA/6cTiMzvE+I/uSA0YwdeRSnCsveIP9FiXM7KENb5llQBdM4CbQisRu4sSn29uBg
 9Yy9CY/n9uYLG8/bSo0+n7u2uSdeJHUr9vBsVL/+soxBL1Sc0f3rg1GJqY9c/2JvjOKh
 7g0SFa/1uJvufC9bMTNcPJ9jRo7m4fKQLrasKPKzvWp+/LMJPE0qOvBcwajl9A0KCsXL
 vmLg47UWWM7wj5ByDYrNGIHLr63H/b8C6F7w9Dd5qmQRZN7yfBRTriZgZ53DIBLRlZip
 9ePQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=i/EgaXNgMwjgxQNPpYsePW57Ru4t30/MgfIOovzV/X0=;
 b=KS+xGu4vvWxl2vNwX4FidQdDb8OUKdyAu21oJnV3BSp/ezhpN8et/E/UzOBC9hsK5w
 tcT0YUrt+yc4bmdPW9cGgqs5CEbvemNQrkGPlZRR2FKWY0k7ZK1ixiDOcKSVmkzuisHJ
 Cls8rGYb2xDYoxuXOElWeLzrDo57JcPlMUH8BkuSBQS278lE/wivLQDVNy5XWslC6fJN
 o5xYzr+7r1HP5s4sUfwmCpT4m3CFyU1ryeeb5IEkupkQ/T4NorrXxsMKBHkQNId7tkFe
 bnW2EtVvZWTqYfDjGC0L+MpMlCUR25sNxYdocsFPoMT/LtfnBFgsc+r7Zr7SkGG1TcWX
 s0ZA==
X-Gm-Message-State: ACgBeo1tQsdTa6TAl5nFXZ//DfUHAYnQfCBABXRmiApAQRxnA1Sck9N/
 5WhjYCSwWirV4g6SLxHRqrFUvw==
X-Google-Smtp-Source: AA6agR7kLSAFO1htWSD6ym1B+wSsmuRGBpRajoTzVJrSUr0sYPXPpSqfrKUBHKjn6anA5OdtiA73Jw==
X-Received: by 2002:a17:90a:fe10:b0:1f3:1de7:fe1b with SMTP id
 ck16-20020a17090afe1000b001f31de7fe1bmr5706318pjb.189.1659546768062; 
 Wed, 03 Aug 2022 10:12:48 -0700 (PDT)
Received: from ?IPV6:2602:ae:154e:e201:74df:dfaf:5af0:e528?
 ([2602:ae:154e:e201:74df:dfaf:5af0:e528])
 by smtp.gmail.com with ESMTPSA id
 c3-20020a656743000000b004161e62a3a5sm11220400pgu.78.2022.08.03.10.12.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Aug 2022 10:12:47 -0700 (PDT)
Message-ID: <136edac0-5f17-f067-c3e6-b484f977043a@linaro.org>
Date: Wed, 3 Aug 2022 10:12:45 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PULL 0/3] Linux user for 7.1 patches
Content-Language: en-US
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20220803145613.428167-1-laurent@vivier.eu>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220803145613.428167-1-laurent@vivier.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/3/22 07:56, Laurent Vivier wrote:
> The following changes since commit 3e4abe2c92964aadd35344a635b0f32cb487fd5c:
> 
>    Merge tag 'pull-block-2022-07-27' of https://gitlab.com/vsementsov/qemu into staging (2022-07-27 20:10:15 -0700)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/laurent_vivier/qemu.git tags/linux-user-for-7.1-pull-request
> 
> for you to fetch changes up to 5b63de6b54add51822db3c89325c6fc05534a54c:
> 
>    linux-user: Use memfd for open syscall emulation (2022-08-02 15:44:27 +0200)
> 
> ----------------------------------------------------------------
> Pull request linux-user 20220803

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~


> 
> ----------------------------------------------------------------
> 
> Ilya Leoshkevich (1):
>    linux-user: Do not treat madvise()'s advice as a bitmask
> 
> Peter Maydell (1):
>    linux-user/flatload.c: Fix setting of image_info::end_code
> 
> Rainer Müller (1):
>    linux-user: Use memfd for open syscall emulation
> 
>   linux-user/flatload.c |  2 +-
>   linux-user/mmap.c     |  2 +-
>   linux-user/syscall.c  | 22 ++++++++++++++--------
>   3 files changed, 16 insertions(+), 10 deletions(-)
> 


