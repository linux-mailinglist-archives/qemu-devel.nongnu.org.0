Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD2635FD584
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 09:24:45 +0200 (CEST)
Received: from localhost ([::1]:48204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oisaC-0007M8-QA
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 03:24:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ois5C-0005Ip-OS
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 02:52:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38008)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ois5B-0006nF-8Q
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 02:52:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665643960;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4+aV8cwUpP4Ab/cg1wz5vfBJnkqaJmgBOg4hBVfa+Zw=;
 b=Xiei9O8XmKezO7hqYffUXzrH+zneDb6T/wmX/ELDtrpsbVmPoUve0fjDY5I9ZgxOA82QFq
 wbbvY9RPLp1Ljtr/Eb7kEu6tD99X992e4UdjbyrN/wk9ZGzABBwHkwaapDYfS/xYFqS55+
 sxG4OkJBBeG/jGFNOWEkYjhzhZ2GQyA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-470-u-o7f8EPOcCFmN40JKbB9Q-1; Thu, 13 Oct 2022 02:52:34 -0400
X-MC-Unique: u-o7f8EPOcCFmN40JKbB9Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5251885A59D;
 Thu, 13 Oct 2022 06:52:34 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.195.183])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C3E692017DF0;
 Thu, 13 Oct 2022 06:52:32 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 74D361800620; Thu, 13 Oct 2022 08:52:24 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Kashyap Chamarthy <kchamart@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Eric Blake <eblake@redhat.com>,
 =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
Subject: [PULL 03/26] audio: run downstream playback queue unconditionally
Date: Thu, 13 Oct 2022 08:52:01 +0200
Message-Id: <20221013065224.1864145-4-kraxel@redhat.com>
In-Reply-To: <20221013065224.1864145-1-kraxel@redhat.com>
References: <20221013065224.1864145-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

From: Volker Rümelin <vr_qemu@t-online.de>

Run the downstream playback queue even if the emulated audio
device didn't write new samples. There still may be buffered
audio samples downstream.

This is for the -audiodev out.mixing-engine=off case. Commit
a8a98cfd42 ("audio: run downstream playback queue uncondition-
ally") fixed the out.mixing-engine=on case.

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
Acked-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20220923183640.8314-3-vr_qemu@t-online.de>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 audio/audio.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/audio/audio.c b/audio/audio.c
index 29da359b416b..567f953e66f9 100644
--- a/audio/audio.c
+++ b/audio/audio.c
@@ -1143,6 +1143,10 @@ static void audio_run_out (AudioState *s)
                                 hw_free * sw->info.bytes_per_frame);
             }
 
+            if (hw->pcm_ops->run_buffer_out) {
+                hw->pcm_ops->run_buffer_out(hw);
+            }
+
             continue;
         }
 
@@ -1501,10 +1505,6 @@ size_t audio_generic_write(HWVoiceOut *hw, void *buf, size_t size)
         }
     }
 
-    if (hw->pcm_ops->run_buffer_out) {
-        hw->pcm_ops->run_buffer_out(hw);
-    }
-
     return total;
 }
 
-- 
2.37.3


