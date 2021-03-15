Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5593633CA13
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 00:41:27 +0100 (CET)
Received: from localhost ([::1]:34124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLwpy-000731-BC
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 19:41:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lLwkz-0001uK-G4
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 19:36:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:47449)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lLwkt-0006D6-LB
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 19:36:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615851371;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lnrQakNgz3xw6kKukyoUyuKmgE+PSAVl9WkOaDLjwTQ=;
 b=bG/Mtecupq6Ue6n0f3Qxv7sV1Z5vxl1nVgFeTK7BjQxvIV5+ok6Vu8dpkS7sb5IsCk2iZc
 b4a90Yyrw+mI247JwNjQzAV+0T0ORTdiy9CyYqYW7RG7aV5VuRzLs8fyFK+FWxacwCXxn3
 R7QSDD9hLV8Pi4sZ3fVDevduwZeqqXE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-548-vEENSdXKNUOc6mBd0lmaaA-1; Mon, 15 Mar 2021 19:36:09 -0400
X-MC-Unique: vEENSdXKNUOc6mBd0lmaaA-1
Received: by mail-wr1-f70.google.com with SMTP id z6so15730533wrh.11
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 16:36:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lnrQakNgz3xw6kKukyoUyuKmgE+PSAVl9WkOaDLjwTQ=;
 b=EgBYTpH8aM4oQHYOj6ynlg6ZKZr2xE5Q44UK136H6oczqbBt3rnIS7wDgfKZL50ljF
 fw64kDAlOwht+t8bWIRe4jVAuWY/GjOqM4OJrFvWW+geIl6cRI+8uGg6vkcG2X1h7J5t
 u8ElZXC7vTrXr3oPaOKILdC8VOmub3/OuaVoswAY5nizUn0JaOgg1ZjFugTI8Q7uhigy
 fkKm/lypbz5LSOPD/aJwgWBr9znhArOUhC2qSMuM6z/rklPYKkt8TRonzAA295+ElsoX
 OSyqIZYeZKGH0mdOW/A4HJqvqo37EtIP0c1+9LwZrCsn3adHlke/0MKhjMgOOoqfMG8i
 u1xw==
X-Gm-Message-State: AOAM53249kiwWnu+QfT/VJLT5/wzJsMi+7AjnBJ35R7lPtmHHp9GWHoP
 Lc1hAk4TQPG/flCHoL40twieaALvQK8lE8J+2+Alw/8SfOutW7WZZFPU56zjbqwYam+OVtfFpyP
 LGdays6EBb6u1RjJ06fQtttbvd5rkmjzDzq0XKrRJP166wXcNid0sqP+6RV3YNN0J
X-Received: by 2002:adf:a2cf:: with SMTP id t15mr1978988wra.250.1615851368017; 
 Mon, 15 Mar 2021 16:36:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzaOR9VDQ+9EVZEUXkA9MsnENZyiW5ktCn09EC0QJOCI0lRAcDGA5LfuAsa7qubCHk1oEYx5g==
X-Received: by 2002:adf:a2cf:: with SMTP id t15mr1978971wra.250.1615851367840; 
 Mon, 15 Mar 2021 16:36:07 -0700 (PDT)
Received: from x1w.redhat.com (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id e1sm21165694wrd.44.2021.03.15.16.36.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Mar 2021 16:36:07 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 08/11] hw/block/pflash_cfi02: Add DeviceReset method
Date: Tue, 16 Mar 2021 00:35:24 +0100
Message-Id: <20210315233527.2988483-9-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210315233527.2988483-1-philmd@redhat.com>
References: <20210315233527.2988483-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>, David Edmondson <david.edmondson@oracle.com>,
 Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: David Edmondson <david.edmondson@oracle.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Message-Id: <20210310170528.1184868-9-philmd@redhat.com>
---
 hw/block/pflash_cfi02.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
index aea47a99c61..c40febd2a41 100644
--- a/hw/block/pflash_cfi02.c
+++ b/hw/block/pflash_cfi02.c
@@ -942,6 +942,13 @@ static void pflash_cfi02_realize(DeviceState *dev, Error **errp)
     pflash_cfi02_fill_cfi_table(pfl, nb_regions);
 }
 
+static void pflash_cfi02_reset(DeviceState *dev)
+{
+    PFlashCFI02 *pfl = PFLASH_CFI02(dev);
+
+    pflash_reset_state_machine(pfl);
+}
+
 static Property pflash_cfi02_properties[] = {
     DEFINE_PROP_DRIVE("drive", PFlashCFI02, blk),
     DEFINE_PROP_UINT32("num-blocks", PFlashCFI02, uniform_nb_blocs, 0),
@@ -979,6 +986,7 @@ static void pflash_cfi02_class_init(ObjectClass *klass, void *data)
     DeviceClass *dc = DEVICE_CLASS(klass);
 
     dc->realize = pflash_cfi02_realize;
+    dc->reset = pflash_cfi02_reset;
     dc->unrealize = pflash_cfi02_unrealize;
     device_class_set_props(dc, pflash_cfi02_properties);
     set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
-- 
2.26.2


