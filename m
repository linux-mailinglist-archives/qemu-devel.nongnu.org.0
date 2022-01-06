Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 933EE4862AE
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 11:06:23 +0100 (CET)
Received: from localhost ([::1]:59128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5Pf2-0004eO-24
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 05:06:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n5PLa-0006rJ-RZ
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 04:46:14 -0500
Received: from [2a00:1450:4864:20::52a] (port=41577
 helo=mail-ed1-x52a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n5PLQ-0006c7-NE
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 04:46:14 -0500
Received: by mail-ed1-x52a.google.com with SMTP id b13so7241446edd.8
 for <qemu-devel@nongnu.org>; Thu, 06 Jan 2022 01:46:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=ImJ8Ijy1Jl1WmD2hgT7fo2Jw7Oc43851fck43k0f+24=;
 b=fBpxQ0hjq2k6FF14YvIp1HDU+wuepapbE7mSkn3YSdle81TfqDKQsZroqrnAbVYpuR
 mTtRuINGsbFan6FBLWifHfMoM/W/SqrnHQL5gOQRTu3o6QPUzPHOOa7K/wVjfjdn6UXw
 lAZ3y3Y7dXAh0naBjvy2bydVv9ic2/yIoZmIUnXtu5p2F9wD0qKLq/90sSj6g9IbrdGT
 nPtrfiFPgwagwAEFfUZLHLadkzWP34sYCRN0J28V9IXI0fXR6Rfw74JNXhxOG+XeWymn
 SZ0SbnArCvU350dNrUpgcHHV2+UW8Lvfc20TBydWXTJNdk8pee3rqdmjdk4EurFW4QrE
 OZ2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=ImJ8Ijy1Jl1WmD2hgT7fo2Jw7Oc43851fck43k0f+24=;
 b=jLCJ01oLD6FfloQw5oxlqB8aRu9FKFnZfU64gLkVfvFn+/TGoFcRxlOmMLDRN5vQLh
 AmHiXzjMCLZHWch2TA3iO4ZU1ZWQ398uiHR3qTtiCgKjqKWsC2fLJdPRBQGNvgSZ6Pal
 Mm6CfynHKVO/tmWbPsG3VRWY5uiS/xdnUXPTrBLZKLBkcuAQQIFYB1JfXMNcKEDiTvFZ
 2+T6X0h2MNRqhlHl2lGz+rhvHxHZokDv8PKy26ebt2RhZi/j5zg6JVpcH9Ohlf77Mwub
 /7NHGoiGolPjqqh6OT3VEbd5Dk3dDPvbLk18Zd4m8kXVGSWGJW294bVBIu9Kvb3fdIBC
 +9Kw==
X-Gm-Message-State: AOAM531hNJl8xOYPvmXNG1ZQPbE6+FY9D4WNZPsPSE13eJrweZezf3Oo
 tMfwTD/4N0EUyVLVRdz6IYk0uw==
X-Google-Smtp-Source: ABdhPJzsbAQ/L2Ww9EoeqTxjQqyEw/TW8wVwlSpWursGKTMj6X1XYlzjnndFkCV4hdQb4KopteKhfA==
X-Received: by 2002:aa7:cac7:: with SMTP id l7mr5864973edt.302.1641462363262; 
 Thu, 06 Jan 2022 01:46:03 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id qk6sm363604ejc.127.2022.01.06.01.46.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 01:46:02 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 894BA1FFB7;
 Thu,  6 Jan 2022 09:46:01 +0000 (GMT)
References: <CALiXuoZkFzY5hLJoshwH-U=mjLssgnjGsxKOY1tSJE=k-QDhqA@mail.gmail.com>
User-agent: mu4e 1.7.5; emacs 28.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Aakarshit Agarwal <agarwal.aakarshit13@gmail.com>
Subject: Re: How to get started with contribution for GSOC'22
Date: Thu, 06 Jan 2022 09:37:21 +0000
In-reply-to: <CALiXuoZkFzY5hLJoshwH-U=mjLssgnjGsxKOY1tSJE=k-QDhqA@mail.gmail.com>
Message-ID: <87mtk9i4di.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Stefan Hajnoczi <stefanha@gmail.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Aakarshit Agarwal <agarwal.aakarshit13@gmail.com> writes:

> Hello Sir/Ma'am,
>
> I am Aakarshit Agarwal, final year student pursuing B.Tech in computer sc=
ience with a specialization in DevOps from UPES Dehradun. I
> love the topic and technologies you used for GSoC'21. I would love to con=
tribute to your organization for GSoC'22 and know more about it.
>
> Can you please tell me how to get started?

We have a number of Bite Sized tasks in the bug tracker which are good
tasks to get familiar with the code base and code submission process:

  https://gitlab.com/qemu-project/qemu/-/issues?scope=3Dall&state=3Dopened&=
label_name[]=3DBite%20Sized

It's worth commenting on and assigning yourself to the bug to avoid
duplication or gather comments from other developers. We have a growing
amount of development documentation:

  https://qemu.readthedocs.io/en/latest/devel/index.html
  https://qemu.readthedocs.io/en/latest/devel/submitting-a-patch.html

To talk to developers and discuss potential project ideas please join
the IRC channel (or via https://matrix.to/#/#_oftc_#qemu:matrix.org).
There is also a qemu-gsoc channel specifically for GSoC related queries.

You can look over the previous GSoC pages to get ideas for projects or
come up with your own. It will be awhile before GSoC submissions open
but nothing stops you from getting familiar with the code and
development process before hand.

>
> Hoping to hear from you soon.
>
> Regards,
> Aakarshit Agarwal


--=20
Alex Benn=C3=A9e

