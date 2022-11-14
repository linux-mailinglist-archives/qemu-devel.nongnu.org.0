Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6D12628E05
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 01:11:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouinE-0007Jy-Ps; Mon, 14 Nov 2022 18:23:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ouifU-0003B9-31
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 18:15:09 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ouYvO-0006KG-MD
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 07:50:56 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 c3-20020a1c3503000000b003bd21e3dd7aso10606131wma.1
 for <qemu-devel@nongnu.org>; Mon, 14 Nov 2022 04:50:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=K/N6XgrlezBHG44HZLs2j4eqnFbGgwxyj3DJ9JZ0HCw=;
 b=IQDmhwCxJwP0bS6hbMWNC9ci0h0DTjuUpUoeIUlxwf70ykxA4PAWpi6x5GBv2SYDkC
 604UW7to9cWbsGN4mH4daogApnLhBll+X0msl1hrO4iT6xZM9yJ0I89VsEaGntEUfsRM
 4qValgel1Q5xu4ylVOcm0azVFZm2EFfgMlq8VKEGvababmoCO6m8j2Ez4aif+KO+dxK1
 tN0YIAwd8H+WqTSWfgzlxwZf4IgQj0NHDuEwQv3ztst+s8vvyOQm3DNAmQ7bHWPr21WU
 IbCyyKIQUUdLgtQhjej1qg9SFjKna1MbDKRi4ZJVbAEnefPngYptJGZfvPMwcZcnlh/2
 gdZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=K/N6XgrlezBHG44HZLs2j4eqnFbGgwxyj3DJ9JZ0HCw=;
 b=jMzrQ6Aw6lPTSGiL6iItpk+HHVn8TrzpEOGeXR7g5M0tWqfBP9YwwXF4KV5lMxdVYA
 00fmcXi683j0rPpwyoiRqFBR873kbsGxDTAYL7JX5Rq8vSmsYRhv9NxxKo9xod1stcgu
 6DnJo6ZqM3UpEWPKQ/SUO4EZW3t3+BF0QF8DYgNTE3ipcEs1Ym/qJpRSU/eFcFG+F8id
 p/6ho9Chh0+SfxEzmYcTnXU3sqMR57Pdm6laovaTItdSXrmQNbb4zUYmUUQLl0s1VtNT
 t5Muc7M69ou69Qcd3SI1o4IOINmxj0dZ+q6MbY9a4pc3jqRGW7kzIp3P28JWIhyT0O+R
 DMXw==
X-Gm-Message-State: ANoB5pllNGUF6Vs6VFbZrknGkM1F0s/qJcAmwfOq2LuKd4KyNOhoFKVF
 wQMAT4csfMVKCardLdvI/Mm4/Q==
X-Google-Smtp-Source: AA0mqf6bsRYZr45mdHhnmWXM7KFOQJUa7ZuRmPjM9kcgJEmleav5jtccy9tWyvlw+J0WB5O9Aa5iXQ==
X-Received: by 2002:a05:600c:3c93:b0:3cf:cfcd:1e0 with SMTP id
 bg19-20020a05600c3c9300b003cfcfcd01e0mr7906373wmb.166.1668430252220; 
 Mon, 14 Nov 2022 04:50:52 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 b11-20020a5d550b000000b0023659925b2asm9381234wrv.51.2022.11.14.04.50.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Nov 2022 04:50:50 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 69C201FFB7;
 Mon, 14 Nov 2022 12:50:50 +0000 (GMT)
References: <20221111145529.4020801-1-alex.bennee@linaro.org>
User-agent: mu4e 1.9.2; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org,
 aurelien@aurel32.net, pbonzini@redhat.com, stefanha@redhat.com,
 crosa@redhat.com, Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH for 7.2-rc1 v2 00/12] testing, docs, plugins, arm pre-PR
Date: Mon, 14 Nov 2022 12:47:24 +0000
In-reply-to: <20221111145529.4020801-1-alex.bennee@linaro.org>
Message-ID: <87bkp9bsyd.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32e.google.com
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


Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> Hi,
>
> This is my pre-PR series for the pull request I'm going to send on
> Monday in time for Tuesday tagging of rc1. Anything not reviewed will
> get dropped from the PR (which probably includes the GICD_IIDR which
> was just an annoyance I noticed while debugging Xen for another
> series). The following still need review:
>
>  - hw/intc: add implementation of GICD_IIDR to Arm GIC
>  - gitlab: integrate coverage report (1 acks, 1 sobs)
>  - tests/plugins: add a new vcpu state tracking plugin
>  - tests/docker: allow user to override check target

Any more before I roll the PR?

--=20
Alex Benn=C3=A9e

