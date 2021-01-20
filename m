Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B0A2FCE89
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 12:00:00 +0100 (CET)
Received: from localhost ([::1]:35966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2BDT-0001YG-LF
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 05:59:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1l2B82-0004dY-G4; Wed, 20 Jan 2021 05:54:22 -0500
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b]:39627)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1l2B80-0001SO-2X; Wed, 20 Jan 2021 05:54:22 -0500
Received: by mail-qt1-x82b.google.com with SMTP id z9so5982686qtv.6;
 Wed, 20 Jan 2021 02:54:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Vb6aeCHMcWb83D+eaNofIUROeE3/e/R1W34kvXPLJgs=;
 b=o+Uh4mXD7YFm4m5vSv36+2O3BhqodsP0+68w7hS5nGDx7aEoU5zdYAbTeSOXa307e/
 LuQnGpfkNKtXavpaW21wErKOrPYCrBfDX1C6hjxIccgimG3tmQZeHWYvzPyKrCJjftdI
 eX+IhBntZNegZ8PXZZyXmsLYOisgGfXpB4D3AgVwPR3QPD5c81Ptg+ttW68QTk5jaFn4
 Pi+eI419wwwrw+JUlJouUfZaPSqh4CzMVFFVICrS0r1/ynoc3BVq0jJnhUgF3TP6Wymq
 ErgTSF7lUVNQVJDCnokEF6WTQOfrPRKEeTpcD4mUbD/HppX2j7O2U6PNOrCrl+ituC4V
 dYXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Vb6aeCHMcWb83D+eaNofIUROeE3/e/R1W34kvXPLJgs=;
 b=EVuab+BGniJ2GELkwnWb08BVn0TJDh6rAc20lJ0UKuKEjhacAro0V1mpSn5sg6NTrx
 rAYd5Ta9TmuQ5uHbnvd78jyhBQyhvswf2UI7LPiWXHe2g4S2MwVC6ptu3FpzZfer0ncC
 iwHQjU/2d0FwjXGRm6VSzCnsrPrR7hRyrUYka4fdmBIjz4h/1YR6ZCHgbMBiA5e9Zfz0
 IQcuM8ZJm+s/EZFjuJ3sT4PswsTjlLKA3D3tuW2w3jfIrT1Sd8Sc6ENMgCwlrwRyce9B
 xjMQBJ/Yv6LmVIr1sM71dL7TPkFYOpT9CD5AE9MB/WxydRW7rIgvSrShO1WH40ox8bM6
 +TEg==
X-Gm-Message-State: AOAM530jgDo0eWy7qio0HkGNMscXIj/k8jMgAeQhgh5QJCPjwDP966bZ
 ZhKXdphUwe174A7Aty44Bgkwc9zFbyk=
X-Google-Smtp-Source: ABdhPJzpo3betT82PVIxnBKBdMCDYZIdiv1AxTy8m+A9SsAd6YYqGY3taRmQa+eGbfYgZpFNnW67ag==
X-Received: by 2002:ac8:6b93:: with SMTP id z19mr2168421qts.345.1611140058623; 
 Wed, 20 Jan 2021 02:54:18 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c7:a75a:cb34:ba60:6de6:be1d])
 by smtp.gmail.com with ESMTPSA id e12sm1045079qka.82.2021.01.20.02.54.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jan 2021 02:54:18 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/1] spapr_caps.c: check user input before warning about
 TCG only caps
Date: Wed, 20 Jan 2021 07:54:06 -0300
Message-Id: <20210120105406.163074-2-danielhb413@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210120105406.163074-1-danielhb413@gmail.com>
References: <20210120105406.163074-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82b;
 envelope-from=danielhb413@gmail.com; helo=mail-qt1-x82b.google.com
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit 006e9d361869 added warning messages for cap-cfpc, cap-ibs and
cap-sbbc when enabled under TCG. Commit 8ff43ee404d3 did the same thing
when introducing cap-ccf-assist.

These warning messages, although benign to the machine launch, can make
users a bit confused. E.g:

$ sudo ./ppc64-softmmu/qemu-system-ppc64
qemu-system-ppc64: warning: TCG doesn't support requested feature, cap-cfpc=workaround
qemu-system-ppc64: warning: TCG doesn't support requested feature, cap-sbbc=workaround
qemu-system-ppc64: warning: TCG doesn't support requested feature, cap-ibs=workaround
qemu-system-ppc64: warning: TCG doesn't support requested feature, cap-ccf-assist=on

