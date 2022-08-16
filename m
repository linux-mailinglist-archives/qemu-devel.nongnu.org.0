Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D40C5595D7E
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 15:37:25 +0200 (CEST)
Received: from localhost ([::1]:39524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNwl2-0001cq-Am
	for lists+qemu-devel@lfdr.de; Tue, 16 Aug 2022 09:37:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oNwiM-000885-RL
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 09:34:38 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:33502)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oNwi6-0003xa-No
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 09:34:27 -0400
Received: by mail-wr1-x42e.google.com with SMTP id v3so12694827wrp.0
 for <qemu-devel@nongnu.org>; Tue, 16 Aug 2022 06:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc;
 bh=SBEfj63yP/gKAOzmQggE4q205aOIOIQaKyKMEVMIZho=;
 b=cAjICxhFupBN901dK5ihLug9lkc+0p4l3xdn6FKB/jdT+9PecsbWBzpVpyjvZnr++1
 VmFfCOvbCWJVaBcvpwpZIHksjcM+wghWbIs9PAY5WHsEcfOCSvXiAhJTgYCCiBqo15xw
 r2IbwMWGMedd3l2m6MUHjsEaNVqZS+oCzOMqenLajydv1wUM1QnLGfDNHsCPKGMNHLoF
 pvJtko/tw+PfmP/EGXPO8CjZg8CTk//WQAOgkC22xxJy9uoWSkPwi33pdKsxlzekSuLQ
 GDgm3qhuOS8TDn/OkLJmuradZImFXq+kJ3c2JpQC2mEJytAH47bupmN/Ayy3L8jTWUBg
 SgCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc; bh=SBEfj63yP/gKAOzmQggE4q205aOIOIQaKyKMEVMIZho=;
 b=BA4rfpAjxs4mJMdAwn3lOPVgwlnWkj0Eg97csbu9ha/pLEGl7DO3AQylEnYTgUvPWq
 m730nxVlcDzGKg4tyLPmNhjUIHtwcKPnedgCQkQZPY8B9TRVHIRAYMqT9wj6As6xFsK2
 usc84M1a8/GlgD8tCLesPzKxpcV9WThEzUSyVI+Pfz1NOVzHZeo9rXnqf1ckeB0Z7PQh
 cxf3GWDb2vhKRybbUc2IFIdO4nX5oYoF9D9g8uZ5IP9x74Tx99+E8OhIcCZtwAFdde5Z
 o/SeOyneCr/HGAhunkZztUnz54JHmzWJFJVhF9QVasWSdsGc2aaU9pVA+Xjz6sHIXuqZ
 cfNA==
X-Gm-Message-State: ACgBeo3J6IYKwpHos0wnQvrMPtulGaWn9pkl65RPaRJqcNaAZQiz2mCQ
 pgcHHd5eMJ0j/POOwlf2RGBEpw==
X-Google-Smtp-Source: AA6agR67ZQQCXJaLOtIj1FutAuUxiAYLDClZcQb4ZGEMFycrudfdIuQJpfeOluUfnB55K7kiaqiLXg==
X-Received: by 2002:adf:fbc7:0:b0:220:6004:18ca with SMTP id
 d7-20020adffbc7000000b00220600418camr11391104wrs.632.1660656853625; 
 Tue, 16 Aug 2022 06:34:13 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 12-20020a05600c24cc00b003a2e1883a27sm16095648wmu.18.2022.08.16.06.34.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Aug 2022 06:34:13 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 77BBF1FFB7;
 Tue, 16 Aug 2022 14:34:12 +0100 (BST)
References: <20220816122621.2066292-1-alex.bennee@linaro.org>
 <20220816122621.2066292-3-alex.bennee@linaro.org>
 <CAFEAcA-+MtvsRJfpcjknT2FHkUO75AP_zySWBWi=KAAkMGdjnQ@mail.gmail.com>
User-agent: mu4e 1.8.9; emacs 28.1.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: richard.henderson@linaro.org, qemu-devel@nongnu.org, Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>, Cleber Rosa
 <crosa@redhat.com>, Wainer
 dos Santos Moschetta <wainersm@redhat.com>, Beraldo Leal <bleal@redhat.com>
Subject: Re: [PULL 2/3] tests/avocado: add timeout to the aspeed tests
Date: Tue, 16 Aug 2022 14:31:37 +0100
In-reply-to: <CAFEAcA-+MtvsRJfpcjknT2FHkUO75AP_zySWBWi=KAAkMGdjnQ@mail.gmail.com>
Message-ID: <87mtc4b9d7.fsf@linaro.org>
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

> On Tue, 16 Aug 2022 at 13:26, Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>>
>> On some systems the test can hang. At least defining a timeout stops
>> it from hanging forever.
>
> Aha. Yeah, I've seen this test hang forever sometimes.
>
> Is there some place (in the superclass??) that we can put a
> default timeout that applies to *all* avocado tests, so we
> don't have the risk of forgetting it in a particular test?

It's a bit muddy. Most tests are sub-classed on LinuxTest which does
define a default timeout:

  class LinuxTest(LinuxSSHMixIn, QemuSystemTest):
      """Facilitates having a cloud-image Linux based available.

      For tests that indent to interact with guests, this is a better choice
      to start with than the more vanilla `QemuSystemTest` class.
      """

      timeout =3D 900
      distro =3D None
      username =3D 'root'
      password =3D 'password'
      smp =3D '2'
      memory =3D '1024'

However the aspeed tests are directly derived from QemuSystemTest.
Perhaps we should just move the timeout down to that or maybe
QemuBaseTest?

>
> -- PMM


--=20
Alex Benn=C3=A9e

