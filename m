Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE4210622
	for <lists+qemu-devel@lfdr.de>; Wed,  1 May 2019 10:33:20 +0200 (CEST)
Received: from localhost ([127.0.0.1]:40144 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hLkg3-0002A5-HD
	for lists+qemu-devel@lfdr.de; Wed, 01 May 2019 04:33:19 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39273)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1hLkcx-0000K5-5x
	for qemu-devel@nongnu.org; Wed, 01 May 2019 04:30:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1hLkcu-0000ur-53
	for qemu-devel@nongnu.org; Wed, 01 May 2019 04:30:07 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:41977)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
	id 1hLkct-0000sJ-TQ
	for qemu-devel@nongnu.org; Wed, 01 May 2019 04:30:04 -0400
Received: by mail-wr1-x444.google.com with SMTP id c12so23824044wrt.8
	for <qemu-devel@nongnu.org>; Wed, 01 May 2019 01:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=references:user-agent:from:to:cc:subject:in-reply-to:date
	:message-id:mime-version:content-transfer-encoding;
	bh=9uxh3wA0VQwkUd/c3XSQevr1pkhzyq4Y6eYVE3BjJ08=;
	b=IRxXd7jMyne9oE+mx9TjjiPMwIqOjAJLPXpX7RHEkmWuSWpncR7sDkprfsuJi4m9oj
	jhjoHaqbBlVwAPtoAtuNiujgWns5mwz8/uc500A9dpkAfiHGidJDIbj0rmNTc21LSGOR
	lx6PRSxCGR7iO21QBZZkOEtXfw/bRHVnh6Hhd7Q0QGMCVrHhKUyuKeFbV0As0atLPMVi
	l2JOpySk3YLoPD2mjTsDhXNxxKPl2BB68D7HHVpEMg2+yf4z8KuXiPmvj2SR/zU4SWul
	sqMR4gig6oRliYrCBSPCNbwrZUn6eT3JmB2NNPnJmtB8WTZ50G4a6dkxxU5K7zaGeyLw
	6bOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:references:user-agent:from:to:cc:subject
	:in-reply-to:date:message-id:mime-version:content-transfer-encoding;
	bh=9uxh3wA0VQwkUd/c3XSQevr1pkhzyq4Y6eYVE3BjJ08=;
	b=OmeMQ6ETy2c5todPm1pl3/GvUzBjjMJd/aw/g/ZJ+CwEL8WNUJIMLgVIsZg+fcPsUa
	RlN03s4A1nnP8ZnXsZd5Lxx+AUvuldN+hzeqc5KIn3S7sd9dvOR2/xlTl1tUduQ7P36q
	Flc9eypySnWv0wrjbGkS3zzvKa0xEyz94gJzzinTJ4XsGNpkUL4B6W3fk6tcaQYC4mUg
	Y92J2oVNEsL+p06KvE576OxdtWlzM9+XGKjcpntlT8YY7ACxGfnevcIXl8HvwqZV/SkM
	O+R/G36cw2FjekeEaBgc3T2k5ZeJMRqga3NViZPU1dlNaWtCDPFIzSSV69NModu1vMLf
	+ldg==
X-Gm-Message-State: APjAAAUmaassNvStsTvOt6c0C5PNZnmix9ca9wxLv4X9YDnUZmLu+xzH
	q6RbMLhR0pDKgalnsw/7h12Cig==
X-Google-Smtp-Source: APXvYqyajbpJ8WrZ5StW0M5V6bNVl94EyRwLB2fk9A1dyuTMgp9R58Nb9VZaF7GYjbFAcP9+IcMijA==
X-Received: by 2002:adf:bac9:: with SMTP id w9mr23556221wrg.256.1556699402625; 
	Wed, 01 May 2019 01:30:02 -0700 (PDT)
Received: from zen.linaroharston ([81.128.185.34])
	by smtp.gmail.com with ESMTPSA id z9sm1041993wma.39.2019.05.01.01.30.01
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 01 May 2019 01:30:01 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 98D391FF87;
	Wed,  1 May 2019 09:30:01 +0100 (BST)
References: <20190428155451.15653-1-thuth@redhat.com>
User-agent: mu4e 1.3.1; emacs 26.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
In-reply-to: <20190428155451.15653-1-thuth@redhat.com>
Date: Wed, 01 May 2019 09:30:01 +0100
Message-ID: <87bm0m7f1y.fsf@zen.linaroharston>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::444
Subject: Re: [Qemu-devel] [PATCH v2 0/8] tests/qemu-iotests: Run basic
 iotests during "make check"
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
	Ed Maste <emaste@freebsd.org>, qemu-block@nongnu.org,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	qemu-devel@nongnu.org, Christophe Fergeau <cfergeau@redhat.com>,
	Max Reitz <mreitz@redhat.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Li-Wen Hsu <lwhsu@freebsd.org>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Thomas Huth <thuth@redhat.com> writes:

