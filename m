Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B054C00C0
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 18:58:51 +0100 (CET)
Received: from localhost ([::1]:40756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMZR4-00041y-Vh
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 12:58:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nMZ7g-000462-Lc; Tue, 22 Feb 2022 12:38:48 -0500
Received: from [2a00:1450:4864:20::536] (port=46625
 helo=mail-ed1-x536.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nMZ7f-0002rE-8D; Tue, 22 Feb 2022 12:38:48 -0500
Received: by mail-ed1-x536.google.com with SMTP id s1so5618692edd.13;
 Tue, 22 Feb 2022 09:38:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pBWZyQf2a1EQOS4RoRDBdmQBnv7imwruIUWeEsAYGFM=;
 b=RTrf4vivibqVA47BSV3Nl0St1l+Y8yQMyFLZ8y/H/GlTp6Pvb5BPtt25T5BwX6DgBB
 YdyR4lNC4KQqUKPoB+8ldnf3vkUifLFOzH2Yfu8EB76AJhu2wthBE1m7F13+i3ld3KgR
 OllIPzF57F50oZ6QsAxS5m2l232b4QNYVUuzI2x5ldwnepli42S4qjH8Kv6Jj3wZasJi
 +4DBABU0gRQwBi3uaNRljo5mPRqCJgWwnFnlflakuwFYwuApDV7arwvFsCdmh3bZs/65
 Teo3O1zbYyjMzFwtAb+6TXx68wGtnufccrZFdvzLFTDSD0ZogvBQJB55xDRVddlD00co
 fmgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pBWZyQf2a1EQOS4RoRDBdmQBnv7imwruIUWeEsAYGFM=;
 b=4Q5/IV8p5Kuv3+ocPAlmUsiVrPiId500Suov+DwTI3y4eLqWH2Mfq+Jv4a/gBg6GR0
 yDWy+wgqeGvQmi0arQdW1x1Zk3xaSc3EK3/nyJuzO/qm/afp4K+qvhP6i6Z1v85eYVS2
 mIHKXHjeVR//ddHp21jxp9ppcfvbRZi7iBbgeiDY8oVY0etL926lQaV66kvofX+6GZJr
 yKvKKA2TY9ZBV5hDTcEqpt8nsiPfgQxsWUbrpeLe6rbTrQJDtTyudsVr6RWl9yRBhf1S
 g4a1XoKiVkB810xQMT9fOaideI07J7s4ZceQ/Fd61AeMEnvSo9k+fZup5mkNUDbqtLLI
 LqUw==
X-Gm-Message-State: AOAM533YYbTolT8yE1NTyHs4d3me/6fQXFa5A5/kYEFdLwa4rpswVcLn
 QeIl7xGOJYNJimpERbZakXxjax3y6Hk=
X-Google-Smtp-Source: ABdhPJyeoj2YRZxyyjH44iSZBDqCgzZ+0MeIXBAKd1bBMuXDbica8RYh8NOg3ddArgd/0lP2G424lw==
X-Received: by 2002:aa7:d343:0:b0:40a:1425:8896 with SMTP id
 m3-20020aa7d343000000b0040a14258896mr28245140edr.242.1645551525532; 
 Tue, 22 Feb 2022 09:38:45 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-089-012-227-088.89.12.pool.telefonica.de. [89.12.227.88])
 by smtp.gmail.com with ESMTPSA id et2sm6449382ejc.101.2022.02.22.09.38.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 09:38:45 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 19/22] hw/rtc/m48t59-isa: Disuse isa_init_irq()
Date: Tue, 22 Feb 2022 18:38:16 +0100
Message-Id: <20220222173819.76568-20-shentey@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220222173819.76568-1-shentey@gmail.com>
References: <20220222173819.76568-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::536
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x536.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: "open list:PReP" <qemu-ppc@nongnu.org>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Bernhard Beschow <shentey@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

isa_init_irq() has become a trivial one-line wrapper for isa_get_irq().
Use the original instead such that isa_init_irq() can be removed
eventually.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/rtc/m48t59-isa.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/rtc/m48t59-isa.c b/hw/rtc/m48t59-isa.c
index d1c1d789a5..31918c416f 100644
--- a/hw/rtc/m48t59-isa.c
+++ b/hw/rtc/m48t59-isa.c
@@ -101,7 +101,7 @@ static void m48t59_isa_realize(DeviceState *dev, Error **errp)
 
     s->model = u->info.model;
     s->size = u->info.size;
-    isa_init_irq(isadev, &s->IRQ, d->isairq);
+    s->IRQ = isa_get_irq(isadev, d->isairq);
     m48t59_realize_common(s, errp);
     memory_region_init_io(&d->io, OBJECT(dev), &m48t59_io_ops, s, "m48t59", 4);
     if (d->io_base != 0) {
-- 
2.35.1


