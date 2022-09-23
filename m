Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3BD85E81EE
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 20:44:35 +0200 (CEST)
Received: from localhost ([::1]:59466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obnf8-00065l-Ib
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 14:44:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1obnXg-0002h8-GL
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 14:36:53 -0400
Received: from mailout02.t-online.de ([194.25.134.17]:43182)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1obnXd-0005EF-Lv
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 14:36:52 -0400
Received: from fwd85.dcpf.telekom.de (fwd85.aul.t-online.de [10.223.144.111])
 by mailout02.t-online.de (Postfix) with SMTP id D06593B17;
 Fri, 23 Sep 2022 20:36:44 +0200 (CEST)
Received: from linpower.localnet ([84.175.228.229]) by fwd85.t-online.de
 with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
 esmtp id 1obnXU-2nz0XR0; Fri, 23 Sep 2022 20:36:40 +0200
Received: by linpower.localnet (Postfix, from userid 1000)
 id 93BEE200456; Fri, 23 Sep 2022 20:36:40 +0200 (CEST)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org
Subject: [PATCH 01/12] audio: refactor code in audio_run_out()
Date: Fri, 23 Sep 2022 20:36:29 +0200
Message-Id: <20220923183640.8314-1-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <38d7417a-fc26-be39-6a63-99c79ee15fc9@t-online.de>
References: <38d7417a-fc26-be39-6a63-99c79ee15fc9@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TOI-EXPURGATEID: 150726::1663958200-2E0B6EA1-2A5C596E/0/0 CLEAN NORMAL
X-TOI-MSGID: fabe07bd-971c-43da-bc89-60b380a8f7c1
Received-SPF: none client-ip=194.25.134.17;
 envelope-from=volker.ruemelin@t-online.de; helo=mailout02.t-online.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Refactoring the code in audio_run_out() avoids code duplication
in the next patch. There's no functional change.

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
---
 audio/audio.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/audio/audio.c b/audio/audio.c
index cfa4119c05..04f685fe24 100644
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
2.35.3


