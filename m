Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC16F454678
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 13:38:20 +0100 (CET)
Received: from localhost ([::1]:58132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnKCh-0001mZ-0M
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 07:38:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mnKAH-0006MP-2c
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 07:35:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27328)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mnKAE-0004aL-U0
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 07:35:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637152546;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=UCbU9e9Aj+rTdLPVr1cnKN/oRWoeIj3yxo6NpYdUWbk=;
 b=WZa9IrfD6vtrHXG6V7h+4j27lheUwqVAWentgqlBObP0slXn+Q0skN5kc1S3opiYxFV6zq
 1HBQKSRGqNmG9D28+OT3v7EwcWy1aDEcedrmetjR3eRjL0MfJeARHrnMZBZWts9r4dQkPn
 OKABDD4fAOseQKnuBP5HAwc2HB+SeVA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-453-8QrngRgHM0e5NrletEdNsQ-1; Wed, 17 Nov 2021 07:35:43 -0500
X-MC-Unique: 8QrngRgHM0e5NrletEdNsQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C309118125C0;
 Wed, 17 Nov 2021 12:35:41 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.192.245])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ECC981F452;
 Wed, 17 Nov 2021 12:35:37 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-6.2 v2 0/2] hw/nvme/ctrl: Fix buffer overrun
 (CVE-2021-3947)
Date: Wed, 17 Nov 2021 13:35:32 +0100
Message-Id: <20211117123534.2900334-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Gaurav Kamathe <gkamathe@redhat.com>, qemu-block@nongnu.org,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Klaus Jensen <its@irrelevant.dk>,
 Keith Busch <kbusch@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since v1:
- Do not add more buffer overflows in modify nvme_smart_info(),
  nvme_fw_log_info() and nvme_cmd_effects() (Klaus)
- Split nvme_error_info() change in another patch

Philippe Mathieu-Daudé (2):
  hw/nvme/ctrl: Fix buffer overrun in nvme_changed_nslist
    (CVE-2021-3947)
  hw/nvme/ctrl: Prevent buffer overrun in nvme_error_info()

 hw/nvme/ctrl.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

-- 
2.31.1


