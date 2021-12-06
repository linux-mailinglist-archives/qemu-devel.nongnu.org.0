Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B420346966A
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Dec 2021 14:12:03 +0100 (CET)
Received: from localhost ([::1]:48526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muDmk-0007LX-Q4
	for lists+qemu-devel@lfdr.de; Mon, 06 Dec 2021 08:12:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1muDNS-0001AA-Kk; Mon, 06 Dec 2021 07:45:54 -0500
Received: from [2607:f8b0:4864:20::930] (port=33452
 helo=mail-ua1-x930.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1muDNQ-0002RT-Uq; Mon, 06 Dec 2021 07:45:54 -0500
Received: by mail-ua1-x930.google.com with SMTP id a14so19337974uak.0;
 Mon, 06 Dec 2021 04:45:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PCr91a53U6hCRvnuEuqXzhENAcfO9X8VxlGAetm4HS8=;
 b=jcVTBM9ym1pg8DI4G03oKHihRDsNE/01mbKkD1mKsAJfBwOI1kGqHkgVnrhJ4jpzWY
 lVjDWefke6VCrRW0jssN7JJbiMjTXBgguTBPEa8Si71vrvjQyIwTKKLJ7KC1AD5ZdFEz
 QkKqgC+ZulSvZTyAxDIcNEyEjjZoEujVk+/Fy3nMtsc28+PB8mL6Gw1MoD81athuOMfG
 RampAUTw2Oj8E26CenqlmCnJ3bJkCtHid2PudXRdbaDC1AwgbdmUQURoIkfTy8rBrHx8
 r+jljqPZM6ABDVi7fasXVhmd2fvRMl8vvm97M+vSW4cDzDaXS673wpbcue3DYq4pEqZM
 rj3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PCr91a53U6hCRvnuEuqXzhENAcfO9X8VxlGAetm4HS8=;
 b=CRd4Zk2spdGDP66oeFSIU3K4TMaXWM4QFVSooBKeZoI+iU4Q/62AeTKTUku7UET484
 snI0aSCzDR5SBvwP1SJHrjhfe3YYbh1BljxKtxl9DUwKpgeuZsybNGgRxtt3xKKBTStY
 9KPYagZWa8QzfDelRbvkx3OAWpN19SUN2dCp/fmZ47KYZD55Cp04xvn5o0OhyuXswpZ6
 rA7APFVVGTSwVAcfqC5uPK+g4bHE2aJ6mhLc4/n5krZOVr4hwQi5UwufkZ/yVQeUL8Um
 buOC3rR1Ynj8zPP3EcRPuwZQZY5Bp07X68jK5xCG37YP7EXVcXLbOdP9N5r2Lvob07T6
 gInw==
X-Gm-Message-State: AOAM533/2g2Ub+cNG9MJGfk+4iFH+Wgld3HrOXNoP0WXtrRV0iew4HJO
 PH7kUal+PCZk9Jj6hc8r8G9rZSPZGss=
X-Google-Smtp-Source: ABdhPJy+7EuLf0umhi2ofUOs5R0xNa9tE9k/DmhYO1KJgwtgN7hAKVSaDd2W2Bk4AG3HqG1UsDzSGg==
X-Received: by 2002:a05:6102:cd2:: with SMTP id
 g18mr35336686vst.71.1638794749180; 
 Mon, 06 Dec 2021 04:45:49 -0800 (PST)
Received: from rekt.ibmuc.com ([177.103.2.88])
 by smtp.gmail.com with ESMTPSA id y22sm4087589vkn.42.2021.12.06.04.45.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Dec 2021 04:45:48 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] ppc/pvn.c: fix "system-id" FDT when -uuid is set
Date: Mon,  6 Dec 2021 09:45:38 -0300
Message-Id: <20211206124538.627920-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::930
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::930;
 envelope-from=danielhb413@gmail.com; helo=mail-ua1-x930.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Setting -uuid in the pnv machine does not work:

./qemu-system-ppc64 -machine powernv8,accel=tcg  -uuid 7ff61ca1-a4a0-4bc1-944c-abd114a35e80
qemu-system-ppc64: error creating device tree: (fdt_property_string(fdt, "system-id", buf)): FDT_ERR_BADSTATE

This happens because we're using "fdt_property_string" to retrieve a
"system-id" attribute that does not exist, instead of using
fdt_setprop_string() to create a "system-id" attribute with the uuid
provided via command line.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---

Cedric,

This isn't critical and probably not worth postponing 7.0 for one
more week, but since we're pushing MIPS fixes for 6.2 I believe this
one can also go in.


 hw/ppc/pnv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index 32ab8071a4..9e532caa9f 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -552,7 +552,7 @@ static void *pnv_dt_create(MachineState *machine)
     buf =  qemu_uuid_unparse_strdup(&qemu_uuid);
     _FDT((fdt_setprop_string(fdt, 0, "vm,uuid", buf)));
     if (qemu_uuid_set) {
-        _FDT((fdt_property_string(fdt, "system-id", buf)));
+        _FDT((fdt_setprop_string(fdt, 0, "system-id", buf)));
     }
     g_free(buf);
 
-- 
2.31.1


