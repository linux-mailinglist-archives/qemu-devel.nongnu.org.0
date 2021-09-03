Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0229B400387
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 18:38:33 +0200 (CEST)
Received: from localhost ([::1]:48698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMCD2-0005cc-3x
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 12:38:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mMCBp-0004wp-WB
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 12:37:18 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:35633)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mMCBo-0001cy-3t
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 12:37:17 -0400
Received: by mail-wr1-x434.google.com with SMTP id i6so9041470wrv.2
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 09:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=hKCiEh3o2mYFX91amCKlD4DUMUvzokVAXQkWkfQzaog=;
 b=JaMbqUwO8CMhFa5IfIGOVV5cYnH6fD1iiytbClp6KFX7JBrm7NCP2uaDdHPAzWL9vV
 B5LykD80OdPoqsZuckhYnDm+aCsxzMm5DmZnU4NfMw7VYLo0vLyVwHZ1CX8puhwxfH0b
 K32hZI+nHojxfGVD7ZWe2Dw4TzJ0u1ZRPrqjxNTWIwVj7M8IGZjpn5xAXTTmh/yIY3qL
 bRORAA+NBugfQDP71FnxPmuDoPbsAmTEv8iZHSiK1VhKeqvKat3KUUXq1t39WU70MTiX
 lDErvEFz4bOJa01ezAI86TDYYIdv57QAsrp7QWdesrfD8QB5lCTSI0EFvj2g8Qd41Dkz
 09kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=hKCiEh3o2mYFX91amCKlD4DUMUvzokVAXQkWkfQzaog=;
 b=fz3MbDi277BkBKCy2KuOqoH6P+Fqm8e4l1bl/2URzsPwci2yPZeE/7nZir7LU1ND5r
 +SJEGRoN30b5ljehvR+L+9nE3Pho2TKjnfni4+l7o0LaiRy7OIlTdziB2HX+iMX/UJEa
 HZFfm60Kzmml+AFkdPd6PaQL3AVvWxPsBnHiZbcKkrQ4yDxNBBucX+fM5To28GSjewar
 hsDoxI3OnLr2J9tPYx8F9MuTMaxDc8dhELLr88MYzaPHiKaeLf3FM5dLsk4qenhvfjgL
 L5ETVphQ/sN6xFmXtndvWy70yS8rjK5/zcFNXLZS4z/7yDcnWGQ1T/+hOnqdZw3ImybL
 8igg==
X-Gm-Message-State: AOAM533It2RPTrjsF3p7o5bP6LRti+OnFaP0HK7m1grU0W0ioGGLoOJE
 d4/Z3PKvcMdGq7NoOvBD93HjyQ==
X-Google-Smtp-Source: ABdhPJylaXVk4/Eo6RDu3X4vDVCQ9PE9WpWt+ElAuCCUMEC4MgJL5NwHHl+qqdrbDmo/MANtCr6IPg==
X-Received: by 2002:a5d:468a:: with SMTP id u10mr2344956wrq.434.1630687034444; 
 Fri, 03 Sep 2021 09:37:14 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id d5sm5039976wra.38.2021.09.03.09.37.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 09:37:13 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 293091FF96;
 Fri,  3 Sep 2021 17:37:12 +0100 (BST)
References: <20210902124911.822423-1-thuth@redhat.com>
 <CAFEAcA89mGzirJWyzH+-c3WtH3G=XYV0MqRfBK+5SnA+Hob-eA@mail.gmail.com>
 <3090f5dd-d03d-bd2a-ce4d-ff0d796d9c5f@redhat.com>
User-agent: mu4e 1.7.0; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PULL 00/13] Testing, build system and misc patches
Date: Fri, 03 Sep 2021 17:35:10 +0100
In-reply-to: <3090f5dd-d03d-bd2a-ce4d-ff0d796d9c5f@redhat.com>
Message-ID: <87v93hpqdj.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Thomas Huth <thuth@redhat.com> writes:

