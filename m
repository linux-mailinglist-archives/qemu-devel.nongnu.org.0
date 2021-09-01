Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E750D3FE00D
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 18:37:26 +0200 (CEST)
Received: from localhost ([::1]:57282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLTEr-0002LH-Ij
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 12:37:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLS8N-0008BT-VW
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 11:26:39 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:33478)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLS8L-0002wm-07
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 11:26:39 -0400
Received: by mail-wr1-x430.google.com with SMTP id d26so234703wrc.0
 for <qemu-devel@nongnu.org>; Wed, 01 Sep 2021 08:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bzHL0tw5XE8O4+6om5ojDvP15UJs4GGb2qZXwsUwtaw=;
 b=vQQm/+PHKHqd/o5xutnjqnUoSalLrke8RTcnvY5tbs36LzYcURwMWahVdD4oGq9nC0
 fsCJuNxhdkZ0eVAkvIGbpzOs1AjWjIHpChRAXHZkdkAcKh3hDwb3URDYxI+R0DifVg7k
 yTEayjQvd8swY/fPEe6aso6x7qnLW3Bp8s3zzkCfq+ziusgUeVOgqFVxEeoNIR5c2wXo
 yuMtpTcjssOLXIDezoHgG8sZnfcaE0i9RZZfcSgqNoKudN1Xqz9sfAsTwNf4lCeC+fVt
 HbEyKhKANU9GlpwzqiWgt7bp+j72vxWRdWDPdbXoMnRNk9cTmYBX9h/paLHmpnepfs50
 tYdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bzHL0tw5XE8O4+6om5ojDvP15UJs4GGb2qZXwsUwtaw=;
 b=U0cbGw8POcriEk6c1I7VXXdSzvehNFWb/VCvF12a3zbeVctkVEia7JOjbtNxJKeDHq
 SQ/mZY5f15Zcc7Cgkh5jdTTqVWiEN0p4+SGfd5zkrw1eFuFMVmN8sGzGNbqJHFiy046Y
 j3wdiJrrZxSrZNCsnQK1QGycRNgB4mpzTiWgzygU3NLESufl1N0fBe2EQpegjGK2Ajrq
 8dWYAukqG1pyM+hrcqvHqpCuoERav6PJIQUFGULhAY9eNdbjoKbHRvQQWd9mxaEZeXEo
 7WODfcavL1PQwRJfKOCItWV4Y9n8T5KAZI3rteDFDINS3kaE8HFFgoE2Voll61rUeK7Y
 /HZQ==
X-Gm-Message-State: AOAM531tXndjvayg2k6kEOm2GWvF/SyvuvAigd9n4iChvdFP7sAjJ4FP
 RCOnJgJQriHCWSC/cBJfgpi9iQRI/M5M+g==
X-Google-Smtp-Source: ABdhPJzZK0uKnLKg2drd16cm5YV8UTFsWBMiriw3foWnFaxFXEtR8AOZ2CTcU93DifpcDMEruWIECg==
X-Received: by 2002:a5d:6cc9:: with SMTP id c9mr26209319wrc.158.1630509994950; 
 Wed, 01 Sep 2021 08:26:34 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id a133sm5943345wme.5.2021.09.01.08.26.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Sep 2021 08:26:34 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] tests/vhost-user-bridge.c: Sanity check socket path length
Date: Wed,  1 Sep 2021 16:26:32 +0100
Message-Id: <20210901152632.25511-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The vhost-user-bridge binary accepts a UNIX socket path on
the command line. Sanity check that this is short enough to
fit into a sockaddr_un before copying it in.

Fixes: Coverity CID 1432866
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 tests/vhost-user-bridge.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tests/vhost-user-bridge.c b/tests/vhost-user-bridge.c
index 24815920b2b..cb009545fa5 100644
--- a/tests/vhost-user-bridge.c
+++ b/tests/vhost-user-bridge.c
@@ -540,6 +540,11 @@ vubr_new(const char *path, bool client)
     CallbackFunc cb;
     size_t len;
 
+    if (strlen(path) >= sizeof(un.sun_path)) {
+        fprintf(stderr, "unix domain socket path '%s' is too long\n", path);
+        exit(1);
+    }
+
     /* Get a UNIX socket. */
     dev->sock = socket(AF_UNIX, SOCK_STREAM, 0);
     if (dev->sock == -1) {
-- 
2.20.1


