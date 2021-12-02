Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 549F5465EBB
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Dec 2021 08:30:02 +0100 (CET)
Received: from localhost ([::1]:40136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msgXZ-0006Up-2h
	for lists+qemu-devel@lfdr.de; Thu, 02 Dec 2021 02:30:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1msg9P-0005Us-3S
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 02:05:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37191)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1msg9N-0006FG-IZ
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 02:05:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638428700;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mybjs1fNoQk2Cjo30eilBMVovOmwjaKUm2k9+ozyX2E=;
 b=h0H0QdTnXSk3kY7NuM2+y7AIQs5W9cJWJZWDeWGYC4c6Rvw7f1FvKp9hOApt9IZ2EU+LUi
 jG/jEgdp8xzC+n+4c/bqDNMJbvx3eInrBi7k4V8RHhBy8VrwZbidrU3RXegujs6clg47pM
 ygKwb5QZ6eOqZNH2tjJCsvv2J2Zqt5Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-159-Gyz7kLA6M3uxqPWVrGvZVw-1; Thu, 02 Dec 2021 02:04:57 -0500
X-MC-Unique: Gyz7kLA6M3uxqPWVrGvZVw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0A7451853022;
 Thu,  2 Dec 2021 07:04:56 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 95F9060C0F;
 Thu,  2 Dec 2021 07:04:51 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 1BB41113861E; Thu,  2 Dec 2021 08:04:50 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC 04/11] vl: Hardcode a VGA device for now
Date: Thu,  2 Dec 2021 08:04:43 +0100
Message-Id: <20211202070450.264743-5-armbru@redhat.com>
In-Reply-To: <20211202070450.264743-1-armbru@redhat.com>
References: <20211202070450.264743-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: damien.hedde@greensocs.com, berrange@redhat.com, mark.burton@greensocs.com,
 edgar.iglesias@gmail.co, mirela.grujic@greensocs.com,
 marcandre.lureau@redhat.com, pbonzini@redhat.com, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

My axing of the CLI also axed the (moderately complicated) code that
posts a request to the board to create a VGA device.  Hardcode such a
request, to facilitate manual testing.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 softmmu/vl.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/softmmu/vl.c b/softmmu/vl.c
index b14db0f47f..07be92d5c0 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -534,6 +534,9 @@ static void qemu_create_default_devices(void)
     if (dpy.type == DISPLAY_TYPE_DEFAULT) {
         dpy.type = DISPLAY_TYPE_NONE;
     }
+
+    /* HACK: hardcoded VGA device */
+    vga_interface_type = VGA_STD;
 }
 
 Chardev *serial_hd(int i)
-- 
2.31.1


