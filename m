Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9338C2FF220
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 18:39:57 +0100 (CET)
Received: from localhost ([::1]:36630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2dw4-00082q-Lh
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 12:39:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l2dlA-0006eT-Bf
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 12:28:40 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:37871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l2dl8-0003Vi-Rl
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 12:28:40 -0500
Received: by mail-ej1-x636.google.com with SMTP id kg20so3273897ejc.4
 for <qemu-devel@nongnu.org>; Thu, 21 Jan 2021 09:28:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=S60ZRslMGTkW2S0qdQVdKhYKOjkodxRKNiQXPqhQgqU=;
 b=NFQB8BWAgWUdThx5VrvpLbhl4PDI7UKT6Lw4AfSdv57NXNcsKq8vdYHmgZG2ZTp4wq
 +8XGmPFjgQ5zFKsBFHj8eb2Jq/SX1hKOCRqzB3wiarbccGpjVlvbMD6m68wV0ehnIYxY
 7sUEgRkIA3FVTRpDC3VW2xfM6W1fbxsiZtVHyZ09yu694FLmJjg5Um3Rmtj4lHWoD5cq
 OEVhFF7TXvf7sj5sukWShVvzKHziRVDG5KvMzjXBpMLkuzdjVCxaZaZa+t7FA0nfrI2B
 l3Xb8aORlt19M4PEeOuPx+eQ9kJ3Fx7N3eIIhfSYINu/alIZtnT8dxtK2EhKMb2m+xow
 kgDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=S60ZRslMGTkW2S0qdQVdKhYKOjkodxRKNiQXPqhQgqU=;
 b=Gtc3YZuyzX/zH1Lr1/8UoKBJzngQxS9JoGl7FL41bORcKgY6J1tCmYijXZnV/skTY6
 hNMQYZMLxsQTbXjhP51UWczY5smDwxihrCOZ2fQGmlEqTIJFkLWg0K++Y3L5Um7J7vol
 pdC9sN4O3fvnG2LoePuEE9p3Uj/FTwN4Elu/0/xcMdNM6Jn9aLuC5Ksqbaoo+cf8J852
 iXPO3zvNGVO780ggn4rzECHgZHEMBh7xa88BTCJKbRrny+ayMt1EN5TObA563YZvOjC8
 XuWkCVHwNY6+C/XCv5BH0n54RHuZH17rI10VH5CidacuW614ws3ifnhOfbRsf5/Z65tD
 o6sw==
X-Gm-Message-State: AOAM533EUDWRP8NQV+xHB0+Or/2ksOclvJ9qSD2ErI6sIbL1gj5cO7k9
 YQdDHyq+0WTDCJ/co2j1ec77FpYqBSA=
X-Google-Smtp-Source: ABdhPJxGo8REdmpeep00tcOQMntMRBASi8XxOBGQSncaXobieiSdEYD/8Ptfyu0DpE0WO/DW7wQKBw==
X-Received: by 2002:a17:906:351a:: with SMTP id
 r26mr330596eja.409.1611250117198; 
 Thu, 21 Jan 2021 09:28:37 -0800 (PST)
Received: from x1w.redhat.com (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id cx6sm3239694edb.53.2021.01.21.09.28.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jan 2021 09:28:36 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/2] tests/docker: Install static libc package in CentOS 7
Date: Thu, 21 Jan 2021 18:28:28 +0100
Message-Id: <20210121172829.1643620-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210121172829.1643620-1-f4bug@amsat.org>
References: <20210121172829.1643620-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x636.google.com
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We need to install the static libc package to be able to run
the TCG tests:

  $ make check-tcg
  ...
    BUILD   TCG tests for x86_64-softmmu
    BUILD   x86_64-softmmu guest-tests with cc
  /usr/bin/ld: hello: warning: allocated section `.notes' not in segment
  /usr/bin/ld: memory: warning: allocated section `.notes' not in segment
    BUILD   TCG tests for x86_64-linux-user
    BUILD   x86_64-linux-user guest-tests with cc
  /usr/bin/ld: cannot find -lpthread
  /usr/bin/ld: cannot find -lc
  collect2: error: ld returned 1 exit status
  make[2]: *** [threadcount] Error 1
  make[1]: *** [cross-build-guest-tests] Error 2
  make: *** [build-tcg-tests-x86_64-linux-user] Error 2

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 tests/docker/dockerfiles/centos7.docker | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/docker/dockerfiles/centos7.docker b/tests/docker/dockerfiles/centos7.docker
index 6f11af1989e..75fdb53c7c0 100644
--- a/tests/docker/dockerfiles/centos7.docker
+++ b/tests/docker/dockerfiles/centos7.docker
@@ -15,6 +15,7 @@ ENV PACKAGES \
     gettext \
     git \
     glib2-devel \
+    glibc-static \
     gnutls-devel \
     libaio-devel \
     libepoxy-devel \
-- 
2.26.2


