Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC9A2F0640
	for <lists+qemu-devel@lfdr.de>; Sun, 10 Jan 2021 11:05:21 +0100 (CET)
Received: from localhost ([::1]:57052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyXb6-00038H-7G
	for lists+qemu-devel@lfdr.de; Sun, 10 Jan 2021 05:05:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1kyXYj-0001HY-3a
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 05:02:53 -0500
Received: from mailout03.t-online.de ([194.25.134.81]:56922)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1kyXYg-0005Hh-NW
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 05:02:52 -0500
Received: from fwd35.aul.t-online.de (fwd35.aul.t-online.de [172.20.27.145])
 by mailout03.t-online.de (Postfix) with SMTP id 072F4421777D;
 Sun, 10 Jan 2021 11:02:49 +0100 (CET)
Received: from linpower.localnet
 (VmketMZrwhoswgcPFZurWi59NS6tsuKxEQsjRzt296okXSPip21r9j9IsSiQfMUZvr@[93.236.152.29])
 by fwd35.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1kyXYe-4KB5EW0; Sun, 10 Jan 2021 11:02:48 +0100
Received: by linpower.localnet (Postfix, from userid 1000)
 id E374D20062E; Sun, 10 Jan 2021 11:02:39 +0100 (CET)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH 04/23] sdlaudio: don't start playback in init routine
Date: Sun, 10 Jan 2021 11:02:20 +0100
Message-Id: <20210110100239.27588-4-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <9315afe5-5958-c0b4-ea1e-14769511a9d5@t-online.de>
References: <9315afe5-5958-c0b4-ea1e-14769511a9d5@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ID: VmketMZrwhoswgcPFZurWi59NS6tsuKxEQsjRzt296okXSPip21r9j9IsSiQfMUZvr
X-TOI-EXPURGATEID: 150726::1610272968-0000E07B-F1A38D55/0/0 CLEAN NORMAL
X-TOI-MSGID: 7891b11f-6b09-4441-b497-528b523efa94
Received-SPF: none client-ip=194.25.134.81;
 envelope-from=volker.ruemelin@t-online.de; helo=mailout03.t-online.de
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
Cc: QEMU <qemu-devel@nongnu.org>,
 =?UTF-8?q?Zolt=C3=A1n=20K=C5=91v=C3=A1g=C3=B3?= <dirty.ice.hu@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Every emulated audio device has a way to enable audio playback. Don't
start playback until the guest enables the audio device. This patch
keeps the SDL2 device pause state in sync with hw->enabled.

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
---
 audio/sdlaudio.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/audio/sdlaudio.c b/audio/sdlaudio.c
index 431bfcfddd..68126a99ab 100644
--- a/audio/sdlaudio.c
+++ b/audio/sdlaudio.c
@@ -312,7 +312,6 @@ static int sdl_init_out(HWVoiceOut *hw, struct audsettings *as,
 
     s->initialized = 1;
     s->exit = 0;
-    SDL_PauseAudio (0);
     return 0;
 }
 
-- 
2.26.2


