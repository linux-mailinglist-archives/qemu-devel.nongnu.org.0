Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (unknown [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60EF26C81DA
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Mar 2023 16:53:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pffCu-0004JP-8A; Fri, 24 Mar 2023 07:03:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pffCi-0004I7-4N
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 07:03:29 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pffCU-0002dA-QO
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 07:03:26 -0400
Received: by mail-wr1-x431.google.com with SMTP id r29so1336372wra.13
 for <qemu-devel@nongnu.org>; Fri, 24 Mar 2023 04:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679655749;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:user-agent:from:to:cc:subject:date:message-id:reply-to;
 bh=zv4OjsyZDrxAKXbhMuWhZYv1zI4JOiIgZjsO4spnNkI=;
 b=rdJMrGaeElr5Myyy2zbKz8c/8w2Mg1N7m8U+qwA3ImlL3btRXIHDgy0AAFOIZuwx9J
 iRk8QCOXzth72p4/784egduwfGQXqSAK9w9n8T11xfUwiDcGvJ3sXFOqF04Sgut28loN
 2kFtZ1sNi49DSww62YsMiMkZ+gr5s4LlxKyH7eX2kTM403fz7pwxsgK55dQ1nSpH3rue
 Cr4kg9lnkKNMVggu3RBkh79C4YRmCW8xfIkK9hz3jRoJyNeBaLRmR+lJDnWvZICwxjrx
 JzcGsIROZKWpN4tEa+5Q2bh7/aTr3Uw1kp+ooWK5V/mhtrr1zNnhRFddwQitXwM8wR0Q
 8k3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679655749;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:user-agent:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zv4OjsyZDrxAKXbhMuWhZYv1zI4JOiIgZjsO4spnNkI=;
 b=415EcfCzE6d8yqmDChnHPr9I51foQlfIx1balMdkSFKfc/s6gtnwIEz55EDAJWEldq
 6Yj4Q+Wc/ZvYKxYbiPxxliN0/MSz8xzDBDNMBax02dZX0E695tlPG8FxF9/8/2V6FYi8
 EUCgt0/tMiKFlBh1kyXSAlXW0O6+T0yzKBkfmJErh0O4gN0BKkel+1Nr75N4kc20GQja
 LOqagACsKg0O645pn6w8ZlCKu6ckDt09b7LSyyZUzCmrqWsMQ8qahDEyfUwyMWVPAhC7
 6DWTF7bY7yEX6oWdBMxoqzV/HEbUjjp7Xu10vn3VCi+Vj+nT3aiqDshIaKcVrvQqTHiQ
 UbkQ==
X-Gm-Message-State: AAQBX9csdy8e82ewICabrZkHFxfwvABC11RcHFneqvLWWa2Tdij5gJZr
 BtoBlQG6zEO0Dqbn6Gqzw5hdtA==
X-Google-Smtp-Source: AKy350afHqpw+D1lfm9cz4ytGN9+97Kr8xEEBdg91dkb3vKuQyXoIxiE57mT9WOC86Od8fd+AUGA2g==
X-Received: by 2002:adf:e950:0:b0:2da:1ac3:adfc with SMTP id
 m16-20020adfe950000000b002da1ac3adfcmr2179083wrn.60.1679655744076; 
 Fri, 24 Mar 2023 04:02:24 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 p5-20020adfce05000000b002d64fcb362dsm12906828wrn.111.2023.03.24.04.02.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Mar 2023 04:02:23 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6E87B1FFB7;
 Fri, 24 Mar 2023 11:02:23 +0000 (GMT)
User-agent: mu4e 1.9.22; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Anders Roxell <anders.roxell@linaro.org>, Remi Duraffort
 <remi.duraffort@linaro.org>
Cc: David Woodhouse <dwmw2@infradead.org>, qemu-devel <qemu-devel@nongnu.org>
Subject: Adding default config options to the tuxrun baseline kernels and
 enabling sshd
Date: Fri, 24 Mar 2023 10:47:41 +0000
Message-ID: <87h6ua4dkw.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
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

Hi guys,

I've been working with David on adding testing for the new KVM Xen guest
functionality and had a couple of questions. His original test is based
on fedora and is fairly comprehensive:

  https://git.infradead.org/users/dwmw2/qemu.git/commitdiff/48f78f9bb860dca=
446e20d6ed8db3aa9d857505f

but we did try building a scratch kernel and using the rest of the
baseline infrastructure which worked well enough:

  https://git.infradead.org/users/dwmw2/qemu.git/commitdiff/8b9e04d1c7c942f=
51b575b94fd280bd2353f76b6

but obviously the kernel there is pulling directly from tuxsuite so will
time out soon enough. They were built with the following tuxbuild
config:

  version: 1
  name: Xen Guest Kernels
  description: Build Xen Test Kernels
  jobs:
  - builds:
      - {target_arch: x86_64, toolchain: gcc-12, kconfig: [defconfig, "CONF=
IG_XEN=3Dy", "CONFIG_XEN_PVHVM=3Dy", "CONFIG_XEN_BLKDEV_FRONTEND=3Dy", "CON=
FIG_XEN_PVHVM_GUEST=3Dy"]}
      - {target_arch: i386, toolchain: gcc-12, kconfig: [defconfig, "CONFIG=
_XEN=3Dy", "CONFIG_XEN_PVHVM=3Dy", "CONFIG_XEN_BLKDEV_FRONTEND=3Dy", "CONFI=
G_XEN_PVHVM_GUEST=3Dy"]}
    test: {device: qemu-x86_64, tests: [ltp-smoke]}

The other nice thing about his original tests where using ssh which
avoids a) avoids some of the flakeness of using the serial port and b)
has an explicit success/fail for each command without having to scrape
pass/fail from the log.

So two questions:

  - is there a process for adding kernel options to the baseline kernels
    or should we build our own and store them somewhere?

  - what would it take to get dropbear added to the baseline ext4 images
    so we can enable sshd?

Thanks,

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

