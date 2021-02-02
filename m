Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C76A630BD67
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 12:50:59 +0100 (CET)
Received: from localhost ([::1]:49616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6uCw-0000od-RO
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 06:50:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l6uB8-0008Pz-N2
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 06:49:06 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:37125)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l6uB5-0007Z9-A1
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 06:49:05 -0500
Received: by mail-wr1-x431.google.com with SMTP id v15so20150285wrx.4
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 03:49:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=QJIN2L8Hg4lQpah0+U6/suAReBgZVRFUyOUqX9QzcX0=;
 b=Eko1Uh94YOh7BQW9KmtbPV/EXY9lK/K13Bq9aTFOGMmmjKMCN7wG4wGSGv1seuChUG
 GutHmCGARjqWH6eGPi7+CwQOEJMdjk+5nkQ82SW+BUms3pNcGdir/ac8rj53sXp1Xki2
 +Nh+88mq0wAZRff7wm5lktpDNYQUrlx1Gf1zNoNHGqUQhcEPwxXccpHZ8exV5Z3JIEVd
 wKRQze75nqoSEdM5WQR5shYWTNl8cHOv+tht2/0lT+r7CVjSnZ1AXCX3vRw1+qaUTGAr
 ap+7qkQCmhC+hJVx3gqSHkntGtzukzJFYAZDZmVSz0bkFv+gM2LOR8s3ZE7ivesETA9Y
 TTmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=QJIN2L8Hg4lQpah0+U6/suAReBgZVRFUyOUqX9QzcX0=;
 b=LDFSnU+RnaQ5wL2tSwcxjy/WtpeFMGQKTR+adxz78JTQl3US8cciHypsg0tA05+cFc
 LSxhRFFaN0gJ8oCqAe2BqqQPU0gEW7TGZEZUcedipHG8SzoElNBZx0MjqJuuk7T7WPn8
 fXnJBtbAwxEO4yMyRjzFGdjQmYRXLPDo+EmOKXJq0rBI93jHbKXNc8+bk6gUZLmeUGp+
 CWFkkv6vD5O6grr4flisB9grbqWpCqgT/3x5wwrlfsyruP3jR7/RDBW4/PxLcu6Y52i1
 7dXoQ84puHTePXxe2etezQpKIEpEE6EZ5Of5aGmka3AP+gQ86jKxCHGS+TpHv39/o6Mq
 ZjHA==
X-Gm-Message-State: AOAM531pIT8tBEsSMJ5ZKBd37OHYRwQNO5E8qtDi+Wmxm3XghBakdSck
 e6fMp4Qf11R/dq13aC0YsqGGeQ==
X-Google-Smtp-Source: ABdhPJwbwFcahEQ5HTBiodsXzNWtq+k9x6lawXSehGWsunKFtFT/3C/fZ3pguVKJgv4KSgl6h3Di5w==
X-Received: by 2002:a5d:6588:: with SMTP id q8mr23418431wru.294.1612266541243; 
 Tue, 02 Feb 2021 03:49:01 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id 17sm2596904wmk.48.2021.02.02.03.48.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 03:48:59 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1BF7B1FF7E;
 Tue,  2 Feb 2021 11:48:59 +0000 (GMT)
References: <20210128185300.2875-1-alex.bennee@linaro.org>
 <CAFEAcA_R3phXwOtj-v-6-oCN891SjGSyAGwcx3_zDf+GFPWLqg@mail.gmail.com>
 <871rdzv9cf.fsf@linaro.org>
 <CAFEAcA8aLBFG9SjVqeDwbcGRU_chkt2s0E1i9BY+xDdXnrfO6Q@mail.gmail.com>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] docs/system: document an example vexpress-a15 invocation
Date: Tue, 02 Feb 2021 11:38:24 +0000
In-reply-to: <CAFEAcA8aLBFG9SjVqeDwbcGRU_chkt2s0E1i9BY+xDdXnrfO6Q@mail.gmail.com>
Message-ID: <87sg6eu1uc.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, Anders Roxell <anders.roxell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Peter Maydell <peter.maydell@linaro.org> writes:

