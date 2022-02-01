Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C7274A6782
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 23:05:31 +0100 (CET)
Received: from localhost ([::1]:50704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nF1HE-0002U5-WA
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 17:05:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nEx5T-0006R6-Vw
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 12:37:04 -0500
Received: from [2a00:1450:4864:20::334] (port=44982
 helo=mail-wm1-x334.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nEx5Q-0001hK-6O
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 12:37:03 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 l35-20020a05600c1d2300b0034d477271c1so2133455wms.3
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 09:36:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=v0Nbi3byio3Af7wXKfVjC/ReFTW4r5rj0UA5LskY/KY=;
 b=Uzju3Lj2/StNn9CL6vNYVNKS7JX84cvf+AINTBkwrydYQxF/N5L1n2kLzkfV4TlvBS
 rCmVsQKRhmPUM1KifPjs4G/S9KEnENoh/kF4BQjhclfWBf4vDuVwm00eFjgr+T7j3b3U
 rLrqsVUWFN2/Q0qCA9rUUYylM0JCmiep01wb//ioISivuQmBxSoJsTse5dT4N9PkY12l
 EGcW/HiKpLfDdSGAzqgB8X8kVQvMFXw//jjz7sVz5sQguW4etVK9g1wV+GpWOSo1Hi52
 6IepoGe5KFq7bHu9OYdI+/ZxaJyFmr5MrV9uANQjWdIqoqWbzAzvWBe/2XSxk6b9wKyy
 R9qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=v0Nbi3byio3Af7wXKfVjC/ReFTW4r5rj0UA5LskY/KY=;
 b=iXd8uswTGmu3Gw7IRv7OttGybvDvqVoriT2Ih1uLxHQHv73hXE7WCkdX6JsSPB/YUk
 z6EzIY0yG12WFE1cGgHyZbKN9ptx178y8R7fDWVIzmD0arXc8jl8DTfJSqBMdmNKfgz8
 fbPyT8F35zkUMy1yFcUVIgEVbwkhu4W/ee4I9VaEiOBr0PKddH28J/WybkVkRJkOhUM5
 3Ij4kOdiWI4HY3YnPQ9zQHCiPPqSX2iBddtv0gE0Ak+vUaSeCj2u2y/nN2mWh0z5u698
 201oW8wPw7OaYArdlmcyyzk2osq7U+5APbkpeO8JIc+T8Td6iINWmvV1PdHs8ZIJ/HCY
 zb+A==
X-Gm-Message-State: AOAM533+IMHf9vb/vo0lONoerenYp1m42codiobdt8pNIQmgZZ8aKWNj
 Wbdb9vB7GPShI+YZvCRW4FA9JA==
X-Google-Smtp-Source: ABdhPJyH7pEhyXd2QGlYnKBQa9I4H/WJ7jOroQ9Di82oIVdY3oUxwYHeb6mM4qYihGL6vI3SWs5GlA==
X-Received: by 2002:a05:600c:26c6:: with SMTP id
 6mr2690997wmv.54.1643736981450; 
 Tue, 01 Feb 2022 09:36:21 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id n8sm2844802wmq.42.2022.02.01.09.36.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 09:36:20 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 86B251FFB7;
 Tue,  1 Feb 2022 17:36:19 +0000 (GMT)
References: <20220201101911.97900-1-thuth@redhat.com>
 <CABJz62Osah308O2pHFMWs+D2X+Mq=aOf1NAKFcUaWF5bGzwJEw@mail.gmail.com>
User-agent: mu4e 1.7.6; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Andrea Bolognani <abologna@redhat.com>
Subject: Re: [PATCH 2/2] tests: Update CentOS 8 container to CentOS Stream 8
Date: Tue, 01 Feb 2022 17:35:44 +0000
In-reply-to: <CABJz62Osah308O2pHFMWs+D2X+Mq=aOf1NAKFcUaWF5bGzwJEw@mail.gmail.com>
Message-ID: <87k0eexze4.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::334
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?utf-8?Q?Daniel_P_=2E?= =?utf-8?Q?_Berrang=C3=A9?= <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Andrea Bolognani <abologna@redhat.com> writes:

> On Tue, Feb 01, 2022 at 11:19:11AM +0100, Thomas Huth wrote:
>> +++ b/tests/docker/dockerfiles/centos8.docker
>> @@ -1,10 +1,10 @@
>>  # THIS FILE WAS AUTO-GENERATED
>>  #
>> -#  $ lcitool dockerfile centos-8 qemu
>> +#  $ lcitool dockerfile centos-stream-8 qemu
>>  #
>>  # https://gitlab.com/libvirt/libvirt-ci
>>
>> -FROM docker.io/library/centos:8
>> +FROM quay.io/centos/centos:stream8
> [...]
>> +++ b/tests/lcitool/refresh
>> @@ -77,7 +77,7 @@ ubuntu2004_tsanhack =3D [
>>  ]
>>
>>  try:
>> -   generate_dockerfile("centos8", "centos-8")
>> +   generate_dockerfile("centos8", "centos-stream-8")
>
> I'm not convinced this is a good idea.
>
> CentOS 8 and CentOS Stream 8 are two pretty distinct operating
> systems in terms of update cadence and stability expectations, so I
> think that using the label "centos8" for containers and CI jobs that
> are actually consuming CentOS Stream 8 is going to be a source of
> confusion.
>
> I recommend proceeding with a thorough rename, after which the string
> "centos8" no longer shows up anywhere, instead.

Thomas do you agree? Should I drop the patch in favour or a new version
with a more extensive rename?

--=20
Alex Benn=C3=A9e

