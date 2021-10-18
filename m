Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E17D431780
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 13:36:10 +0200 (CEST)
Received: from localhost ([::1]:55980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcQw4-00042W-Ug
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 07:36:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mcQuA-00039R-KG
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 07:34:10 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:53200)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mcQu7-0003T5-NB
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 07:34:10 -0400
Received: by mail-wm1-x32c.google.com with SMTP id m42so8430322wms.2
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 04:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=srP6MmrfHmqek2tBLF1A0YDUTC81eFdB6YeYV725c7Y=;
 b=gHRgF/te9S8zbZfBAuf5JQ7kAii+lZVsnNsYnUPT1bXXUZXdX8Nlvjv65Eb3aKB3rE
 D8L4yz57Llu00T0XYBsK9hrW0sCYLwVdTKXYRv2Lp6E7lz0vhQHWhZUpPoRZL4AMpLzm
 O7FuCTdp47DBS2ACmC7bwIZ9e38lbZqPmN0y49g+TsL3ogiKFHOyVsZ7G1j6JELAWJj/
 fGLUlwZ5JPNOuktDnXzvHOCrfNncq3/+7aJ6/hkBTnMrxZgRqoSYMXmzhuZsjqoB2ugA
 XrOryLw8fBcXlXzshGxOJoyq4XHs6YyxGIQw8VxP6QRxnuis6fqIcBV0kJV3wi31NTuk
 kgzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=srP6MmrfHmqek2tBLF1A0YDUTC81eFdB6YeYV725c7Y=;
 b=5oad65SRX8SkP6JAZjzQYqGK7m7oXGWw76AvowN0AZo2E0yLYp+xgQaXP5P8PKRD12
 /m6EERIjmGvImYRkMlWPRoRSvaoitX3hdz3Os8EURH66ItwS7hWA/vuyjKl9lmWNxd6l
 JS1mPGbb1RpWQ3Wu/GOICrJjyZfghRjok+VEUuzOxKL5E2rK6IS/HU626B/HJEwHowJL
 ceYITAVfvAyeHOVX0v5qmdAM3Va47fbJzHEJsIbA37wKxDZvHJBQ78b0ao9VQuggw8wt
 FUGfsHQGsSRp9mrXLpuNal2Mp+tOG8eeS4MD3QZ/8hgYpKYqbdQAbK/O/M0pXuHldhZm
 Me8A==
X-Gm-Message-State: AOAM532zuowKvd2O+UB1409ZIiYWu/yvr1IK+q7z5JQoczEKrzwnohay
 pMpisTIKYggxibSqDvPb0l51sw==
X-Google-Smtp-Source: ABdhPJwBMpyWZCu50qkbxflAweGgBnaxAWb4TPq0gxY+XUARdy8jR3f5unmCLeJd6Hx1KedUg1SpLQ==
X-Received: by 2002:a05:600c:3595:: with SMTP id
 p21mr30085688wmq.71.1634556845299; 
 Mon, 18 Oct 2021 04:34:05 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id e15sm12216093wrv.74.2021.10.18.04.34.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 04:34:04 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3B06D1FF96;
 Mon, 18 Oct 2021 12:34:03 +0100 (BST)
References: <20211014224435.2539547-1-richard.henderson@linaro.org>
 <20211014224435.2539547-3-richard.henderson@linaro.org>
 <87ee8i1u2x.fsf@linaro.org>
 <1b40cad7-e2f7-c461-6cf5-b1a77b76eae8@amsat.org>
User-agent: mu4e 1.7.0; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH 2/7] tests/docker: Simplify debian-all-test-cross
Date: Mon, 18 Oct 2021 12:33:11 +0100
In-reply-to: <1b40cad7-e2f7-c461-6cf5-b1a77b76eae8@amsat.org>
Message-ID: <871r4i1s9g.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32c.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> On 10/18/21 12:54, Alex Benn=C3=A9e wrote:
>>=20
>> Richard Henderson <richard.henderson@linaro.org> writes:
>>=20
>>> The base debian10 image contains enough to build qemu;
>>> we do not need to repeat that within the new image.
>>>
>>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>>> ---
>>>  tests/docker/dockerfiles/debian-all-test-cross.docker | 5 -----
>>>  1 file changed, 5 deletions(-)
>>>
>>> diff --git a/tests/docker/dockerfiles/debian-all-test-cross.docker b/te=
sts/docker/dockerfiles/debian-all-test-cross.docker
>>> index dedcea58b4..b185b7c15a 100644
>>> --- a/tests/docker/dockerfiles/debian-all-test-cross.docker
>>> +++ b/tests/docker/dockerfiles/debian-all-test-cross.docker
>>> @@ -8,11 +8,6 @@
>>>  #
>>>  FROM qemu/debian10
>>>=20=20
>>> -# What we need to build QEMU itself
>>> -RUN apt update && \
>>> -    DEBIAN_FRONTEND=3Dnoninteractive eatmydata \
>>> -    apt build-dep -yy qemu
>>> -
>>>  # Add the foreign architecture we want and install dependencies
>>>  RUN DEBIAN_FRONTEND=3Dnoninteractive eatmydata \
>>>          apt install -y --no-install-recommends \
>>=20
>> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>
> IIUC if we keep --arch-only in the previous step (previous patch),
> this step is required here.

What for? The --arch-only prevents the attempt to install cross
compilers that don't exist on a given host but we install all the cross
compilers we need for tests explicitly.

--=20
Alex Benn=C3=A9e