> On Mon, 1 Feb 2021 at 20:09, Alex Benn=C3=A9e <alex.bennee@linaro.org> wr=
ote:
>>
>>
>> Peter Maydell <peter.maydell@linaro.org> writes:
>>
>> > On Thu, 28 Jan 2021 at 18:53, Alex Benn=C3=A9e <alex.bennee@linaro.org=
> wrote:
>> >>
>> >> The wiki and the web are curiously absent of the right runes to boot a
>> >> vexpress model so I had to work from first principles to work it out.
>> >> Use the more modern -drive notation so alternative backends can be
>> >> used (unlike the hardwired -sd mode).
>> >>
>> >> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> >> Cc: Anders Roxell <anders.roxell@linaro.org>
>> >> ---
>> >>  docs/system/arm/vexpress.rst | 26 ++++++++++++++++++++++++++
>> >>  1 file changed, 26 insertions(+)
>> >>
>> >> diff --git a/docs/system/arm/vexpress.rst b/docs/system/arm/vexpress.=
rst
>> >> index 7f1bcbef07..30b1823b95 100644
>> >> --- a/docs/system/arm/vexpress.rst
>> >> +++ b/docs/system/arm/vexpress.rst
>> >> @@ -58,3 +58,29 @@ Other differences between the hardware and the QEM=
U model:
>> >>    ``vexpress-a15``, and have IRQs from 40 upwards. If a dtb is
>> >>    provided on the command line then QEMU will edit it to include
>> >>    suitable entries describing these transports for the guest.
>> >> +
>> >> +Booting a Linux kernel
>> >> +----------------------
>> >> +
>> >> +Building a current Linux kernel with ``multi_v7_defconfig`` should be
>> >> +enough to get something running.
>> >> +
>> >> +.. code-block:: bash
>> >> +
>> >> +  $ export ARCH=3Darm
>> >> +  $ export CROSS_COMPILE=3Darm-linux-gnueabihf-
>> >> +  $ make multi_v7_defconfig
>> >> +  $ make
>> >
>> > We probably shouldn't be recommending in-tree kernel builds, or
>> > polluting the user's environment with random variables. Try:
>> >
>> > $ make O=3Dbuilddir ARCH=3Darm CROSS_COMPILE=3Darm-linux-gnueabihf- mu=
lti_v7_defconfig
>> > $ make O=3Dbuilddir ARCH=3Darm CROSS_COMPILE=3Darm-linux-gnueabihf-
>
>> Building a current Linux kernel with ``multi_v7_defconfig`` should be
>> enough to get something running. Nowadays an out-of-tree build is
>> recommended (and also useful if you build a lot of different targets).
>> $SRC points at root of the linux source tree.
>>
>> .. code-block:: bash
>>
>>   $ mkdir build; cd build
>>   $ make O=3D$(pwd) -C $SRC ARCH=3Darm CROSS_COMPILE=3Darm-linux-gnueabi=
hf- multi_v7_defconfig
>>   $ make O=3D$(pwd) -C $SRC ARCH=3Darm CROSS_COMPILE=3Darm-linux-gnueabi=
hf-
>
> That works, but do you really commonly cd into the build directory?
> I usually sit in the source tree...

Lets just be explicit and teach the user to fish:

Building a current Linux kernel with ``multi_v7_defconfig`` should be
enough to get something running. Nowadays an out-of-tree build is
recommended (and also useful if you build a lot of different targets).
In the following example $BLD points to the build directory and $SRC
points to the root of the Linux source tree. You can drop $SRC if you
are running from there.

.. code-block:: bash

  $ make O=3D$BLD -C $SRC ARCH=3Darm CROSS_COMPILE=3Darm-linux-gnueabihf- m=
ulti_v7_defconfig
  $ make O=3D$BLD -C $SRC ARCH=3Darm CROSS_COMPILE=3Darm-linux-gnueabihf-

>
> thanks
> -- PMM


--=20
Alex Benn=C3=A9e

