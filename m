Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 616FA6E2652
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Apr 2023 16:59:58 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pnKt7-0005uG-LU; Fri, 14 Apr 2023 10:58:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pnKt6-0005u0-6e
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 10:58:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pnKt4-0001iG-PZ
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 10:58:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681484333;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=3A8RSEpsrdMaeaFFTy2ib4wgqdVoqicrncPCoiK4B3A=;
 b=RiOoxudNY0nUcXSFWn8SombHM9pdwIbI7S2zzE3R9Wv4i68WqUM26Ak01tOPJq0G8ksuK3
 wiCPu4/rWw5C1y6VXPuYMzFpwzFtCCjnUbVfdLjlSOZLGms5T+yLqUlvra97McaxfvkeH3
 /KJp98OGl9si5h+K8pShRhYfyuE1mdc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-257-vZaGlbMZPjytwtHf3Nw43A-1; Fri, 14 Apr 2023 10:58:49 -0400
X-MC-Unique: vZaGlbMZPjytwtHf3Nw43A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0903D85A588;
 Fri, 14 Apr 2023 14:58:49 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.15])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 878E335453;
 Fri, 14 Apr 2023 14:58:47 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Eldon Stegall <eldon-qemu@eldondev.com>, Camilla Conte <cconte@redhat.com>
Subject: [PATCH 0/2] Improvements for the device-crash-test jobs
Date: Fri, 14 Apr 2023 16:58:43 +0200
Message-Id: <20230414145845.456145-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
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

Improve the runtime of the device-crash-test jobs by avoiding
to run "configure" again and by forcing to test with TCG only
(instead of testing twice, with TCG and KVM).

Thomas Huth (2):
  gitlab-ci: Avoid to re-run "configure" in the device-crash-test jobs
  scripts/device-crash-test: Add a parameter to run with TCG only

 .gitlab-ci.d/buildtest.yml | 6 +++---
 scripts/device-crash-test  | 4 +++-
 2 files changed, 6 insertions(+), 4 deletions(-)

-- 
2.31.1


