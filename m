Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB19842DFAD
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 18:51:10 +0200 (CEST)
Received: from localhost ([::1]:45046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mb3wj-00069T-Tn
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 12:51:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mb3cP-0003vS-CO
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 12:30:12 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:39912)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mb3cM-0000q7-Np
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 12:30:08 -0400
Received: by mail-ed1-x533.google.com with SMTP id ec8so26616234edb.6
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 09:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Lm4cSr3hwZFhtpL9gf7YtW4ZZpF9fqVta4celsFuw+E=;
 b=XvHmCR8IB5pVXUM7o9x5fkz1pcpGz5yTuT0/kSUa8RE4mHFm473zFmSG07FEzmjarT
 uRDkt05zQ6g6w92Xe7qpBVgsltmSbcBM6a3AJwzU4Xm3vV1nKpgT5vKgvtps9cnDDgZg
 qpc7BDPhfXy7UTj9Q+ZhvcFu231nis411nAtGj1k+HqqZlarmD+jKwjq+TEfY8nqIpWq
 BUhbbX3nHJH//niftDEwhzS6kCDznJw5t0hTlQwhguS/bfSXN8OeZjvR5xkgnOkGk0wp
 cLtXfLCUEaqrgb8HEuCyGKZeXQk6j6CTxe8HB1i/OtydIrStLCJ8cn+YaEd4TL0qt1js
 3uug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Lm4cSr3hwZFhtpL9gf7YtW4ZZpF9fqVta4celsFuw+E=;
 b=x14ZY2+CzbF93p9npjdbY0cmeK32AubpAXKN0jHyW6w/qQCRcY8d2Nak7CtV0CDUlf
 fd2UdZK4a7wMMvNQ+HFi628lxd3O+IiV1nZs332dLg+0dYriE9Jrovp1+RqiPMqCR/Ec
 elFQUAZqkWlXkHegPqAQO5yW/QxKEGw9CnzQom7GKVrkb0Rsmae4XPKRFlHQBkjz9R6C
 k2IB/eyp7qif9qAwRuUn4GGMZklvg1F/wswmxYdJGMUgpQr2vmLHibbyOjF9b1Mhpy4Z
 T7Qh0SdtYkTpJQi/6Uz6/c78/E9P1F/Qwhs5+sg3g/NsZ6OkXYaaF+l8Kl/2rljceX9i
 UaPQ==
X-Gm-Message-State: AOAM533ZIva9KHsSQvGLfLjiC6vT1gUqb+QP2L2LHBUujGKvKbCpLqDV
 QCSAj+j9jlgkCJXxbOuW2heG4jKw7t0=
X-Google-Smtp-Source: ABdhPJxVnLN1ESeZydIdmTIP6qtq6fRt5zrNFMObSOcucHdVQhkIimcekp2El5gZ39NkkZS+FXTr1g==
X-Received: by 2002:a17:906:a3c4:: with SMTP id
 ca4mr4866771ejb.529.1634229003432; 
 Thu, 14 Oct 2021 09:30:03 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id x22sm2658404edv.14.2021.10.14.09.30.02
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 09:30:02 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 25/26] meson-buildoptions: include list of tracing backends
Date: Thu, 14 Oct 2021 18:29:37 +0200
Message-Id: <20211014162938.430211-26-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211014162938.430211-1-pbonzini@redhat.com>
References: <20211014162938.430211-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x533.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Manually patch the introspection data to include the tracing backends.
This works around a deficiency in Meson that will be fixed by
https://github.com/mesonbuild/meson/pull/9395.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 scripts/meson-buildoptions.py | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/scripts/meson-buildoptions.py b/scripts/meson-buildoptions.py
index 71ee56bd22..d48af99aaf 100755
--- a/scripts/meson-buildoptions.py
+++ b/scripts/meson-buildoptions.py
@@ -58,7 +58,23 @@ def print_parse(options):
     print("}")
 
 
+def fixup_options(options):
+    # Meson <= 0.60 does not include the choices in array options, fix that up
+    for opt in options:
+        if opt["name"] == "trace_backends":
+            opt["choices"] = [
+                "dtrace",
+                "ftrace",
+                "log",
+                "nop",
+                "simple",
+                "syslog",
+                "ust",
+            ]
+
+
 options = load_options(json.load(sys.stdin))
+fixup_options(options)
 print("# This file is generated by meson-buildoptions.py, do not edit!")
 print_help(options)
 print_parse(options)
-- 
2.31.1



