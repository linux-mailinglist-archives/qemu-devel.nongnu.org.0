Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 058E448E4F3
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 08:43:20 +0100 (CET)
Received: from localhost ([::1]:58874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8HF1-0005Tg-3F
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 02:43:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1n8GUa-0007bG-Jc
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 01:55:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25613)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1n8GUW-0007Uw-TF
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 01:55:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642143316;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X7wUmoEWXNQW858mTc66O7eXLS6YBPIx9OaefQ+lC4s=;
 b=Y2B56XvGN3Ik9KlYsEAkAwtY32AaiLFsa4j7s1Mr1N1MEzWJ5yK49woEC1//TQBOa1l/1y
 0FKVztb6DsWi0jNEYmTrPOA+L2RcN269EE6qWqCeeFJEJQsK8LKRTCDxoniFKyevL/oOt1
 5xivPNUg26g/hhvSDKrwMKpbzUC/miQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-616-lVqwptcoPEqFDVINC8ujRg-1; Fri, 14 Jan 2022 01:55:13 -0500
X-MC-Unique: lVqwptcoPEqFDVINC8ujRg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0D2DA100D680;
 Fri, 14 Jan 2022 06:55:12 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D4DE45F91C;
 Fri, 14 Jan 2022 06:54:35 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 8EAE31800639; Fri, 14 Jan 2022 07:53:26 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 04/20] jackaudio: use ifdefs to hide unavailable functions
Date: Fri, 14 Jan 2022 07:53:10 +0100
Message-Id: <20220114065326.782420-5-kraxel@redhat.com>
In-Reply-To: <20220114065326.782420-1-kraxel@redhat.com>
References: <20220114065326.782420-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
 =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Volker Rümelin <vr_qemu@t-online.de>

On Windows the jack_set_thread_creator() function and on MacOS the
pthread_setname_np() function with a thread pointer paramater is
not available. Use #ifdefs to remove the jack_set_thread_creator()
function call and the qjack_thread_creator() function in both
cases.

The qjack_thread_creator() function just sets the name of the
created thread for debugging purposes and isn't really necessary.

From the jack_set_thread_creator() documentation:
(...)

No normal application/client should consider calling this. (...)

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/785
Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
Reviewed-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
Message-Id: <20211226154017.6067-1-vr_qemu@t-online.de>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 audio/jackaudio.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/audio/jackaudio.c b/audio/jackaudio.c
index e7de6d5433e9..317009e93660 100644
--- a/audio/jackaudio.c
+++ b/audio/jackaudio.c
@@ -622,6 +622,7 @@ static void qjack_enable_in(HWVoiceIn *hw, bool enable)
     ji->c.enabled = enable;
 }
 
+#if !defined(WIN32) && defined(CONFIG_PTHREAD_SETNAME_NP_W_TID)
 static int qjack_thread_creator(jack_native_thread_t *thread,
     const pthread_attr_t *attr, void *(*function)(void *), void *arg)
 {
@@ -635,6 +636,7 @@ static int qjack_thread_creator(jack_native_thread_t *thread,
 
     return ret;
 }
+#endif
 
 static void *qjack_init(Audiodev *dev)
 {
@@ -687,7 +689,9 @@ static void register_audio_jack(void)
 {
     qemu_mutex_init(&qjack_shutdown_lock);
     audio_driver_register(&jack_driver);
+#if !defined(WIN32) && defined(CONFIG_PTHREAD_SETNAME_NP_W_TID)
     jack_set_thread_creator(qjack_thread_creator);
+#endif
     jack_set_error_function(qjack_error);
     jack_set_info_function(qjack_info);
 }
-- 
2.34.1


