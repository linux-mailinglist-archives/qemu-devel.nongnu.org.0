Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 947553E59CD
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 14:22:31 +0200 (CEST)
Received: from localhost ([::1]:48852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDQm6-0003wl-KY
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 08:22:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mDQid-0005rQ-QZ
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 08:18:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58693)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mDQic-0008UY-A4
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 08:18:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628597933;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VrF5GUVBZcVPiyF/VpPpNRjyYFAFB5kO45k7KvRFhmQ=;
 b=JoyCekM5jmwRrzGQ99TgRtoill2bGEcXo/vuo67hFBRTwl0gpqJ3S+f1OY1m6Vgth9rF4h
 eUkcmvpLp0Jq0wqLE2DcGU+MlbMNBZzjP3SFrAkELjbCgJK4FZVkvm3F97H0Bh0wwwPjWP
 Q4vV4tFO9/hQG9W2cqJH8QgFJRwdA9A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-602-FByqVoTBOX-OTbHe85mCug-1; Tue, 10 Aug 2021 08:18:52 -0400
X-MC-Unique: FByqVoTBOX-OTbHe85mCug-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E2E758799E0
 for <qemu-devel@nongnu.org>; Tue, 10 Aug 2021 12:18:51 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C54535D9C6;
 Tue, 10 Aug 2021 12:18:47 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 1D412180091B; Tue, 10 Aug 2021 14:18:40 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 2/3] audio: Never send migration section
Date: Tue, 10 Aug 2021 14:18:38 +0200
Message-Id: <20210810121840.2525726-3-kraxel@redhat.com>
In-Reply-To: <20210810121840.2525726-1-kraxel@redhat.com>
References: <20210810121840.2525726-1-kraxel@redhat.com>
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
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.704,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

The audio migration vmstate is empty, and always has been; we can't
just remove it though because an old qemu might send it us.
Changes with -audiodev now mean it's sometimes created when it didn't
used to be, and can confuse migration to old qemu.

Change it so that vmstate_audio is never sent; if it's received it
should still be accepted, and old qemu's shouldn't be too upset if it's
missing.

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Tested-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20210809170956.78536-1-dgilbert@redhat.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 audio/audio.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/audio/audio.c b/audio/audio.c
index 59453ef85673..54a153c0ef07 100644
--- a/audio/audio.c
+++ b/audio/audio.c
@@ -1622,10 +1622,20 @@ void audio_cleanup(void)
     }
 }
 
+static bool vmstate_audio_needed(void *opaque)
+{
+    /*
+     * Never needed, this vmstate only exists in case
+     * an old qemu sends it to us.
+     */
+    return false;
+}
+
 static const VMStateDescription vmstate_audio = {
     .name = "audio",
     .version_id = 1,
     .minimum_version_id = 1,
+    .needed = vmstate_audio_needed,
     .fields = (VMStateField[]) {
         VMSTATE_END_OF_LIST()
     }
-- 
2.31.1


