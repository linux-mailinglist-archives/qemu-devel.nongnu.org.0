Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E48F5A090E
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Aug 2022 08:45:06 +0200 (CEST)
Received: from localhost ([::1]:45832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oR6bs-0001gh-99
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 02:45:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1oR6Ut-0006ll-Ou
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 02:37:47 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:37401)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1oR6Uq-0007mB-S8
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 02:37:47 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 c187-20020a1c35c4000000b003a30d88fe8eso2110796wma.2
 for <qemu-devel@nongnu.org>; Wed, 24 Aug 2022 23:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc;
 bh=P0iTStlahdQVLBT8RYjmRC1GC+h1Gb59TsSrUYMRqyw=;
 b=T5LGMRsSgDYnxCgQez7W99DA+uyvUIpu3Cb1oURB+qsiqgtqOeLrq8q+8uRNnUUW3F
 H8bi2efRJ+L+AJDwhsZXi58Bl3sf41UkjSCsw1rAkDwD9HZo/iYeMHjHCaR0xEfIAQqd
 PK5NymM/7P1f2ff2nhlrrmgxJ61Ytg2Us9wK0kOT+X1lasgZoCiIzmd1bsk941G7y7tP
 l1PAd36EGn5+CYnQJYe8WABITU0x4gSWXQVoJJNAukyZodD1TuetFp5EhFWTo9qussxg
 0/Oqq0A6AaR4m4codFyxS3FXwza0VylhZSM3XuVkdXyXdJIWWJYZgPgLyPo9hLbaINi+
 JNdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc;
 bh=P0iTStlahdQVLBT8RYjmRC1GC+h1Gb59TsSrUYMRqyw=;
 b=XsBx/VAHnHJwmz79oLVw5pjJo4CxaN6CfU8VVYXTCaWsROd3BazoTfCT8Q1jubOznz
 H8gpodfVmbaO4sZhBUYMawQl0xq30F9hukKcKq0RAamNbU/DTOK0fZ07B0HqYekTe08Q
 RS8wLv0m31d1b54DqMf67yOIC/TACijO5eFXH+pk6lAWKlby1O5lvkXzNw3Sszv/ew1z
 cdPgEZVPd+yDREdrVjf8caoc2TGjqDNgt4OGhHquf1xrro1+3Tdzo3GEBG9+QZDlUflG
 /qaJp/6vCW67/Ns1vgM7P7wm0drWjFVDetjzBKOX1Cgxv6kpQuj/E7SmvgkIc6/U70Ud
 m9XA==
X-Gm-Message-State: ACgBeo3EyUXbDwgnaNRQFhIfLk/5Vn2gI9kekm09FRdyMqHGxdyQhswW
 ykx9slMkjsVL8dkIfyrS/9Q=
X-Google-Smtp-Source: AA6agR4RWU4nOiiNc1mVEOsGPFKvo+3m473JaytiyUoDlcLY9VQLHc2KgPqv1UNxa/olEfEikAjKHQ==
X-Received: by 2002:a1c:7708:0:b0:3a5:5543:cec4 with SMTP id
 t8-20020a1c7708000000b003a55543cec4mr7273336wmi.47.1661409463335; 
 Wed, 24 Aug 2022 23:37:43 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:1c09:f536:3de6:228c?
 ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.googlemail.com with ESMTPSA id
 3-20020a05600c22c300b003a35516ccc3sm4025949wmg.26.2022.08.24.23.37.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Aug 2022 23:37:43 -0700 (PDT)
Message-ID: <c60a5733-4a33-5247-0a10-8ecf43dd7e99@redhat.com>
Date: Thu, 25 Aug 2022 08:37:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 03/17] target/i386: add core of new i386 decoder
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: paul@nowt.org
References: <20220824173123.232018-1-pbonzini@redhat.com>
 <20220824173123.232018-4-pbonzini@redhat.com>
 <a6d65d8c-d864-0479-8d82-1fe24f03016f@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <a6d65d8c-d864-0479-8d82-1fe24f03016f@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

On 8/25/22 02:12, Richard Henderson wrote:
> 
> Surely it would be just as readable as
> 
> static const X86OpEntry onebyte[256] = {
>      /*
>       * Table A-2: One-byte Opcode Map: 00H — F7H
>       */
>      [0x00] = X86_OP_ENTRY2(ADD, E,b, G,b),
> 
>      [0x01] = X86_OP_ENTRY2(ADD, E,v, G,v),
> 
>      ...
>      [0x10] = X86_OP_ENTRY2(ADC, E,b, G,b),
>      [0x11] = X86_OP_ENTRY2(ADC, E,v, G,v),
>      ...
> 
>      /*
>       * Table A-2: One-byte Opcode Map: 08H - FFH
>       */
>      [0x08] = X86_OP_ENTRY2(OR, E,b, G,b),
> 
>      [0x09] = X86_OP_ENTRY2(OR, E,v, G,v),

Oh, that's obvious in retrospect.

I will probably keep bidimensional arrays for the various SSE prefixes, 
though.

Paolo

