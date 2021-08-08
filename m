Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 672DA3E38F0
	for <lists+qemu-devel@lfdr.de>; Sun,  8 Aug 2021 07:13:34 +0200 (CEST)
Received: from localhost ([::1]:38134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mCb7t-0001sb-Gn
	for lists+qemu-devel@lfdr.de; Sun, 08 Aug 2021 01:13:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mCb7D-0001Cg-5t
 for qemu-devel@nongnu.org; Sun, 08 Aug 2021 01:12:51 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:38781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mCb7B-0006lS-Qg
 for qemu-devel@nongnu.org; Sun, 08 Aug 2021 01:12:50 -0400
Received: by mail-pl1-x633.google.com with SMTP id bh7so4051116plb.5
 for <qemu-devel@nongnu.org>; Sat, 07 Aug 2021 22:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=nZgLxPiifO6PO24gpqLRcCzyjDy3o72JoXBc87yV7R4=;
 b=qbBm4aJ3WZzEEn+yfRjJQAYM8JdJOQPk9eISX+STJEpfVh9SjkxZE+Gk7MmoGXWPMR
 nKQBm9bOElvoAJSTHMnVQMsLXyUopwerj3Bo9OKww+Tw4twLTWTafEcX1SGHzQ2+r+bI
 6GAPjjl0OPpoc8ctIJ+ddt8Cc/Uekh63Cno/V/zCWo04ojSn19ASRM4jXESPTy5zH9mt
 WSadxCGcobeHEEJ/eK/RRqMfSWbJQcHq9AmqotCtqYcOQOuOzqWSVvv4llsAiZ9tBdxE
 DtvuEhUWs5wzJ/igVVeiRAgNSNUx2b5HeB1Hy4iewfWt35+wQK4rFspeWkx+tRs0cosl
 t6vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nZgLxPiifO6PO24gpqLRcCzyjDy3o72JoXBc87yV7R4=;
 b=Oxst9RUIHewbbPx1B7bSRR2KpsAVPuMrl3yIl+Ygl209Wdjs82cG3vT+aWqP3RbvoJ
 vwfw4ot/V8fJBmjBDGBpSo9KfGLidtBR1l0iX2NLwjw+5SisCRIetL3/7aCEhYloRwwI
 ZiLK1xWumItoJICGHeK39qdxtukfJKychcjgJLIPE9OeFRX9zXeNxY5RVtsum69WcUYD
 /OCnP+PAuEmlqJEsSeIJKRTdpvYaZau7/i4nbuhIf5xVHl2uO6sP2tuEfvcu4z2evqop
 TQmNPRFcirXNhWv0udCd9dPuXUvmN695yMWnMbtc0mGHPQiwktD+Zq1GJt14GXHbWoTy
 i7QQ==
X-Gm-Message-State: AOAM531dHELTsh9iyp4GmM1fT7CLb/cTbrGJbJpY8oa5s/LvgJ5lffN5
 FfNBl24V63lYOkldF/arrvrHwg==
X-Google-Smtp-Source: ABdhPJwJl9YaZs/6g63RyDhU1Eb2xLBdpTYyrzcLkuWQYxsWMosQHaskxnY3dpqtR5an3wiWxTiJ5A==
X-Received: by 2002:a17:90a:c57:: with SMTP id
 u23mr28933984pje.186.1628399568468; 
 Sat, 07 Aug 2021 22:12:48 -0700 (PDT)
Received: from [192.168.6.169] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id z18sm11322026pfn.88.2021.08.07.22.12.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 Aug 2021 22:12:48 -0700 (PDT)
Subject: Re: [PATCH for 6.2 13/49] bsd-user: Eliminate elf personality
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20210807214242.82385-1-imp@bsdimp.com>
 <20210807214242.82385-14-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5f448930-463b-7a06-be98-ef06b27e07e3@linaro.org>
Date: Sat, 7 Aug 2021 19:12:45 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210807214242.82385-14-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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
Cc: kevans@freebsd.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/7/21 11:42 AM, Warner Losh wrote:
> The linux kernel supports a number of different ELF binaries. The Linux userland
> emulator inheritted some of that. And we inheritted it from there. However, for
> BSD there's only one kind of ELF file supported per platform, so there's no need
> to cope with historical quirks. Simply the code as a result.
> 
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/elfload.c | 87 ----------------------------------------------
>   bsd-user/qemu.h    |  1 -
>   2 files changed, 88 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

