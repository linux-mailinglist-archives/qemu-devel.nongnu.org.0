Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57AC031BBCC
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 16:04:28 +0100 (CET)
Received: from localhost ([::1]:37736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBfQI-0006s0-Md
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 10:04:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lBfNB-0005Jt-BW
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 10:01:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56771)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lBfN9-0000ck-Kx
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 10:01:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613401270;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=588gEbBzsw2gnYATRW2WAFMJbcUiJZ8gwk+WOcIFlM8=;
 b=fln9eL7PxBNBpKzKOzy6N3gKm05jfEgVchCY2rbmlt31/uoN8LYZrigD17XIcVpaEBsPR+
 iD7abGRG7FkNxfl7ozuhbMKviVhp3Elzp+BEcL5DnA5VMxxd728+h6Nn81xWkiDZSSOvsl
 YubdvR89trHE0Xk8bT/Z5GBXurvWBYA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-293-QRUcDjFpMUO8p0p6t7nvVQ-1; Mon, 15 Feb 2021 10:01:07 -0500
X-MC-Unique: QRUcDjFpMUO8p0p6t7nvVQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3E5DC1573F;
 Mon, 15 Feb 2021 15:01:05 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-113-28.ams2.redhat.com [10.36.113.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 45D6A5C241;
 Mon, 15 Feb 2021 15:01:04 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 01/11] qemu-storage-daemon: Enable object-add
Date: Mon, 15 Feb 2021 16:00:50 +0100
Message-Id: <20210215150100.436555-2-kwolf@redhat.com>
In-Reply-To: <20210215150100.436555-1-kwolf@redhat.com>
References: <20210215150100.436555-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As we don't have a fully QAPIfied version of object-add yet and it still
has 'gen': false in the schema, it needs to be registered explicitly in
init_qmp_commands() to be available for users.

Fixes: 2af282ec51a27116d0402cab237b8970800f870c
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20210204072137.19663-1-kwolf@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 storage-daemon/qemu-storage-daemon.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/storage-daemon/qemu-storage-daemon.c b/storage-daemon/qemu-storage-daemon.c
index d8d172cc60..9021a46b3a 100644
--- a/storage-daemon/qemu-storage-daemon.c
+++ b/storage-daemon/qemu-storage-daemon.c
@@ -144,6 +144,8 @@ static void init_qmp_commands(void)
     qmp_init_marshal(&qmp_commands);
     qmp_register_command(&qmp_commands, "query-qmp-schema",
                          qmp_query_qmp_schema, QCO_ALLOW_PRECONFIG);
+    qmp_register_command(&qmp_commands, "object-add", qmp_object_add,
+                         QCO_NO_OPTIONS);
 
     QTAILQ_INIT(&qmp_cap_negotiation_commands);
     qmp_register_command(&qmp_cap_negotiation_commands, "qmp_capabilities",
-- 
2.29.2


