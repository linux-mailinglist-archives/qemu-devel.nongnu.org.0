Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 095F036EC34
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 16:15:41 +0200 (CEST)
Received: from localhost ([::1]:54324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lc7S7-00072F-Hv
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 10:15:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lc7QB-0005O0-IQ
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 10:13:39 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:48465)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lc7Q8-0004PP-JA
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 10:13:39 -0400
Received: from quad ([82.142.25.254]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1M277h-1laBTX0ccz-002YB6; Thu, 29
 Apr 2021 16:13:30 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 3/3] hw/core/loader: clear uninitialized ROM space
Date: Thu, 29 Apr 2021 16:13:26 +0200
Message-Id: <20210429141326.69245-4-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210429141326.69245-1-laurent@vivier.eu>
References: <20210429141326.69245-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:E5vZqCFWX0qANu6Nt+14ZKXCz03mOvDw9vYTYcPcwLiaJKRWKPA
 sc+TcLimudzYyxC3Bw95jK3+rHgy3a8wx8EpQj0L7YXkXf01vxdkYV5LmteN6HiVKz3g93r
 JhxMvaq2yeTtHvxaJgLdzQvKyhA/tCsFOfTC87udLAHAurOtMmgpHx4P5SXuSXjzWTlTa/j
 kf+Oc5Vvt5X46s8pOMxug==
X-UI-Out-Filterresults: notjunk:1;V03:K0:wB6gdQmjKjI=:UnhnodhE3PexAvw3WHWwEf
 1knsWPo8UFRp9ifwDQ1GorDNde/MQTugN689nbOLje/huRqRaYc9HuV8W7R8Vc4p2cD5/f5vB
 sC7rlocolP/Ra+UqvxjU6NBVyLDPAQoauXxEFRe4CfCmTXeBLZrd6zIOqS2ZPJ+go3u4kcb47
 q7i92cgat//stDAsE9JvqPKRVhpalKETRr2gw1L4XmySGa4UNdfH95NSav6lR7gxs0WPI5jhH
 sB4faPWH0UDGIeVpz7b4y00b5vSTFxOpHfJv1K1vHJyRzS7LEFG24qthTcEwh55/2RCNQRrlY
 h8ooV+GX4/NYlzEPG1XPGqdjHUy41jxHL70uGe4WUxlm98u7FNadrTELNtLIKpvnTLO7cG+MO
 fbQ+JKP/NE5kl4QV/XjPmkKSiiFEYGCJ5iT5+3BRTjc4E4yUGCbE+RknSroVt6NLIhoMLqL85
 Sbq7YmJOkp/jseUHpleRAriYdK2ypklheb0HU/NLtAbypUgNvhMukNwVaooFCWKw2Q8C5JNBZ
 FQr4zzEzOiPm10NU+i97Ho=
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As for "hw/elf_ops: clear uninitialized segment space" we need to
clear the uninitialized space when the ELF is set in ROM.

Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/core/loader.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/core/loader.c b/hw/core/loader.c
index d3e5f3b423f6..8146fdcbb7a0 100644
--- a/hw/core/loader.c
+++ b/hw/core/loader.c
@@ -1146,9 +1146,13 @@ static void rom_reset(void *unused)
         if (rom->mr) {
             void *host = memory_region_get_ram_ptr(rom->mr);
             memcpy(host, rom->data, rom->datasize);
+            memset(host + rom->datasize, 0, rom->romsize - rom->datasize);
         } else {
             address_space_write_rom(rom->as, rom->addr, MEMTXATTRS_UNSPECIFIED,
                                     rom->data, rom->datasize);
+            address_space_set(rom->as, rom->addr + rom->datasize, 0,
+                              rom->romsize - rom->datasize,
+                              MEMTXATTRS_UNSPECIFIED);
         }
         if (rom->isrom) {
             /* rom needs to be written only once */
-- 
2.31.1


