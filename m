Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BECB06A0600
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 11:23:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pV8k6-0007tK-7h; Thu, 23 Feb 2023 05:22:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pV8k4-0007m7-0I
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 05:22:24 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pV8k2-0002ml-Jv
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 05:22:23 -0500
Received: by mail-pj1-x1034.google.com with SMTP id
 gi3-20020a17090b110300b0023762f642dcso1536992pjb.4
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 02:22:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0u2FbGfNLuWVjYzfInhVxOMxcgmZi2EeYWwRpjCl9mY=;
 b=Cuu91zVqX++iMIHbIu1tts2YXG35fqjqFuZNldKrBWIcwGFrx1Rg9ktqt4GWQfwnrW
 KLClYSScgxLN/TgUk8UUGMoFe3EcGkXr1WNSpNnvlyR3sqAj5dbYJS7cBSpe3i7+Lbpe
 8O586ht4ieMOoTK8RG75TsyTWBiPUES49EfkHu4LtwpxnfoaP7zDq8mHYASLDNOxbvAL
 LPDOBD7FRzBTcoNql8XygrVe4YZdcAw28w3bwXqmg4CqbchnI0XZ9hPbz4rF+GY9A109
 2B80SW/gQdPMdccvPM71ITB4P+CWFVJqIbWAR1F2bqGOtjyaYd8UWC8Q9Yd0wHAFHOSr
 xXPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0u2FbGfNLuWVjYzfInhVxOMxcgmZi2EeYWwRpjCl9mY=;
 b=iQXoXFd2oA237B+S1vppobIy9IoSqxTBbMB1a+rgkCZrNbuDhDU5Ph9nmLTImRuFFH
 lU/w5ej/vgmR32veX4/DMxE/57UssmKqFbwGzzUA54rX53mWfuAu2Zl+LU7nbIQks4TH
 ZuGogoGs3tjr7Z6dQX32hN6mUHDagiIAcG8/YbbaW3J6LuoSBAk5YWsGEgPG6h3Iqq9A
 GhdyWg2oovh6eKQCa5KS2FvgcHF9IJ9Drn5XinpxxNUB05knaZ5bUITKfq/LzvRP0RVP
 vZHwHhPzY5YVaplfzvUwi0wUJUm2AAfEhiRvX7NCS7bWsIH0yHFiCJgzlDoweFztQE2B
 8PSA==
X-Gm-Message-State: AO0yUKWduqCUdWsmeIC2iDlWFO+4KKlwzRdqitkzostFVU6Z/wAWE/jv
 1a7dny6QtW9Zp/hhwFtv5VOIog==
X-Google-Smtp-Source: AK7set+KxU7QQ+is8ajMX1ELXk/oQYRsNY+lyYCVV9Tdn+Q4QT5stmPwevTNT1xjtSMh1vA1DHxuHg==
X-Received: by 2002:a17:903:2345:b0:19b:110d:28dc with SMTP id
 c5-20020a170903234500b0019b110d28dcmr13122619plh.19.1677147741504; 
 Thu, 23 Feb 2023 02:22:21 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 c20-20020a170902c1d400b00196217f1219sm4107734plc.70.2023.02.23.02.22.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Feb 2023 02:22:20 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org, "Michael S . Tsirkin" <mst@redhat.com>,
 Yan Vugenfirer <yvugenfi@redhat.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 Alexander Bulekov <alxndr@bu.edu>,
 Akihiko Odaki <akihiko.odaki@daynix.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v6 29/34] MAINTAINERS: Add e1000e test files
Date: Thu, 23 Feb 2023 19:20:13 +0900
Message-Id: <20230223102018.141748-30-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230223102018.141748-1-akihiko.odaki@daynix.com>
References: <20230223102018.141748-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::1034;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Acked-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 993ebc6e08..cc99e38db8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2222,6 +2222,8 @@ R: Akihiko Odaki <akihiko.odaki@daynix.com>
 S: Maintained
 F: hw/net/e1000e*
 F: tests/qtest/fuzz-e1000e-test.c
+F: tests/qtest/e1000e-test.c
+F: tests/qtest/libqos/e1000e.*
 
 eepro100
 M: Stefan Weil <sw@weilnetz.de>
-- 
2.39.1


