Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E81BB6F5A7C
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 16:56:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puDtk-0006cI-K9; Wed, 03 May 2023 10:56:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1puDth-0006be-Un
 for qemu-devel@nongnu.org; Wed, 03 May 2023 10:56:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1puDtd-0003I7-Ev
 for qemu-devel@nongnu.org; Wed, 03 May 2023 10:56:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683125756;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=f95CoL5PsdxnUfut2z0iqGLkNAyfRryDBfYPGpOxM5I=;
 b=NwS8gBqV1HDfl7/E30tSFoWnCE4lZCC2iSdCsPOxIaPRKudaZmoOjpxdgZMtn7vt7I5v8q
 qBdY0sJY4B2fL1mbW7gMacoPOfAdcxmPMzUmSUhLwsJL6JgHt4248ysYSnECdRDS/6CTog
 agwDtWCFfFzJCL2jdYwJVrWadU47BOI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-441-Nul3pRgoN6K64_Bg9M9q8g-1; Wed, 03 May 2023 10:55:52 -0400
X-MC-Unique: Nul3pRgoN6K64_Bg9M9q8g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5037D29AA388;
 Wed,  3 May 2023 14:55:52 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.42.28.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 41C6AC15BAD;
 Wed,  3 May 2023 14:55:48 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 0/2] gitlab: improve artifact handling
Date: Wed,  3 May 2023 15:55:33 +0100
Message-Id: <20230503145535.91325-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

We are missing test log artifacts from various check jobs on failure,
and also missing test logs from the coverage job

Daniel P. Berrangé (2):
  gitlab: explicit set artifacts publishing criteria
  gitlab: ensure coverage job also publishes meson log

 .gitlab-ci.d/buildtest-template.yml  | 4 +++-
 .gitlab-ci.d/buildtest.yml           | 5 +++++
 .gitlab-ci.d/crossbuild-template.yml | 1 +
 .gitlab-ci.d/crossbuilds.yml         | 2 ++
 .gitlab-ci.d/custom-runners.yml      | 1 +
 .gitlab-ci.d/opensbi.yml             | 1 +
 6 files changed, 13 insertions(+), 1 deletion(-)

-- 
2.40.1


