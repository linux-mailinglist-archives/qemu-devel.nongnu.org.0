Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4253E3210AD
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 07:06:18 +0100 (CET)
Received: from localhost ([::1]:57816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lE4ML-0006P1-Am
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 01:06:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lE4Ku-0005G0-KC
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 01:04:48 -0500
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:46939)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lE4Kr-0007vu-P1
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 01:04:48 -0500
Received: by mail-pf1-x42b.google.com with SMTP id k13so5924610pfh.13
 for <qemu-devel@nongnu.org>; Sun, 21 Feb 2021 22:04:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=JEo4edKN7wHsRTDxCEyoKIiAyPkejBSTksisITKzUOE=;
 b=S1L6bZfo8+VT2cMwO98JyNNOHcd+jqMNoTPF/na+Lvj4IiV1xK1xxUt/qYBypBg/2p
 bGq3LkPl8k/lFgQBxI1qtVSPNbo1mGH7MDYRQcC99pGDc1UJqCdofVv0bookwIzugj5v
 1gUQytUKSrPVSoraGy/FnufgZ94NY5ng2Et7XMN45gflalGA8+cXKuAB3mPx9bYH3gTW
 DCL9WLe2gDp+bMrIMseBEQjYWjbsys0+9U7wVM9e3+2lrTZlBfADnWkglLP6QLYmphPT
 YIczuv6S2aVzVvV9UPeUP6s2wZEdC5TbN7lmCQXMlD9VBL5FIrTeOyitgwB8AnoMW0y7
 YcFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JEo4edKN7wHsRTDxCEyoKIiAyPkejBSTksisITKzUOE=;
 b=nNL4QAUF9ISCPfWczhokkje2gfhhYz339GzD2K/qkkUcLn39/WWqCgcRg/ExOKs+dP
 7Djo+VvEkShPhyZCXy2DRXbI5T9BVE60jczBbv0ux3VshAld/ilFzm2Q3Ci6ApQ9R4nE
 /UvrvguqQmORP2lubIZJq3a9Bj25zRkTcCvQWDY5T9IFZmaIO2WMGjEov/vTiXZ+R4W2
 i3f6H+Bupy16EPYu7k7l9z1yvJp7scSCadM4Mb+nP4W/83ZucjAFrnZ9USuU+5hSfAlX
 ZLGqzMnzP88kJw2YcSehYfF6gfWWZm5kZGVvBZ8dvqEw5RhOtjO4GJxFWqWpM8yjV3a0
 tJGQ==
X-Gm-Message-State: AOAM533uZ70EUTx8uJ76CBOKz5HaXXZmreda8C6cJYPMS1JI4fF4QKyp
 gYxi1iVpBpptEbqE46yPW2Jo+TLI4XUcdg==
X-Google-Smtp-Source: ABdhPJwZcN2DdqNqPdAO1zBssmXVxLthHseu55tLjg5tekZko/gWdUDhUbv91OhX22YJd56xboKz/w==
X-Received: by 2002:a65:53ca:: with SMTP id z10mr18613305pgr.271.1613973884357; 
 Sun, 21 Feb 2021 22:04:44 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id i16sm16188805pgv.60.2021.02.21.22.04.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 21 Feb 2021 22:04:43 -0800 (PST)
Subject: Re: [RFC v1 25/38] target/arm: move fp_exception_el outside of tcg
 helpers
To: Claudio Fontana <cfontana@suse.de>
References: <20210221092449.7545-1-cfontana@suse.de>
 <20210221092449.7545-26-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c1e2c963-f231-44df-2d61-b946f40e5f2c@linaro.org>
Date: Sun, 21 Feb 2021 22:04:42 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210221092449.7545-26-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/21/21 1:24 AM, Claudio Fontana wrote:
> From: Claudio Fontana <cfontana@centriq4.arch.suse.de>
> 
> it is needed also for KVM.
> 
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> ---
>  target/arm/cpu-softmmu.c        | 95 +++++++++++++++++++++++++++++++++
>  target/arm/cpu-user.c           |  9 ++++
>  target/arm/tcg/softmmu/helper.c | 92 -------------------------------
>  target/arm/tcg/user/helper.c    |  8 ---
>  4 files changed, 104 insertions(+), 100 deletions(-)

This is related to rebuild_hflags, I assume.
Fix that and this isn't needed.


r~

