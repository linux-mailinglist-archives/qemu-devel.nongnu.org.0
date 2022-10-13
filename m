Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BAB85FD553
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 09:02:49 +0200 (CEST)
Received: from localhost ([::1]:56500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oisEw-0002tP-S6
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 03:02:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ois56-00055U-V2
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 02:52:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30782)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ois53-0006lW-HC
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 02:52:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665643952;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IqYykLpsWy7mnomN9/W5L+PfGO1/B21WKaL4Tr3EfxM=;
 b=YAsAXWJGS/HBJ/3/I1T6mLtO1bb7A+AZzIhgaczUU18Cut9y41/G63KmaOfET1lq/ppb6O
 ujr1lxYez4jfLoXOABHEHdjY5qcxGt2aIqSC2OJKjlXhdP0B1dGqUU2KnfReGMiXJUEpqg
 Givb5ltXEIFofYKT8kHyUif8QHVYJ6k=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-142-RygBbv0zMoC6FnfTmVHx3g-1; Thu, 13 Oct 2022 02:52:28 -0400
X-MC-Unique: RygBbv0zMoC6FnfTmVHx3g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0B636299E77D;
 Thu, 13 Oct 2022 06:52:28 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.195.183])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7090E112C071;
 Thu, 13 Oct 2022 06:52:27 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 5B3D718003A8; Thu, 13 Oct 2022 08:52:24 +0200 (CEST)
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
Subject: [PULL 01/26] audio: refactor code in audio_run_out()
Date: Thu, 13 Oct 2022 08:51:59 +0200
Message-Id: <20221013065224.1864145-2-kraxel@redhat.com>
In-Reply-To: <20221013065224.1864145-1-kraxel@redhat.com>
References: <20221013065224.1864145-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
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

Refactoring the code in audio_run_out() avoids code duplication
in the next patch. There's no functional change.

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20220923183640.8314-1-vr_qemu@t-online.de>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 audio/audio.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/audio/audio.c b/audio/audio.c
index df6818ed5598..08aec51e7085 100644
--- a/audio/audio.c
+++ b/audio/audio.c
@@ -1121,8 +1121,12 @@ static void audio_run_out (AudioState *s)
     HWVoiceOut *hw = NULL;
     SWVoiceOut *sw;
 
-    if (!audio_get_pdo_out(s->dev)->mixing_engine) {
-        while ((hw = audio_pcm_hw_find_any_enabled_out(s, hw))) {
+    while ((hw = audio_pcm_hw_find_any_enabled_out(s, hw))) {
+        size_t played, live, prev_rpos;
+        size_t hw_free = audio_pcm_hw_get_free(hw);
+        int nb_live;
+
+        if (!audio_get_pdo_out(s->dev)->mixing_engine) {
             /* there is exactly 1 sw for each hw with no mixeng */
             sw = hw->sw_head.lh_first;
 
@@ -1137,14 +1141,9 @@ static void audio_run_out (AudioState *s)
             if (sw->active) {
                 sw->callback.fn(sw->callback.opaque, INT_MAX);
             }
-        }
-        return;
-    }
 
-    while ((hw = audio_pcm_hw_find_any_enabled_out(s, hw))) {
-        size_t played, live, prev_rpos;
-        size_t hw_free = audio_pcm_hw_get_free(hw);
-        int nb_live;
+            continue;
+        }
 
         for (sw = hw->sw_head.lh_first; sw; sw = sw->entries.le_next) {
             if (sw->active) {
-- 
2.37.3


