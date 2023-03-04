Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FBB06AA9B7
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Mar 2023 14:00:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYRTb-00072g-Fj; Sat, 04 Mar 2023 07:59:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pYRTZ-000726-Ga
 for qemu-devel@nongnu.org; Sat, 04 Mar 2023 07:59:01 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pYRTX-0006sl-7g
 for qemu-devel@nongnu.org; Sat, 04 Mar 2023 07:59:01 -0500
Received: by mail-wr1-x42a.google.com with SMTP id l25so4685708wrb.3
 for <qemu-devel@nongnu.org>; Sat, 04 Mar 2023 04:58:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DxdHjw/s28Owyw24iiOM9Er4+NbETXiniQ6lQjcMSeg=;
 b=RocJ08rAW6c8Qe4s8F9D9pmX5SNoGqW/+DSY7dif/glSJwvfxSgVIIdcTmUEadjkVz
 WZWlOZTjZmtWadWzNW4DKyTrJFoqIYpieEarEsjXYYpi3CwgIlTtK8+TFV+WXzRY4wzU
 5DbUNBS6qNJtiYZUDOrAJj4m5PLeKstGjrEwuadDYSQmdVdjIj4PewPqv8t4k6qJRWiv
 hDxf6cvnE5hcttiN1SVwP8Z9PxK8hK0znFJdAycjayqZqocJdZTpVe38HzTqEhCsG71o
 4zqqljcyDK2JfDirRi5ZghneYq0/N5e/FlG2xcFnOqKzX4z991tgYiMlswnr5du/Jhp9
 AcWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=DxdHjw/s28Owyw24iiOM9Er4+NbETXiniQ6lQjcMSeg=;
 b=zREszBemiZHbH/XRg3ipkeXI9Pzpo8k0VAYEqt8xxCQ8g4MF0gS4elF9gk4i13GQZJ
 EB+31A5Ht2FnqqkDNqEhrjhTDqGGYnC5/AU7+WFPJVvVPBygwjVXs5Ld0Lcm2jz0r5pd
 vtaaipeF9xImXgzO5svxqeE2oet150BTY5NZX+310HtqRjj5zeJuvXmQavUsnQUeQ2kU
 swx4RfxLkRPSPOTq0+CfK3IU1AI7SRkDzrgwfpfygz43lP/0o5ruPZu5DxSvk1ni/FWV
 asp7mC26w7tit1G/Pe+nH/S2/2KWsqYLe6+Px3iF8ZYkL3Xfv4DFu+lRU+7lK6e8U/wN
 f8Uw==
X-Gm-Message-State: AO0yUKVvAARjhWrTubRqxyJYNsQ/VLqsU4vK1mAsvVqdNVFRKO/LXtiP
 Fl2nnn2QYbIfiGk5K/HT0+kvcw==
X-Google-Smtp-Source: AK7set9NPhGI0cB9wFt1kvPvilUD+fVIBIB8qp3K3z/V4rwuOFCEPjaW1UCsSvtxx4usMs/8xWgsvg==
X-Received: by 2002:a5d:66c4:0:b0:2c7:a93:f892 with SMTP id
 k4-20020a5d66c4000000b002c70a93f892mr3577629wrw.55.1677934733696; 
 Sat, 04 Mar 2023 04:58:53 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 h2-20020adffd42000000b002cde626cd96sm4986376wrs.65.2023.03.04.04.58.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Mar 2023 04:58:53 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E84201FFB7;
 Sat,  4 Mar 2023 12:58:52 +0000 (GMT)
References: <3ccca5373de05be28b861c0e9e780c709703f0f7.1677862556.git.quic_mathbern@quicinc.com>
 <87mt4twl2l.fsf@suse.de>
User-agent: mu4e 1.9.21; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Fabiano Rosas <farosas@suse.de>
Cc: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>,
 qemu-devel@nongnu.org, philmd@linaro.org, tsimpson@quicinc.com
Subject: Re: hexagon: check-tcg rebuilding up to date image
Date: Sat, 04 Mar 2023 12:58:36 +0000
In-reply-to: <87mt4twl2l.fsf@suse.de>
Message-ID: <87jzzw3c6r.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
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


Fabiano Rosas <farosas@suse.de> writes:

> Matheus Tavares Bernardino <quic_mathbern@quicinc.com> writes:
>
>> Hi,
>>
>> We noticed that local `make check-tcg` is rebuilding the docker image
>> for qemu-hexagon at every run, whereas previously it would say "Image is
>> up to date" and move on.
>>
>> This was changed at 0b1a649047 (tests/docker: use direct RUNC call to
>> build containers, 2023-02-28), where we started to no longer use
>> docker.py and its image_matches_dockerfile() to skip image builds.
>>
>> Is this new behavior by design? Or perhaps do we have some local
>> docker misconfiguration that is not correctly using caches?
>
> Hi,
>
> We started relying on docker for the cache. Are you using docker or
> podman? There should be a RUNC variable in config-host.mak that you can
> check.
>
> And for the record, which version of either podman or docker?
>
>
> Alex,=20
>
> I think we might need to add DOCKER_BUILDKIT=3D1 $(RUNC) ... to properly
> make use of caching with docker. As for podman, I'm seeing conflicting
> information on the web as to whether it even supports caching.

As opposed to --build-arg BUILDKIT_INLINE_CACHE=3D1 or both?


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

