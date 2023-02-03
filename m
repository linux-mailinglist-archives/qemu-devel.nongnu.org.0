Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC902689F45
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 17:30:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNywP-0000XE-FK; Fri, 03 Feb 2023 11:29:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pNywO-0000X5-4J
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 11:29:32 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pNywM-0007QY-Gm
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 11:29:31 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 n28-20020a05600c3b9c00b003ddca7a2bcbso4282792wms.3
 for <qemu-devel@nongnu.org>; Fri, 03 Feb 2023 08:29:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SwWfA+LJOqUyTOvY4UModLmacj6DsKgUeH5Qp6UW9kQ=;
 b=reGNbjnGiRwsK7iXkuj/iLabaFmT4XC7as9lj981nRvWeHyeOfLT5MiR507+eA6Q1W
 ik4g0eR3KedOHpF/4eM7sNWOHKkrLCom5+BIE+l4ZBxAXqlVz1RFh66aQpWbfb5iJgzm
 qs4ma/mwI84NSpCn5rqWeMw6OQa+OSdEZ6GycMRScJv/32Kxn3lhUY7ViXurSW91TFtg
 0fOnqdx4p3vFRvTA0JQaIxSl5ZT33cnUVdG+n3lNMFIwXAyuwDHeAX2uNxthmRiXXrH+
 eMYFm93FuLQhydTdgt4GGzqgK5s+dWf1xwanfR7yDxd/FIn4kpJsMyaUj+siufGZCkLo
 FTAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=SwWfA+LJOqUyTOvY4UModLmacj6DsKgUeH5Qp6UW9kQ=;
 b=QnApYzMlF2xMLBr4uQ9AmwjJSSpJyxsnfsCaW5tAnuvHMqTnuxSeqp0jJuJ7IZQ5CU
 XCHK8lHQ1w5xAKr4y4kjeVDz+9v3kNmOVJJvXJRKgE1IvNXEI74BwUKys+gpfm341I4F
 otzV9ArvUPId9Bjy75Cfk4Ute/3IBOoFCMNDaYuJWof+wa6CNkOebGKZNteWqxHVtVVr
 r3wfZdwMqpaRXiRDKfcT7DT8dOwwaaVvjzCMcvkBRdena25fV4xAbdV2Qh/H4r/adloP
 3KEYXCbwesW7q4liWrWCqGnlpMEod1IHuWpme6gvNsCa+n7XbTbLgCJ9+NJy3wbAsi37
 8GgA==
X-Gm-Message-State: AO0yUKXW3eq+aObkrHsc+sB5TxtETp9Z8x5/Eq9A4iL5UCVWlI8UjBzj
 9w1ZjtJH7kfeY19AGxr945vrQw==
X-Google-Smtp-Source: AK7set/qH8lPuOjQBvHth1YvdQUy6Yx+na9FR7dCdGR8B6M226ZmKhMEapV41MdNGpjeHJDqkdaXaA==
X-Received: by 2002:a05:600c:1c97:b0:3dd:dd46:171b with SMTP id
 k23-20020a05600c1c9700b003dddd46171bmr12226046wms.10.1675441768684; 
 Fri, 03 Feb 2023 08:29:28 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 j10-20020a05600c1c0a00b003dd1c45a7b0sm3526269wms.23.2023.02.03.08.29.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Feb 2023 08:29:28 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C44D01FFB7;
 Fri,  3 Feb 2023 16:29:27 +0000 (GMT)
References: <20230202175903.2119702-1-alex.bennee@linaro.org>
 <875ycjlwo8.fsf@linaro.org>
 <b674695a-793b-cceb-9083-72544fc1d67a@redhat.com>
User-agent: mu4e 1.9.19; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org, Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Wainer dos Santos
 Moschetta <wainersm@redhat.com>, Beraldo Leal <bleal@redhat.com>
Subject: Re: [RFC PATCH] gitlab: call ninja directly and reduce build noise
Date: Fri, 03 Feb 2023 16:28:03 +0000
In-reply-to: <b674695a-793b-cceb-9083-72544fc1d67a@redhat.com>
Message-ID: <87fsbmk908.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


Thomas Huth <thuth@redhat.com> writes:

> On 02/02/2023 19.59, Alex Benn=C3=A9e wrote:
>> Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:
>>=20
>>> A significant portion of our CI logs are just enumerating each
>>> successfully built object file. The current widespread versions of
>>> ninja don't have a quiet option so we use NINJA_STATUS to add a fixed
>>> string to the ninja output which we then filter with fgrep. If there
>>> are any errors in the output we get them from the compiler.
>>>
>>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>>> ---
>>>   .gitlab-ci.d/buildtest-template.yml | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)0
>>>
>>> diff --git a/.gitlab-ci.d/buildtest-template.yml b/.gitlab-ci.d/buildte=
st-template.yml
>>> index 73ecfabb8d..3c4b237e4f 100644
>>> --- a/.gitlab-ci.d/buildtest-template.yml
>>> +++ b/.gitlab-ci.d/buildtest-template.yml
>>> @@ -21,7 +21,7 @@
>>>         then
>>>           ../meson/meson.py configure . -Dbackend_max_links=3D"$LD_JOBS=
" ;
>>>         fi || exit 1;
>>> -    - make -j"$JOBS"
>>> +    - env NINJA_STATUS=3D"[ninja][%f/%t] " ninja | fgrep -v "[ninja]"
>>>       - if test -n "$MAKE_CHECK_ARGS";
>>>         then
>>>           make -j"$JOBS" $MAKE_CHECK_ARGS ;
>> This is too much for gitlab as it trips up on no output at all.=20
>
> I'm also not sure whether it is really safe to not run make here at
> all. Some parts of our build system still rely on the "make" magic, I
> think, and you might miss them if only running ninja. For example
> pc-bios/optionrom/ does not get compiled without running "make".

OK I'll see if I can embed it in make somehow.

> TBH, I also think the output of the file that currently gets compiled
> is still valuable in some cases, too, e.g. if you want to be sure
> whether certain files get compiled in one configuration at all or not.
> So I'm rather in favor in not doing this change.

For a successful build you can always go an examine the artefacts after
the fact. This is about making the CI log as short and informative as
possible to make spotting where errors occur easier.

>
>  Thomas


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

