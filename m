Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43196309B64
	for <lists+qemu-devel@lfdr.de>; Sun, 31 Jan 2021 11:47:22 +0100 (CET)
Received: from localhost ([::1]:52272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6AGH-0001s6-CE
	for lists+qemu-devel@lfdr.de; Sun, 31 Jan 2021 05:47:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6AFR-0001SP-0i
 for qemu-devel@nongnu.org; Sun, 31 Jan 2021 05:46:29 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:46411)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6AFP-0002sJ-GU
 for qemu-devel@nongnu.org; Sun, 31 Jan 2021 05:46:28 -0500
Received: by mail-wr1-x42b.google.com with SMTP id q7so13370791wre.13
 for <qemu-devel@nongnu.org>; Sun, 31 Jan 2021 02:46:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jvq4JLKS7dzgWHjNz556f6EEMKSM24Akj/lN0IlBRVU=;
 b=SSIExIpt1rxMoB8CgcKdyTKOig1rlj9idZB9RWIHirfZs099XWzkVAbOlbuVA8PA0v
 ccMZ5b4VJ7gcqGA7gqBSSbu0IL44Mls3LaYh6Pbx2sVp49cpAKmQM9u3F8x/X1A2c0Dm
 P7HpzIL7bUeMUd6g1z1oyCPnrrNRG2hz+Tii8fLHsFAT0ADeQbcwHljYfIH9Z5GJpZMv
 FnZ4G1rmbI1DCh5Llr4M2ect5oDEZ6y45ml3Xna7NrLUuwaCoc60xV3x8Pla8M0Ea2nb
 Bg4XKZ/wcgvPxD52tFCzQ5+sCVqga/c1Yem4oSUzil/Pjq7V/hnqSA3Ox0NciPbh+a/r
 ItYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=jvq4JLKS7dzgWHjNz556f6EEMKSM24Akj/lN0IlBRVU=;
 b=dLP4J2MneXyccU/Jvbxc1j1n+/l5HF9BNjE1qc+4ZmLeiM3G4Un92QcvrCmJ00IUms
 VJXd0hdgNDvMepYAhqehD9PRvFZ5zkP/VF1SjqvLDcRYVMhqxtPeaUmW8qfBXVLU1ObB
 5O1uNmNzZAjOc+cTYRhMYYJF/O6iTP28ELzam8BcJP+Ed5NvQSbeWDP3hiGpFnBkte41
 5+Q6jVBNyP6GBdNBdkEhRzH8QmdZKBqsXQBhi+u8DDyTYHQaM5Oegr/rAB5td97ostMS
 aESn3GX6c6dXM58mNCD05e9umGlHjNXyfIcyVFQe89+W0diKgihdORueK4EqyMTdz4mu
 CtJA==
X-Gm-Message-State: AOAM5323JudLotI5YOj8KNcqH74ZIDjrY/dwQCYIye6x6wZqkGmq2Jz1
 9BFLXcF9WaNZc9ycjhCPzO93wNKsvNU=
X-Google-Smtp-Source: ABdhPJyGm2SvsLxIulnQSQMRgAxe+kOzabHl1HF/g5xrswV993vCn7nMlIf9NxYex9fY4A+8boAgwA==
X-Received: by 2002:a05:6000:1082:: with SMTP id
 y2mr12624677wrw.27.1612089985167; 
 Sun, 31 Jan 2021 02:46:25 -0800 (PST)
Received: from localhost.localdomain (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id r10sm17174903wmd.15.2021.01.31.02.46.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Jan 2021 02:46:24 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] gitlab-ci: Disable vhost-kernel in build-disable job
Date: Sun, 31 Jan 2021 11:46:21 +0100
Message-Id: <20210131104621.221602-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit 299e6f19b3e ("vhost-net: revamp configure logic") added
the --enable-vhost-kernel option.
Disable it in the build-disable job.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 .gitlab-ci.yml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 7c0db64710b..e8390314d89 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -346,6 +346,7 @@ build-disabled:
       --disable-vhost-crypto
       --disable-vhost-net
       --disable-vhost-scsi
+      --disable-vhost-kernel
       --disable-vhost-user
       --disable-vhost-vdpa
       --disable-vhost-vsock
-- 
2.26.2


