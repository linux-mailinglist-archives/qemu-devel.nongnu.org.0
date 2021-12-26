Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D886D47F823
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Dec 2021 16:42:33 +0100 (CET)
Received: from localhost ([::1]:38630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n1VfM-0001XS-Ea
	for lists+qemu-devel@lfdr.de; Sun, 26 Dec 2021 10:42:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1n1VdK-0008EV-AQ
 for qemu-devel@nongnu.org; Sun, 26 Dec 2021 10:40:26 -0500
Received: from mailout02.t-online.de ([194.25.134.17]:34586)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1n1VdI-00084E-9e
 for qemu-devel@nongnu.org; Sun, 26 Dec 2021 10:40:25 -0500
Received: from fwd83.dcpf.telekom.de (fwd83.aul.t-online.de [10.223.144.109])
 by mailout02.t-online.de (Postfix) with SMTP id E86B466A7;
 Sun, 26 Dec 2021 16:40:17 +0100 (CET)
Received: from linpower.localnet ([46.86.48.20]) by fwd83.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1n1VdB-07Gh9t0; Sun, 26 Dec 2021 16:40:17 +0100
Received: by linpower.localnet (Postfix, from userid 1000)
 id 4FFB22001EE; Sun, 26 Dec 2021 16:40:17 +0100 (CET)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH 1/3] jackaudio: use ifdefs to hide unavailable functions
Date: Sun, 26 Dec 2021 16:40:15 +0100
Message-Id: <20211226154017.6067-1-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cf516f2a-fea8-2000-1b80-a5465d0e1ee6@t-online.de>
References: <cf516f2a-fea8-2000-1b80-a5465d0e1ee6@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TOI-EXPURGATEID: 150726::1640533217-0000EDC4-48A55EE4/0/0 CLEAN NORMAL
X-TOI-MSGID: 22ac286c-1cc2-49c3-8004-a3c98e1f1015
Received-SPF: none client-ip=194.25.134.17;
 envelope-from=volker.ruemelin@t-online.de; helo=mailout02.t-online.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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
---
 audio/jackaudio.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/audio/jackaudio.c b/audio/jackaudio.c
index e7de6d5433..317009e936 100644
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
2.31.1


