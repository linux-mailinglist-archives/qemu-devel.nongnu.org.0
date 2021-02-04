Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7ABB30FD6D
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 20:57:49 +0100 (CET)
Received: from localhost ([::1]:44158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7klA-0006i1-PY
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 14:57:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7kXk-00081r-0a
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 14:43:56 -0500
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:36257)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7kXi-0007fu-4Q
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 14:43:55 -0500
Received: by mail-pf1-x434.google.com with SMTP id 18so612652pfz.3
 for <qemu-devel@nongnu.org>; Thu, 04 Feb 2021 11:43:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FBOq0atrcaKqDkMGrm4km21vds4VsDP1b/QyLblXmGo=;
 b=eROxj3rYpxkYhDvg7BdfIDjytwg3rUZFt73G1qXs5ZDXL6HhiOsC6Tqp4jVA67bt9L
 Oqf1mlNttpVs9UKsE9W0na8nk0ydVrvbjH9EBWcPicUkaEXxri4Sfv2TQ3SWneyUTcpq
 57dfgkKqHISNvrsTUB5OP448ZvKLFI8K9N+vLMB5/eGdupMznQyjO7M7g4ph1o+ibBIp
 5Ux95RTdVo64bvxhTalWkMbxRhkrkrU5OG1R+5QB4Z1ceXRv2G+Cjr/GMI2nPhBjxPpp
 rmto/AviBJK6sz3XuTYQXVnjLvo+pft6l7lf4YqlXXb/Z/2GhKy22W3mrukG1HixWz0D
 3fag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FBOq0atrcaKqDkMGrm4km21vds4VsDP1b/QyLblXmGo=;
 b=O91SBaQ6emqSTaetHj9GQT0mVTp9Mq+DsGxJSokpEHZZYB8BXRAbdOQxdZKq54OSvS
 kB4C2MgDNuEz08K9706w0NrRRQuRV5ITUBzOKPf+2gaJHXHg47nH5MujFrr2igCyab0+
 wR7W1GUm4ajBnieooipA1z3uflf/Se/fnGBCkHpTwrd/tORmOGvTlNakPiSG+tPZoDlW
 ioE6NYBBZaCKmhHf//wSNcD2A5VBbU7kEG89TjIMCIT+Qu2TIXMAi6PoQfxCuAQTOeaj
 Cidrql6IwrhoIMaggbWZ4eBpXO0XohcyVt4pM9Nrw6iSmynB+ZaMf6BDMp9Fp8Kc9fLz
 Dl0Q==
X-Gm-Message-State: AOAM5317RiDXtyVoU7rn4wJM+xjr7HhcpWQSHVRQ6u04iMyQeuUKo5Xk
 5J7l6nxQImTuvpLDfpd8CJLGdw==
X-Google-Smtp-Source: ABdhPJz+jUG97xW/cQRYWb6z3vk50z6fJls354bql4oGMS530ytvMo9wgLi2ON/A7ADhD0sF4ffjIQ==
X-Received: by 2002:a63:8f4c:: with SMTP id r12mr548248pgn.311.1612467832391; 
 Thu, 04 Feb 2021 11:43:52 -0800 (PST)
Received: from [192.168.3.43] (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id 85sm6781058pfc.39.2021.02.04.11.43.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Feb 2021 11:43:51 -0800 (PST)
Subject: Re: [PATCH v2] exec/cpu-defs: Remove TCG backends dependency
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210204191423.1754158-1-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9b2a5a0e-ea5c-2af1-d337-c9115bc69af5@linaro.org>
Date: Thu, 4 Feb 2021 09:43:48 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210204191423.1754158-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.182,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/4/21 9:14 AM, Philippe Mathieu-Daudé wrote:
> "exec/cpu-defs.h" contains generic CPU definitions for the
> TCG frontends (mostly related to TLB). TCG backends definitions
> aren't relevant here.
> 
> See tcg/README description:
> 
>   4) Backend
> 
>   tcg-target.h contains the target specific definitions. tcg-target.c.inc
>   contains the target specific code; it is #included by tcg/tcg.c, rather
>   than being a standalone C file.
> 
> So far only "tcg/tcg.h" requires these headers.
> 
> Remove the "target-tcg.h" header dependency on TCG frontends, so we
> don't have to rebuild all frontends when hacking a single backend.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> v2: Reword description (bonzini)
> ---
>  include/exec/cpu-defs.h | 3 ---
>  1 file changed, 3 deletions(-)

Queued, thanks.


r~

