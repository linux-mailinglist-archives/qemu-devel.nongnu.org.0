Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC15B2DC68C
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 19:33:26 +0100 (CET)
Received: from localhost ([::1]:56066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpbc5-0008Rk-On
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 13:33:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpbZd-00073O-4a
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 13:30:53 -0500
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236]:37339)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpbZZ-0001ZS-1g
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 13:30:52 -0500
Received: by mail-oi1-x236.google.com with SMTP id l207so28638783oib.4
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 10:30:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=edvCumAF1YT2/zB80ax6vbZoo4BbP6LxNmFIFOvMYLQ=;
 b=A91IzgyrnhTtAioexEykevWKrwTTpnRP4X6vBJY8ZjYC5xc0/QxoGjxkrbrw7rrLuL
 3OLAOt3wOz605D6g3ogqouWHJFIXN+8HWz+J97gr1VxVsdXsnZ585lxj0owC+j/OnimO
 kX82sj47Mo07V7BWuY+3qb/+wLP8vAxIEgd+0/3LLXimAe9Id4kF0491GfnT5Oy/h+oX
 8/dv9fpYsUTOt6dchHUcVBJxPXwD2sNeF6d1lvi6AGgY78yMFnBrA6WJp2w5zRe7+D0I
 klotvlza/WBByVCQ9q72o5BeXAW8coO1+x1izfV+Z86T+/E6LRpsOxuUXMbCMvM49Lrl
 qujQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=edvCumAF1YT2/zB80ax6vbZoo4BbP6LxNmFIFOvMYLQ=;
 b=gXq4o7wRG3U3FCUnvu6kYUswtpivt8zK5LBk44gRrWnzKz9Xn7Nf4tdXvl6MO+oQEb
 lgGMN8mBN4cR5Mw2N3/QBksGs1HyrSHMkrryW/Afy7h1g6Vv1IXimSxMJrK6LDa4puek
 AkKM2EQZWFzf0CB5ec3M+FOpwfAmcqGMtWYbtlJcTBYm6ag3iPmpunErImfhaZBEdGLx
 wH8nvzc2Cjbk32rxGkjYSimfzxs3q7rcan+HiRyIyMMvzGcg45D2ApSOa+HIRtTttday
 E0O92QKeO8pKCOdUr/DnCbywA5zrgIi8NEj1r/JhgknnwB78Hon0C5N0u6flFZCY1IXc
 JqHQ==
X-Gm-Message-State: AOAM533l89lSTcj453G9lA38Z72BP+idc7KTC0hZnH7ESzprhzhxBiSz
 XvCf0/JVzYB78e6UdBXhmCX2gw==
X-Google-Smtp-Source: ABdhPJzgyGh7NtgvKGItysLJjnvElpxCFGI3ijf0oxJkRXav2uAkMOSvEBRgZmOmypT7XR7+s34meQ==
X-Received: by 2002:aca:f15:: with SMTP id 21mr2848438oip.109.1608143447733;
 Wed, 16 Dec 2020 10:30:47 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id v92sm606495otb.75.2020.12.16.10.30.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Dec 2020 10:30:47 -0800 (PST)
Subject: Re: [RFC v2 14/15] target/riscv: rvb: add/sub with postfix zero-extend
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20201216020150.3157-1-frank.chang@sifive.com>
 <20201216020150.3157-15-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ce40b96a-0aaa-d5e6-5136-0c56ccd37073@linaro.org>
Date: Wed, 16 Dec 2020 12:30:33 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201216020150.3157-15-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::236;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x236.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Kito Cheng <kito.cheng@sifive.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/15/20 8:01 PM, frank.chang@sifive.com wrote:
> From: Kito Cheng <kito.cheng@sifive.com>
> 
> Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> ---
>  target/riscv/insn32-64.decode           |  3 +++
>  target/riscv/insn_trans/trans_rvb.c.inc | 22 ++++++++++++++++++++++
>  target/riscv/translate.c                |  6 ++++++
>  3 files changed, 31 insertions(+)

Subject should be add/slli as there is no sub.
Otherwise,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

