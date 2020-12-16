Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFEA12DBB4B
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 07:39:20 +0100 (CET)
Received: from localhost ([::1]:36754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpQT0-0004us-NA
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 01:39:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ml.linux@elloe.vision>)
 id 1kpQHg-0004jo-Iz
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 01:27:36 -0500
Received: from yes.iam.tj ([109.74.197.121]:50884 helo=iam.tj)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ml.linux@elloe.vision>)
 id 1kpQHe-0004Iy-BL
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 01:27:36 -0500
Received: from [IPv6:2a02:8010:4007:dead:beef::b217] (unknown
 [IPv6:2a02:8010:4007:dead:beef::b217])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 by iam.tj (Postfix) with ESMTPSA id DFFDC340AD
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 06:27:30 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=elloe.vision; s=2019;
 t=1608100051; bh=IYiqJlllGn+a8VY1KiUza2NqZ5HI0/OV/ipvojmnZG4=;
 h=To:From:Subject:Date:From;
 b=dqDqn1kw2Sn1prxj7v39yTjlT5yMteXHpHhxX77fxFjMKdxlDtIWKUA+ZqSMVIR2D
 6HgxNzixAUOXIMqXObpCh+spgKmrZLx2eSzZWW0H1h3HMWvS4cnzmZJ7jDAWJBL0QG
 WUhqdM5eQhRunjlBilKOyC85YFUofVekiTGgle3FhtNd0yJACmISVYZ9srtNLU8Ovx
 oeZIeZwbd5b4cgP5HRy0+7o18Iskhk+fS/t+Fc5moEH2sEa5WrILTww8U3qrqxCv3U
 YRuUUxa+fJEaRJxD2gYAOzjrGCrcThcAdYl7ky33N4S/AEKGtjGli9Og1hjSf1EbTI
 aH0bIF0lJCp/w==
To: qemu-devel@nongnu.org
From: "Tj (Elloe Linux)" <ml.linux@elloe.vision>
Subject: Are user static builds really dynamically linked ?
Organization: Elloe CIC
Message-ID: <8732c6f5-34ac-dcce-ee9f-69e7dd612e4e@elloe.vision>
Date: Wed, 16 Dec 2020 06:27:30 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=109.74.197.121;
 envelope-from=ml.linux@elloe.vision; helo=iam.tj
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
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

user --static builds are apparently resulting in dynamically linked
executables (to the glibc library, not other shared objects )

Concise summary:

$ file ../qemu-aarch64_v*

../qemu-aarch64_v4.2.1: ELF 64-bit LSB executable, x86-64, version 1
(GNU/Linux), statically linked,
BuildID[sha1]=70f5e10ac0eb9b63d7758850e2f18d0a047d4b79, for GNU/Linux
3.2.0, with debug_info, not stripped

../qemu-aarch64_v5.2:   ELF 64-bit LSB shared object, x86-64, version 1
(GNU/Linux), dynamically linked,
BuildID[sha1]=91fda2fa08f46d1bb6d19b6f72a4819a7c20fd7e, for GNU/Linux
3.2.0, stripped

$ ldd  ../qemu-aarch64_v*

../qemu-aarch64_v4.2.1:
        not a dynamic executable
../qemu-aarch64_v5.2:
        statically linked


Between v4.2.1 and HEAD and (trying to) perform git-bisect builds using:

$ ../../qemu/configure --disable-system --enable-linux-user --static
--target-list=aarch64-linux-user

All builds from v5.x onwards report:

$ file qemu-aarch64
qemu-aarch64: ELF 64-bit LSB shared object, x86-64, version 1
(GNU/Linux), dynamically linked,
BuildID[sha1]=546ba11f0de940f7f3cbfaffae3c2bb54b683386, for GNU/Linux
3.2.0, with debug_info, not stripped

Whereas builds of v4.2.1 report:

$ file ./aarch64-linux-user/qemu-aarch64
./aarch64-linux-user/qemu-aarch64: ELF 64-bit LSB executable, x86-64,
version 1 (GNU/Linux), statically linked,
BuildID[sha1]=70f5e10ac0eb9b63d7758850e2f18d0a047d4b79, for GNU/Linux
3.2.0, with debug_info, not stripped

... the same as the v4.2.0 built by Debian/Ubuntu:

$ file /usr/bin/qemu-aarch64-static
/usr/bin/qemu-aarch64-static: ELF 64-bit LSB executable, x86-64, version
1 (GNU/Linux), statically linked,
BuildID[sha1]=abad039a2cfc5bc87215554230a572b085fbc37a, for GNU/Linux
3.2.0, with debug_info, not stripped



This could be a problem because when the executable is dynamically
linked to glibc the same glibc version needs to be installed in the
chroot and that isn't always possible.

I'm unsure whether this is a cosmetic issue of file/ldd reporting or is
a regression.

Hit this whilst in the process of trying to isolate commits that fixed
another issue where using qemu-aarch64 on x86_64 Debian/Ubuntu host with
a foreign architecture chroot that results in "handle_cpu_signal
received signal outside vCPU context" when doing "chroot
debian-buster-aarch64 aptitude full-upgrade".

