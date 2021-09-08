Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30B9E4041B8
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 01:22:15 +0200 (CEST)
Received: from localhost ([::1]:51410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mO6tR-0000hU-FK
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 19:22:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mO6rt-0006JV-6p
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 19:20:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49403)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mO6rr-0002bN-Fd
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 19:20:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631143233;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=24r6QApw3vBXmuZyf+4hmvAM+x9sjvcUeNKNebXV07M=;
 b=YOy/EIFlO+uj5rMwhhVn/Ebt55DcxcKrYDJ6SRUVk6YNFJGbBUGwZPsoQxtDz85TIP0L9b
 Nn4kpSUOof6K0GTvg/Bz1GPDMg9tfNk8Mh7Rw/n3oLvQhBb7vTXYqJEKh7tmItH3/RbISP
 j7SfmJW1NBZo2Mc7sJKzOmccLMuo8Qg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-586-__LQsZ7jPESpPDJW6YTypA-1; Wed, 08 Sep 2021 19:20:32 -0400
X-MC-Unique: __LQsZ7jPESpPDJW6YTypA-1
Received: by mail-wm1-f72.google.com with SMTP id
 v21-20020a05600c215500b002fa7eb53754so32280wml.4
 for <qemu-devel@nongnu.org>; Wed, 08 Sep 2021 16:20:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=24r6QApw3vBXmuZyf+4hmvAM+x9sjvcUeNKNebXV07M=;
 b=hWZrAB+qBS4ZuzUaX2D4uqjEkMHPR9NYUNdKSUIydtEf6D8bEnoSurHTJ+no5Elifm
 cV4N6FFziFXwr1ynN7RlJ3Ht0U2//etHOVN8uBWXih06Ug9LfNOvFtOtjKuULwAItVyR
 W43foJQy0d7g/x/U/Ce810esiPr2e5FLwQARyY83k8cHp1Gw29YDUE8lT0/2aQtJVcDd
 USVazOJYpPJxKdCWHginlLOmjQrZvgyH99N3faI0175IdvrBu7eQAnelNBjgI7dW/hct
 yfRrQRCt3x9m1x09DA1DxJwabwkaGYGagO4xAxH6pCZ41gQRQYm/2TMzt5Uh0grh9VsQ
 zyzw==
X-Gm-Message-State: AOAM531/YyQpsI+3vNkFfkCMkTqFbL7swzPfaBfz7ReY0dwbKaTRtuBk
 5/rGBs/ctYPi2jhkPUc03n18ZvDpWkDpq/HpeBGxz8u1ZfmtXB82BfJlmHi6nQItmV7wMm16D6E
 Fl/AQ0nMFpbQ1yV7BiYoq+X+xW+V4yWRsfQfBkZCCl4oAcZyEfcCVL64ebiAEzu6I
X-Received: by 2002:a1c:a505:: with SMTP id o5mr581218wme.32.1631143231229;
 Wed, 08 Sep 2021 16:20:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxASJCusoNVcbOBdnL042tIJLhajKX+g6Wmf6M6mn99T6nfkEBgAxNrSyEjSzJ0g2TtZ/mq2Q==
X-Received: by 2002:a1c:a505:: with SMTP id o5mr581183wme.32.1631143230848;
 Wed, 08 Sep 2021 16:20:30 -0700 (PDT)
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id d24sm351621wmb.35.2021.09.08.16.20.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 16:20:30 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 01/10] sysemu: Introduce qemu_security_policy_taint() API
Date: Thu,  9 Sep 2021 01:20:15 +0200
Message-Id: <20210908232024.2399215-2-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210908232024.2399215-1-philmd@redhat.com>
References: <20210908232024.2399215-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Prasad J Pandit <pjp@fedoraproject.org>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 xen-devel@lists.xenproject.org, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Introduce qemu_security_policy_taint() which allows unsafe (read
"not very maintained") code to 'taint' QEMU security policy.

The "security policy" is the @SecurityPolicy QAPI enum, composed of:
- "none"   (no policy, current behavior)
- "warn"   (display a warning when the policy is tainted, keep going)
- "strict" (once tainted, exit QEMU before starting the VM)

The qemu_security_policy_is_strict() helper is also provided, which
will be proved useful once a VM is started (example we do not want
to kill a running VM if an unsafe device is hot-added).

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 qapi/run-state.json   | 16 +++++++++++
 include/qemu-common.h | 19 ++++++++++++
 softmmu/vl.c          | 67 +++++++++++++++++++++++++++++++++++++++++++
 qemu-options.hx       | 17 +++++++++++
 4 files changed, 119 insertions(+)

diff --git a/qapi/run-state.json b/qapi/run-state.json
index 43d66d700fc..b15a107fa01 100644
--- a/qapi/run-state.json
+++ b/qapi/run-state.json
@@ -638,3 +638,19 @@
 { 'struct': 'MemoryFailureFlags',
   'data': { 'action-required': 'bool',
             'recursive': 'bool'} }
+
+##
+# @SecurityPolicy:
+#
+# An enumeration of the actions taken when the security policy is tainted.
+#
+# @none: do nothing.
+#
+# @warn: display a warning.
+#
+# @strict: prohibit QEMU to start a VM.
+#
+# Since: 6.2
+##
+{ 'enum': 'SecurityPolicy',
+  'data': [ 'none', 'warn', 'strict' ] }
diff --git a/include/qemu-common.h b/include/qemu-common.h
index 73bcf763ed8..bf0b054bb66 100644
--- a/include/qemu-common.h
+++ b/include/qemu-common.h
@@ -139,4 +139,23 @@ void page_size_init(void);
  * returned. */
 bool dump_in_progress(void);
 
