Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F23C5664309
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 15:19:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFEEg-0007HC-SS; Tue, 10 Jan 2023 08:00:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pFEEb-0007GC-EG
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 08:00:09 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pFEEY-0004wb-Ks
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 08:00:09 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 c4-20020a1c3504000000b003d9e2f72093so6965335wma.1
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 05:00:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=haTSXLZFB+0fgWvK7qQx/OLu2A1gLvL7Alhp7Avur54=;
 b=qIKRcncy1SWfRwKvQY9Cf259iwK4l0wJNQTMOJ6IVWUoBH0NvlSkMTMVyZxlza3qhi
 X5iXg8w0iktrlR7h0qgq56aRBwKnphkLhVloKkB6DDnC+RgzDNoXz+dqSNPPxOHQ35cv
 50QPCyHqjDV/IHcKceEZOtAYYvtNVQakscyWteV4B8ZN+OzdIIOOpIiIa0djFVnROUTD
 R8Cg2hQGzbLEyGpglGxozSTWP8lhdk3beIXs2vlHACeDg8kbcsHvqBYCanWv4pubVMSd
 pL6LX8ixwsSYaPpXvwmLQmXa7tBLA1Hwkp0vcDWhB/H4UsYg7fi7/g+IMw/L39utq6y/
 RGHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=haTSXLZFB+0fgWvK7qQx/OLu2A1gLvL7Alhp7Avur54=;
 b=hPHuC8xFl7VS3ayzqjCn1XR4B1WSv7m9mrTQ5PZ+ipExYpVDKJ1xoRpzm6jy/+YrwE
 /5Z1Dj1SnuGHTXEqlRD6qw7YuUE6u2sPcdxKAjdUpzmZpBIHN7tvQYgFAmylZyOhA2kL
 n3e1zxoEjy63LNoL4bOe6g5S2yDzNUtCazU7J9zQqMs8XezdCVvMoT3raYDU7ybAxQYL
 t2GWrumhWc4rnM9Wyp/QfW4Ss/IceeX6BfFyCykBgL/pFx6N8VTaTZFGsUJFWEYiFotN
 wWxyK/EHge/CgDuVjrb630tDZzbCv4YV19twvGPvd4ULxGpTaQlAaQHdmKRRy9PyV74r
 85UQ==
X-Gm-Message-State: AFqh2kqMbkakOuGt8q8cU77c2ATjr9hEKhtzujDtOvadwcBjGAGpFtC5
 BnqYxZqS64Iiw7e1f0YGg61hGw==
X-Google-Smtp-Source: AMrXdXvfQEOwl9BJ3r1cgTgTaWZWx4HiodadYbeeyeF+AG4kP4xLZsIB7tVVbM2qXhagPEDBm5raQg==
X-Received: by 2002:a05:600c:3acd:b0:3d1:c354:77b6 with SMTP id
 d13-20020a05600c3acd00b003d1c35477b6mr53139276wms.29.1673355604929; 
 Tue, 10 Jan 2023 05:00:04 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 m18-20020a05600c4f5200b003c6b70a4d69sm16840472wmq.42.2023.01.10.05.00.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jan 2023 05:00:04 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0E2A31FFB7;
 Tue, 10 Jan 2023 13:00:04 +0000 (GMT)
References: <20230110080246.536056-1-marcandre.lureau@redhat.com>
 <87358ioen0.fsf@linaro.org>
 <CAMxuvayOmvVpWwDvF-LpF35ntD+p-pVVj9athsjB6fGsWYOypw@mail.gmail.com>
User-agent: mu4e 1.9.12; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Cc: qemu-devel@nongnu.org, Eric Farman <farman@linux.ibm.com>, Halil Pasic
 <pasic@linux.ibm.com>, pbonzini@redhat.com, Markus Armbruster
 <armbru@redhat.com>, qemu-s390x@nongnu.org, David Hildenbrand
 <david@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>, Christian
 Borntraeger <borntraeger@linux.ibm.com>, =?utf-8?Q?Daniel_P=2E_Berrang?=
 =?utf-8?Q?=C3=A9?=
 <berrange@redhat.com>, Cleber Rosa <crosa@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Ed Maste <emaste@freebsd.org>,
 kraxel@redhat.com, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Michael
 Roth <michael.roth@amd.com>, Li-Wen Hsu <lwhsu@freebsd.org>, John Snow
 <jsnow@redhat.com>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>
Subject: Re: [PATCH v3 0/8] Fix win32/msys2 shader compilation & update
 lcitool deps
Date: Tue, 10 Jan 2023 12:58:58 +0000
In-reply-to: <CAMxuvayOmvVpWwDvF-LpF35ntD+p-pVVj9athsjB6fGsWYOypw@mail.gmail.com>
Message-ID: <87tu0ymtnw.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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


Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com> writes:

> Hi
>
> On Tue, Jan 10, 2023 at 2:41 PM Alex Benn=C3=A9e <alex.bennee@linaro.org>=
 wrote:
>
>  marcandre.lureau@redhat.com writes:
>
>  > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>  >
>  > Hi,
>  >
>  > Fix the shader compilation error on win32/msys2 and convert the relate=
d script
>  > from perl to python. Drop unneeded dependencies from lcitool project.
>
>  Queued to testing/next, thanks.
>
> Thanks but wait for v4, Thomas pointed out some issues with the python
> scripts +x.

Ok, if you post them today I can include them in my omnibus maintainer
tree series which I'm building at the moment.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

