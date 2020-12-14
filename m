Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B03B2D9287
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 06:17:44 +0100 (CET)
Received: from localhost ([::1]:43454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kogEx-0005rp-5K
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 00:17:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kofwZ-0005Mh-16; Sun, 13 Dec 2020 23:58:43 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:59057 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kofwW-0004t8-VB; Sun, 13 Dec 2020 23:58:42 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4CvTfs5G3tz9sWd; Mon, 14 Dec 2020 15:58:13 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1607921893;
 bh=tvLvZbPS4B+j9KrzKvfJ/AHDko2QUtZv+6SzqvCnXnY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hfRQkWT6vV6KeV5NU7ct5z3tDAhEJGpcc7Z+xwvyF9WYAva48rM6TAbYC3rrR97YT
 K2ICgzrsclVgk35gSj04a9uQDZNWBlg7hn9e87T7BMMAF6eHLZFd46QtJQzQXZuBIj
 xBbHpY6rLeN3LuyAhTZg81FNPhZDgZ1ax984GmOs=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 21/30] target/ppc: Remove "compat" property of server class
 POWER CPUs
Date: Mon, 14 Dec 2020 15:57:58 +1100
Message-Id: <20201214045807.41003-22-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201214045807.41003-1-david@gibson.dropbear.id.au>
References: <20201214045807.41003-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?J=C3=A1n=20Tomko?= <jtomko@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Greg Kurz <groug@kaod.org>

This property has been deprecated since QEMU 5.0 by commit 22062e54bb68.
We only kept a legacy hack that internally converts "compat" into the
official "max-cpu-compat" property of the pseries machine type.

According to our deprecation policy, we could have removed it for QEMU 5.2
already. Do it now ; since ppc_cpu_parse_featurestr() now just calls the
generic parent_parse_features handler, drop it as well.

Users are supposed to use the "max-cpu-compat" property of the pseries
machine type instead.

Signed-off-by: Greg Kurz <groug@kaod.org>
Message-Id: <20201201131103.897430-1-groug@kaod.org>
Reviewed-by: Ján Tomko <jtomko@redhat.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 docs/system/deprecated.rst      |  7 ----
 target/ppc/translate_init.c.inc | 59 ---------------------------------
 2 files changed, 66 deletions(-)

diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
index 565389697e..09c8f380bc 100644
--- a/docs/system/deprecated.rst
+++ b/docs/system/deprecated.rst
@@ -281,13 +281,6 @@ a future version of QEMU. It's unclear whether anybody is still using
 CPU emulation in QEMU, and there are no test images available to make
 sure that the code is still working.
 
-``compat`` property of server class POWER CPUs (since 5.0)
-''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
-
-The ``compat`` property used to set backwards compatibility modes for
-the processor has been deprecated. The ``max-cpu-compat`` property of
-the ``pseries`` machine type should be used instead.
-
 ``lm32`` CPUs (since 5.2.0)
 '''''''''''''''''''''''''''
 
diff --git a/target/ppc/translate_init.c.inc b/target/ppc/translate_init.c.inc
index 78cc8f043b..e4082cfde7 100644
--- a/target/ppc/translate_init.c.inc
+++ b/target/ppc/translate_init.c.inc
@@ -10470,63 +10470,6 @@ static ObjectClass *ppc_cpu_class_by_name(const char *name)
     return oc;
 }
 
-static void ppc_cpu_parse_featurestr(const char *type, char *features,
-                                     Error **errp)
-{
-    Object *machine = qdev_get_machine();
-    const PowerPCCPUClass *pcc = POWERPC_CPU_CLASS(object_class_by_name(type));
-
-    if (!features) {
-        return;
-    }
-
-    if (object_property_find(machine, "max-cpu-compat")) {
-        int i;
-        char **inpieces;
-        char *s = features;
-        Error *local_err = NULL;
-        char *compat_str = NULL;
-
-        /*
-         * Backwards compatibility hack:
-         *
-         *   CPUs had a "compat=" property which didn't make sense for
-         *   anything except pseries.  It was replaced by "max-cpu-compat"
-         *   machine option.  This supports old command lines like
-         *       -cpu POWER8,compat=power7
-         *   By stripping the compat option and applying it to the machine
-         *   before passing it on to the cpu level parser.
-         */
-        inpieces = g_strsplit(features, ",", 0);
-        *s = '\0';
-        for (i = 0; inpieces[i]; i++) {
-            if (g_str_has_prefix(inpieces[i], "compat=")) {
-                warn_report_once("CPU 'compat' property is deprecated; "
-                    "use max-cpu-compat machine property instead");
-                compat_str = inpieces[i];
-                continue;
-            }
-            if ((i != 0) && (s != features)) {
-                s = g_stpcpy(s, ",");
-            }
-            s = g_stpcpy(s, inpieces[i]);
-        }
-
-        if (compat_str) {
-            char *v = compat_str + strlen("compat=");
-            object_property_set_str(machine, "max-cpu-compat", v, &local_err);
-        }
-        g_strfreev(inpieces);
-        if (local_err) {
-            error_propagate(errp, local_err);
-            return;
-        }
-    }
-
-    /* do property processing with generic handler */
-    pcc->parent_parse_features(type, features, errp);
-}
-
 PowerPCCPUClass *ppc_cpu_get_family_class(PowerPCCPUClass *pcc)
 {
     ObjectClass *oc = OBJECT_CLASS(pcc);
@@ -10905,8 +10848,6 @@ static void ppc_cpu_class_init(ObjectClass *oc, void *data)
     device_class_set_parent_reset(dc, ppc_cpu_reset, &pcc->parent_reset);
 
     cc->class_by_name = ppc_cpu_class_by_name;
-    pcc->parent_parse_features = cc->parse_features;
-    cc->parse_features = ppc_cpu_parse_featurestr;
     cc->has_work = ppc_cpu_has_work;
     cc->do_interrupt = ppc_cpu_do_interrupt;
     cc->cpu_exec_interrupt = ppc_cpu_exec_interrupt;
-- 
2.29.2