+/**
+ * qemu_security_policy_taint:
+ * @tainting whether any security policy is tainted (compromised).
+ * @fmt: taint reason format string
+ * ...: list of arguments to interpolate into @fmt, like printf().
+ *
+ * Allow unsafe code path to taint the global security policy.
+ * See #SecurityPolicy.
+ */
+void qemu_security_policy_taint(bool tainting, const char *fmt, ...)
+        GCC_FMT_ATTR(2, 3);
+
+/**
+ * qemu_security_policy_is_strict:
+ *
+ * Return %true if the global security policy is 'strict', %false otherwise.
+ */
+bool qemu_security_policy_is_strict(void);
+
 #endif
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 55ab70eb97f..92c05ac97ee 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -489,6 +489,20 @@ static QemuOptsList qemu_action_opts = {
     },
 };
 
+static QemuOptsList qemu_security_policy_opts = {
+    .name = "security-policy",
+    .implied_opt_name = "policy",
+    .merge_lists = true,
+    .head = QTAILQ_HEAD_INITIALIZER(qemu_security_policy_opts.head),
+    .desc = {
+        {
+            .name = "policy",
+            .type = QEMU_OPT_STRING,
+        },
+        { /* end of list */ }
+    },
+};
+
 const char *qemu_get_vm_name(void)
 {
     return qemu_name;
@@ -600,6 +614,52 @@ static int cleanup_add_fd(void *opaque, QemuOpts *opts, Error **errp)
 }
 #endif
 
+static SecurityPolicy security_policy = SECURITY_POLICY_NONE;
+
+bool qemu_security_policy_is_strict(void)
+{
+    return security_policy == SECURITY_POLICY_STRICT;
+}
+
+static int select_security_policy(const char *p)
+{
+    int policy;
+    char *qapi_value;
+
+    qapi_value = g_ascii_strdown(p, -1);
+    policy = qapi_enum_parse(&SecurityPolicy_lookup, qapi_value, -1, NULL);
+    g_free(qapi_value);
+    if (policy < 0) {
+        return -1;
+    }
+    security_policy = policy;
+
+    return 0;
+}
+
+void qemu_security_policy_taint(bool tainting, const char *fmt, ...)
+{
+    va_list ap;
+    g_autofree char *efmt = NULL;
+
+    if (security_policy == SECURITY_POLICY_NONE || !tainting) {
+        return;
+    }
+
+    va_start(ap, fmt);
+    if (security_policy == SECURITY_POLICY_STRICT) {
+        efmt = g_strdup_printf("%s taints QEMU security policy, exiting.", fmt);
+        error_vreport(efmt, ap);
+        exit(EXIT_FAILURE);
+    } else if (security_policy == SECURITY_POLICY_WARN) {
+        efmt = g_strdup_printf("%s taints QEMU security policy.", fmt);
+        warn_vreport(efmt, ap);
+    } else {
+        g_assert_not_reached();
+    }
+    va_end(ap);
+}
+
 /***********************************************************/
 /* QEMU Block devices */
 
@@ -2764,6 +2824,7 @@ void qemu_init(int argc, char **argv, char **envp)
     qemu_add_opts(&qemu_semihosting_config_opts);
     qemu_add_opts(&qemu_fw_cfg_opts);
     qemu_add_opts(&qemu_action_opts);
+    qemu_add_opts(&qemu_security_policy_opts);
     module_call_init(MODULE_INIT_OPTS);
 
     error_init(argv[0]);
@@ -3230,6 +3291,12 @@ void qemu_init(int argc, char **argv, char **envp)
                     exit(1);
                 }
                 break;
+            case QEMU_OPTION_security_policy:
+                if (select_security_policy(optarg) == -1) {
+                    error_report("unknown -security-policy parameter");
+                    exit(1);
+                }
+                break;
             case QEMU_OPTION_parallel:
                 add_device_config(DEV_PARALLEL, optarg);
                 default_parallel = 0;
diff --git a/qemu-options.hx b/qemu-options.hx
index 8f603cc7e65..d9939f7ae1d 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -4298,6 +4298,23 @@ SRST
 
 ERST
 
+DEF("security-policy", HAS_ARG, QEMU_OPTION_security_policy, \
+    "-security-policy none|warn|strict\n" \
+    "                 action when security policy is tainted [default=none]\n",
+    QEMU_ARCH_ALL)
+SRST
+``-security-policy policy``
+    The policy controls what QEMU will do when an unsecure feature is
+    used, tainting the process security. The default is ``none`` (do
+    nothing). Other possible actions are: ``warn`` (display a warning
+    and keep going) or ``strict`` (exits QEMU before launching a VM).
+
+    Examples:
+
+    ``-security-policy warn``; \ ``-security-policy strict``
+
+ERST
+
 DEF("echr", HAS_ARG, QEMU_OPTION_echr, \
     "-echr chr       set terminal escape character instead of ctrl-a\n",
     QEMU_ARCH_ALL)
-- 
2.31.1


