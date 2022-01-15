Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FCDF48F956
	for <lists+qemu-devel@lfdr.de>; Sat, 15 Jan 2022 21:41:12 +0100 (CET)
Received: from localhost ([::1]:53548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8prL-0005ul-Ji
	for lists+qemu-devel@lfdr.de; Sat, 15 Jan 2022 15:41:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n8pnw-000266-0s
 for qemu-devel@nongnu.org; Sat, 15 Jan 2022 15:37:40 -0500
Received: from mout.kundenserver.de ([217.72.192.75]:36285)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n8pnu-0002Mq-1N
 for qemu-devel@nongnu.org; Sat, 15 Jan 2022 15:37:39 -0500
Received: from quad ([82.142.13.186]) by mrelayeu.kundenserver.de (mreue106
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MxmFk-1mPOK70j0g-00zJ1z; Sat, 15
 Jan 2022 21:37:29 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/3] hw/elf_ops: clear uninitialized segment space
Date: Sat, 15 Jan 2022 21:37:24 +0100
Message-Id: <20220115203725.3834712-3-laurent@vivier.eu>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220115203725.3834712-1-laurent@vivier.eu>
References: <20220115203725.3834712-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:lRqGgEYPhVdLSRwIFyoIgTRQXiYpRLsFMS2/RB1J7ERpX0anawt
 qwGlCrt21BdAQ4D3v7gUxxtdp3tqZ6Xcr4D1MKAjr+ghkmRqUbE59HEt8EQxLKKsiHoCrD/
 epBq/VFJpWQmC2txozjXPlMhLgNGfhlDm1L1YBMqUD775044k8H0VV8kDbJpUZihS7y6SWC
 ES0FWx4bBLAlsvE90MV4g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Zh76AdTnYx8=:mwP0jrHXnXZHYALdoR+EMO
 tsRukarbgiU7SWuwS3dhrDqQzvj+7C3foWkkjmYtSK++CDI3QYFNqCV7zKUVu9zDDWpsxgPlH
 NGWFg+T2MPYBin/4rVsGKA3r4Uih+Wcg/sgiHKjDMAXoo7BdT3SiEZOB0GwuI7MEdfDJWAM2l
 mAVRbUIa+HVIy60yq4p927y0vQ5u6S91bjy7a3+won//H43gkyjZ1NE2NX+QI1gtWNWv0LXGB
 in80IRA9sNEaq8h+OSNHmDPqPWcPnY58skVs45T64/RD+KiSHM1xs8/zHkLHShFPlGjepfczR
 A+paYzZFwdBt/3fjbhd6VLUZCqg0NfW1REqfvkADI9bQr/eWWi5+cmqmwjBvForHfPBnCA+r6
 ucNCOzZkqt2+0VAgLaYUWuFya+va58lqq/iiaCmdHSFQE/UzyOMS8NMyy5p0N96xpjmQspF1O
 4stYVYfVU0SYIVimGK+NDrmnhSU767Lvp1WOvxDQHiVqsCeCXUwXFVzdkeqMyP/wHu1CVkprF
 gPv72RZgGA5eIQVDPTJKJyI+T+PJRnou7+70D7Ii+T+QPVvvY0gWZbJYv1NrrRq/GyYj3ypLH
 lQWdrnLIZu6BWQEBW47DUrEpdXc+Aszc+Ownyxao+8B4Ao3BNQeEgdk0q2L9y+XfsuaUO1Ypy
 MhTpilewFhg00wMberGU3Md7fZm0xc+5qi5Xx/yYuWTcbv9rPBaA8wroEifUz44g2YOs=
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When the mem_size of the segment is bigger than the file_size,
and if this space doesn't overlap another segment, it needs
to be cleared.

This bug is very similar to the one we had for linux-user,
22d113b52f41 ("linux-user: Fix loading of BSS segments"),
where .bss section is encoded as an extension of the the data
one by setting the segment p_memsz > p_filesz.

Signed-off-by: Laurent Vivier <laurent@vivier.eu>
[PMD: Use recently added address_space_set()]
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/hw/elf_ops.h | 13 +++++++++++++
 hw/core/loader.c     |  4 ++++
 2 files changed, 17 insertions(+)

diff --git a/include/hw/elf_ops.h b/include/hw/elf_ops.h
index 995de8495c27..7c3b1d0f6cc5 100644
--- a/include/hw/elf_ops.h
+++ b/include/hw/elf_ops.h
@@ -555,6 +555,19 @@ static ssize_t glue(load_elf, SZ)(const char *name, int fd,
                     if (res != MEMTX_OK) {
                         goto fail;
                     }
+                    /*
+                     * We need to zero'ify the space that is not copied
+                     * from file
+                     */
+                    if (file_size < mem_size) {
+                        res = address_space_set(as ? as : &address_space_memory,
+                                                addr + file_size, 0,
+                                                mem_size - file_size,
+                                                MEMTXATTRS_UNSPECIFIED);
+                        if (res != MEMTX_OK) {
+                            goto fail;
+                        }
+                    }
                 }
             }
 
diff --git a/hw/core/loader.c b/hw/core/loader.c
index 052a0fd7198b..19edb928e999 100644
--- a/hw/core/loader.c
+++ b/hw/core/loader.c
@@ -1164,9 +1164,13 @@ static void rom_reset(void *unused)
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
2.34.1


