Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 114915F5601
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Oct 2022 15:59:45 +0200 (CEST)
Received: from localhost ([::1]:33922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1og4w4-0003Ap-3W
	for lists+qemu-devel@lfdr.de; Wed, 05 Oct 2022 09:59:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1og4ns-0003EJ-67
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 09:51:16 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:33524)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1og4np-0000hi-8v
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 09:51:15 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 bu5-20020a17090aee4500b00202e9ca2182so3267858pjb.0
 for <qemu-devel@nongnu.org>; Wed, 05 Oct 2022 06:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=wFXWFACmVpmt/IpIlA1qGo1vRUFfnZcNTIw6ayDIrZM=;
 b=a4ez28dWShXp2iXkmdZDjfsoS3tFR8+stt4ls7j5HnIxhC6DmbnDMngIvLGqNTHUm3
 bvx0Rcew9hxEAQaW751NX/YykKqqDMectfHAe/GtXpSZKerAblxIWr+h+GIAzNi3S45/
 mh4WY2dfZ0diH0MZxKN6eIGObBsyd5xBkZTlHPk10mPolJk9JdTkl9EDhCchF/jz1Zk/
 ykDaD59uMsZ1+jq6hlWyufkTohc7AMg0FEA7lX32Sg5fNFV4HnsrKayyttPuyi2cyOlF
 GXdVZgw5HYZCjb8PIGD5h52tiC3uZZLdBUSSNPHndXyTVDClvP3WO1bppK90a/UVqC8j
 T/2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=wFXWFACmVpmt/IpIlA1qGo1vRUFfnZcNTIw6ayDIrZM=;
 b=2J8MWFzHb/Lt/OzAg+ewU6u+GcbHmFifD6e1lQPVwTVbi6aCGuzG6DIl4nVd+AIhXD
 1KMBAHgguXy53wahLwh76fsMSWDLi1qyl7K3JZrmWjJ3bNMp3CJnlAiNNC9aK1dQhSpl
 ezDRZ3nO4yR3XLyzh2xwUG+CVEwo/1IMip3ubcWnlJqpwZGA3NQkHVVxy9f0+YIWoUpO
 l1BDlZmFA//99//5ncnwiPgli3bhpV8w5YrwkdbYpiPqWBZv5ZNESDUkhYPB4dRsmwQE
 5yoaI9eunQdo6BsvpIijdlt7H7ecY8P6q/LBaNk/40MRUFDBm+A4AQdoSUFD4mHEUAJV
 2ibw==
X-Gm-Message-State: ACrzQf1KwGg21OjmmXYsX4ERph4ySva3u8RyPMMpsecMx3C/ZTIJ+7yr
 AJNUQNxRIZw7561JcKaf1Eg2mg==
X-Google-Smtp-Source: AMsMyM7zDEPjFeZx4SXag/QcpOBuPuaV6RZ850A1iHQEWdhEfbVCrYN0AxTMbCSGjChpDN9isezrZQ==
X-Received: by 2002:a17:902:cf11:b0:178:29d7:4fbd with SMTP id
 i17-20020a170902cf1100b0017829d74fbdmr32403769plg.174.1664977871575; 
 Wed, 05 Oct 2022 06:51:11 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:9ad0:4307:7d39:bb61?
 ([2602:47:d49d:ec01:9ad0:4307:7d39:bb61])
 by smtp.gmail.com with ESMTPSA id
 d8-20020a621d08000000b005623b769b50sm1127789pfd.202.2022.10.05.06.51.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Oct 2022 06:51:10 -0700 (PDT)
Message-ID: <8682898c-4331-1e4f-9a1b-fed129817354@linaro.org>
Date: Wed, 5 Oct 2022 06:51:08 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] target/ppc: Fix xvcmp* clearing FI bit
Content-Language: en-US
To: =?UTF-8?Q?V=c3=adctor_Colombo?= <victor.colombo@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, matheus.ferst@eldorado.org.br, lucas.araujo@eldorado.org.br,
 leandro.lupori@eldorado.org.br, lucas.coutinho@eldorado.org.br
References: <20221005121551.27957-1-victor.colombo@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221005121551.27957-1-victor.colombo@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.435,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/5/22 05:15, Víctor Colombo wrote:
> Vector instructions in general are not supposed to change the FI bit.
> However, xvcmp* instructions are calling gen_helper_float_check_status,
> which is leading to a cleared FI flag where it should be kept
> unchanged.
> As helper_float_check_status only affects inexact, overflow and
> underflow, and the xvcmp* instructions don't change these flags, this
> issue can be fixed by removing the call to helper_float_check_status.
> By doing this, the FI bit in FPSCR will be preserved as expected.
> 
> Fixes: 00084a25adf ("target/ppc: introduce separate VSX_CMP macro for xvcmp* instructions")
> Signed-off-by: Víctor Colombo<victor.colombo@eldorado.org.br>
> ---
>   target/ppc/translate/vsx-impl.c.inc | 1 -
>   1 file changed, 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

