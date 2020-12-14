Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 799D82D9729
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 12:14:31 +0100 (CET)
Received: from localhost ([::1]:52624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koloE-0003e6-If
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 06:14:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1koln5-000362-6L
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 06:13:19 -0500
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:39341)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1koln3-0007oN-3t
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 06:13:18 -0500
Received: by mail-ej1-x62c.google.com with SMTP id n26so21992008eju.6
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 03:13:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:from:date:message-id:subject:to;
 bh=86KnbXZ8GbsrTSNfgvl0ZfgYFVd6YkoYdyxORItjv1E=;
 b=huEr/QZ6jcIwaEY+12xjt83FeBNy0cmUhszCWW2OQ1Du0qxfolA9VbIN9C4VbnrbiG
 ZjR8l5L64qpNTYyQaSGWFaguC0oblBwTJHt8fj3SK16M/KlRCe3ALdd9zYpdNqlfCEl0
 oP2v/vcUu4mVDcVVshoJz/Lu1uh9iwPSPAXDem/hjHLoxgs/ws6v0Ww7F+cDQaN6sxg5
 yHUV493lfHfrcljJPwoHEang3cTur4pq+0ncJTjWsDcVVhlm4JWEys3p16y+rAqXcrGB
 uX/XljJovU1h0XJqInGjctDbBKD3NiSrADUebn3VgiEHh6FM1CeuCEIsrzQ5Xhczdm+L
 QP3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=86KnbXZ8GbsrTSNfgvl0ZfgYFVd6YkoYdyxORItjv1E=;
 b=pEr9ZOw/VGMv2eViZsQv0hhQdtjd18kI/V6JUA5hy85UrTgOz+8F+BdC52BmFHp73H
 qDXzL32nRqtAgN7eG20x4kAnPmEZN05K8p9qXhxc2VjX0IyMK/dhBOQkJjxzwWsxx2fO
 grK1PSImWmPlkYDW6VM8TrUQx5n7w2dTIYg3URbPXWOoIMiLgQZcpnHEo34jauqJOHkI
 QQMazvASPOEdokQRQAAogextrMC/F3TRHXBB2fTQOtaZV8pl/of+dUJ86gsh0MClrJcH
 6c4QEze7ni6Gji8oEu4ozXKOOXBE3xZ8NhLAIVEorhwPpT1DHHfI3QmEpm+ijCsuE9E3
 1Lsg==
X-Gm-Message-State: AOAM533nQoxr7W1mmfgM9hoc/6fyC5kp3GTmrYuH5arlK1fp/I4/mU5o
 Hn/Sx1aL9wbhCVZx9NvvxV985upe6V6PQCmFD4R8/Ei0ob1khg==
X-Google-Smtp-Source: ABdhPJyK1LN154wIgF2vLlAOCHPsbsT6no/NjqZtCVV4nDJ8xIQGk/eVlZS8ai+9MKUI5y0A8a39nejw0pG5Joj/DmI=
X-Received: by 2002:a17:906:1151:: with SMTP id
 i17mr22590887eja.250.1607944394160; 
 Mon, 14 Dec 2020 03:13:14 -0800 (PST)
MIME-Version: 1.0
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 14 Dec 2020 11:13:02 +0000
Message-ID: <CAFEAcA-kKuG_2XxuGrRHXMf8pVR+6NdhM_6xthxLYcr_HxW=Xg@mail.gmail.com>
Subject: gdb internal-error in 'check-tcg' with gdb 8.1.1-0ubuntu1
To: QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

My machine has suddenly started consistently failing 'make check-tcg'
like this, following an Ubuntu update of the gdb package from
"8.1-0ubuntu3.2" to "8.1.1-0ubuntu1":

make[2]: Entering directory
'/home/petmay01/linaro/qemu-for-merges/build/all-linux-static/tests/tcg/aarch64-linux-user'
timeout 60  /home/petmay01/linaro/qemu-for-merges/tests/guest-debug/run-test.py
--gdb /usr/bin/gdb-multiarch --qemu
/home/petmay01/linaro/qemu-for-merges/build/all-linux-static/qemu-aarch64
--qargs "" --bin sha1 --test
/home/petmay01/linaro/qemu-for-merges/tests/tcg/multiarch/gdbstub/sha1.py
>  run-gdbstub-sha1.out
/build/gdb-veKdC1/gdb-8.1.1/gdb/regcache.c:122: internal-error: void*
init_regcache_descr(gdbarch*): Assertion `MAX_REGISTER_SIZE >=
descr->sizeof_register[i]' failed.
A problem internal to GDB has been detected,
further debugging may prove unreliable.

This is a bug, please report it.  For instructions, see:
<http://www.gnu.org/software/gdb/bugs/>.

Aborted (core dumped)
/home/petmay01/linaro/qemu-for-merges/tests/tcg/multiarch/Makefile.target:51:
recipe for target 'run-gdbstub-sha1' failed
make[2]: *** [run-gdbstub-sha1] Error 134
make[2]: Leaving directory
'/home/petmay01/linaro/qemu-for-merges/build/all-linux-static/tests/tcg/aarch64-linux-user'
/home/petmay01/linaro/qemu-for-merges/tests/tcg/Makefile.qemu:85:
recipe for target 'run-guest-tests' failed
make[1]: *** [run-guest-tests] Error 2
/home/petmay01/linaro/qemu-for-merges/tests/Makefile.include:61:
recipe for target 'run-tcg-tests-aarch64-linux-user' failed
make: *** [run-tcg-tests-aarch64-linux-user] Error 2


Any ideas ?

thanks
-- PMM

