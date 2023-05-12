Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86329700BFE
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 17:36:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxUn0-0003L5-Vp; Fri, 12 May 2023 11:34:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pxUmx-0003JM-TZ
 for qemu-devel@nongnu.org; Fri, 12 May 2023 11:34:35 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pxUmu-00061P-UL
 for qemu-devel@nongnu.org; Fri, 12 May 2023 11:34:35 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-3f450815d0bso37956185e9.0
 for <qemu-devel@nongnu.org>; Fri, 12 May 2023 08:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683905671; x=1686497671;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=AXV2plFqMtuy0pHb/J9d/CLNGI8Bz2t89kpWW/Hiui4=;
 b=aJVbGG78QeZf5aSXmQR0vvxEwktz5Pu0OpvyuijgyTCfczpBQMIWHLJbQouIWHTS1L
 eDhiOPf6p7GeoOh7R4zD43GKvQ4M8vfHSQ4+MDTG80QWSv2sZX2Y3dszVghkQcaPVNYV
 nZYQ8TCIBiHsIXIfqcotN5Qx+cwTxM8CZUhVk/MFzwGbrdPFApdfeXSq5R8t2p07MpwF
 /w1C1f/Km5KDPZg5zhoUWL1KMhwQXabUKIBD4esSSF0LZ5dz1PFfLRPBlixnodR+mNyy
 3aCjnHXasQjsu4FTKIonG84v0/V7Y1skcfkhggbNxtiD971yKkGKmkAi9ConTd4GT9BJ
 CuNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683905671; x=1686497671;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AXV2plFqMtuy0pHb/J9d/CLNGI8Bz2t89kpWW/Hiui4=;
 b=d/y3B2sk/9YqgdZ+E+yeWXctP+EzjoFg5g5ywfoLFbmlAcF0jKwSgbgrTzVTpBz+ob
 bGDstCGPlkVdIiDgahTXt/+3g+IBamstu3X9nxaR5w8B8DK2yZ2LfxjBLPFy0tR8Gp4U
 3+DUAgNxhrVKl2uJ4a/l8RdWkX02r9W7N6eEcYkXBbjBx7DBeAKRWPYRsIcLaEolQH5W
 rIcWb7e8X5Y1RAO8LdG95BrIEt4m4n8ieR7k3gm0Xlhq1Ktx4DegrvL16seBx57Pum55
 2QwdI8bvjTqObYnKL2cF64NPp2msRzi71rjA7rZ12D3ERlSp0ewJx6OP+plqvLZSHsXY
 wE7A==
X-Gm-Message-State: AC+VfDwHAtiMJ7j9Srvu9DvNFX0hzM1aeEh0e1nhzUoam4QgLSQ0hsKr
 2isQ5448TNdA3ai9sVa5mIRt245/mJE69ENRbLY=
X-Google-Smtp-Source: ACHHUZ6huxlsi6aRlxXQ+tQ65HkxJNk7v0p5nuv/zQ1Oz3hKTB1VZ+1RqG5Wafh0lS14tuvUKIyI6A==
X-Received: by 2002:adf:eec4:0:b0:307:97dd:1de2 with SMTP id
 a4-20020adfeec4000000b0030797dd1de2mr13424425wrp.25.1683905670911; 
 Fri, 12 May 2023 08:34:30 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 b6-20020adfee86000000b002feea065cc9sm11721297wro.111.2023.05.12.08.34.30
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 May 2023 08:34:30 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 11/12] tests/qtest: Don't run cdrom boot tests if no
 accelerator is present
Date: Fri, 12 May 2023 16:34:22 +0100
Message-Id: <20230512153423.3704893-12-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230512153423.3704893-1-peter.maydell@linaro.org>
References: <20230512153423.3704893-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Fabiano Rosas <farosas@suse.de>

On a build configured with: --disable-tcg --enable-xen it is possible
to produce a QEMU binary with no TCG nor KVM support. Skip the cdrom
boot tests if that's the case.

Fixes: 0c1ae3ff9d ("tests/qtest: Fix tests when no KVM or TCG are present")
Signed-off-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-id: 20230508181611.2621-4-farosas@suse.de
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 tests/qtest/cdrom-test.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/tests/qtest/cdrom-test.c b/tests/qtest/cdrom-test.c
index 26a2400181a..31d3bacd8c3 100644
--- a/tests/qtest/cdrom-test.c
+++ b/tests/qtest/cdrom-test.c
@@ -130,6 +130,11 @@ static void test_cdboot(gconstpointer data)
 
 static void add_x86_tests(void)
 {
+    if (!qtest_has_accel("tcg") && !qtest_has_accel("kvm")) {
+        g_test_skip("No KVM or TCG accelerator available, skipping boot tests");
+        return;
+    }
+
     qtest_add_data_func("cdrom/boot/default", "-cdrom ", test_cdboot);
     qtest_add_data_func("cdrom/boot/virtio-scsi",
                         "-device virtio-scsi -device scsi-cd,drive=cdr "
@@ -176,6 +181,11 @@ static void add_x86_tests(void)
 
 static void add_s390x_tests(void)
 {
+    if (!qtest_has_accel("tcg") && !qtest_has_accel("kvm")) {
+        g_test_skip("No KVM or TCG accelerator available, skipping boot tests");
+        return;
+    }
+
     qtest_add_data_func("cdrom/boot/default", "-cdrom ", test_cdboot);
     qtest_add_data_func("cdrom/boot/virtio-scsi",
                         "-device virtio-scsi -device scsi-cd,drive=cdr "
-- 
2.34.1


