Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8756A6388FC
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Nov 2022 12:42:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oyX56-0000Rp-JM; Fri, 25 Nov 2022 06:41:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oyX53-0000RP-Qt
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 06:41:18 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oyX52-0007Rd-9M
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 06:41:17 -0500
Received: by mail-pl1-x62e.google.com with SMTP id p12so3777931plq.4
 for <qemu-devel@nongnu.org>; Fri, 25 Nov 2022 03:41:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8W2UWjR5eVUYZK+3egBJhjvSiwbID9YJabXGeDtGMcs=;
 b=SAz6/qdsDOzZeVYR9KGZDobgE5BQId5c3WCIoGlgwyWX/pGwlKUHm6cwR3OPhvYxRt
 YpbODLAkNDW+eBDPCfnomt+UKmNkc+xXVr1fCAnJKNC4JHiLjVMCjdCpUmFQ55hop8iz
 khh+X8qo+einoujBI1VzMxiqPFb8uKGHlIoDWkhavR3XHsAPpEFxOr/Abu1AAFf4CY3K
 pbRCaudsPO8hEiSo2IqhfcQ0KYWVwDlJIkLy6UQoXYcizzrStWA6sWpmla3Q76e96R4l
 Bd2C3GTuqPE5laHwkv3BoicfiS7O3D9AIPNeYIGOWiq26PLA9/8OWWC/69s/PlRgwfuY
 7V/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8W2UWjR5eVUYZK+3egBJhjvSiwbID9YJabXGeDtGMcs=;
 b=u3mY0a2CuLbuodKBGpitgrYxy3/szEOx/nPfWM90BhkUvirzgzj6WKR7p7iPdREBA2
 /r4sBjnU6CBsZySZS14d1YeaMdigE1rYaARILNJYR9lFKhedgyq1az6T9+miQT/WQV2J
 onqkw+XZshr+h6vsynseuay7ZVvpds8Fohu6RGTqnNC2WmYn+SqWIUQ+mS6QZlh1nlDr
 WZ/AbYHe0PbDnDOyJdUmvi2stWTaxYMNQkKgfDBoLfCATWULUXfExnMlVhYeo3pvo6+w
 AnUWKKDpmoqpDYydrXX4D6Eu9xES6tysHQ7q+77YU7SKMbsyVobWHNjt4UMGZBdNCB1j
 CFpw==
X-Gm-Message-State: ANoB5pnzXYH61Pme1+ReK8fvJULkgslURCk9hyiQIw3AcD4eaTU7saHU
 b4WfWth2RoKC5EkzDkbXqnvjHb/tLdc=
X-Google-Smtp-Source: AA0mqf4xXMWYndHVusBoQMq3cs2y0yPWREG9C13IfW1B+S7SovFBQYWq7BVESfauUFqYd9sYLf0JBQ==
X-Received: by 2002:a17:90b:2801:b0:200:2069:7702 with SMTP id
 qb1-20020a17090b280100b0020020697702mr40773190pjb.239.1669376474825; 
 Fri, 25 Nov 2022 03:41:14 -0800 (PST)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 h11-20020a62830b000000b0056c063dd4cfsm2917884pfe.66.2022.11.25.03.41.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Nov 2022 03:41:14 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v2 4/4] tests/qtest: Enable qtest build on Windows
Date: Fri, 25 Nov 2022 19:41:00 +0800
Message-Id: <20221125114100.3184790-4-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221125114100.3184790-1-bmeng.cn@gmail.com>
References: <20221125114100.3184790-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Bin Meng <bin.meng@windriver.com>

Now that we have fixed various test case issues as seen when running
on Windows, let's enable the qtest build on Windows.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---

(no changes since v1)

 tests/qtest/meson.build | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index c07a5b1a5f..f0ebb5fac6 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -1,9 +1,3 @@
-# All QTests for now are POSIX-only, but the dependencies are
-# really in libqtest, not in the testcases themselves.
-if not config_host.has_key('CONFIG_POSIX')
-  subdir_done()
-endif
-
 slow_qtests = {
   'ahci-test' : 60,
   'bios-tables-test' : 120,
-- 
2.34.1


