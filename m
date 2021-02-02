Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C5B30CD9D
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 22:07:38 +0100 (CET)
Received: from localhost ([::1]:53120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l72tc-0003Uh-BT
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 16:07:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l72lh-0002RK-S8
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 15:59:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:30968)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l72lf-00079y-M8
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 15:59:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612299563;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ND9ZC1FHVt0d7eciPZVn1MRDtBcHT7RVOlI71H770Mo=;
 b=K2Yd95sa7HqiwpnDtX7hcIjdztOzTLaDQJk2ZbgS6xI2XZFJVO6LORDW4sb7lponu7k17V
 JsG65gKkwB8BaRDDZrWQwYvvq8isJqCfn13CVr5+sATC/MBXF3SyN5l6G2bFygKXkTC9D4
 12PHekA2nIgU/DCE1l1r8H6/d+Vos2c=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-326-vdG8eKCNPPmgXDrohOPkTA-1; Tue, 02 Feb 2021 15:59:21 -0500
X-MC-Unique: vdG8eKCNPPmgXDrohOPkTA-1
Received: by mail-ed1-f70.google.com with SMTP id a26so10289189edx.8
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 12:59:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ND9ZC1FHVt0d7eciPZVn1MRDtBcHT7RVOlI71H770Mo=;
 b=tsTlH9Yg0NaH0477JR3TV0vj3LkmLryHHEs0u26lylqnI6K7WAZdJ1hbI1kFDVos3M
 5L7sPoV1P2xFwdq0lrbMyTfukMLCStDBi2RSvBRcqsa5nAfgCD/UaMi1T2xQxZvhgrO6
 Qf27L8mvtssqwcq8dP/OkCfnUkxBM9JTIMY4DlABcnaNj8wa0h/YkvYdtc2u02IIbsbr
 Rcwd4hWviFKoJUEBNAAcderU1UyPKQ2fMBSXnmjlEgaNWue0+I7Z1WQo2HLs9+uN9Hs7
 3xTSdDigZhmR5HiHHBTwm3ERI0P5dZ6bO3z7dy33EVbZ7ijh6EvJ/zjsdcgEruq1UNC0
 82Dg==
X-Gm-Message-State: AOAM5314hagWjns8li6rM7h4iGSjtGRHNuis5OtdmM0+AMvLJ+5j0eHi
 g9URqRVyGHjEjwGbmHZOHMciQ3XTL/ORFCi4peciSAqU7wWQkM1tt6A40pRYzbJ7UsK0kRL6KYR
 pclPoq/5XRMlDzDPFEIQQmoO+oq+qy6paiTXLT5aOD++i4670Gzg2ovDTGvI3DTE7
X-Received: by 2002:a17:906:1c11:: with SMTP id
 k17mr12127663ejg.70.1612299560117; 
 Tue, 02 Feb 2021 12:59:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzc66eDSSH+BNcm5+dNYek0/hknrIf+zCDC3iL5UggY339OUoxodhKrOYqWwBngv8T0oBxHgg==
X-Received: by 2002:a17:906:1c11:: with SMTP id
 k17mr12127633ejg.70.1612299559816; 
 Tue, 02 Feb 2021 12:59:19 -0800 (PST)
Received: from x1w.redhat.com (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id lz12sm3436ejb.71.2021.02.02.12.59.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 12:59:19 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 07/12] scripts/device-crash-test: Replace the word 'whitelist'
Date: Tue,  2 Feb 2021 21:58:19 +0100
Message-Id: <20210202205824.1085853-8-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210202205824.1085853-1-philmd@redhat.com>
References: <20210202205824.1085853-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Otubo <otubo@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Michael Roth <michael.roth@amd.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Follow the inclusive terminology from the "Conscious Language in your
Open Source Projects" guidelines [*] and replace the word "whitelist"
appropriately.

[*] https://github.com/conscious-lang/conscious-lang-docs/blob/main/faq.md

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 scripts/device-crash-test | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/scripts/device-crash-test b/scripts/device-crash-test
index 04118669ba7..6812de42f8c 100755
--- a/scripts/device-crash-test
+++ b/scripts/device-crash-test
@@ -41,18 +41,18 @@ logger = logging.getLogger('device-crash-test')
 dbg = logger.debug
 
 
