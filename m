Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C76D436D75
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 00:27:39 +0200 (CEST)
Received: from localhost ([::1]:56238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdgXC-0005cB-GN
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 18:27:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdgBj-0004kz-I5
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 18:05:32 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:33587)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdgBg-0003oU-Fs
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 18:05:27 -0400
Received: by mail-pl1-x62f.google.com with SMTP id y4so1413123plb.0
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 15:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=aYUjB/QhYQ+qFRn4EKNP2kMIqAYfZ1f9O/GtN3VbHys=;
 b=FHyQ3ZTYt33W0P0oXqROIySpnH7dK1ET0xDkdj2rQzuzGuABxpBn7xBzx0gplcLIzt
 ap8XEKXDKL0eFre1Oy2X7ZC4ThANSOooOxBPuNblhrYQbtTUZeVCIxNqiqjuvp2hcjz4
 Sg44EclNx0rLyUD3Lw12/VOUJ8pQyYjzpdo3qxKXB1HAvNlsQapSoAlxa5tRNPjcThGk
 nUeJHllP909nUiAQDeXZIt8+BTBYbboTBE81OisAIy+B0MxRwtzRWMcLm5cm6/g7jpx4
 cJnKaBL5x32tvJq9+yirgm46ap+Z08Lu2O/6OqBfJNDePcQkm5sIRhvYLbHn2jqTZgZe
 w80A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=aYUjB/QhYQ+qFRn4EKNP2kMIqAYfZ1f9O/GtN3VbHys=;
 b=0QYRtlS7VU+VraKZifyJUAYTZmfG9KB++Tz/scHQbiG59VKeXekk++s5E7B5IkYGLE
 ywwtLWbgxY6qqAYFDUq9tZCy48Ve5lfRWIYmoWlFQIqq4Dc41iIFqG9nOneNLxC4+fa5
 lX5/VaxtVADetY/RdtdLoASevqIPB0HvJtUTo7F8CWkIZxpxrrYhof2lVrNL/wMTRFHw
 5uUlZ69jHdzKD7Q7hp4QlyXvLbDGwcGdyMmlJltM2CNlhRf0GiY1L+TvEYY0UBHAmakS
 7jhogrG8Ym++QeBR58NxfGGbs1ZM8aSgg6t+/Lnt8TYF4ymGzTh5jwP3xt78vAeFM/b2
 WwZw==
X-Gm-Message-State: AOAM531HHWmpmpKD8kE9hpNajfi1Xbo6L2WcRdvrH2rorizEyEjvgQgf
 biQRJmS7jaYPZMumZoZndvtY0w==
X-Google-Smtp-Source: ABdhPJymiiETOWaSQC61Em6oBUXL5EwgeySp7Dd+sXo0KGR8EYjQA9Mma/rtrESEpP9IIZHte+U/ig==
X-Received: by 2002:a17:903:22d0:b0:13f:507:6414 with SMTP id
 y16-20020a17090322d000b0013f05076414mr7662518plg.69.1634853921771; 
 Thu, 21 Oct 2021 15:05:21 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id e10sm6113538pgt.23.2021.10.21.15.05.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Oct 2021 15:05:21 -0700 (PDT)
Subject: Re: [PATCH v3 17/22] target/ppc: Move d{add,sub,mul,div,iex}[q] to
 decodetree
To: Luis Pires <luis.pires@eldorado.org.br>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <20210910112624.72748-1-luis.pires@eldorado.org.br>
 <20210910112624.72748-18-luis.pires@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <59d79cf1-05de-10a4-07aa-b449548dadaf@linaro.org>
Date: Thu, 21 Oct 2021 15:05:19 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210910112624.72748-18-luis.pires@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.867,
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>, groug@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/10/21 4:26 AM, Luis Pires wrote:
> -#define GEN_DFP_T_A_B_Rc(name)                   \
> -static void gen_##name(DisasContext *ctx)        \
> -{                                                \
> -    TCGv_ptr rd, ra, rb;                         \
> -    if (unlikely(!ctx->fpu_enabled)) {           \
> -        gen_exception(ctx, POWERPC_EXCP_FPU);    \
> -        return;                                  \
> -    }                                            \
> -    gen_update_nip(ctx, ctx->base.pc_next - 4);  \

Again with separating the nip change.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

