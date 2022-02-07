Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A24F4AC829
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 19:02:49 +0100 (CET)
Received: from localhost ([::1]:48578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH8Lf-0001oL-V5
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 13:02:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nH7JG-0004Hy-VQ
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 11:56:15 -0500
Received: from [2a00:1450:4864:20::429] (port=42570
 helo=mail-wr1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nH7JF-0000w5-12
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 11:56:14 -0500
Received: by mail-wr1-x429.google.com with SMTP id h6so7243729wrb.9
 for <qemu-devel@nongnu.org>; Mon, 07 Feb 2022 08:56:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=mrzSLGAp2KfWDLBDzbOlRjOE6K87nnCHDqWkOYXilw4=;
 b=xFZfUt5fhGw/WZLqP7WJrkhize2AghiynnD+7lFd9C0g1V8LiVrUdO0DcctXP4+c93
 BN0BTxHPwHzU/dceQuBbmSmJF5GJrKns0tGEC189w4Hw4SjQd6VPi4kW4voYl1+ezQYI
 Md5UV4gmuLI5g1y/MJrxumAB/3DLExVj9RnHvkvKhalq0JBYm8txiDaDVdIW/Iu1V6zj
 M8gxU6X5IcOTVe2VONAFy13uVsLj7ipEtxPbK4NRrTeJm9jLHfifHuFiYwdTLZELq6nj
 OZIwWvC8P5KVMDmYPrmHIo09Y2GYee0Qov0X/EubUbZiiqS+dapwR+6/tJKhAFooeJIM
 Wv9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=mrzSLGAp2KfWDLBDzbOlRjOE6K87nnCHDqWkOYXilw4=;
 b=qf49dmDUNnCxcg4IpYmFuErsiDStMcF8TXK4OU8toYrsSrfXOXLeL2kipkeLyr9Fou
 JQQJuZ7XCpFDtL6IOO/LbQOzXsCqIK/ZRtRwog4D251w0Rq0NJSWp8IKP8TDKOpSboAQ
 yFo17H3+pk3hTaF8BFgTgXV9DqNvfWqlac6OTA3YzwnHpZUVeyZxL73qrqRnLfzM1mUm
 8vbqZzFHUYzStdMVEWnTvXDHAiYVrUWbuM9Wq+Xoa4FED0W2CFuDQkGHfh5pyO4XNRzp
 J2/4Xqa3Je9OzmCvSyycYzLcTrtl7vlf6fwrPdUGnFYDEl0pI9dk5jQPUd7vmFTitKnN
 bL1w==
X-Gm-Message-State: AOAM5306P3UTcDTzFZ4NSupMsdefCxlHH66nQK1f4pb98YnPwA2J+mI2
 oBURmN0iScQxdqudncnNx3rtQQ==
X-Google-Smtp-Source: ABdhPJylkYiyifNChuCiH3ZlGamardyGxAp3Z9HMGd0EfTpvF5+tPkbaOiTewliNpk8nKDsofDO/XQ==
X-Received: by 2002:adf:db8b:: with SMTP id u11mr272880wri.145.1644252970975; 
 Mon, 07 Feb 2022 08:56:10 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id g9sm11059460wri.95.2022.02.07.08.56.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Feb 2022 08:56:10 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7ABA31FFB7;
 Mon,  7 Feb 2022 16:56:09 +0000 (GMT)
References: <CAFn=p-YxK8JduYOzxwDJSsmANgsqb+tK049t75VbXK-=Qi3J9w@mail.gmail.com>
User-agent: mu4e 1.7.7; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: John Snow <jsnow@redhat.com>
Subject: Re: Adding a 'qemu.qmp' repository to gitlab.com/qemu-project/
Date: Mon, 07 Feb 2022 16:54:25 +0000
In-reply-to: <CAFn=p-YxK8JduYOzxwDJSsmANgsqb+tK049t75VbXK-=Qi3J9w@mail.gmail.com>
Message-ID: <87czjyhaza.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::429
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


John Snow <jsnow@redhat.com> writes:

> Hi Peter:
>
> I am working my way towards splitting the QMP library out of the
> qemu.git source tree. I'd like to ask for permission to:
>
> (1) Create a "qemu.qmp" repository under the qemu-project umbrella on
> GitLab

No objection for my part except maybe a better name? QemuPythonQmp? I
guess the header text can make it clear.

> (2) Add Cleber Rosa and myself as maintainers of this repository. (In
> discussion, Dan Berrange suggested a third maintainer for redundancy,
> but nobody from outside of RH has yet volunteered. The offer stands,
> but I have to press on in the meantime.)
>
> The initial patches that set up the new repository are not yet
> finalized and are still under review/development (on the qemu-devel
> list, as normal), but I wanted to reach out and directly ask if you
> have any objections to this plan so I can adjust the trajectory of my
> work if necessary.
>
> In short, the plan is to publish the QMP library as its own
> mini-project published to the Python package repository, and take
> patches via GitLab merge requests.
>
> Thanks,
> --js


--=20
Alex Benn=C3=A9e

