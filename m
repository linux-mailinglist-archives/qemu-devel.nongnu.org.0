Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC7B3E8125
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 19:56:43 +0200 (CEST)
Received: from localhost ([::1]:53816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDVzV-0004Pc-Eq
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 13:56:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mDVyb-0003YE-HL
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 13:55:45 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:42730)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mDVyX-0006UZ-IT
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 13:55:45 -0400
Received: by mail-pl1-x62c.google.com with SMTP id t3so22256399plg.9
 for <qemu-devel@nongnu.org>; Tue, 10 Aug 2021 10:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=R0Miln0el3z6pNT45yr0TulQ3Y6me5jQzX7D0+YADIo=;
 b=ARRiFhFgOsmfiIlzK5HGS94lEsKi7ir+2ClLI4kiMCiQg2wpz6vl+8pdpW805LlViW
 i5K/miP+ww2SqWa0kepMQbwB/VKelgJYzLw8A07Y5J7joEkFU8v1MR2EkSOKomJ6PBeq
 lCk9T1tb99HnlVsT8JV5KEHf1XT6aClue0w2vmP0/R0pNQoAwfX3Jyz9SOQtjWZF4lKB
 MsBN1IMYK0Gp1Bq/8QS7447qqtvtuCC0WeD2+qj6bwjuSy+EqQY53h21thcRj6nns4HD
 3OKxn0cOzT4MSgH0I+v9YsU5oZZUtrL/dvHqn7IKB3Oh5+FPxhv+O09bbBE8VdextKvH
 Hn3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=R0Miln0el3z6pNT45yr0TulQ3Y6me5jQzX7D0+YADIo=;
 b=cdXLCHJrjo3m8nDu2u+CpWbPF8tgDAztUcKX1gH7MjyOz9Hv91daOWAssKizUAawlw
 KexRaYSvDtfCJ+8VlA7SZx0aQlinaZELHgDwnvYpOo3tik7LlVxIL+8UCajuxp96k2ru
 0R0extMAsAXTBvYIWO93SzRLSYQvMIJsBUEjr8xqM06Pz2AdfiLjJ33zEtTZh6UrC9p5
 kQWpCDeBW3J7W82lcOu8FVzWfZRLa29PRDod1Mq8gnoY0Y9kqSDuxmArVKCg7nDSNy1/
 Wy4sUcj4MTsiMTG5n+d9E5B1pMxJrXh6RUxPUCbE+eLPPRItfRW7daphpGhGtV2gbwz1
 A4Xw==
X-Gm-Message-State: AOAM531CeOfVX6xaBA8d8EA2xio4G2zvlR5KC3VfALLA0Mssp6L0xZDg
 ZgB8Y88OyL8Vm2X3DQzTcCx8ZQ==
X-Google-Smtp-Source: ABdhPJxGgCguHfICOWsULwXqr9vBz3I6LDmG2DrEFwa8K1xsrgyrTDCZdXPBfdMRYdZGDfAHTxB+Cw==
X-Received: by 2002:a62:ea0f:0:b029:319:8eef:5ff1 with SMTP id
 t15-20020a62ea0f0000b02903198eef5ff1mr30495365pfh.74.1628618133019; 
 Tue, 10 Aug 2021 10:55:33 -0700 (PDT)
Received: from [192.168.6.169] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id h13sm5239504pgh.93.2021.08.10.10.55.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Aug 2021 10:55:25 -0700 (PDT)
Subject: Re: [PATCH for 6.2 44/49] bsd-user: Refactor load_elf_sections and
 is_target_elf_binary
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20210807214242.82385-1-imp@bsdimp.com>
 <20210807214242.82385-45-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <886b485a-8cb5-5feb-da72-7ae9b1bbab84@linaro.org>
Date: Tue, 10 Aug 2021 07:55:19 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210807214242.82385-45-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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
Cc: kevans@freebsd.org, Warner Losh <imp@FreeBSD.org>,
 =?UTF-8?Q?Mika=c3=abl_Urankar?= <mikael.urankar@gmail.com>,
 Stacey Son <sson@FreeBSD.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/7/21 11:42 AM, Warner Losh wrote:
> @@ -332,86 +329,25 @@ static abi_ulong load_elf_interp(struct elfhdr *interp_elf_ex,
>            */
>           error = target_mmap(0, INTERP_MAP_SIZE, PROT_NONE,
>                   MAP_PRIVATE | MAP_ANON, -1, 0);
> -        if (error == -1) {
> +        if (rbase == -1) {
>               perror("mmap");
>               exit(-1);
>           }

Replacement not greedy enough -- rbase is always 0.

> +/* Check the elf header and see if this a target elf binary. */
> +int is_target_elf_binary(int fd)

This doesn't appear to be used at all.
Which is good, because it's buggy.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

