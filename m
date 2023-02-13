Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FEEB694033
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 09:59:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRUfS-0000UF-OB; Mon, 13 Feb 2023 03:58:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clopez@suse.de>) id 1pRUfH-0000Tk-El
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 03:58:25 -0500
Received: from smtp-out1.suse.de ([195.135.220.28])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <clopez@suse.de>) id 1pRUfF-0002xa-Qn
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 03:58:23 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0803933829;
 Mon, 13 Feb 2023 08:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1676278699; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=uSCcmoM0LZ8aT+DY8XGIBxggWBxztLgk79xAS2SWe7s=;
 b=lhkWUeVojuimm0UcJB3ChDJaLWSFCcAkY8gkJ5qPEXxfWCgR9Ue/H+W91A7jg15YJn8APB
 54TRiA3yUpe+utNlkH1TcVKXbKP18VQ5MHZUUzhL+qrjHuHwh92ebdvGoOw02Ldk6oL+yu
 PckeZanEF9fsArItTZYXqYVHJSakMx8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1676278699;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=uSCcmoM0LZ8aT+DY8XGIBxggWBxztLgk79xAS2SWe7s=;
 b=HI59likBR4N5w8IMQj+2lX5OlrcfGL4JHYgdLTGelrh3LWbAbHrRmmX7JzZS0RqGZKCeBQ
 k504Q0cc6zUgm4Dw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B54CE1391B;
 Mon, 13 Feb 2023 08:58:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id /E0CKar76WPBSwAAMHmgww
 (envelope-from <clopez@suse.de>); Mon, 13 Feb 2023 08:58:18 +0000
From: =?UTF-8?q?Carlos=20L=C3=B3pez?= <clopez@suse.de>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Carlos=20L=C3=B3pez?= <clopez@suse.de>,
 "Michael S. Tsirkin" <mst@redhat.com>
Subject: [PATCH v2] vhost: avoid a potential use of an uninitialized variable
 in vhost_svq_poll()
Date: Mon, 13 Feb 2023 09:57:47 +0100
Message-Id: <20230213085747.19956-1-clopez@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.28; envelope-from=clopez@suse.de;
 helo=smtp-out1.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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

In vhost_svq_poll(), if vhost_svq_get_buf() fails due to a device
providing invalid descriptors, len is left uninitialized and returned
to the caller, potentally leaking stack data or causing undefined
behavior.

Fix this by initializing len to 0.

Found with GCC 13 and -fanalyzer (abridged):

../hw/virtio/vhost-shadow-virtqueue.c: In function ‘vhost_svq_poll’:
../hw/virtio/vhost-shadow-virtqueue.c:538:12: warning: use of uninitialized value ‘len’ [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
  538 |     return len;
      |            ^~~
  ‘vhost_svq_poll’: events 1-4
    |
    |  522 | size_t vhost_svq_poll(VhostShadowVirtqueue *svq)
    |      |        ^~~~~~~~~~~~~~
    |      |        |
    |      |        (1) entry to ‘vhost_svq_poll’
    |......
    |  525 |     uint32_t len;
    |      |              ~~~
    |      |              |
    |      |              (2) region created on stack here
    |      |              (3) capacity: 4 bytes
    |......
    |  528 |         if (vhost_svq_more_used(svq)) {
    |      |             ~
    |      |             |
    |      |             (4) inlined call to ‘vhost_svq_more_used’ from ‘vhost_svq_poll’

    (...)

    |  528 |         if (vhost_svq_more_used(svq)) {
    |      |            ^~~~~~~~~~~~~~~~~~~~~~~~~
    |      |            ||
    |      |            |(8) ...to here
    |      |            (7) following ‘true’ branch...
    |......
    |  537 |     vhost_svq_get_buf(svq, &len);
    |      |     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    |      |     |
    |      |     (9) calling ‘vhost_svq_get_buf’ from ‘vhost_svq_poll’
    |
    +--> ‘vhost_svq_get_buf’: events 10-11
           |
           |  416 | static VirtQueueElement *vhost_svq_get_buf(VhostShadowVirtqueue *svq,
           |      |                          ^~~~~~~~~~~~~~~~~
           |      |                          |
           |      |                          (10) entry to ‘vhost_svq_get_buf’
           |......
           |  423 |     if (!vhost_svq_more_used(svq)) {
           |      |          ~
           |      |          |
           |      |          (11) inlined call to ‘vhost_svq_more_used’ from ‘vhost_svq_get_buf’
           |

           (...)

           |
         ‘vhost_svq_get_buf’: event 14
           |
           |  423 |     if (!vhost_svq_more_used(svq)) {
           |      |        ^
           |      |        |
           |      |        (14) following ‘false’ branch...
           |
         ‘vhost_svq_get_buf’: event 15
           |
           |cc1:
           | (15): ...to here
           |
    <------+
    |
  ‘vhost_svq_poll’: events 16-17
    |
    |  537 |     vhost_svq_get_buf(svq, &len);
    |      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
    |      |     |
    |      |     (16) returning to ‘vhost_svq_poll’ from ‘vhost_svq_get_buf’
    |  538 |     return len;
    |      |            ~~~
    |      |            |
    |      |            (17) use of uninitialized value ‘len’ here

Fixes: d368c0b052ad ("vhost: Do not depend on !NULL VirtQueueElement on vhost_svq_flush")
Signed-off-by: Carlos López <clopez@suse.de>
---
v2: Added Fixes tag

 hw/virtio/vhost-shadow-virtqueue.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
index 4307296358..515ccf870d 100644
--- a/hw/virtio/vhost-shadow-virtqueue.c
+++ b/hw/virtio/vhost-shadow-virtqueue.c
@@ -522,7 +522,7 @@ static void vhost_svq_flush(VhostShadowVirtqueue *svq,
 size_t vhost_svq_poll(VhostShadowVirtqueue *svq)
 {
     int64_t start_us = g_get_monotonic_time();
-    uint32_t len;
+    uint32_t len = 0;
 
     do {
         if (vhost_svq_more_used(svq)) {
-- 
2.35.3


