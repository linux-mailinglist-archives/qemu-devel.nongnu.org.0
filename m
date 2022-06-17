Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7899C54FAD6
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jun 2022 18:09:06 +0200 (CEST)
Received: from localhost ([::1]:50768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o2EWv-0005Xw-5d
	for lists+qemu-devel@lfdr.de; Fri, 17 Jun 2022 12:09:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1o2ETS-0001uc-NF
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 12:05:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32384)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1o2ETP-0002Zl-HD
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 12:05:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655481924;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=n8IA4l644Ah5pQ8j0ESEqVvwKyKM01r4rQPrO91VLww=;
 b=TU+nxsUO738SMXqcyWAE1Jizz/yFwXS3EdumjE/7saD68slZjWE5LmhruR0VUPSmFkgVOf
 3T3U/HCi6rOKbQHeJrsrdGUmWaC2PZ72dtJAQ3Ui85TYO0qjYc09G6Tpjza+J6/jtdJhhw
 YBkd1nPriAm6aI25pcUBZtIvuichUFs=
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-92-wyWm4UFvOCixmfRGZ5nYVg-1; Fri, 17 Jun 2022 12:05:23 -0400
X-MC-Unique: wyWm4UFvOCixmfRGZ5nYVg-1
Received: by mail-ua1-f69.google.com with SMTP id
 v19-20020ab05593000000b0037ed9894dfbso1510858uaa.19
 for <qemu-devel@nongnu.org>; Fri, 17 Jun 2022 09:05:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=n8IA4l644Ah5pQ8j0ESEqVvwKyKM01r4rQPrO91VLww=;
 b=J19hhrLvpwqEJo3vP69NhSKYiDxW3p65pMVAXKd/BF80WHT85TUCJMfITUbF9xmaRe
 3twPWYE97bybx1EZqRGmrq1YW/iaOmMYoekuiGtmT8zS4T9mS9PYjloAqwOPu2tXrfl9
 fq6FDXyZf/aXowWOSOBnomFOyl3+K6QG51FPCmAtPZw6+NdrDo6kWlQYG8BpzKJm4p11
 RSuPeSs4sGqsjfdfYZTGyLfcLT0mKvDqW7PLlboxyZLEFvlUAsRJU8p+963Ku10DUJo8
 LJ6CQt5jkIW41/b0dVhqzPDbysnATmRTZ+4T2BQUnZbyHJDxy4SRmcPV0wUAODVZZrr/
 7mzw==
X-Gm-Message-State: AJIora+vwAxgE9Wz5EwMlpR1vs8a8PdN9vJ5i3IKcHl3DnQKxIrnno2s
 ZP1KEiCycC221peWqAdf5h6mP0VvTDQQL0WeOJEnaRJ8E1QSguBMAOz4Awzu89PrEmxSMddjwqY
 JJ3imV12bAJKY+A9FsVYq4YSVNCc/0vg=
X-Received: by 2002:a05:6122:caa:b0:365:2e13:cdeb with SMTP id
 ba42-20020a0561220caa00b003652e13cdebmr5299604vkb.24.1655481923227; 
 Fri, 17 Jun 2022 09:05:23 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sWxuet1Mj1XEstbQbD2dyrefkBpQGeGWjmtRf9ef3z4KbUZ6WbcpGt+vULpaKEQESmB3ViAm/yTEQgyYlb3Sc=
X-Received: by 2002:a05:6122:caa:b0:365:2e13:cdeb with SMTP id
 ba42-20020a0561220caa00b003652e13cdebmr5299560vkb.24.1655481922941; Fri, 17
 Jun 2022 09:05:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220616142659.3184115-1-jsnow@redhat.com>
