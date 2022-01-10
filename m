Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAE9948A005
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 20:18:30 +0100 (CET)
Received: from localhost ([::1]:44968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n70BZ-0006Ly-Jk
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 14:18:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1n707M-0003bT-32
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 14:14:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30383)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1n707H-0004Jz-Cz
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 14:14:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641842038;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=xC2zdwVwk2MI/TzIYmIEh5TVMT8xX1s3O9fhcNpsTJs=;
 b=jO3D4QhUhlpLfXKARukB8gQXpL/v8k70SrVOyfe7ExHUTv1sXRwcEMPCLlp6Jl5gkLUNBE
 RnW76J7C94/8pecr7w5GyQfcl43egABuvCiFAn2hVeE+MrDgObRCsdfA6kZNbq60fXD9Tw
 wAudIPTPXcriwRfjnaegg6DvSuIRgfw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-412-w6Jsrn97Pk6VgObwKSxWjQ-1; Mon, 10 Jan 2022 14:13:55 -0500
X-MC-Unique: w6Jsrn97Pk6VgObwKSxWjQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E182883DD2E;
 Mon, 10 Jan 2022 19:13:53 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.33.97])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2E66216A4D;
 Mon, 10 Jan 2022 19:13:50 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] python: fix for mypy 0.930 and pylint dependencies
Date: Mon, 10 Jan 2022 14:13:46 -0500
Message-Id: <20220110191349.1841027-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.597,
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
Cc: Eduardo Habkost <eduardo@habkost.net>, John Snow <jsnow@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

GitLab: https://gitlab.com/jsnow/qemu/-/commits/python-ci-fix-2022-jan=0D
CI: https://gitlab.com/jsnow/qemu/-/pipelines/445011098=0D
=0D
Dependencies in the Python ecosystem were updated and caused CI failures=0D
immediately after leaving for PTO. This series fixes those breakages,=0D
thank you for your patience.=0D
=0D
This patchset fixes the 'check-python-tox' job that was previously=0D
configured as 'allowed to fail'. I'm not re-enabling it to always run at=0D
present, maybe leaving it as an optional job is fine for now. The=0D
purpose of the job is primarily to find new breakages on cutting edge=0D
deployments of Python, which means that it's fairly likely to chirp as=0D
regressions are discovered.=0D
=0D
Generally, I like seeing those regressions so I can keep on top of=0D
fixing them -- however, in practice, it seems as if what this really=0D
means is that every last time I go on PTO, they break for several weeks=0D
in an amazing coincidence.=0D
=0D
Oh well.=0D
=0D
When submitting Python changes in the future, please just check that=0D
this CI test ran to ensure that it works well on all supported Python=0D
interpreter versions.=0D
=0D
John Snow (3):=0D
  python/aqmp: use absolute import statement=0D
  Python/aqmp: fix type definitions for mypy 0.920=0D
  python: update type hints for mypy 0.930=0D
=0D
 python/qemu/aqmp/aqmp_tui.py  | 3 ++-=0D
 python/qemu/aqmp/protocol.py  | 5 +++--=0D
 python/qemu/qmp/qom_common.py | 6 +-----=0D
 3 files changed, 6 insertions(+), 8 deletions(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D


