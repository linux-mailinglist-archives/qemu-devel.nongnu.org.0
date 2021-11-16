Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD805453412
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 15:23:55 +0100 (CET)
Received: from localhost ([::1]:60178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmzNK-000076-OF
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 09:23:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <linmq006@gmail.com>)
 id 1mmwyU-000165-7P
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 06:50:06 -0500
Received: from [2607:f8b0:4864:20::134] (port=43535
 helo=mail-il1-x134.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <linmq006@gmail.com>)
 id 1mmwyR-0002l7-SJ
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 06:50:05 -0500
Received: by mail-il1-x134.google.com with SMTP id s14so20032906ilv.10
 for <qemu-devel@nongnu.org>; Tue, 16 Nov 2021 03:50:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=+eBFct8iAxHFKfCYs+KQCIyGjKvclEDAeXkIXTGgTXk=;
 b=ENIPt9NPK4NqiDnEBIo/t6hbh+6RVn2zwPg9sLXI9teJqv/p0S18Yln61hWffTVfbl
 yfZ3DAjcNRPJW6xejyVfeiaXdOHKMpaebJ8GQC3tAT0hHAS/2igy3/EsTMGn2IO5Ve+A
 VoUNLyWIVoc+imSjnqXum9JDJmVhvWdycCZlV2epkbw+/0Wpj13RJeSgTfI0JrZMaH60
 RDiZlgrUGLNporArM+LxPrkUHpwLVhGz5H7BQ1nFzBuJ7gnFNJ2T8FJGILoV/o2bxkwj
 qQTXvArrupVzHuoXc562LD372fz1FRH6nA1VdAqUN/uI7QopWm+k8ZM0xaAylrxEg2/S
 daGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=+eBFct8iAxHFKfCYs+KQCIyGjKvclEDAeXkIXTGgTXk=;
 b=yECWkzyeqDqrqptTKzPZAjL1F3ZrpxV9Xb8TXIzR1ZDzpNlVjQGKDGePYe1s6sflbT
 H2xYek7Yx0CXOYdkRcOubVPEAmyzqNBbXq2u9an3T2ZyOPygP1OfCBdzuMYjj1TEA272
 aMI4/LRMNoiiXBBP6vg+ttyAAFnJ0agwgA1lnsW1e30TMqokiVTR18HJQSaSETsQiN1p
 N6C+5bQzfm2588fHqhsQZK9iMeOgR1gupxsTR0EgqUjMsG8clMYPp2LYXerg7CJ1XbDU
 2xHE5W19rUzo3ucBGAXnFoBmMg0kvWNHDT29RipseIfen7kWPUj3K5tTDkg3Jvl9cg3J
 MaZw==
X-Gm-Message-State: AOAM533R+Mp/wxup1AvYVesZmRsYHn4N2tJDyje/f7/FlCSiQz7038gv
 y1vCtOAzpxRMx8XRIfoYnvqWOpYTxRCH3zRhxUI=
X-Google-Smtp-Source: ABdhPJwN2a80DDnNchf2wIREA84QPNhruGC7rI4jBOeL9G0P8v2MKFpPvTiol4zZq/6Iz9FALdELjA==
X-Received: by 2002:a63:1d65:: with SMTP id d37mr4279998pgm.353.1637062965832; 
 Tue, 16 Nov 2021 03:42:45 -0800 (PST)
Received: from localhost.localdomain ([159.226.95.43])
 by smtp.googlemail.com with ESMTPSA id fs21sm2148448pjb.1.2021.11.16.03.42.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Nov 2021 03:42:45 -0800 (PST)
From: Miaoqian Lin <linmq006@gmail.com>
To: 
Subject: [PATCH] fw_cfg: Fix memory leak in fw_cfg_register_file
Date: Tue, 16 Nov 2021 11:42:33 +0000
Message-Id: <20211116114233.29462-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::134
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::134;
 envelope-from=linmq006@gmail.com; helo=mail-il1-x134.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 16 Nov 2021 09:19:47 -0500
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
Cc: qemu-devel@nongnu.org, linux-kernel@vger.kernel.org, linmq006@gmail.com,
 Gabriel Somlo <somlo@cmu.edu>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When kobject_init_and_add() fails, entry should be freed just like
when sysfs_create_bin_file() fails.

Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 drivers/firmware/qemu_fw_cfg.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/qemu_fw_cfg.c b/drivers/firmware/qemu_fw_cfg.c
index 172c751a4f6c..0f404777f016 100644
--- a/drivers/firmware/qemu_fw_cfg.c
+++ b/drivers/firmware/qemu_fw_cfg.c
@@ -608,6 +608,7 @@ static int fw_cfg_register_file(const struct fw_cfg_file *f)
 				   fw_cfg_sel_ko, "%d", entry->select);
 	if (err) {
 		kobject_put(&entry->kobj);
+		kfree(entry);
 		return err;
 	}
 
-- 
2.17.1


