Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1B55381781
	for <lists+qemu-devel@lfdr.de>; Sat, 15 May 2021 12:13:13 +0200 (CEST)
Received: from localhost ([::1]:42154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhrIG-0004RN-VH
	for lists+qemu-devel@lfdr.de; Sat, 15 May 2021 06:13:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lhr9J-00061F-6D; Sat, 15 May 2021 06:03:58 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:56337)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lhr9E-0006SD-LA; Sat, 15 May 2021 06:03:56 -0400
Received: from quad ([82.142.31.78]) by mrelayeu.kundenserver.de (mreue109
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MeTwY-1l7Prq1Mwe-00aS8T; Sat, 15
 May 2021 12:03:46 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 11/16] hw/mem/meson: Fix linking sparse-mem device with fuzzer
Date: Sat, 15 May 2021 12:03:30 +0200
Message-Id: <20210515100335.1245468-12-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210515100335.1245468-1-laurent@vivier.eu>
References: <20210515100335.1245468-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:rG0nZGNhMImR4A9ianrVpPGs4B32ER585wwcosGaFY+HOYcq7OM
 bE/oB8IdSzfVF4t9GNCOtIcIVl6gIegjUMv7ZfeWvxGhdXlK9lGHSnpCMN5ijHcGAFvUPLt
 Y9f3sDbZmyWNCXSzExsmCXcUR1hPWc3eJxjg+Ms0oE3pOoskxU4XjRSIhQ7MhmK76gOom4H
 yDRpAmwfP7rtbz9njjp5w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:FEFbDzrr9Tw=:bPipkksH6fk5o7dnVksqOL
 I8Vf46cPcH66Ths7PrkeVe6Eu+vqvzW/44PhG74bXMcvZ8tv7tJb7s9lOlt+najzbjCajLv47
 1LWNHu5nLxr3CQv3+/Q+d3utJWb2TOftyKu6xObXHou8Ceby9yvYMxP6OFzQ13XzUQt4utmSR
 kPGdsCH6E5mIa4Z3xszDxwET/jcAy8B96zdf5tTBmECxxbsLMU1X/AgCH10YO35N04kb4OdLF
 2yOpzxDIGvo9FT1lF3wljZj62tUNHtqXxTK1NanvQdB0mswtPDYLM51YTOGEEWIKMkEojOm6S
 dQQsTScgKIO30Q6zJp5ucrWKnw36w056l9MkZt4hr0PDNKWXj9Oe96DtTWuT0XN9ngbnukFZB
 7ZNA6cAFYRnvsQhipwP2SaNByjYKizvxBB5D9oxl35vbrOVULmbVQldJPpXq5NDMoBn7BXNnU
 kIyOSP9j1z9DLApZIpGjzHNQtmK9BOlm0osly6WIG9YbOfNQAJGeLju55xgT7bmeCoaEU3jxj
 E7QZKg9H2oztBaR5ci1lu8=
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 Alexander Bulekov <alxndr@bu.edu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

sparse-mem.c is added to the 'mem_ss' source set, which itself
is conditionally added to softmmu_ss if CONFIG_MEM_DEVICE is
selected.
But if CONFIG_MEM_DEVICE isn't selected, we get a link failure
even if CONFIG_FUZZ is selected:

  /usr/bin/ld: tests_qtest_fuzz_generic_fuzz.c.o: in function `generic_pre_fuzz':
  tests/qtest/fuzz/generic_fuzz.c:826: undefined reference to `sparse_mem_init'
  clang-10: error: linker command failed with exit code 1 (use -v to see invocation)

Fix by adding sparse-mem.c directly to the softmmu_ss set.

Fixes: 230376d285b ("memory: add a sparse memory device for fuzzing")
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Alexander Bulekov <alxndr@bu.edu>
Message-Id: <20210406133944.4193691-1-philmd@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/mem/meson.build | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/mem/meson.build b/hw/mem/meson.build
index ef79e046787c..3c8fdef9f9e9 100644
--- a/hw/mem/meson.build
+++ b/hw/mem/meson.build
@@ -1,8 +1,9 @@
 mem_ss = ss.source_set()
 mem_ss.add(files('memory-device.c'))
-mem_ss.add(when: 'CONFIG_FUZZ', if_true: files('sparse-mem.c'))
 mem_ss.add(when: 'CONFIG_DIMM', if_true: files('pc-dimm.c'))
 mem_ss.add(when: 'CONFIG_NPCM7XX', if_true: files('npcm7xx_mc.c'))
 mem_ss.add(when: 'CONFIG_NVDIMM', if_true: files('nvdimm.c'))
 
 softmmu_ss.add_all(when: 'CONFIG_MEM_DEVICE', if_true: mem_ss)
+
+softmmu_ss.add(when: 'CONFIG_FUZZ', if_true: files('sparse-mem.c'))
-- 
2.31.1


