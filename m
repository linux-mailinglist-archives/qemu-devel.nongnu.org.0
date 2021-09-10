Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72186406CB6
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 15:10:11 +0200 (CEST)
Received: from localhost ([::1]:44074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOgID-0000Hp-RS
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 09:10:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mOgGw-0007uy-JM
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 09:08:50 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:37583)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mOgGr-0006By-33
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 09:08:50 -0400
Received: by mail-wr1-x42e.google.com with SMTP id v10so2556210wrd.4
 for <qemu-devel@nongnu.org>; Fri, 10 Sep 2021 06:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Ez6tqNmwGb57FJn0VjdKTnH+PuZoXuf6PYS5nql9ctc=;
 b=K2SbNsElGd1pNZkJ2ScFc2qGIA7iQ8vvchCl+z8B6a3XL6m1w4cekHEhYqnU5tlqwx
 VveX7nUiEi7PBmzqL5ihXIpDXvWvAPBMIwQAthe/MgrNJNtBolGJJXaFgAQExF414oTJ
 LTZqHd/63m64QXLt7EeZoQcOeg/q1+o7L7PT/mePITGlQoj3vfbOCVbLuAHalYVJD9/5
 ph2mi+eXaENVIBBSbBwkRIUd36DZmq53yzhcQhedf7cpwcDJXNbovFwMPg3bwDNil3iq
 Uyx3NVswk6Q8q9M0LGkXvZOEZ/ng0HT7iBSmY67hjPb3+5QbFzAnVQIlbBf3cSaj+uHd
 iWkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Ez6tqNmwGb57FJn0VjdKTnH+PuZoXuf6PYS5nql9ctc=;
 b=flKtfU9ecF8rW5b+VHkKjkHT7J1o0WTjJEaRty/6Jk+w9eSNAicDKqWstfshWn2Kx6
 Ujpc1Mr2Ez6QO84LXkR7upj0oPQbbz3Lg2zFnucy9ylBrWGp419hxEWavp3RQLN/Bf3h
 6Szl22DanQUK7Bt1f04dtk2y8t/NyDIteq7+ole4P0/+BOp8XmQ/EaICVjqzYXXsRViz
 VN3eZn8lsL7usjpkBYwugUZzfDI6GKG+XIff2BGIN19sPgrfLsk+kTiQuUWbcrDuvJIA
 Qr4Zx94q2V75GFFXHSDYm3+y8cgjphCOY3CSdiUq2gSBTwcz9fvPbcy4jL7T8w/OWU8I
 iKGg==
X-Gm-Message-State: AOAM533JCJ7pydwdeO4Y1PO+9mwb00NzTd2cvB/xqCQgF4kVJiTE5JwK
 M5zIZizFrYXaVJkDkXc8FcN8vgjk7mhchItN
X-Google-Smtp-Source: ABdhPJz46AYh1lKpLJXbD45DimcnM4aD5i01y0olSrlNMpvHjXul75PHDoeG1pZYM6sDHI3KjRzK0A==
X-Received: by 2002:adf:f188:: with SMTP id h8mr9589099wro.269.1631279323289; 
 Fri, 10 Sep 2021 06:08:43 -0700 (PDT)
Received: from [192.168.1.147] (149.164.14.37.dynamic.jazztel.es.
 [37.14.164.149])
 by smtp.gmail.com with ESMTPSA id f18sm4181333wmc.6.2021.09.10.06.08.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Sep 2021 06:08:42 -0700 (PDT)
Subject: Re: [PATCH 1/4] target/arm: Add TB flag for "MVE insns not predicated"
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210902150910.15748-1-peter.maydell@linaro.org>
 <20210902150910.15748-2-peter.maydell@linaro.org>
 <76cd3594-f864-232c-8687-19a1d44ff07e@linaro.org>
 <CAFEAcA_xUSMEoT34fkwiGef8D5Rwfkvre8o03YqgEw-qD86o=Q@mail.gmail.com>
 <d2263937-aa85-c51c-9a2b-bc50043e10c7@linaro.org>
 <CAFEAcA_Swe0LE6m2JocLsyuV1ioDnK3N0y_hJ2QAXW86UxC=dw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9545f1ae-60e9-14dd-b76f-1dccd10520db@linaro.org>
Date: Fri, 10 Sep 2021 15:08:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_Swe0LE6m2JocLsyuV1ioDnK3N0y_hJ2QAXW86UxC=dw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.349,
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/10/21 11:30 AM, Peter Maydell wrote:
> If gen_lookup_tb() and DISAS_UPDATE_EXIT are the same, maybe we
> should get rid of gen_lookup_tb() entirely ?

Yes, I think we should do just that.


r~

