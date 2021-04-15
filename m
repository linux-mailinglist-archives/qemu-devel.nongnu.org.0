Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8402736097F
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 14:34:18 +0200 (CEST)
Received: from localhost ([::1]:38782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lX1CL-0007xO-Ga
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 08:34:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lX18A-0005tC-Ea
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 08:30:00 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:34656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lX186-0007X7-2Q
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 08:29:58 -0400
Received: by mail-ej1-x632.google.com with SMTP id x12so15811298ejc.1
 for <qemu-devel@nongnu.org>; Thu, 15 Apr 2021 05:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=ensaLCG1u889GzSXiMB5rsF8TGZR+HOGSorjU2KKyrI=;
 b=J27/6Fx6TsS5gz7+wrVwLk11Pi68WJLlR3XprxVoV3/ZwlaRGu/yUg2YaxrnfVhN6a
 y6LOEeaAhiTcd766CtIKdEy5LwKqGEWWYC3sWncX2V2bHmoT6zWAo3IoSY1BcZwiU5zY
 TvU9MrFoLCmKQVOGWLeqO9BDc10wOtmv/r+bEacMsfPmM+kXqOTu6C2gBHs+5Rp4i5mT
 lqUFupEuYmj1xVBdvBTfnk4iBR+G8ZM2RsMnKQqvUq81gEcqjzB1tb/FZM828PnXaXOc
 CtfrCx+aheiFM7A4jzbvRzbhUxkdupdD217PVT4LxI/TZue7d4jh4VPKn0gZ+i/x6sQz
 p5RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=ensaLCG1u889GzSXiMB5rsF8TGZR+HOGSorjU2KKyrI=;
 b=hSKo906QRMobWnBn1P4ReKQFzJy/8W1+5Qw+jmdF8Zp/bRv7wFrpN22pNyqvqe/uuR
 o1M7EXlFZQjBlogeYgaBiFAg+h3/5uOCrlcp63i4ebAWms7xXnNjkb/xmI+2G99tHQ54
 ZsYOl4YGQ6EQHiIBhID4uHYIdQB0b+DNfmXKFhAoPK1KPQIvVCQ/gCd/CCgwviiZLdvL
 m9QdELFPA8asLytbUf7q9fxzlBeZFnrAHKMxFaYgHbP0JnR10EH34le85NwVwF968KjP
 OSTBA+ZZWDkfnWXKDDjav7l+h5sGKBsOs2a+xVq92O6692vzJLu6oJamFYeDXeC8JhuQ
 L31A==
X-Gm-Message-State: AOAM530ge1f5bp+OyhPBRh5jmZcVGoM19iLldRB89tRwwD1YaiEdevAs
 pLkmM/TxkrglkY0qiL1c8geFy23pr+YxExGTR3ed+tYG/vVvbQ==
X-Google-Smtp-Source: ABdhPJwH4ezH8I4fL0cLmeQSXXTe0vaWs4zmyETUuYHooHErhPMk54Fo4efxzxXwnUzlkREUnVSTGDg9M+VkQEO9pVQ=
X-Received: by 2002:a17:906:bd2:: with SMTP id
 y18mr3205709ejg.482.1618489791138; 
 Thu, 15 Apr 2021 05:29:51 -0700 (PDT)
MIME-Version: 1.0
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 15 Apr 2021 13:29:03 +0100
Message-ID: <CAFEAcA8xHxCGhh2hibsdCxZrYRRU+xcwVsa85O7KL9BsmW7ohw@mail.gmail.com>
Subject: meson incorrectly detects libcurl as present even if it spots that
 its dependencies are missing
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x632.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

My build of system-emulation with --enable-static seems to have
broken at some point since the last time I had cause to run it.
Looking at the meson-log the cause seems to be that meson enables
libcurl support even though it has found that libcurl's dependencies
aren't present as static libs:

Determining dependency 'libcurl' with pkg-config executable
'/usr/bin/pkg-config'
PKG_CONFIG_PATH:
Called `/usr/bin/pkg-config --modversion libcurl` -> 0
7.58.0
PKG_CONFIG_PATH:
Called `/usr/bin/pkg-config --cflags libcurl` -> 0
-I/usr/include/x86_64-linux-gnu
PKG_CONFIG_PATH:
Called `/usr/bin/pkg-config libcurl --libs --static` -> 0
-L/usr/lib/x86_64-linux-gnu -L/usr/lib/x86_64-linux-gnu/mit-krb5
-lcurl -lnghttp2 -lidn2 -lrtmp -lpsl -lnettle -lgnutls
-Wl,-Bsymbolic-functions -Wl,-z,relro -lgssapi_krb5 -lkrb5 -lk5crypto
-lcom_err -llber -lldap -llber -lz
PKG_CONFIG_PATH:
Called `/usr/bin/pkg-config libcurl --libs --static` -> 0
-L/usr/lib/x86_64-linux-gnu/mit-krb5 -lcurl -lnghttp2 -lidn2 -lrtmp
-lpsl -lnettle -lgnutls -Wl,-Bsymbolic-functions -Wl,-z,relro
-lgssapi_krb5 -lkrb5 -lk5crypto -lcom_err -llber -lldap -llber -lz
None of 'PKG_CONFIG_PATH' are defined in the environment, not changing
global flags.
WARNING: Static library 'nghttp2' not found for dependency 'libcurl',
may not be statically linked
WARNING: Static library 'psl' not found for dependency 'libcurl', may
not be statically linked
WARNING: Static library 'gssapi_krb5' not found for dependency
'libcurl', may not be statically linked
WARNING: Static library 'krb5' not found for dependency 'libcurl', may
not be statically linked
WARNING: Static library 'k5crypto' not found for dependency 'libcurl',
may not be statically linked
Run-time dependency libcurl found: YES 7.58.0


This seems wrong to me -- if meson is smart enough to spot that
it's not actually going to be able to statically link libcurl
because of all those missing static libs, it should determine that
it has not found a working libcurl, rather than saying that it has
and letting the build proceed until the final link of executables fails.

thanks
-- PMM

