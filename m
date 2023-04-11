Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 636BC6DE3FC
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 20:35:30 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmIpB-0007qw-0L; Tue, 11 Apr 2023 14:34:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pmIp9-0007qP-IP
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 14:34:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pmIp8-0007si-5N
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 14:34:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681238073;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=fdd7RPRSIdV+Rbc1CNo3G1V4vxxJVnctswlmoEhCn8g=;
 b=UGCRLA4irBkYvCehRYS50zUcGao/8g5u+R6FBbg/uBPXOgKp3XR0e6LW2/blXT2yzg4dEp
 KNBvbHs1u+rVDtRdlfKYbfwgCqo3zb/QQE/dZe/7Bf7D+qs40bKL5c6uda1syYLeE7UK29
 8l8zO1AHb2MU9R63Q8IJY3HcXuWHjuk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-64-HgLh90kdO222Ylxt6sKcyw-1; Tue, 11 Apr 2023 14:34:22 -0400
X-MC-Unique: HgLh90kdO222Ylxt6sKcyw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 068A33C0F236;
 Tue, 11 Apr 2023 18:34:22 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.108])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D9F5540BC797;
 Tue, 11 Apr 2023 18:34:19 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH for-8.1 0/3] Make softmmu/qtest.c target independent
Date: Tue, 11 Apr 2023 20:34:15 +0200
Message-Id: <20230411183418.1640500-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

For being able to build universal binaries one day, we need certain
files to be independent from the emulated target. qtest.c is one of
these files. Rework the target specific code in there so we can
finally move it from "specific_ss" to "softmmu_ss".

Thomas Huth (3):
  softmmu/qtest: Move the target-specific pseries RTAS code out of
    qtest.c
  include/exec: Provide the tswap() functions for target independent
    code, too
  softmmu: Make qtest.c target independent

 include/exec/cpu-all.h | 64 +------------------------------------
 include/exec/tswap.h   | 72 ++++++++++++++++++++++++++++++++++++++++++
 include/sysemu/qtest.h |  4 +++
 hw/ppc/spapr_rtas.c    | 29 +++++++++++++++++
 softmmu/qtest.c        | 51 +++++++++++-------------------
 softmmu/meson.build    |  2 +-
 6 files changed, 126 insertions(+), 96 deletions(-)
 create mode 100644 include/exec/tswap.h

-- 
2.31.1


