Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9E9532F33
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 18:46:38 +0200 (CEST)
Received: from localhost ([::1]:45034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntXg5-00024W-A5
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 12:46:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ntWrh-0004Zv-Ii
 for qemu-devel@nongnu.org; Tue, 24 May 2022 11:54:34 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:53032)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ntWrf-0007VN-O3
 for qemu-devel@nongnu.org; Tue, 24 May 2022 11:54:33 -0400
Received: by mail-wm1-x332.google.com with SMTP id p19so2405565wmg.2
 for <qemu-devel@nongnu.org>; Tue, 24 May 2022 08:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=6PjoNvNVyzYX9m93QfpMvSaVZW2I57r80p0hPZvng7Q=;
 b=SGPrzHqXBKntEwuJA9UxaH01CzOdWLyz1aGGlBUUhdXMZJnhdIid0S8BM2hHG0H0hp
 gEzLkcsVcmdOLmioECL06X/6cHHQYITc9x5Nke3yZaxfB8oYhK46EsCQPmo5lxHX4oXv
 rd3Fv4WQU6I1fLJCX+551bIz7TxZ/qDIklAV2q1JXHk0Bkt13FVEqbi+1ly8eh4HGnln
 MTCfL1zV40ULKdl1aafNatT8/rceihpZYUAaQ0i5xKdUNII193TNqxj8EZQmelMIXIV1
 C4J3N8SYC5qS/wEIDfd3BzWRDLN5iMYMqARH/MPki8iwkVDddHL8rsyP1k/QdZX9bWnD
 zYUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=6PjoNvNVyzYX9m93QfpMvSaVZW2I57r80p0hPZvng7Q=;
 b=QJvOPqIBrlWC+PeMgaM+4VnG0IYy6WD1EGKVd4n2Bbe0k1LewYCA9cck/KWL5ghIMY
 5y3TPyKu+zprojNGY0erml7co9VUOLMW5upxgw08wJySn2QpIE/D5XcUnAynT4HIpYHe
 87XvbPcqlCvivXoYVoCBkJpOwXVplsDZuiaJL5XedqeGUMpuNLpsGBZ1/gaKRiYuDxNs
 QGXQPiIuGFS/DaGP4yBY6WUoDAE/6x3zS24kKIxuL8B6kVnJxPbG2cUGPkrqs2kr8clH
 tDh7AGYRp+ScQzy+GH81YFZRE27aHpSRDZsmSSS7An2whnrMBOXDkrWiVXuaASpesM78
 kpUQ==
X-Gm-Message-State: AOAM532OOKzntJWujkjTC/jq5UqhGnDF2tPj9qSgIZAs+YsQs8/B3+BI
 9It5cUt6+r30QehV8iTe5Nomqg==
X-Google-Smtp-Source: ABdhPJz0g0mz7mpEzAbSa///KWA6KqhyooQssItXwl6bZromygPElo0M0wSR17By1KPqpWOgp2CTBw==
X-Received: by 2002:a7b:c1cf:0:b0:397:3a9e:29b8 with SMTP id
 a15-20020a7bc1cf000000b003973a9e29b8mr4455678wmj.158.1653407669371; 
 Tue, 24 May 2022 08:54:29 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 f13-20020a7bc8cd000000b003974df805c7sm2705512wml.8.2022.05.24.08.54.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 May 2022 08:54:28 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D07251FFB7;
 Tue, 24 May 2022 16:54:27 +0100 (BST)
References: <20220517092616.1272238-1-pbonzini@redhat.com>
User-agent: mu4e 1.7.23; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, richard.henderson@linaro.org
Subject: Re: [PATCH 00/16] Cross compilation of embedded firmware
Date: Tue, 24 May 2022 16:53:04 +0100
In-reply-to: <20220517092616.1272238-1-pbonzini@redhat.com>
Message-ID: <87zgj753kc.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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


Paolo Bonzini <pbonzini@redhat.com> writes:

> This is the next part of the firmware cross compilation story.  It only
> looks at firmware that's strictly part of QEMU (optionrom, s390-ccw,
> vof), and does not do docker cross compilers yet; but it takes the
> infrastructure from tests/tcg/configure.sh and moves it in the main
> configure script so that others can use it.
>
> I actually expect the compiler tests to move back to tests/tcg, running
> at Make time after the docker images are built.  For now, the file is
> moved as a whole, including both compiler detection and the tests.

Isn't that just creating a bunch of unnecessary churn? The
tests/tcg/configure.sh sciprt already has a bunch of special casing in
it to detect various compiler features for the purposes of tests. It
would be nice if we could keep it's history of warts intact.

>
> Paolo
>
> RFC->v1:
> - new patches 1-4, 6, 16
> - patches 9-10 have been merged already
>
> Paolo Bonzini (16):
>   configure: do not define or use the CPP variable
>   build: clean up ninja invocation
>   build: add a more generic way to specify make->ninja dependencies
>   build: do a full build before running TCG tests
>   configure, meson: move symlinking of ROMs to meson
>   tests/tcg: correct target CPU for sparc32
>   tests/tcg: merge configure.sh back into main configure script
>   configure: add missing cross compiler fallbacks
>   configure: handle host compiler in probe_target_compiler
>   configure: introduce --cross-prefix-*=3D
>   configure: include more binutils in tests/tcg makefile
>   configure: move symlink configuration earlier
>   configure: enable cross-compilation of s390-ccw
>   configure: enable cross-compilation of optionrom
>   configure: enable cross compilation of vof
>   configure: remove unused variables from config-host.mak
>
>  Makefile                     |   9 +-
>  configure                    | 605 ++++++++++++++++++++++++++++++-----
>  pc-bios/meson.build          |  18 +-
>  pc-bios/optionrom/Makefile   |   4 +-
>  pc-bios/s390-ccw/Makefile    |   9 +-
>  pc-bios/s390-ccw/netboot.mak |   2 +-
>  pc-bios/vof/Makefile         |  17 +-
>  scripts/mtest2make.py        |   8 +-
>  tests/Makefile.include       |   4 +-
>  tests/tcg/configure.sh       | 376 ----------------------
>  10 files changed, 570 insertions(+), 482 deletions(-)
>  delete mode 100755 tests/tcg/configure.sh


--=20
Alex Benn=C3=A9e

