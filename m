Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4587D2DC607
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 19:18:57 +0100 (CET)
Received: from localhost ([::1]:51938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpbO4-0002tM-BW
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 13:18:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpbMX-0001y1-DI
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 13:17:21 -0500
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235]:46671)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpbMT-00087o-La
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 13:17:21 -0500
Received: by mail-oi1-x235.google.com with SMTP id q205so15805064oig.13
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 10:17:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=iboqR0JaPJP45sAncPXuHIElZaKRfos8itZu0T6CBvA=;
 b=WrrQ8tj18Nv7B9Xc/GWTud6bHAn5FMjcWSCVX79phHDQ8XUlKYcMm/sIQsFpfzttAC
 wGqTj734ZgSf0n7yQX2iiZnRioROq8Mee+dlvlsiAHWsCM0+rRNDfzBreXKPxATNCKaM
 EWJkdZrBhOzn3TIYFdLaV0OfUibebC9O/BwJCoJlOYXD5axs3JEu/F81+sRXNisLx4aB
 uVzyP+jNVF6GQG0qUaAmlx7wCaMsLzSbptwR/QNSnnVX9RX42fnH4TWqgUzw/9cHvEsi
 BbAt23PEFzTum8IvxCPTeAq3xE0MEbsQjWAY9gITKz+T5IFYACBDxovgkXCKYNGtgSnj
 vVoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iboqR0JaPJP45sAncPXuHIElZaKRfos8itZu0T6CBvA=;
 b=j4IDC+3H7irUeUmPly3xQpZnj5LYoTxDjeK8mDh2I1D1iZ5PC2s3bhosn5Jm/z9627
 geycuR2rt72fWu4hLuqgjYBPNjF7jm7WeZPZLdW//l/OXWI72QOxJenGkV1jKnRgIHdq
 JtBhkg3APS93/9weS0TaF1pbUk48SqJAvfRTBAwfb/HFGEbfUZ4GPPI9SiHTVmpACwZb
 Flj5zSwWytTR1uF6ozXqT8n+dQAL6NjRPCB5YfaMAlhDE5Mx+hPmT1qPuoZNk18XKKQi
 m4rSZL9eF1IW27EKXuYXYK6ksJ/QZiKBl34lbYVX35D9WEvuvm+pbSyJLcpr+UCmEmUf
 mBNQ==
X-Gm-Message-State: AOAM533rYZm1FASBGjnyLOFQFD6HwNSGe0b2h1tLGvievukiYVmmz316
 y/Qzqasp1Rq/CRlLVpC1olN/Xg==
X-Google-Smtp-Source: ABdhPJwM85Z+ltoEPp2eFfC729jPPKd60VskZHaoLkcsjmhw0KBDEJsZbl95roST6+YVI913HV/1MA==
X-Received: by 2002:aca:f44f:: with SMTP id s76mr2814799oih.120.1608142636442; 
 Wed, 16 Dec 2020 10:17:16 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id c6sm553794oif.48.2020.12.16.10.17.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Dec 2020 10:17:15 -0800 (PST)
Subject: Re: [RFC v2 13/15] target/riscv: rvb: address calculation
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20201216020150.3157-1-frank.chang@sifive.com>
 <20201216020150.3157-14-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a3adee95-25a8-adfa-dc35-22b3aed5d9c5@linaro.org>
Date: Wed, 16 Dec 2020 12:17:12 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201216020150.3157-14-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::235;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x235.google.com
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
>  target/riscv/insn32.decode              |  3 +++
>  target/riscv/insn_trans/trans_rvb.c.inc | 23 ++++++++++++++++++
>  target/riscv/translate.c                | 32 +++++++++++++++++++++++++
>  4 files changed, 61 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

