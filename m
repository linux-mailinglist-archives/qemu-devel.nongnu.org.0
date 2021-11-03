Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F2A443DF4
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 09:03:06 +0100 (CET)
Received: from localhost ([::1]:40356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miBEf-00050f-8m
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 04:03:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1miBDe-0004JA-On
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 04:02:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1miBDd-0003SC-3u
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 04:02:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635926518;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2lPO8HWlsFAnBlUqLxTWdRlD4DXnFfgaEdCImwJVoeo=;
 b=glmS/0rKO8X4R2YK9XxfAp43qvhPjiN+6GvlGMf0vAJNrLsnvi1PsjOJJlNwQoAPtFBT7W
 ELFORNGyPS7S/snOQCoOMhvv6zyDx1XGMgLXXyG4Ui79bYtgxNeJmfiltK4Zff0XVYOzTZ
 l8Fl7tO2bToqcZsy8VWt9uegu+CkYzA=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-351-KXiN9rDCNBy1ap_errZ6nw-1; Wed, 03 Nov 2021 04:01:57 -0400
X-MC-Unique: KXiN9rDCNBy1ap_errZ6nw-1
Received: by mail-pf1-f199.google.com with SMTP id
 a127-20020a627f85000000b0047feae4a8d9so905765pfd.19
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 01:01:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=2lPO8HWlsFAnBlUqLxTWdRlD4DXnFfgaEdCImwJVoeo=;
 b=kHoSSjItKfdL9cYGiLxgx69GHFmes6NJ/YBHUWjzdgeA5jX72NFZvNrVhgGg1HcTn+
 cw8Idp+N2A5lT1dDZLtbyFSgPOi+IMnavKm6oJ5UqNTJpeiz+oygt6GQb60XAM/TB2ih
 BuJGCUrxhC3keStz8ulNTtXwjEBrRCtTRy8tu7C/y9rTyG6CesSma/tdKp5dSS8W9Aof
 X20iA+qy2m1iI1ft+vLE0Jx5Iz3cqJM7NqXDTZ2HINvAk8piM4hKwG45z+LU/Ju4+jFF
 hZGbp3jlowJuzPqhDsdfxHaR1MRHZetn3xaUAEIbAAvywR7EHn+cqODABE0m6Rz3kh+8
 pj6g==
X-Gm-Message-State: AOAM531RX3SH2wmmPIg7yZc4LHaVGA/5GD+jPoHDMjYVr7m/01uUyZef
 jlVdkGfu7+j/N3dSwIMq99K6Yugbm5wKzoVC6CVIPEUiSgkwCyUp9zZN+jqFVo+2qs1wX0DJ9sT
 6lEqnMxJxewAqL1fzLbfIFZNP4RSLYj0=
X-Received: by 2002:a05:6a00:13aa:b0:481:22b8:ba7a with SMTP id
 t42-20020a056a0013aa00b0048122b8ba7amr11197432pfg.28.1635926516142; 
 Wed, 03 Nov 2021 01:01:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyr1nUxyRdPLQbcWqgoUqu9sea2Mhc9/8KAgxVkAAQhHMYFV9I4rqYVQYe8RbAo0F3f3HTwgi4ehjnMfs5XAZo=
X-Received: by 2002:a05:6a00:13aa:b0:481:22b8:ba7a with SMTP id
 t42-20020a056a0013aa00b0048122b8ba7amr11197395pfg.28.1635926515744; Wed, 03
 Nov 2021 01:01:55 -0700 (PDT)
MIME-Version: 1.0
References: <CAFEAcA9ha4G=AC3p9LKJRC87DkgHVqbrX3X8RPg7vVR_F1Kt1Q@mail.gmail.com>
In-Reply-To: <CAFEAcA9ha4G=AC3p9LKJRC87DkgHVqbrX3X8RPg7vVR_F1Kt1Q@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 3 Nov 2021 09:01:44 +0100
Message-ID: <CABgObfaXJZ1E5593HHMEyhXHVKNu85=KSOhg7VXbt93cKA8fvg@mail.gmail.com>
Subject: Re: more bogus meson warnings
To: Peter Maydell <peter.maydell@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Nov 2, 2021 at 2:38 PM Peter Maydell <peter.maydell@linaro.org> wro=
te:
> I tried my static-system build config today; meson bogus
> complaints include:
>
> WARNING: Static library 'pulse' not found for dependency 'libpulse',
> may not be statically linked
> WARNING: Static library 'pulsecommon-11.1' not found for dependency
> 'libpulse', may not be statically linked
> WARNING: Static library 'asound' not found for dependency 'alsa', may
> not be statically linked
> WARNING: Static library 'spice-server' not found for dependency
> 'spice-server', may not be statically linked
> WARNING: Static library 'cacard' not found for dependency 'libcacard',
> may not be statically linked
>
> We asked for static linking, this should result in
> "OK, no static library present, ignore optional feature",
> not "decide we found the library and emit a warning message".

I think I explained this already, but what happens is that:

1) Meson retrieves the flags from pkg-config. It sanity checks the -l
flags, and cannot find the library. It prints a warning because maybe
it's looking in the wrong places, the path to the library might be
provided by --extra-ldflags or another place that is not in gcc
--print-search-dirs.

2) Therefore the root cause is that a .pc file is present but not
suitable for static linking. With the test in configure, the problem
would still be there, except it would not be detected and would just
break at the time of the final link.

So, in general, you _already_ have an improvement over what was there befor=
e.

For the specific case of Spice, you didn't need a separate
--disable-spice argument because Spice did have a "compile a test
program" step in configure, unlike basically every other $pkg_config
invocation. Marc-Andr=C3=A9 didn't bring it over to Meson, and that was
fine with me because (IMO) this kind of slight difference between one
dependency and all the others is just a maintenance hassle.

> Has header "snappy-c.h" : YES
> Library snappy found: YES
> ../../meson.build:1141: WARNING: could not link libsnappy, disabling
> Has header "lzo/lzo1x.h" : YES
> Library lzo2 found: YES
> ../../meson.build:1158: WARNING: could not link liblzo2, disabling
>
> meson should just decide it doesn't have snappy and lzo2,
> without emitting the warning.

These are two different tests:

- the "header present" and "library present" tests are done with cc.find_li=
brary

- the "does a basic program" link is done with cc.links.

The warning is emitted in the case where the files are present but the
test program fails. Of course, Meson doesn't have a crystal ball for
the cc.links test when it says that the static lzo2 library is there
(apparently it is).

I have tried "../configure --without-default-features --enable-snappy
--static" and it correctly fails with "../meson.build:1110:2: ERROR: C
static library 'snappy' not found". Likewise, "../configure --static"
prints dozen of warnings of the previous kind for missing static
libraries in pkg-config files; for snappy, however, it correctly
prints

Has header "snappy-c.h" : YES
Library snappy found: NO

without any warning. If you send me your config-host.mak and
meson-logs/meson-log.txt I can check what's going on here. If you
would like a different wording such as "could not link liblzo2 test
program, disabling", that can be done too, of course.

Paolo


