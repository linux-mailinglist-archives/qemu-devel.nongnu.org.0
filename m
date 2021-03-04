Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B527532D47E
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 14:49:28 +0100 (CET)
Received: from localhost ([::1]:55960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHoM3-0003l8-PK
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 08:49:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lHoIC-0002ZD-Ob
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 08:45:28 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:39806)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lHoIA-0004DN-Sj
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 08:45:28 -0500
Received: by mail-wm1-x334.google.com with SMTP id u125so9716194wmg.4
 for <qemu-devel@nongnu.org>; Thu, 04 Mar 2021 05:45:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=uKSMBDuIUcRnDwy77H8dg8WHt/hPt4vbJ1e4hRZok/Q=;
 b=ilxvGOpzLENsO4Lw2uetggOHXx6c3IyXYIFbuqRFkVsYBgZ/KexXb+DyBZrNJqrgha
 Su0oIS1FqVwaUXU9bLnEsGu3yf6HxNcCpnft+gbW3HNz+1nVSyDDb48YJhnaGrXp2v/k
 8niz5fF00VoWtXw2kJdtfga3qjwA6CIMjoX6VO9uACJvYWRRwKEtCKEaBczwOXkxoTbx
 0VlCQEPlklITPPxnJORBS5cCPV2y1QUisu3myZBrR0/c5y7aKZvDhCgJNdMlfYnduOsD
 4vG/vfet0BsQ5wA5CrwBZFWMUqKyIF2F1xfxm4lqNdHorGNgyGmt8KBhhW3CX5ObWXbb
 cY1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=uKSMBDuIUcRnDwy77H8dg8WHt/hPt4vbJ1e4hRZok/Q=;
 b=KrUY/nIPMNXjv7OCWZd3+poS/+7Jt5EvUop37shEWafxcLH2Bg5gPn4QrpyRPXAtfF
 Cjn+Y8urG3DP/DkpGuv/24Y4EcxI4rcZyqMkENoNWydC9NoRFl1Xe/v+mYPdpCmW4cCf
 TP+RMx3MjEO+xrCL/4w/egDWYbD+lI/WYIcEmktOcBSvUAqZ57xarX3xjFeoScWbF/8r
 ayv8lNwsmygKSJfkRLdD7p4b3Sm1oxO8NyHYeL8Cp7htEPsxgeswgWUDgOCHNs6NF/xQ
 nJ4f8jEPfsfvfWykIcrj0ywb8als28JHUJa8zA//ATNIPDyjP0vtGw9ac7I/DDbyhGU4
 XrDw==
X-Gm-Message-State: AOAM53219EE5Fll0RdBX4fMyMqjMHiN3Ky0Xht4Hvi+niLoChQgHlM+s
 XpL2pbvyMFblD8i04oFYYQv+5A==
X-Google-Smtp-Source: ABdhPJxhFtz+pRom4bKUgDeZc9BANS7Uq6USo+DOSaUtoiUvPq7kiHPq4/2bMqavwjU42jt62V7dDA==
X-Received: by 2002:a05:600c:2282:: with SMTP id
 2mr4066287wmf.93.1614865524828; 
 Thu, 04 Mar 2021 05:45:24 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id a75sm10289704wme.10.2021.03.04.05.45.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Mar 2021 05:45:23 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 104981FF7E;
 Thu,  4 Mar 2021 13:45:23 +0000 (GMT)
References: <20210228222314.304787-1-f4bug@amsat.org>
User-agent: mu4e 1.5.8; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH 0/4] hexagon: Add Docker image & testing to gitlab-ci
Date: Thu, 04 Mar 2021 13:44:46 +0000
In-reply-to: <20210228222314.304787-1-f4bug@amsat.org>
Message-ID: <8735xbghho.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
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
Cc: Fam Zheng <fam@euphon.net>, Brian Cain <bcain@quicinc.com>,
 qemu-devel@nongnu.org, Alessandro Di Federico <ale.qemu@rev.ng>,
 Taylor Simpson <tsimpson@quicinc.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> Hi,
>
> This series is a rework of the 'Add Dockerfile for hexagon' patch
> from Alessandro/Brian that Taylor sent in v8:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg780330.html
> but adapted to mainstream.

Queued patches 1 and 2 to testing/next, thanks.

>
> Gitlab shared runner are usually capped to 2/4 cores and timeout
> after 2h30 to 3h. We need a beefy custom runner to get the image
> built and stored in the registry. For now the image is added in
> manual mode, hopping we'll have magic runners added some day to
> build the image, then developers can directly pull it from the
> registry.
>
> Alessandro Di Federico (2):
>   docker: Add Hexagon image
>   tests/tcg: Use Hexagon Docker image
>
> Philippe Mathieu-Daud=3DC3=3DA9 (2):
>   gitlab-ci: Pass optional EXTRA_FILES when building docker images
>   gitlab-ci: Build Hexagon cross-toolchain
>
>  .gitlab-ci.d/containers.yml                   |  11 ++
>  tests/docker/Makefile.include                 |   2 +
>  .../dockerfiles/debian-hexagon-cross.docker   |  23 +++
>  .../build-toolchain.sh                        | 141 ++++++++++++++++++
>  tests/tcg/configure.sh                        |   4 +
>  5 files changed, 181 insertions(+)
>  create mode 100644 tests/docker/dockerfiles/debian-hexagon-cross.docker
>  create mode 100755 tests/docker/dockerfiles/debian-hexagon-cross.docker.=
d/bu=3D
> ild-toolchain.sh
>
> --=3D20
> 2.26.2


--=20
Alex Benn=C3=A9e

