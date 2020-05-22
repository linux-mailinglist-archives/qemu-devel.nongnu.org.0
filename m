Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C34FB1DED6E
	for <lists+qemu-devel@lfdr.de>; Fri, 22 May 2020 18:39:43 +0200 (CEST)
Received: from localhost ([::1]:48792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jcAhd-0007HI-SW
	for lists+qemu-devel@lfdr.de; Fri, 22 May 2020 12:39:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jcAgV-0006Ds-Vh
 for qemu-devel@nongnu.org; Fri, 22 May 2020 12:38:11 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:24065
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jcAgU-0002Qc-Gg
 for qemu-devel@nongnu.org; Fri, 22 May 2020 12:38:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590165488;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=G9X8uyPDhV16Hxow4Zcyx5aJejh0IiaqkWA79PUnMxc=;
 b=LxS31UK4iKvLzkMBZoRs771BqIe6vFBD9wJVD46mn034KBScmGwswPYZKI9d020BjIwzOk
 jDH3R8RC6w49C8SPKr/zL0yTydV8mIkTJotXX/QktNW9KQbBOo5INLLqREYmapN4szXoxz
 7LtTiMg/MhE+QcmvD5ZytBJcOElcmTw=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-511-YbUAHDEWPVeyMnUZkuD0Ag-1; Fri, 22 May 2020 12:38:03 -0400
X-MC-Unique: YbUAHDEWPVeyMnUZkuD0Ag-1
Received: by mail-wr1-f69.google.com with SMTP id z5so4563881wrt.17
 for <qemu-devel@nongnu.org>; Fri, 22 May 2020 09:38:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=G9X8uyPDhV16Hxow4Zcyx5aJejh0IiaqkWA79PUnMxc=;
 b=L04kCVrpsr3MVIZUMH3tPPPiem0qxh3+eNoisgvcIdaIibjGao83uQ9F8x9cjlf9XI
 tbT2dwxfj91z1OaTtMBlRVe9fIM6iFBXTTZN6yz66BaYbXc+DkLIYb2pWLfPQCl8s1h7
 i8pP56++agLa2Q00d734WxG44nem9u0R4ykaboDZQWiXOZJ/h8uq1yxjiiayuhH0iVVG
 T1gHOsnDPWgqGXydk+pGk2bNurIGziAPM11/VKSXohJU0umE3v+NqN7Vsn4IBIzlxDyK
 SAHEK7FA5bDBw9r8m27qlfuwEPOsfhaFH+ckO81ikJpciwO2dVYQny9/dA2BRNk9MyvL
 9ntA==
X-Gm-Message-State: AOAM531lplc2FUZdYAtpS1nhX9QNaWZN88gteqRSPAnvMwSlsTTYJV6s
 expwpPxyX37PYdOTbEh2p87CGYAMKDNcxB5FwCOwjJ/I2n080RDoLkbDKobUTFg1PtXTuuZwYUa
 5o3DwnjmKz6Q5Ew4=
X-Received: by 2002:adf:df0e:: with SMTP id y14mr4084103wrl.6.1590165481748;
 Fri, 22 May 2020 09:38:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyr4hZHt+rmg+uNsJrDXDS/a5DePwQrrk3Ybf2cL4t0W71kyOSDGgVGesrA1NbZQA7dJguRYg==
X-Received: by 2002:adf:df0e:: with SMTP id y14mr4084094wrl.6.1590165481552;
 Fri, 22 May 2020 09:38:01 -0700 (PDT)
Received: from localhost.localdomain (17.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.17])
 by smtp.gmail.com with ESMTPSA id a12sm9688898wro.68.2020.05.22.09.38.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 May 2020 09:38:00 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 00/11] accel: Allow targets to use Kconfig
Date: Fri, 22 May 2020 18:37:48 +0200
Message-Id: <20200522163759.11480-1-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/22 11:12:54
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Missing review:
- patch #4 'rules.mak: Add startwith rule'
- patch #5 'rules.mak: Add base-arch rule'.

This series include generic patches I took of the KVM/ARM
specific series which will follow.

- List orphan accelerators in MAINTAINERS
- Add accel/Kconfig
- Allow targets to use their how Kconfig

Since v3:
- Fixed base-arch() rule (rth)
- Dropped 'semihosting: Make the feature depend of TCG'

Since v2:
- Addressed Thomas review comments
- Fixed problem when including TARGET instead of BASE_TARGET

Since v1:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg689024.html
- Drop HVF MAINTAINERS patch (merged elsewhere)
- Kconfig-select SEMIHOSTING (bonzini)
- Drop user-mode selection patches
- consider m68k/nios2/xtensa/riscv (pm215)
- reword Kconfig SEMIHOSTING description (pm215)
- reset some of rth R-b tags

Previous RFC for semihosting posted earlier:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg631218.html

$ git backport-diff -u v3 -r v4
Key:
[----] : patches are identical
[####] : number of functional differences between upstream/downstream patch
[down] : patch is downstream-only
The flags [FC] indicate (F)unctional and (C)ontextual differences, respectively

001/11:[----] [--] 'MAINTAINERS: Fix KVM path expansion glob'
002/11:[----] [--] 'MAINTAINERS: Add an 'overall' entry for accelerators'
003/11:[----] [--] 'MAINTAINERS: Add an entry for the HAX accelerator'
004/11:[down] 'rules.mak: Add startwith() rule'
005/11:[0025] [FC] 'rules.mak: Add base-arch() rule'
006/11:[----] [--] 'Makefile: Remove dangerous EOL trailing backslash'
007/11:[----] [--] 'Makefile: Write MINIKCONF variables as one entry per line'
008/11:[----] [--] 'accel/Kconfig: Extract accel selectors into their own config'
009/11:[----] [--] 'accel/Kconfig: Add the TCG selector'
010/11:[----] [--] 'Makefile: Allow target-specific optional Kconfig'
011/11:[----] [--] 'accel/tcg: Add stub for probe_access()'

Supersedes: <20200521195911.19685-1-philmd@redhat.com>

Philippe Mathieu-Daudé (11):
  MAINTAINERS: Fix KVM path expansion glob
  MAINTAINERS: Add an 'overall' entry for accelerators
  MAINTAINERS: Add an entry for the HAX accelerator
  rules.mak: Add startwith() rule
  rules.mak: Add base-arch() rule
  Makefile: Remove dangerous EOL trailing backslash
  Makefile: Write MINIKCONF variables as one entry per line
  accel/Kconfig: Extract accel selectors into their own config
  accel/Kconfig: Add the TCG selector
  Makefile: Allow target-specific optional Kconfig
  accel/tcg: Add stub for probe_access()

 Makefile               | 15 +++++++++++----
 rules.mak              | 34 ++++++++++++++++++++++++++++++++++
 accel/stubs/tcg-stub.c |  7 +++++++
 Kconfig.host           |  7 -------
 MAINTAINERS            | 19 ++++++++++++++++++-
 accel/Kconfig          |  9 +++++++++
 6 files changed, 79 insertions(+), 12 deletions(-)
 create mode 100644 accel/Kconfig

-- 
2.21.3


