Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 534D63F2381
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Aug 2021 01:05:01 +0200 (CEST)
Received: from localhost ([::1]:55182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGr5o-0004fu-0I
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 19:05:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGr4m-0003M4-4N
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 19:03:56 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:39688)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGr4k-0007gl-KK
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 19:03:55 -0400
Received: by mail-pl1-x635.google.com with SMTP id l11so4865230plk.6
 for <qemu-devel@nongnu.org>; Thu, 19 Aug 2021 16:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=VR/EjdGFtOAtpnd0HVtuH2yRMjBWjUh8ro0PJdb1Ilc=;
 b=sqQmcR3tzwE1wG3ME1uoWXG7p93EehTE/fAHyMo3IMgG2oX3mWLCTabx5Y9SJiDsLx
 3Qm/+yIovlPEBfjf8VhXL9QFTWKA4hRzeX9QT1NWxlEL8emacgkLTfxgqd8pskG9LNjx
 zDTbbu6E0RjIZTuugF9O4MlCOwYf/rOczD0013q5/L1m2Kzgh4hlnoslo5KoG8saDLcF
 7QLh6AuWUi5t38B0C6Wz9KGtrbNp7ciKBfj37i42j4fYzXD1XIcsL2j0oySHaSJ7q3UG
 S1PTBvrW3W3cTa24fa83Rs5kJL6VS4Wx5TSmwZ3L0ckl9qAN7vS0UBlVwcff8PQLXIxP
 SjYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VR/EjdGFtOAtpnd0HVtuH2yRMjBWjUh8ro0PJdb1Ilc=;
 b=pneALeffTAgu5WgbcVgPQv6hJbIqhDNo/2ityMTPcMBe3jABFNBwucoymvzvW0ikEC
 2Arg425a0MRF8uvIU3t2M9o8QngroqQkAqFs0vKJnVEB7z4/HqHxfZFKZzIa7lGWLs/J
 befZiz7vcOB5OxihU6p3fcOqLDqwunu5a/oy5ZUmmagP6ndo4N9cNwPc+AgH3LtFNFJa
 HtDxi/IKx2jsJwWbIFDDxhqeI9jlLezj16YLjGdq0a48EwBvQ9tRoP8E7/LGGS2z8dRE
 7u1rojikG67Aq5DYgWQunna9Ms44u9IDpQUNbJJHJXGG55DWxyj3Pf9vgUM0wWulRdqA
 T8wA==
X-Gm-Message-State: AOAM530JLt8b4np43HfxwAh6gA6pzcKiywUWeFj+oCRZNGKTvfmNh6AE
 jnHP0zdI5qYgDJm6RJynBie2sQ==
X-Google-Smtp-Source: ABdhPJwfXZD6Uu8TxQQ4dhoJ2ycC8xbkVo/21EUA74AjWNgv+iRvg8/aLIqmFW9GyaKX4lvAKjvdJA==
X-Received: by 2002:a17:902:8d84:b0:12d:da0a:6970 with SMTP id
 v4-20020a1709028d8400b0012dda0a6970mr11817008plo.54.1629414232743; 
 Thu, 19 Aug 2021 16:03:52 -0700 (PDT)
Received: from [192.168.3.43] ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id y13sm4797877pfq.147.2021.08.19.16.03.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Aug 2021 16:03:52 -0700 (PDT)
Subject: Re: [PATCH for-6.2 v2 2/2] target/ppc: fix vector registers access in
 gdbstub for little-endian
To: Peter Maydell <peter.maydell@linaro.org>,
 "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>
References: <20210818110656.1993090-1-matheus.ferst@eldorado.org.br>
 <20210818110656.1993090-3-matheus.ferst@eldorado.org.br>
 <CAFEAcA89aPw5chrrzaV155Why0vjhN+BUQ7nfhz1_4EgcziBZw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <270f1d40-f377-1f89-4a93-fb5774edb967@linaro.org>
Date: Thu, 19 Aug 2021 13:03:48 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA89aPw5chrrzaV155Why0vjhN+BUQ7nfhz1_4EgcziBZw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.591,
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Greg Kurz <groug@kaod.org>, qemu-ppc <qemu-ppc@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/19/21 2:42 AM, Peter Maydell wrote:
> Maybe we should fix this by making the 'struct Int128' field order
> depend on HOST_WORDS_BIGENDIAN...

Yes, I think so.

At some point I had a notion of supporting Int128 natively in TCG, at least as far as data 
movement and the host function call abi.


r~

