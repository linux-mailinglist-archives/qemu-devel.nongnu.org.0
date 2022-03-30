Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16BBB4ECE48
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 22:57:01 +0200 (CEST)
Received: from localhost ([::1]:42872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZfND-0000Ab-Kj
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 16:56:59 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nZfLJ-0007kV-JQ
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 16:55:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28231)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nZfLH-0001km-Ix
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 16:55:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648673698;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=G0lLczksD2/gAdGHDRsidRXlfR5Tpoeybra9V6iSLXs=;
 b=WEHfXh59KD2+d/ZtNDkwlOrLhmzwRhTquc3p7rMRHrIBo+w+bZdg9e5zQlKm9O60cd7NLY
 Tv61XmKCeaQ9sWOkMuCzYhcIcl/0YEvC9ILn6ZDQZqSTbRenKORSTZoYaMg29X5OJ9d+P5
 Q6Xr/k1NHJH9wmILGfM7ydDuktrYX7E=
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com
 [209.85.221.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-632-sPdrbu-oM_qT1PfDAXbTDw-1; Wed, 30 Mar 2022 16:54:56 -0400
X-MC-Unique: sPdrbu-oM_qT1PfDAXbTDw-1
Received: by mail-vk1-f197.google.com with SMTP id
 x6-20020a056122118600b00343a31c38e1so288007vkn.11
 for <qemu-devel@nongnu.org>; Wed, 30 Mar 2022 13:54:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=G0lLczksD2/gAdGHDRsidRXlfR5Tpoeybra9V6iSLXs=;
 b=M5k4KZnzbX6R9w4ildORMmipa2Ax8aMmuFYcbqE1RCf+5Ji70GOPnlaQZTM6AGcbiS
 aWsQXwGLfWyfHV6Jbzz3qhHIy8VpiCaRCeKCjf5SZkRGpmg+HwRAY6SL/eUmx7QqfBQe
 G2tBZoPQzxveefotLKPQId7NqEpI8b97x0V6dG9wBdAdljiyRkGUIwOys91w5n5dNR4e
 BfcaWHzBQ4DQrZWZyxISb2YeM09FART3T+gWExYqhMT8NVKhcJHUglJ1frec8+nCNx+J
 eKLCtZUik6yVs/PqLcSu9Fp/GIvmO4fuh0Vbgue0R73s1IPiPqTMp73RAzf6C6drutjO
 zRwA==
X-Gm-Message-State: AOAM533ZrpOw/5vbOH8WueULLENYWCoFIXzRGbwX7WYv+ww3sqDXjMyY
 k6ihLKiEO72XsWKuMMezgCOqHEUZET1sre4QbLNZ6/iy09sA3L/DYqawaF2UJSj+X0iEWTXNhHV
 wCnNgulqiTHQ1tR07ajRJ5A0Vdwp9fWA=
X-Received: by 2002:a05:6102:c91:b0:325:e47d:bab2 with SMTP id
 f17-20020a0561020c9100b00325e47dbab2mr560241vst.35.1648673695725; 
 Wed, 30 Mar 2022 13:54:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzxjqZd6Bu2rscOfzfnNI6AN2640aPyzjCGm2/FKtkI0ziF3U8GC5AjgjDfGpcCvQO6Qte94F5Ii/Cyq4aXBfQ=
X-Received: by 2002:a05:6102:c91:b0:325:e47d:bab2 with SMTP id
 f17-20020a0561020c9100b00325e47dbab2mr560226vst.35.1648673695470; Wed, 30 Mar
 2022 13:54:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220330172812.3427355-1-jsnow@redhat.com>
In-Reply-To: <20220330172812.3427355-1-jsnow@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Wed, 30 Mar 2022 16:54:44 -0400
Message-ID: <CAFn=p-bg_MVUK9pSC7zvUf+RebMoH9J7-O1KYWwk05miv4n6mg@mail.gmail.com>
Subject: Re: [PATCH v2 0/9] Python: Remove synchronous QMP library
To: qemu-devel <qemu-devel@nongnu.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 Beraldo Leal <bleal@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 30, 2022 at 1:28 PM John Snow <jsnow@redhat.com> wrote:
>
> Based-on: https://gitlab.com/jsnow/qemu/-/tree/python/
> GitLab: https://gitlab.com/jsnow/qemu/-/tree/python-qmp-legacy-switch-pt1c
> CI: https://gitlab.com/jsnow/qemu/-/pipelines/505169095
>
> Hi, this series is part of an effort to publish the qemu.qmp package on
> PyPI. It is the first of three series to complete this work:
>
> --> (1) Switch the new async QMP library in as python/qemu/qmp
>     (2) Fork python/qemu/qmp out into its own repository,
>         with updated GitLab CI/CD targets to build packages.
>     (3) Update qemu.git to install qemu.qmp from PyPI,
>         and then delete python/qemu/qmp.
>
> This series finalizes swapping out the old QMP library for the new
> one. This leaves us with just one QMP library to worry about. It also
> implements the rename of "qemu.aqmp" to "qemu.qmp".
>
> This is the last patch series before I perform the actual fork.
>
> These patches are (mostly) reviewed, so I'll likely stage these fairly
> quickly barring any objections. The plan is to submit them as soon as
> the tree re-opens to help prevent rot while I work on the fork.
>
> John Snow (9):
>   python: temporarily silence pylint duplicate-code warnings
>   python/aqmp: take QMPBadPortError and parse_address from qemu.qmp
>   python/aqmp: fully separate from qmp.QEMUMonitorProtocol
>   python/aqmp: copy qmp docstrings to qemu.aqmp.legacy
>   python: remove the old QMP package
>   python: re-enable pylint duplicate-code warnings
>   python: rename qemu.aqmp to qemu.qmp
>   python: rename 'aqmp-tui' to 'qmp-tui'
>   python/qmp: remove pylint workaround from legacy.py
>
>  python/README.rst                             |   2 +-
>  python/qemu/qmp/README.rst                    |   9 -
>  python/qemu/aqmp/__init__.py                  |  59 ---
>  python/qemu/aqmp/legacy.py                    | 188 --------
>  python/qemu/aqmp/py.typed                     |   0
>  python/qemu/machine/machine.py                |   4 +-
>  python/qemu/machine/qtest.py                  |   2 +-
>  python/qemu/qmp/__init__.py                   | 445 ++----------------
>  python/qemu/{aqmp => qmp}/error.py            |   0
>  python/qemu/{aqmp => qmp}/events.py           |   2 +-
>  python/qemu/qmp/legacy.py                     | 315 +++++++++++++
>  python/qemu/{aqmp => qmp}/message.py          |   0
>  python/qemu/{aqmp => qmp}/models.py           |   0
>  python/qemu/{aqmp => qmp}/protocol.py         |   4 +-
>  python/qemu/{aqmp => qmp}/qmp_client.py       |  16 +-
>  python/qemu/{aqmp => qmp}/qmp_shell.py        |   4 +-
>  .../qemu/{aqmp/aqmp_tui.py => qmp/qmp_tui.py} |  15 +-
>  python/qemu/{aqmp => qmp}/util.py             |   0
>  python/qemu/utils/qemu_ga_client.py           |   4 +-
>  python/qemu/utils/qom.py                      |   2 +-
>  python/qemu/utils/qom_common.py               |   4 +-
>  python/qemu/utils/qom_fuse.py                 |   2 +-
>  python/setup.cfg                              |  11 +-
>  python/tests/protocol.py                      |  14 +-
>  scripts/cpu-x86-uarch-abi.py                  |   2 +-
>  scripts/device-crash-test                     |   4 +-
>  scripts/qmp/qmp-shell                         |   2 +-
>  scripts/qmp/qmp-shell-wrap                    |   2 +-
>  scripts/render_block_graph.py                 |   4 +-
>  scripts/simplebench/bench_block_job.py        |   2 +-
>  tests/qemu-iotests/iotests.py                 |   2 +-
>  tests/qemu-iotests/tests/mirror-top-perms     |   4 +-
>  32 files changed, 409 insertions(+), 715 deletions(-)
>  delete mode 100644 python/qemu/qmp/README.rst
>  delete mode 100644 python/qemu/aqmp/__init__.py
>  delete mode 100644 python/qemu/aqmp/legacy.py
>  delete mode 100644 python/qemu/aqmp/py.typed
>  rename python/qemu/{aqmp => qmp}/error.py (100%)
>  rename python/qemu/{aqmp => qmp}/events.py (99%)
>  create mode 100644 python/qemu/qmp/legacy.py
>  rename python/qemu/{aqmp => qmp}/message.py (100%)
>  rename python/qemu/{aqmp => qmp}/models.py (100%)
>  rename python/qemu/{aqmp => qmp}/protocol.py (99%)
>  rename python/qemu/{aqmp => qmp}/qmp_client.py (97%)
>  rename python/qemu/{aqmp => qmp}/qmp_shell.py (99%)
>  rename python/qemu/{aqmp/aqmp_tui.py => qmp/qmp_tui.py} (98%)
>  rename python/qemu/{aqmp => qmp}/util.py (100%)
>
> --
> 2.34.1
>

Thanks, I've tentatively queued this on my Python branch. It won't be
going out until the tree opens again, so there's some time yet to
lodge a formal complaint. O:-)

--js


