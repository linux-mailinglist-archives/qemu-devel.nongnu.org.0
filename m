Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B607743E3C6
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 16:31:52 +0200 (CEST)
Received: from localhost ([::1]:49158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mg6Rb-0005Ul-Jr
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 10:31:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mg6OP-0003kQ-Pv
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 10:28:33 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:42576)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mg6ON-0005Nd-S2
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 10:28:33 -0400
Received: by mail-ed1-x531.google.com with SMTP id w15so25749312edc.9
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 07:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ahJyQ0o7VPVxset9iOqDSqY0Bgm/wDs5Bp78QciNB8Q=;
 b=HVrpa27sw1i9Yhqd2UN2ypt4myNxokIdkuyPTJoTMknaVfT42E0jNJ0PElW3nNCuqw
 KmDzLIHw2L6Gis/LNkauNdNon5T2zl6ISVZunbNrnepqB2Phe3e7teqF/5mJNhbYIIDn
 ktP5p6SCFHRy4bWEsNhYLspioa7wwwUUKei7EWUEOPWmb2NznFa1sppjcGJCEgGkOluo
 l6inYk0xEIaQLb4+ULe2pZ5EjCSZ01FGLH0b/tyA+BpIYlRuevSXPo9qe1V5AJSyKXUl
 ONQ4Y63yXyJLRIXsuPX0XtZeSLhs7+zF6rMuTtqY+Ry3W///pVpi1+YyNe9hsMP/Vp5e
 jKLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=ahJyQ0o7VPVxset9iOqDSqY0Bgm/wDs5Bp78QciNB8Q=;
 b=3tX5bcwTfqHCB8Bx9WMSfM2VM9M4tuSjtC7rg3RWmZsdTPeSzXx7BbTvQ8g/8dZz2z
 eceeOZoDK6N4NVhdbARjjWkVnAgIZiu3nwGGDaO+LWKNcXGIBVs3w6bozZAA0o+SkJKW
 Bdmfq0aLtiIUG/rs6M4S0QSh13NxsUmAVT2tV7Q904G+OK5TPWDDZo2kEU9EewH1RR52
 PZ86ij9g1gEU10O/zACSSGJ7anUhhfzDkgnXe779nrKxZQEM4yzpKKXky6NdTcAVQJRk
 iiblS7S3EqoMptsg3AypybNP+LcttdpLppALUkm4Q9dsV1vlk+QawQUiETBNVFHoZ+pS
 Al+w==
X-Gm-Message-State: AOAM531tbgscRJr16qmmb6UcVUBO+xg+SKXmfetibjicwwo+RVumz7Su
 HNBbYPApj8nswGEfJjrX+LgwR0E2K44=
X-Google-Smtp-Source: ABdhPJx4M0UOG4v06rQDiOWWo4ddxWBayREuftQegRkK3JvnabQ9/VI/5PD9dnOGJkoi/ptzoMztMg==
X-Received: by 2002:a17:906:fa03:: with SMTP id
 lo3mr5807727ejb.210.1635431308744; 
 Thu, 28 Oct 2021 07:28:28 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id q23sm1517201ejr.0.2021.10.28.07.28.27
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 07:28:28 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] Replace custom test harness with "meson test"
Date: Thu, 28 Oct 2021 16:28:24 +0200
Message-Id: <20211028142826.57327-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x531.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi all,

Starting with Meson 0.57, "meson test" has all features of QEMU's
makefile-based harness and more.  In particular, some features that
were added to reach feature parity are:

* print reproducer command line for each failed test right below the test

* keep the output of multiple (non-TAP) tests together in verbose mode,
  similar to "make --output-sync target"

* report on TAP subtests as they are encountered

It also includes nicer handling of test interruption, logging of the run
in the meson-logs/ subdirectory, and a progress report/spinner.  For
these reasons it would be nice to adopt it and remove the Perl scripts
that we have to present TAP output nicely.  It is also possible to
change qemu-iotests to TAP and describe it in tests/qemu-iotests/meson.build,
but this is left for later.

For people using "make check" there should be little or no change.
Otherwise:

* if you want to try "meson test", note that there could be timeouts on
  slower systems (and in particular OpenBSD is insanely slow on some
  tests).  Also if you use "meson test", note that CTRL+C will only
  interrupt the longest running test.  Pressing CTRL+C repeatedly three
  times (which you would likely do anyway, that's how humans work)
  interrupts the whole run.  This behavior does not apply to "make check".

* If you were using make check-report.tap and similar, they are replaced
  by targets like make check-report.junit.xml.  This is because Gitlab
  is able to parse the resulting XML and include on the website a report
  of which tests failed.

An example of non-verbose "make check" output is available at
https://gitlab.com/bonzini/qemu/-/jobs/1680980620.  A verbose run
instead is like https://asciinema.org/a/e5irnEszSnAheOHM30exbo3F6
(does not include check-block).

Paolo

RFC->v1:
- include submodule bump to 0.59.3
- do not include check-block part

Paolo Bonzini (2):
  meson: bump submodule to 0.59.3
  build: use "meson test" as the test harness

 Makefile                      |   3 +-
 configure                     |   2 +-
 meson                         |   2 +-
 meson.build                   |   5 +-
 scripts/meson-buildoptions.py |  16 --
 scripts/mtest2make.py         | 104 ++++--------
 scripts/tap-driver.pl         | 379 ------------------------------------------
 scripts/tap-merge.pl          | 111 -------------
 tests/fp/meson.build          |   2 +-
 9 files changed, 43 insertions(+), 581 deletions(-)
-- 
2.31.1