> On 03/09/2021 15.22, Peter Maydell wrote:
>> On Thu, 2 Sept 2021 at 13:49, Thomas Huth <thuth@redhat.com> wrote:
>>>
>>>   Hi Peter,
>>>
>>> the following changes since commit 59a89510b62ec23dbeab8b02fa4e3526e353=
d8b6:
>>>
>>>    Merge remote-tracking branch 'remotes/stefanberger/tags/pull-tpm-202=
1-09-01-1' into staging (2021-09-02 08:51:31 +0100)
>>>
>>> are available in the Git repository at:
>>>
>>>    https://gitlab.com/thuth/qemu.git tags/pull-request-2021-09-02
>>>
>>> for you to fetch changes up to c72dc94b74fb1686decc0ca4c2b05e5bf2e5b74b:
>>>
>>>    softmmu/vl: Deprecate the -sdl and -curses option (2021-09-02 14:43:=
58 +0200)
>>>
>>> ----------------------------------------------------------------
>>> * Add definitions of terms for CI/testing
>>> * Fix g_setenv problem discovered by Coverity
>>> * Gitlab CI improvements
>>> * Build system improvements (configure script + meson.build)
>>> * Removal of the show-fixed-bugs.sh script
>>> * Clean up of the sdl and curses options
>>>
>> This provokes a new warning from meson on a linux-static build:
>> Run-time dependency appleframeworks found: NO (tried framework)
>> Library rt found: YES
>> Found pkg-config: /usr/bin/pkg-config (0.29.1)
>> WARNING: Static library 'gbm' not found for dependency 'gbm', may not
>> be statically linked
>> Run-time dependency gbm found: YES 20.0.8
>> Dependency libpng found: YES 1.6.34 (cached)
>> Dependency libjpeg found: YES unknown (cached)
>> If we're building statically and we can't find a static
>> library then (a) we shouldn't print a WARNING and
>> (b) we shouldn't then conclude that we've found gdm.
>
> Hmmm, no clue what's wrong here, since I basically did declare it like
> all other libraries are declared, too (so this problem should have
> shown up somewhere else already?)... Paolo, do you have any ideas
> what's going on here?

In attempting to replicate I found all the dynamic libs blow up:

  Run-time dependency pixman-1 found: YES 0.40.0
  Library aio found: Y
  Run-time dependency zlib found: YES 1.2.1
  Run-time dependency liburing found: NO (tried p
  Run-time dependency libxml-2.0 found: YES 2.9.1
  Run-time dependency libnfs found: YES 4.0.0
  Run-time dependency appleframeworks found: NO (tried f
  Run-time dependency libseccomp found: YES 2.5.1
  Has header "cap-ng.h" : Y
  Library cap-ng found: Y
  WARNING: Static library 'xkbcommon' not found for dependency 'xkbcommon',=
 may not be statically l
  Run-time dependency xkbcommon found: YES 1.0.3
  Library rt found: Y
  Run-time dependency libiscsi found: YES 1.19.0
  Run-time dependency libzstd found: YES 1.4.8
  WARNING: Static library 'virglrenderer' not found for dependency 'virglre=
nderer', may not be statically l
  Run-time dependency virglrenderer found: YES 0.8.2
  WARNING: Static library 'nghttp2' not found for dependency 'libcurl', may=
 not be statically l
  WARNING: Static library 'rtmp' not found for dependency 'libcurl', may no=
t be statically l
  WARNING: Static library 'psl' not found for dependency 'libcurl', may not=
 be statically l
  WARNING: Static library 'gssapi_krb5' not found for dependency 'libcurl',=
 may not be statically l
  WARNING: Static library 'krb5' not found for dependency 'libcurl', may no=
t be statically l
  WARNING: Static library 'k5crypto' not found for dependency 'libcurl', ma=
y not be statically l
  WARNING: Static library 'lber' not found for dependency 'libcurl', may no=
t be statically l
  WARNING: Static library 'ldap' not found for dependency 'libcurl', may no=
t be statically l
  Run-time dependency libcurl found: YES 7.74.0
  WARNING: Static library 'udev' not found for dependency 'libudev', may no=
t be statically l
  Run-time dependency libudev found: YES 2
  Library mpathpersist found: N
  Run-time dependency ncursesw found: YES 6.2.2
  Has header "brlapi.h" : Y
  Library brlapi found: Y
  ../../meson.build:680: WARNING: could not link brlapi, d
  sdl2-config found: N
  Run-time dependency sdl2 found: NO (tried pkgconfig and config-t
  Library rados found: N
  Has header "rbd/librbd.h" : Y
  Library rbd found: N
  WARNING: Static library 'gfapi' not found for dependency 'glusterfs-api',=
 may not be statically l
  WARNING: Static library 'glusterfs' not found for dependency 'glusterfs-a=
pi', may not be statically l
  WARNING: Static library 'gfrpc' not found for dependency 'glusterfs-api',=
 may not be statically l
  WARNING: Static library 'gfxdr' not found for dependency 'glusterfs-api',=
 may not be statically l
  Run-time dependency glusterfs-api found: YES 7.9.2
  Has header "bzlib.h" : Y
  Library bz2 found: YES
  Has header "lzfse.h" : NO=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20

So is this a general problem with static libs. BTW I didn't catch this
because I only build user with --static as I thought system --static was
flakey anyway.

>
>  Thomas


--=20
Alex Benn=C3=A9e

