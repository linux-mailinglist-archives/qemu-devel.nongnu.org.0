Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A4146B0F9F
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 18:03:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZx8Y-0004pD-Py; Wed, 08 Mar 2023 11:59:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1pZx8S-0004jJ-Uj; Wed, 08 Mar 2023 11:59:28 -0500
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1pZx8N-00048Z-Mt; Wed, 08 Mar 2023 11:59:28 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 8452D400EA;
 Wed,  8 Mar 2023 19:58:57 +0300 (MSK)
Received: from tls.msk.ru (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with SMTP id 450F41FE;
 Wed,  8 Mar 2023 19:58:56 +0300 (MSK)
Received: (nullmailer pid 2098375 invoked by uid 1000);
 Wed, 08 Mar 2023 16:58:55 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org, =?UTF-8?q?Carlos=20L=C3=B3pez?= <clopez@suse.de>,
 "Michael S . Tsirkin" <mst@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>
Subject: [PATCH 40/47] vhost: avoid a potential use of an uninitialized
 variable in vhost_svq_poll()
Date: Wed,  8 Mar 2023 19:57:43 +0300
Message-Id: <20230308165815.2098148-40-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230308165035.2097594-1-mjt@msgid.tls.msk.ru>
References: <20230308165035.2097594-1-mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Carlos López <clopez@suse.de>

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

Note by  Laurent Vivier <lvivier@redhat.com>:

    The return value is only used to detect an error:

    vhost_svq_poll
        vhost_vdpa_net_cvq_add
            vhost_vdpa_net_load_cmd
                vhost_vdpa_net_load_mac
                  -> a negative return is only used to detect error
                vhost_vdpa_net_load_mq
                  -> a negative return is only used to detect error
            vhost_vdpa_net_handle_ctrl_avail
              -> a negative return is only used to detect error

Fixes: d368c0b052ad ("vhost: Do not depend on !NULL VirtQueueElement on vhost_svq_flush")
Signed-off-by: Carlos López <clopez@suse.de>
Message-Id: <20230213085747.19956-1-clopez@suse.de>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
(cherry picked from commit e4dd39c699b7d63a06f686ec06ded8adbee989c1)
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/virtio/vhost-shadow-virtqueue.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
index 5bd14cad96..a723073747 100644
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
2.30.2


