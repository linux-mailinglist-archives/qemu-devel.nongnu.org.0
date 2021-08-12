Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD0753EAAA2
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Aug 2021 21:06:57 +0200 (CEST)
Received: from localhost ([::1]:36026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mEG2a-0000sW-Q7
	for lists+qemu-devel@lfdr.de; Thu, 12 Aug 2021 15:06:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mEG0K-0007uU-2M
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 15:04:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mEG0H-0007tO-0T
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 15:04:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628795072;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=I57//7HHmcGk+m36S2bhQZVknOyj3BnKymMlteUgRW4=;
 b=RxAbGXEGkxm/wCyyOdzoaGhrLNREJjXItg8+qvrjfKuuMpJ61J3AkJ/iB74QDBTQTP1VAo
 c9b+CgxbJSGD/vYEZeQZEuwOzGV7vlgGEtjuGzX+WrFErR7a9RinoR4XVdATWtRdDAEIVL
 qQ0STaNHXUWxWSVr9357KUZuy+yZ4GE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-123-bKa2lT2wNSiOieTSv2eixQ-1; Thu, 12 Aug 2021 15:04:30 -0400
X-MC-Unique: bKa2lT2wNSiOieTSv2eixQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1F8791F2D9;
 Thu, 12 Aug 2021 19:04:29 +0000 (UTC)
Received: from localhost (unknown [10.22.32.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DC2D560C04;
 Thu, 12 Aug 2021 19:04:28 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 0/1] Bug fix for -rc4
Date: Thu, 12 Aug 2021 15:04:27 -0400
Message-Id: <20210812190428.1352870-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a bug fix to be included in case we are going to have a=0D
6.1.0-rc4.  I don't think this bug alone should delay the release=0D
of QEMU 6.1.0.=0D
=0D
The following changes since commit 703e8cd6189cf699c8d5c094bc68b5f3afa6ad71=
:=0D
=0D
  Update version for v6.1.0-rc3 release (2021-08-10 19:08:09 +0100)=0D
=0D
are available in the Git repository at:=0D
=0D
  https://gitlab.com/ehabkost/qemu.git tags/machine-next-pull-request=0D
=0D
for you to fetch changes up to 0fa1eecc092feb5a4a373ff1fa761ad3a03ea2d9:=0D
=0D
  hw/core: fix error checkig in smp_parse (2021-08-12 14:58:50 -0400)=0D
=0D
----------------------------------------------------------------=0D
Bug fix for -rc4=0D
=0D
Bug fix:=0D
* Fix error checkig in smp_parse (Daniel P. Berrang=C3=A9)=0D
=0D
----------------------------------------------------------------=0D
=0D
Daniel P. Berrang=C3=A9 (1):=0D
  hw/core: fix error checkig in smp_parse=0D
=0D
 hw/core/machine.c | 2 +-=0D
 1 file changed, 1 insertion(+), 1 deletion(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D


