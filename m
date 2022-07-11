Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B626C570769
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jul 2022 17:46:32 +0200 (CEST)
Received: from localhost ([::1]:41794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oAvcF-0003vr-GX
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 11:46:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1oAvYI-0000Jn-U2
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 11:42:26 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:35437)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1oAvYF-00041f-SD
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 11:42:26 -0400
Received: by mail-ed1-x52a.google.com with SMTP id e15so6775737edj.2
 for <qemu-devel@nongnu.org>; Mon, 11 Jul 2022 08:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=rqYTBoGlZh75DHmY2CztN2Yk7lDgAO1ty4HyBl4dBiU=;
 b=NUA9spa5BzyiA3QhJFUAZbLjv3hJTseKg5w9Grp6jVMabPPpYyddOhcV576Knq1SN2
 qxGnxrYLl8uVqcFAbU3QEu5IA+QG/vpkX8J3dO2xQ3XQ8i4MhP5GQMe7mNSgaxHOXSSL
 A3NgKt6wVG3YWSI7f074rrncmptDwV12KxCSxY/xeyesQf4jLVJQJ9xAvT8cDup8ddFR
 cPq2uGk1snzGB+sqcNXEUi53J2DRyEUoN9PAgEaU/sGmqe8Fsqyd+8AJ9qNy3DO/nL9z
 VmmqqGf98z4PZUKrNX8FWkQcbHZL5D9jnr4x/TBmTu2/kNKSG3mSYBnlatm4baNi1Suu
 guhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=rqYTBoGlZh75DHmY2CztN2Yk7lDgAO1ty4HyBl4dBiU=;
 b=H9OVfjkEmqQrWv60dv0p3BNDr0nD5Djpjd/8X1y/1vXMtQw3WPZbnsFx+UBjlHwmzF
 60l76zq2d5fuWsatJKJ1syrKo5Ve1wgEG2utWG2M305lvWHhOC72YRoTNw7g2IzPjgo6
 XaWrCY5Q3naR6URJzwDlQVpSwS/U0VIjV9vdFOulv8YfYJkVjhEb+k5SMLo3RJBBlj6v
 Ngo7gVVr8Cd0v5Uv+ZajexZmuyXgzeil3s8iq3cFa4Fdkl+1tyYr4g/dsH1R9ovyzz5f
 c4r7KGkjJctLs/JnKMsNv+Zr8KFZ3xv1r6gwa0mmcDy9LyAFf+HOuvBqx/L45mWZE7cb
 7ceg==
X-Gm-Message-State: AJIora+iA0Y9qC7JbUFduPtaj1tjxYUPPmb79wLyg88NCq7N8aXGXEYc
 iO0eJTv5OWlfHUs+w1ES6gs=
X-Google-Smtp-Source: AGRyM1sO+vhV0Vp8o1DnYHJ4xTIbNv6MvJr5fAF/dEF2SDLM+WtO2vAfbiMOwU6KKGycf1Za+hKXQw==
X-Received: by 2002:a05:6402:3707:b0:437:61f9:57a9 with SMTP id
 ek7-20020a056402370700b0043761f957a9mr25361162edb.1.1657554141532; 
 Mon, 11 Jul 2022 08:42:21 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 y26-20020a056402135a00b00435a742e350sm4545708edw.75.2022.07.11.08.42.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jul 2022 08:42:20 -0700 (PDT)
Message-ID: <55b05cb0-edb8-0911-777a-fe6a19fb4549@redhat.com>
Date: Mon, 11 Jul 2022 17:42:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v10 0/4] cutils: Introduce bundle mechanism
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang
 <jasowang@redhat.com>, qemu-devel@nongnu.org,
 Programmingkid <programmingkidx@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>, =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Thomas Huth <thuth@redhat.com>,
 John Snow <jsnow@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Stefan Weil <sw@weilnetz.de>
References: <20220627035744.23218-1-akihiko.odaki@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220627035744.23218-1-akihiko.odaki@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 WEIRD_QUOTING=0.001 autolearn=no autolearn_force=no
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