-# Purposes of the following whitelist:
+# Purposes of the following allowlist:
 # * Avoiding verbose log messages when we find known non-fatal
 #   (exitcode=1) errors
 # * Avoiding fatal errors when we find known crashes
 # * Skipping machines/devices that are known not to work out of
 #   the box, when running in --quick mode
 #
-# Keeping the whitelist updated is desirable, but not required,
+# Keeping the allowlist updated is desirable, but not required,
 # because unexpected cases where QEMU exits with exitcode=1 will
 # just trigger a INFO message.
 
-# Valid whitelist entry keys:
+# Valid allowlist entry keys:
 # * accel: regexp, full match only
 # * machine: regexp, full match only
 # * device: regexp, full match only
@@ -62,7 +62,7 @@ dbg = logger.debug
 # * expected: if True, QEMU is expected to always fail every time
 #   when testing the corresponding test case
 # * loglevel: log level of log output when there's a match.
-ERROR_WHITELIST = [
+ERROR_ALLOWLIST = [
     # Machines that won't work out of the box:
     #             MACHINE                         | ERROR MESSAGE
     {'machine':'niagara', 'expected':True},       # Unable to load a firmware for -M niagara
@@ -187,9 +187,9 @@ ERROR_WHITELIST = [
 
 
 def whitelistTestCaseMatch(wl, t):
-    """Check if a test case specification can match a whitelist entry
+    """Check if a test case specification can match a allowlist entry
 
-    This only checks if a whitelist entry is a candidate match
+    This only checks if a allowlist entry is a candidate match
     for a given test case, it won't check if the test case
     results/output match the entry.  See whitelistResultMatch().
     """
@@ -206,16 +206,16 @@ def whitelistTestCaseMatch(wl, t):
 
 def whitelistCandidates(t):
     """Generate the list of candidates that can match a test case"""
-    for i, wl in enumerate(ERROR_WHITELIST):
+    for i, wl in enumerate(ERROR_ALLOWLIST):
         if whitelistTestCaseMatch(wl, t):
             yield (i, wl)
 
 
 def findExpectedResult(t):
-    """Check if there's an expected=True whitelist entry for a test case
+    """Check if there's an expected=True allowlist entry for a test case
 
     Returns (i, wl) tuple, where i is the index in
-    ERROR_WHITELIST and wl is the whitelist entry itself.
+    ERROR_ALLOWLIST and wl is the allowlist entry itself.
     """
     for i, wl in whitelistCandidates(t):
         if wl.get('expected'):
@@ -223,7 +223,7 @@ def findExpectedResult(t):
 
 
 def whitelistResultMatch(wl, r):
-    """Check if test case results/output match a whitelist entry
+    """Check if test case results/output match a allowlist entry
 
     It is valid to call this function only if
     whitelistTestCaseMatch() is True for the entry (e.g. on
@@ -237,10 +237,10 @@ def whitelistResultMatch(wl, r):
 
 
 def checkResultWhitelist(r):
-    """Look up whitelist entry for a given test case result
+    """Look up allowlist entry for a given test case result
 
     Returns (i, wl) tuple, where i is the index in
-    ERROR_WHITELIST and wl is the whitelist entry itself.
+    ERROR_ALLOWLIST and wl is the allowlist entry itself.
     """
     for i, wl in whitelistCandidates(r['testcase']):
         if whitelistResultMatch(wl, r):
@@ -544,7 +544,7 @@ def main():
 
         if f:
             i, wl = checkResultWhitelist(f)
-            dbg("testcase: %r, whitelist match: %r", t, wl)
+            dbg("testcase: %r, allowlist match: %r", t, wl)
             wl_stats.setdefault(i, []).append(f)
             level = wl.get('loglevel', logging.DEBUG)
             logFailure(f, level)
@@ -561,9 +561,9 @@ def main():
 
     if args.debug:
         stats = sorted([(len(wl_stats.get(i, [])), wl) for i, wl in
-                         enumerate(ERROR_WHITELIST)], key=lambda x: x[0])
+                         enumerate(ERROR_ALLOWLIST)], key=lambda x: x[0])
         for count, wl in stats:
-            dbg("whitelist entry stats: %d: %r", count, wl)
+            dbg("allowlist entry stats: %d: %r", count, wl)
 
     if fatal_failures:
         for f in fatal_failures:
-- 
2.26.2


