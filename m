Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A352696032
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 11:05:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRsAd-0004su-Tj; Tue, 14 Feb 2023 05:04:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pRsAb-0004sH-Lr
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 05:04:17 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pRsAZ-0004YS-OV
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 05:04:17 -0500
Received: by mail-wr1-x430.google.com with SMTP id k3so7399020wrv.5
 for <qemu-devel@nongnu.org>; Tue, 14 Feb 2023 02:04:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dHP0meoFJvkDF5j0tWexcDcER4CIk/zr4m3I7Nmch2Q=;
 b=uynLuY9VyHc+COascNBivvnOrqierlUy7WHb5FG1gEhjWTMuBzjBl9QR1+gEY8q28u
 vmY84yZbnVz2mU8v2JzeKxZ9XQYye4Pbr9CsMDpDhHeCE+XbfHCXmBHw1Hw67DmpqtnN
 f6O15i1++o3jiV0rqznQW39hLhcIVKw8yolE7TemxyKoIvHo7gtSVoluIrfVF2Y8dsPB
 RV+45f4FPKiQ4ObjK8JeaxGrgIi8M2JtATb1mA13ezJMCxBWGyzEud+0Y+do8RBXJBlf
 O/lh51C+H/BE7SP0+0eDGpsatW3IwwFQApxU/zjp9JGEKphUyYcclLKVNWO5F/tHP8dg
 rb4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=dHP0meoFJvkDF5j0tWexcDcER4CIk/zr4m3I7Nmch2Q=;
 b=P38HC1cmMosXubIsXQMcBYUwlQc4fboXuANOcRqtvyEGBKw78PlQtMC5HnXAY988tC
 v1xbUQ+9A1Xq09h7yuI+fMhgKzDjPuUrqGSvmTd83cj4ZURnFfICKX8w3tpiz+X+sAxc
 epPVZu/3LRfxvV932oSAayD4Wjb7AkaB5NBB3Oc6KLYkffPBppF698EAYEHBjtOAKFwE
 h1dPzBC5ALM01id8YboZ5yBpaIk4YXmCo+kerf6HnX+KruaQ4e+W2ZpStbpsKSFXd7gi
 KHROCvjN1TFpz/9rOusKudI6vv2gPh9aF6EqUsY4pI9wvASl+UMJMVAD4Ju48P2wsCe+
 2T3A==
X-Gm-Message-State: AO0yUKWLQY3Ek+B9xM5IXPZhhfaW+wKpt3BLd2ddQNP3t13uaCpzyEN2
 7vOugIT5DIZeqacdU/g4fNhgRw==
X-Google-Smtp-Source: AK7set+MKeeBMfmgGG8R3TEtnEMUqOMVUpYENL0ZueZRw8SYD/kKLEl8REL835EnG2bcJ+gMvjfzuQ==
X-Received: by 2002:a5d:680f:0:b0:2c3:db9e:4b06 with SMTP id
 w15-20020a5d680f000000b002c3db9e4b06mr1443969wru.45.1676369054111; 
 Tue, 14 Feb 2023 02:04:14 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 g20-20020a7bc4d4000000b003a3442f1229sm19904101wmk.29.2023.02.14.02.04.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Feb 2023 02:04:13 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 450321FFB7;
 Tue, 14 Feb 2023 10:04:13 +0000 (GMT)
References: <20230210003147.1309376-1-jsnow@redhat.com>
 <20230210003147.1309376-7-jsnow@redhat.com>
 <CAFEAcA-c5y0TR8vYg_FYEmGv3mOOmBgeD0cyb+mVotsP=r-Dsw@mail.gmail.com>
 <CAFn=p-aDV9=vG6hjTWRE6c52TpYSjDBU22nthTuejDCv_XrYMQ@mail.gmail.com>
 <CAFEAcA_eGvz_BQVLhVWtedRh2mcBuMEhv0RKF+6DW4t+9FdPAw@mail.gmail.com>
 <Y+Z2Kcq17HGWuoTV@redhat.com> <87cz6cpue3.fsf@pond.sub.org>
 <553f238a-56f2-4bd0-382a-80cfe116f138@redhat.com>
User-agent: mu4e 1.9.20; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>, =?utf-8?Q?Daniel_P=2E_Berrang?=
 =?utf-8?Q?=C3=A9?=
 <berrange@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, John Snow
 <jsnow@redhat.com>, qemu-devel <qemu-devel@nongnu.org>, Cleber Rosa
 <crosa@redhat.com>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Beraldo
 Leal <bleal@redhat.com>, Michael Roth <michael.roth@amd.com>, Wainer dos
 Santos Moschetta <wainersm@redhat.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Qemu-block <qemu-block@nongnu.org>, Hanna Reitz
 <hreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH v2 6/7] CI: Stop building docs on centos8
Date: Tue, 14 Feb 2023 09:59:01 +0000
In-reply-to: <553f238a-56f2-4bd0-382a-80cfe116f138@redhat.com>
Message-ID: <874jrobm1u.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
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

> On 14/02/2023 08.40, Markus Armbruster wrote:
>> Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:
>> [...]
>>=20
>>> We don't have to drop python 3.6. It is a choice because
>>> of a desire to be able to use some shiny new python
>>> features without caring about back compat.
>> I read this on Friday, and decided to let it sit until after the
>> weekend.  Well, it's now Tuesday, and to be frank, it's still as
>> offensively flippant as it was on Friday.  It shows either ignorance of
>> or cavalier disregard for the sheer amount of work some of us have had
>> to put into keeping old versions of Python viable.
>
> I'm a complete python ignorant, too, so I'm a little bit surprised of
> the amount of pain that these scripts are causing.
>
> No matter of that fact, I think Peter still has a point that we have a
> real conflict here with our current support policy. So this either
> means that Python was the wrong choice for our needs (since it is
> moving too fast and causing too much friction), or we should really
> rethink our support policy.
>
> I guess we're too deep into the Python rabbit hole already, and I'm
> not aware of any other good solutions (back to Perl scripts? No,
> thanks!), so it's likely quite impossible to tune that knob.
>
> Thus we should maybe really start talking about our support policy
> now. I think the main problem is likely the sentence "Support for the
> previous major version will be dropped 2 years after the new major
> version is released". Maybe we should shorten that time frame to 1
> year.

I think this should be a fair approach. Generally I recommend avoiding
installing a new LTS until at least the first tick release has ironed
out the obvious bugs. A year seems like a fair grace period to update to
the next LTS. Those that like sitting on old maintained LTS releases are
less likely to be tracking the bleeding edge of development anyway and
likely are happy with their distro provided packages.

BTW my next testing/next finally updates the last few Ubuntu 20.04 to
22.04 systems which also allows removing a few tsan and clang hacks in
the process. Progress might not be a straight line but it averages out
in that approximate direction ;-)

> The 2 years caused some confusions in the past already, since
> e.g. Debian only supports the previous major release for only one more
> year, and macOS also releases a major version each year ... so IMHO we
> could shorten the time frame for the previous major release to 1 year
> instead. People then could still continue building QEMU on CentOS 8,
> but they have to be aware that they might install other software like
> Sphinx manually if they want to continue using QEMU with docs there.
> What do you think?

Works for me at least.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

