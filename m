Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F58493857
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 11:24:02 +0100 (CET)
Received: from localhost ([::1]:51650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nA88G-0004Jm-T3
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 05:24:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nA849-0001w3-H3
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 05:19:46 -0500
Received: from [2a00:1450:4864:20::32d] (port=37603
 helo=mail-wm1-x32d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nA848-0007ET-19
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 05:19:45 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 l12-20020a7bc34c000000b003467c58cbdfso13298107wmj.2
 for <qemu-devel@nongnu.org>; Wed, 19 Jan 2022 02:19:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=32NZUcMn7M2sncz2jdLKxL+c7bFhcjffzHia3wtPOTQ=;
 b=KqAApRikjD1H59tTCFfGrw1v0qma1DxPZXAsX3unzIMzHRCmeptpD7t8/iUt5/5fEB
 GEfeaJL/IOEtfkHOelzLZDK8XN58lUwIZu87N/VDku5gbTyrk0O39YKTeAM8MGxRoCGx
 EPcDxlz+RNDV51sPnJpCVLWuPr9qrhXT/CMZV2i+nrH7WSDp2WtY9tI4fj7tsWxQZ5H4
 XbmsmwKW1d7j3VjrRmj9snhU/uC7f9FC4Sgw7XuLjJcQIr4Sc7bI4DzWzeJz9y6F2Pq3
 H5hcFKRcdjqRWUeFWGCvYFOkoE4rt5oHkS6krwZd21ytoVaGdebkcU1PUV2uy/yxk54O
 ovsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=32NZUcMn7M2sncz2jdLKxL+c7bFhcjffzHia3wtPOTQ=;
 b=WXlMl+BhJLZY+Gcx9b99PXb1NyVZ9Epg7Go7tZwHnCqh+ooB5mOHRv2yGleSY20/EE
 qlEKNK7zVOkaJrjmwmWz9DpUOU1p/uGBgHEg5UXznF/rB1VblO6Y4+7B6GI1i50N7Xmu
 z1ZCQSaCm3q9UuSpMPE1W8EeD5lsH+XTYSWaXJhsCilreXCVP+wSEjNdH8xoERgBrY6U
 L87qSl7pg3jm+XWRsFa5JQh0QeobX7X+KoEE7XAsXGo1YbVWc4GGo5It4jbdsjjpmqWQ
 gjJQDNmRAzUgSiknrnvarhOAQrABlgz/21IYv1eUaO+aQobt5Sncajnv/0BerHcHyv1S
 xoGQ==
X-Gm-Message-State: AOAM533iymAThtHZIjYiYrGGXs/uTIivV58uKzA7jUUMJ4tVpzAt2eyj
 uM5MsQv1PNQlKPq2iLGnrO3v6w==
X-Google-Smtp-Source: ABdhPJy3Z+dQJeOvb0tEdJLiEAGVHS3cIwaYYkA/w7T6uTre4ILW4QaDdT70DnqSzdHLwxvSqS9Wvw==
X-Received: by 2002:adf:dd0d:: with SMTP id a13mr28221356wrm.610.1642587582513; 
 Wed, 19 Jan 2022 02:19:42 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o23sm3741858wmh.36.2022.01.19.02.19.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jan 2022 02:19:41 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 602B71FFB7;
 Wed, 19 Jan 2022 10:19:40 +0000 (GMT)
References: <163491872706.304355.11795681036780988723.stgit@pc-System-Product-Name>
 <87v91l0vvt.fsf@linaro.org>
 <155b5061-bc5b-6a23-ea5a-1d0fd367dc16@ispras.ru>
User-agent: mu4e 1.7.5; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Subject: Re: [PATCH v3 0/3] plugins: add a drcov plugin
Date: Wed, 19 Jan 2022 10:17:57 +0000
In-reply-to: <155b5061-bc5b-6a23-ea5a-1d0fd367dc16@ispras.ru>
Message-ID: <87lezc81tv.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: NDNF <arkaisp2021@gmail.com>, arkadiy.ivanov@ispras.ru,
 qemu-devel@nongnu.org, pavel.dovgaluk@ispras.ru
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru> writes:

> On 25.10.2021 22:03, Alex Benn=C3=A9e wrote:
>> NDNF <arkaisp2021@gmail.com> writes:
>>=20
>>> These patches adds the ability to generate files in drcov format.
>>> Primary goal this scripts is to have coverage
>>> logfiles thatwork in Lighthouse.
>> Queued with some fixes to plugins/next, thanks.
>>=20
>
> ping

I would still like to find a decent way of testing these coverage files.
I looked at a number of FLOSS tools and I think radare2 can handle the
drcov format but I couldn't get anything out of it.

I'll be posting the state of my plugins/next tree soon and we can get
some final reviews before submitting the PR.

--=20
Alex Benn=C3=A9e