In-Reply-To: <20220616142659.3184115-1-jsnow@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Fri, 17 Jun 2022 12:05:12 -0400
Message-ID: <CAFn=p-a=ucX02HYjAjeDv9oGF_3FnQxyNOFfRpYHROr68sMhcA@mail.gmail.com>
Subject: Re: [PATCH v2 00/10] Improve reliability of VM tests
To: qemu-devel <qemu-devel@nongnu.org>
Cc: Beraldo Leal <bleal@redhat.com>, Qemu-block <qemu-block@nongnu.org>, 
 Hanna Reitz <hreitz@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Kevin Wolf <kwolf@redhat.com>, Daniel Berrange <berrange@redhat.com>, 
 Michael Roth <michael.roth@amd.com>, Thomas Huth <thuth@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 16, 2022 at 10:27 AM John Snow <jsnow@redhat.com> wrote:
>
> This patch series attempts to improve the reliability of several of the
> VM test targets. In particular, both CentOS 8 tests are non-functional
> because CentOS 8 was EOL at the beginning of this calendar year, with
> repositories and mirrors going offline.
>
> Notably, I also remove the ubuntu.i386 test because we no longer support
> Ubuntu 18.04 nor do we have explicit need of an i386 build test.
>
> After this series, I am able to successfully run every VM target on an
> x86_64 host, except:
>
> - ubuntu.aarch64: Hangs often during testing, see below.
> - centos.aarch64: Hangs often during testing, see below.

I've since gotten a clean run on centos.aarch64 for the first time in
a long time by upping the memory allocation to be 1G per job; so my 12
thread, 6 core intel laptop used 6GB to complete this test
successfully. With that not having a hard blocker on it anymore, I'll
work on upgrading the ubuntu container.

> - haiku.x86_64: Build failures not addressed by this series, see
>   https://lists.gnu.org/archive/html/qemu-devel/2022-06/msg02103.html
>
> The unit tests that I see fail most often are:
>
> - qom-test: ENOMEM with default config and many cores
> - test-hmp: ENOMEM with default config and many cores
> - virtio-net-failover: Seems to like to hang on openbsd
> - migration-test: Tends to hang under aarch64 tcg
>
> Increasing the default memory (patch 10) has seemingly helped both
> reliability *and* reduced race conditions quite a bit, both on my
> 12-thread intel laptop and on my 32-thread AMD 5950x desktop.
>
> Due to how long it takes to run these tests, though, I can't claim
> perfect reliability. The flakiness of virtio-net-failover and
> migration-test is something that probably still needs to be addressed,
> but it's outside of my expertise and time budget at present to pursue
> it.
>
> Future work (next version? next series?);
>
> - Try to get centos.aarch64 working reliably under TCG
> - Upgrade ubuntu.aarch64 to 20.04 after fixing centos.aarch64
> - Fix the Haiku build test, if possible.
> - Ensure I can reliably run and pass "make vm-build-all".
>   (Remove VMs from this recipe if necessary.)
>
> John Snow (10):
>   tests/qemu-iotests: hotfix for 307, 223 output
>   tests/qemu-iotests: skip 108 when FUSE is not loaded
>   qga: treat get-guest-fsinfo as "best effort"
>   tests/vm: use 'cp' instead of 'ln' for temporary vm images
>   tests/vm: switch CentOS 8 to CentOS 8 Stream
>   tests/vm: switch centos.aarch64 to CentOS 8 Stream
>   tests/vm: update sha256sum for ubuntu.aarch64
>   tests/vm: remove ubuntu.i386 VM test
>   tests/vm: remove duplicate 'centos' VM test
>   tests/vm: add 512MB extra memory per core
>
>  qga/commands-posix.c       |   8 +-
>  tests/qemu-iotests/108     |   5 ++
>  tests/qemu-iotests/223.out |   4 +-
>  tests/qemu-iotests/307.out |   4 +-
>  tests/vm/Makefile.include  |   5 +-
>  tests/vm/basevm.py         |   6 ++
>  tests/vm/centos            |   8 +-
>  tests/vm/centos.aarch64    | 174 +++++--------------------------------
>  tests/vm/ubuntu.aarch64    |   8 +-
>  tests/vm/ubuntu.i386       |  40 ---------
>  10 files changed, 58 insertions(+), 204 deletions(-)
>  delete mode 100755 tests/vm/ubuntu.i386
>
> --
> 2.34.3
>
>


