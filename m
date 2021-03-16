Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 010C533CF8C
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 09:17:56 +0100 (CET)
Received: from localhost ([::1]:52974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lM4tm-0000Ll-UJ
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 04:17:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lM4pF-0001uU-VC
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 04:13:14 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:36841)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lM4pB-0007hV-Lt
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 04:13:12 -0400
Received: by mail-ed1-x533.google.com with SMTP id o19so20406933edc.3
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 01:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references;
 bh=3hRQIzOfytOYJWvVekpNIWUn2VnZLGjGX2HfaABKibQ=;
 b=PeBrt9h0QmTUOfa824GK7TPCApaT+jhmA1S+8mH7TdhwgI+MD9/lsOumqZrqFtftY7
 8DuI7Y29S0n1Gtn8bohyB/wZfmcyUwPp7UgGBZXOvudU6kEcQXc4q7ICgtaYqse/qNeJ
 USr5cHgoUAP3+18u4Np1QFGheOjn3/Nzh1HKltQ5/N8AsGkNBqs4dsPOR5N9X2wTWo84
 tBkZGY9nuf7D7zVQu6ZyFL4K8lsCH3XBXNE0k0qlnE1MFgi94h0uLO9h5cql/ZH5RP9E
 k9xcy1M+BfxEHEqZAQZLaZfazFcGOxqD4MnIqwj66I3ZS4JhITZ9MpcCiAveaBEfq22G
 Q3Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references;
 bh=3hRQIzOfytOYJWvVekpNIWUn2VnZLGjGX2HfaABKibQ=;
 b=OUk7Po5K0aObZMV1bfLIAEHYlE3X//PQ3A1JREDRTpdJcAIpw+jCD80a95WeocE316
 Zc0QVjn2p748NykSS0DJQsB/wX2MTIaR3O59S8p98yPFFfgH4aeiHVGpp5BjT1Loifym
 7U5+zJEn7Y1Lrlrn9Abvvf5Ogg2sYIG2yynCVbg0IvqHUwtJ0Bam58o5wiw+tTfiKtVQ
 R/hyrxEcgnIThL0Pc5y3gjIBuXACgIfKkbJxVA8+9KazefXRj6ZQKuLaeB6L1v5ka8XC
 Ng2fFd9ILZ73CvN//Bvf7FZ/ywZgGSpaPbo77Lua8fVz8c0yrfhfx7dOLD3ZjGB09O/o
 6v8A==
X-Gm-Message-State: AOAM531d2vKIDxhNVupiBIBIE+5v0RYw/crbXSDKEbVzuk9gehS1zCdE
 y1oHfA5yYqkKo3CDeXdfp3g=
X-Google-Smtp-Source: ABdhPJy0YHf39jQb5062hmLbsMdxa0/0TcIAMpDCIzrXFe035evrAe/kI9IhxTIrLMslvfV+ijUlcQ==
X-Received: by 2002:a05:6402:30a5:: with SMTP id
 df5mr34944836edb.24.1615882388096; 
 Tue, 16 Mar 2021 01:13:08 -0700 (PDT)
Received: from pek-vx-bsp9.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id a17sm5620333ejf.20.2021.03.16.01.13.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Mar 2021 01:13:07 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Subject: [PATCH v3 01/13] net: eth: Add a helper to pad a short ethernet frame
Date: Tue, 16 Mar 2021 16:12:42 +0800
Message-Id: <20210316081254.72684-2-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210316081254.72684-1-bmeng.cn@gmail.com>
References: <20210316081254.72684-1-bmeng.cn@gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ed1-x533.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a helper to pad a short ethernet frame to the minimum required
length, which can be used by backend codes.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>

---

Changes in v3:
- use 'without' instead of 'sans'
- add a helper to pad short frames

 include/net/eth.h | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/include/net/eth.h b/include/net/eth.h
index 0671be6916..bc064f8e52 100644
--- a/include/net/eth.h
+++ b/include/net/eth.h
@@ -31,6 +31,31 @@
 
 #define ETH_ALEN 6
 #define ETH_HLEN 14
+#define ETH_ZLEN 60     /* Min. octets in frame without FCS */
+
+/**
+ * pad_short_frame - pad a short frame to the minimum ethernet frame length
+ *
+ * If the ethernet frame size is shorter than 60 bytes, it will be padded to
+ * 60 bytes at the address @min_pkt.
+ *
+ * @min_pkt: buffer address to hold the padded frame
+ * @pkt: address to hold the original ethernet frame
+ * @size: size of the original ethernet frame
+ * @return true if the frame is padded, otherwise false
+ */
+static inline bool pad_short_frame(uint8_t *min_pkt, const uint8_t *pkt,
+                                   int size)
+{
+    if (size < ETH_ZLEN) {
+        /* pad to minimum ethernet frame length */
+        memcpy(min_pkt, pkt, size);
+        memset(&min_pkt[size], 0, ETH_ZLEN - size);
+        return true;
+    }
+
+    return false;
+}
 
 struct eth_header {
     uint8_t  h_dest[ETH_ALEN];   /* destination eth addr */
-- 
2.17.1


