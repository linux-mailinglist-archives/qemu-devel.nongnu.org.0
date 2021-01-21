Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 428692FE96E
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 12:57:55 +0100 (CET)
Received: from localhost ([::1]:34792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2Yb4-0001eN-C0
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 06:57:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l2Ya6-0001DQ-Uk
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 06:56:55 -0500
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:35576)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l2Ya0-0004hx-UN
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 06:56:50 -0500
Received: by mail-ed1-x534.google.com with SMTP id j13so2132840edp.2
 for <qemu-devel@nongnu.org>; Thu, 21 Jan 2021 03:56:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=W9RLk4x9fNDz56CV45A0M6D7cJeoPs9nZ8xq3jC9stw=;
 b=ASR70XFpt7x61ApGJa4CT8/M89Xh3RtFyH3nvJvzezdrdXLtZxQR8C3Ut4O5EZbpBF
 gNTCcGPdwbFT6UPNIpWKUtvjrmsBW3QIg54Mo47TaZN6YrGZb8xIEf9ABb5IDNYnQvUH
 KSSwA2e6Wb0N2G8QX68L8gY1H1AYyPsagoZrPo92yIUO7Nw8P3I4sQ2BKE7BCFNPrs/Z
 RswpUX0qunA/cymNcwo51AWccLnxTk6RsN5qmf7460WLW6pPyA0Z4iNcyDS7/xdOU8e1
 yY76SxBQipeyYxklT+zTxMeAtkvxONF8jTs5xDbbsBScNgsXCslN1wV2zVHi/8yafjTJ
 8q2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=W9RLk4x9fNDz56CV45A0M6D7cJeoPs9nZ8xq3jC9stw=;
 b=k45hTTsSoRJDcNdrq+OWX79dJtcPc1PRZ4tzjeVGr8oVN7aEMrZxcf8q0w92+FCOpp
 NLAphMho6Cs8QGdJz9waE2GzvsU+yU9hCSrqCNZOFi35n+0ksWRpdp7ird1DpFWaYzSj
 Cn4d/Fg5Gom07MySL8tVzeO382a3uJSrb075+96FWnSjcWpt2g3bb1VH0AKPMOF20H/C
 qnaqqrMcrUdiPFnCXr3QN4ZfH6d7yhKn3x3a5hbIk4ePsdZqb9N3IsUNXTlKYpgDjp44
 6n03kKeH0kK64pP86ALaN4Fkw0HabvIZBdxdexNbmqd/Q54wGTE2RiIcM+bwFoSmavsf
 Gz2w==
X-Gm-Message-State: AOAM5317iPR7eq7Gr8o50lpQ2RAPqoMwpsOItDiyIe4CLcK9dp3zFmN1
 Z71YJiY69YXzbY/3cZOXzhwqbLDyqVB7fodJ4LvLc2d1FPufLQ==
X-Google-Smtp-Source: ABdhPJx5PybpTkQrvpJIwYSqYz3g60yEsR5eudzm1D5i75OgtUSVtWBAQI/8G8HCs+FLsTh8jRAXom1fid71rdKk8xU=
X-Received: by 2002:a05:6402:b2f:: with SMTP id
 bo15mr4497812edb.146.1611230207272; 
 Thu, 21 Jan 2021 03:56:47 -0800 (PST)
MIME-Version: 1.0
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 Jan 2021 11:56:36 +0000
Message-ID: <CAFEAcA8mBK9932CLZ9uFtEa0rSycK6Sp9UDjSJnbJpg2hx8idg@mail.gmail.com>
Subject: changing tests/qtest/meson.build causes unnecessary rebuilding
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
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

$ make -C build/arm-clang/ -j8
make: Entering directory
'/home/petmay01/linaro/qemu-from-laptop/qemu/build/arm-clang'
[1/23] Generating qemu-version.h with a meson_exe.py custom command
make: Leaving directory
'/home/petmay01/linaro/qemu-from-laptop/qemu/build/arm-clang'
$ touch tests/qtest/meson.build
$ make -C build/arm-clang/ -j8
make: Entering directory
'/home/petmay01/linaro/qemu-from-laptop/qemu/build/arm-clang'
/usr/bin/ninja  build.ninja && touch build.ninja.stamp
[0/1] Regenerating build files.
The Meson build system
[...]

It then goes on to rebuild hundreds or thousands of files, most of
which are not even in tests/. (Oddly, the exact set of files recompiled
seems to vary from run to run.)

Forcing a full rebuild of all of QEMU seems rather excessive when
the change was likely "add a new test case"...

thanks
-- PMM

