Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F0164CC216
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 17:01:10 +0100 (CET)
Received: from localhost ([::1]:34640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPnt7-0006xV-Ki
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 11:01:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nPnUW-0003CG-RU; Thu, 03 Mar 2022 10:35:44 -0500
Received: from [2607:f8b0:4864:20::c35] (port=39774
 helo=mail-oo1-xc35.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nPnUV-0000oQ-7W; Thu, 03 Mar 2022 10:35:44 -0500
Received: by mail-oo1-xc35.google.com with SMTP id
 i6-20020a4ac506000000b0031c5ac6c078so6163015ooq.6; 
 Thu, 03 Mar 2022 07:35:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aeKZrN08XBqiWTjZrO0Znq9TaiybBWNcFjhvvhGdonQ=;
 b=PtmSQy7wEpZ786phRc7CrfXQ63rPyXqHmk+d7gGskiGlNBkCqlDLg8MHbPivWodsir
 MM0x2pnYilxhussfPgwuhle6kKXih8zcWoi4mSazOckKlfoMKRcdtkIMCitwE41vN88y
 ryWvTW3pllKXScw7GzkVfeXdp/w/TpI68itV1lHW+KQZLC3ydVHKm+pK80t/DYBzK/cp
 yx7dIInqKo823WoS2pMBLozI1GUQ05LGl0mYA5pB/JFRFD8xNtgMJk/rgDDOO0y6g1A3
 zzOySBo/u7CocZbAeaks0LjRWOylU0qRQw6omzYBbg/aUpFS3UXMfYy4n8twcKXvfo7Z
 w2/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aeKZrN08XBqiWTjZrO0Znq9TaiybBWNcFjhvvhGdonQ=;
 b=bAcfgX4qo2bgogW7ZvAsfjJRUYibN/L1F74ORMbWybs1G8dcYbhsTDbh59P02alYuW
 PBsPpRBYrXxD9fGs5cnyKej2QR2mbkAzktYx7CQtI7kKG4sHtKI1tTQAOFEIeZoaOZ7e
 z+IqG2CtyRvH5Y5BtunqKbilVisEQlzsyIqJg1o7+b7hVCnTwjYtPNtds+kNnAFle0Hh
 SsknZSvcDZd4mKpN+QlRXbGUnSfK6gp28kh3TGs9JXfeq5gFrJ8p95SFznywmsURqOkR
 u2izaISgkAC2ssS+U+TuXHzwrpuCXbV+RkP+RiFLKIxSiLThlzjv1MJO7EjMvXzqU+Ry
 LAWQ==
X-Gm-Message-State: AOAM5331rTFSf7850GyM4IIrJHH62KIMlXC5N1yvXbe5CoxRtoVR6wCI
 DRcSy7esdG47/HxEOBltAW07oZyoO4U=
X-Google-Smtp-Source: ABdhPJzxkDQlxPU4nzG+qNqZq+ecaIiDWA6cp8IkBHLEj4Of0NIf1+U5hsBM808WdCkOZCHvBJA0TA==
X-Received: by 2002:a05:6870:e99f:b0:d6:f346:f281 with SMTP id
 r31-20020a056870e99f00b000d6f346f281mr4403611oao.74.1646321740300; 
 Thu, 03 Mar 2022 07:35:40 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c7:3b4a:a86f:f27d:30ef:6eb6])
 by smtp.gmail.com with ESMTPSA id
 dw7-20020a056870770700b000d9aa7a6d63sm1178798oab.6.2022.03.03.07.35.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 07:35:40 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/5] avocado/replay_kernel.py: make tcg-icount check in
 run_vm()
Date: Thu,  3 Mar 2022 12:35:17 -0300
Message-Id: <20220303153517.168943-6-danielhb413@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220303153517.168943-1-danielhb413@gmail.com>
References: <20220303153517.168943-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::c35
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::c35;
 envelope-from=danielhb413@gmail.com; helo=mail-oo1-xc35.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: thuth@redhat.com, Daniel Henrique Barboza <danielhb413@gmail.com>,
 qemu-ppc@nongnu.org, clg@kaod.org, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 crosa@redhat.com, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The icount framework relies on TCG availability. If QEMU is built with
--disable-tcg we won't have icount either, and then this test will fail
with the following message in an IBM POWER9 host:

tests/avocado/replay_kernel.py:ReplayKernelNormal.test_ppc64_pseries:
ERROR: ConnectError: Failed to establish session:
(...)
/11-tests_avocado_replay_kernel.py_ReplayKernelNormal.test_ppc64_pseries/replay.bin:
cannot configure icount, TCG support not available

Although this was revealed in a specific ppc64 scenario, the TCG check
is being done in the common code inside run_vm() because all archs need
TCG to have access to icount.

Cc: Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 tests/avocado/replay_kernel.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/avocado/replay_kernel.py b/tests/avocado/replay_kernel.py
index c68a953730..0b2b0dc692 100644
--- a/tests/avocado/replay_kernel.py
+++ b/tests/avocado/replay_kernel.py
@@ -36,6 +36,9 @@ class ReplayKernelBase(LinuxKernelTest):
 
     def run_vm(self, kernel_path, kernel_command_line, console_pattern,
                record, shift, args, replay_path):
+        # icount requires TCG to be available
+        self.require_accelerator('tcg')
+
         logger = logging.getLogger('replay')
         start_time = time.time()
         vm = self.get_vm()
@@ -243,6 +246,7 @@ def test_ppc64_pseries(self):
         """
         :avocado: tags=arch:ppc64
         :avocado: tags=machine:pseries
+        :avocado: tags=accel:tcg
         """
         kernel_url = ('https://archives.fedoraproject.org/pub/archive'
                       '/fedora-secondary/releases/29/Everything/ppc64le/os'
-- 
2.35.1


