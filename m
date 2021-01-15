Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5143C2F7852
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 13:09:22 +0100 (CET)
Received: from localhost ([::1]:46668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0Nur-0001Id-9E
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 07:09:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l0NsB-00080R-DY; Fri, 15 Jan 2021 07:06:37 -0500
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:36275)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l0Ns3-0003Zq-Ft; Fri, 15 Jan 2021 07:06:35 -0500
Received: by mail-pg1-x535.google.com with SMTP id c132so5892649pga.3;
 Fri, 15 Jan 2021 04:06:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=ZuENl38Uj1XXvlGTRP6SwNgsA5uXW6rACpRQwgn9cKc=;
 b=lsbwl/cTld+UbAleKu2VmTLNUmw57TkqgfrWpDSgdYeE2+JS9mSxxm1XqqbtujNeFD
 xW247lFgWhkDQThmFvuYv2H2bDn+W0yhRfruBt5QshO24ybb1yftnkDEZK56soIH1B9t
 r2xbajQfhOeQyPeHxOlIJdOLqBQhS9fDgQFKBbGSykHeGNofYPzo+i1QInrh8L25ClyZ
 Vm/1qzGpfx48bFNo5Wy2spxiyxLx4bny2y+MHE38n5sv409iAcOzUQ8X+AAy/b70q3OA
 OYYi17aZ3636gAZni7m+jM75++4FXQO7IC42qWjD1JaC86rjMGNAH08G6oxgyDosfI+E
 JNHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=ZuENl38Uj1XXvlGTRP6SwNgsA5uXW6rACpRQwgn9cKc=;
 b=MGXHddtbIzz+sxV6msXsBVgP/+Y5I1+LMjPQPP2iZbP+ef4AY3N9H3rknPLY9kR0J8
 u/7Snz6NYBfMxkuExXO1DdZSPHI+hSD/KAUAxezYb04tm+KIxzqTG/g8CtcNBbt3zpbd
 Rl2J1ev8yPoaCvzefp8QGAmjyj3oUAxn6TtIV2zetgEmJDN6DJDMXoMNveqv9J2s4/5H
 OG0T8vSp0Uw13EPjOl/47PnA1z/SOK6ZR+5QmTeAco4OmtJ6ZYLa/NSy4+4fq97nCbu5
 B/vOu2I0tYzfEQji0LBF0T7uelQ7lqW0MpDJ/jkFhzM/V6aRoRzePS65ZJjGAePUW6hi
 vObw==
X-Gm-Message-State: AOAM533c6woTA/Bae/IlkxIZOYyYQMHUT45nYwJAka6ucXzs2jzSp0HC
 WXSzjN6nYNTwMDTlTRPMedUN2MTdvtoRXQ==
X-Google-Smtp-Source: ABdhPJxmK71ZeA3icGlEqVgME2L9p6S7lt58ka3TejsbSEfwAc6gZUzqn8hHyNNBp5ApZfsG3houOA==
X-Received: by 2002:a62:8205:0:b029:19e:717c:d647 with SMTP id
 w5-20020a6282050000b029019e717cd647mr12381611pfd.50.1610712384535; 
 Fri, 15 Jan 2021 04:06:24 -0800 (PST)
Received: from localhost.localdomain ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id a4sm8338161pgn.40.2021.01.15.04.06.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 04:06:24 -0800 (PST)
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Subject: [RFC PATCH 4/5] nvme: add NMIC enum value for Identify Namespace
Date: Fri, 15 Jan 2021 21:05:57 +0900
Message-Id: <20210115120558.29313-5-minwoo.im.dev@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210115120558.29313-1-minwoo.im.dev@gmail.com>
References: <20210115120558.29313-1-minwoo.im.dev@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pg1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 Minwoo Im <minwoo.im.dev@gmail.com>, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Added Namespace Multi-path I/O and Namespace Sharing Capabilities (NMIC)
field to support shared namespace from controller(s).

This field is in Identify Namespace data structure in [30].

Signed-off-by: Minwoo Im <minwoo.im.dev@gmail.com>
---
 include/block/nvme.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/block/nvme.h b/include/block/nvme.h
index e83ec1e124c6..dd7b5ba9ef4c 100644
--- a/include/block/nvme.h
+++ b/include/block/nvme.h
@@ -1110,6 +1110,10 @@ enum NvmeNsIdentifierType {
     NVME_NIDT_CSI               = 0x04,
 };
 
+enum NvmeNsNmic {
+    NVME_NMIC_NS_SHARED         = 1 << 0,
+};
+
 enum NvmeCsi {
     NVME_CSI_NVM                = 0x00,
     NVME_CSI_ZONED              = 0x02,
-- 
2.17.1


