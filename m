Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D58E751FD95
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 15:08:57 +0200 (CEST)
Received: from localhost ([::1]:35190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1no38C-0005zc-KK
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 09:08:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1no2hu-0006l8-1E
 for qemu-devel@nongnu.org; Mon, 09 May 2022 08:41:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21795)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1no2hq-00005y-Pt
 for qemu-devel@nongnu.org; Mon, 09 May 2022 08:41:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652100101;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=GeXrYRU+mapB2NmiDKgLLtRL781yGN6CM5bCQLcClzw=;
 b=KRPOt2+6TXaPXvlV4tCDLTHbq6F/P4xsAOXo5dT+L8FkbLf9DCS8NpIrpO4dkwxpyQhhwP
 fe3UTSuONhJkHvbj684MitHSI2UitCNa1Cy2Y+OXut/cV9vFE6JIk8Ef2Eex2iVuWlVZAA
 V/SgvTqFt8MY5Li+6ae1FzxPZgJVX1Q=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-68-S7ZmLntxMU-X9jGaO2kffA-1; Mon, 09 May 2022 08:41:38 -0400
X-MC-Unique: S7ZmLntxMU-X9jGaO2kffA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 00762800B21;
 Mon,  9 May 2022 12:41:38 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.145])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7F15714C18C0;
 Mon,  9 May 2022 12:41:36 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 0/2] ci: improve debuggability of I/O tests
Date: Mon,  9 May 2022 13:41:32 +0100
Message-Id: <20220509124134.867431-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Currently with the TAP harness we see essentially no useful information=0D
about the I/O tests execution. To pick a random job:=0D
=0D
  https://gitlab.com/qemu-project/qemu/-/jobs/2429330423=0D
=0D
All that we get is this:=0D
=0D
  184/204 qemu:block / qemu-iotests qcow2  OK  309.10s   116 subtests passe=
d=0D
=0D
The full details are in a testlog.txt file that isn't accessible. This=0D
series publishes that as an artifact. It further tweaks the TAP runner=0D
to print out when it is about to run a test, so we get a record of what=0D
was running, if the test harness gets terminated abnormally/prematurely=0D
=0D
Daniel P. Berrang=C3=A9 (2):=0D
  tests/qemu-iotests: print intent to run a test in TAP mode=0D
  .gitlab-ci.d: export meson testlog.txt as an artifact=0D
=0D
 .gitlab-ci.d/buildtest-template.yml | 12 ++++++++++--=0D
 tests/qemu-iotests/testrunner.py    |  3 +++=0D
 2 files changed, 13 insertions(+), 2 deletions(-)=0D
=0D
-- =0D
2.35.1=0D
=0D