We're complaining about "TCG doesn't support requested feature" when the
user didn't request any of those caps in the command line.

Check if these caps were set in the command line before sending an user
warning.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/spapr_caps.c | 47 ++++++++++++++++++++++++++++++++++-----------
 1 file changed, 36 insertions(+), 11 deletions(-)

diff --git a/hw/ppc/spapr_caps.c b/hw/ppc/spapr_caps.c
index 9341e9782a..629c24a96d 100644
--- a/hw/ppc/spapr_caps.c
+++ b/hw/ppc/spapr_caps.c
@@ -244,9 +244,15 @@ static void cap_safe_cache_apply(SpaprMachineState *spapr, uint8_t val,
     uint8_t kvm_val =  kvmppc_get_cap_safe_cache();
 
     if (tcg_enabled() && val) {
-        /* TCG only supports broken, allow other values and print a warning */
-        warn_report("TCG doesn't support requested feature, cap-cfpc=%s",
-                    cap_cfpc_possible.vals[val]);
+        /*
+         * TCG only supports broken, allow other values and print a warning
+         * in case the user attempted to set a different value in the command
+         * line.
+         */
+        if (spapr->cmd_line_caps[SPAPR_CAP_CFPC] != SPAPR_CAP_BROKEN) {
+            warn_report("TCG doesn't support requested feature, cap-cfpc=%s",
+                        cap_cfpc_possible.vals[val]);
+        }
     } else if (kvm_enabled() && (val > kvm_val)) {
         error_setg(errp,
                    "Requested safe cache capability level not supported by KVM");
@@ -269,9 +275,15 @@ static void cap_safe_bounds_check_apply(SpaprMachineState *spapr, uint8_t val,
     uint8_t kvm_val =  kvmppc_get_cap_safe_bounds_check();
 
     if (tcg_enabled() && val) {
-        /* TCG only supports broken, allow other values and print a warning */
-        warn_report("TCG doesn't support requested feature, cap-sbbc=%s",
-                    cap_sbbc_possible.vals[val]);
+        /*
+         * TCG only supports broken, allow other values and print a warning
+         * in case the user attempted to set a different value in the command
+         * line.
+         */
+        if (spapr->cmd_line_caps[SPAPR_CAP_SBBC] != SPAPR_CAP_BROKEN) {
+            warn_report("TCG doesn't support requested feature, cap-sbbc=%s",
+                        cap_sbbc_possible.vals[val]);
+        }
     } else if (kvm_enabled() && (val > kvm_val)) {
         error_setg(errp,
 "Requested safe bounds check capability level not supported by KVM");
@@ -297,9 +309,15 @@ static void cap_safe_indirect_branch_apply(SpaprMachineState *spapr,
     uint8_t kvm_val = kvmppc_get_cap_safe_indirect_branch();
 
     if (tcg_enabled() && val) {
-        /* TCG only supports broken, allow other values and print a warning */
-        warn_report("TCG doesn't support requested feature, cap-ibs=%s",
-                    cap_ibs_possible.vals[val]);
+        /*
+         * TCG only supports broken, allow other values and print a warning
+         * in case the user attempted to set a different value in the command
+         * line.
+         */
+        if (spapr->cmd_line_caps[SPAPR_CAP_IBS] != SPAPR_CAP_BROKEN) {
+            warn_report("TCG doesn't support requested feature, cap-ibs=%s",
+                        cap_ibs_possible.vals[val]);
+        }
     } else if (kvm_enabled() && (val > kvm_val)) {
         error_setg(errp,
 "Requested safe indirect branch capability level not supported by KVM");
@@ -483,8 +501,15 @@ static void cap_ccf_assist_apply(SpaprMachineState *spapr, uint8_t val,
     uint8_t kvm_val = kvmppc_get_cap_count_cache_flush_assist();
 
     if (tcg_enabled() && val) {
-        /* TCG doesn't implement anything here, but allow with a warning */
-        warn_report("TCG doesn't support requested feature, cap-ccf-assist=on");
+        /*
+         * TCG doesn't implement anything here, but allow with a warning
+         * in case the user attempted to set a different value in the command
+         * line.
+         */
+        if (spapr->cmd_line_caps[SPAPR_CAP_CCF_ASSIST] != SPAPR_CAP_OFF) {
+            warn_report("TCG doesn't support requested feature, "
+                        "cap-ccf-assist=on");
+        }
     } else if (kvm_enabled() && (val > kvm_val)) {
         uint8_t kvm_ibs = kvmppc_get_cap_safe_indirect_branch();
 
-- 
2.26.2


