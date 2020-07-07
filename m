Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77DB92175F8
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jul 2020 20:09:33 +0200 (CEST)
Received: from localhost ([::1]:35732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jss28-0005yk-3F
	for lists+qemu-devel@lfdr.de; Tue, 07 Jul 2020 14:09:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1jss1P-0005Zr-99
 for qemu-devel@nongnu.org; Tue, 07 Jul 2020 14:08:47 -0400
Received: from mailout08.t-online.de ([194.25.134.20]:43082)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1jss1N-0001eJ-H3
 for qemu-devel@nongnu.org; Tue, 07 Jul 2020 14:08:47 -0400
Received: from fwd29.aul.t-online.de (fwd29.aul.t-online.de [172.20.26.134])
 by mailout08.t-online.de (Postfix) with SMTP id 934294146F6A;
 Tue,  7 Jul 2020 20:08:40 +0200 (CEST)
Received: from linpower.localnet
 (JO3gSYZLYhGU3ycmzqNn4SBhNo6i3PSdPkXASKhE7CXM2K4VvLBgk6GJ2FVODARQJu@[93.236.146.213])
 by fwd29.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1jss1E-14IzAG0; Tue, 7 Jul 2020 20:08:36 +0200
Received: by linpower.localnet (Postfix, from userid 1000)
 id 5317621B1CD; Tue,  7 Jul 2020 20:08:36 +0200 (CEST)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH] ossaudio: fix out of bounds write
Date: Tue,  7 Jul 2020 20:08:36 +0200
Message-Id: <20200707180836.5435-1-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ID: JO3gSYZLYhGU3ycmzqNn4SBhNo6i3PSdPkXASKhE7CXM2K4VvLBgk6GJ2FVODARQJu
X-TOI-EXPURGATEID: 150726::1594145316-0000FF93-F601CEB1/0/0 CLEAN NORMAL
X-TOI-MSGID: fe4dfb67-5807-4782-86be-9fb3d12ae6c5
Received-SPF: none client-ip=194.25.134.20;
 envelope-from=volker.ruemelin@t-online.de; helo=mailout08.t-online.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/07 14:08:41
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001, SPOOFED_FREEMAIL=1 autolearn=_AUTOLEARN
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

In function oss_read() a read error currently does not exit the
read loop. With no data to read the variable pos will quickly
underflow and a subsequent successful read overwrites memory
outside the buffer. This patch adds the missing break statement
to the error path of the function.

To reproduce start qemu with -audiodev oss,id=audio0 and in the
guest start audio recording. After some time this will trigger
an exception.

Fixes: 3ba4066d08 "ossaudio: port to the new audio backend api"

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
---
 audio/ossaudio.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/audio/ossaudio.c b/audio/ossaudio.c
index f88d076ec2..a7dcaa31ad 100644
--- a/audio/ossaudio.c
+++ b/audio/ossaudio.c
@@ -691,6 +691,7 @@ static size_t oss_read(HWVoiceIn *hw, void *buf, size_t len)
                            len, dst);
                 break;
             }
+            break;
         }
 
         pos += nread;
-- 
2.26.2


