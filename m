Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5855527164A
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Sep 2020 19:24:49 +0200 (CEST)
Received: from localhost ([::1]:59828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kK34y-0002Kj-EO
	for lists+qemu-devel@lfdr.de; Sun, 20 Sep 2020 13:24:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1kK2yG-00042X-Pf
 for qemu-devel@nongnu.org; Sun, 20 Sep 2020 13:17:57 -0400
Received: from mailout06.t-online.de ([194.25.134.19]:43594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1kK2yE-0006Gd-OD
 for qemu-devel@nongnu.org; Sun, 20 Sep 2020 13:17:52 -0400
Received: from fwd23.aul.t-online.de (fwd23.aul.t-online.de [172.20.26.128])
 by mailout06.t-online.de (Postfix) with SMTP id 619E441F058C;
 Sun, 20 Sep 2020 19:17:49 +0200 (CEST)
Received: from linpower.localnet
 (rC-hh8ZOohJxclY-nx5NWfzPEJZJf6vYv7VtWdsW2z8rZ8RFYOI8T6CDHX+UC5+QGD@[93.236.144.216])
 by fwd23.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1kK2yA-23hqEq0; Sun, 20 Sep 2020 19:17:46 +0200
Received: by linpower.localnet (Postfix, from userid 1000)
 id 03904335509; Sun, 20 Sep 2020 19:17:30 +0200 (CEST)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH 7/9] audio: run downstream playback queue unconditionally
Date: Sun, 20 Sep 2020 19:17:27 +0200
Message-Id: <20200920171729.15861-7-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <84f1c61a-8399-c75e-96c2-febfc2dd5fab@t-online.de>
References: <84f1c61a-8399-c75e-96c2-febfc2dd5fab@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ID: rC-hh8ZOohJxclY-nx5NWfzPEJZJf6vYv7VtWdsW2z8rZ8RFYOI8T6CDHX+UC5+QGD
X-TOI-EXPURGATEID: 150726::1600622266-00017F06-8537D407/0/0 CLEAN NORMAL
X-TOI-MSGID: 025334c8-bcbf-4970-b261-564cb9aab7d4
Received-SPF: none client-ip=194.25.134.19;
 envelope-from=volker.ruemelin@t-online.de; helo=mailout06.t-online.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/20 13:17:47
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel <qemu-devel@nongnu.org>,
 =?UTF-8?q?Zolt=C3=A1n=20K=C5=91v=C3=A1g=C3=B3?= <dirty.ice.hu@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Run the downstream playback queue even if there are no samples
in the mixing engine buffer. The downstream queue may still have
queued samples.

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
---
 audio/audio.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/audio/audio.c b/audio/audio.c
index 57eddb3324..a2c4c55477 100644
--- a/audio/audio.c
+++ b/audio/audio.c
@@ -1186,6 +1186,9 @@ static void audio_run_out (AudioState *s)
                     }
                 }
             }
+            if (hw->pcm_ops->run_buffer_out) {
+                hw->pcm_ops->run_buffer_out(hw);
+            }
             continue;
         }
 
-- 
2.26.2


