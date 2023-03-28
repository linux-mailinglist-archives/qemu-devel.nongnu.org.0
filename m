Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C789F6CC244
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 16:39:27 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phAT2-0000EX-78; Tue, 28 Mar 2023 10:38:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1phASy-0000EL-N7
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 10:38:28 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1phASw-0000Yg-8t
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 10:38:27 -0400
Received: by mail-ed1-x531.google.com with SMTP id h8so50620920ede.8
 for <qemu-devel@nongnu.org>; Tue, 28 Mar 2023 07:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680014304;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Fob7JcqAWYwGACk03c+9n2+cP9ARKZFiIDst2lE7JB0=;
 b=OA+Y49O7YWRH28uRyr9w+ymyY7X8XG6JZ4nzoLA+Hyc71qD6VO25GW/soFWudeiksc
 3uI/DDGLyW3tBSU34M/UUrpp2JsgMUOllA6eYmDtp+7XiFwe8R7Ak8AzqL0vBuvT6C5Y
 tGPefdD4brR8VdaEPAuIXZ4fNexR9f7yZwvnRFfqnr4RkGAEANqXU5lMy2GM1DqPnc/z
 Un7JkfgU7JVLMMciY25LGGmvK2341cjhzBHVw1EbvOWPXzZIN3cP9ox0PsPT70thCGk6
 N9lSe/HbD4AtILnoundhqFcOQwyfGM6uZXEwPWVBJ7eM4tsiuzoOqfRw0GpBFP7WUee0
 fhGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680014304;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Fob7JcqAWYwGACk03c+9n2+cP9ARKZFiIDst2lE7JB0=;
 b=OTQxR9U2Z6P2h+qsg1llQVpEZ17p3RqhM7whkj8Ailh6IcnATyYYSOcN86KBnXGg9+
 76LNuu/TbT6jjA4whDBvzScxhMQJnNfQwFlNgA9zzKeHJp4/AAQts7mjpdPhiL/acHJj
 L6tj06VpqFUPeKLptgcK4uCDXYLR5fQScUFP0PUYX2/+Tgf/kBbP7zL+SGd+qCufKsY9
 rP5btoZB2DILOGUaWeWHySwtb2Xj5TZorT6+T+xpUvga7uo3RMm9nSrpbVnNNpFPjjWS
 lLhqNBBRl3d5PitZN9Cn2tuuO0Gbms8We93rfE8kLWidbVLxcHexqviF6IG0fx7xmup5
 njBA==
X-Gm-Message-State: AAQBX9d+OEhry8YnSaWbOvLVmWk8LXEYVc7/bJEpnT+W+oTqVEpCfjNF
 OHsxCVV/GdnIusl2+fan+n9Px90TTniMqI8z2albicKDwQxpy92URY0=
X-Google-Smtp-Source: AKy350a3F3URan3Mll5UsNJvpfSB13aZjz1pMchWhv2d3CyrvvhVjgKq2+sHkwh7HEYH6QdxYhHCucovwpANCA9QmFk=
X-Received: by 2002:a17:906:483:b0:92f:41e4:e48b with SMTP id
 f3-20020a170906048300b0092f41e4e48bmr7608738eja.6.1680014304355; Tue, 28 Mar
 2023 07:38:24 -0700 (PDT)
MIME-Version: 1.0
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 Mar 2023 15:38:14 +0100
Message-ID: <CAFEAcA96hY7wxj9NjbkZmBshA6VECUQktNXAyGdS+-zLL5rWmw@mail.gmail.com>
Subject: egl compile error on msys CI runners
To: QEMU Developers <qemu-devel@nongnu.org>
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
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

The msys CI runners have started failing to compile with an EGL
related error:

https://gitlab.com/qemu-project/qemu/-/jobs/4015682307

In file included from
C:/GitLab-Runner/builds/qemu-project/qemu/msys64/mingw64/include/epoxy/egl.h:46,
from C:/GitLab-Runner/builds/qemu-project/qemu/include/ui/egl-helpers.h:5,
from ../ui/egl-helpers.c:21:
C:/GitLab-Runner/builds/qemu-project/qemu/msys64/mingw64/include/epoxy/egl_generated.h:11:10:
fatal error: EGL/eglplatform.h: No such file or directory
11 | #include "EGL/eglplatform.h"
| ^~~~~~~~~~~~~~~~~~~
ninja: build stopped: subcommand failed.

Dan says this is because of a msys2 packaging issue:
https://github.com/msys2/MINGW-packages/issues/16492

Can we have a meson test that doesn't try to enable EGL on systems
like this one where it's broken ? Changing the current meson.build
  if cc.has_header('epoxy/egl.h', dependencies: epoxy)
to whatever the meson is for "actually try to compile with the
header" ought to do the trick, I think.

thanks
-- PMM

