Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB93442E63
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 13:45:07 +0100 (CET)
Received: from localhost ([::1]:55928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhtA2-00029b-O0
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 08:45:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mhszD-0001jM-BF
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 08:33:56 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:39736)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mhszB-0000Ry-1p
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 08:33:54 -0400
Received: by mail-wr1-x431.google.com with SMTP id d27so15089610wrb.6
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 05:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=fPyD5DlP/4AAtDWcDR61ZgUIp4qEwl3Ldy8/32bG+7g=;
 b=JbgARB+2c17v0Fd2/mGNeUwUiDL7ljibmvZQuJ/oYJQFI+N8z6MwL5iUOG5m65ob7v
 QmZA7BwK9OGjZmQ5gtAaHpJlW6lCjtV4nVsjZazsxKzEsE1KcXEwiLEjbEZT1qyftDDE
 tG6nVBl/Z2BRtN/urx3Dh5AiHvalcFS6AzspTYOBTE1nBB3sNGW3ZVDbC/bj8DdfQbEd
 L8jYnJwz6CBB199UDoPFG2L/aNA4jdOfDbckI1WMqRt89rGbQQRL7eNz7zT59CEAHPe+
 xxShw967V8P+UemPtpgcPbfMIZt2FZwHueLeJTIRExxZv7zDXUbCgY+hsyQ3dxRSciCT
 cX9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=fPyD5DlP/4AAtDWcDR61ZgUIp4qEwl3Ldy8/32bG+7g=;
 b=bdbkPN+FarxFHvjW8i9fT8MpWuJ5Txsh9x0hNGQFFVKtVytj2MkN0BxwE05EHObIcY
 BsYzv5hY9oAhOafekurJa76lIxY/kxZKdpnPciPoMBTgV56GZfZV87yWs6RP97GuRZTP
 +az/2OY2NOIoX5J06vPUdS6eVJAehe51E6YdrSDtxYJdTK2YJNCwkTeVFlqIs/4B6PLh
 tCPmS0Qc8oE02TdKLPuSzvO6fvTi/dKylFquBpUDRTVplaDn7bmF3pjAZJOm2UhPYeEa
 Eut0IGSCmm7ucuexfBBVqzNjqVsHwjaIgj4ZxD6ammzRG3ouWTw/ZmyNDqmGGLyGYf7B
 7gRg==
X-Gm-Message-State: AOAM530OLuTxgnBzyfd0fwzjqfUG5Zssk40Oom9Z5ro+5vFXXmdeVOqh
 TdBKp8ka8pEzNuVchNixpgkGmuF8/MrjfA==
X-Google-Smtp-Source: ABdhPJw6cvMnAF2KgysfI1C9wP0GVOxpPyeqDF+6H9DcOL1nvIbo4JucTO4J7t30XI/thoOiefRFaw==
X-Received: by 2002:adf:ca03:: with SMTP id o3mr47576207wrh.424.1635856428358; 
 Tue, 02 Nov 2021 05:33:48 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id i15sm2342777wmb.20.2021.11.02.05.33.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 05:33:47 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id AD26F1FF96;
 Tue,  2 Nov 2021 12:33:46 +0000 (GMT)
References: <20211014224435.2539547-1-richard.henderson@linaro.org>
 <20211014224435.2539547-3-richard.henderson@linaro.org>
 <87ee8i1u2x.fsf@linaro.org>
 <1b40cad7-e2f7-c461-6cf5-b1a77b76eae8@amsat.org>
 <871r4i1s9g.fsf@linaro.org>
User-agent: mu4e 1.7.4; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH 2/7] tests/docker: Simplify debian-all-test-cross
Date: Tue, 02 Nov 2021 12:24:16 +0000
In-reply-to: <871r4i1s9g.fsf@linaro.org>
Message-ID: <878ry6lot1.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:
>
>> On 10/18/21 12:54, Alex Benn=C3=A9e wrote:
>>>=20
>>> Richard Henderson <richard.henderson@linaro.org> writes:
>>>=20
>>>> The base debian10 image contains enough to build qemu;
>>>> we do not need to repeat that within the new image.
>>>>
>>>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>>>> ---
>>>>  tests/docker/dockerfiles/debian-all-test-cross.docker | 5 -----
>>>>  1 file changed, 5 deletions(-)
>>>>
>>>> diff --git a/tests/docker/dockerfiles/debian-all-test-cross.docker b/t=
ests/docker/dockerfiles/debian-all-test-cross.docker
>>>> index dedcea58b4..b185b7c15a 100644
>>>> --- a/tests/docker/dockerfiles/debian-all-test-cross.docker
>>>> +++ b/tests/docker/dockerfiles/debian-all-test-cross.docker
>>>> @@ -8,11 +8,6 @@
>>>>  #
>>>>  FROM qemu/debian10
>>>>=20=20
>>>> -# What we need to build QEMU itself
>>>> -RUN apt update && \
>>>> -    DEBIAN_FRONTEND=3Dnoninteractive eatmydata \
>>>> -    apt build-dep -yy qemu
>>>> -
>>>>  # Add the foreign architecture we want and install dependencies
>>>>  RUN DEBIAN_FRONTEND=3Dnoninteractive eatmydata \
>>>>          apt install -y --no-install-recommends \
>>>=20
>>> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>>
>> IIUC if we keep --arch-only in the previous step (previous patch),
>> this step is required here.
>
> What for? The --arch-only prevents the attempt to install cross
> compilers that don't exist on a given host but we install all the cross
> compilers we need for tests explicitly.

Well patches 1 & 2 have been a cause of hair tearing the last two days. If
we replace the previous:

 $(apt-get -s build-dep --arch-only qemu | egrep ^Inst | fgrep '[all]' | cu=
t -d\  -f2)

which only installs (all) packages with:

  apt build-dep -yy --arch-only qemu

it breaks all the cross compiler images that are based on on debian10
because suddenly their:

  apt build-dep -yy -a $ARCH --arch-only qemu

will fail to build. However this is somewhat hidden by the fact that
most people pushing to gitlab would have that effect masked as the
images will be based on the older ones in the registry.

Of course I ran into the opposite problem trying to test things as we
aggressively used the upstream registry. As a result of the dropped the
build-dep in the all-cross but without being based on the new image we
end up without enough deps to build stuff.

In short I need to drop the first two patches.

--=20
Alex Benn=C3=A9e

