Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00FC82F063E
	for <lists+qemu-devel@lfdr.de>; Sun, 10 Jan 2021 11:05:05 +0100 (CET)
Received: from localhost ([::1]:56454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyXaq-0002pU-MR
	for lists+qemu-devel@lfdr.de; Sun, 10 Jan 2021 05:05:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1kyXYf-0001CW-Ux
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 05:02:49 -0500
Received: from mailout07.t-online.de ([194.25.134.83]:59462)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1kyXYe-0005Fb-8e
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 05:02:49 -0500
Received: from fwd31.aul.t-online.de (fwd31.aul.t-online.de [172.20.26.136])
 by mailout07.t-online.de (Postfix) with SMTP id D10D14216FC2;
 Sun, 10 Jan 2021 11:02:43 +0100 (CET)
Received: from linpower.localnet
 (GiLLFmZfohD+UvhiJzQeOFl-PdIKtJ2hO0GpG4YJG3hsdzTs17VFE6icjDSBmCgZMm@[93.236.152.29])
 by fwd31.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1kyXYZ-0iVAjg0; Sun, 10 Jan 2021 11:02:43 +0100
Received: by linpower.localnet (Postfix, from userid 1000)
 id E0C1A200613; Sun, 10 Jan 2021 11:02:39 +0100 (CET)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH 02/23] audio: fix bit-rotted code
Date: Sun, 10 Jan 2021 11:02:18 +0100
Message-Id: <20210110100239.27588-2-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <9315afe5-5958-c0b4-ea1e-14769511a9d5@t-online.de>
References: <9315afe5-5958-c0b4-ea1e-14769511a9d5@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ID: GiLLFmZfohD+UvhiJzQeOFl-PdIKtJ2hO0GpG4YJG3hsdzTs17VFE6icjDSBmCgZMm
X-TOI-EXPURGATEID: 150726::1610272963-0000B028-35DDAE5E/0/0 CLEAN NORMAL
X-TOI-MSGID: 0523b961-a39f-441e-a95c-e77f9271d30d
Received-SPF: none client-ip=194.25.134.83;
 envelope-from=volker.ruemelin@t-online.de; helo=mailout07.t-online.de
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
Cc: QEMU <qemu-devel@nongnu.org>,
 =?UTF-8?q?Zolt=C3=A1n=20K=C5=91v=C3=A1g=C3=B3?= <dirty.ice.hu@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
---
 audio/alsaaudio.c | 2 +-
 audio/sdlaudio.c  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/audio/alsaaudio.c b/audio/alsaaudio.c
index a8e62542f9..6787e91bc1 100644
--- a/audio/alsaaudio.c
+++ b/audio/alsaaudio.c
@@ -599,7 +599,7 @@ static int alsa_open(bool in, struct alsa_params_req *req,
     }
 
 #ifdef DEBUG
-    alsa_dump_info(req, obt, obtfmt, pdo);
+    alsa_dump_info(req, obt, obtfmt, apdo);
 #endif
     return 0;
 
diff --git a/audio/sdlaudio.c b/audio/sdlaudio.c
index bf3cfb8456..00cd12ba66 100644
--- a/audio/sdlaudio.c
+++ b/audio/sdlaudio.c
@@ -215,7 +215,7 @@ static void sdl_callback (void *opaque, Uint8 *buf, int len)
         return;
     }
 
-    /* dolog ("in callback samples=%zu live=%zu\n", samples, sdl->live); */
+    /* dolog("callback: len=%d avail=%zu\n", len, hw->pending_emul); */
 
     while (hw->pending_emul && len) {
         size_t write_len;
-- 
2.26.2


