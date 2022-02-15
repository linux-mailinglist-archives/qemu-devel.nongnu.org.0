Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D475A4B65BD
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 09:17:47 +0100 (CET)
Received: from localhost ([::1]:43396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJt1t-0006YM-0o
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 03:17:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nJso0-0001nc-Tc
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 03:03:25 -0500
Received: from [2607:f8b0:4864:20::631] (port=34555
 helo=mail-pl1-x631.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nJsnz-00028v-2j
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 03:03:24 -0500
Received: by mail-pl1-x631.google.com with SMTP id 10so12529417plj.1
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 00:03:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DZ6HMC/awLS1AtcPS+4P+ISmJMCsR4IlAO4kOPlAwl4=;
 b=oQY6/YRaEf6gdQ/3KCKaVYP3np6B9W4I81+FBgiSyR4Uyx/xLhpF8xV+8yNBg6dcpj
 57H8Irwi1RooDY1j9ffhv0SiBU97osAYKOaszlIX5KHIn5RK0odmCGZxDnGm7xCxVTED
 qpMK2lru0OJzhoACAh4YfXBCRfyWUEbCUpcd71xCqe1Yds0VJhlBtKycoBI+TSvM6IuJ
 UQnllC/eXwNK+SUPj2QzMxvJqFe9vZGQBiLTF8518i8IQnnLN17hwG/U8OjeGsPxTCQW
 4Ck1KrLaU9u6FZytNApCcGRguc2mAYxaxyyX5thaf8ntmPAw+B4AEVH90dXTlSCE7BZs
 S2mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=DZ6HMC/awLS1AtcPS+4P+ISmJMCsR4IlAO4kOPlAwl4=;
 b=4u+GT631zyX5sFrLcUo6hn9oYf/zJQicabgbqf/LK+IYoAR5/ziPeSIdsjdYkzTcvA
 JUNfojcdDtQTsVZC+ei2lT9mOkeCODLA56VtagXN37auentXIN6Rn6Itt9T1eXANqHCf
 ydYJN1cK7RhAoSriwlx5C3SvSbfmj7uCQpq5FsVV6atDVA8tXhlB6OergUi/BPh2dE+S
 11D4UaSCAGHNPdjJfZC71nEsrswM6iap5LpNLP7xqn2LQueBMbvoeDoTzXN5T53OFr+g
 +dEeDtOTmcwrtSMSOFu0mOn2fqAPxyerj2xkvfFgmXT7z/c/UtxHRymNb9xSqTm6zjjj
 lcAQ==
X-Gm-Message-State: AOAM532TukZV1WPB773ztyZfivb6rPqhZJ6c5kGdhDzQFYmsqhrjs+1u
 UlFBl+DpDnZbEIaHp15byKZdsUdrcwA=
X-Google-Smtp-Source: ABdhPJzvpCVodzTdhoNyTi/9v61kltYhrulAf40BzL/uYeCdLBrO3anUQ3Qgl+XqLM5qd28XtzG6cw==
X-Received: by 2002:a17:903:2cf:: with SMTP id
 s15mr3049356plk.150.1644912201701; 
 Tue, 15 Feb 2022 00:03:21 -0800 (PST)
Received: from localhost.localdomain (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71])
 by smtp.gmail.com with ESMTPSA id p4sm1718681pgh.53.2022.02.15.00.03.19
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 15 Feb 2022 00:03:21 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Roman Bolshakov <r.bolshakov@yadro.com>, Will Cohen <wwcohen@gmail.com>,
 Cameron Esfahani <dirty@apple.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v6 01/15] MAINTAINERS: Add Akihiko Odaki to macOS-relateds
Date: Tue, 15 Feb 2022 09:02:53 +0100
Message-Id: <20220215080307.69550-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220215080307.69550-1-f4bug@amsat.org>
References: <20220215080307.69550-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::631
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x631.google.com
X-Spam_score_int: 2
X-Spam_score: 0.2
X-Spam_bar: /
X-Spam_report: (0.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, PDS_HP_HELO_NORDNS=0.904,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

From: Akihiko Odaki <akihiko.odaki@gmail.com>

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Reviewed-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220213021215.1974-1-akihiko.odaki@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index b0b845f445..ce6f4f9228 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2406,6 +2406,7 @@ F: audio/alsaaudio.c
 Core Audio framework backend
 M: Gerd Hoffmann <kraxel@redhat.com>
 R: Christian Schoenebeck <qemu_oss@crudebyte.com>
+R: Akihiko Odaki <akihiko.odaki@gmail.com>
 S: Odd Fixes
 F: audio/coreaudio.c
 
@@ -2658,6 +2659,7 @@ F: util/drm.c
 
 Cocoa graphics
 M: Peter Maydell <peter.maydell@linaro.org>
+R: Akihiko Odaki <akihiko.odaki@gmail.com>
 S: Odd Fixes
 F: ui/cocoa.m
 
-- 
2.34.1


