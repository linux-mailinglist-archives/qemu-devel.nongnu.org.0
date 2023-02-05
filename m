Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B8B68AF46
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Feb 2023 11:09:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pObu8-0001Jg-2K; Sun, 05 Feb 2023 05:05:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pObtR-0000ys-OW; Sun, 05 Feb 2023 05:05:15 -0500
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pObtM-00057i-CR; Sun, 05 Feb 2023 05:05:04 -0500
Received: by mail-oi1-x22b.google.com with SMTP id r28so7619772oiw.3;
 Sun, 05 Feb 2023 02:04:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OdSpoWp1d2D6wf8OPpLeL41Q4sIU+AkIIxFkfG4flxk=;
 b=lDpW8+qvIRAsf8EmXR85FymKXuM6/I+8r2UrnjoQo5ftQe/p89Ih/EUpZEG7BUU1Ap
 ow/SF1jiW8lO4yocKpRreP5LD4gSn+N+lMMKg4tP03dSnuIAJzh8dCX/VnawY7CuHxC1
 s6rAX+Xp9tGsFeC0X0wCcfPm3jWkuemRcVhMkdluRErreHc/jE1yNe9r3k7Asjmk51bc
 g1tpbifzR4YkmZQoR6wyE2koDTMS53Butw+FyV5K3+cvKtwZvckGsT9mJYIGCceDrOCF
 dq9tv7goaa2mOSYw+HGBfEHF8jgr4ij+aFaRhTBFtCkHacp5EE2Ut9Wp23m/3Zzm9KnD
 9fYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OdSpoWp1d2D6wf8OPpLeL41Q4sIU+AkIIxFkfG4flxk=;
 b=O1Rknr5Ia2S0/nxUNg4Fqm+1Ati70xAqLghSq7TLnt7gwInsTDliWxEiFZXZE+om8d
 zzlETNbECtt0eQAFwfngdNgfxhjdS9EqPUUaEe+GgpkNQ/ROf9ul4ga2e0+C8PtOqOZH
 FAm5Jb07e04F/sY3Hul/ECc9H3nxjHbpYu9+JcyI6PrIQSBAmTWG6ZgDhst0vMJQ4Goh
 2pfmTYPe3jM+z06b03Y/t/9Tto4LjFCs8uP5xYmQaVHARC5nuLTEjv55f0VjQbAs4fD2
 KqDvUaK8MOYMFRpYJQ3gyJUBy34RftBaXaJaQhmN094Y2OjgVk0ZTKMuXQFXzUm+wWOV
 rTSQ==
X-Gm-Message-State: AO0yUKVgPjIkez5xmHEvVcpPznDSEX9Sdh7XQvsaIoZAjj7T4OwNM8Sw
 mnOVaWyaIMxDUwpMKWOWRfVG0QPA3tA=
X-Google-Smtp-Source: AK7set9yhbqqs3c2tWCKuPI//QOvrnMzXD5twQR6qV9XSi80gmhwsr2DDBiSgUlbsaay7P4qVrHReA==
X-Received: by 2002:a05:6808:54d:b0:36a:8422:d962 with SMTP id
 i13-20020a056808054d00b0036a8422d962mr7877495oig.2.1675591498863; 
 Sun, 05 Feb 2023 02:04:58 -0800 (PST)
Received: from grind.. ([191.19.125.138]) by smtp.gmail.com with ESMTPSA id
 s191-20020acaa9c8000000b003631fe1810dsm2730924oie.47.2023.02.05.02.04.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Feb 2023 02:04:58 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 Murilo Opsfelder Araujo <muriloo@linux.ibm.com>,
 Juan Quintela <quintela@redhat.com>
Subject: [PULL 02/16] tests/migration: add support for ppc64le for guestperf.py
Date: Sun,  5 Feb 2023 07:04:35 -0300
Message-Id: <20230205100449.2352781-3-danielhb413@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230205100449.2352781-1-danielhb413@gmail.com>
References: <20230205100449.2352781-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22b;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x22b.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>

Add support for ppc64le for guestperf.py. On ppc, console is usually
hvc0 and serial device for pseries machine is spapr-vty.

Signed-off-by: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Message-Id: <20220809002451.91541-3-muriloo@linux.ibm.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 tests/migration/guestperf/engine.py | 28 +++++++++++++++++++++++++---
 1 file changed, 25 insertions(+), 3 deletions(-)

diff --git a/tests/migration/guestperf/engine.py b/tests/migration/guestperf/engine.py
index 59fca2c70b..cc06fac592 100644
--- a/tests/migration/guestperf/engine.py
+++ b/tests/migration/guestperf/engine.py
@@ -281,6 +281,26 @@ def _migrate(self, hardware, scenario, src, dst, connect_uri):
                 resp = src.command("stop")
                 paused = True
 
+    def _is_ppc64le(self):
+        _, _, _, _, machine = os.uname()
+        if machine == "ppc64le":
+            return True
+        return False
+
+    def _get_guest_console_args(self):
+        if self._is_ppc64le():
+            return "console=hvc0"
+        else:
+            return "console=ttyS0"
+
+    def _get_qemu_serial_args(self):
+        if self._is_ppc64le():
+            return ["-chardev", "stdio,id=cdev0",
+                    "-device", "spapr-vty,chardev=cdev0"]
+        else:
+            return ["-chardev", "stdio,id=cdev0",
+                    "-device", "isa-serial,chardev=cdev0"]
+
     def _get_common_args(self, hardware, tunnelled=False):
         args = [
             "noapic",
@@ -289,8 +309,10 @@ def _get_common_args(self, hardware, tunnelled=False):
             "noreplace-smp",
             "cgroup_disable=memory",
             "pci=noearly",
-            "console=ttyS0",
         ]
+
+        args.append(self._get_guest_console_args())
+
         if self._debug:
             args.append("debug")
         else:
@@ -308,12 +330,12 @@ def _get_common_args(self, hardware, tunnelled=False):
             "-kernel", self._kernel,
             "-initrd", self._initrd,
             "-append", cmdline,
-            "-chardev", "stdio,id=cdev0",
-            "-device", "isa-serial,chardev=cdev0",
             "-m", str((hardware._mem * 1024) + 512),
             "-smp", str(hardware._cpus),
         ]
 
+        argv.extend(self._get_qemu_serial_args())
+
         if self._debug:
             argv.extend(["-device", "sga"])
 
-- 
2.39.1


