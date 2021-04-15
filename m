Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E466A361119
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 19:27:51 +0200 (CEST)
Received: from localhost ([::1]:40550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lX5mQ-0004lU-V2
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 13:27:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lX5Kn-0008M6-96
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 12:59:17 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:34361)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lX5Kj-0008Lp-RN
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 12:59:16 -0400
Received: by mail-pf1-x42f.google.com with SMTP id 10so7575555pfl.1
 for <qemu-devel@nongnu.org>; Thu, 15 Apr 2021 09:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=B+xatD+fL4lQ9MD3y/3YIoOQOvyic7j6DjaOHd29rws=;
 b=M/0nWQarH9XSZ/ocEu17aA8wVVTTIX6wrm10A8QJg9dzxavyeTudbeN6hIw2Tc+7YS
 75nXCtsz0aMiYS8wa2nYHH5cn59QrgsJvBYyY/bMCxMYpQ+W3e5BYTmYbZ5pf22o7Gzy
 bbu4PQJrPBYHgpdcmO+OOjO8zJIee3Qc4yEl2hDSF7jEBd8r+D6XNSbNsCoU/K4QEqFi
 qHsQ5N6alNQo5UXXVrOfB6T/NqQ2a9c+hOLYm647nJjn3PvhDJwQZZUw79TZaxsx+jrI
 pGtASUf7dUzGA77yfelJEpz+7LGjtuN+sXaG1Z7+NLYrAKCO7mXMZMjoQgVL7znHuVXj
 cFAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=B+xatD+fL4lQ9MD3y/3YIoOQOvyic7j6DjaOHd29rws=;
 b=LdumUSfPcwug25DLSiKG1hcX4IHDvJpqsq2dB3i7skSd3u4+PEmEjgHx7GoOsdUsed
 vjfKaHwOFWoi6a9aPMSPXYK4hxtjgmhNozPYZRT3qeuYrL57anmHpgPHoREpaJn5Cy0S
 MDRDdaP8u3dVX4zfionOt9L58VKx2YMAY8Z9IG/RiAdh8oM3nkZKjS+2+DshkJX4xncu
 I9ADnUl/MSo8lowYqG41nBsUMt6YBzQ+l6WRC57wqqFdX+q/sht/sptl0lA9XbT8X/RN
 XRd9xJakxiDJrPzlQmI025tqCEEfTy6/jO/jRGhKLAnVz47SrMnXxssTvHJqs9yDbVAz
 bAjg==
X-Gm-Message-State: AOAM53343j+0k2SM3r959KudccsHv1QWGEupHMBCXppCHBDyL2iNbF6R
 Btpl91RFFdDxsuDeMMZBHwmdOw==
X-Google-Smtp-Source: ABdhPJyByF2jCXKiXIm6SZRwn4F2HMyu6sPTbE6U/6IzcCtVPV1IqS5jE2gG+uqfoYbdIuvLl0h8HA==
X-Received: by 2002:a63:dc10:: with SMTP id s16mr775097pgg.288.1618505951272; 
 Thu, 15 Apr 2021 09:59:11 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id w3sm2869772pjg.7.2021.04.15.09.59.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Apr 2021 09:59:10 -0700 (PDT)
Subject: Re: [PATCH 5/5] target/ppc: Implement paddi and replace addi insns
From: Richard Henderson <richard.henderson@linaro.org>
To: Luis Pires <luis.pires@eldorado.org.br>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <20210413211129.457272-1-luis.pires@eldorado.org.br>
 <20210413211129.457272-6-luis.pires@eldorado.org.br>
 <35a37fdc-0580-7c0b-5748-1f194386007c@linaro.org>
Message-ID: <d91d897a-bfb0-80ee-e5ff-85668e997705@linaro.org>
Date: Thu, 15 Apr 2021 09:59:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <35a37fdc-0580-7c0b-5748-1f194386007c@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
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
Cc: lagarcia@br.ibm.com, bruno.larsen@eldorado.org.br,
 matheus.ferst@eldorado.org.br, f4bug@amsat.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/14/21 12:11 PM, Richard Henderson wrote:
> This approach seems like it will work fine for MLS and MMIR prefixes.  For 8LS, 
> 8RR, and MRR prefixes, we'll need some extra help within ppc_tr_translate_insn. 
>   E.g.
> 
>      insn = translator_ldl_swap(env, ctx->base.pc_next,
>                                 need_byteswap(ctx));
>      switch (ctx->prefix_type) {
>      case PREFIX_NONE:
>          ok = decode_opcode_space_0(ctx, insn) ||
>               decode_legacy(ctx, insn);
>          break;
>      case PREFIX_MLS:
>      case PREFIX_MMIRR:
>          ok = decode_opcode_space_0(ctx, insn);
>          break;

I played about with this last night, and there's an interesting trade-off:

(1) The thousands of 32-bit insns which do not allow prefixes
     now each require 3 lines to assert that no prefix is present,

(2) There are only 12 MLS and 29 MMIRR prefixed insns.

I think it may well be that eliminating boiler-plate from thousands of insns it 
a good trade-off to special-casing 41 insns.

At which point, considering the multiple variations on 8RR and MMIRR prefixes, 
seems to indicate that we should decode all 64 bits all at once.


r~

