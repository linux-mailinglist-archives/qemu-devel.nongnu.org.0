Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A274631C1B
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Nov 2022 09:54:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ox2WI-0003TY-1Q; Mon, 21 Nov 2022 03:51:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ox2WF-0003Sc-GI
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 03:51:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ox2WD-00019n-Sz
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 03:51:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669020669;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r1ncKr9tFD+zpCOsE2YHiQ9G4LMwiA46HinCnVKxoNg=;
 b=W2sC44F0gGWt2GQAmtTm+LtoUN0QT307lVxiJJfWbQa2AQF0pv8XksrCivJBi42jXOXOdf
 djMXeXBYkgSaMhqbcuM3l2C+U7EcdQ5V5o8KrrIWr232Jiq+6A6G0RLJKZqgnsEgw8Vxiu
 h3ade83WkZ737q8J4I58Oba3DWE4C0g=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-261-wcMltAgJO5-9GH3BRXrYzA-1; Mon, 21 Nov 2022 03:51:01 -0500
X-MC-Unique: wcMltAgJO5-9GH3BRXrYzA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E8EB4833A0E;
 Mon, 21 Nov 2022 08:51:00 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C5CEF492B11;
 Mon, 21 Nov 2022 08:51:00 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 6756121E65C5; Mon, 21 Nov 2022 09:50:54 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: eblake@redhat.com,
	vsementsov@yandex-team.ru
Subject: [PATCH 10/10] io: Tidy up fat-fingered parameter name
Date: Mon, 21 Nov 2022 09:50:54 +0100
Message-Id: <20221121085054.683122-11-armbru@redhat.com>
In-Reply-To: <20221121085054.683122-1-armbru@redhat.com>
References: <20221121085054.683122-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 include/io/channel.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/io/channel.h b/include/io/channel.h
index c680ee7480..f1b7e05f81 100644
--- a/include/io/channel.h
+++ b/include/io/channel.h
@@ -350,7 +350,7 @@ int qio_channel_readv_all(QIOChannel *ioc,
 int qio_channel_writev_all(QIOChannel *ioc,
                            const struct iovec *iov,
                            size_t niov,
-                           Error **erp);
+                           Error **errp);
 
 /**
  * qio_channel_readv:
-- 
2.37.3


