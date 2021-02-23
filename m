Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90ED3323302
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 22:12:52 +0100 (CET)
Received: from localhost ([::1]:46394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEezD-00014G-JZ
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 16:12:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lEexm-0000d9-1s
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 16:11:22 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:45510)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lEexk-0006sq-B7
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 16:11:21 -0500
Received: by mail-wr1-x430.google.com with SMTP id y17so2428084wrs.12
 for <qemu-devel@nongnu.org>; Tue, 23 Feb 2021 13:11:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rdjBx72aSF3XhB+Mr/HN1j2ULLAwqHlFQjWOPN6q/zM=;
 b=c9IJ7MayB5U0W6Tk7ezLR6Eu/D1HVVvTmHb740ICZ4FQ5mUbMru2GPNKwIqnUbnZp+
 KhQu/IzXR1Rsow6jDv0r0KaZu4S4a57M3Dagy1XyGvzCYzenF/PUDNeLrvzvU33ACNvs
 ljXsLuBKPR3TMPQh/iab9GKx2eFF9sN+cVkd0BMEaStfsgq9Eb/HTljm0i5d3hjY4Anm
 sVXnCm7kl6unReuOPTCUvx6cbChZS+bA+J+oKb1ga4Gu7twV+nLhC5zsaYEctdSTOFD8
 07hEOAHOgDIuhvhx0lbMWVOCJrkRFYDPg1voCM2OVSnZVP63WHuPSXioyf8eMSBGtf1W
 wLoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=rdjBx72aSF3XhB+Mr/HN1j2ULLAwqHlFQjWOPN6q/zM=;
 b=oAQPkEaOy1fXMaJvkz5NgpVhzVDxUGLVB6T93mSGb4MdULhXmovxOADEsj6DToRpdC
 pGFO3yKEODzR6WaPqKQmqeUa5W9vLoi3vYacOVHBHi5+Hckih1KWD19hlrhA3eXJDmtk
 KOtud9VmYh+MVK1EIa26iTVr6lzEgQSx8frPMt7WPh3YQnHGQNjj+BLfpRo6TW4/g8d/
 OCjbb9XMi9P/0VNoY0Z26iq1ptqiTdmEaVfCfNcsV3ThpR6HTvOA6LA739jZ7UZRAUhM
 B7BEeMO1U3fX6cwKZpmMmwerDEhr8isZLEwPsRObA2bs4KKz5OedTlTumBQ2YE52PanB
 4gzA==
X-Gm-Message-State: AOAM531NIE70qSSLSeJZccIFrY8qtbYFejTqtTE/ClT7/sA5JGMceBK1
 QADZfOR3gih5zmyEEi0YNcIBVBmaXRI=
X-Google-Smtp-Source: ABdhPJy9lLSbTYWSPWO8ZksquyOtL0A151ebQHlxm5dD8T7VTopnCwRBEs413VhV6XvpJ53JDNMlsA==
X-Received: by 2002:adf:e90e:: with SMTP id f14mr27096305wrm.324.1614114677868; 
 Tue, 23 Feb 2021 13:11:17 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id g18sm32575451wrw.40.2021.02.23.13.11.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Feb 2021 13:11:17 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] tests/docker: Use --arch-only when building Debian cross
 image
Date: Tue, 23 Feb 2021 22:11:15 +0100
Message-Id: <20210223211115.2971565-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Fam Zheng <fam@euphon.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Christian Ehrhardt <christian.ehrhardt@canonical.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When building a Docker image based on debian10.docker on
a non-x86 host, we get:

 [2/4] RUN apt update &&     DEBIAN_FRONTEND=noninteractive eatmydata     apt build-dep -yy qemu
 Reading package lists... Done
 Building dependency tree
 Reading state information... Done
 Some packages could not be installed. This may mean that you have
 requested an impossible situation or if you are using the unstable
 distribution that some required packages have not yet been created
 or been moved out of Incoming.
 The following information may help to resolve the situation:

 The following packages have unmet dependencies:
  builddeps:qemu : Depends: gcc-s390x-linux-gnu but it is not installable
                   Depends: gcc-alpha-linux-gnu but it is not installable
 E: Unable to correct problems, you have held broken packages.

Fix by using the --arch-only option suggested here:
https://bugs.launchpad.net/ubuntu/+source/qemu/+bug/1866032/comments/1

Suggested-by: Christian Ehrhardt <christian.ehrhardt@canonical.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 tests/docker/dockerfiles/debian10.docker | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/docker/dockerfiles/debian10.docker b/tests/docker/dockerfiles/debian10.docker
index 9d42b5a4b81..d034acbd256 100644
--- a/tests/docker/dockerfiles/debian10.docker
+++ b/tests/docker/dockerfiles/debian10.docker
@@ -32,6 +32,6 @@ RUN apt update && \
         psmisc \
         python3 \
         python3-sphinx \
-        $(apt-get -s build-dep qemu | egrep ^Inst | fgrep '[all]' | cut -d\  -f2)
+        $(apt-get -s build-dep --arch-only qemu | egrep ^Inst | fgrep '[all]' | cut -d\  -f2)
 
 ENV FEATURES docs
-- 
2.26.2


