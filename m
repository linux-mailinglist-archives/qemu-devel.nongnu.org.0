Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30671692D2
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Jul 2019 16:39:53 +0200 (CEST)
Received: from localhost ([::1]:39586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hn28u-0005nZ-Di
	for lists+qemu-devel@lfdr.de; Mon, 15 Jul 2019 10:39:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37185)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <alex.bennee@linaro.org>) id 1hn28h-0005MU-0b
 for qemu-devel@nongnu.org; Mon, 15 Jul 2019 10:39:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1hn28f-0002p7-VS
 for qemu-devel@nongnu.org; Mon, 15 Jul 2019 10:39:38 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:51309)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1hn28f-0002ob-N7
 for qemu-devel@nongnu.org; Mon, 15 Jul 2019 10:39:37 -0400
Received: by mail-wm1-x344.google.com with SMTP id 207so15463251wma.1
 for <qemu-devel@nongnu.org>; Mon, 15 Jul 2019 07:39:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=4LXaoNQf24qFopRoSPS2RoY9AEH8tKLoeADRciDZGDo=;
 b=pl5nJskVvbkE7CGHwRyVB44iWnRCuTBBWFGClWL7KU8IqtWXAtla3RAAnlvumY89jY
 12WcaGRfUwWMs2ZuVjSrvjvd0TrGsZRRjRZRsPR6Wc5S8TqeikVuwMELCYqqTgopKhjQ
 +4i7g/XsFyNYqoNPEq1rsUo0ShPlR2bUnldQaIJYMk7N3ArIoYn4n2b1ALkGnG1bvuBS
 rHqTg7mp6gnch9HskiUf/IqmYFEoLIMRvxolg2STwKZLrA0oeXiPrTBQC1CzUTXXJPWA
 qWpeNoxPnE7fstCGhQcbtUJwhkAj6ELqhpWuZOJUCpUEIwkBch+mTqWEKU8P7cHMibef
 +Asw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=4LXaoNQf24qFopRoSPS2RoY9AEH8tKLoeADRciDZGDo=;
 b=W0/EXPd8Zn1ka6apy/FF6lBl01rX601KCCma20FPmhXNyTgKyoGhBU3ArXt1wTfZ0M
 qgwPPruor11t0hTQRNz34xoEVXd6Il9cBOJVPfwCnjWqIowttsbHX3Ae8LvbtgilkT6K
 CNuQ60kvIUfNV1REsZv163gHfiGoCOufbW5GE2HPugh81hmDYLRiXjpu8luv/qD4cnHr
 sGEZyszDm+IFXfauMpZO/ZimvBZePeF2QigxkzwUF99SDn+vvOCD6ckR8dVn5BGz2ABA
 pzJCcqH58hhTWXzixwUNUmMOlMM8bwS3pjpqpmDVDihFt54pKDIzkaddqqea6rYRaeVs
 6AAg==
X-Gm-Message-State: APjAAAXM9FBtRi4j9MLWBjtwl4FQ4DByEoc9Q6SFFQpu+GQ+Td6RIaxG
 zOkv84GmKv3UaxnWkc0iSFETdQ==
X-Google-Smtp-Source: APXvYqzRRy+/tTHcj5KGKpCctfZm9RnBDQvT9pViDzoVk2czZmr6SfB79ZRWRifVegPVBHLGhb2rvw==
X-Received: by 2002:a1c:f90f:: with SMTP id x15mr24314432wmh.69.1563201576369; 
 Mon, 15 Jul 2019 07:39:36 -0700 (PDT)
Received: from zen.linaroharston ([81.128.185.34])
 by smtp.gmail.com with ESMTPSA id e3sm16169897wrs.37.2019.07.15.07.39.35
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 15 Jul 2019 07:39:35 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 649491FF87;
 Mon, 15 Jul 2019 15:39:35 +0100 (BST)
References: <20190713143311.17620-1-marcandre.lureau@redhat.com>
 <20190713143311.17620-4-marcandre.lureau@redhat.com>
User-agent: mu4e 1.3.3; emacs 26.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
In-reply-to: <20190713143311.17620-4-marcandre.lureau@redhat.com>
Date: Mon, 15 Jul 2019 15:39:35 +0100
Message-ID: <87ftn7uztk.fsf@zen.linaroharston>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::344
Subject: Re: [Qemu-devel] [PATCH v3 3/6] tests/docker: add podman support
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
Cc: Fam Zheng <fam@euphon.net>, berrange@redhat.com, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, pbonzini@redhat.com,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com> writes:

> Allow to specify the container engine to run with ENGINE variable.
>
> By default, ENGINE=3Dauto and will select either podman or docker.
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  Makefile                      | 2 +-
>  tests/docker/Makefile.include | 8 ++++++--
>  2 files changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 1fcbaed62c..7863bb0cf5 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1153,7 +1153,7 @@ endif
>  	@echo  ''
>  	@echo  'Test targets:'
>  	@echo  '  check           - Run all tests (check-help for details)'
> -	@echo  '  docker          - Help about targets running tests inside Doc=
ker containers'
> +	@echo  '  docker          - Help about targets running tests inside con=
tainers'
>  	@echo  '  vm-help         - Help about targets running tests inside VM'
>  	@echo  ''
>  	@echo  'Documentation targets:'
> diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
> index f4226b79d0..3c1aec862a 100644
> --- a/tests/docker/Makefile.include
> +++ b/tests/docker/Makefile.include
> @@ -17,7 +17,9 @@ DOCKER_TESTS :=3D $(notdir $(shell \
>
>  DOCKER_TOOLS :=3D travis
>
> -DOCKER_SCRIPT=3D$(SRC_PATH)/tests/docker/docker.py
> +ENGINE :=3D auto
> +
> +DOCKER_SCRIPT=3D$(SRC_PATH)/tests/docker/docker.py --engine $(ENGINE)
>
>  TESTS ?=3D %
>  IMAGES ?=3D %
> @@ -146,7 +148,7 @@ $(foreach i,$(filter-out $(DOCKER_PARTIAL_IMAGES),$(D=
OCKER_IMAGES) $(DOCKER_DEPR
>  )
>
>  docker:
> -	@echo 'Build QEMU and run tests inside Docker containers'
> +	@echo 'Build QEMU and run tests inside Docker or Podman containers'
>  	@echo
>  	@echo 'Available targets:'
>  	@echo
> @@ -193,6 +195,8 @@ endif
>  	@echo '    EXECUTABLE=3D<path>    Include executable in image.'
>  	@echo '    EXTRA_FILES=3D"<path> [... <path>]"'
>  	@echo '                         Include extra files in image.'
> +	@echo '    ENGINE=3Dauto/docker/podman'
> +	@echo '                         Specify which container engine to run.'
>
>  # This rule if for directly running against an arbitrary docker target.
>  # It is called by the expanded docker targets (e.g. make


--
Alex Benn=C3=A9e

