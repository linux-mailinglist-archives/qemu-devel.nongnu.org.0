Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DBC133E0A8
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 22:35:56 +0100 (CET)
Received: from localhost ([::1]:35752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMHM3-0003iw-4V
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 17:35:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lMH3X-0006oJ-Fl
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 17:16:47 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:58183)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lMH3Q-0003xe-Ql
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 17:16:47 -0400
Received: from localhost.localdomain ([82.142.20.38]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1Mq2vU-1m0Xo50cny-00nDIn; Tue, 16 Mar 2021 22:16:39 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 3/7] mac_via: allow long accesses to VIA registers
Date: Tue, 16 Mar 2021 22:16:27 +0100
Message-Id: <20210316211631.107417-4-laurent@vivier.eu>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210316211631.107417-1-laurent@vivier.eu>
References: <20210316211631.107417-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:UeqSUK+xGf941NCWE3ZYcaOibw4lGD8AwgGdxU+eErOYHKbiSBM
 9oBKrjqqpOm7JVSvAY0dIhIimirVNiw4BtzUFDTa9siJaY1pSMvgatRoTvsTwym0i/HO9af
 W+WnZK18TNLVhlFg/SagqVEPkc++iicosPuHgE9Py+Z9R6C25OZzCVrDIOBsgWJw7eLcnbD
 v07o755fYqJnMfUJDkbBQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:CqQ+QiX23uI=:DibJsKiCSofcvT3zE0yhGt
 nrZZkL/qRmMw3a6/6rxW/ujBVbo1JGKP4tEbTt7ZkFYKaenWB4MqG5VvhXdRe+Of9wWQvLOMq
 /HLnnaCHhwhOmcI4O9YEMxwf928y0p61qYWizg/zt/r7Jf9Zlqbdz0caADGWV3PJkPoHFF8DJ
 SdsHCzA1/UnT1Pl2KQ+7CM2ry5Pn4CaTGLJdAvMy+jMIf1qKf/AotzsEqYIoywuSocL3x0Mr9
 mTmgbMCXw+NVcT2YdrbVCmBKYuVIPeNMN2HkVDO4ooJWiOsMr2oolcFQbKWPa7mxPHbUmeISm
 kcNmhM/Hb9uBzdnLQw/DHHVEonFThzYMpsR2Fi+h2ZgmzqdUsJhJzcmsnFc9slyuR4jfREKE/
 BaC+Lipw/q1dZO7QGCTDWqwmAHpAvR2h7BatOD2DGtBgBQwPTYCtJuO/LCE3pE92lVKlbDEWX
 ZeexvW38zQ==
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

The MacOS SCSI driver uses a long access to read the VIA registers rather than
just a single byte during the message out phase.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20210311100505.22596-4-mark.cave-ayland@ilande.co.uk>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/misc/mac_via.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/misc/mac_via.c b/hw/misc/mac_via.c
index 0a25de577cf9..8810eb97ccb7 100644
--- a/hw/misc/mac_via.c
+++ b/hw/misc/mac_via.c
@@ -966,7 +966,7 @@ static const MemoryRegionOps mos6522_q800_via1_ops = {
     .endianness = DEVICE_BIG_ENDIAN,
     .valid = {
         .min_access_size = 1,
-        .max_access_size = 1,
+        .max_access_size = 4,
     },
 };
 
@@ -995,7 +995,7 @@ static const MemoryRegionOps mos6522_q800_via2_ops = {
     .endianness = DEVICE_BIG_ENDIAN,
     .valid = {
         .min_access_size = 1,
-        .max_access_size = 1,
+        .max_access_size = 4,
     },
 };
 
-- 
2.30.2


