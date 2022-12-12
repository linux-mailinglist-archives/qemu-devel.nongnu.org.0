Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8915264A9FF
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 23:11:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4r12-0004ip-2S; Mon, 12 Dec 2022 17:11:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jmaloy@redhat.com>) id 1p4r10-0004iX-Jx
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 17:11:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jmaloy@redhat.com>) id 1p4r0y-0002oj-Qv
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 17:11:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670883071;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ilFWe1Vo1636SappEV25f8I7otsxme9wBA7l0r+fqSM=;
 b=VI3lK0y6k8Pg+8iKQCMsSlbFSHvHJxMF2nDLnHo+vmyGZfWd6lG4BLvyWJn08Gg+wbDQVV
 Q/2PxrkA0UPdTJIzXmnOGbPDMDBt1dQVjpDAB3DsNBAoImKntav0L+ljVfipv2D/xIWkiE
 kIN51z+I2Lp7GcOs/dC33BDBT5JdYAA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-638-v9ZuzWQeMtq-zXdgEfcFYg-1; Mon, 12 Dec 2022 17:11:07 -0500
X-MC-Unique: v9ZuzWQeMtq-zXdgEfcFYg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 736A585A59D;
 Mon, 12 Dec 2022 22:11:07 +0000 (UTC)
Received: from fenrir.redhat.com (unknown [10.22.8.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 080B8492B00;
 Mon, 12 Dec 2022 22:11:06 +0000 (UTC)
From: Jon Maloy <jmaloy@redhat.com>
To: qemu-devel@nongnu.org
Cc: marcandre.lureau@gmail.com, pbonzini@redhat.com, jmaloy@redhat.com,
 jasowang@redhat.com, philmd@linaro.com, stefanha@redhat.com
Subject: [PATCH v3 0/2] hw/usb: add configuration flags for emulated and
 passthru usb smartcard
Date: Mon, 12 Dec 2022 17:09:47 -0500
Message-Id: <20221212220949.1278269-1-jmaloy@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jmaloy@redhat.com;
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

We add three new configuration flags, LIBCACARD, USB_SMARTCARD_PASSTHRU
and USB_SMARTCARD_EMULATED in order to improve configurability of these
functionalities.

Signed-off-by: Jon Maloy <jmaloy@redhat.com>

---
v2: Added a LIBACARD flag, plus reversed 'select' clauses, as suggested
    by Paolo Bonzini and Marc-André Lureau.

v3: Split in two commits, so that LIBCACARD is added separately, as suggested
    by Philippe Mathieu-Daudé.


Jon Maloy (2):
  hw/usb: add configuration flags for emulated and passthru usb
    smartcard
  hw/usb: add configuration flag for Common Access Card library code

 Kconfig.host       |  3 +++
 hw/usb/Kconfig     | 14 ++++++++++++++
 hw/usb/meson.build | 11 ++++-------
 meson.build        |  1 +
 4 files changed, 22 insertions(+), 7 deletions(-)

-- 
2.35.3


