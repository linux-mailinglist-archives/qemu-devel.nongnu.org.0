Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 532A74D203F
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 19:28:59 +0100 (CET)
Received: from localhost ([::1]:59446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nReZu-0005eE-Dn
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 13:28:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1nReWA-0007W8-6I
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 13:25:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28038)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1nReW6-0003qF-Lc
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 13:25:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646763900;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=F3S6Kat5SS1VGdckFRG9k5PgrTWoLl9FFwrQYcG/XLY=;
 b=eZ7w/6ZSbsVJdAAm1KS8Pw92/fo9x8bN8FvOBAjwUZ12J7YcTMmIioDI9vei6XE8yFtsEp
 LLZXB1XqmgzNbt+P18vyJKnE9venAFc0//g5aw/s9Sttomwzqn7sgGAxwaV0TlVXKs7VXa
 79C8iBdp6pOV1JoY1ieCzE07DrS8tTc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-588-gLvb3nNpPMGdbgQSPvpnQw-1; Tue, 08 Mar 2022 13:24:57 -0500
X-MC-Unique: gLvb3nNpPMGdbgQSPvpnQw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5F8F6801AEB;
 Tue,  8 Mar 2022 18:24:56 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.192.90])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 89A1586C44;
 Tue,  8 Mar 2022 18:24:54 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
 drjones@redhat.com, f4bug@amsat.org, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Subject: [PATCH 0/2] hw/arm/virt: Fix make check-qtest-aarch64 when
 CONFIG_ARM_GIC_TCG is unset
Date: Tue,  8 Mar 2022 19:24:50 +0100
Message-Id: <20220308182452.223473-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

When CONFIG_ARM_GIC_TCG is unset, qtests fail with
ERROR:../qom/object.c:715:object_new_with_type: assertion failed: (type != NULL)

This is due to the fact a bunch tests use gic-version=max which
currectly unconditionally selects GICv3, ignoring the fact this
latter may have been disabled.

This series renames CONFIG_ARM_GIC_TCG into CONFIG_ARM_GICv3_TCG.
Also it selects GICv2 if gic-version=max and CONFIG_ARM_GICV3_TCG is
unset, in TCG mode. With those fixes qtests pass along with
virt machine node.

Best Regards

Eric

This series can be found at:
https://github.com/eauger/qemu/tree/gicv3_tcg_v3

Eric Auger (2):
  hw/intc: Rename CONFIG_ARM_GIC_TCG into CONFIG_ARM_GICV3_TCG
  hw/arm/virt: Fix gic-version=max when CONFIG_ARM_GICV3_TCG is unset

 hw/arm/virt.c       | 7 ++++++-
 hw/intc/Kconfig     | 2 +-
 hw/intc/meson.build | 4 ++--
 3 files changed, 9 insertions(+), 4 deletions(-)

-- 
2.26.3