On 6/27/22 05:57, Akihiko Odaki wrote:
> Developers often run QEMU without installing. The bundle mechanism
> allows to look up files which should be present in installation even in
> such a situation.
> 
> It is a general mechanism and can find any files located relative
> to the installation tree. The build tree must have a new directory,
> qemu-bundle, to represent what files the installation tree would
> have for reference by the executables.
> 
> Note that this abandons compatibility with Windows older than 8 to use
> PathCchSkipRoot(). The extended support for the prior version, 7 ended
> more than 2 years ago, and it is unlikely that anyone would like to run
> the latest QEMU on such an old system.

Thanks, merged.

However there were a couple issues:

- the bashism in patch 4, replaced by

+meson_option_build_array() {
+  printf '['
+  (if test "$targetos" == windows; then
+    IFS=\;
+  else
+    IFS=:
+  fi
+  for e in $1; do
+    e=${e/'\'/'\\'}
+    e=${e/\"/'\"'}
+    printf '"""%s""",' "$e"
+  done)
+  printf ']\n'
+}
+

- oss-fuzz didn't work, it has a syntax error and also can be simplified 
to use qemu-bundle as well, like

-# Copy over the datadir
-cp  -r ../pc-bios/ "$DEST_DIR/pc-bios"
+# Prepare a preinstalled tree
+make install DESTDIR=$DEST_DIR/qemu-bundle


Paolo
> v10:
> * Update destdir_join() in scripts/symlink-install-tree.py with the
>    latest implementation from Meson:
>    https://github.com/mesonbuild/meson/pull/10531
> 
> v9:
> * Update _WIN32_WINNT in include/qemu/osdep.h (Thomas Huth)
> 
> v8:
> * Pass absolute paths to get_relocated_path() (Paolo Bonzini)
> * Use meson introspection (Paolo Bonzini)
> * Drop "qga: Relocate a path emitted in the help text" as it is no longer
>    relevant for the bundle mechanism.
> 
> v7: Properly fix --firmwarepath (Daniel P. Berrangé)
> 
> v6: Reuse get_relocated_path() in find_bundle() (Paolo Bonzini)
> 
> v5:
> * Prefer qemu-bundle if it exists. (Daniel P. Berrangé)
> * Check install_blobs option before installing BIOSes (Paolo Bonzini)
> * Add common code to set up qemu-bundle to the top level meson.build
>    (Paolo Bonzini)
> 
> v4:
> * Add Daniel P. Berrangé to CC. Hopefully this helps merging his patch:
>    https://mail.gnu.org/archive/html/qemu-devel/2022-06/msg02276.html
> * Rebased to the latest QEMU.
> 
> v3:
> * Note that the bundle mechanism is for any files located relative to the
>    installation tree including but not limited to datadir. (Peter Maydell)
> * Fix "bridge" typo (Philippe Mathieu-Daudé)
> 
> v2: Rebased to the latest QEMU.
> 
> Akihiko Odaki (3):
>    cutils: Introduce bundle mechanism
>    datadir: Use bundle mechanism
>    module: Use bundle mechanism
> 
> Paolo Bonzini (1):
>    tests/vm: do not specify -bios option
> 
>   .travis.yml                     |  2 +-
>   docs/about/build-platforms.rst  |  2 +-
>   include/qemu/cutils.h           | 18 +++++++--
>   include/qemu/osdep.h            |  2 +-
>   meson.build                     |  4 ++
>   pc-bios/keymaps/meson.build     | 21 +++-------
>   pc-bios/meson.build             | 13 ++-----
>   scripts/oss-fuzz/build.sh       |  2 +-
>   scripts/symlink-install-tree.py | 34 +++++++++++++++++
>   softmmu/datadir.c               | 22 +----------
>   tests/qtest/fuzz/fuzz.c         | 15 --------
>   tests/vm/fedora                 |  1 -
>   tests/vm/freebsd                |  1 -
>   tests/vm/netbsd                 |  1 -
>   tests/vm/openbsd                |  1 -
>   util/cutils.c                   | 68 +++++++++++++++++++++++----------
>   util/meson.build                |  1 +
>   util/module.c                   |  1 -
>   18 files changed, 115 insertions(+), 94 deletions(-)
>   create mode 100755 scripts/symlink-install-tree.py
> 


