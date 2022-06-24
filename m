Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1004F559D45
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 17:28:18 +0200 (CEST)
Received: from localhost ([::1]:37980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4lEG-0004ng-Rw
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 11:28:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1o4lCU-0001Qm-7n
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 11:26:26 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:38679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1o4lCS-0006ar-Bo
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 11:26:25 -0400
Received: by mail-ed1-x533.google.com with SMTP id fd6so3969490edb.5
 for <qemu-devel@nongnu.org>; Fri, 24 Jun 2022 08:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=PLrEm/Z4fQRtoIfLmcAxX7Ao8rHjLYyrYlBVJeu/kWs=;
 b=hLekJZH1M+Hb8lzBKwToo4yT1aG+NkoZHESTwEyCmubh31jFMgH1E8RfUjBD0sKoUz
 7pisrfMgOf/2hF5mFwtyFqxpqpLBY4eF3ax6dZf2avoZZ1zEoV0wGSkUoWNg8Y0gKuAI
 653M0+lhXlKk8PApo+3/s/fSb3M6Ng4brG8F0udP+aoZQ/guAO0JkCZmazxWYx/7Da0j
 4sE7rqVRUlC7LIK/j4IemTHtYAsbY1ryjyBN7Vn7dpQT6B+TO98VNLccvL/0mOlUfaHi
 bQf0EWDiXbS7BL/8/Z62SOK0kThBqv1BfiCr1jbuwQ6dQpQwF/rtKXILPUeoOO44cJJy
 3TwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=PLrEm/Z4fQRtoIfLmcAxX7Ao8rHjLYyrYlBVJeu/kWs=;
 b=5alzzWzRlloQUTaesP1yrjBrou6w2w7AfnFMTXdDrQcU+6NvdgvonjX7WetKSrHHRu
 nB0cdeZz7NX/ephxaqHG16g1+IXaLbBUy3pJoBEnNO2h2YNVKI3pn4AwwIrAZy0ArYwS
 Urqe1/I49lnGsJEm7yb8b9lQHBL0b/ylu1ysLIpYPrt76oPMev8Mu/HCWEQXOqvTT5GU
 3MoekrUA7Kq4vdG7/ByST7uG6EN+qr2XZJMpw4NTcd8Uq4mUilZS9n8mNsAsbFXQnfZN
 eztQ1k4H61FII1kasc7GvbSzsCX8/ceG0lZGEivnRB4vdNAf/2nWgsqdOUlIuFqZcqw/
 UWAw==
X-Gm-Message-State: AJIora9uDXNjnc0hG/U0Zcp2zzMVc4s1E0YV8MwPEXwTEUpwpdZmcyYt
 sk8o0nym+QyE74vskXug1lOW/85SVGw=
X-Google-Smtp-Source: AGRyM1uM0eTlQl40EDw5K9bN+Ch8eN43VI0h9iwnZTJ3Am2Jn3IJpdsEsj5Mjkj9m3tgcvJRRc3Vrg==
X-Received: by 2002:a05:6402:42cb:b0:435:8c3b:faf8 with SMTP id
 i11-20020a05640242cb00b004358c3bfaf8mr18451232edc.300.1656084377072; 
 Fri, 24 Jun 2022 08:26:17 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 da26-20020a056402177a00b004359a690905sm2284402edb.78.2022.06.24.08.26.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Jun 2022 08:26:16 -0700 (PDT)
Message-ID: <cc7f1005-fe08-320e-0108-8585760de7b5@redhat.com>
Date: Fri, 24 Jun 2022 17:26:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v8 0/4] cutils: Introduce bundle mechanism
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
References: <20220624145039.49929-1-akihiko.odaki@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220624145039.49929-1-akihiko.odaki@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x533.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On 6/24/22 16:50, Akihiko Odaki wrote:
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

Thanks, this looks good.  Even though technically it adds more lines 
than it removes (thanks Windows...), it replaces lots of special cases 
with a single general mechanism, which is nice and future proof.

The only change I'd make (which I can do when queueing the patch) is to 
change the directory name to something "strange" like "=install", so 
that it's unlikely to have a directory named like that in the $bindir.

Any opinions?

Paolo

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
>   meson.build                     |  4 ++
>   pc-bios/keymaps/meson.build     | 21 +++-------
>   pc-bios/meson.build             | 13 ++-----
>   scripts/oss-fuzz/build.sh       |  2 +-
>   scripts/symlink-install-tree.py | 37 ++++++++++++++++++
>   softmmu/datadir.c               | 22 +----------
>   tests/qtest/fuzz/fuzz.c         | 15 --------
>   tests/vm/fedora                 |  1 -
>   tests/vm/freebsd                |  1 -
>   tests/vm/netbsd                 |  1 -
>   tests/vm/openbsd                |  1 -
>   util/cutils.c                   | 68 +++++++++++++++++++++++----------
>   util/meson.build                |  1 +
>   util/module.c                   |  1 -
>   17 files changed, 117 insertions(+), 93 deletions(-)
>   create mode 100755 scripts/symlink-install-tree.py
> 


