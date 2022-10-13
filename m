Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E55D75FDB34
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 15:42:17 +0200 (CEST)
Received: from localhost ([::1]:44942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiyTZ-0005Xw-1C
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 09:42:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oixtc-0002ln-Pj
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 09:05:09 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:39604)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oixtZ-0000yd-UT
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 09:05:07 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 i133-20020a1c3b8b000000b003c6c154d528so80568wma.4
 for <qemu-devel@nongnu.org>; Thu, 13 Oct 2022 06:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Z10mhDJVwk3ax3+lJRI6nda2u/R14pZqSMyReUBFvks=;
 b=IggOtt0So2ArUTBoVhaV9bst0rq7Ghme4eZIHDwQxBNGJknVmiFiBmoZPIGYfKjTYc
 xtV1agjZyJTz4EOueElLX8gKbR0PLTSlvu9VZcz/5r/tkcDvbscNHD1LHb/9C5HSevKT
 mr8FaixwFNqAcx8rNp6ZhYMlD2OxJLlueXgye9XX+DAmqO2BYhfAokxUnbvBiA5Lx1KN
 v0GDpH8RASjN/zZHn+i1zf1CD+fwtxltX35H5GhdtBWdyreJljQHogq2Uge59lb7Spxg
 g12X+YtIOZWRHeT5OOr67fp9HQgIauDvhq4n/cmWX4b9vA/AnrgVF7Xctt2YaiEVthEq
 yolA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Z10mhDJVwk3ax3+lJRI6nda2u/R14pZqSMyReUBFvks=;
 b=cw044ehQd0WRlq3CSni7LpytcEgH2JhY+vIX5qHkw4ADUMOrBFvnsc/Vkimhuqc8ii
 4M71cx4MtLtoHv6Y/G6K/5GB51T4VbYVpKR5VNLdD6qjeWyYB3SgEu6MkhAlqi0xoBI7
 LgAWUE27MEoDqlNNp8ggPTx3nDXzUhj2q+b3QqKPB0przIo16zhqghLZdO4IxEPWVMy9
 t3HeBL3iKZlf3elkwn+rNirwap6rWFZqf/ar/HNz9Jx9Brzfld1PQi9IJziGZvGa2mDE
 DA67Mf+aDW6oy19vqyJT60pSfwCHSynGal49n7dOqihpNRE3XqJbh3TR1H5Gi3mg2598
 zp2w==
X-Gm-Message-State: ACrzQf2qZPnKQ/zyWMbJCmbXSjn4fjHqxLbURHgqsq6IVfDj1pYJN+0c
 zOD6HArn+3xVvpMERdVfWRjfaOVQEGP3ug==
X-Google-Smtp-Source: AMsMyM6ralNB0Rr7dk8acmThnq9NCnrgxqXBvOQ/Lw1++iJZ2v1SlPaTWlnR8WpAyzgn4zaB68+Qgg==
X-Received: by 2002:a05:600c:538b:b0:3c6:b66d:4027 with SMTP id
 hg11-20020a05600c538b00b003c6b66d4027mr6190443wmb.146.1665666303345; 
 Thu, 13 Oct 2022 06:05:03 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 r5-20020a5d6945000000b0022cc0a2cbecsm1995599wrw.15.2022.10.13.06.05.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Oct 2022 06:05:02 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>
Subject: [PATCH] include/hw/scsi/scsi.h: Remove unused
 scsi_legacy_handle_cmdline() prototype
Date: Thu, 13 Oct 2022 14:05:00 +0100
Message-Id: <20221013130500.967432-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

In commit 1454509726719e0933c80 we removed the function
scsi_legacy_handle_cmdline() and all of its callers, but forgot to
delete the prototype from the header function.  Delete the prototype
too.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/scsi/scsi.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/hw/scsi/scsi.h b/include/hw/scsi/scsi.h
index 001103488c2..9ad86b25bb4 100644
--- a/include/hw/scsi/scsi.h
+++ b/include/hw/scsi/scsi.h
@@ -187,7 +187,6 @@ SCSIDevice *scsi_bus_legacy_add_drive(SCSIBus *bus, BlockBackend *blk,
                                       BlockdevOnError werror,
                                       const char *serial, Error **errp);
 void scsi_bus_legacy_handle_cmdline(SCSIBus *bus);
-void scsi_legacy_handle_cmdline(void);
 
 SCSIRequest *scsi_req_alloc(const SCSIReqOps *reqops, SCSIDevice *d,
                             uint32_t tag, uint32_t lun, void *hba_private);
-- 
2.25.1