> People often forget to run the iotests before submitting patches or
> pull requests - this is likely due to the fact that we do not run the
> tests during our mandatory "make check" tests yet.
> This patch series now changes the "auto" group to only include tests
> that should be safe to run in all CI environments (including FreeBSD
> and macOS!). Thus these iotests can now always be run during "make
> check" automatically, too.

Assuming my local tests work I think I should queue these and submit a
PR right away. Sorry about the delay getting to them.

>
> v2:
>  - Use "auto" group instead of adding a new "ci" group
>  - Adjusted the tests that are run automatically (after doing lots
>    of CI runs on cirrus-ci.com, gitlab and travis)
>  - Added patch to fix the current regression with the "qemu-io:"
>    prefix in the master branch
>  - Added a fix for iotest 005 on ext4 filesystems (skip it there)
>
> Thomas Huth (8):
>   tests/qemu-iotests: Fix output of qemu-io related tests
>   tests/qemu-iotests/005: Add a sanity check for large sparse file
>     support
>   tests/qemu-iotests/check: Pick a default machine if necessary
>   tests/qemu-iotests: Do not hard-code the path to bash
>   cirrus / travis: Add gnu-sed and bash for macOS and FreeBSD
>   tests/qemu-iotests: Remove the "_supported_os Linux" line from many
>     tests
>   tests/qemu-iotests/group: Re-use the "auto" group for tests that can
>     always run
>   tests: Run the iotests during "make check" again
>
>  .cirrus.yml                 |   4 +-
>  .travis.yml                 |   1 +
>  tests/Makefile.include      |   8 +-
>  tests/check-block.sh        |  44 +++++++---
>  tests/qemu-iotests-quick.sh |   8 --
>  tests/qemu-iotests/001      |   1 -
>  tests/qemu-iotests/002      |   1 -
>  tests/qemu-iotests/003      |   1 -
>  tests/qemu-iotests/004      |   1 -
>  tests/qemu-iotests/005      |   9 ++
>  tests/qemu-iotests/007      |   1 -
>  tests/qemu-iotests/008      |   1 -
>  tests/qemu-iotests/009      |   1 -
>  tests/qemu-iotests/010      |   1 -
>  tests/qemu-iotests/011      |   1 -
>  tests/qemu-iotests/012      |   1 -
>  tests/qemu-iotests/015      |   1 -
>  tests/qemu-iotests/017      |   1 -
>  tests/qemu-iotests/020      |   1 -
>  tests/qemu-iotests/021      |   1 -
>  tests/qemu-iotests/022      |   1 -
>  tests/qemu-iotests/025      |   1 -
>  tests/qemu-iotests/026      |   1 -
>  tests/qemu-iotests/026.out  | 168 +++++++++++++++++------------------
>  tests/qemu-iotests/027      |   1 -
>  tests/qemu-iotests/029      |   1 -
>  tests/qemu-iotests/031      |   1 -
>  tests/qemu-iotests/032      |   1 -
>  tests/qemu-iotests/033      |   1 -
>  tests/qemu-iotests/035      |   1 -
>  tests/qemu-iotests/036      |   1 -
>  tests/qemu-iotests/037      |   1 -
>  tests/qemu-iotests/042      |   1 -
>  tests/qemu-iotests/043      |   1 -
>  tests/qemu-iotests/046      |   1 -
>  tests/qemu-iotests/047      |   1 -
>  tests/qemu-iotests/049      |   1 -
>  tests/qemu-iotests/050      |   1 -
>  tests/qemu-iotests/051      |   1 -
>  tests/qemu-iotests/052      |   1 -
>  tests/qemu-iotests/053      |   1 -
>  tests/qemu-iotests/054      |   1 -
>  tests/qemu-iotests/060.out  |   6 +-
>  tests/qemu-iotests/062      |   1 -
>  tests/qemu-iotests/063      |   1 -
>  tests/qemu-iotests/066      |   1 -
>  tests/qemu-iotests/067      |   1 -
>  tests/qemu-iotests/068      |   1 -
>  tests/qemu-iotests/069      |   1 -
>  tests/qemu-iotests/069.out  |   2 +-
>  tests/qemu-iotests/070.out  |   2 +-
>  tests/qemu-iotests/071      |   1 -
>  tests/qemu-iotests/072      |   1 -
>  tests/qemu-iotests/073      |   1 -
>  tests/qemu-iotests/075.out  |  14 +--
>  tests/qemu-iotests/076.out  |   6 +-
>  tests/qemu-iotests/078.out  |  12 +--
>  tests/qemu-iotests/079      |   1 -
>  tests/qemu-iotests/080.out  |  40 ++++-----
>  tests/qemu-iotests/081.out  |   2 +-
>  tests/qemu-iotests/082      |   1 -
>  tests/qemu-iotests/085      |   1 -
>  tests/qemu-iotests/088.out  |  12 +--
>  tests/qemu-iotests/089      |   1 -
>  tests/qemu-iotests/090      |   1 -
>  tests/qemu-iotests/094      |   1 -
>  tests/qemu-iotests/095      |   1 -
>  tests/qemu-iotests/098      |   1 -
>  tests/qemu-iotests/102      |   1 -
>  tests/qemu-iotests/103      |   1 -
>  tests/qemu-iotests/103.out  |  14 +--
>  tests/qemu-iotests/104      |   1 -
>  tests/qemu-iotests/105      |   1 -
>  tests/qemu-iotests/107      |   1 -
>  tests/qemu-iotests/110      |   1 -
>  tests/qemu-iotests/111      |   1 -
>  tests/qemu-iotests/112      |   1 -
>  tests/qemu-iotests/114      |   1 -
>  tests/qemu-iotests/114.out  |   2 +-
>  tests/qemu-iotests/115      |   1 -
>  tests/qemu-iotests/116.out  |  14 +--
>  tests/qemu-iotests/117      |   1 -
>  tests/qemu-iotests/120      |   1 -
>  tests/qemu-iotests/125      |   1 -
>  tests/qemu-iotests/126      |   1 -
>  tests/qemu-iotests/127      |   1 -
>  tests/qemu-iotests/131.out  |   2 +-
>  tests/qemu-iotests/133      |   1 -
>  tests/qemu-iotests/133.out  |  30 +++----
>  tests/qemu-iotests/134      |   1 -
>  tests/qemu-iotests/137.out  |  28 +++---
>  tests/qemu-iotests/140.out  |   2 +-
>  tests/qemu-iotests/142      |   1 -
>  tests/qemu-iotests/143      |   1 -
>  tests/qemu-iotests/143.out  |   2 +-
>  tests/qemu-iotests/144      |   1 -
>  tests/qemu-iotests/145      |   1 -
>  tests/qemu-iotests/153      |   1 -
>  tests/qemu-iotests/153.out  |  30 +++----
>  tests/qemu-iotests/156      |   1 -
>  tests/qemu-iotests/157      |   1 -
>  tests/qemu-iotests/158      |   1 -
>  tests/qemu-iotests/159      |   1 -
>  tests/qemu-iotests/162      |   1 -
>  tests/qemu-iotests/170      |   1 -
>  tests/qemu-iotests/173      |   1 -
>  tests/qemu-iotests/182      |   1 -
>  tests/qemu-iotests/183      |   1 -
>  tests/qemu-iotests/186      |   1 -
>  tests/qemu-iotests/187      |   1 -
>  tests/qemu-iotests/187.out  |   6 +-
>  tests/qemu-iotests/188.out  |   2 +-
>  tests/qemu-iotests/190      |   1 -
>  tests/qemu-iotests/191      |   1 -
>  tests/qemu-iotests/192      |   1 -
>  tests/qemu-iotests/195      |   1 -
>  tests/qemu-iotests/197      |   1 -
>  tests/qemu-iotests/197.out  |   2 +-
>  tests/qemu-iotests/200      |   1 -
>  tests/qemu-iotests/205      |   2 +-
>  tests/qemu-iotests/214      |   1 -
>  tests/qemu-iotests/215      |   1 -
>  tests/qemu-iotests/215.out  |   2 +-
>  tests/qemu-iotests/217      |   1 -
>  tests/qemu-iotests/226.out  |  16 ++--
>  tests/qemu-iotests/227      |   1 -
>  tests/qemu-iotests/231      |   1 -
>  tests/qemu-iotests/233      |   1 -
>  tests/qemu-iotests/239      |   2 +-
>  tests/qemu-iotests/240      |   3 +-
>  tests/qemu-iotests/241      |   2 +-
>  tests/qemu-iotests/243      |   2 +-
>  tests/qemu-iotests/244      |   2 +-
>  tests/qemu-iotests/244.out  |  10 +--
>  tests/qemu-iotests/247      |   1 -
>  tests/qemu-iotests/check    |  13 ++-
>  tests/qemu-iotests/group    | 169 +++++++++++++++++++-----------------
>  137 files changed, 372 insertions(+), 421 deletions(-)
>  delete mode 100755 tests/qemu-iotests-quick.sh


--
Alex Benn=C3=A9e

