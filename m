Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A30932F7C99
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 14:29:46 +0100 (CET)
Received: from localhost ([::1]:57104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0PAf-0004ZV-MZ
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 08:29:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l0P3I-0006uI-KO
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 08:22:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28385)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l0P3A-0003Ij-6n
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 08:22:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610716915;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AnAXyOZxzryLO3jXO6hO3fVMwALA3DXq8z0PDBwf4Xs=;
 b=EFesPQFHTI29UwHoM6AjVKXO7tvqir/9JMPHUhyfuCqLjJsppcjGYzxTZfQj1QirpACIln
 LRcIImzJX/CB89nXh55/YWQLcuqswF6Bqpr5eTKSbtAzKn2pF6WzPHRCuxTG9S+s7rKsde
 miGsh1edkJ/hNbUFcvqTT8Qx12isPNk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-514-qXXFRQxtNWqQsnAGA5Jt2g-1; Fri, 15 Jan 2021 08:21:53 -0500
X-MC-Unique: qXXFRQxtNWqQsnAGA5Jt2g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BC4A1806663;
 Fri, 15 Jan 2021 13:21:52 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-182.ams2.redhat.com
 [10.36.112.182])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 83F676F7EF;
 Fri, 15 Jan 2021 13:21:52 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 967351800D40; Fri, 15 Jan 2021 14:21:46 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 10/30] audio: break generic buffer dependency on mixing-engine
Date: Fri, 15 Jan 2021 14:21:26 +0100
Message-Id: <20210115132146.1443592-11-kraxel@redhat.com>
In-Reply-To: <20210115132146.1443592-1-kraxel@redhat.com>
References: <20210115132146.1443592-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>,
 Gerd Hoffmann <kraxel@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Volker Rümelin <vr_qemu@t-online.de>

Break the unnecessary dependency of the generic buffer management
code on mixing-engine. This is required for the next patch.

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
Message-id: 9315afe5-5958-c0b4-ea1e-14769511a9d5@t-online.de
Message-Id: <20210110100239.27588-10-vr_qemu@t-online.de>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 audio/audio.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/audio/audio.c b/audio/audio.c
index 480b3cce1ffb..22d769db0c99 100644
--- a/audio/audio.c
+++ b/audio/audio.c
@@ -1388,9 +1388,8 @@ void audio_run(AudioState *s, const char *msg)
 void audio_generic_run_buffer_in(HWVoiceIn *hw)
 {
     if (unlikely(!hw->buf_emul)) {
-        size_t calc_size = hw->conv_buf->size * hw->info.bytes_per_frame;
-        hw->buf_emul = g_malloc(calc_size);
-        hw->size_emul = calc_size;
+        hw->size_emul = hw->samples * hw->info.bytes_per_frame;
+        hw->buf_emul = g_malloc(hw->size_emul);
         hw->pos_emul = hw->pending_emul = 0;
     }
 
@@ -1452,10 +1451,8 @@ void audio_generic_run_buffer_out(HWVoiceOut *hw)
 void *audio_generic_get_buffer_out(HWVoiceOut *hw, size_t *size)
 {
     if (unlikely(!hw->buf_emul)) {
-        size_t calc_size = hw->mix_buf->size * hw->info.bytes_per_frame;
-
-        hw->buf_emul = g_malloc(calc_size);
-        hw->size_emul = calc_size;
+        hw->size_emul = hw->samples * hw->info.bytes_per_frame;
+        hw->buf_emul = g_malloc(hw->size_emul);
         hw->pos_emul = hw->pending_emul = 0;
     }
 
-- 
2.29.2


