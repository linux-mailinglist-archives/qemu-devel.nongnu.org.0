Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C52CE1FA53A
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Jun 2020 02:41:13 +0200 (CEST)
Received: from localhost ([::1]:47674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jkzf6-0003qz-Sd
	for lists+qemu-devel@lfdr.de; Mon, 15 Jun 2020 20:41:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1jkzZu-0004fH-TU
 for qemu-devel@nongnu.org; Mon, 15 Jun 2020 20:35:51 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:46224)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1jkzZr-0003ye-NL
 for qemu-devel@nongnu.org; Mon, 15 Jun 2020 20:35:50 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id DDFA0748DDC;
 Tue, 16 Jun 2020 02:35:40 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 689A37482C8; Tue, 16 Jun 2020 02:35:40 +0200 (CEST)
Message-Id: <a73902e1e3a50116ad87d210cac8b0b90e4de04d.1592266950.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1592266950.git.balaton@eik.bme.hu>
References: <cover.1592266950.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v2 3/8] sm501: Ignore no-op blits
Date: Tue, 16 Jun 2020 02:22:30 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/15 20:35:40
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Sebastian Bauer <mail@sebastianbauer.info>,
 Magnus Damm <magnus.damm@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Some guests seem to try source copy blits with same source and dest
which are no-op so avoid calling pixman for these.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/display/sm501.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/display/sm501.c b/hw/display/sm501.c
index 85d54b598f..3397ca9fbf 100644
--- a/hw/display/sm501.c
+++ b/hw/display/sm501.c
@@ -788,6 +788,11 @@ static void sm501_2d_operation(SM501State *s)
                               (rop2_source_is_pattern ?
                                   " with pattern source" : ""));
             }
+            /* Ignore no-op blits, some guests seem to do this */
+            if (src_base == dst_base && src_pitch == dst_pitch &&
+                src_x == dst_x && src_y == dst_y) {
+                break;
+            }
             /* Check for overlaps, this could be made more exact */
             uint32_t sb, se, db, de;
             sb = src_base + src_x + src_y * (width + src_pitch);
-- 
2.21.3


