Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2722427BD7
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Oct 2021 18:12:26 +0200 (CEST)
Received: from localhost ([::1]:53486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZExV-0002TV-QL
	for lists+qemu-devel@lfdr.de; Sat, 09 Oct 2021 12:12:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mZEoi-0002ET-CK
 for qemu-devel@nongnu.org; Sat, 09 Oct 2021 12:03:20 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:35486)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mZEog-0003OI-ST
 for qemu-devel@nongnu.org; Sat, 09 Oct 2021 12:03:20 -0400
Received: by mail-pl1-x630.google.com with SMTP id w14so8224172pll.2
 for <qemu-devel@nongnu.org>; Sat, 09 Oct 2021 09:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=n1jxJRwe8OkyQDm9wqjFiOYrVuhkPwM0T8Q6wuzlHXg=;
 b=VDXhoWe6IrShCRWHOOhDoxon3SLVxfDI8al/xyRxW0Xiry4wzLI09+Ke+ZGhj+Bkr3
 ZPA4AYPjRbWz4mA1anhe0n4acbe9Yi75W1A0F2o3zpltLy0ZQfIUpSWaCEMsVZwL11gX
 NeqLaklTa52GEL6CoVDU3ySXzFYR8RWPinjBgwrAuKckF095DpKnQ/kpy4OgJLk8Yy2B
 f2qXP2IigRALeMAMrtjpylH/gwEjuFYVWt2Em9ijP66Hx9VMOg3IdZizDc2XkfFxu6Sv
 lvjc6kh79Hg70IfSYMusSyi/AQ+R+IDjXHhRxXy3CL13/ktNs4PLI/77J1mKaY7pio8z
 yJGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=n1jxJRwe8OkyQDm9wqjFiOYrVuhkPwM0T8Q6wuzlHXg=;
 b=UX0EfmQSQBmXpnr98hT6q5PWE8+WWAgeGrIHGGInEP5ezjYsbNWPwLWjqwgb7hDAoO
 wSXTWfyLseBVbdUPuQvy/TO9FIGWF1pBR2tP73dkcyOj5kxlpJfw0LvYVfeohgLyM2oM
 X8CObVT/F/d3CBRkvaHFRTg4gXid3c3VFTOWpSfCIBDBK5Wsht0uU7I2S+3aQgURl8Im
 7y1hhs530FmbiB/c5VPlgTZO3cGYBEoU7DKE+e8grMyI6vszuExlY22FPc+YN0Rg4yBH
 U8JgOqgNcmfDyOWWqSXKXkwPEeJucdUcIO9z8PbG/E605VXhi11a8sZaQkCGj8GSAedO
 menA==
X-Gm-Message-State: AOAM531Q10a0y6saqg0+3Joib0vEoD+oMgSjEOl5FXw0iApm78FefciZ
 MEXBcV8JHaT1hQ8LaQYkQmfCBA==
X-Google-Smtp-Source: ABdhPJyB6r9qTPi8a9O7CcpabW9kOIyNYVnas2qBc/VkTvIjDmqVI1AQEcB4F5+986k1E3TQqIzDcw==
X-Received: by 2002:a17:90b:1b42:: with SMTP id
 nv2mr18732543pjb.91.1633795397291; 
 Sat, 09 Oct 2021 09:03:17 -0700 (PDT)
Received: from [172.16.83.58] (068-185-026-038.biz.spectrum.com.
 [68.185.26.38])
 by smtp.gmail.com with ESMTPSA id v2sm2492400pje.15.2021.10.09.09.03.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Oct 2021 09:03:16 -0700 (PDT)
Subject: Re: [PATCH v3 7/9] bsd-user/mmap.c: Don't mmap fd == -1 independently
 from MAP_ANON flag
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20211008212344.95537-1-imp@bsdimp.com>
 <20211008212344.95537-8-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2716e3bd-0f2f-e4fd-8e79-4770db72d180@linaro.org>
Date: Sat, 9 Oct 2021 09:03:12 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211008212344.95537-8-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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
Cc: kevans@freebsd.org, Guy Yur <guyyur@gmail.com>, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/8/21 2:23 PM, Warner Losh wrote:
> From: Guy Yur<guyyur@gmail.com>
> 
> Switch checks for !(flags & MAP_ANONYMOUS) with checks for fd != -1.
> MAP_STACK and MAP_GUARD both require fd == -1 and don't require mapping
> the fd either. Add analysis from Guy Yur detailing the different cases
> for MAP_GUARD and MAP_STACK.
> 
> Signed-off-by: Guy Yur<guyyur@gmail.com>
> [ partially merged before, finishing the job and documenting origin]
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/mmap.c | 30 +++++++++++++++++++++++++-----
>   1 file changed, 25 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

