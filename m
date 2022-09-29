Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 550975EF43F
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 13:26:00 +0200 (CEST)
Received: from localhost ([::1]:47480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odrfy-0003ZY-NP
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 07:25:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1odrMK-0001F6-E4
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 07:05:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44497)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1odrMI-0001yY-SH
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 07:05:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664449538;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oG/PB1KRyUcZqqWhh8GisayAgLoEnGDi0gH30odmnTg=;
 b=If3Z7n95zpcF8jzOe7A3mlxe/z26wqNohK0zNlEeOhEoVSBTFndQZxO/DSuMVdgkcEgCnq
 V86MtE3YytpCiEHI5+YLD/w7JVqAxCBoL4rnb3YAlr1AMjNZDF6ZfL59JwjxmUJx92MpsM
 4tT7bD3Q5dn5c/tkcLyFtfFjvcuy+hs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-411-6UEsBaFeOg-CZQ71caUXJw-1; Thu, 29 Sep 2022 07:05:33 -0400
X-MC-Unique: 6UEsBaFeOg-CZQ71caUXJw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A631B1C05AC2;
 Thu, 29 Sep 2022 11:05:32 +0000 (UTC)
Received: from localhost (unknown [10.39.208.39])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DBAC61121339;
 Thu, 29 Sep 2022 11:05:31 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, Arwed Meyer <arwed.meyer@gmx.de>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PULL 5/8] serial: Allow unaligned i/o access
Date: Thu, 29 Sep 2022 15:05:05 +0400
Message-Id: <20220929110508.1323529-6-marcandre.lureau@redhat.com>
In-Reply-To: <20220929110508.1323529-1-marcandre.lureau@redhat.com>
References: <20220929110508.1323529-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.08,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Arwed Meyer <arwed.meyer@gmx.de>

Unaligned i/o access on serial UART works on real PCs.
This is used for example by FreeDOS CTMouse driver. Without this it
can't reset and detect serial mice.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/77
Signed-off-by: Arwed Meyer <arwed.meyer@gmx.de>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20220911181840.8933-6-arwed.meyer@gmx.de>
---
 hw/char/serial.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/char/serial.c b/hw/char/serial.c
index 7061aacbce..41b5e61977 100644
--- a/hw/char/serial.c
+++ b/hw/char/serial.c
@@ -961,6 +961,9 @@ void serial_set_frequency(SerialState *s, uint32_t frequency)
 const MemoryRegionOps serial_io_ops = {
     .read = serial_ioport_read,
     .write = serial_ioport_write,
+    .valid = {
+        .unaligned = 1,
+    },
     .impl = {
         .min_access_size = 1,
         .max_access_size = 1,
-- 
2.37.3


