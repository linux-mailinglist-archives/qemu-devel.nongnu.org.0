Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C91343CDD9
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 17:41:56 +0200 (CEST)
Received: from localhost ([::1]:45514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfl3r-0005fi-GI
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 11:41:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mfk60-0004Yj-EX
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 10:40:04 -0400
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131]:38728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mfk5y-0002R9-47
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 10:40:03 -0400
Received: by mail-lf1-x131.google.com with SMTP id x27so6674200lfu.5
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 07:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=rKdjPQY2L6p4ON1ACffId9/W0BHcSHE5CkiPX9q+b+E=;
 b=aX0c0ePLBjJF+swM/gNHRMtaWj+uH496ErvbNglq7Iyb9BUkW2IdqZvhLbq5Qo2gx2
 wFqclwq/rQ8Z7yof7JqBf1Cgt92tsLRCSNvLtPccYyh96hLJKbxTt7fnUDzHQoOrz25C
 U73O2LMlj8OVnUEgnEclgdDu5BCdCBaL2RrUKHHgbT2HFIcg4B1qw7Vwp+KIvnMmqAug
 uJpJIts/y3fB1kbwtDwaaKqz2VtUd7QqNX7AgkzCQ3TLCuA7n8jyhr/THBK7BDHRiv9P
 kS8pUFjkeSocxuM0YR9XlmClLG2sj70iKiQ79pFOgVZtVXjjx2AgpbgupTkueKUzXfuo
 8HnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=rKdjPQY2L6p4ON1ACffId9/W0BHcSHE5CkiPX9q+b+E=;
 b=hLFOnVMZaFlO8Wz3wbCVIfo/fFDV33vs0Uw0jqfW/LorxlXxL7bbSMnXFeR2KRlpEU
 YWnH5ZzAgAxyA0eSoi+R5wYoVUVAmmtbJNCXWlBQZP0Q5OWTVAqXKEGoczF5LgohpWs9
 3voGcE9iqvt6tTUhH0p7rQdCp/b79LPSe4BwWDYpDy2bxuwcGIxUlIzsnH8FPkcyoRrE
 zN1quxuDcyUBBaaCKU067P6EDaBFrRP13t/xdN+WHPmG6x7uWYisnpWeJfvqckUiVTCy
 zNXb9WqWhuIg8Ncwkfni8731qDE8nXb5GSx33esUlLrbdJzzQqRDSM2D28u26iY8Ed32
 x3Xg==
X-Gm-Message-State: AOAM5338YpDNndBiuMMqckCZCORMVBxrysuZ3iJTWLmIlz63cPGEiec9
 LnPWQW7JEbtyOT78zAhUl4g8Ug==
X-Google-Smtp-Source: ABdhPJxMtj+KEByoUGYddKoMvysicwDN4/JT9H1S53e/lQ2yurW7Om2uNxqt80sB9qNulx1ioVUWIg==
X-Received: by 2002:a05:6512:3ca3:: with SMTP id
 h35mr17264640lfv.128.1635345600015; 
 Wed, 27 Oct 2021 07:40:00 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id bi14sm13933lfb.290.2021.10.27.07.39.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 07:39:58 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E9D6B1FF96;
 Wed, 27 Oct 2021 15:39:57 +0100 (BST)
References: <20211021210539.825582-1-richard.henderson@linaro.org>
 <20211021210539.825582-42-richard.henderson@linaro.org>
 <87o87bzqz7.fsf@linaro.org>
 <e24676e5-b0a9-b795-ef79-6b8e46ed2797@linaro.org>
User-agent: mu4e 1.7.4; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v3 41/48] tcg/optimize: Sink commutative operand
 swapping into fold functions
Date: Wed, 27 Oct 2021 14:22:24 +0100
In-reply-to: <e24676e5-b0a9-b795-ef79-6b8e46ed2797@linaro.org>
Message-ID: <87zgquwmyq.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::131;
 envelope-from=alex.bennee@linaro.org; helo=mail-lf1-x131.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: luis.pires@eldorado.org.br, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> On 10/26/21 9:27 AM, Alex Benn=C3=A9e wrote:
>> I find this a bit magical. I couldn't find anything about TCGArg except
>> it's type:
>>    typedef tcg_target_ulong TCGArg;
>
> For an argument that contains a temp,
>
> static inline TCGArg temp_arg(TCGTemp *ts)
> {
>     return (uintptr_t)ts;
> }
>
> static inline TCGTemp *arg_temp(TCGArg a)
> {
>     return (TCGTemp *)(uintptr_t)a;
> }
>
> i.e. the TCGArg is in fact a pointer.
>
>> so I'm not sure what to make of -1 in this case. I guess it just means
>> we never have a (sum =3D=3D 0 && dest =3D=3D a2) leg but it's not obvious
>> reading the fold code.
>
> Indeed.  The use of -1 goes back quite a ways.  How about
>
> #define NO_DEST  temp_arg(NULL)
>
> which will also fail to match in that expression?

Sounds good to me. It would be nice to document the details of what
TCGArg can be in another patch.

--=20
Alex Benn=C3=A9e

