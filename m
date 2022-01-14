Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B216548E510
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 08:53:38 +0100 (CET)
Received: from localhost ([::1]:39278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8HOu-00038w-8c
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 02:53:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1n8GUc-0007bO-7q
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 01:55:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54932)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1n8GUa-0007VM-Dr
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 01:55:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642143319;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1GEfWL0kEFWTDAfXqybxrqJZ/5obPWqJ16n9KOeqRpU=;
 b=Uvgo4SKc8kg9hb6q7vqMYzlVDRsvYqZVaVO5gDzpfNZRLbSnf0yywFogyMv0MtNLPrbbeo
 vY4+zK1/57SDxCuT1xFp9lf25Kabyki3hCAWx15regN5TaQZF/TgKYSfGuoI+SxH0CHsIr
 bjTYmfJe1HtSj2Tid6hsoaCEM2kKi7g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-78-BZAB1_FONn6jXxoGbMf2-w-1; Fri, 14 Jan 2022 01:55:16 -0500
X-MC-Unique: BZAB1_FONn6jXxoGbMf2-w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D000D80D680;
 Fri, 14 Jan 2022 06:55:14 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6F00310589D9;
 Fri, 14 Jan 2022 06:55:14 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id B8C48180078F; Fri, 14 Jan 2022 07:53:26 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 07/20] ui/dbus: fix buffer-overflow detected by ASAN
Date: Fri, 14 Jan 2022 07:53:13 +0100
Message-Id: <20220114065326.782420-8-kraxel@redhat.com>
In-Reply-To: <20220114065326.782420-1-kraxel@redhat.com>
References: <20220114065326.782420-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

On the last added dbus patch, I left a tiny BO:

==441487==ERROR: AddressSanitizer: heap-buffer-overflow on address 0x611000025a70 at pc 0x7f0817bb764c bp 0x7ffde672ae60 sp 0x7ffde672ae58
WRITE of size 8 at 0x611000025a70 thread T0
    #0 0x7f0817bb764b in dbus_vc_class_init ../ui/dbus.c:401

A cookie for ASAN! not you C :)

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Fixes: 7f767ca35e5 ("ui/dbus: register D-Bus VC handler")
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20211222144032.443424-1-marcandre.lureau@redhat.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 ui/dbus.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/ui/dbus.c b/ui/dbus.c
index b2c1c9fb522c..0074424c1fed 100644
--- a/ui/dbus.c
+++ b/ui/dbus.c
@@ -405,6 +405,7 @@ dbus_vc_class_init(ObjectClass *oc, void *data)
 static const TypeInfo dbus_vc_type_info = {
     .name = TYPE_CHARDEV_VC,
     .parent = TYPE_CHARDEV_DBUS,
+    .class_size = sizeof(DBusVCClass),
     .class_init = dbus_vc_class_init,
 };
 
-- 
2.34.1


