Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2466476C41
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 09:54:42 +0100 (CET)
Received: from localhost ([::1]:59048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxmXB-0004vq-Ov
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 03:54:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mxmUP-0000Ze-DI
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 03:51:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49967)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mxmUM-00049O-HV
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 03:51:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639644705;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=N+badxruaui6F9xoQm2B1/OZwZL6XU4d/byVZYxDQsY=;
 b=R7z0rAgCY6PpiNkh2Apz0WVvBmqV0lIBT1ykK7LDczlL57zzJHCVt2HknGs36Ob5ErNpIR
 pQEzvE6rvl3SvnAW65j7Zf5Qlm5a0bBzX/HfMo0+qaliVkp5XiQWSmLzte5iZfzO4A3k3Z
 Z4SBArBip2aUPI3fx9nZFHzwASKg18Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-205-ojl5B9YSO7G0fEDm5H2uRQ-1; Thu, 16 Dec 2021 03:51:42 -0500
X-MC-Unique: ojl5B9YSO7G0fEDm5H2uRQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0E21B801B25
 for <qemu-devel@nongnu.org>; Thu, 16 Dec 2021 08:51:41 +0000 (UTC)
Received: from avogadro.mxp.redhat.com (unknown [10.39.194.194])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8231F2BE77
 for <qemu-devel@nongnu.org>; Thu, 16 Dec 2021 08:51:40 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 00/10] configure cleanups, mostly wrt $cpu and $targetos
Date: Thu, 16 Dec 2021 09:51:29 +0100
Message-Id: <20211216085139.99682-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The bulk is in patches 2 to 9; they unify the names of architectures
between configure and meson, and remove the ARCH symbol from
configure.  It is only used during QEMU build, so it can be derived
from host_machine.cpu_family(), instead of having to pass it in
config-host.mak.

Paolo Bonzini (10):
  configure: simplify creation of plugin symbol list
  configure: make $targetos lowercase, use windows instead of MINGW32
  configure: move target detection before CPU detection
  configure: do not set bsd_user/linux_user early
  configure: unify two case statements on $cpu
  configure: unify ppc64 and ppc64le
  configure: unify x86_64 and x32
  meson: rename "arch" variable
  configure, meson: move ARCH to meson.build
  configure: remove unnecessary symlinks

 configure              | 283 +++++++++++++++++------------------------
 meson.build            |  39 +++---
 pc-bios/meson.build    |   2 +-
 plugins/meson.build    |  13 +-
 tests/tcg/configure.sh |   4 +-
 5 files changed, 155 insertions(+), 186 deletions(-)

-- 
2.33.1


