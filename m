Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53D31458785
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 01:53:49 +0100 (CET)
Received: from localhost ([::1]:57396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1moxae-0005Fn-F0
	for lists+qemu-devel@lfdr.de; Sun, 21 Nov 2021 19:53:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1moxWW-00047V-32
 for qemu-devel@nongnu.org; Sun, 21 Nov 2021 19:49:32 -0500
Received: from [2607:f8b0:4864:20::834] (port=39699
 helo=mail-qt1-x834.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1moxWU-0000xM-Pn
 for qemu-devel@nongnu.org; Sun, 21 Nov 2021 19:49:31 -0500
Received: by mail-qt1-x834.google.com with SMTP id l8so15086623qtk.6
 for <qemu-devel@nongnu.org>; Sun, 21 Nov 2021 16:49:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gHJPyg96EiGaZTwMNA9CxKSWCqvgoAEHKGY19qxWG4E=;
 b=AXRLHCIreDU226QBunwXH2GIDh6rzVZaAhgjeSdexT7MXWO4X2XH9ZuVNWeeXLJDUW
 nkkVrqWct4FvSx1EU4Wvi6dGyeRhPJOV/qUws2AM5gMkG/o8saCkkjXyJvSOroXrYDdu
 BPJ/wLy5ZdMzeAYXEMgHyvpMahArPL2e90ktZNMqedgvgXtvX450uZdGtlS506f3jewK
 Mj3uy0Tg4M6qVHN4bTxnqMTqI+bmw5+or3tdSJLoh2T0H5DGke0O2PcEu2mrbzuTsARy
 cVeklnNWmMdrJQuOJcFORAoF62sH8kOgpWjjxOEs+NsTpAE8/GgbWpMo8MuPewT72ahK
 sDwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gHJPyg96EiGaZTwMNA9CxKSWCqvgoAEHKGY19qxWG4E=;
 b=o64reRwgbJkUEMAmiy/0yGz2WNZZOf/pzutvnGkHwu6mEQmODXgG3vXSQgzQZar2QF
 pQJEB3k0c7ZzgV6REp2b1/Xr7srT56TCutjSRJqyaKE+JDkLxQErDX3zMEwINSkQDrch
 ZEtid5CbZnqJzmVJOYi78cGjrk/zc9FIeskO4P4tLynmfY9m1JsMEn5miRIfHN1VvSnG
 7sme/8z7G57Pl+k5azf8gzcKDzLLAOfUMY6qrixR4HKasEK0fiO/iCoNjcYYBFjbolzC
 Hw6qm9dlfzaIdasOqaMVb4UT/Es73bNT+6nDip+8jbznOy1FkxXaiKldEmm1ix5Ft+pS
 +9BA==
X-Gm-Message-State: AOAM533jeTpX2dtk7vYd09PZdFs7OgWxG1TYD3HoBbuqPkcP3Vb1u5/6
 6YAHcnFTKJ1Ff3KW+ZNVV43cVABGYcMk3A==
X-Google-Smtp-Source: ABdhPJwN4EavcUpOuSwnDDZJK9LYNeNkNta++fdQF9xAejkxeIEH5eL2qfHhc5jM+W+Kk9VFN7/3cg==
X-Received: by 2002:a05:622a:1a03:: with SMTP id
 f3mr26880193qtb.141.1637542169549; 
 Sun, 21 Nov 2021 16:49:29 -0800 (PST)
Received: from localhost.localdomain
 (209-6-248-219.s2265.c3-0.wrx-ubr1.sbo-wrx.ma.cable.rcncustomer.com.
 [209.6.248.219])
 by smtp.gmail.com with ESMTPSA id x17sm3651745qta.66.2021.11.21.16.49.28
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 21 Nov 2021 16:49:29 -0800 (PST)
From: Will Cohen <wwcohen@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 06/11] 9p: darwin: Compatibility defn for XATTR_SIZE_MAX
Date: Sun, 21 Nov 2021 19:49:08 -0500
Message-Id: <20211122004913.20052-7-wwcohen@gmail.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211122004913.20052-1-wwcohen@gmail.com>
References: <20211122004913.20052-1-wwcohen@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::834
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::834;
 envelope-from=wwcohen@gmail.com; helo=mail-qt1-x834.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Keno Fischer <keno@juliacomputing.com>, Greg Kurz <groug@kaod.org>,
 hi@alyssa.is, Michael Roitzsch <reactorcontrol@icloud.com>,
 Will Cohen <wwcohen@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Keno Fischer <keno@juliacomputing.com>

Signed-off-by: Keno Fischer <keno@juliacomputing.com>
Signed-off-by: Michael Roitzsch <reactorcontrol@icloud.com>
[Will Cohen: - Adjust coding style]
Signed-off-by: Will Cohen <wwcohen@gmail.com>
---
 hw/9pfs/9p.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
index c941b46f60..d671995aa4 100644
--- a/hw/9pfs/9p.c
+++ b/hw/9pfs/9p.c
@@ -3943,6 +3943,14 @@ out_nofid:
     v9fs_string_free(&name);
 }
 
+#if defined(CONFIG_DARWIN) && !defined(XATTR_SIZE_MAX)
+/*
+ * Darwin doesn't seem to define a maximum xattr size in its user
+ * space header, but looking at the kernel source, HFS supports
+ *  up to INT32_MAX, so use that as the maximum.
+ */
+#define XATTR_SIZE_MAX INT32_MAX
+#endif
 static void coroutine_fn v9fs_xattrcreate(void *opaque)
 {
     int flags, rflags = 0;
-- 
2.34.0


