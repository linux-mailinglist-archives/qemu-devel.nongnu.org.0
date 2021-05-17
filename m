Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5E8F383DC2
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 21:49:39 +0200 (CEST)
Received: from localhost ([::1]:37534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lijFC-0002EL-Vh
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 15:49:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1lijDZ-0000kh-VL
 for qemu-devel@nongnu.org; Mon, 17 May 2021 15:47:57 -0400
Received: from mailout08.t-online.de ([194.25.134.20]:48610)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1lijDY-0001W0-A1
 for qemu-devel@nongnu.org; Mon, 17 May 2021 15:47:57 -0400
Received: from fwd07.aul.t-online.de (fwd07.aul.t-online.de [172.20.27.150])
 by mailout08.t-online.de (Postfix) with SMTP id 104F924256;
 Mon, 17 May 2021 21:46:13 +0200 (CEST)
Received: from linpower.localnet
 (V+dS4GZCrhCyGj3kZKOEFqwg2BtgW3IPe5z3NTs9uYCmlsbdFqslvMs6-VLxXvvZcd@[79.208.18.63])
 by fwd07.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1lijBs-1JKtua0; Mon, 17 May 2021 21:46:12 +0200
Received: by linpower.localnet (Postfix, from userid 1000)
 id 5F868200624; Mon, 17 May 2021 21:46:04 +0200 (CEST)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH 4/4] jackaudio: avoid that the client name contains the word
 (NULL)
Date: Mon, 17 May 2021 21:46:04 +0200
Message-Id: <20210517194604.2545-4-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <b461d71c-a062-b85d-378d-53c0b5857b52@t-online.de>
References: <b461d71c-a062-b85d-378d-53c0b5857b52@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ID: V+dS4GZCrhCyGj3kZKOEFqwg2BtgW3IPe5z3NTs9uYCmlsbdFqslvMs6-VLxXvvZcd
X-TOI-EXPURGATEID: 150726::1621280772-00011901-9D786454/0/0 CLEAN NORMAL
X-TOI-MSGID: 45367512-1a9c-469f-97ae-238f1e15d73f
Received-SPF: none client-ip=194.25.134.20;
 envelope-from=volker.ruemelin@t-online.de; helo=mailout08.t-online.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently with jackaudio client name and qemu guest name unset,
the JACK client names are out-(NULL) and in-(NULL). These names
are user visible in the patch bay. Replace the function call to
qemu_get_vm_name() with a call to audio_application_name() which
replaces NULL with "qemu" to have more descriptive names.

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
---
 audio/jackaudio.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/audio/jackaudio.c b/audio/jackaudio.c
index 3031c4e29b..e7de6d5433 100644
--- a/audio/jackaudio.c
+++ b/audio/jackaudio.c
@@ -26,7 +26,6 @@
 #include "qemu/module.h"
 #include "qemu/atomic.h"
 #include "qemu/main-loop.h"
-#include "qemu-common.h"
 #include "audio.h"
 
 #define AUDIO_CAP "jack"
@@ -412,7 +411,7 @@ static int qjack_client_init(QJackClient *c)
 
     snprintf(client_name, sizeof(client_name), "%s-%s",
         c->out ? "out" : "in",
-        c->opt->client_name ? c->opt->client_name : qemu_get_vm_name());
+        c->opt->client_name ? c->opt->client_name : audio_application_name());
 
     if (c->opt->exact_name) {
         options |= JackUseExactName;
-- 
2.26.2


