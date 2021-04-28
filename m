Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 833E436DD7A
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 18:50:30 +0200 (CEST)
Received: from localhost ([::1]:38680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbnOP-0005ak-IX
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 12:50:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1lbnLp-00041z-Fm
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 12:47:49 -0400
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135]:33586)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1lbnLm-0006gT-VG
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 12:47:49 -0400
Received: by mail-lf1-x135.google.com with SMTP id j4so60829921lfp.0
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 09:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ibirWkv6uSYSQxoczRpL46TKKwuomQRszme/uUDeX18=;
 b=mP+OTK3MuJ+5goWsnhXiNWiZU/dslJyRz6FrBrhyDj5mLhEXDLuZ4SVV9MFSW5773b
 1Gr95LAApA1nlV2OOZpRxdoAwHoaGjRSDUDHhHFrp2AYXA8XzN2BsifbD2Jc6i3+HGda
 euJH11OushZYNzw+qNHQF784JtJZxW0kuRkciyVBotReBVpjrgfxh/MlZft7psfpUSuq
 Vlrw3mMqeUABXH2C8uKouq63UyLsooyJOsiz84H5f4Pp2wGDVIApCq/QhB8vQrWj7ecU
 +dbpIyP69pSE7PldJwcl58vmbyMr1f+zYicpUtbS6hG+DSkWq67w95cD0+I2PEOB8ymz
 oFDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ibirWkv6uSYSQxoczRpL46TKKwuomQRszme/uUDeX18=;
 b=ptuBoZTIeXboQ7T1iiNxD3q2+Jo90mJ4yCNiadj3Er+tLeH3UzNU6yVGoWXbvDd9/z
 7IZLy/4rXPZsDwKkOPLnffYv5Upq3fKIgOpxH0GzsIa5O6ndAinwErTCEhIsDGSM9IFG
 DPzibGzki/H4ULuRqqv0G6LvUl51Z3zYVvJYG9cIssRduUieV01VY3zMrOl6vBUkV3RV
 0pReoPI4Z5csdhlJtLtc4HyTrwW3AqB6VlX7bYqwAYpdgmDbDpsqE00EAz/5LoO1PuJ6
 aV1KmiAriLK7IckVl2X0qvwesBCW/ezlJiyKqQtIcIVH1qDOq8ltyGlkHkJQkTsdwwC7
 q/PA==
X-Gm-Message-State: AOAM530yL+t7+EcBN3WBOXpodS+Yjz1xeyFsGxCfu/GjNmpDJpWP1rL1
 VrtkIsweRyGe8uhtwfH8GmO8eA==
X-Google-Smtp-Source: ABdhPJxm1wvGDTYMaVKyyDbP6Szz2XpR+KXG+RnsYJBudntJpMnxjqvyEt2QV/JNhOG1vxFH53UK5Q==
X-Received: by 2002:ac2:4883:: with SMTP id x3mr3711223lfc.494.1619628463908; 
 Wed, 28 Apr 2021 09:47:43 -0700 (PDT)
Received: from navi.cosmonova.net.ua ([95.67.24.131])
 by smtp.gmail.com with ESMTPSA id v24sm86302lfp.195.2021.04.28.09.47.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Apr 2021 09:47:43 -0700 (PDT)
From: Andrew Melnychenko <andrew@daynix.com>
To: jasowang@redhat.com,
	mst@redhat.com
Subject: [PATCH v7 1/7] net/tap: Added TUNSETSTEERINGEBPF code.
Date: Wed, 28 Apr 2021 19:47:27 +0300
Message-Id: <20210428164733.56547-2-andrew@daynix.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210428164733.56547-1-andrew@daynix.com>
References: <20210428164733.56547-1-andrew@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2a00:1450:4864:20::135;
 envelope-from=andrew@daynix.com; helo=mail-lf1-x135.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: yan@daynix.com, yuri.benditovich@daynix.com, berrange@redhat.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Additional code that will be used for eBPF setting steering routine.

Signed-off-by: Andrew Melnychenko <andrew@daynix.com>
---
 net/tap-linux.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/net/tap-linux.h b/net/tap-linux.h
index 2f36d100fc..1d06fe0de6 100644
--- a/net/tap-linux.h
+++ b/net/tap-linux.h
@@ -31,6 +31,7 @@
 #define TUNSETQUEUE  _IOW('T', 217, int)
 #define TUNSETVNETLE _IOW('T', 220, int)
 #define TUNSETVNETBE _IOW('T', 222, int)
+#define TUNSETSTEERINGEBPF _IOR('T', 224, int)
 
 #endif
 
-- 
2.31.1


