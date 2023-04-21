Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6073F6EA8CE
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 13:05:23 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppoYY-0002d8-Dt; Fri, 21 Apr 2023 07:03:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ppoYW-0002cr-PQ
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 07:03:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ppoYU-0002Gb-Cl
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 07:03:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682075032;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=YIJtDbG3OayU/W6Zcf/OjGztI5v0eORYpxV6WTHEZnk=;
 b=eGTI/8/Kt4ZaP+u9+R74dppUWqZ5zYXIG2i9bvjgJI/Ac8tusiMpC91fs6i15pejaUpVIB
 MSCdOjUalI/g1d1pxRTliKlJgs3lNqKgO9rxSvudcet7zhECYPZHF+FGojXdS8N8DGlzOi
 qdKeodxxG49DhLnXZDaHKPzT3CUHf2g=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-532-Y_vZUkkKOlW0_-QL-qNSHg-1; Fri, 21 Apr 2023 07:03:49 -0400
X-MC-Unique: Y_vZUkkKOlW0_-QL-qNSHg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 131C71C0A5A7;
 Fri, 21 Apr 2023 11:03:49 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.14])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 87E0B140EBF4;
 Fri, 21 Apr 2023 11:03:47 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Cleber Rosa <crosa@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 Joel Stanley <joel@jms.id.au>, qemu-arm@nongnu.org
Subject: [PATCH 0/3] tests/avocado/machine_aspeed: Fix the broken
 ast2[56]00_evb_sdk tests
Date: Fri, 21 Apr 2023 13:03:42 +0200
Message-Id: <20230421110345.1294131-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Fix the broken ast2500_evb_sdk and ast2600_evb_sdk avocado tests.
See the patch description of the second patch for details.
Also add the test to the MAINTAINERS file (third patch).

Thomas Huth (3):
  tests/avocado: Make ssh_command_output_contains() globally available
  tests/avocado/machine_aspeed: Fix the broken ast2[56]00_evb_sdk tests
  MAINTAINERS: Cover tests/avocado/machine_aspeed.py

 MAINTAINERS                            |  2 +-
 tests/avocado/avocado_qemu/__init__.py |  8 +++++++
 tests/avocado/linux_ssh_mips_malta.py  |  8 -------
 tests/avocado/machine_aspeed.py        | 31 +++++++++++++++-----------
 4 files changed, 27 insertions(+), 22 deletions(-)

-- 
2.31.1


