Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 645E043855E
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Oct 2021 22:49:17 +0200 (CEST)
Received: from localhost ([::1]:39418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1meNx6-0002A1-I5
	for lists+qemu-devel@lfdr.de; Sat, 23 Oct 2021 16:49:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1meNwE-0001Lr-Jt
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 16:48:22 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:38790)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1meNwC-0003Zm-Kk
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 16:48:22 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 o4-20020a17090a3d4400b001a1c8344c3fso6195927pjf.3
 for <qemu-devel@nongnu.org>; Sat, 23 Oct 2021 13:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=CVs8TOl7d2uFVssPrna6Sp9LHo6D4XI/yGVWret5wMw=;
 b=zvbpHgRXSGhxNgvZB1s919bP7tHDmhsgeoJ+VkQNKMVFgpZDDU3QT5iwoxQHMHuPc+
 YVmOV5K5WNJaPXUIgbwrH+qWWnzA/SW8RMYl0L/sVk0/obRZEzzNNnl6eu3x9LDANp35
 NlCILyouVRhBuc0GtohYadX3nhmnDRwXMx/rblOClHNJMlihdnyAsuURD+3gpIkXyQiF
 mRhfISw5tBKBxCUG5g/Uhn06KGQHEoTzpa1bg4Quibjpuo6mvFPyPBCtK+7uV5e3JpgY
 7mK+IzlQwf4D3yKDUuMBfye+3yU5A8gC9+UIdCmFh46uJnBIkp9YxVvtO+aPtAZn0eAG
 8XTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CVs8TOl7d2uFVssPrna6Sp9LHo6D4XI/yGVWret5wMw=;
 b=aW/pnfRlbVmcJ7z1VHh9Z9YcZM3lJOuOU82IllLeOraLU6Z3cAYqfnZNA+zCiFNLa1
 hEJOsylNLSDEgkUT8szioA86GtL/9ZMD9kqZNNOqHwzC4659+qNutL2oPcu8Txx6/TDK
 uvc7QR5U92f3uRoUw22oq3pLQVw129PRYrjS+lmLrs0XTiQuMXg2s8Jfmfl/URb0Zk39
 T2SuVD33a7wi7/NUGFOi/HiIN4dTb/Lebram2CI0uXSbqE/D/X85E+e0WQU04bci1L3z
 3gqyRvwnnkXF+Ons6s2CjL/z0sEOX8fMUst15ZZnscbYdF1QXp1ZERFB5gjoppahFW+J
 6MuA==
X-Gm-Message-State: AOAM5317vjwXf+s6gRD9Pr1Yca7TlAaSlEJOqyRqsSKPWbb/jNkkwmjt
 B3HTp3EJm51/INzP8E1aiw6EeA==
X-Google-Smtp-Source: ABdhPJznHEaXsgGb5aTrDo0U2f9R+uPfK/6i+BtDSIr5clbQDxHzcawFBumofO1DFK6tK9+E6gkrKw==
X-Received: by 2002:a17:90a:550b:: with SMTP id
 b11mr11796791pji.187.1635022099166; 
 Sat, 23 Oct 2021 13:48:19 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id k19sm2943365pff.195.2021.10.23.13.48.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Oct 2021 13:48:18 -0700 (PDT)
Subject: Re: [PATCH 23/33] target/ppc: added the instructions LXVP and STXVP
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20211021194547.672988-1-matheus.ferst@eldorado.org.br>
 <20211021194547.672988-24-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <50f05f04-80f3-027d-bdcb-b6e8d7b39d48@linaro.org>
Date: Sat, 23 Oct 2021 13:48:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211021194547.672988-24-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.781,
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
Cc: lucas.castro@eldorado.org.br, luis.pires@eldorado.org.br, groug@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/21/21 12:45 PM, matheus.ferst@eldorado.org.br wrote:
>       if (ctx->le_mode) {
> -        gen_addr_add(ctx, ea, ea, 8);
> +        gen_addr_add(ctx, ea, ea, paired ? 24 : 8);

Still questioning the address of the fault, but the rest of it looks ok.


r~

