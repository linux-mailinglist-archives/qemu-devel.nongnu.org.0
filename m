Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10EC85F0C68
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 15:28:52 +0200 (CEST)
Received: from localhost ([::1]:37624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeG4Q-0003Uz-Md
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 09:28:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oeFz3-00062U-0h
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 09:23:19 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:39724)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oeFz1-0004C8-76
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 09:23:16 -0400
Received: by mail-wr1-x42e.google.com with SMTP id f11so4174377wrm.6
 for <qemu-devel@nongnu.org>; Fri, 30 Sep 2022 06:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date;
 bh=w9icf1R5z71HoYa3R9ov9zygm2EAE7Z+AJHg2syC9Jc=;
 b=haIO2tHCFjIHGobJ5t5PPpvCMqR4zuHoNFZSCpLE0iQZc3WGkTWdKS4Fdm7ddMVt5R
 yzKupgvgtdiGSyrmePcZRWC7qqINxJ2WWAWUsE/MboRw32FDIxSXEWb0AFtmcoAKgoSF
 cd1pBtfmZDhLA9GqiGQ9HdUBARvKMFFiFC9UApTRLRkdRFdEV0v7ALwxhB1B3jBSJB6x
 CGaI7zS259w3MuvUdxZoj0ht4Qqj/uLikK2YQT7Vvj1zWnR8L3aizoVU5oaCOY3SM4BY
 iaiAbNiNazr+q7g8AT63eENzefR+u0fXhK8DMgbpShy7C7kkQ9XZM6JgGNO4VeGA0Py9
 qp9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date;
 bh=w9icf1R5z71HoYa3R9ov9zygm2EAE7Z+AJHg2syC9Jc=;
 b=dQGjZpKUqz7Nf7zDbpZgZQnh42IF2X0l0q8E6NDuq5FscKIQG3lj6uQLahYQ5gRBJl
 pq2/Kg08TMbax75FxiJuDdrgGAPVWx9XYAjbnPj8d7j3eqJf/QDA8rij/ncMMsbHVgs1
 /gUSoJIrt7YB7kEbZ2J69wFST3lstJZJBxs1ggA15+jhyfJPhwl/pcHxWwW/edyVeViq
 4a/9WidNRxlNe38FSzSSc6HJ17CggolPmsdAHhdYLEqo5V1KTgHBZVsRufZaGUpYzKg9
 obSpWr94bI5A00nNkb1mul2RNsFfIbZboya8FignCl0YD3J++tqOe+8bkooivkIWi83p
 OjOQ==
X-Gm-Message-State: ACrzQf1h7SI35fN1SDRhI+mq7OZ9YfFZ2VxXOIwoG4++Ck60VohgaoEU
 4w7mSczrjhTtdh4Iba65NbZ59A==
X-Google-Smtp-Source: AMsMyM6mIp1cLAmd4yKEoCQyOf2AIs/Ju4WIYSeCYaxhbYSe7bHQHVwIv23epwAGlL7vNmGwzbsH9w==
X-Received: by 2002:a05:6000:1882:b0:22a:f402:c975 with SMTP id
 a2-20020a056000188200b0022af402c975mr5840474wri.532.1664544192579; 
 Fri, 30 Sep 2022 06:23:12 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 v129-20020a1cac87000000b003a845621c5bsm2007640wme.34.2022.09.30.06.23.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Sep 2022 06:23:11 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id DB4D21FFB7;
 Fri, 30 Sep 2022 14:23:10 +0100 (BST)
References: <20220925105124.82033-1-richard.henderson@linaro.org>
 <20220925105124.82033-17-richard.henderson@linaro.org>
 <CAFEAcA-WzwA6zzDFezBqUz8U7ZT6q9bCP0Jj1iXfHydDe1nvZQ@mail.gmail.com>
User-agent: mu4e 1.9.0; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Subject: Re: [PATCH v5 16/17] accel/tcg: Introduce TARGET_TB_PCREL
Date: Fri, 30 Sep 2022 13:59:16 +0100
In-reply-to: <CAFEAcA-WzwA6zzDFezBqUz8U7ZT6q9bCP0Jj1iXfHydDe1nvZQ@mail.gmail.com>
Message-ID: <87pmfdxagx.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


Peter Maydell <peter.maydell@linaro.org> writes:

> On Sun, 25 Sept 2022 at 12:15, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Prepare for targets to be able to produce TBs that can
>> run in more than one virtual context.
>
>> -/* Similarly, but for logs. */
>> +/*
>> + * Similarly, but for logs. In this case, when the virtual pc
>> + * is not available, use the physical address.
>> + */
>>  static inline target_ulong tb_pc_log(const TranslationBlock *tb)
>>  {
>> +#if TARGET_TB_PCREL
>> +    return tb->page_addr[0];
>> +#else
>>      return tb->pc;
>> +#endif
>>  }
>
> This is going to break previously working setups involving
> the "filter logging to a particular address range" and also
> anybody post-processing logfiles and expecting to see
> the virtual address in -d exec logging, I think.

To be honest I've never found -exec logging that useful for system
emulation (beyond check-tcg tests) because it just generates so much
data.

> For the exec logging, we surely must know the actual
> virtual PC at the point of TB execution -- we were
> previously just using tb->pc as a convenient architecture
> independent place to get that from, but should now do
> something else.
>
> For places where logging a virtual PC becomes meaningless,
> we should at least indicate whether we're logging a
> physaddr or a vaddr, because now depending on the config
> we might do either.

Yes we should extend the logging to say phys-pc or virt-pc=20

> For the range-filter stuff, I'm not sure what to do.
> Alex, any ideas?
>
> (I see the -dfilter option documentation doesn't say
> whether it's intending to work on physical or virtual
> addresses...)

I have a feeling for system emulation phys-pc is the most natural but we
could extend the filter spec to be explicit.

>
> thanks
> -- PMM


--=20
Alex Benn=C3=A9e

