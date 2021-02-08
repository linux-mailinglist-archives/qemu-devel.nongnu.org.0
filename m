Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B2831435B
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 23:59:33 +0100 (CET)
Received: from localhost ([::1]:45028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9FVE-0004Rw-TA
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 17:59:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l9BCL-0002vz-00
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 13:23:45 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:43490)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l9BCJ-00064Q-GQ
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 13:23:44 -0500
Received: by mail-wr1-x429.google.com with SMTP id z6so18322748wrq.10
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 10:23:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZmniK0yzO+id8G0haBxNriDaxYyBXhcth1WQMA0kwrs=;
 b=CCrcVeLOh4kGQ9osxUe4OttGTZh/eGQnEu3yVoZQ+NmuFPyJfDyNmaOpPJ1LznO5uD
 Q/vhRbrubHH4sTC8xtVChJANLHNyy01dMUWBENBJrLp3+FOuBd6o2MqkNfdAByHJfsb/
 leM2xJ4qh8PVBCE4ToOpuo7oz36V7iGnVMRKXzhTEmCub5r2dtCHUGnXoiV5/OBaLrk9
 enyv5N2OkK153pyR+0LtioqwbxZ3tZbFfcAO93jS2uJspFau5TJsgM6LDqwrky+MLpAT
 Pe48HI+/1tbiBXW8J5U0OriHT2XvyGOIxBHjFf5gb6vaF4urvkA5Le+2owZjIzkTGudL
 ii0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ZmniK0yzO+id8G0haBxNriDaxYyBXhcth1WQMA0kwrs=;
 b=Y7VexnQqlvBtYwfhjOBQbKq2yVCnanGhxW6XeV8oNHRKBO+YOIVAHfBBh0sR5x0hDL
 +KWiH5n6XkcmhaEPi5mHM6KiOA2yihk4py8aRLiW+Ezm9moSiUsQ+BlVj9TGX6nCphQE
 YCD+bDeQ9rDhLncO380MA5DhYO24E7EIf5qaB2qhXsVYEqY6R4q5FZOwCQXcs5UKdrgo
 QJNOChoNktEOyuCNh6CscNSbGsXdMj63qAEikiMQxs74+VIxjDzBl3949tENDp2Cl4eS
 dhpjneCqSeqvKvUSCIJMBWx26Fq0zAVqWO1HHgA00LsKcFCDq67BwQabqJVBAWryWobO
 7wQQ==
X-Gm-Message-State: AOAM532+3OMd/ntFe3Kl2ZtUeV/pXwCJPgkxE0mhVVNRKRhIuBNzwqHC
 bidjIQEQ2Fj4aIUShon5wNk0VZsJZvBIgg==
X-Google-Smtp-Source: ABdhPJxYqYoD1o+oE3oc0QmZHk4bOILMT1lYKU1JxGMg9P/teXkaJjezRsqizkKtMCVu4hUmaGfJ0Q==
X-Received: by 2002:a5d:58ec:: with SMTP id f12mr20727541wrd.134.1612808620243; 
 Mon, 08 Feb 2021 10:23:40 -0800 (PST)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 x22sm19670wmc.25.2021.02.08.10.23.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 10:23:39 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 07/46] fuzz: add virtio-9p configurations for fuzzing
Date: Mon,  8 Feb 2021 19:22:52 +0100
Message-Id: <20210208182331.58897-8-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210208182331.58897-1-pbonzini@redhat.com>
References: <20210208182331.58897-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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
Cc: Alexander Bulekov <alxndr@bu.edu>, Darren Kenny <darren.kenny@oracle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alexander Bulekov <alxndr@bu.edu>

virtio-9p devices are often used to expose a virtual-filesystem to the
guest. There have been some bugs reported in this device, such as
CVE-2018-19364, and CVE-2021-20181. We should fuzz this device

This patch adds two virtio-9p configurations:
 * One with the widely used -fsdev local driver. This driver leaks some
   state in the form of files/directories created in the shared dir.
 * One with the synth driver. While it is not used in the real world, this
   driver won't leak leak state between fuzz inputs.

Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
Message-Id: <20210117230924.449676-4-alxndr@bu.edu>
---
 tests/qtest/fuzz/generic_fuzz_configs.h | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/tests/qtest/fuzz/generic_fuzz_configs.h b/tests/qtest/fuzz/generic_fuzz_configs.h
index 51e69c6e42..5d599765c4 100644
--- a/tests/qtest/fuzz/generic_fuzz_configs.h
+++ b/tests/qtest/fuzz/generic_fuzz_configs.h
@@ -19,6 +19,16 @@ typedef struct generic_fuzz_config {
     gchar* (*argfunc)(void); /* Result must be freeable by g_free() */
 } generic_fuzz_config;
 
+static inline gchar *generic_fuzzer_virtio_9p_args(void){
+    char tmpdir[] = "/tmp/qemu-fuzz.XXXXXX";
+    g_assert_nonnull(mkdtemp(tmpdir));
+
+    return g_strdup_printf("-machine q35 -nodefaults "
+    "-device virtio-9p,fsdev=hshare,mount_tag=hshare "
+    "-fsdev local,id=hshare,path=%s,security_model=mapped-xattr,"
+    "writeout=immediate,fmode=0600,dmode=0700", tmpdir);
+}
+
 const generic_fuzz_config predefined_configs[] = {
     {
         .name = "virtio-net-pci-slirp",
@@ -60,6 +70,16 @@ const generic_fuzz_config predefined_configs[] = {
         .name = "virtio-mouse",
         .args = "-machine q35 -nodefaults -device virtio-mouse",
         .objects = "virtio*",
+    },{
+        .name = "virtio-9p",
+        .argfunc = generic_fuzzer_virtio_9p_args,
+        .objects = "virtio*",
+    },{
+        .name = "virtio-9p-synth",
+        .args = "-machine q35 -nodefaults "
+        "-device virtio-9p,fsdev=hshare,mount_tag=hshare "
+        "-fsdev synth,id=hshare",
+        .objects = "virtio*",
     },{
         .name = "e1000",
         .args = "-M q35 -nodefaults "
-- 
2.29.2



