Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C99659C08
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Dec 2022 21:28:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pBLyn-0007pN-Af; Fri, 30 Dec 2022 15:27:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <blue@cmd.nu>) id 1pBLyl-0007nN-7U
 for qemu-devel@nongnu.org; Fri, 30 Dec 2022 15:27:47 -0500
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <blue@cmd.nu>) id 1pBLyj-0000BS-IK
 for qemu-devel@nongnu.org; Fri, 30 Dec 2022 15:27:47 -0500
Received: by mail-lf1-x12c.google.com with SMTP id j17so23483850lfr.3
 for <qemu-devel@nongnu.org>; Fri, 30 Dec 2022 12:27:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cmd.nu; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=NAk1BhB2L8WwZhheIaZuWk1Mwg3j8l3Hu/jZ54RVP/Q=;
 b=e83SJC2qumchR7zX8thKkQUg1q/7eRB/Urrx22E3ZjlQz+1iqlxBCF7GGjHN546SNy
 fi/KoNZOjD6yRwwZ6Wz2Is6zyLMn6cUF3/PTWefLgmqlswMZSzhjHwUmPo7NZGhRoVvW
 /8S+0LFcQrYykmMFzK3qnTZynjKENuGe1NwDE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NAk1BhB2L8WwZhheIaZuWk1Mwg3j8l3Hu/jZ54RVP/Q=;
 b=JcBqqrfn99gv6KqGJDN2rhmTcojdtbJPpd5LMSMsnCRg2oqGF4IbZBhthUEXLNaj1q
 Kk6ANhjVWos6lzuyKbrHep4vSKg+y32Y0HyykvyPrrtYnFcvLQsMtTAfvPK567T2zKir
 KdrV71K4XXxS6TBUh3xNoObITgcOzxbIbgYrAyjwiw0O5oeiyYouWiK3Oj8O1t+DPovS
 h0gwH9TcRuKBgNEv/09dYLMRqOtyD7BffXG3ldt3u5gvYA4IRtuC8tyaUmqqGzeGot/p
 SxvrKyKr/hvGzPyzaqlgu8UzP+qQ+az3k1xR8ibY5kisif1piDYfVm2Cc2o4nLEs0FBT
 AY/g==
X-Gm-Message-State: AFqh2krLzzYwZbyhOPq6zCJuM0zzCTlHR7Db0reImeax871mju5hRZ2m
 MC/zqFoxvMTdZBXuwYz5iwx3jg==
X-Google-Smtp-Source: AMrXdXteW6iy2jPMBAokkcmcfGakuU9+Kubau4YhUOtQqskXrjWBjXba5FyqPsjOqtTuF46QDeVRQQ==
X-Received: by 2002:ac2:5088:0:b0:4a4:7be4:9baf with SMTP id
 f8-20020ac25088000000b004a47be49bafmr10203782lfm.59.1672432062664; 
 Fri, 30 Dec 2022 12:27:42 -0800 (PST)
Received: from localhost.localdomain ([2a07:5cc0:6::bc])
 by smtp.gmail.com with ESMTPSA id
 bu20-20020a056512169400b004cb02ed464esm2508682lfb.196.2022.12.30.12.27.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Dec 2022 12:27:42 -0800 (PST)
From: Christian Svensson <blue@cmd.nu>
To: 
Cc: Christian Svensson <blue@cmd.nu>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org (open list:All patches CC here)
Subject: [PATCH] net: Increase L2TPv3 buffer to fit jumboframes
Date: Fri, 30 Dec 2022 21:27:10 +0100
Message-Id: <20221230202710.115187-1-blue@cmd.nu>
X-Mailer: git-send-email 2.36.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12c; envelope-from=blue@cmd.nu;
 helo=mail-lf1-x12c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

Increase the allocated buffer size to fit larger packets.
Given that jumboframes can commonly be up to 9000 bytes the closest suitable
value seems to be 16 KiB.

Tested by running qemu towards a Linux L2TPv3 endpoint and pushing
jumboframe traffic through the interfaces.

Signed-off-by: Christian Svensson <blue@cmd.nu>
---
 net/l2tpv3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/l2tpv3.c b/net/l2tpv3.c
index 5852e42738..3d5c6d11d3 100644
--- a/net/l2tpv3.c
+++ b/net/l2tpv3.c
@@ -42,7 +42,7 @@
  */
 
 #define BUFFER_ALIGN sysconf(_SC_PAGESIZE)
-#define BUFFER_SIZE 2048
+#define BUFFER_SIZE 16384
 #define IOVSIZE 2
 #define MAX_L2TPV3_MSGCNT 64
 #define MAX_L2TPV3_IOVCNT (MAX_L2TPV3_MSGCNT * IOVSIZE)
-- 
2.36.2


