Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AAC943857F
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Oct 2021 23:04:55 +0200 (CEST)
Received: from localhost ([::1]:54366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1meOCE-0004lK-CL
	for lists+qemu-devel@lfdr.de; Sat, 23 Oct 2021 17:04:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1meOBM-0003wm-PM
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 17:04:00 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:40732)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1meOBJ-0006lP-MZ
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 17:04:00 -0400
Received: by mail-pl1-x62a.google.com with SMTP id v20so5180110plo.7
 for <qemu-devel@nongnu.org>; Sat, 23 Oct 2021 14:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=XOrS9iahlvDL0lLCLmlQ8/7S3qSRUFeNWg2fUXnoLjQ=;
 b=zdGaf3VG1/EBzf+5vD08/Lm7Sc14zwMzAidV2cttv2Bs/GZYUeClcxbdldgppZF5xF
 u8YLh6Hu3wXW+2dLWeGXut62eukeWMjzly0DEjYjkO2pzkrzoLNBCnzWYKAPInxlatIa
 KJ4HY2naJBFMAgJ6JeoudhlPB6sIpj2gZKVR7BD3sr/BfsIa7NcjZgA/Lh3nQOMniI53
 pIy5673Eio+C7j+WKtFZxS2m3hkPbE9zc4rzPFCjJpFNvR9EwRap9OJG6BGrlOn7jQGz
 5jOX4Xy5TPSIrYx9n/6ZgZFkXcT7OxPaCVwn73OKeJdyXg04P7r3fHVS3DcDhzotA/zo
 P9kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XOrS9iahlvDL0lLCLmlQ8/7S3qSRUFeNWg2fUXnoLjQ=;
 b=KMhDh+qAVgZuuD6dodrTHxcxJvpg3TIsZk9rR47Njfp1f0OkOL8PRl4GpHmNkeUsDO
 uAbD0113NBKp8FT5SrWyCCji4/my9/wERxz0rw9nuDQyy0o3/a62rmXoJPxAKIoPYXsu
 POFq7p3szy22uxbjsoDnzyFem3NuJpv/ylQn+E/h619dGbv4lMAmG2mAXLQUhw5W3dTV
 QydgwoH0eLxa7VAHXktjxTRBLijs2HxSiqhwLbPqHMF20w/9FIJX/4l052Rk+HcdEry3
 Jy+vWoAl7fHdAziYyuqElwlITV1kqVtyAVXYHNxYU0/qVvJhlMxjPcpmVK2NRpRuUpva
 mxow==
X-Gm-Message-State: AOAM532Wyw+/gnybQxRgQ/Z/t+C21S7S0z6B/nvGyudBK+zqm2Hkpyn7
 cCybShMTL+cusIvKArSurZNvfA==
X-Google-Smtp-Source: ABdhPJwWL0Cx7V5IELZvD+ZZ9qH+bl6lBQJREuZP/PoNWOK7Lrrmo54rMc3HZ7p4rrIZtoYqQfbrig==
X-Received: by 2002:a17:902:c943:b0:140:2ba6:f7ec with SMTP id
 i3-20020a170902c94300b001402ba6f7ecmr6026623pla.72.1635023035971; 
 Sat, 23 Oct 2021 14:03:55 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id u5sm15113122pfg.211.2021.10.23.14.03.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Oct 2021 14:03:55 -0700 (PDT)
Subject: Re: [PATCH 27/33] target/ppc: moved XXSPLTW to using decodetree
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20211021194547.672988-1-matheus.ferst@eldorado.org.br>
 <20211021194547.672988-28-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1f935760-2a49-0111-2ebb-fdb8439ab25a@linaro.org>
Date: Sat, 23 Oct 2021 14:03:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211021194547.672988-28-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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
Cc: lucas.castro@eldorado.org.br,
 "Bruno Larsen \(billionai\)" <bruno.larsen@eldorado.org.br>,
 luis.pires@eldorado.org.br, groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/21/21 12:45 PM, matheus.ferst@eldorado.org.br wrote:
> From: "Bruno Larsen (billionai)"<bruno.larsen@eldorado.org.br>
> 
> Changed the function that handles XXSPLTW emulation to using decodetree,
> but still using the same logic.
> 
> Signed-off-by: Bruno Larsen (billionai)<bruno.larsen@eldorado.org.br>
> Signed-off-by: Matheus Ferst<matheus.ferst@eldorado.org.br>
> ---
>   target/ppc/insn32.decode            |  9 +++++++++
>   target/ppc/translate/vsx-impl.c.inc | 17 ++++++-----------
>   target/ppc/translate/vsx-ops.c.inc  |  1 -
>   3 files changed, 15 insertions(+), 12 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

