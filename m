Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D26974A4B2C
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 17:02:49 +0100 (CET)
Received: from localhost ([::1]:53600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEZ8h-0004Me-A4
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 11:02:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1nEYsA-0000lg-Ot
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 10:45:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28854)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1nEYs7-000212-7F
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 10:45:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643643937;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=bUNLEpFN+Ec9RUm+VjP9HI2fYZlpa9GA9vJvyz9yYmU=;
 b=Lu4+APCdVHPiLk3kcU48W/7LC21uGVHtLRj5pxISdUvTRdezkscdkSx4ZMRc9nzkP8LeP5
 MpzbuLgYjolxeq2qj7nZWX+/0wdsrdxQwP6An+7dFuczIkfKXkRfv/swlJ+s9Mx5W523wl
 MTeeD9D1DnOzN0Oao4aAi5H8aZgrRP0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-250-1ImHaqE1MAaOH6j2sKsLhg-1; Mon, 31 Jan 2022 10:45:36 -0500
X-MC-Unique: 1ImHaqE1MAaOH6j2sKsLhg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3DF381083F60;
 Mon, 31 Jan 2022 15:45:35 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.192.53])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BD2F67B9D1;
 Mon, 31 Jan 2022 15:45:32 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, thuth@redhat.com,
 lvivier@redhat.com, peter.maydell@linaro.org, drjones@redhat.com,
 f4bug@amsat.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 pbonzini@redhat.com
Subject: [PATCH 0/2] hw/arm/virt,
 qtests: Fix make check-qtest-aarch64 when CONFIG_ARM_GIC_TCG is unset
Date: Mon, 31 Jan 2022 16:45:29 +0100
Message-Id: <20220131154531.429533-1-eric.auger@redhat.com>
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
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.088,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When CONFIG_ARM_GIC_TCG is unset, qtests fail with
ERROR:../qom/object.c:715:object_new_with_type: assertion failed: (type != NULL)

This is due to the fact a bunch of tests currently depend on GICv3
availability. qom-test and test-hmp try to launch sbsa-ref
and xlnx-versal-virt which only support GICv3. Also a bunch of
tests use gic-version=max which currectly selects GICv3,
ignoring the fact this latter has been disabled.

This series proposes to ignore sbsa-ref and xlnx-versal-virt during
qos-test and test-hmp execution if CONFIG_ARM_GIC_TCG is unset.
Also it selects GICv2 if gic-version=max and CONFIG_ARM_GIC_TCG is
unset, in TCG mode. With those fixes make check passes.

Best Regards

Eric

This series can be found at:
https://github.com/eauger/qemu/tree/config_arm_gic_tcg_v1

Eric Auger (2):
  hw/arm/virt: Fix gic-version=max when CONFIG_ARM_GIC_TCG is unset
  tests/qtest: Special case sbsa-ref and xlnx-versal-virt if
    !CONFIG_ARM_GIC_TCG

 hw/arm/virt.c          | 4 ++++
 tests/qtest/libqtest.c | 6 ++++++
 2 files changed, 10 insertions(+)

-- 
2.26.3


