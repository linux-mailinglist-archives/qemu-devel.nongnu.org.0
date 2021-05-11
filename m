Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF05437A4B8
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 12:39:19 +0200 (CEST)
Received: from localhost ([::1]:47408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgPnK-0006IO-SP
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 06:39:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7584e029c=alistair.francis@wdc.com>)
 id 1lgPWP-0001Km-7u
 for qemu-devel@nongnu.org; Tue, 11 May 2021 06:21:49 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:41095)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7584e029c=alistair.francis@wdc.com>)
 id 1lgPWM-0006TG-GU
 for qemu-devel@nongnu.org; Tue, 11 May 2021 06:21:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1620728504; x=1652264504;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NHvDFXBaWN2j3izad2FF3XGWNvtRcgbhcimmn8MDmLE=;
 b=aZKsW0pYaHhMLMzzsx7X8x/+X5c84CyQY1j1pMikuUGKVjuYTTdgLxz7
 l//JtSuAxyG7BwfrpGHTVB7FTtaQQJUM6r521xoAAlk6eme+HVGzJh2KA
 PbFP3yLSvDak9TDxPKnOBW/DuYVLZSGybpFM7If8+YPhtNfOjVLny20JP
 UDy22ZIRGsBgjJVdDyYNYBQuEEKs7Dahxuut7+89UlYVvL1fFA5tc0uV9
 izq1D1lpyHC0AGSz81zyVcVOJW4+pIBTJ6NBFb16cqf6OvgS11j/udg8K
 qVzaoYCuhNxzwy/V6N4qEYu0Eltde8gX3TNsJFpL31m0w7iSbzEXJsoqO w==;
IronPort-SDR: Uz03infTEH7d+q7hUb2bOsA7QH52c2dJDjMcx0ys24sBsXGdlvTmzf8yw6kMzGHiAQz+qRn1Sy
 R294y2/9L/ojg4SnS9FOXCOfbjksB3yJcDiaNy0BVnFiVNhsJbcmM4PQ2f2ls3U8EMPkzsVYH2
 p1RiQNXn1JbTohcAtLFiX4oQrmj9LwOT0S6EuNouNaA6HD7dkEXj31JC3Hbpq41wuJJson/vEl
 89GucrTBz/Gvv622AHIsD+3iUvZ26P5kcrFJMemW05yVNT4e6kGDR5uws89VKqTcuXIQC0decx
 3CU=
X-IronPort-AV: E=Sophos;i="5.82,290,1613404800"; d="scan'208";a="167735425"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 11 May 2021 18:21:12 +0800
IronPort-SDR: omvQBZP49R2lCyrFpqwz9VVBNIZ7trnr5yRXsHKRKQUK+vAK1LN9L2OzCW5rw3NnTUtl4YgM8G
 KFu/O42cX89gZCXyV6PqBqIW7PIa3qCJjBEfoNWMXG2tR+1rHFswC7WeKwpENmxONNG9o17MHM
 f9aqAb1d5jRWnMNrVAh0Fs6FxwI7aesuvlkWcr7l9Y8AGcwsJ5mT2JOvs8xZ81MA3vCH5LvTIg
 ZLHEEITisQiKt2mzvsYvZmby4l1qib66BeAnnQPVqNrxRSXkNZMYLXQKAuujPr4wisrP2rSih7
 CCqbY1fwI6v07KtkyY6395eB
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2021 03:01:12 -0700
IronPort-SDR: dfIDZSZnQRYssruxUL15OCgCJD/kw/PgSU5AxPUa2Ry0/0KZW5HZAUvdZ2Ibdzvwik1qkzpgR5
 u4PoGiVM7qs6qWytgCWZhMPNFshvE8viHhRvSsUQta51nk2b1IJVDLrEhJ1SXQg6WRO0jonR7U
 X6G88DaalBmD0vDJZ1O+VPyQCZQVtVf+UZOyJvq9O47NG+5fnOfm1ENnPSvayiPtQQcRAoRBZ4
 ZYmfMw2dX4VDhvgqqaoHQvdnU88wcgTTJflAeoExz+dFi88Yv9Q1woiomrT2i4mqQ3GcOlWQQ/
 rro=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.165.48])
 by uls-op-cesaip01.wdc.com with ESMTP; 11 May 2021 03:21:11 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL v3 22/42] target/riscv: Add the ePMP feature
Date: Tue, 11 May 2021 20:19:31 +1000
Message-Id: <20210511101951.165287-23-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210511101951.165287-1-alistair.francis@wdc.com>
References: <20210511101951.165287-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=7584e029c=alistair.francis@wdc.com;
 helo=esa5.hgst.iphmx.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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
Cc: alistair23@gmail.com, Bin Meng <bmeng.cn@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The spec is avaliable at:
https://docs.google.com/document/d/1Mh_aiHYxemL0umN3GTTw8vsbmzHZ_nxZXgjgOUzbvc8

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Message-id: 28c8855c80b0388a08c3ae009f5467e2b3960ce0.1618812899.git.alistair.francis@wdc.com
---
 target/riscv/cpu.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 842d3ab810..13a08b86f6 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -81,6 +81,7 @@
 enum {
     RISCV_FEATURE_MMU,
     RISCV_FEATURE_PMP,
+    RISCV_FEATURE_EPMP,
     RISCV_FEATURE_MISA
 };
 
-- 
2.31.1


