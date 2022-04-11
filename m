Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1A7D4FC2D0
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Apr 2022 18:58:45 +0200 (CEST)
Received: from localhost ([::1]:45892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ndxNE-0006XG-DK
	for lists+qemu-devel@lfdr.de; Mon, 11 Apr 2022 12:58:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ndxKu-0004sv-3R
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 12:56:20 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:44835)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ndxKs-0004E4-6r
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 12:56:19 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 m33-20020a05600c3b2100b0038ec0218103so1264469wms.3
 for <qemu-devel@nongnu.org>; Mon, 11 Apr 2022 09:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=+YJITU/FEivEPFOU4z6PXi53AtfYvskmBxIw8YsBW5E=;
 b=RZPfg9Dl99IoqJ7STGVJRN5NGFKkToYgoJAtvb6jJLC1qdwlmY5Fp9W2ZiMwzHyD5G
 CWwZizMn2Om+EtzZdwM2jdSS+c6tzVhc3EQzeCkYsfutIWKzwT9ewAUOb8J9zW8KcyJ4
 RGJJVDtPlWfwT2+eebKZO/iLAHt1H3ZXml0VeY3Z14GiVZmz5QQ0gARQ30wVoYXelu2E
 GqWCxG0oLgk5xguHXNgd8o5/4KbLfIVjOlnCxedK3Z7Vz3BscmjD7T0AsMCSzSMDnN1d
 9gbJUWnTThIgMVGtyT+i6v9vuSIt8ST3fI6pz0HiCrKJuDb/gISXuu4RW7o8/Skj3tM6
 W9qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=+YJITU/FEivEPFOU4z6PXi53AtfYvskmBxIw8YsBW5E=;
 b=Q0LYImSyM4xwggaAsQhJmsHQTEnSWsvEpUhHyxSSU7vQq1tsptsSQdkQmMMgiQbpuV
 Dwijq9uByJfkzgxb4+DhKnV/wd65KUMjV6JbCqr6cEcm0YGmmuH3LXa17Z5VuDEX1rWl
 6fXLHOz/WG5zotmEt7e7b6BLFZWYrZ08TbE6RBW4hnN9QKxtMO2OMhAlI0Pvt66Esy+f
 45sByjvUIZsTBhZlby6w7u0adXXnljZnczDCTtlate0ks7h0pK/EwOZgmE67GpS3ha8q
 UyLtxgqek7hUomdr1tcpkGzlrk+FLhLwyCu8Xzfu4WSCkzgbcEIoB7YuVppFymYCTpHp
 Cl/w==
X-Gm-Message-State: AOAM533I+MzMKcOUHOne+acG0KRKAlORrlW+2uPE+d++XzGN6tC14K+o
 9V9IZAsQim+qz+5OtYA6ZvA=
X-Google-Smtp-Source: ABdhPJwfMFpjJ9NJtZvEZY7YLC5kptZMMx39xqc65sgOWhJz6iptz173JjNlXvSPah8EzQFYMNXE5g==
X-Received: by 2002:a05:600c:19ce:b0:38c:dcc1:4cf3 with SMTP id
 u14-20020a05600c19ce00b0038cdcc14cf3mr94965wmq.126.1649696175870; 
 Mon, 11 Apr 2022 09:56:15 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 y11-20020a056000168b00b002041af9a73fsm30578195wrd.84.2022.04.11.09.56.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Apr 2022 09:56:15 -0700 (PDT)
Message-ID: <6d38ebc0-e472-38e1-5791-de7976e709e3@redhat.com>
Date: Mon, 11 Apr 2022 18:56:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [RFC PATCH] target/i386: avoid copying junk to extended ZMMReg
 fields
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20220411145609.3932882-1-alex.bennee@linaro.org>
 <CAFEAcA-j2jkdoy09aogzgFVPXYH2Mn7yHXJCZyoZ=DETMMZMVg@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <CAFEAcA-j2jkdoy09aogzgFVPXYH2Mn7yHXJCZyoZ=DETMMZMVg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x334.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/11/22 17:18, Peter Maydell wrote:
> Looking a bit more closely, this won't work on big-endian
> hosts, because there we want to copy across the last 16
> bytes of the struct, not the first 16. So I think we need
> some more macro magic:
> 
> #if SHIFT == 0
> #define COPY_REG(DEST, SRC) (DEST) = (SRC)
> #else
> #define COPY_REG(DEST, SRC) do { \
>      (DEST).Q(0) = (SRC).Q(0);    \
>      (DEST).Q(1) = (SRC).Q(1);    \
>    } while (0)
> #endif
> 
> and then use COPY_REG(*d, r);

Right, I have written something similar after seeing your response to
the bug.

> We could probably try to write endian-specific flavours of
> memcpy() invocation, but "do two 64-bit word copies" is what
> the compiler would hopefully turn the memcpy into anyway :-)

Yeah, I actually wrote the memcpy() invocation because I was going to
look at AVX later this year, which of course you couldn't know. :)
What I came up after stealing parts of your nice comment is the
following:

/*
  * Copy the relevant parts of a Reg value around. In the case where
  * sizeof(Reg) > SIZE, these helpers operate only on the lower bytes of
  * a 64 byte ZMMReg, so we must copy only those and keep the top bytes
  * untouched in the guest-visible destination destination register.
  * Note that the "lower bytes" are placed last in memory on big-endian
  * hosts, which store the vector backwards in memory.  In that case the
  * copy *starts* at B(SIZE - 1) and ends at B(0), the opposite of
  * the little-endian case.
  */
#ifdef HOST_WORDS_BIGENDIAN
#define MOVE(d, r) memcpy(&((d).B(SIZE - 1)), &(d).B(SIZE - 1), SIZE)
#else
#define MOVE(d, r) memcpy(&(d).B(0), &(r).B(0), SIZE)
#endif

I'll still your nice comment and submit a patch later when 7.1 opens.

Paolo

