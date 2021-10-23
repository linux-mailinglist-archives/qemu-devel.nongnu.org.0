Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D3654381EA
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Oct 2021 06:54:33 +0200 (CEST)
Received: from localhost ([::1]:51718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1me93A-0003TP-J9
	for lists+qemu-devel@lfdr.de; Sat, 23 Oct 2021 00:54:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1me91u-00027R-AQ
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 00:53:14 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:43580)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1me91s-0006iH-Ow
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 00:53:14 -0400
Received: by mail-pl1-x62f.google.com with SMTP id y1so4121715plk.10
 for <qemu-devel@nongnu.org>; Fri, 22 Oct 2021 21:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=k9sMBO4zmDNbySLwOsXjOy2WgF4JSmYQyS947gxI4Xc=;
 b=FW7NqdJfffYRxypvbnGGfpL1zzacxXJkDwDfqtVtGSbtFed+ji3OQMWNi7bQD9OHCh
 5qbtQKzuHPcRxstZ9YbDcQfm7fnTn4UtB9gX1xqkFCupDolQ8bkyQa11hK22KTJs0Z48
 DOQUQPwfa9BCMUYKfY3Zokcm6jnkdWdvzyy2r0QO0ktZNFxcPa5I2Ev7jsSgE9WSTefc
 /smd30eE0/wpiGfqPJae/8za2mqxirMrPFTsYnjrC3GFo01bUsqGBd33iPl6h4tpmKPb
 EF9Ci2M0Nass/LXafEVYUAAOd3HzX1isxXC+UPrULzlB65HGNU1T77QhxzzwGhnzfqEs
 ERzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=k9sMBO4zmDNbySLwOsXjOy2WgF4JSmYQyS947gxI4Xc=;
 b=qMYnt+vBelTvhdn43qHLtwlzCZ5hW2Y63FL2jjxFmBrQ0L/6YFIZkyOM572Jm0vhGY
 jca4x4C5ES6yY+1AP9CVzCPMYKv1DDpT/5UEfHVmQQuv3sYawy1Fkx+CvPoCR8iznQVs
 hN/3mjSZ9kqDuLF9tycBgXVqwndNtC2Er7F0X4U1sE4p1ov+K2GtDIDIXDTvFagZM5kW
 zJN51vXe+rUCooYN9S8pN4NdQC/Wc18KheVgJgpKqEbn2Dx5PP3hqqiQKu6nvN1EucQS
 NgicDIDX7jDThCkbk3+PpqzUVLBw8qzLK2bJJdWMr0LIe7APs7Is2OKc4GVfW95j2fSf
 eQOQ==
X-Gm-Message-State: AOAM532WMdzxWgGPXHIqbs18P2gP7pczlbj6QxcBa/BOutXp0n+/e3QP
 /sF+A0ZCnOQyXU1+Y/m4jlRIAw==
X-Google-Smtp-Source: ABdhPJy0jqax+eRCtYVgLpPyfxKKGqH7zYDhTxMSBauVPdAq45OCFTrqED5NaNo1kF6Ez1swWVThRw==
X-Received: by 2002:a17:90a:a8f:: with SMTP id
 15mr4395234pjw.229.1634964790954; 
 Fri, 22 Oct 2021 21:53:10 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id j1sm31884pfj.155.2021.10.22.21.53.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Oct 2021 21:53:10 -0700 (PDT)
Subject: Re: [PATCH 18/33] target/ppc: Move
 vinsertb/vinserth/vinsertw/vinsertd to decodetree
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20211021194547.672988-1-matheus.ferst@eldorado.org.br>
 <20211021194547.672988-19-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7df523dd-ef96-cbb4-afec-18e6ac80176a@linaro.org>
Date: Fri, 22 Oct 2021 21:53:09 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211021194547.672988-19-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.742,
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
Cc: lucas.castro@eldorado.org.br, luis.pires@eldorado.org.br, groug@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/21/21 12:45 PM, matheus.ferst@eldorado.org.br wrote:
> From: Matheus Ferst<matheus.ferst@eldorado.org.br>
> 
> Signed-off-by: Matheus Ferst<matheus.ferst@eldorado.org.br>
> ---
>   target/ppc/helper.h                 |  4 ----
>   target/ppc/insn32.decode            |  5 +++++
>   target/ppc/int_helper.c             | 21 -------------------
>   target/ppc/translate/vmx-impl.c.inc | 32 ++++++++++++++++++++---------
>   target/ppc/translate/vmx-ops.c.inc  | 10 +++------
>   5 files changed, 30 insertions(+), 42 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

