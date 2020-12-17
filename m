Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6C022DCED3
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 10:51:18 +0100 (CET)
Received: from localhost ([::1]:42378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kppwL-0006Mh-NU
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 04:51:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kppmR-0004qV-6z
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 04:41:03 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:45991)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kppmJ-0007jZ-2b
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 04:41:02 -0500
Received: by mail-wr1-x429.google.com with SMTP id d26so12648982wrb.12
 for <qemu-devel@nongnu.org>; Thu, 17 Dec 2020 01:40:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=M+tr7mFncEpFbMli579Awo902J6m+hUxFWBXhXMr8/Q=;
 b=nZflh/AyjYb79LTchhs6jkIQ/O4WGlCxldmIkRflgZUx/9GwGw6moaseMRGEd62pNx
 NMO8yyjFhw4TWqyQntX1Qt8hrExcgbRMkkoQ8uESJyDlIBOFQ6FcwdqKTvVVrn8mvPRB
 AmXjYkxc7KvdfoEY724B4fJ9VnONwDKie0Zx0j2llH60r7cBRZife9QQOTYO1oMhlqOQ
 AZ6YoSI4TKbRNLoO5D95A96QuE+7xX4U+C8CdYWqZvexxjvI98ZP4wVcMEpwamKRnGBR
 1mxp8PuX0zPB/qpD5FSz4HSns2W11n0raXQiBiPyleIHrq2MvBRr1fMVn5MB+vF8zGPW
 D76A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=M+tr7mFncEpFbMli579Awo902J6m+hUxFWBXhXMr8/Q=;
 b=TuGkcSJD0Nv+HkJtcYmjVZMHOUN4d9BDLvatE0dnnsk5qzTePyhiwXdHJB6VBsnO1O
 DjaMvPtKKeQzaXwUFwv3ewBxGGhusuIHU2GfNT63VaVKE3XqOp3+hlk0ToA4us5m2Bxq
 5X4IpcfumfYM+wiVedVk1uNEu/njb65OoGAT+JEd7pgzEMwGrTxeovUexJUv3IsG1Fs9
 hbrtJgkRiHWUUYv4ZNWFfBdL6F//Xzm6IpwvGvXx3LpEy6290V6lMINRcGb2Guotkk8+
 1ERX2kNvw3MTftTC1nIBluQlnMnih2aizHJD2LZEv6IZ/EKB+XGzLuQ5wfjV20iX7pPP
 mQ9Q==
X-Gm-Message-State: AOAM532HT5OjnoUCWHsUFrZTlWS4n83ctOv+nmBU474pOkClzEvic7qy
 F9aCjkKEui2TstD5nQVjk5UCgA==
X-Google-Smtp-Source: ABdhPJyxDZdTYgG3cqSPk4ywbuCrHC1Jbx5pAHAnWtri/JRPItouwGuBfZJ+VttTMh3jX4hXgCqEvQ==
X-Received: by 2002:a05:6000:1043:: with SMTP id
 c3mr11218233wrx.34.1608198053219; 
 Thu, 17 Dec 2020 01:40:53 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id m18sm7939814wrw.43.2020.12.17.01.40.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Dec 2020 01:40:52 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 513401FF7E;
 Thu, 17 Dec 2020 09:40:51 +0000 (GMT)
References: <20201216164827.24457-1-alex.bennee@linaro.org>
 <87ft45sj61.fsf@linaro.org>
 <CAFEAcA9iXp8z_L-t6Y_kVfRMJf9a6MGMJVsLNVwzq6VfO9-Xmg@mail.gmail.com>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL 00/11] testing and configure updates
Date: Thu, 17 Dec 2020 09:40:35 +0000
In-reply-to: <CAFEAcA9iXp8z_L-t6Y_kVfRMJf9a6MGMJVsLNVwzq6VfO9-Xmg@mail.gmail.com>
Message-ID: <877dpgsrbw.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Peter Maydell <peter.maydell@linaro.org> writes:

> On Wed, 16 Dec 2020 at 18:24, Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>>
>>
>> Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:
>>
>> > The following changes since commit af3f37319cb1e1ca0c42842ecdbd1bcfc64=
a4b6f:
>> >
>> >   Merge remote-tracking branch 'remotes/bonzini-gitlab/tags/for-upstre=
am' into staging (2020-12-15 21:24:31 +0000)
>> >
>> > are available in the Git repository at:
>> >
>> >   https://github.com/stsquad/qemu.git tags/pull-testing-161220-1
>> >
>> <snip>
>> >   - hotfix for centos8 powertools repo
>>
>> As you have noted this requires the cached copy to be deleted. I'm not
>> sure if it's worth handling that in code or if you just do that manually
>> before you merge?
>
> I would prefer it if the gitlab CI infra Just Worked. I don't
> want to be manually messing around with it...

OK it was only a missing diffutils, sending v2 shortly...

>
> -- PMM


--=20
Alex Benn=C3=A9e

