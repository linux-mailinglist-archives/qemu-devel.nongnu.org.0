Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F52494D1F
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 12:40:14 +0100 (CET)
Received: from localhost ([::1]:43282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAVnZ-0000Ry-HJ
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 06:40:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nAVGY-0003z9-2j; Thu, 20 Jan 2022 06:06:06 -0500
Received: from [2a00:1450:4864:20::332] (port=35445
 helo=mail-wm1-x332.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nAVGT-0001tq-I0; Thu, 20 Jan 2022 06:06:05 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 q9-20020a7bce89000000b00349e697f2fbso21072691wmj.0; 
 Thu, 20 Jan 2022 03:05:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HwwJK3Ic8vOiGmskKxf1h+aCakkNAUYqzvWmUqx2afA=;
 b=dCljKkxvjwIBd6xl/FszqYGN0+JCNJRbHXyAnkz34WNUlGBBdU0pYq4YVzlXPhTQqw
 kPA6dy+AXG91r3a0St0r5UDuUKgs9JC4r3Lbd++OKHhJsjASunWqtPvTZd+pNJHeokS4
 /TVM5N3Z3W7XnxNSK38Oy9nr3B7RP7jK9cccsyHi+tT7bvZRtOpdROkWRvExIS0B221T
 p8/F8BJ5zWAWjA8BnBLH3WT+XQX2k7e/DkBI6odTOPuhjnNHT2uHGcjbtaoJQOTr2cMR
 PowtUPWnQmWg3Pv+ftznWPdecRD/+JsIRHj+FVdPWB0KIqIKhgcQugXaCCn0CmRYSc5u
 8WxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=HwwJK3Ic8vOiGmskKxf1h+aCakkNAUYqzvWmUqx2afA=;
 b=600MeiHNpcyqBj8Tdbz5DPiMBPlHZKw7xADdf6+5/AgKNEgsn+MQ4oZiuX5WIjBGs3
 K8yZm92ofVOwFlAWTN3QsY/Q6gtIJ6dKHsHAjkhAZfisYhzduYIBhJa3JdWtD3lZdzc1
 Al+6lnjd+jztCYgCLVx2437MQBD65jfnsAv6XrBKDj6ThyKsHSvcGKD5xt+xpEoJcD7y
 O8+CuorrJgvebOlvZ5gxJn4MpBipy63L/KU2njteuzRBJzXseUFXqYF4P7aoP1mO6vl+
 F2lLuiHXznkCCgvcMqGsbPEgF9ZCfAmJLxKtJk0f1vd50PTuITfm5JHQmwTmoVZbORTt
 aN9g==
X-Gm-Message-State: AOAM5326qF6NZWTPnujI3T1kWn0gK4HGshBGqQkBUO/8km+quA8E8+Hy
 M5MC4pirrpq9hBqXnix4tLpOFAkUVqk=
X-Google-Smtp-Source: ABdhPJy0hNH9Ym3YxvYNYS+p2rgoVqeeYISUvNsFvlZg2unmm9AoR4q0Zo8D89zZr1euLtN0bAuxsw==
X-Received: by 2002:a5d:650f:: with SMTP id x15mr5858145wru.645.1642676753000; 
 Thu, 20 Jan 2022 03:05:53 -0800 (PST)
Received: from nuc.. (154.red-83-50-83.dynamicip.rima-tde.net. [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id
 z5sm9996117wmp.10.2022.01.20.03.05.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jan 2022 03:05:52 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Ed Maste <emaste@freebsd.org>, Michael Tokarev <mjt@tls.msk.ru>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Li-Wen Hsu <lwhsu@freebsd.org>, Peter Maydell <peter.maydell@linaro.org>,
 Yonggang Luo <luoyonggang@gmail.com>
Subject: [PATCH v2 1/6] MAINTAINERS: Cover lcitool submodule with build test /
 automation
Date: Thu, 20 Jan 2022 12:05:40 +0100
Message-Id: <20220120110545.263404-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220120110545.263404-1-f4bug@amsat.org>
References: <20220120110545.263404-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::332
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 893a5567100..fb78499d6a0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3577,6 +3577,7 @@ F: .travis.yml
 F: scripts/ci/
 F: tests/docker/
 F: tests/vm/
+F: tests/lcitool/
 F: scripts/archive-source.sh
 W: https://gitlab.com/qemu-project/qemu/pipelines
 W: https://travis-ci.org/qemu/qemu
-- 
2.34.1


