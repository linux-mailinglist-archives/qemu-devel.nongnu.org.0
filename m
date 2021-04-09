Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 200FD35A7CD
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 22:24:53 +0200 (CEST)
Received: from localhost ([::1]:46058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUxgS-0001Iv-4D
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 16:24:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lUxeb-0008Vy-MS
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 16:22:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52994)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lUxeZ-0004A1-KH
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 16:22:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617999774;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=NmQcB7+MoBLJbm1S6XdCvLUei0NPo8rvOPVBayKp2is=;
 b=Q/9MBQTFMIiXHJxoSc5xZPdj1LRGGUXqA1aXw6lxIwWuQEiZAUCM40CjCG1f+L+yjpPtNA
 9HKLfofO1a0AWZEcjSCU/9Nt93bGSzvg6q74PXn2aWLDESgffCxgIVC6uUVwO5tKZhUJhr
 AlnptBsh+DWTGdGMy90rWHjfU2plo/k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-382-s0HsAuGpPPGkmHYDY6HMgg-1; Fri, 09 Apr 2021 16:22:52 -0400
X-MC-Unique: s0HsAuGpPPGkmHYDY6HMgg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9BD26107ACCA;
 Fri,  9 Apr 2021 20:22:51 +0000 (UTC)
Received: from localhost (ovpn-118-57.rdu2.redhat.com [10.10.118.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5561460C05;
 Fri,  9 Apr 2021 20:22:47 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 0/2] x86 and CPU bug fixes for 6.0-rc3
Date: Fri,  9 Apr 2021 16:22:44 -0400
Message-Id: <20210409202246.1857179-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 471387aa1446e2583f372f79327cc0a8c802b4b4=
:=0D
=0D
  Merge remote-tracking branch 'remotes/cohuck-gitlab/tags/s390x-20210409' =
into staging (2021-04-09 17:21:18 +0100)=0D
=0D
are available in the Git repository at:=0D
=0D
  https://gitlab.com/ehabkost/qemu.git tags/x86-next-pull-request=0D
=0D
for you to fetch changes up to 0b47ec4b95ad1952e55e639711d442f8ec6e1345:=0D
=0D
  cpu/core: Fix "help" of CPU core device types (2021-04-09 16:05:16 -0400)=
=0D
=0D
----------------------------------------------------------------=0D
x86 and CPU bug fixes for 6.0-rc3=0D
=0D
* Add missing features to EPYC-Rome CPU model (Babu Moger)=0D
* Fix crash with "-device ...-cpu-core,help" (Greg Kurz)=0D
=0D
----------------------------------------------------------------=0D
=0D
Babu Moger (1):=0D
  i386: Add missing cpu feature bits in EPYC-Rome model=0D
=0D
Greg Kurz (1):=0D
  cpu/core: Fix "help" of CPU core device types=0D
=0D
 hw/cpu/core.c     | 10 ++++++++--=0D
 target/i386/cpu.c | 12 ++++++++++++=0D
 2 files changed, 20 insertions(+), 2 deletions(-)=0D
=0D
--=20=0D
2.30.2=0D
=0D


