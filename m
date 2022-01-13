Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA1348D857
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 13:58:19 +0100 (CET)
Received: from localhost ([::1]:54858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7zgI-00088g-3N
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 07:58:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n7ze0-0006rq-JQ
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 07:55:56 -0500
Received: from [2a00:1450:4864:20::32b] (port=41485
 helo=mail-wm1-x32b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n7zdy-00079z-7a
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 07:55:55 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 q141-20020a1ca793000000b00347b48dfb53so3610884wme.0
 for <qemu-devel@nongnu.org>; Thu, 13 Jan 2022 04:55:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=UG6UaPGb27v94T2Brp5JKQQpi0QZX0gKivUZoh9cBjg=;
 b=Zjr9t6TIsMuTbtte/nKH94h4MtvBYct/JIJu7qEWmUCQaHHBQE2RwZx0PKvmg5NLJ9
 CIIFmqVzZcuetr43FzoT2jvKVywlW8A5KoyqW6N7oLWHYQrB/ZtiOn5+UObYb3WNwcg+
 IBS5JpVGbLGJhZ+TPKym7AuG7rD8O2pRszyu2iH78u+3Vi1Q3Ij1gv4dcVZMA8JS7gND
 Q4oXOIlEdIVib/nBaW2CD4bG2Pdabex6iylierInPN3SRoZkssbVW+EoLlGWkha9jZDJ
 L+gvtarolPZqAwrrJ+pvLQjc+malKk8EuPuz87R1fJctG2L6Fi9eHjV6XX5yo7LqSZJu
 MkBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=UG6UaPGb27v94T2Brp5JKQQpi0QZX0gKivUZoh9cBjg=;
 b=jy+eHHoOIwkwh+Q4SRrAeDBIQ66Aay2PMt38EP9ljiK5qvcpi/iyAiEGzel+Rb6w6Y
 W0F3Z1L5HA39tB2oSioZCsc/YV0x+jUob6RZa5lpdhRcjogy88W/WQ/bVkTD61EhN1Ae
 4yyqBfQjsdvX8NU2dHwdtJgAcYMiQoqK3v1E188E5JAvBsZICqh3C8lep/y5llIB7T/U
 IP1uggBMz0twZkbvpVA0LFbLv+oECLimg8UBUZppV0abl1jPlhnjx3Hmv+wDBTO2X6nV
 mWxGtmBfXs5dSxv7BTzQYFtIC0B4Zgcv5OlQ8dp3kLhHH/cY2+CpMz5EPwzikmYY8vog
 kQAg==
X-Gm-Message-State: AOAM532uniRyAgVi4iqAQ1kOshJvqmEKfdhWgbXabpwdx8Tejf3yySpe
 MttQIfPNx1J+xuiXs+myTDINfg==
X-Google-Smtp-Source: ABdhPJxLIK+Pjrw8Dh9TXhlEiAg3azL2iW/yR55zeaRGlJplBhlMoePwni807NNNyKtM6pwdlVSPdw==
X-Received: by 2002:a1c:9ac7:: with SMTP id c190mr2178565wme.36.1642078550904; 
 Thu, 13 Jan 2022 04:55:50 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id g15sm2551668wrm.2.2022.01.13.04.55.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jan 2022 04:55:49 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 44AEB1FFB7;
 Thu, 13 Jan 2022 12:55:49 +0000 (GMT)
References: <20220112112722.3641051-1-alex.bennee@linaro.org>
 <CAFEAcA--rEZ0+JxFzeSFD1j6FM65_x3CXcn_oTnaNkNVU1hW0Q@mail.gmail.com>
 <87h7a89bnm.fsf@linaro.org>
User-agent: mu4e 1.7.5; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL 00/31] testing/next and other misc fixes
Date: Thu, 13 Jan 2022 12:49:18 +0000
In-reply-to: <87h7a89bnm.fsf@linaro.org>
Message-ID: <878rvjaj6y.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> Peter Maydell <peter.maydell@linaro.org> writes:
>
> (adding the s390x people to the CC if they have any clues)
>
>> On Wed, 12 Jan 2022 at 11:27, Alex Benn=C3=A9e <alex.bennee@linaro.org> =
wrote:
>>>
>>> The following changes since commit bf99e0ec9a51976868d7a8334620716df15f=
e7fe:
>>>
>>>   Merge remote-tracking branch 'remotes/mst/tags/for_upstream' into sta=
ging (2022-01-11 10:12:29 +0000)
>>>
>>> are available in the Git repository at:
>>>
>>>   https://github.com/stsquad/qemu.git tags/pull-for-7.0-110122-1
>>>
>>> for you to fetch changes up to dbd30b7abee963f4fb08892a7d7f920bb76ece58:
>>>
>>>   linux-user: Remove the deprecated ppc64abi32 target (2022-01-11 13:00=
:53 +0000)
>>>
> <snip>
>> This seems to fail the ubuntu-18.04-s390x-all-linux-static job
>> with segfaults running linux-user binaries (not always the same
>> binary), eg:
>> https://gitlab.com/qemu-project/qemu/-/jobs/1968789446
>> https://gitlab.com/qemu-project/qemu/-/jobs/1968080419
>
> *sigh*
>
> So the regression is caused by:
>
>   linux-user: don't adjust base of found hole
>
> However it only occurs when pgb_static starts base at a low address. For
> example:
>
>   pgb_find_hole: base @ 13dd000 for 17432080 bytes
>   pgb_static: base @ 13dd000 for 17432080 bytes
>   Locating guest address space @ 0x13dd000
>
> fails whereas:
>
>   pgb_find_hole: base @ 41f97000 for 17432080 bytes=20=20=20=20=20=20
>   pgb_static: base @ 41f97000 for 17432080 bytes=20=20=20=20=20=20=20=20
>   Locating guest address space @ 0x41f97000=20=20=20=20=20=20
>
> works.
>
> What I find confusing is why we end up with different addresses when
> both QEMU and the test binary are static allocations. However the
> varying allocation occurs before the change but without triggering the
> crash:

Continuing with debug dumps:

  read_self_maps: heap at 2445000->24ab000
  pgb_find_hole: brk @ 24ab000
  pgb_find_hole: start:24ab000 align_start:24ab000 end:3ffa0000000
  pgb_find_hole: after brk tweak align_start:424ab000
  Created 10 threads
  Done
  3, 0, PASS, 0.251649, 2, 3, -
  read_self_maps: heap at 2d14000->2d7a000
  pgb_find_hole: brk @ 2d7a000
  pgb_find_hole: start:13dd000 align_start:13dd000 end:2d14000
  4, -11, FALSE, 0.251602, 2, 4, -
  read_self_maps: heap at 1e6c000->1ed2000
  pgb_find_hole: brk @ 1ed2000
  pgb_find_hole: start:1ed2000 align_start:1ed2000 end:3ff90000000
  pgb_find_hole: after brk tweak align_start:41ed2000
  Created 10 threads
  Done
  5, 0, PASS, 0.253451, 3, 5, -
  read_self_maps: heap at 2c32000->2c98000
  pgb_find_hole: brk @ 2c98000
  pgb_find_hole: start:13dd000 align_start:13dd000 end:2c32000
  6, -11, FALSE, 0.251998, 3, 6, -
  read_self_maps: heap at 29f2000->2a58000
  pgb_find_hole: brk @ 2a58000
  pgb_find_hole: start:13dd000 align_start:13dd000 end:29f2000
  7, -11, FALSE, 0.251922, 3, 7, -
  read_self_maps: heap at 1b1f000->1b85000
  pgb_find_hole: brk @ 1b85000
  pgb_find_hole: start:1b85000 align_start:1b85000 end:3ff78000000
  pgb_find_hole: after brk tweak align_start:41b85000
  Created 10 threads
  Done
  8, 0, PASS, 0.251691, 4, 8, -

It looks like that we occasionally fit in bellow the heap and location
of brk but we aren't asking for enough space. I would like to get a core
dump of the failure because of course using gdb moves the maps around
enough that everything always works.

--=20
Alex Benn=C3=A9e

