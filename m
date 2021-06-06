Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA29D39CC20
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Jun 2021 03:50:57 +0200 (CEST)
Received: from localhost ([::1]:53712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lphwG-0004Mb-EJ
	for lists+qemu-devel@lfdr.de; Sat, 05 Jun 2021 21:50:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lphv4-0003h1-9x
 for qemu-devel@nongnu.org; Sat, 05 Jun 2021 21:49:42 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:52141)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lphv1-0001t1-Ti
 for qemu-devel@nongnu.org; Sat, 05 Jun 2021 21:49:42 -0400
Received: by mail-pj1-x102a.google.com with SMTP id k5so7731683pjj.1
 for <qemu-devel@nongnu.org>; Sat, 05 Jun 2021 18:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=WbZED075KCbC1wmCSKGIM8T/R7C+1QsxJgZkECsSDZ4=;
 b=eNkjFvai3pJGCZNb3Ser931mNiOwD3jv3V2FX1kvWSeitW4PC8xd1R1ig+DigeVT+Z
 lt4aTlgA34JJn2ywgJxk2DnKPIj8nlmTTEEdUwP7dwCsjwt2/Q2rR8QdF8wbeh7Rjnf2
 C3CjDujhEAV7RyzcZXjBAoNL7w5BgNywnVgB9mAxfTtnowVcjUyWBLb3UeD7NI45etg/
 aIWMHSSOWvrZNLNTMuDZaIOd5SeEQ75TzExZ6lPGJLvv29yxIHU/tUCrXcWqu97xGGmS
 zwBGVttFOlRTqB9PVGmIxWqis84Gyn9JbWyyE+u5/f6/atxdP5CE9ucjGCMtDF1CRKwr
 XfbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WbZED075KCbC1wmCSKGIM8T/R7C+1QsxJgZkECsSDZ4=;
 b=NCiVwEeODwDv2meocn5ukuEpTU6YlbTsKGOzCtovw0Rpsu1/+nRkySiErU38FKrDWa
 6B1OlhKDeR2B34z5rv8ghfMJ6vtAoy2ZcW0EDIV2oq9mkOMhoWgvWsfyYZVnD4FcndIb
 Ey1lnq7PHPZ600GFLSkHULQxnOwlpidF3VDFKeNm7RveK+AWDVpauU9VFd7iOKbs+w+y
 y07aMxdelDbfpWpAdzmgxE2g1WD7rsAbm08kQAAq2POVkfbATmep/Oruht8eO4E7f06i
 J2kT7qsKnznFyexLUeaZxv0kwmEf6MtmBa4T3iLFQHwoDrmFTVvVo45ZsjjD/sOrsO64
 2eOg==
X-Gm-Message-State: AOAM533ChOoLqWzxv5OGX1YK9fQbsI96IqmiRDp2c+QEhFrpiokY0tbP
 Hu8QzZQhQczira0BeEsoyRQ0mc3P32Z9cQ==
X-Google-Smtp-Source: ABdhPJwotrAO0v62fG7RPCbu1VmdnxtSvAZ039h6eFcy7LyDo8mYQl4m5A4kMSGtYGncwKXNE/me7g==
X-Received: by 2002:a17:90b:d95:: with SMTP id
 bg21mr1147978pjb.115.1622944177427; 
 Sat, 05 Jun 2021 18:49:37 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 w10sm4834395pfg.196.2021.06.05.18.49.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Jun 2021 18:49:37 -0700 (PDT)
Subject: Re: [PATCH 6/8] Provide interrupt mapping information in PCI config
 registers.
To: Jason Thorpe <thorpej@me.com>, qemu-devel@nongnu.org
References: <20210603035317.6814-1-thorpej@me.com>
 <20210603035317.6814-7-thorpej@me.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b58dc5ca-3082-3a21-dc76-1547b6435927@linaro.org>
Date: Sat, 5 Jun 2021 18:49:35 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210603035317.6814-7-thorpej@me.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.59,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/2/21 8:53 PM, Jason Thorpe wrote:
> Use system-specific information to program the interrupt line register
> with the interrupt mappings, which is what the SRM console does on real
> hardware; some operating systems (e.g. NetBSD) use this information
> rather than having interrupt mappings tables for every possible system
> variation.
> 
> Signed-off-by: Jason Thorpe <thorpej@me.com>

Thanks.

> +  /* Map the interrupt and program the IRQ into the line register.
> +     Some operating systems rely on the Console providing this information
> +     in order to avoid having mapping tables for every possible system
> +     variation.  */
> +
> +  const uint8_t pin = pci_config_readb(bdf, PCI_INTERRUPT_PIN);
> +  const uint8_t slot = PCI_SLOT(bdf);
> +  const int irq = MAP_PCI_INTERRUPT(slot, pin, class_id);
> +
> +  if (irq == -1)
> +    {
> +      /* No interrupt mapping.  */
> +      pci_config_writeb(bdf, PCI_INTERRUPT_LINE, 0xff);
> +    }
> +  else
> +    {
> +      pci_config_writeb(bdf, PCI_INTERRUPT_LINE, irq);
> +    }

I've folded this non-distinction into the functional interface.

> +#define MAP_PCI_INTERRUPT(SLOT, PIN, CLASS_ID)			\

I've turned this into a static inline.


r~

