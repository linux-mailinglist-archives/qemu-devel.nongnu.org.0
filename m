Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64C8F6338EA
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 10:47:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxPra-0006Pw-BN; Tue, 22 Nov 2022 04:46:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oxPrY-0006Nk-B8
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 04:46:44 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oxPrQ-0003ys-Si
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 04:46:40 -0500
Received: by mail-wr1-x435.google.com with SMTP id i12so19972860wrb.0
 for <qemu-devel@nongnu.org>; Tue, 22 Nov 2022 01:46:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4TOa8QO+Ybd3a/GBS2FwwdQtEAo8FOxJFLHCPIdTbRs=;
 b=fzINVWNj5ekWYw3S4QKZ9vXUWZJshHQwPZ3Yi/Nk3Lg/eeEhvXiHDJKkxW6eL9us+l
 BVbgr33SoWNa4fef0QlpY+O+T/pkSnJQWxXTpLZLkJb6LuuISEM3g60QzP5MnxM4IpX7
 gsuetwOP4D5fEm7aGx48Jc2//Xt0ETfykQHN6LYMIdWL9bdnti/Qyz8K7RExTvgCIBJ4
 es6HiL/mn38AwudJZlxnECYLIOB9dAXPiRRJhyTysOBNXjMVeQ5HSTf32N++rEMWVpNP
 jK93xMWK+NL8ymTRJYWoi3AeOzVaI8hrO1xRrUh+dFuyv2zA7Njr7SVWiwatIoSihyjs
 BGxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=4TOa8QO+Ybd3a/GBS2FwwdQtEAo8FOxJFLHCPIdTbRs=;
 b=bujenfiiq+aLyi2J7KZgFQdfqJgAYx6ivtZDNRwG7NXR8fw/ueCQl03banxdDmcq4K
 w+heT6rlKMSOLfUK7f3GFK7ZD+ebpi4TMHx3pLAgFvGsuHllJcSeaXiEipkBdBK0QYOm
 utmPZYNGCrfZQJ6S6Fp7jFM18sStkJoRh94ir3u2/0jSuBwMfNosOOu8P69RSuuE/kAB
 GzRLIJbko0hiz7qVFvi2K9b5plVPuKhPwGTnx+Ods2WwFquEf6kiN9hot1OsXqr/YI/K
 mBvSUBZpfwhMFX+aquezlT5E5XBK7dSnIOrT8GUx7aJawnZhfMwkv3DJq2nowtXNl2OA
 iPXg==
X-Gm-Message-State: ANoB5pmj9yvEgQeD8wysGUvbmgGFpEMvBY3mdrh78vVl6VqLRlLXmaaQ
 rNUhR1TJirIjJx0POIT0KcuSnQ==
X-Google-Smtp-Source: AA0mqf6Ic0+k4k/8FTFX7KypeKPiqUetPR9K0LQnQZc+iUTQDwPOko+dcQTEqu6q4DtuB3ygWk6W2Q==
X-Received: by 2002:a05:6000:104c:b0:23a:5a31:29eb with SMTP id
 c12-20020a056000104c00b0023a5a3129ebmr6887994wrx.679.1669110394231; 
 Tue, 22 Nov 2022 01:46:34 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 t1-20020a1c7701000000b003cf4d99fd2asm15971956wmi.6.2022.11.22.01.46.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Nov 2022 01:46:33 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 034731FFB7;
 Tue, 22 Nov 2022 09:46:33 +0000 (GMT)
References: <20221117172532.538149-1-alex.bennee@linaro.org>
 <20221117172532.538149-5-alex.bennee@linaro.org>
 <000c7ccb-562d-0c41-aacc-bc9481b76eae@linaro.org>
User-agent: mu4e 1.9.3; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, fam@euphon.net, berrange@redhat.com,
 f4bug@amsat.org, aurelien@aurel32.net, pbonzini@redhat.com,
 stefanha@redhat.com, crosa@redhat.com
Subject: Re: [PATCH v3 04/13] docs/devel: add a maintainers section to
 development process
