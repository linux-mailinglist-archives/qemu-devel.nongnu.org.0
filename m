Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCCE547E2BF
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 12:56:34 +0100 (CET)
Received: from localhost ([::1]:50044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0Mi1-0004Lm-Tx
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 06:56:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n0MdN-0004Hz-DO
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 06:51:45 -0500
Received: from [2a00:1450:4864:20::42e] (port=37405
 helo=mail-wr1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n0MdJ-0008PU-Li
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 06:51:43 -0500
Received: by mail-wr1-x42e.google.com with SMTP id t26so10947717wrb.4
 for <qemu-devel@nongnu.org>; Thu, 23 Dec 2021 03:51:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vmTIMyAdr5v455+RyAf/WlQE2D/VjJkdmaYmn7hvd+w=;
 b=c+xRP/3LbULORcf1ve2v4jDKUot9lf+tWVPBmLPqqQEOfhNriBm3aJqWxgxQF63ep8
 xl90gqENE6zGwc7Yyb0ULbtLW0Iuelo4mdHbuMrzO8seQwJToBlIcTE/TK3hn3pLA8Ba
 e20wAvGMC0qxygj2SNugDZyNpKmH5JZRjkxqBsU0C/e6ZWo9r0Q6RkF7DvJedPl3wMtr
 LBHGqTy5cqt2ZE7+OZxKu8WEC//IrkZWYdrFkmq3efL0EmwLA1wxFELPXk5RYwH+kB5Q
 Tz+/KXyZ5N7qalTsDK6Yt0cTtqHyRCai6vXZHMDlM9qiSF0g4j4+TQXTAVlbamdJybE0
 +RJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=vmTIMyAdr5v455+RyAf/WlQE2D/VjJkdmaYmn7hvd+w=;
 b=JwdBGyovnWITxWVG69clry9wwmtL8UQst5VavwjzbJouODqol/PCicr2Kvd9GvXoqg
 GpGMtq2BPdOw+C8av4w4IghApVbu6OlcJrjrsmgg7MWrhzs1fsm7Nt1nnrKOvRGwV3Kh
 4hZI/SFLWpMNoQsZsm9mBPAu+ukZlvVlqBkCntVwmSSeQsIVisUlaUXZrB3E0q6l4kaD
 Ph+V19LdqIsn43HpWfQfiKuD6vOWx4tp9KYczgzqf0b0EkLJY2g3aSq7arhymGkuJ4D2
 ufHTptyHn3f/WXillaGsKUsPEaqSBgcrTNnCpUzatMeoM97VrHYSvG5XlsTSfCItpN+2
 3Jgg==
X-Gm-Message-State: AOAM532ySG1wiuUFdC8xAM07oGNE9Ic5Gflo938XMVkCyIJ+yLOuPbCL
 reaGxAr7xK5xiJgosNruykzdCRN9lj0=
X-Google-Smtp-Source: ABdhPJwAw+dYnXDOdR1p3CSnCslPz/VPuZXegp+a8zZyVZvNh1EommsHqTTnpwtyOGSRavgzU+ZstQ==
X-Received: by 2002:a05:6000:1543:: with SMTP id
 3mr1550012wry.140.1640260300113; 
 Thu, 23 Dec 2021 03:51:40 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id o2sm4537106wru.109.2021.12.23.03.51.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Dec 2021 03:51:39 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 07/15] configure: do not set bsd_user/linux_user early
Date: Thu, 23 Dec 2021 12:51:26 +0100
Message-Id: <20211223115134.579235-8-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211223115134.579235-1-pbonzini@redhat.com>
References: <20211223115134.579235-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Similar to other optional features, leave the variables empty and compute
the actual value later.  Use the existence of include or source directories
to detect whether an OS or CPU supports respectively bsd-user and linux-user.

For now, BSD user-mode emulation is buildable even on TCI-only
architectures.  This probably will change once safe signals are
brought over from linux-user.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 28 +++++++++++++++++-----------
 1 file changed, 17 insertions(+), 11 deletions(-)

diff --git a/configure b/configure
index 0306f0c8bc..6516ec243c 100755
--- a/configure
+++ b/configure
@@ -320,8 +320,8 @@ linux="no"
 solaris="no"
 profiler="no"
 softmmu="yes"
-linux_user="no"
-bsd_user="no"
+linux_user=""
+bsd_user=""
 pkgversion=""
 pie=""
 qom_cast_debug="yes"
@@ -538,7 +538,6 @@ gnu/kfreebsd)
 ;;
 freebsd)
   bsd="yes"
-  bsd_user="yes"
   make="${MAKE-gmake}"
   # needed for kinfo_getvmmap(3) in libutil.h
 ;;
@@ -583,7 +582,6 @@ haiku)
 ;;
 linux)
   linux="yes"
-  linux_user="yes"
   vhost_user=${default_feature:-yes}
 ;;
 esac
@@ -1257,18 +1255,26 @@ if eval test -z "\${cross_cc_$cpu}"; then
     cross_cc_vars="$cross_cc_vars cross_cc_${cpu}"
 fi
 
-# For user-mode emulation the host arch has to be one we explicitly
-# support, even if we're using TCI.
-if [ "$ARCH" = "unknown" ]; then
-  bsd_user="no"
-  linux_user="no"
-fi
-
 default_target_list=""
 deprecated_targets_list=ppc64abi32-linux-user
 deprecated_features=""
 mak_wilds=""
 
+if [ "$linux_user" != no ]; then
+    if [ "$targetos" = linux ] && [ -d $source_path/linux-user/host/$cpu ]; then
+        linux_user=yes
+    elif [ "$linux_user" = yes ]; then
+        error_exit "linux-user not supported on this architecture"
+    fi
+fi
+if [ "$bsd_user" != no ]; then
+    if [ "$bsd_user" = "" ]; then
+        test $targetos = freebsd && bsd_user=yes
+    fi
+    if [ "$bsd_user" = yes ] && ! [ -d $source_path/bsd-user/$targetos ]; then
+        error_exit "bsd-user not supported on this host OS"
+    fi
+fi
 if [ "$softmmu" = "yes" ]; then
     mak_wilds="${mak_wilds} $source_path/configs/targets/*-softmmu.mak"
 fi
-- 
2.33.1



