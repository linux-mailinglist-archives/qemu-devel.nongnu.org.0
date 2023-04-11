Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 865CA6DCF72
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 03:38:30 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pm2xX-0004bI-Ee; Mon, 10 Apr 2023 21:38:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pm2xT-0004aF-Ej
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 21:38:07 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pm2xO-0000rU-LU
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 21:38:05 -0400
Received: by mail-pj1-x1031.google.com with SMTP id g3so7671776pja.2
 for <qemu-devel@nongnu.org>; Mon, 10 Apr 2023 18:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681177080;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=j57VtIiqCiTli79FO2AilJlgNVnzDI7QoffSmGgc/s0=;
 b=DA3n+Snor9rSFQmvJdpSvQstB1Vaqo1tw57+bTXTJIAkR6UwShe3T87U5rc5TXbTKC
 qeJoL0+hFVygtRZSsvOCC0PaqTRzL8UYslok6eP0pv4aJz2hBL6L/ATJfXzTMIB/nHE9
 iizN6Do6KLvGxhk9hOaQ3Y4EHRy/MAjP7uIKoFdGOh3IY5XcY9NEngSnjmCZx3dI6vTw
 VbsU3atzkeizM2tGwffXuOMtuk0YRKe2fjq6syXI9XzEq4uVxVPK7LIJYxfap3b4yKmo
 k1mXj1C4AwC1qN7914TfxNeD+a3VbI7l8UHOvYid/hbwrcpNR+hJ3JO4IVyz2BvI0c7l
 x0NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681177080;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=j57VtIiqCiTli79FO2AilJlgNVnzDI7QoffSmGgc/s0=;
 b=Sq5rVFtGAeIqivCRbdOCTJQHpX84QJI7PIA+nCBE5BNZJshuiNMjBfZeZag9HWQDMv
 DbVlESORQMFRZ0CQB5fwNWdA+lWgLdHgtbMWVIJVgKUAdtmV6H6+bAi7BdUmS9jl5zbR
 fHybVBLkaIS/QeK3269LVbAlsdtvNIs6X5mOCStQzQho0eba95f4VIxQeRpYVnsPLrFJ
 S/sqdrojUT2Q50h0IaOgrGHO7GJT1yIx/0GVuw4ErVGdW9hPZB1WAKVNX2VtxndbIoem
 dItIWqsMPt2BdQEBx31tzsD8LYtVJCpnjVc3KA6zkS/HdxKiVi/CjAKUzk+IgNEp/HQU
 xeSw==
X-Gm-Message-State: AAQBX9eGihzi5rOMUIZKZ7jGuNJ3viFRvyRtGwEWexbqzTxDsfM1BHlC
 2Qs741iYXE9nlkQbjWP2XYFzKA==
X-Google-Smtp-Source: AKy350ZRFfBymtRAGYEauIDTeJyylAhOALe6goIcA8eoZAt0R0mutQEb7JvN9zrzXzsk4W+LvxuH/Q==
X-Received: by 2002:a17:90b:38c1:b0:246:aeee:e61c with SMTP id
 nn1-20020a17090b38c100b00246aeeee61cmr5255756pjb.11.1681177080015; 
 Mon, 10 Apr 2023 18:38:00 -0700 (PDT)
Received: from [10.1.0.142] (h146.238.133.40.static.ip.windstream.net.
 [40.133.238.146]) by smtp.gmail.com with ESMTPSA id
 q4-20020a17090ad38400b002372106a5casm6999839pju.44.2023.04.10.18.37.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Apr 2023 18:37:59 -0700 (PDT)
Message-ID: <8f0cb555-8079-4a54-d472-fb055aec779d@linaro.org>
Date: Mon, 10 Apr 2023 18:37:50 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 19/19] bsd-user: Eliminate USE_ELF_CORE_DUMP
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
Cc: jrtc27@jrtc27.com, riastradh@netbsd.org, Kyle Evans <kevans@freebsd.org>, 
 Ryo ONODERA <ryoon@netbsd.org>, Brad Smith <brad@comstyle.com>,
 reinoud@netbsd.org
References: <20230410182056.320-1-imp@bsdimp.com>
 <20230410182056.320-20-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230410182056.320-20-imp@bsdimp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.246,
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

On 4/10/23 11:20, Warner Losh wrote:
> It's enabled on all platforms (even in the fork), so we can remove it
> from here.
> 
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/arm/target_arch_elf.h    | 1 -
>   bsd-user/elfcore.c                | 3 ---
>   bsd-user/elfload.c                | 5 -----
>   bsd-user/i386/target_arch_elf.h   | 1 -
>   bsd-user/x86_64/target_arch_elf.h | 1 -
>   5 files changed, 11 deletions(-)

Thanks,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

