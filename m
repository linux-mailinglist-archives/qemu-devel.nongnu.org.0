Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D64496241
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 16:45:01 +0100 (CET)
Received: from localhost ([::1]:38806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAw60-0003si-O4
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 10:45:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nAw2q-0001A9-OQ
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 10:41:46 -0500
Received: from [2a00:1450:4864:20::335] (port=54901
 helo=mail-wm1-x335.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nAw2p-0007fl-3G
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 10:41:44 -0500
Received: by mail-wm1-x335.google.com with SMTP id p18so18423611wmg.4
 for <qemu-devel@nongnu.org>; Fri, 21 Jan 2022 07:41:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qHVrZYilprbADKL6sDkzZ5rkDTLaol2IUVJ3O0h2GR0=;
 b=NJikODvwK+s3FfOKIBhzVEryyZtVsTdZv1sYEICrKQf2TFqr8kvnJxekabx3FoIYd5
 SBwsRVe4jZMkUQ3JkfsSPKNaIYj/Cx+GyrD1I2nOy0IjVc4Le1YXMwZhUw3DJS+lJrf2
 uH5I3zJsvrE2whEGMJ5rNbZOjuhdDxGptFR/+s58BFO/TvXsKnCPzq0MCPNSY0hU/E5h
 bnQg3qD+ZJrnxXa0/vDhSL+R++Yt3f+A4sMw886ep4JXv9BNbm4BA0aR0swKSOQYy6RZ
 PvGsD4ESrMvQ9uw+v1JBdkimAvWqbOEkx5nlroxvvntMBt6T2KyXZZRjfWM2Fqr2bhLs
 v40Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=qHVrZYilprbADKL6sDkzZ5rkDTLaol2IUVJ3O0h2GR0=;
 b=U6mRaKvSHrVjGS8Eo8N7akAAjoYJ4GNBCqwzIZF0GydVttTqFvpIK9m6utCvn2SMM1
 D21WmhwDbCZLq1Yr5tfcP3DJEs85CtvGAy8voDiifyjz+NO5Jx2h5nWLkZiNdh13XFhB
 VRYZJtSIfL25qwxoGDwyGwgZO5dqWtqW5lABNRsuX1BMKxwIsdkHkSlgc3j2lE8ShIMi
 jetH0DxVYZjFTFpXGqLBktt17dOl2x9nvjuaCRHIZGJ07iTVvCN1ADDfwYgGbhxakAEm
 2XxLY3cQ1m+syD4OxsntxBmlYZ5UYjKlPw97wA7pqqhFosVCmiMXOQbM5rEVcerVZSLi
 rPqg==
X-Gm-Message-State: AOAM532k6dhdkseafs/fN4vipOvVhLB8g5q+wWQ6jQqMU4j4oygGcyC0
 d9Sg1mxGBq2H7YXc+13PA+HFGBLBKKo=
X-Google-Smtp-Source: ABdhPJzH365UhrzFIFDzweZ6bvAFcLAGOAmrOhv0hWf+YSXZY3yBZv03HXHreD0EEz/qXb7rvz/x8Q==
X-Received: by 2002:a7b:c747:: with SMTP id w7mr1295858wmk.54.1642779701641;
 Fri, 21 Jan 2022 07:41:41 -0800 (PST)
Received: from nuc.. (154.red-83-50-83.dynamicip.rima-tde.net. [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id
 f10sm6607140wri.50.2022.01.21.07.41.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jan 2022 07:41:41 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Ed Maste <emaste@freebsd.org>, Thomas Huth <thuth@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Li-Wen Hsu <lwhsu@freebsd.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v6 1/7] MAINTAINERS: Cover lcitool submodule with build test /
 automation
Date: Fri, 21 Jan 2022 16:41:28 +0100
Message-Id: <20220121154134.315047-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220121154134.315047-1-f4bug@amsat.org>
References: <20220121154134.315047-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::335
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x335.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

lcitool is used by build test / automation, we want maintainers
to get notified if the submodule is updated.

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e4b3a4bcdf4..6d5539d46f1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3579,6 +3579,7 @@ F: .travis.yml
 F: scripts/ci/
 F: tests/docker/
 F: tests/vm/
+F: tests/lcitool/
 F: scripts/archive-source.sh
 W: https://gitlab.com/qemu-project/qemu/pipelines
 W: https://travis-ci.org/qemu/qemu
-- 
2.34.1


