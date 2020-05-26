Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 983C81DFAF1
	for <lists+qemu-devel@lfdr.de>; Sat, 23 May 2020 22:18:11 +0200 (CEST)
Received: from localhost ([::1]:52532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jcaaw-00051j-8O
	for lists+qemu-devel@lfdr.de; Sat, 23 May 2020 16:18:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1jcaa5-0004Yy-FV
 for qemu-devel@nongnu.org; Sat, 23 May 2020 16:17:17 -0400
Received: from mailout05.t-online.de ([194.25.134.82]:56092)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1jcaa4-0002Cz-Gk
 for qemu-devel@nongnu.org; Sat, 23 May 2020 16:17:17 -0400
Received: from fwd24.aul.t-online.de (fwd24.aul.t-online.de [172.20.26.129])
 by mailout05.t-online.de (Postfix) with SMTP id 60D564207AAA;
 Sat, 23 May 2020 22:17:13 +0200 (CEST)
Received: from linpower.localnet
 (ESXGesZ-8huk1nGyLyIUmycUY9WnlJQ2t5J-4u5oRwPXne6C1HZOCXTCHcKsanbgwq@[79.208.25.125])
 by fwd24.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1jcaa0-0EXOJk0; Sat, 23 May 2020 22:17:12 +0200
Received: by linpower.localnet (Postfix, from userid 1000)
 id 3CE5B2006D8; Sat, 23 May 2020 22:17:12 +0200 (CEST)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH] audio/mixeng: fix clang 10+ warning
Date: Sat, 23 May 2020 22:17:12 +0200
Message-Id: <20200523201712.23908-1-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <6231bee7-8d72-fe5c-9b73-cf27f57ff379@t-online.de>
References: <6231bee7-8d72-fe5c-9b73-cf27f57ff379@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ID: ESXGesZ-8huk1nGyLyIUmycUY9WnlJQ2t5J-4u5oRwPXne6C1HZOCXTCHcKsanbgwq
X-TOI-EXPURGATEID: 150726::1590265032-00005513-B1C54894/0/0 CLEAN NORMAL
X-TOI-MSGID: 60f53d3e-e19f-4d17-ad24-8e7628cbb6e8
Received-SPF: none client-ip=194.25.134.82;
 envelope-from=volker.ruemelin@t-online.de; helo=mailout05.t-online.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/23 16:17:13
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Alexander Bulekov <alxndr@bu.edu>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The code in CONV_NATURAL_FLOAT() and CLIP_NATURAL_FLOAT()
seems to use the constant 2^31-0.5 to convert float to integer
and back. But the float type lacks the required precision and
the constant used for the conversion is 2^31. This is equiva-
lent to a [-1.f, 1.f] <-> [INT32_MIN, INT32_MAX + 1] mapping.

This patch explicitly writes down the used constant. The
compiler generated code doesn't change.

The constant 2^31 has an exact float representation and the
clang 10 compiler stops complaining about an implicit int to
float conversion with a changed value.

A few notes:
- The conversion of 1.f to INT32_MAX + 1 doesn't overflow. The
  type of the destination variable is int64_t.
- At a later stage one of the clip_* functions in
  audio/mixeng_template.h limits INT32_MAX + 1 to the integer
  range.
- The clip_natural_float_* functions in audio/mixeng.c convert
  INT32_MAX and INT32_MAX + 1 to 1.f.

Buglink: https://bugs.launchpad.net/bugs/1878627
Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
---
 audio/mixeng.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/audio/mixeng.c b/audio/mixeng.c
index 739a500449..924dcb858a 100644
--- a/audio/mixeng.c
+++ b/audio/mixeng.c
@@ -271,11 +271,12 @@ f_sample *mixeng_clip[2][2][2][3] = {
 #define CONV_NATURAL_FLOAT(x) (x)
 #define CLIP_NATURAL_FLOAT(x) (x)
 #else
-static const float float_scale = UINT_MAX / 2.f;
+/* macros to map [-1.f, 1.f] <-> [INT32_MIN, INT32_MAX + 1] */
+static const float float_scale = (int64_t)INT32_MAX + 1;
 #define CONV_NATURAL_FLOAT(x) ((x) * float_scale)
 
 #ifdef RECIPROCAL
-static const float float_scale_reciprocal = 2.f / UINT_MAX;
+static const float float_scale_reciprocal = 1.f / ((int64_t)INT32_MAX + 1);
 #define CLIP_NATURAL_FLOAT(x) ((x) * float_scale_reciprocal)
 #else
 #define CLIP_NATURAL_FLOAT(x) ((x) / float_scale)
-- 
2.26.1


