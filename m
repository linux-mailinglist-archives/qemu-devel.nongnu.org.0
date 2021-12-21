Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EC8947C3D2
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 17:35:44 +0100 (CET)
Received: from localhost ([::1]:48904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzi75-00051R-1G
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 11:35:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mzi4k-0003Ug-Ag
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 11:33:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mzi4g-0004r5-9l
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 11:33:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640104388;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=+XjAzEqO+UNZhkokgFx9LXnnSqmYFMDG8XWia/Gzr4Y=;
 b=FxWgkLXtag1X/go7XjfqIXBEG16ADkdDc8c/Jm/g/TwjD+PmZWZZ5k/xoAGrv7g2FiHmzl
 V8l9xNCFzAudCCOvREkH9I8Ov2jE6jmD1ifxB0ZxvG+Q/qqXzB1SYyVPXYmz2lKWKNY58Z
 AuXVDABMkHD+Hr0QFym/nWiZdDLEfp0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-104-aZqMG2AVMPOmLAcNHQdsUQ-1; Tue, 21 Dec 2021 11:33:03 -0500
X-MC-Unique: aZqMG2AVMPOmLAcNHQdsUQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 93B4D1800D50;
 Tue, 21 Dec 2021 16:33:02 +0000 (UTC)
Received: from avogadro.lan (unknown [10.39.193.83])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 954E610911A5;
 Tue, 21 Dec 2021 16:33:01 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] build: some cleanups for common-user/ infrastructure
Date: Tue, 21 Dec 2021 17:32:57 +0100
Message-Id: <20211221163300.453146-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: lvivier@redhat.com, richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A belated review of the patches that introduced common-user/.
Limiting the interface that it expects from bsd-user/ and linux-user/
to an include/ subdirectory, and simplifying the mesonry that builds
the new directory.

Paolo Bonzini (3):
  meson: reuse common_user_inc when building files specific to user-mode
    emulators
  user: move common-user includes to a subdirectory of {bsd,linux}-user/
  meson: cleanup common-user/ build

 bsd-user/{ => include}/special-errno.h            |  0
 bsd-user/meson.build                              |  2 +-
 common-user/meson.build                           |  2 +-
 .../{ => include}/host/aarch64/host-signal.h      |  0
 linux-user/{ => include}/host/alpha/host-signal.h |  0
 linux-user/{ => include}/host/arm/host-signal.h   |  0
 linux-user/{ => include}/host/i386/host-signal.h  |  0
 linux-user/{ => include}/host/mips/host-signal.h  |  0
 linux-user/{ => include}/host/ppc/host-signal.h   |  0
 linux-user/{ => include}/host/ppc64/host-signal.h |  0
 linux-user/{ => include}/host/riscv/host-signal.h |  0
 linux-user/{ => include}/host/s390/host-signal.h  |  0
 linux-user/{ => include}/host/s390x/host-signal.h |  0
 linux-user/{ => include}/host/sparc/host-signal.h |  0
 .../{ => include}/host/sparc64/host-signal.h      |  0
 linux-user/{ => include}/host/x32/host-signal.h   |  0
 .../{ => include}/host/x86_64/host-signal.h       |  0
 linux-user/{ => include}/special-errno.h          |  0
 linux-user/meson.build                            |  4 ++--
 meson.build                                       | 15 ++-------------
 20 files changed, 6 insertions(+), 17 deletions(-)
 rename bsd-user/{ => include}/special-errno.h (100%)
 rename linux-user/{ => include}/host/aarch64/host-signal.h (100%)
 rename linux-user/{ => include}/host/alpha/host-signal.h (100%)
 rename linux-user/{ => include}/host/arm/host-signal.h (100%)
 rename linux-user/{ => include}/host/i386/host-signal.h (100%)
 rename linux-user/{ => include}/host/mips/host-signal.h (100%)
 rename linux-user/{ => include}/host/ppc/host-signal.h (100%)
 rename linux-user/{ => include}/host/ppc64/host-signal.h (100%)
 rename linux-user/{ => include}/host/riscv/host-signal.h (100%)
 rename linux-user/{ => include}/host/s390/host-signal.h (100%)
 rename linux-user/{ => include}/host/s390x/host-signal.h (100%)
 rename linux-user/{ => include}/host/sparc/host-signal.h (100%)
 rename linux-user/{ => include}/host/sparc64/host-signal.h (100%)
 rename linux-user/{ => include}/host/x32/host-signal.h (100%)
 rename linux-user/{ => include}/host/x86_64/host-signal.h (100%)
 rename linux-user/{ => include}/special-errno.h (100%)

-- 
2.33.1


