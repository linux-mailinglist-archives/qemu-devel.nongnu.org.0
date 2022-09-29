Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5325C5EF447
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 13:27:49 +0200 (CEST)
Received: from localhost ([::1]:59552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odrhj-0004qh-0X
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 07:27:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1odrM6-0000zJ-H8
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 07:05:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28186)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1odrM4-0001uv-Ue
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 07:05:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664449524;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ezD6PhMSMxDyjMv4dDUkY1/CLp8KW3sHOvTJVy2oQGQ=;
 b=c1EpUof355K/2K8UyQpQmJxxD34D9oJDPieui2Yy87egaAIUKxpbCc2iL57b/yaVXlODLN
 Wy2J+rPsneM2RNUkcxef+gsDvGuDTfH/u+lFJ59ZpY3eEfigR/z9o3trtwTBpzTcoyJ5d5
 xkGYN+NnrAOv6Em6OVOlDUhuhZi6WHk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-503-EXGbTNIoNaattPQZxovEsg-1; Thu, 29 Sep 2022 07:05:20 -0400
X-MC-Unique: EXGbTNIoNaattPQZxovEsg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 618A7185A7A8;
 Thu, 29 Sep 2022 11:05:20 +0000 (UTC)
Received: from localhost (unknown [10.39.208.39])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 59F64112132C;
 Thu, 29 Sep 2022 11:05:19 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, Arwed Meyer <arwed.meyer@gmx.de>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>
Subject: [PULL 2/8] chardev: src buffer const for write functions
Date: Thu, 29 Sep 2022 15:05:02 +0400
Message-Id: <20220929110508.1323529-3-marcandre.lureau@redhat.com>
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

Make source buffers const for char be write functions.
This allows using buffers returned by fifo as buf parameter and source buffer
should not be changed by write functions anyway.

Signed-off-by: Arwed Meyer <arwed.meyer@gmx.de>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20220911181840.8933-3-arwed.meyer@gmx.de>
---
 include/chardev/char.h  | 4 ++--
 include/sysemu/replay.h | 2 +-
 chardev/char.c          | 4 ++--
 replay/replay-char.c    | 2 +-
 stubs/replay-tools.c    | 2 +-
 5 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/include/chardev/char.h b/include/chardev/char.h
index a319b5fdff..44cd82e405 100644
--- a/include/chardev/char.h
+++ b/include/chardev/char.h
@@ -186,7 +186,7 @@ int qemu_chr_be_can_write(Chardev *s);
  * the caller should call @qemu_chr_be_can_write to determine how much data
  * the front end can currently accept.
  */
-void qemu_chr_be_write(Chardev *s, uint8_t *buf, int len);
+void qemu_chr_be_write(Chardev *s, const uint8_t *buf, int len);
 
 /**
  * qemu_chr_be_write_impl:
@@ -195,7 +195,7 @@ void qemu_chr_be_write(Chardev *s, uint8_t *buf, int len);
  *
  * Implementation of back end writing. Used by replay module.
  */
-void qemu_chr_be_write_impl(Chardev *s, uint8_t *buf, int len);
+void qemu_chr_be_write_impl(Chardev *s, const uint8_t *buf, int len);
 
 /**
  * qemu_chr_be_update_read_handlers:
diff --git a/include/sysemu/replay.h b/include/sysemu/replay.h
index 73dee9ccdf..7ec0882b50 100644
--- a/include/sysemu/replay.h
+++ b/include/sysemu/replay.h
@@ -198,7 +198,7 @@ uint64_t blkreplay_next_id(void);
 /*! Registers char driver to save it's events */
 void replay_register_char_driver(struct Chardev *chr);
 /*! Saves write to char device event to the log */
-void replay_chr_be_write(struct Chardev *s, uint8_t *buf, int len);
+void replay_chr_be_write(struct Chardev *s, const uint8_t *buf, int len);
 /*! Writes char write return value to the replay log. */
 void replay_char_write_event_save(int res, int offset);
 /*! Reads char write return value from the replay log. */
diff --git a/chardev/char.c b/chardev/char.c
index 0169d8dde4..b005df3ccf 100644
--- a/chardev/char.c
+++ b/chardev/char.c
@@ -193,7 +193,7 @@ int qemu_chr_be_can_write(Chardev *s)
     return be->chr_can_read(be->opaque);
 }
 
-void qemu_chr_be_write_impl(Chardev *s, uint8_t *buf, int len)
+void qemu_chr_be_write_impl(Chardev *s, const uint8_t *buf, int len)
 {
     CharBackend *be = s->be;
 
@@ -202,7 +202,7 @@ void qemu_chr_be_write_impl(Chardev *s, uint8_t *buf, int len)
     }
 }
 
-void qemu_chr_be_write(Chardev *s, uint8_t *buf, int len)
+void qemu_chr_be_write(Chardev *s, const uint8_t *buf, int len)
 {
     if (qemu_chr_replay(s)) {
         if (replay_mode == REPLAY_MODE_PLAY) {
diff --git a/replay/replay-char.c b/replay/replay-char.c
index d2025948cf..a31aded032 100644
--- a/replay/replay-char.c
+++ b/replay/replay-char.c
@@ -48,7 +48,7 @@ void replay_register_char_driver(Chardev *chr)
     char_drivers[drivers_count++] = chr;
 }
 
-void replay_chr_be_write(Chardev *s, uint8_t *buf, int len)
+void replay_chr_be_write(Chardev *s, const uint8_t *buf, int len)
 {
     CharEvent *event = g_new0(CharEvent, 1);
 
diff --git a/stubs/replay-tools.c b/stubs/replay-tools.c
index f2e72bb225..3e8ca3212d 100644
--- a/stubs/replay-tools.c
+++ b/stubs/replay-tools.c
@@ -53,7 +53,7 @@ void replay_register_char_driver(struct Chardev *chr)
 {
 }
 
-void replay_chr_be_write(struct Chardev *s, uint8_t *buf, int len)
+void replay_chr_be_write(struct Chardev *s, const uint8_t *buf, int len)
 {
     abort();
 }
-- 
2.37.3


