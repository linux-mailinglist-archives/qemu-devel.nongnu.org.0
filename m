Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7FA751518C
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 19:20:31 +0200 (CEST)
Received: from localhost ([::1]:46956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkUIA-0001CN-Fw
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 13:20:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nkUGd-00008s-KE
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 13:18:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54605)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nkUGY-0007c5-Vs
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 13:18:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651252729;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UjYuTalBAda++x36PpvtJCdjqEUOtNsghTSgNCzOcIA=;
 b=fWt6ny0zyFKP74FpaBad2Zol2mpc+XRALabjO3n0iO2nmioceIWtMTQbW5y+5J5AVF/RjP
 JpdHuPjfxpjYpyOrfDcJ1hi3vuan/ghWAYtX44Bz9gGGQA8nLuQQ5g06mBRU3Qbwh7fLor
 WpWSxP2kbN1kSwreDCEku09/d9JSbd0=
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-488-JQvYmYxyNJWsigw3MolKFQ-1; Fri, 29 Apr 2022 13:18:48 -0400
X-MC-Unique: JQvYmYxyNJWsigw3MolKFQ-1
Received: by mail-ua1-f69.google.com with SMTP id
 o7-20020ab01e87000000b00362757f955aso3681149uak.15
 for <qemu-devel@nongnu.org>; Fri, 29 Apr 2022 10:18:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UjYuTalBAda++x36PpvtJCdjqEUOtNsghTSgNCzOcIA=;
 b=dmq0cStS+2k15j7a+1MHbmI9SvMWsuZOjeR5G4I86gXIyWZx20i8zpr3JSttjHRyKR
 CkQKmgNbWXSCbwiyEAi8IWoy4V6Pgwz2zelAIpiXlWMnaqSUowK64NGJ2Giay54s04Ul
 rAqIu0Z4m5zl0zPLeqO0nB7a1TBqcm3CjCoAWoZE3IeiKLqFnvTeb96/Y+vrfLfOM4eh
 2VTNRJ811rhvJLvbtbya9NXT0QdpUKo8mD4E38kKOSRaKQ2NngCKz7sa7c5wVyJUEFQX
 GS+GsreNHZ0YgYWaDzI0ED6v0Znj4EKjY/qB1KqtlXEy5tcuQXgBbT8+Z0ZXuF0KUGhP
 jEQQ==
X-Gm-Message-State: AOAM530qskq5gIxYWzxlY8MmJRSqaprDAkKvIZaPU7GYsEYd3M27bsBD
 sFsZ0/4K9XVDyUt8lrxP5RhXu7bQfGTj5bS8SskHmAJlBw4wEa62ylpnmvc1GiMuwZf0n4ZCwFS
 r0SA7CZkbcYm+kC6qeN9rx8B3RPinueA=
X-Received: by 2002:a9f:2046:0:b0:35d:bfc:2c9 with SMTP id
 64-20020a9f2046000000b0035d0bfc02c9mr49051uam.119.1651252727754; 
 Fri, 29 Apr 2022 10:18:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxI6/eMGM52QhQdDGwRU3vKIiISXgra99ulGJpM+Ed2G/AUt0nnkP6r2jdo/W1CaJPpYum57g678SbE8kEtpN0=
X-Received: by 2002:a9f:2046:0:b0:35d:bfc:2c9 with SMTP id
 64-20020a9f2046000000b0035d0bfc02c9mr49045uam.119.1651252727519; 
 Fri, 29 Apr 2022 10:18:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220422184940.1763958-1-jsnow@redhat.com>
In-Reply-To: <20220422184940.1763958-1-jsnow@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Fri, 29 Apr 2022 13:18:36 -0400
Message-ID: <CAFn=p-Yn+gBBWw0qpEngyuBv2_zNZFmO17b07EXps4k9=32jog@mail.gmail.com>
Subject: Re: [qemu.qmp PATCH 00/12] python: fork qemu.qmp python lib into
 independent repo
To: qemu-devel <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Kashyap Chamarthy <kchamart@redhat.com>,
 Daniel Berrange <berrange@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Apr 22, 2022 at 2:49 PM John Snow <jsnow@redhat.com> wrote:
>
> GitLab: https://gitlab.com/jsnow/qemu.qmp/-/commits/initial-checkin
>
> Hi, this series is part of an effort to publish the qemu.qmp package on
> PyPI. It is part of the second of three phases to complete this work:
>
>     (1) Switch the new Async QMP library in to python/qemu/qmp [merged!]
>     (2) Fork python/qemu/qmp out into its own repository.
> -->    (2a) Do the bare minimum to be consistent.
>        (2b) Add most GitLab CI/CD targets.
>        (2c) Add Sphinx doc builds, update docs, and publish to GitLab pages.
>        (2d) Add dynamic git versioning and GitLab package builds.
>     (3) Update qemu.git to install qemu.qmp from PyPI,
>         and then delete python/qemu/qmp.
>
> This series is not meant to apply to qemu.git, rather -- it's the series
> that performs the split and applies to the brand new repository.
>
> If there are no objections, I intend to push the content of this branch
> to https://gitlab.com/qemu-project/python-qemu-qmp within a week or so.
>
> Most URLs in this series have been updated to point to the new repo URL,
> except one link to https://jsnow.gitlab.io/qemu.qmp/ which will be
> updated when step (2c) above is handled.
>
> John Snow (12):
>   fork qemu.qmp from qemu.git
>   update maintainer metadata
>   update project description
>   update project URLs
>   add a couple new trove classifiers
>   move README.rst to FILES.rst and update
>   move PACKAGE.rst to README.rst and update
>   docs: add versioning policy to README
>   add LGPLv2+ and GPLv2 LICENSE files
>   update Pipfile
>   remove sub-dependency pins from Pipfile
>   update VERSION to 0.0.0a1
>
>  .gitignore            |   2 +-
>  FILES.rst             |  67 ++++++
>  LICENSE               | 481 ++++++++++++++++++++++++++++++++++++++++++
>  LICENSE_GPL2          | 339 +++++++++++++++++++++++++++++
>  MANIFEST.in           |   3 +-
>  Makefile              |  16 +-
>  PACKAGE.rst           |  43 ----
>  Pipfile               |   4 +-
>  Pipfile.lock          | 288 ++++++++++++++-----------
>  README.rst            | 272 ++++++++++++++++--------
>  VERSION               |   2 +-
>  qemu/qmp/__init__.py  |   2 +-
>  qemu/qmp/legacy.py    |   2 +-
>  qemu/qmp/qmp_shell.py |   2 +-
>  qemu/qmp/qmp_tui.py   |   2 +-
>  setup.cfg             |  41 ++--
>  setup.py              |   2 +-
>  17 files changed, 1262 insertions(+), 306 deletions(-)
>  create mode 100644 FILES.rst
>  create mode 100644 LICENSE
>  create mode 100644 LICENSE_GPL2
>  delete mode 100644 PACKAGE.rst
>
> --
> 2.34.1
>
>

Pushed directly as the initial commit.

https://gitlab.com/qemu-project/python-qemu-qmp

Thanks, everyone. I'll begin drafting and submitting merge requests
for further work on this repository and, for now, CCing the mailing
list pointing to the MRs.

--js


