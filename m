Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB3C2B2EA6
	for <lists+qemu-devel@lfdr.de>; Sat, 14 Nov 2020 17:53:32 +0100 (CET)
Received: from localhost ([::1]:57366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdynr-00019m-98
	for lists+qemu-devel@lfdr.de; Sat, 14 Nov 2020 11:53:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kdymG-0008RO-U2
 for qemu-devel@nongnu.org; Sat, 14 Nov 2020 11:51:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:37687)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kdymE-0000RF-Eo
 for qemu-devel@nongnu.org; Sat, 14 Nov 2020 11:51:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605372708;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=WM3VyNUlHk9uyaZtc5pH+5uiZLsHpx37zVoLdLjxnNg=;
 b=EVf/4tn56AYf7uUTwQ7SH0LGfrdTE50fTYMVc9xPi/zwbCABE6DNdPKPNKagrBH1vTv0g/
 XeVeCOKCNxTNF1k6694T3q6839AzZ9hD+1dQI4gge2c7uPYIM8/+lpPRCyX2MjdHl6Rx4R
 T/Rpv9tH0GHzqwV/+GhRmqFPvrLGeS8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-42-bG5bhpA9O--3w11UPNpFPA-1; Sat, 14 Nov 2020 11:51:46 -0500
X-MC-Unique: bG5bhpA9O--3w11UPNpFPA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BFB031842160;
 Sat, 14 Nov 2020 16:51:44 +0000 (UTC)
Received: from thuth.com (ovpn-112-86.ams2.redhat.com [10.36.112.86])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 69F545F7D8;
 Sat, 14 Nov 2020 16:51:39 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for-5.2? 0/4] Fix build failures on Haiku
Date: Sat, 14 Nov 2020 17:51:33 +0100
Message-Id: <20201114165137.15379-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/14 11:51:48
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alexander von Gluck IV <kallisti5@unixzen.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 David CARLIER <devnexen@gmail.com>, kraxel@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Some patches to fix build failures on Haiku, and the final patch
adds a VM for testing compilation there. "make check" is still
failing, but at least compiling of the sources can now be tested.

Alexander von Gluck IV (1):
  tests/vm: Add Haiku test based on their vagrant images

Thomas Huth (3):
  configure: Fix the _BSD_SOURCE define for the Haiku build
  configure: Do not build pc-bios/optionrom on Haiku
  configure: Add a proper check for sys/ioccom.h and use it in
    tpm_ioctl.h

 backends/tpm/tpm_ioctl.h  |   4 ++
 configure                 |  15 ++++-
 nbd/nbd-internal.h        |   2 +-
 tests/keys/vagrant        |  27 +++++++++
 tests/keys/vagrant.pub    |   1 +
 tests/vm/Makefile.include |   3 +-
 tests/vm/basevm.py        |   5 +-
 tests/vm/haiku.x86_64     | 119 ++++++++++++++++++++++++++++++++++++++
 8 files changed, 169 insertions(+), 7 deletions(-)
 create mode 100644 tests/keys/vagrant
 create mode 100644 tests/keys/vagrant.pub
 create mode 100755 tests/vm/haiku.x86_64

-- 
2.18.4


