Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3842252DAD5
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 19:09:08 +0200 (CEST)
Received: from localhost ([::1]:54846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrje6-0005X8-Nb
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 13:09:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1nrjat-0004MR-BX
 for qemu-devel@nongnu.org; Thu, 19 May 2022 13:05:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37611)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1nrjaq-0004z4-HB
 for qemu-devel@nongnu.org; Thu, 19 May 2022 13:05:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652979943;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=js/cUE92OW1J9nmLaX35578BLxYQlNs4jRj/O/CGgfw=;
 b=fEPgnDD/2uKoH09uBY1MIUOtiU9czT+yJWJEi68ioYkFGORbijOyijeWAvU8NxNyC6aKry
 hM84L5DK5sCoTFvef/OiHrkJ8ZA74Y3E8g4/XEByI80iXMriz/LLxVoYb6hXdtQygqQmD9
 VCNMZnSRr8ZL+IncKHBkZ00hXgWJfjw=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-215-tKOuNu8aN5CzF3YBnmApVQ-1; Thu, 19 May 2022 13:05:42 -0400
X-MC-Unique: tKOuNu8aN5CzF3YBnmApVQ-1
Received: by mail-yw1-f199.google.com with SMTP id
 00721157ae682-2ff3eeb2dfbso50330457b3.4
 for <qemu-devel@nongnu.org>; Thu, 19 May 2022 10:05:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=js/cUE92OW1J9nmLaX35578BLxYQlNs4jRj/O/CGgfw=;
 b=kZhOWQu53l/scPWcmD9QMIsenc0UCWVmMbjM5wDjDilmwgHCk9sdqw6BxgYSVCvwDI
 fYl4UKdmvk9CIqmGO8ACk/AevvwKffdak73s4cF47D9tJcdXQEJ39T3naBIPTqMc/j5D
 EF8o5/gpOuVkpMBl9FKzTjMGiBDsAvEFQKudiQXPmD2flhdO+ZJuyjjuid2dScd4vIvB
 n0dtt0CQkayquUodWTwJ/z9lllZJyH3dvkeDNgfNrSJYy342YAvN1j+P3KMAr3CyYFBu
 lXN3bLddROJKF+lluzah7YSCS5VwqEsqRCO7qezEHhm2kRty9q5oNubtAJhpK9ei3WGt
 IvAw==
X-Gm-Message-State: AOAM532t+h1yoMEbNYWhl7p40Q3ptd0j0kKxQzKa+ayY/Yr/TMnx8hhX
 evwwHonZ/CXbE2rleNzsjqHF0ER8dGpUqDR/FqVhB5WsF3KW1r3CvOoy0ZP1je2KQVcUbSQuPCl
 w9uf53KJzcpmFqyeOeFVq9daaNkk4bLg=
X-Received: by 2002:a0d:cdc6:0:b0:2f1:47b9:ce93 with SMTP id
 p189-20020a0dcdc6000000b002f147b9ce93mr5625099ywd.445.1652979941508; 
 Thu, 19 May 2022 10:05:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwDkuAcDqTVwhORxfDLaI07QCbztM2IO/68W1Xb0Fy9nVkCxBOE2aE0zo/wOu9NfLDYSsLRR0Epq7beQsxC+Jo=
X-Received: by 2002:a0d:cdc6:0:b0:2f1:47b9:ce93 with SMTP id
 p189-20020a0dcdc6000000b002f147b9ce93mr5625082ywd.445.1652979941327; Thu, 19
 May 2022 10:05:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220513180821.905149-1-marcandre.lureau@redhat.com>
In-Reply-To: <20220513180821.905149-1-marcandre.lureau@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Thu, 19 May 2022 19:05:30 +0200
Message-ID: <CAMxuvaw4_Evg8LFihv7UjC5_hY05uhaRFCi=bH=uP4e8G1BggQ@mail.gmail.com>
Subject: Re: [PATCH v3 00/15] Misc cleanups
To: qemu-devel <qemu-devel@nongnu.org>
Cc: Konstantin Kostiuk <kkostiuk@redhat.com>,
 Michael Roth <michael.roth@amd.com>, 
 Markus Armbruster <armbru@redhat.com>, "Bonzini, Paolo" <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mlureau@redhat.com;
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

Hi

Before I send a v4 and hopefully final version, could somebody review
those patches:

- include: move qemu_*_exec_dir() to cutils
- osdep: export qemu_open_cloexec()

- qga: replace qemu_open_old() with qemu_open_cloexec()
- test/qga: use G_TEST_DIR to locate os-release test file

(Paolo sortof acked the v1, but not quite rigorously)

thanks!

On Fri, May 13, 2022 at 8:08 PM <marcandre.lureau@redhat.com> wrote:
>
> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> Hi,
>
> v3:
> - changed error_report_err() back to g_critical()
> - added "qga: make build_fs_mount_list() return a bool"
> - replaced g_clear_pointer() usage by open-coded version
> - dropped needless g_autoptr(GError) in tests
> - rebased, (dropped "include: adjust header guards after renaming")
> - some commit message rewording
> - added r-b tags
>
> v2:
> - drop "compiler.h: add QEMU_{BEGIN,END}_IGNORE_INITIALIZER_OVERRIDES",
>   "qobject/json-lexer: disable -Winitializer-overrides warnings" &
>   "qapi/error: add g_autoptr(Error) support" and adjust related code.
> - add "test/qga: use g_auto wherever sensible"
> - add r-b tags
>
> Marc-Andr=C3=A9 Lureau (15):
>   include: move qemu_*_exec_dir() to cutils
>   util/win32: simplify qemu_get_local_state_dir()
>   tests: make libqmp buildable for win32
>   qga: flatten safe_open_or_create()
>   osdep: export qemu_open_cloexec()
>   qga: use qemu_open_cloexec() for safe_open_or_create()
>   qga: throw an Error in ga_channel_open()
>   qga: replace qemu_open_old() with qemu_open_cloexec()
>   qga: make build_fs_mount_list() return a bool
>   test/qga: use G_TEST_DIR to locate os-release test file
>   qga/wixl: prefer variables over environment
>   qga/wixl: require Mingw_bin
>   qga/wixl: simplify some pre-processing
>   qga/wixl: replace QEMU_GA_MSI_MINGW_BIN_PATH with glib bindir
>   test/qga: use g_auto wherever sensible
>
>  configure                            |   9 +-
>  include/qemu/cutils.h                |   7 ++
>  include/qemu/osdep.h                 |   9 +-
>  meson.build                          |   5 +-
>  qemu-io.c                            |   1 +
>  qga/channel-posix.c                  |  55 +++++----
>  qga/commands-posix.c                 | 164 +++++++++++++--------------
>  qga/installer/qemu-ga.wxs            |  83 +++++---------
>  qga/meson.build                      |  11 +-
>  storage-daemon/qemu-storage-daemon.c |   1 +
>  tests/qtest/fuzz/fuzz.c              |   1 +
>  tests/qtest/libqmp.c                 |  34 +++++-
>  tests/qtest/libqmp.h                 |   2 +
>  tests/unit/test-qga.c                | 130 ++++++++-------------
>  util/cutils.c                        | 108 ++++++++++++++++++
>  util/osdep.c                         |  10 +-
>  util/oslib-posix.c                   |  81 -------------
>  util/oslib-win32.c                   |  53 +--------
>  18 files changed, 358 insertions(+), 406 deletions(-)
>
> --
> 2.36.1
>