Date: Tue, 22 Nov 2022 09:45:45 +0000
In-reply-to: <000c7ccb-562d-0c41-aacc-bc9481b76eae@linaro.org>
Message-ID: <87sfibb9tz.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
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


Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> On 17/11/22 18:25, Alex Benn=C3=A9e wrote:
>> We don't currently have a clear place in the documentation to describe
>> the roles and responsibilities of a maintainer. Lets create one so we
>> can. I've moved a few small bits out of other files to try and keep
>> everything in one place.
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
>> Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
>> Message-Id: <20221111145529.4020801-6-alex.bennee@linaro.org>
>> ---
>>   docs/devel/code-of-conduct.rst           |   2 +
>>   docs/devel/index-process.rst             |   1 +
>>   docs/devel/maintainers.rst               | 106 +++++++++++++++++++++++
>>   docs/devel/submitting-a-pull-request.rst |  12 +--
>>   4 files changed, 113 insertions(+), 8 deletions(-)
>>   create mode 100644 docs/devel/maintainers.rst
>
>> +The Role of Maintainers
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +
>> +Maintainers are a critical part of the project's contributor ecosystem.
>> +They come from a wide range of backgrounds from unpaid hobbyists
>> +working in their spare time to employees who work on the project as
>> +part of their job. Maintainer activities include:
>> +
>> +  - reviewing patches and suggesting changes
>> +  - collecting patches and preparing pull requests
>> +  - tending to the long term health of their area
>> +  - participating in other project activities
>> +
>> +They are also human and subject to the same pressures as everyone else
>> +including overload and burnout. Like everyone else they are subject
>> +to project's :ref:`code_of_conduct` and should also be exemplars of
>> +excellent community collaborators.
>> +
>> +The MAINTAINERS file
>> +--------------------
>> +
>> +The `MAINTAINERS
>> +<https://gitlab.com/qemu-project/qemu/-/blob/master/MAINTAINERS>`__
>> +file contains the canonical list of who is a maintainer. The file
>> +is machine readable so an appropriately configured git (see
>> +:ref:`cc_the_relevant_maintainer`) can automatically Cc them on
>> +patches that touch their area of code.
>> +
>> +The file also describes the status of the area of code to give an idea
>> +of how actively that section is maintained.
>> +
>> +.. list-table:: Meaning of support status in MAINTAINERS
>> +   :widths: 25 75
>> +   :header-rows: 1
>> +
>> +   * - Status
>> +     - Meaning
>> +   * - Supported
>> +     - Someone is actually paid to look after this.
>> +   * - Maintained
>> +     - Someone actually looks after it.
>> +   * - Odd Fixes
>> +     - It has a maintainer but they don't have time to do
>> +       much other than throw the odd patch in.
>> +   * - Orphan
>> +     - No current maintainer.
>> +   * - Obsolete
>> +     - Old obsolete code, should use something else.
>
> We could add a line in MAINTAINERS 'Descriptions of section entries'
> header: "If you modify this section, please keep in sync with the
> description in docs/devel/maintainers.rst".
>
>> +Becoming a reviewer
>> +-------------------
>> +
>> +Most maintainers start by becoming subsystem reviewers. While anyone
>> +is welcome to review code on the mailing list getting added to the
>> +MAINTAINERS file with a line like::
>> +
>> +  R: Random Hacker <rhacker@example.com>
>> +
>> +will ensure that patches touching a given subsystem will automatically
>> +be CC'd to you.
>
> Although 'R:' tag means 'designated reviewer', such reviewers is
> expected to provide regular spontaneous feedback. Otherwise being
> subscribed to the list is sufficient.

I've used a slightly different form for the flow:

  Becoming a reviewer
  -------------------

  Most maintainers start by becoming subsystem reviewers. While anyone
  is welcome to review code on the mailing list getting added to the
  MAINTAINERS file with a line like::

    R: Random Hacker <rhacker@example.com>

  marks you as a 'designated reviewer' - expected to provide regular
  spontaneous feedback. This will ensure that patches touching a given
  subsystem will automatically be CC'd to you.

we can of course always improve later ;-)

>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>


--=20
Alex Benn=C3=A9e

