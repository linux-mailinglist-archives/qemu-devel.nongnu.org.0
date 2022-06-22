Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9A72554DEA
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jun 2022 16:51:56 +0200 (CEST)
Received: from localhost ([::1]:34732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o41hy-0006Yh-M6
	for lists+qemu-devel@lfdr.de; Wed, 22 Jun 2022 10:51:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1o41fW-0004i1-AJ
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 10:49:22 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:43553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1o41fU-0000r3-Bs
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 10:49:22 -0400
Received: by mail-ej1-x634.google.com with SMTP id u15so7115275ejc.10
 for <qemu-devel@nongnu.org>; Wed, 22 Jun 2022 07:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=/U++XC8k8QJ2raWvek6wr8W/eA0ssZP6VfDG16NKfc8=;
 b=IeMMc08OcSXVo4BpTvhNwG3Up00gpjHLT0HoHRHX03cBF9kpYykrdRMMjR9OBTmeF8
 3vfZ0rQ67dBEgiJrG5KeWUf5de+ds5ObLU9v/+MA1bwyPhqaX4B9IJ7x4/iG3+49mxMP
 csUqAKqloG6aIMyIVgS3ha8Tc7XU6hk55AC+X7jRCdFbwTL96eiPA3cr/Wo2X1MUUkvi
 DdL/0Fxodr40Gxpgw+4EJs1PgAUScm7QTboEi2oL0ep0raNDq+bW5u+aEbdXga2/b/Cd
 ais3ITNBcG1rELFHsbSuNaJyhAZwdwUw/KauWTCm9zeYkg8CSboLxpAC9RMIxdd19OCT
 qGLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=/U++XC8k8QJ2raWvek6wr8W/eA0ssZP6VfDG16NKfc8=;
 b=EFcx+TdDoT8jO5ikjo5KdqahhloeFB2oxW2cJRjysaT0xcBQCeJJ9BUGb6EbTEhdNx
 2pQtWxonRkq0xso4r3DaZxxKMJr29oklSA7Gqaafa+fm4+wJUqAFdjBuDJCCPZmbtBkQ
 gjRAmuXh72yft0Y+1czbT5VrU2xA5NXEtTzSu9fiILxhMr6YS41rhWsdMYi+eYggY5X5
 IVHePTTjj5dS+5HgkZgCOz5KVrdmoX/JJahGYM59Hgn9FmBp9JfX0LaywHGMuTe3b7QV
 GM/JpKBSzKmcCJal7L8SBv5fC26zgiChQygCdp1HhlPHEjlfG5CIULsO95TT8ltW4ko+
 LEcQ==
X-Gm-Message-State: AJIora9u7tt6QTKdda02TGf1qDXO+0ppq+d/4Ttslf/NuBI+x/UFBwjF
 iM/foYYyo3UlfXTuz74iTFHXww==
X-Google-Smtp-Source: AGRyM1uPQd87IrjgWUBVlVG4etqsHzSF/FVfFbNtnHhbOw7miYk/T4+uDk7zcm11A2FmeRSD+4CUlA==
X-Received: by 2002:a17:907:6e8f:b0:710:865b:9c90 with SMTP id
 sh15-20020a1709076e8f00b00710865b9c90mr3314539ejc.27.1655909358515; 
 Wed, 22 Jun 2022 07:49:18 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 eg40-20020a05640228a800b004356d82b129sm10991120edb.80.2022.06.22.07.49.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jun 2022 07:49:17 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id DC9741FFB7;
 Wed, 22 Jun 2022 15:49:16 +0100 (BST)
References: <20220622123305.3971169-1-alex.bennee@linaro.org>
 <CAFEAcA_v+VM1kd=_D2Tm7DkkS=i+3k26aaM-YGjnTT6-zsPDxg@mail.gmail.com>
User-agent: mu4e 1.7.27; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Anders Roxell <anders.roxell@linaro.org>, Remi
 Duraffort <remi.duraffort@linaro.org>, Philippe =?utf-8?Q?Mathieu-Daud?=
 =?utf-8?Q?=C3=A9?=
 <f4bug@amsat.org>, Thomas Huth <thuth@redhat.com>, Wainer dos Santos
 Moschetta <wainersm@redhat.com>, Beraldo Leal <bleal@redhat.com>
Subject: Re: [RFC PATCH] gitlab: add a binary build to project registry
Date: Wed, 22 Jun 2022 15:43:54 +0100
In-reply-to: <CAFEAcA_v+VM1kd=_D2Tm7DkkS=i+3k26aaM-YGjnTT6-zsPDxg@mail.gmail.com>
Message-ID: <87bkukrbwz.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

> On Wed, 22 Jun 2022 at 13:33, Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>>
>> There have been requests from other projects such LKFT to have
>> "official" docker images with pre-built QEMU binaries. These could
>> then be consumed by downstream CI systems by pulling directly from the
>> qemu-project container registry. The final image could then be run by
>> doing:
>>
>>   docker run --rm -it \
>>     registry.gitlab.com/qemu-project/qemu/qemu/debian-amd64-binaries \
>>     /opt/bin/qemu-system-aarch64 $ARGS
>>
>> To keep the build time down we skip user-mode, documents, plugins and
>> a selection of the more esoteric hardware emulations. Even so it still
>> takes over an hour to build and install everything.
>
>> This is very much an RFC for now as we have traditionally not provided
>> binaries for our users except for the slightly special case of
>> Windows. As currently structured this will rebuild the binaries on
>> every merge but we could change the generation rules to only trigger
>> for tagged or stable branch pushes. We also wouldn't be testing these
>> binaries so we are basically assuming they are OK by the nature of
>> being built from master which in theory never breaks.
>
> I'm a bit uncertain about providing "official" docker images
> or other pre-built binaries, because it might give the impression
> that these are OK to use with KVM, when in fact they won't necessarily
> get security fixes in a timely manner, and almost all users of QEMU for
> KVM purposes are better off with the distro QEMU.

Do we have any sort of idea how long it takes from a CVE being fixed in
a distro kernel to the eventual merge of a patch in master?

Anyway the main use case for this is emulation where we want to get new
features under -cpu max into the CI loops as soon as possible. I think
the LKFT guys are testing KVM as well though and again want to see new
KVM features as soon as possible.

I'm not proposing these images are uploaded to docker.io so less likely
to be hit by the default:

  docker run qemu:latest

(they instead get 6 year old things packages by someone calling
themselves qemu: https://hub.docker.com/u/qemu)

>
> thanks
> -- PMM


--=20
Alex Benn=C3=A9e

