Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB916E4951
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Apr 2023 15:06:02 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1poOYL-0006Hn-Ae; Mon, 17 Apr 2023 09:05:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1poOYJ-0006HW-9F
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 09:05:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1poOYH-0006Fv-O1
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 09:05:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681736749;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=Kf/ii9SogTpq4omY/zAP0IzHlz9wZSR8cPyTmkNzw7M=;
 b=YTUeBPJzGzfBrlxhWs7aVL37Y2GbEo13nFaXC7nRmOgWROOYPJStu7aovuSJN1qW0BnfpG
 7mXmtwtSNWom5zxpHaXMaEgRMvJgPQnBA0xzHpyWBSTfhm/NUYhMwWKbCBUqSSGwesvI2P
 nEIgiwyQ0yXmVilP7hjw+vhhvoC9v9s=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-359-QeqLwJdPOAarjIIE8PAyZw-1; Mon, 17 Apr 2023 09:05:44 -0400
X-MC-Unique: QeqLwJdPOAarjIIE8PAyZw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DDB233C10149;
 Mon, 17 Apr 2023 13:00:40 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.172])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 84F9B2166B26;
 Mon, 17 Apr 2023 13:00:39 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: peter.maydell@linaro.org, qemu-devel@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: Fan Ni <fan.ni@samsung.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 0/2] Re-enable qom-cast-debug by default
Date: Mon, 17 Apr 2023 15:00:35 +0200
Message-Id: <20230417130037.236747-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
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

This switch had been disabled by default by accident in commit
c55cf6ab03f. But we should enable it by default instead to avoid
regressions in the QOM device hierarchy.

Two bugs crept in while we had it disabled. One has been fixed
by Peter in commit 6c50845a91 ("hw/i2c/allwinner-i2c: Fix subclassing
of TYPE_AW_I2C_SUN6I") already, the other one can be found in the
file hw/pci-bridge/pci_expander_bridge.c - this first needs some
clarification how the device hierarchy should look like here.
Revert the patch that introduce the bug for the time being until
a proper replacement is available.

Thomas Huth (2):
  Revert "hw/pxb-cxl: Support passthrough HDM Decoders unless
    overridden"
  meson_options.txt: Enable qom-cast-debug by default again

 include/hw/cxl/cxl.h                |  1 -
 include/hw/cxl/cxl_component.h      |  1 -
 include/hw/pci/pci_bridge.h         |  1 -
 hw/cxl/cxl-host.c                   | 31 ++++++++------------
 hw/pci-bridge/pci_expander_bridge.c | 44 ++++-------------------------
 meson_options.txt                   |  2 +-
 scripts/meson-buildoptions.sh       |  2 +-
 7 files changed, 19 insertions(+), 63 deletions(-)

-- 
2.31.1


