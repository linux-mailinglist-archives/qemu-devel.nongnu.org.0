Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 126BB3BBE7E
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 16:54:20 +0200 (CEST)
Received: from localhost ([::1]:56304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0PzH-0004eu-3f
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 10:54:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m0Px7-0002NT-59
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 10:52:05 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:37541)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m0Px4-0002UR-7y
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 10:52:04 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 r9-20020a7bc0890000b02901f347b31d55so11444862wmh.2
 for <qemu-devel@nongnu.org>; Mon, 05 Jul 2021 07:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=ATWJSERqeGGIghigQev198DbKLdaK6WkYs7ni4BWdkM=;
 b=WCORZgTk6ATr2gETrUsWZxWwZcHWdgIm3JFzFAr81TKOqz9C/qtDEyAJWblQeLEePc
 7zV/lwzFinJ0sbwiBtXwbQszCY/iyByjzK2dDng2HXJiBjCv6ywlkuUAyFB9YjgvXHhO
 XW2uSaRFOVBirv4c2QbWIn9pEeFOTSa+u4JKZOU+cyfSp8NgmWgeSptM8mmNd1/PYAvs
 R1BTOje/VKhWrjTR9hdI2ReqruUbm4mBJ5dCorJ0dZT/tGgVTf2L2uKFV/WijQM7DY4P
 8mnvWwOOaHyeGURoDNNngUgl7c1iQlau82ATFwFQz/PqTx/GaPGO1KWO93BSTYJJKppn
 djAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=ATWJSERqeGGIghigQev198DbKLdaK6WkYs7ni4BWdkM=;
 b=g3h945Bun3mxNPg1tBq1RQafOfAHtxRvh9rFUS3iJpuTNubKHp7Ck1mXrOG111Jk4+
 FHmJEZLYsjKVFe/OmBpBVNFC1doOOLQgd1HbagLmceHWtoQcJXeCKBVExbHl6C1k3l/e
 Waxe3stL3gWgcubnF7KubC2xi1/D/DMtGw7/NX/d5XyYrZHw6XFNP5ujn34pBPamQqTI
 V+Ce08KqhM6Rnv9EJ+ru9fMhovXNiHCuSSIujSTMinGHkg9Nm4Kkk8h3wYno26YAYLCs
 YSLOU3EDfNHzddqft0fmUFDKyXhPl0oGfJTqzZT+MMtqUkyUpj+HYeKJImP42XBrDEQC
 y+1g==
X-Gm-Message-State: AOAM532QfeEfgYRBS2h8hoW59iudaGNyJFHAA7H/8Lwu5kXOXYP+zPSk
 46UUtDtWf7/L5/E13GGN73M2cw==
X-Google-Smtp-Source: ABdhPJw92XXEWFxjQFAU+DTXuj9Y+FMPI8P13HcgXQ0WSHsHTmlQsnfl/a+LILfKlyJgB+lardg6DQ==
X-Received: by 2002:a05:600c:4fd3:: with SMTP id
 o19mr15638176wmq.31.1625496720575; 
 Mon, 05 Jul 2021 07:52:00 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id x17sm16548767wrn.62.2021.07.05.07.51.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jul 2021 07:51:59 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 044AF1FF7E;
 Mon,  5 Jul 2021 15:51:59 +0100 (BST)
References: <20210623142245.307776-1-berrange@redhat.com>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [PATCH v4 00/22] tests/docker: start using libvirt-ci's
 "lcitool" for dockerfiles
Date: Mon, 05 Jul 2021 15:51:17 +0100
In-reply-to: <20210623142245.307776-1-berrange@redhat.com>
Message-ID: <87tul83jap.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> Currently the tests/docker/dockerfiles/*Dockerfile recipes are all hand
> written by contributors. There is a common design pattern, but the set
> of packages listed for installation leaves alot to be desired
>
>  - There is no consistency at all across distros
>  - Many potential build deps are not listed in the containers
>  - Some packages are not used by QEMU at all
>  - Adding new distros is an error prone task
>
> The same applies to package lists for VMs, Cirrus CI / Travis CI, and
> probably more.

Queued patches 1-15 to testing/next, thanks.

--=20
Alex Benn=C3=A9e

