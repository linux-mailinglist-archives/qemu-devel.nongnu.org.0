Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B962A3C19EC
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 21:37:05 +0200 (CEST)
Received: from localhost ([::1]:42722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1ZpY-0005iA-Qr
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 15:37:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m1ZWU-0002J4-4t
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 15:17:22 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:38562)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m1ZWR-0007V8-4W
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 15:17:21 -0400
Received: by mail-wr1-x42c.google.com with SMTP id a8so8871933wrp.5
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 12:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oS1S2allDRCwTqJLfgxd4YbJAktd2ptss87hkbFVJp0=;
 b=T2f/SEhWmHwb3UZFa/a5cFGzwSqEmYxgYZ0M9DkAzaJW/iraFvJJjQYhHcYNVXZYr0
 4f+43wN9Ylb5h5ocS/z6TlnEGbMyQSX4dDZCuG3RVmrKpw7v/ezbIaVSbquBy2imwsTk
 4W0EDRaqCXxcLXTzZINayZ1e3AviS0XEsQgF8UPgvsgO7t2jG2Pg0ukM5aohtrGO1XcY
 pjAESMweJfXqacbnO3xpizXBMmJEm65jvouXJhYEp/fLdomBPt+f/hbFE1svzTPdszmX
 +E9DD/LLWJEg4+65F8+8Xyq0AQySTTV4BVxddjqNgRlH2+UN6vTaEeHui9pmUPviGUQc
 rMMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oS1S2allDRCwTqJLfgxd4YbJAktd2ptss87hkbFVJp0=;
 b=GIXW9nwvWdIfDiHtutcT/8E2C0sku2/NNfIKtEJCbXDFxThSbpHTWkNWh5cFuVFWCB
 ++wLI3Kj6MdldDztuKWjhro5gkLAe+i7BsNNGHyHSGZx5y5S/IyEN76fTRt7A8lYzs33
 ODIWLxfJN24ILRljjlEibb8smqAM3xPRwQFIglB8rIlBSqf8TGxv4i2W0WtbmbYDtfOa
 ACkJmKtQoELfnNJzbrPOqt1e9NrX6mQjEU85rRpIF5JkPwgHmIn1LHSJ7+O0N/dwwT76
 vQ10I25b9K6S2NYxYTAvKSspphXaHBCLNuRTqzPr+edEQoLeXjl01vbUF4Spi+gWNjOb
 PuMg==
X-Gm-Message-State: AOAM531ROsJAAAoEcFCovHPwHUjkZB0K9ETlpME7OK/9pxGJ5dGy9O8q
 atuOYe2hYA41hTdvady0t/Hp+Q==
X-Google-Smtp-Source: ABdhPJwQsMEFjX7Qa8/4V1LJpAhUd3HJ9SU+A/VXFvhDqxs4VGAOWCClGGP7XOrPOXLsZy03FcnQrQ==
X-Received: by 2002:a5d:4812:: with SMTP id l18mr18935049wrq.68.1625771837897; 
 Thu, 08 Jul 2021 12:17:17 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id v1sm3345875wre.20.2021.07.08.12.17.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 12:17:11 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 17C291FFBF;
 Thu,  8 Jul 2021 20:09:46 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 39/39] MAINTAINERS: Added myself as a reviewer for TCG
 Plugins
Date: Thu,  8 Jul 2021 20:09:41 +0100
Message-Id: <20210708190941.16980-40-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210708190941.16980-1-alex.bennee@linaro.org>
References: <20210708190941.16980-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
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
Cc: fam@euphon.net, minyihh@uci.edu, berrange@redhat.com,
 kuhn.chenqun@huawei.com, f4bug@amsat.org, robhenry@microsoft.com,
 mahmoudabdalghany@outlook.com, aaron@os.amperecomputing.com, cota@braap.org,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 ma.mandourr@gmail.com, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mahmoud Mandour <ma.mandourr@gmail.com>

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210623125458.450462-6-ma.mandourr@gmail.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index ee456e5fb4..77b304afac 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2982,6 +2982,7 @@ F: include/tcg/
 TCG Plugins
 M: Alex Bennée <alex.bennee@linaro.org>
 R: Alexandre Iooss <erdnaxe@crans.org>
+R: Mahmoud Mandour <ma.mandourr@gmail.com>
 S: Maintained
 F: docs/devel/tcg-plugins.rst
 F: plugins/
-- 
2.20.1


