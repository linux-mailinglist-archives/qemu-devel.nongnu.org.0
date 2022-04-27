Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E3B55111CA
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 08:55:45 +0200 (CEST)
Received: from localhost ([::1]:43574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njbaS-00027P-2j
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 02:55:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1njbYM-0001RN-3v
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 02:53:34 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:38852)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1njbYK-0000GS-LW
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 02:53:33 -0400
Received: by mail-ej1-x62e.google.com with SMTP id r13so1481438ejd.5
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 23:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=TX/QPE5qvS+SFvD74SPg4KyyD+Cl4Pck5TRh6kkFeT4=;
 b=CyniXgsvB+vcOph8rYN6Ar+yUs4OmkPDsdPU0LSXy6TC3ZXdZvXJjuUAR3gODKJcwK
 0l3PMmQJ2sNqu/5phQwGG3zYkV1bKQWREU7vHBicronoapm/MZsxmqPPwLNxJK0lygkw
 iN9v8s5Bsgukz2kkY9Gncxhbdlg1pbEQnB13YrBzc2NOjg18hg195aJ0RI0aXy05q5OZ
 PEJnWDCrKko6r7cSGDIVFNPdgiDXyZRkmX9TThx3HGEWQJDd2YymduxV1Ol9cMopa7AE
 QS6FJF14hZtyoY0QGa8P9aJiNtJImefd299Y/R6uS+h6qpkmZiS5X3bxfiQ1lKSwFfwB
 4kGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=TX/QPE5qvS+SFvD74SPg4KyyD+Cl4Pck5TRh6kkFeT4=;
 b=E8hTUHUc8ggVEqsNACWj/LJhwfFrgOwMenEI8zkCSQrRr41A1ZrHvbXQqvZApf/lTA
 aLKK3bkawYf/qx8wh65iA+oB05Av2d2QF4WsYfQB5P9Kne9CDQSnmzvoGxnV6jpEXMWV
 gAkAVI+q6VogvTBW2fWKBY8p/g4q3vixxfIY9pI1J49g2pKL3No2hk7j3yczr3g4O6s1
 b9rWAqTwli5HXh10Yy/m3VGh+h/ZYwrqvwE+THGolkGLdzrANjMTdXIufMiPxo0TUErz
 PuqCqAckgVGyRDnPjXVXOJEd/qj6gvKHP+NGjJus2dLjWxf0FO2Eomif6s0UCBkJ/ZmR
 v6Hw==
X-Gm-Message-State: AOAM5320C13OgMsU+Zjpk7L/CKyFHtGETypGHQtAE+7olar/t48yYjzg
 7l39vXWCFZoxpVo/M7hUdS8=
X-Google-Smtp-Source: ABdhPJzNSxhROMErIn0MSi4KOTr0MifnxWSijD349qguWyMvZ8H/eabJlxXqbgGMlmLbREJd4X301w==
X-Received: by 2002:a17:907:1623:b0:6df:c9da:a6a8 with SMTP id
 hb35-20020a170907162300b006dfc9daa6a8mr24214195ejc.303.1651042411055; 
 Tue, 26 Apr 2022 23:53:31 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:1c09:f536:3de6:228c?
 ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.googlemail.com with ESMTPSA id
 u10-20020a170906b10a00b006e1004406easm6238501ejy.93.2022.04.26.23.53.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Apr 2022 23:53:30 -0700 (PDT)
Message-ID: <7431b660-b6e2-df6f-b1e3-d15a7b2a96af@redhat.com>
Date: Wed, 27 Apr 2022 08:53:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 13/42] i386: Destructive vector helpers for AVX
Content-Language: en-US
To: Paul Brook <paul@nowt.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
References: <20220418173904.3746036-1-paul@nowt.org>
 <20220424220204.2493824-14-paul@nowt.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220424220204.2493824-14-paul@nowt.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: "open list:All patches CC here" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/25/22 00:01, Paul Brook wrote:
> +#define SHUFFLE4(F, a, b, offset) do {      \
> +    r0 = a->F((order & 3) + offset);        \
> +    r1 = a->F(((order >> 2) & 3) + offset); \
> +    r2 = b->F(((order >> 4) & 3) + offset); \
> +    r3 = b->F(((order >> 6) & 3) + offset); \
> +    d->F(offset) = r0;                      \
> +    d->F(offset + 1) = r1;                  \
> +    d->F(offset + 2) = r2;                  \
> +    d->F(offset + 3) = r3;                  \
> +    } while (0)
> +
>   #if SHIFT == 0
>   void glue(helper_pshufw, SUFFIX)(Reg *d, Reg *s, int order)
>   {
> -    Reg r;
> +    uint16_t r0, r1, r2, r3;
>   
> -    r.W(0) = s->W(order & 3);
> -    r.W(1) = s->W((order >> 2) & 3);
> -    r.W(2) = s->W((order >> 4) & 3);
> -    r.W(3) = s->W((order >> 6) & 3);
> -    MOVE(*d, r);
> +    SHUFFLE4(W, s, s, 0);

I am not particularly attached to the MOVE macro, but replacing the Reg 
variable with scalars seems worse.

Paolo

