Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83C69494ABB
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 10:28:59 +0100 (CET)
Received: from localhost ([::1]:44702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nATkY-0001ET-4C
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 04:28:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nASvc-0006VA-SV
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 03:36:22 -0500
Received: from mout.kundenserver.de ([212.227.126.134]:43839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nASva-0001f0-Rw
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 03:36:20 -0500
Received: from quad ([82.142.13.186]) by mrelayeu.kundenserver.de (mreue009
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MGi6k-1n6dA12Uqo-00DqdV; Thu, 20
 Jan 2022 09:36:11 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 2/3] hw/elf_ops: clear uninitialized segment space
Date: Thu, 20 Jan 2022 09:36:06 +0100
Message-Id: <20220120083607.1672319-3-laurent@vivier.eu>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220120083607.1672319-1-laurent@vivier.eu>
References: <20220120083607.1672319-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:oxSlAxUUbMOXEdTjbjigochLRZi6wOTFcGg0J6OPfGNKDwWnDop
 Y/23BdoF0iaQpCxFFNU30l3/TWxztDD3klOVvsxZrcP7hUv+671s8a4AuCC9p0loA60IEIN
 lnFw9t8NFB3tfXJfXqNsqCylBOfoO0gROdd4+lu+eCF+5KtrD+khvxZxF4hZ/+SB+zEdf9Q
 vPzEXjNh8VfMksM9BeYoQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:9N9+Xl8nSiA=:/iXEumih70kVjKCtS+wSbJ
 w6K3ptZyA3SdPE3+cl4qRfxBjMDTT3t89p1z5kTmjZ4YtnxAM9cA5iyZ5OcZyPT43LOpzjn5h
 U3NuX+E93twD5X0IxYT4n7QFi708L96DMfgzFb+xa/94hUsLJEavbrvo5IameN/94SC2Ip0hM
 K9MOy/3H2jcUF8ZwCGVnbCy+lVmhcjhURrLzDPLtL2jmAuWZuzheH38a8bHMNVYBPCSQfZwHQ
 uWLjSe4XdD6VF3lQN3zzuVeZfB08J82ismZI3tokvlPyeXy0zfIGvx4zVoOTDxOExs5Zz64XR
 g36Hsu85kDSgxV76exSnbq42lgqRhf2P+WVnYp97WAQkV9qpC4mRLQk6Y0Xu+ikQe3nOw8pyr
 Quh+6sD6T0qhmuq1rQSc0d1kOC0LaTClrMibZsUhDH3/dGNhthDMRyfmv7u0BWQcsBauDkXFk
 3XXmRPbADTNNCKRlEti/hk7LxJbyTP5kEs2ZSseQKW5RNTOBMheKzb/RkhRsSXsOF3F3Cz2iF
 hRrOxo7sjPOTFvsZCV+dpTtRFLi6e564f0kOJLrepYV5Ozz0MvYjV10c8x3rc2HGBfM3bYhwr
 uUW2eexXRCFifuN93Rs4Kve8T2okz1eUactnGRYJ01q+Y2NgrDLC8o1Ixci/7GBwuqwcBIxCA
 ZBxDPpkL7wWdYKlQ9G3KJMw3uU2IqjVeaQ4S2zvWyCO2BPTOas3hKpvHOWHYjkeu1rRA=
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
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
Message-Id: <20220115203725.3834712-3-laurent@vivier.eu>
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


