Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E89FE314455
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 00:54:34 +0100 (CET)
Received: from localhost ([::1]:35654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9GMT-0004tJ-W3
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 18:54:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l9EAL-00010W-HT
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 16:33:55 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:44309)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l9EAJ-00021e-5y
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 16:33:53 -0500
Received: by mail-wr1-x42e.google.com with SMTP id g6so5954583wrs.11
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 13:33:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=aD9xfsq10PxtBx/j0KaHMDd4rUf7FkiAgK3pGOSDjXs=;
 b=Vm669/ED+6DOfUpWTPEi3qycx+rSU7Q1lEjwGsuIEQxEjmJ6oWFC5Og1LtgOsmqrXa
 yalduZrXY0ptAgAev2OLtqKWNzlu/kzvHwQM7x0jChTwSHK21i3/WxbsAkH8GyrXS3CC
 kVkip3+Bpb4eX62iQGeZsANjgHcn22JurHKke3bSuEGpgswXx6SsorKgOUHboInT9zzn
 aw6KmKrQ4o5n1galmEI/q+D+OBFi22aTEEkZ89NSfFHPWUOap2KcMI454NxnkX61a5Ir
 au4OfnIx6NQkBjvabJOAkH+GAHAsVJ60/IeeoSyNwFpfajxRubKf67GDtvgfm9Axz7On
 CASg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=aD9xfsq10PxtBx/j0KaHMDd4rUf7FkiAgK3pGOSDjXs=;
 b=Yz6cUM/rrjAXG0i3QmqUmaKfHzrU8lYq5ND4p+8d6Z2GJn0Wfm/GQ3ranrD9uW4GLE
 SCrTJeDfCTSLw9zxZXxESvDAWflKJEHzuQ0NXAf1kqXg46d3sEfkUsHuSdUakSMWBDr9
 g3dlkS6OxMoxC58joAJwcr6NxbOVf+M/bwSFhbqCWUWBpeqCPFfX7KwBPUvQFp5i4xoV
 PaCLQEHZ/wxXa05QfFF0uhFE5LTRaJi/nzGfGP+5W8BUJfdJ6b27FC7bsH5SBum7AwEZ
 7YcgMsA6t3N7Of/hl+hTeLky9HHIySysbHRg2XK/csPRycbDNEgI8FAfCLaqPxcicTnV
 csHQ==
X-Gm-Message-State: AOAM532Rqle2v9qGVxz5xQkDFOcjWu9AwlMIFQvTbvsMd+D6QldgbISE
 rGSYkbu6uorJnrZOVcJEf6twuw==
X-Google-Smtp-Source: ABdhPJz7shjYwraP5TO0HiYv9bPodayQ0iPjpP4LcjPQlVS8YntwVbfv1FU8ZSoyl+WXiAzwVzcpbg==
X-Received: by 2002:adf:e642:: with SMTP id b2mr22048278wrn.221.1612820029386; 
 Mon, 08 Feb 2021 13:33:49 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id n193sm816420wmb.0.2021.02.08.13.33.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 13:33:48 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6DC911FF7E;
 Mon,  8 Feb 2021 21:33:47 +0000 (GMT)
References: <20210205164459.432714-1-stefanha@redhat.com>
 <CAFEAcA-dQtOaXB-eHEbiF0Z7jF-wSHt0LwW8Bk+BU2B66+=Cyw@mail.gmail.com>
 <CAFEAcA8sOgF9Czy+GUBti7W-C9ZtW9PB+1YxG7mqAXKr5mV18g@mail.gmail.com>
 <20210208092723.GA18298@stefanha-x1.localdomain>
 <f14383aa-8213-83af-1411-de965180ea8b@redhat.com>
 <E45E85B2-F585-415F-B2FF-35A9C34855E8@oracle.com>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Jag Raman <jag.raman@oracle.com>
Subject: Re: [PULL v3 00/27] Block patches
Date: Mon, 08 Feb 2021 21:29:11 +0000
In-reply-to: <E45E85B2-F585-415F-B2FF-35A9C34855E8@oracle.com>
Message-ID: <87v9b29rd0.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>, John
 Johnson <john.g.johnson@oracle.com>, Thomas Huth <thuth@redhat.com>,
 =?utf-8?Q?Daniel_P=2E_Berrang?= =?utf-8?Q?=C3=A9?= <berrange@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 "Denis V. Lunev" <den@openvz.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Jag Raman <jag.raman@oracle.com> writes:

>> On Feb 8, 2021, at 5:02 AM, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.c=
om> wrote:
>>=20
>> On 2/8/21 10:27 AM, Stefan Hajnoczi wrote:
>>> On Sat, Feb 06, 2021 at 05:03:20PM +0000, Peter Maydell wrote:
>>>> On Fri, 5 Feb 2021 at 22:53, Peter Maydell <peter.maydell@linaro.org> =
wrote:
>>>>>=20
>>>>> On Fri, 5 Feb 2021 at 16:45, Stefan Hajnoczi <stefanha@redhat.com> wr=
ote:
<snip>
>>>=20
>>> Hi Elena and Jag,
>>> Please take a look at this QOM failure. I guess remote-pcihost is being
>>> built but pcie-host-bridge is missing from the s390x-softmmu target.
>
> Hi All,
>
> Thank you for letting us know about this build issue! We are working on r=
esolving it.
>
> We would like to ensure that the next version we send doesn=E2=80=99t cau=
se too many
> problems like this. Should the Travis/GitLab CI have caught this problem?
>
> We ran the following tests before sending the patches out for review:
> - =E2=80=9Cmake docker=E2=80=9D

On it's own it won't do much. You could go with:

  make docker-test-build@debian-s390-cross

You can't run make check for most cross builds but you can at least run
the builds themselves:

  make docker-test-build

should run the test build on all capable images. docker-all-tests should
be all possible tests.

> - Travis CI (will use GitLab going forward)
> - Tests in the =E2=80=9Ctests/acceptance=E2=80=9D folder.
>
> Is there any other tests we could run before sending the next
> revision?

Manually running: make check-block=20

>
> Thank you very much!


--=20
Alex Benn=C3=A9e

