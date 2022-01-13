Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C56F348D5AC
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 11:27:11 +0100 (CET)
Received: from localhost ([::1]:56392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7xK2-0005kl-L7
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 05:27:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n7xH6-0003xl-Nd
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 05:24:10 -0500
Received: from [2a00:1450:4864:20::42a] (port=42827
 helo=mail-wr1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n7xH3-0007cm-Tu
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 05:24:08 -0500
Received: by mail-wr1-x42a.google.com with SMTP id k30so9170621wrd.9
 for <qemu-devel@nongnu.org>; Thu, 13 Jan 2022 02:24:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=tKdflBTLsrCOkr72BNTL71jH77cfVC1lh2S+d78MYX8=;
 b=KrGTGxjAhb9YSYLGn9fg0Io/NFp+3+VzEvUSJRE4Q8+Up5KsGZGzScgHyZvFxThSi5
 CP38QtkP/x0XFw5xypZDdoydWfeMyY2YPGI7ZiC4sFlEM90T0gG5g6pVIoA4izZCTwQG
 VAHlhYpB7t738eQlr/AXnaCtmpGWSINvTSpdQGa3X3JnfgObaIjmB3Sa7/aKnmtdcXJg
 ftLPR1/gZQlMziQwLn0BbSXWxgOw7m8nRMxdsXMD9PlqZdTDTa8s1yED6KFGbIwpqCrU
 8fSQOXP7B/efwpTKsRY9f/a2g3zajQDaQbdNtCnsFIp+8+09OBYVTSCuq6dK5Knl3JOP
 lZGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=tKdflBTLsrCOkr72BNTL71jH77cfVC1lh2S+d78MYX8=;
 b=hPOxbIvh2K+gst7NtbDYSh2Gp08QCCikibD+14unVhwbD4xS/2qtv/IwI5qpqFT0rI
 1KRoow4OkK30WD3m+sOKabbY2e//3qKw01kMhx9VO1b7EkoYe4MD14ipHfkqwkgwDbkH
 vRnpwtPKo0WUdLhrTcGy4pogiB6Qo3KBhNPYXPgoB4Ip/89MpCQgw5CK6kEyhUZ/8WxZ
 zYQh6GYumm1bjkYC3ILH+dyHNute2LQVJHej0zpOW7rDeKyEhIzaFLYJ8j7VjDsJ9sor
 1FzJ13uDqt9Ku+2uX04AOmUA5MDDtkSZFNZK8hNQwPrRSM/rehndUVQTHCRFaVjcKIrZ
 MlzQ==
X-Gm-Message-State: AOAM531EHkiIyg8oTy5+kuwPJBiVZLJ2TnB+Y8ytLXZDlKX14wjZ5w4s
 +WUckGmHaL2T2M8/vcckbpmRUA==
X-Google-Smtp-Source: ABdhPJwqwzErxteWUgw0mSO/MGyvJ62M01A2rSAY9pxV2UhkbWtD5+T0+HnGcIoiIM+TpvUHByJ6gA==
X-Received: by 2002:a5d:4c4d:: with SMTP id n13mr3384470wrt.641.1642069438987; 
 Thu, 13 Jan 2022 02:23:58 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id i82sm3543695wma.23.2022.01.13.02.23.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jan 2022 02:23:58 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9BB891FFB7;
 Thu, 13 Jan 2022 10:23:57 +0000 (GMT)
References: <20220112112722.3641051-1-alex.bennee@linaro.org>
 <CAFEAcA--rEZ0+JxFzeSFD1j6FM65_x3CXcn_oTnaNkNVU1hW0Q@mail.gmail.com>
User-agent: mu4e 1.7.5; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL 00/31] testing/next and other misc fixes
Date: Thu, 13 Jan 2022 10:13:39 +0000
In-reply-to: <CAFEAcA--rEZ0+JxFzeSFD1j6FM65_x3CXcn_oTnaNkNVU1hW0Q@mail.gmail.com>
Message-ID: <87h7a89bnm.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
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


Peter Maydell <peter.maydell@linaro.org> writes:

(adding the s390x people to the CC if they have any clues)

> On Wed, 12 Jan 2022 at 11:27, Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>>
>> The following changes since commit bf99e0ec9a51976868d7a8334620716df15fe=
7fe:
>>
>>   Merge remote-tracking branch 'remotes/mst/tags/for_upstream' into stag=
ing (2022-01-11 10:12:29 +0000)
>>
>> are available in the Git repository at:
>>
>>   https://github.com/stsquad/qemu.git tags/pull-for-7.0-110122-1
>>
>> for you to fetch changes up to dbd30b7abee963f4fb08892a7d7f920bb76ece58:
>>
>>   linux-user: Remove the deprecated ppc64abi32 target (2022-01-11 13:00:=
53 +0000)
>>
<snip>
> This seems to fail the ubuntu-18.04-s390x-all-linux-static job
> with segfaults running linux-user binaries (not always the same
> binary), eg:
> https://gitlab.com/qemu-project/qemu/-/jobs/1968789446
> https://gitlab.com/qemu-project/qemu/-/jobs/1968080419

*sigh*

So the regression is caused by:

  linux-user: don't adjust base of found hole

However it only occurs when pgb_static starts base at a low address. For
example:

  pgb_find_hole: base @ 13dd000 for 17432080 bytes
  pgb_static: base @ 13dd000 for 17432080 bytes
  Locating guest address space @ 0x13dd000

fails whereas:

  pgb_find_hole: base @ 41f97000 for 17432080 bytes=20=20=20=20=20=20
  pgb_static: base @ 41f97000 for 17432080 bytes=20=20=20=20=20=20=20=20
  Locating guest address space @ 0x41f97000=20=20=20=20=20=20

works.

What I find confusing is why we end up with different addresses when
both QEMU and the test binary are static allocations. However the
varying allocation occurs before the change but without triggering the
crash:

  pgb_static: base @ 3dd000 for 17432080 bytes
  pgb_static: base @ 3dd000 for 17432080 bytes
  pgb_static: base @ 41246000 for 17432080 bytes
  pgb_static: base @ 3dd000 for 17432080 bytes
  pgb_static: base @ 40a2a000 for 17432080 bytes
  pgb_static: base @ 3dd000 for 17432080 bytes
  pgb_static: base @ 3dd000 for 17432080 bytes
  pgb_static: base @ 4060c000 for 17432080 bytes
  pgb_static: base @ 3dd000 for 17432080 bytes
  pgb_static: base @ 3dd000 for 17432080 bytes
  pgb_static: base @ 3dd000 for 17432080 bytes

>
>
> thanks
> -- PMM


--=20
Alex Benn=C3=A9e

