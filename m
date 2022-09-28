Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BADE05EEA24
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 01:34:18 +0200 (CEST)
Received: from localhost ([::1]:58254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odgZF-0000Cj-NX
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 19:34:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1odgWC-0006Yg-Lu
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 19:31:08 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:40502)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1odgW8-0002Wb-FA
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 19:31:08 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 h8-20020a17090a054800b00205ccbae31eso4250803pjf.5
 for <qemu-devel@nongnu.org>; Wed, 28 Sep 2022 16:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=p73f+dUM9zbnPz2lB1WH1PhONOp+nBueo+BM9gEHX70=;
 b=hjrqbhK4Nwh0SrnDEmFdXtXq1FWq8OTAMp5E49ok7A0+meNfe6Dv9A7UlwIu1neoiy
 DZw135q67oOaq9Diydt0LItULiYhlfyj57J1SgRsa/DvVhO2f/borhOTjXSdsl98OKJr
 j/PzsW2rhR18SCOftKr3B4lX9aAqJaHANgIyVo3oL7qBF8PXs/TWxYZmjCeZIRuMQmao
 +VBbCTFTEQ5UCSRJYIQi3CICx4UMD5KqeUSaYORODlVEW1EtH8cROe/z5ztrq1HBAdnw
 Bt9e2GkcrX6aI57IKrR9CltFJVC5HNrqixqOVjExJTV02YRFNY7a4qttQmuHutTS95LG
 SyYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=p73f+dUM9zbnPz2lB1WH1PhONOp+nBueo+BM9gEHX70=;
 b=joh8G9QXcuHc0g3q5l9+e22kJeaHY7/J+MBUORLyNERXeJwQr9Jdtk6udKLwohO3jx
 +nw5/vRJGid7tpAlhhOMed12AwnFEl1Z9R0bftmaEX8nanI7AqLjWLzmtHzvA33E4u3l
 UkGMfHezFANN+ks9FkM01FYuDirU56ut2E9l3jZnMmrfn0Q7ssPjYLAIYdpuqh0UEB75
 fsEYRB1uwjdRzTafF2mrlcMuplbwZtx6jFQbbW61rjOu9e1gkIDtNv/ztPAOBxoXmYzV
 yhWioGJgcMeaPjIHNsEEWbyLcKDgIDKhNRimZHlTuH42qZy2xms8GQJooD87iRRg3J8z
 998g==
X-Gm-Message-State: ACrzQf3OoGKyb5FsHhiFhQ40ZvdMJvsfDx1YXilNymMszqbo/d3Iizi+
 p9v5WLIPyuMDxXZjQTdILwftTA==
X-Google-Smtp-Source: AMsMyM70+/VOogS/nMV0wJFx9waeVRaA4jrNXQQ29r24neD/YmQO8zlk52EhF8WFvy+TmtCfu9NCmw==
X-Received: by 2002:a17:903:2445:b0:178:38ee:70f with SMTP id
 l5-20020a170903244500b0017838ee070fmr428071pls.164.1664407862951; 
 Wed, 28 Sep 2022 16:31:02 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:986f:cb56:6709:4057?
 ([2602:47:d49d:ec01:986f:cb56:6709:4057])
 by smtp.gmail.com with ESMTPSA id
 d18-20020a621d12000000b0054d1a2ee8cfsm4543363pfd.103.2022.09.28.16.31.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Sep 2022 16:31:02 -0700 (PDT)
Message-ID: <2fcc2d02-16ee-9a2b-04ba-10f36aa20ab6@linaro.org>
Date: Wed, 28 Sep 2022 16:31:00 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 31/66] target/arm: Fix S2 disabled check in
 S1_ptw_translate
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20220822152741.1617527-1-richard.henderson@linaro.org>
 <20220822152741.1617527-32-richard.henderson@linaro.org>
 <CAFEAcA9MuZWy1Y7yMLdh-xVb=HhGxi6bzabeiE-KT7r2DLwnhA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA9MuZWy1Y7yMLdh-xVb=HhGxi6bzabeiE-KT7r2DLwnhA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.319,
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

On 9/20/22 09:01, Peter Maydell wrote:
> This doesn't actually change the behaviour, though, right?
> regime_translation_disabled() at this point in the patchset doesn't
> do anything that makes a distinction between Stage2_S and Stage2 AFAICT.
> So this is just making the code clearer; we fixed the actual bug in patch 19.
> 
> With a tweaked commit message,
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> 
> Alternatively, pull this patch earlier so it's before patch 19 and
> is the one fixing the bug; then patch 19 is only adding the
> is_secure argument to regime_translation_disabled() and doesn't
> fix the bug in passing. That would be neater but maybe the
> patchset reshuffle is too painful so I don't insist on it.

It wasn't too bad to reshuffle.

r~

