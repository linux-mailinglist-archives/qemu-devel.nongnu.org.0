Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 900F33D6B29
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Jul 2021 02:40:56 +0200 (CEST)
Received: from localhost ([::1]:41102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8B9T-00008D-6p
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 20:40:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1m8B8M-0007tV-9E
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 20:39:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36031)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1m8B8I-0003ff-Iz
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 20:39:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627346380;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=h7TFrk4LgCeEFJuwOkFvMgoB9q8J9uiduW27iL62i7o=;
 b=IGFODE+B2lzEM7PYFh17rv44ty/28dz0vcJ7Vb71Wu/BH0Z3TvmTWfRqvp9oXTYNlc0UBn
 H/P/NtoYcD1WTv70XQQNNHj3bSjpHtDNete3jN1hYtUoFAV3iBVBfjSRI0AfwbWeLGYBX0
 F0XFXswTfVOSDvhXAf6X2Cg4CaDv9Oo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-301-UR3OHlFBO-K4G1NWgiByAA-1; Mon, 26 Jul 2021 20:39:36 -0400
X-MC-Unique: UR3OHlFBO-K4G1NWgiByAA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8A27887D541;
 Tue, 27 Jul 2021 00:39:35 +0000 (UTC)
Received: from p50.localhost.localdomain.some.host.somewhere.org
 (ovpn-117-22.rdu2.redhat.com [10.10.117.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B8F2210013D7;
 Tue, 27 Jul 2021 00:39:34 +0000 (UTC)
User-agent: mu4e 1.4.15; emacs 27.2
From: Cleber Rosa <crosa@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>, Peter Maydell
 <peter.maydell@linaro.org>, Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>,
 QEMU devel <qemu-devel@nongnu.org>
Subject: Regression caught by
 replay_kernel.py:ReplayKernelNormal.test_aarch64_virt
Date: Mon, 26 Jul 2021 20:39:33 -0400
Message-ID: <87pmv4zj22.fsf@p50.localhost.localdomain>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


Hi everyone,

tests/acceptance/replay_kernel.py:ReplayKernelNormal.test_aarch64_virt
is currently failing consistently (first found that in [1]).

I've bisected it down to the following commit:

---

78ff82bb1b67c0d79113688e4b3427fc99cab9d4 is the first bad commit
commit 78ff82bb1b67c0d79113688e4b3427fc99cab9d4
Author: Richard Henderson <richard.henderson@linaro.org>

    accel/tcg: Reduce CF_COUNT_MASK to match TCG_MAX_INSNS
   =20
    The space reserved for CF_COUNT_MASK was overly large.
    Reduce to free up cflags bits and eliminate an extra test.
   =20
    Tested-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
    Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
    Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
    Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
    Message-Id: <20210717221851.2124573-2-richard.henderson@linaro.org>

 accel/tcg/translate-all.c | 5 ++---
 include/exec/exec-all.h   | 4 +++-
 2 files changed, 5 insertions(+), 4 deletions(-)

---

To reproduce it:

1. configure --target-list=3Daarch64-softmmu
2. meson compile
3. make check-venv
4. ./tests/venv/bin/avocado --show=3Dtest run tests/acceptance/replay_kerne=
l.py:ReplayKernelNormal.test_aarch64_virt

PS: I haven't had the time yet to scan the mailing list for possible
discussions about it.

[1] https://gitlab.com/qemu-project/qemu/-/jobs/1445513133#L268

--=20
Cleber Rosa
[ Sr Software Engineer - Virtualization Team - Red Hat ]
[ Avocado Test Framework - avocado-framework.github.io ]
[  7ABB 96EB 8B46 B94D 5E0F  E9BB 657E 8D33 A5F2 09F3  ]


