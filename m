Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E23D485050
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 10:46:56 +0100 (CET)
Received: from localhost ([::1]:59740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n52sh-00016E-3R
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 04:46:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n52qG-0008VD-Lp
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 04:44:25 -0500
Received: from [2a00:1450:4864:20::330] (port=44868
 helo=mail-wm1-x330.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n52qF-00029z-2z
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 04:44:24 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 f134-20020a1c1f8c000000b00345c05bc12dso2965079wmf.3
 for <qemu-devel@nongnu.org>; Wed, 05 Jan 2022 01:44:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=EmRyiPqPT1UbJM3Kj+ZhqJgdhp0FWycF9AbssdgRcyo=;
 b=UowMB6IOq6YzZkjcmodP9gNRmawrJQUE3ewoBHY94Yx/AXb9LQ5F2TfKDRU8prVb13
 2eCiH83a74ZyRgx7QiISXuOnxJMw4HHJYBd4GHL5mPuTOEecih+NaYHshiJyiZyThOnd
 k3px7wKzmMQKhF4zblQXn0+K2aC3+sGK5/yzn7yCAThD9h8m5aght5UmzeGoYb8J2lWm
 i1pIp7yDVRVp+lTsT2nHAGU+SA1ubuwlUepmptM0IqVb2qzUC5vvbK508rYo33TIvBXm
 6HvRSePq1BBnBmE5s0uzCzM3L7h5gE6g+SHg6Vlyh6p21LfYmNfN7WThiJ5KZnTNcO05
 xU+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=EmRyiPqPT1UbJM3Kj+ZhqJgdhp0FWycF9AbssdgRcyo=;
 b=atx168ld0aNNQFhrro7zEsZPlbGH2cz+F+jVWTPo927SV/iERIs9UGOw/+gA0MdVZQ
 Udo8Hpewp0R83kdvDnS5yFyGQENiRGtHUFWbWga8e2P+jYNTPrsfAiIFJJ0OM7tlckG8
 5gej0QLoqGnYCF3F9ZJTRiyMrFYeCVIvUSmzI+dj3juv8XguaJ1jZLq5RBi2ZLQpdXF/
 vYjaQYfyskMb4EKqku/Q0yF5chho0poz18Gnr40G2pKlJyoJ3Vy1ov74s/0nj3u+RRth
 XtoecYkAFlfK4VXoOfZH3rnf+/VV+nws8xJ6pvQSM+M1ZQR5CMyweaVmPQA591QPMBJ7
 p9LQ==
X-Gm-Message-State: AOAM530vefRGDQIiKeo6vt1nyqGste44R0T+CFvqyAdmQshpK0N/7mcW
 dhwAulbf83okS9tjiODQLDEbMg==
X-Google-Smtp-Source: ABdhPJw+IA48zkPvLIQ7mJFsht40V31LlpMnHHeuLC9iRoKBsZPOjz3Hkx/uOkCu5dYFBxZ4knCqqA==
X-Received: by 2002:a7b:cc8d:: with SMTP id p13mr1790984wma.6.1641375861584;
 Wed, 05 Jan 2022 01:44:21 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id l2sm42187168wrs.43.2022.01.05.01.44.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jan 2022 01:44:20 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 13EA21FFB7;
 Wed,  5 Jan 2022 09:44:20 +0000 (GMT)
References: <20220104091240.160867-1-thuth@redhat.com>
User-agent: mu4e 1.7.5; emacs 28.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] gitlab-ci: Enable docs in the centos job
Date: Wed, 05 Jan 2022 09:44:09 +0000
In-reply-to: <20220104091240.160867-1-thuth@redhat.com>
Message-ID: <87y23ujz4b.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::330
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
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
Cc: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Thomas Huth <thuth@redhat.com> writes:

> We just ran into a problem that the docs don't build on RHEL8 / CentOS 8
> anymore. Seems like these distros are using one of the oldest Sphinx
> versions that we still have to support. Thus enable the docs build in
> the CI on CentOS so that such bugs don't slip in so easily again.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Queued to testing/next, thanks.

--=20
Alex Benn=C3=A9e

