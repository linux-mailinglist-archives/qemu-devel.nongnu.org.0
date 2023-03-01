Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 097136A6B3F
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 12:00:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXKBS-0004cW-LZ; Wed, 01 Mar 2023 05:59:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pXKBP-0004ag-Ot
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 05:59:40 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pXKBL-0006Kk-SZ
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 05:59:39 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 o38-20020a05600c512600b003e8320d1c11so454596wms.1
 for <qemu-devel@nongnu.org>; Wed, 01 Mar 2023 02:59:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Yg0W5eRXobLzaPOXLVmBbDVbLWXhmv6d4JftKNAy+fk=;
 b=E7+wMHk7IMdnAMfvTeDy/U58SQyuEynPD0Q5NeAZjrnnqN8lqQAAK7JkREF1MO8rqH
 7wEJdHUaG05W2cXwKU85nBZeH3g5SAbFF3R8IUtKc/sdCaA5zAX01pXAkwOn2xi7H+Ev
 ZjSUrSp4JBP2P8kGRCde2eHo6XOyG3UTzrXMfUJ6tMOjRWBl+kIqJhAQH97k2Q/aWk3N
 eb9unMcSsralI8TTPfWeSnatMjCAbFEB+AYfDUWBVyXgMJvOyPgKD7njapYlRpkZIywO
 3OKfRwMl91U3fr0l4i6EzwiZpcifWkmVptz2xKnbnORkvfbHfawc39s4bMhSPrar28eq
 124Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Yg0W5eRXobLzaPOXLVmBbDVbLWXhmv6d4JftKNAy+fk=;
 b=WuqV0tQKgQvx1A5C2RFXLtHmKXU4LSBuhiFo0N9VSj4FtXdraLkeiNpYEGqioJnuOn
 pjy6cF8nMGEVVyK/+m1KjtDbEgEkKaGdE4gRlOD0l2/Lf7rxBD8b56TL4+mH1Vq8oEVp
 yI7ywMxn5UqLz49hvrFi9MwTNrZYyyryV7krOKGIwH+bnxPEyZ7uonn8KkX8EqeKC671
 GzjGHlFoBznozIDBrlqATjquDktlreP2/TpHdtDaOMfQPrgwgCsTfEDHbMY8ZrFXK80Z
 QuK9T8Dc8GzCq5cGKnnMb1Js6v93hVLfGwRfJQwHsCQ+NVWhBcJCCXwiyDwXoHwk34Sk
 i3/A==
X-Gm-Message-State: AO0yUKU63H81k+kh5iKolYdnYEy+KlT9/teej+WIRrZv3hWWs3Ru1wOC
 nrG0qHxfIgd1s8MjcIwCul1wLg==
X-Google-Smtp-Source: AK7set/ySh9uV3U7GBYuG9OCqAgsY6xZLW5fCqH46iOlJcJsJ81ShyRr/lCvl6ZSUMHVGwXe1N7sQA==
X-Received: by 2002:a05:600c:2e95:b0:3dc:4313:fd1e with SMTP id
 p21-20020a05600c2e9500b003dc4313fd1emr4609017wmn.34.1677668372190; 
 Wed, 01 Mar 2023 02:59:32 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 c11-20020a056000104b00b002be0b1e556esm11960620wrx.59.2023.03.01.02.59.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 02:59:31 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 597231FFB7;
 Wed,  1 Mar 2023 10:59:31 +0000 (GMT)
References: <20230228190653.1602033-1-alex.bennee@linaro.org>
 <20230228190653.1602033-24-alex.bennee@linaro.org>
 <02a2118a-badf-29a9-716d-44f5a6c2923d@linaro.org>
User-agent: mu4e 1.9.21; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>,
 =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, Michael Roth
 <michael.roth@amd.com>, Peter Maydell <peter.maydell@linaro.org>, Kevin
 Wolf <kwolf@redhat.com>, Beraldo Leal <bleal@redhat.com>, Alexander
 Bulekov <alxndr@bu.edu>, Aurelien Jarno <aurelien@aurel32.net>, Markus
 Armbruster <armbru@redhat.com>, Darren Kenny <darren.kenny@oracle.com>,
 Hanna Reitz <hreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>, John Snow
 <jsnow@redhat.com>, Ed Maste <emaste@freebsd.org>, qemu-arm@nongnu.org,
 Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>, Yonggang Luo
 <luoyonggang@gmail.com>, qemu-block@nongnu.org, Paolo Bonzini
 <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, Bandan Das
 <bsd@redhat.com>, Li-Wen Hsu <lwhsu@freebsd.org>, Pavel Dovgalyuk
 <pavel.dovgaluk@ispras.ru>, Laurent Vivier <lvivier@redhat.com>, Bastian
 Koppelmann <kbastian@mail.uni-paderborn.de>, Qiuhao Li
 <Qiuhao.Li@outlook.com>, Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: Re: [PATCH v3 23/24] tests/docker: add zstdtools to the images
 (!AWAITING UPSTREAM)
Date: Wed, 01 Mar 2023 10:59:14 +0000
In-reply-to: <02a2118a-badf-29a9-716d-44f5a6c2923d@linaro.org>
Message-ID: <87k000d9f0.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
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


Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> On 28/2/23 20:06, Alex Benn=C3=A9e wrote:
>> We need this to be able to run the tuxrun_baseline tests in CI which
>> in turn helps us reduce overhead running other tests.
>> [See https://gitlab.com/libvirt/libvirt-ci/-/merge_requests/361]
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> ---
>>   tests/docker/dockerfiles/alpine.docker                | 1 +
>>   tests/docker/dockerfiles/centos8.docker               | 3 ++-
>>   tests/docker/dockerfiles/debian-amd64-cross.docker    | 3 ++-
>>   tests/docker/dockerfiles/debian-amd64.docker          | 3 ++-
>>   tests/docker/dockerfiles/debian-arm64-cross.docker    | 3 ++-
>>   tests/docker/dockerfiles/debian-armel-cross.docker    | 3 ++-
>>   tests/docker/dockerfiles/debian-armhf-cross.docker    | 3 ++-
>>   tests/docker/dockerfiles/debian-mips64el-cross.docker | 3 ++-
>>   tests/docker/dockerfiles/debian-mipsel-cross.docker   | 3 ++-
>>   tests/docker/dockerfiles/debian-ppc64el-cross.docker  | 3 ++-
>>   tests/docker/dockerfiles/debian-s390x-cross.docker    | 3 ++-
>>   tests/docker/dockerfiles/fedora-win32-cross.docker    | 3 ++-
>>   tests/docker/dockerfiles/fedora-win64-cross.docker    | 3 ++-
>>   tests/docker/dockerfiles/fedora.docker                | 3 ++-
>>   tests/docker/dockerfiles/opensuse-leap.docker         | 3 ++-
>>   tests/docker/dockerfiles/ubuntu2004.docker            | 3 ++-
>>   tests/docker/dockerfiles/ubuntu2204.docker            | 3 ++-
>>   tests/lcitool/projects/qemu.yml                       | 1 +
>>   18 files changed, 34 insertions(+), 16 deletions(-)
>
> You simply ran 'lcitool-refresh', right? (not obvious from the
> commit desc).
>
> If #361 got merged, this patch should also change the
> tests/lcitool/libvirt-ci submodule to include it, isn't it?

Yes - I've already done that in my PR branch.


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

