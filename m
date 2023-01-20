Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89AA567521E
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 11:10:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIoLJ-0006KW-5C; Fri, 20 Jan 2023 05:09:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pIoLH-0006KN-L5
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 05:09:51 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pIoLF-0006fM-NX
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 05:09:51 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 o17-20020a05600c511100b003db021ef437so3254629wms.4
 for <qemu-devel@nongnu.org>; Fri, 20 Jan 2023 02:09:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Prb0c30VHtX6Xna3DC174IeuAjhKB8LOiiOtWKCSY78=;
 b=uJjIH3g21l/L3KqJsUVFaY/3eNU/HWCfxnrkiWe5GZamvrZNpA7AMR39mOIDlCe0MG
 UoL4Vl7/nm0Nhyit8e+P+NGnLFHzdl68CdiOsxHb246Ae5pDtN1PfOMD2/472uqcOKvp
 N3Qxmb8yowZt7NZ8MCsfWIFF7OGtgMJegltZtlNlAuKfTFDbHm/xVkBgqR5xdmbk6sRn
 RhBsDLySC2t1mybPN7zZgS8Flv5d4vxh4YmhxPVjSbUGI0oC+ykO8Xfoou3WNWjOaiH0
 4/QupuKsXQDnRxli4FOYgVsYuNGBce0R7Y6IvOd8WTIihP4eQfhTRuXD0ejTSWAOawwC
 5Rbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Prb0c30VHtX6Xna3DC174IeuAjhKB8LOiiOtWKCSY78=;
 b=Z3n0GfIlB+eQXpzKe33/HL/ZN49IwehLgXQcDY8jKh3Taz8XSDqF80rHxe3K2B61CH
 o+nlAxDiZJTyMzI4bq2aOav0jB1867kFYlULkKkquhM2IoU3imnx6tJFXC1Ksn5Pl/dS
 yo/RFCRuZY3l6jIaA5tuz6W0+zsplmB9IgGQJDiuaMJx3RA/3Ivs9Jrq0iJsQ28jUCBA
 Z2xlQ+YLn5ocZOX21Q4ivEwG5jtpjeDw3YNy/CFqa8NWo3CKAob6Fl8oKCQ/mfG48VdJ
 Fa3bQg+8Y4gX8P0X0PKa3G0qV1lzt8q0isM4DOjZ3HM6cS3Vp3l5RH4g2PAiXUf/EEhQ
 Dx1w==
X-Gm-Message-State: AFqh2krfGEpSeIh6bon8crllxwGX7pwkzxj20TTEscrWWDV3mi6+iLVi
 iiC5AunBQPyjVUrznLG65FALnQ==
X-Google-Smtp-Source: AMrXdXtPuVIZlneJFc7so/cF1ZBKi4Ft2c8RmNtJXeGUMdd6ppSPWJgVGjC6gtzF088oN+SQgEMLWg==
X-Received: by 2002:a05:600c:1d8e:b0:3d1:fcb4:4074 with SMTP id
 p14-20020a05600c1d8e00b003d1fcb44074mr14150830wms.22.1674209388212; 
 Fri, 20 Jan 2023 02:09:48 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 k21-20020a05600c1c9500b003db30be4a54sm1543495wms.38.2023.01.20.02.09.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jan 2023 02:09:47 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 58D6A1FFB7;
 Fri, 20 Jan 2023 10:09:47 +0000 (GMT)
References: <20230119180419.30304-1-alex.bennee@linaro.org>
 <20230119180419.30304-11-alex.bennee@linaro.org>
 <e0203997-0161-8abc-de76-ebd88f117545@linaro.org>
 <9ae0faf8-da47-a86f-5365-0798914db6fb@redhat.com>
User-agent: mu4e 1.9.15; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org,
 Beraldo Leal <bleal@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Bandan Das <bsd@redhat.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, Michael Roth
 <michael.roth@amd.com>,
 Cleber Rosa <crosa@redhat.com>, Alexander Bulekov <alxndr@bu.edu>, Darren
 Kenny <darren.kenny@oracle.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, John Snow <jsnow@redhat.com>, Ed
 Maste <emaste@freebsd.org>, Wainer dos Santos Moschetta
 <wainersm@redhat.com>, Li-Wen Hsu <lwhsu@freebsd.org>, =?utf-8?Q?Marc-And?=
 =?utf-8?Q?r=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 10/18] Update lcitool and fedora to 37
Date: Fri, 20 Jan 2023 10:09:23 +0000
In-reply-to: <9ae0faf8-da47-a86f-5365-0798914db6fb@redhat.com>
Message-ID: <87k01hy0t0.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
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


Paolo Bonzini <pbonzini@redhat.com> writes:

> On 1/19/23 20:35, Philippe Mathieu-Daud=C3=A9 wrote:
>> On 19/1/23 19:04, Alex Benn=C3=A9e wrote:
>>> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>>>
>>> Fedora 35 is EOL.
>>>
>>> Update to upstream lcitool, that dropped f35 and added f37.
>
> If you also have time to update to commit
> 40589eed1c56f040d0f07fc354c242a0e0d83185 that would be nice (see
> https://patchew.org/QEMU/20230117091638.50523-1-pbonzini@redhat.com/
> for more information).  Otherwise, no hurry.

This round of testing/next has been painful enough, I'd like to get the
PR out of the way before starting again.

>
> Paolo
>
>>>
>>> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>>> Reviewed-by: Thomas Huth <thuth@redhat.com>
>>> Message-Id: <20230110132700.833690-7-marcandre.lureau@redhat.com>
>>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>>> ---
>>> =C2=A0 tests/docker/dockerfiles/fedora-win32-cross.docker | 4 ++--
>>> =C2=A0 tests/docker/dockerfiles/fedora-win64-cross.docker | 4 ++--
>>> =C2=A0 tests/docker/dockerfiles/fedora.docker=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 4 ++--
>>> =C2=A0 tests/lcitool/libvirt-ci=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
>>> =C2=A0 tests/lcitool/refresh=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 6 +++---
>>> =C2=A0 5 files changed, 10 insertions(+), 10 deletions(-)
>> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
>>=20


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

