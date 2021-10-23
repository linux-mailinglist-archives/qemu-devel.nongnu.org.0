Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D572E438577
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Oct 2021 22:57:55 +0200 (CEST)
Received: from localhost ([::1]:46306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1meO5S-0007Jq-Md
	for lists+qemu-devel@lfdr.de; Sat, 23 Oct 2021 16:57:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1meO4M-0006UO-Fd
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 16:56:46 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:37630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1meO4J-0003Ft-Ry
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 16:56:46 -0400
Received: by mail-pf1-x42f.google.com with SMTP id v193so156542pfc.4
 for <qemu-devel@nongnu.org>; Sat, 23 Oct 2021 13:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ahykpz1OHJ+M3j7YV8huB0OQqCJqMJf5AkFCmlwj4+U=;
 b=oZzxXf6kx3qlJFXbXTXQH68eZ82els4k6QRotmPZYfcK4aYuzX+kYVQp8alCFE9aj5
 90ETqayBljK3LzjLHX7JJeMBhGFFNh4xCXya9g8jTj1jlvMz02loNWJt9HRuLGPYWHFR
 GJP2eaHmtY2B6KNv2R/txGVAQ94OOyNxNtTk7r6vqRWEBd5OPRZu2hv8YiiuYT9EvsTH
 TueRtIzHEgmXEr46cTfWmB0QVvf6V6ROVYDx+K/wS/fqEUTUOpf9p7p7skrHfs7z5f6D
 K6Kx1oGrLIr6U2Ywfq8bhFz1DtpHDHKR5s+Jb+uucROEWZINDQJKPHdBbxPfcx+w7exE
 nV1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ahykpz1OHJ+M3j7YV8huB0OQqCJqMJf5AkFCmlwj4+U=;
 b=CF6K9wfE5kbxqyDGsVvFIG6NjTbfmFZ+IKFARsCJQ259NotmlC9gDo4Y/FznnoR06k
 jaGdms9MQnS/Syz6lVaea6AX2PFdyHFmqFWqdi2SPz2PtL6cNkcTxuOnZ2s8ScmgiCYB
 dgVPRxME9TzwBDb3SncHPV1NUU16w1rci0DCDonQzfJy5c6L/CD/xM523sXz7CHSM/LA
 SL3yHGF0VrVr5gknryBD4wrKogw0L+XlfZLyVWVGYJBOLqd7aCdUJmtBkO9OHeeDeASq
 x7QDDE987REIKXOcSvviGCBPq3Dq/057LFOwwCNT2rRyAVcrdBlijgvv+RVuhS2f+qql
 apjw==
X-Gm-Message-State: AOAM532tAw/opAAm0DAl0lkgRmEWzh4TMkxMLdsSTKQvDZxfqoPkXLHq
 KwxfhAA34Cg+Jh1rSjl95emBJQ==
X-Google-Smtp-Source: ABdhPJwbYbaa7oiZGBXlocYW6Pa9BrZ0TJZv2UJHmkQdgfuMXrL3KxlFYUOHw2RNoe/99TkzQKw95g==
X-Received: by 2002:a63:4f57:: with SMTP id p23mr6108727pgl.376.1635022602144; 
 Sat, 23 Oct 2021 13:56:42 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id z12sm16327490pjh.51.2021.10.23.13.56.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Oct 2021 13:56:41 -0700 (PDT)
Subject: Re: [PATCH 25/33] target/ppc: added the instructions PLXV and PSTXV
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20211021194547.672988-1-matheus.ferst@eldorado.org.br>
 <20211021194547.672988-26-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <bb831ff2-aebf-8e48-49a2-3de593da4950@linaro.org>
Date: Sat, 23 Oct 2021 13:56:39 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211021194547.672988-26-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.781,
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
> From: "Lucas Mateus Castro (alqotel)"<lucas.castro@eldorado.org.br>
> 
> Implemented the instructions plxv and pstxv using decodetree
> 
> Signed-off-by: Lucas Mateus Castro (alqotel)<lucas.castro@eldorado.org.br>
> Signed-off-by: Matheus Ferst<matheus.ferst@eldorado.org.br>
> ---
>   target/ppc/insn64.decode            | 10 ++++++++++
>   target/ppc/translate/vsx-impl.c.inc | 16 ++++++++++++++++
>   2 files changed, 26 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

