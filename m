Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5193E667743
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 15:41:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFyKg-0000KI-Hd; Thu, 12 Jan 2023 09:13:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pFyKe-0000JF-Vr
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 09:13:28 -0500
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pFyKd-00081o-8a
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 09:13:28 -0500
Received: by mail-pf1-x42c.google.com with SMTP id a184so13878054pfa.9
 for <qemu-devel@nongnu.org>; Thu, 12 Jan 2023 06:13:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=drj+8udaWH0ttV1Bjoa7Aoh39vkjCXJj2uN2hejfixI=;
 b=NB4+WdnymVL1hh9HRqZ+PKt7aujLZWaQCxS3A0QFUoyhwLj8SQzaRnP8kfGZLh9k63
 woY7ModPLPNsiXZsGCNVdI8dFUNwgXjwIRU0Ik3Xwf12IBIpesVfqeXm29inKhcufV/5
 4cXztFCHQ/QWocrcXolQzIJkpZZppdEbpm+MeVRbzKXw/CBOi5daYAKOjVr5Pqs6IO85
 +zn30p5cHXK/zyKf8MW9KRMSIxh1Kt8jPT+oVRmhrUxi8LdasBA6dzdzXsJ/nAXZ3vWY
 2SmfA9T96bLnk9BVaWAXM4s9rnhscyxIPsehOmZ9pXwn+3FrdDr1QFD9bL/lVd9asxAC
 uBBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=drj+8udaWH0ttV1Bjoa7Aoh39vkjCXJj2uN2hejfixI=;
 b=EpbZ38BH3fgv2xm2Uc9/+vAeP5pV0JqxXye6QgVym3pEurCH7YxU7UoAVtX1GFJ9p4
 PdyynWKEw58CcFhqmbeL6WtGohJxSe06VnfYpfgVh3Lmqqru5o8OwwjGGrCKO4ofEb+w
 3eeE6OTAlpSTHYvIFfQ05fSDbsqkIwZ5zrGXDr/R0trxZFpN8d6dCK69BaEBzKIagxBZ
 5A6ID2l27PX37takS8AuEyGjCBEOOjOQYCkti8SLQqvyuCFk13zyjISXa6q6BFBlISx+
 amanB5STJNknwyrc1ebuhPLYtV5pf88PHekvs0pQM9z2BSGYT3Kpf5OYi6lG12AkHVVQ
 HBeA==
X-Gm-Message-State: AFqh2kohEP3/vgTOyF8UUjrpjs4AJ9jumd4W4yUkFFCN9sLk2/nF2WGO
 HuvpynHq/rdCZY6d4Kj4CNJPudb2r2HyqqZ0apMxYnxrVL/6aA==
X-Google-Smtp-Source: AMrXdXtgEq/JABlqOKAMPaopeRLe0OQukh63//y68HqFcKRFvQTjWooUl7eqFdZ7SYEQ8vaehWBUS67WHWB5NKKY4UI=
X-Received: by 2002:aa7:999c:0:b0:582:74a2:1e4e with SMTP id
 k28-20020aa7999c000000b0058274a21e4emr3291610pfh.26.1673532805726; Thu, 12
 Jan 2023 06:13:25 -0800 (PST)
MIME-Version: 1.0
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Jan 2023 14:13:14 +0000
Message-ID: <CAFEAcA9zUTAeSbMd_TaOzWfimHOus-=SdNA1XZ+3FO9-fAG3qg@mail.gmail.com>
Subject: tricore-debian-cross-container CI job failing
To: QEMU Developers <qemu-devel@nongnu.org>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The tricore-debian-cross-container CI job has started failing for
no obvious reason:

https://gitlab.com/qemu-project/qemu/-/jobs/3593581274

gcc -DHAVE_CONFIG_H -I. -I. -I. -D_GNU_SOURCE -I. -I. -I../bfd
-I./../bfd -I./../include -I./../intl -I../intl -w
-DLOCALEDIR="\"/usr/local/share/locale\"" -W -Wall -Wstrict-prototypes
-Wmissing-prototypes -w -c `test -f 'ldgram.c' || echo './'`ldgram.c
`test -f ldlex.l || echo './'`ldlex.l
/bin/sh: 1: ldlex.l: not found

I think this is happening because the makefile thinks it needs to
rebuild the ldlex.c file but doesn't know how to. In turn this
is probably because:
(a) we don't install flex or bison in the container that's doing
this binutils build

(b) the binutils sources we're building are confused, because they
have a 'missing' script that is not compatible with the 'configure',
and so configure warns:

/usr/src/binutils/missing: Unknown `--run' option
Try `/usr/src/binutils/missing --help' for more information
configure: WARNING: `missing' script is too old or missing

and then later in the build when it needs to do something to
handle the "I have no 'flex' or 'bison'" code path it fails
obscurely rather than being able to use the 'missing' script to
deal with it.

https://stackoverflow.com/questions/40962711/configure-warning-missing-script-is-too-old-or-missing
suggests that this can happen if some autotools stuff wasn't
done right or not all the files were checked into the repo.

I dunno how easy that is to fix. Perhaps installing flex
and bison in our container might be easiest.

thanks
-- PMM

