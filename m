Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 129FC2026A9
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Jun 2020 23:10:29 +0200 (CEST)
Received: from localhost ([::1]:36652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jmkku-0006mW-5k
	for lists+qemu-devel@lfdr.de; Sat, 20 Jun 2020 17:10:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1jmkfO-0005Fe-3D
 for qemu-devel@nongnu.org; Sat, 20 Jun 2020 17:04:46 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:40776)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1jmkfL-0001g9-8t
 for qemu-devel@nongnu.org; Sat, 20 Jun 2020 17:04:45 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id D6097748DDC;
 Sat, 20 Jun 2020 23:04:32 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id BCB6574633D; Sat, 20 Jun 2020 23:04:32 +0200 (CEST)
Message-Id: <cover.1592686588.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v3 0/9] More sm501 fixes and optimisations
Date: Sat, 20 Jun 2020 22:56:28 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/20 17:04:33
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

Version 3: added R-b tags and new patch to fix overlap checks.
Hopefully I got it right this time, unless there are any more comments
this should be good to go.

BALATON Zoltan (9):
  sm501: Fix bounds checks
  sm501: Drop unneded variable
  sm501: Ignore no-op blits
  sm501: Introduce variable for commonly used value for better
    readability
  sm501: Optimise 1 pixel 2d ops
  sm501: Use stn_he_p/ldn_he_p instead of switch/case
  sm501: Do not allow guest to set invalid format
  sm501: Convert debug printfs to traces
  sm501: Fix and optimize overlap check

 hw/display/sm501.c      | 157 +++++++++++++++++++---------------------
 hw/display/trace-events |  12 +++
 2 files changed, 87 insertions(+), 82 deletions(-)

-- 
2.21.3


