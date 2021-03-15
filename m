Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE63433ACE4
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 08:59:35 +0100 (CET)
Received: from localhost ([::1]:37526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLi8U-0001G0-Cl
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 03:59:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lLi6b-00085B-T8
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 03:57:40 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:41338)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lLi6Y-0004G3-6K
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 03:57:36 -0400
Received: by mail-pf1-x434.google.com with SMTP id b23so6042398pfo.8
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 00:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dUzwl+RN7/QClYsNJO2R8iyALPlxjzzVKwzgRCjbkEY=;
 b=ZKQhoBY5A4g44/GhTlOdc9mGjPJ3QjOdNH4FD7ZcJzZh7s9He5d+jWvbJvYMAE9MNW
 1UBJWaSuzzEEs91C5t07g8U+VL0SMVkZwYXerDGT03R2KAI8nYwy4Vj7qYmMS9qzAQtv
 X89E3JTsmuJb6oo9W3AFHBSVDGCSUIh3mjD871oC0nYDuenFFDnP51AM4OEPEZRQ6Isx
 bH4kuZKh8aOZUUrjl4129WSsOqwUV5mOz4NIcciBcgE0QuSCzwnZc/Tggb1sS8HprpIp
 fbm/hYsvn9smLzQzVdhmeqqRPZvDmKb4eg2VzcVCVQ7raiNS1CkUT8DmSeexNW9Zh+gE
 wl9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dUzwl+RN7/QClYsNJO2R8iyALPlxjzzVKwzgRCjbkEY=;
 b=QTJTX7hyK435qlOtuuTxZ4ihCucJPvn57ZD/peExk0T9p4uv0JbVYXHTRq/ToNMo6D
 tB+Tm6j6s2SjIsmIDX9kWm3LD6n9bfgK6KaT7+baraZYc7pJos/SCWXcITO53s/eyuV4
 btHg7f8hFilTI1BBUTMPDxZi7tP6BBoXGWwd18dYeJ2iDqcgC3/PJR3OHsxWIfqMI6Tj
 OUvvTCPp2KCuQ6wRZ/MichrE8ePLEQPwP284/eaSQ17OwDGCMDsuAHqf+HZcpoay5j2w
 JCUH2fKQ+tdKGzczJgznWRAX7snHMdSlgene/8Usv3avOdwkwAmZb+u+X5n60/M6Y0WA
 I6Xg==
X-Gm-Message-State: AOAM531UfSKGN9bakLE5ciq/al1iA+zK1tduJ04t+sWc+DHELAkMdLsx
 B+FeSDfOfSLM2Z6p8Pz99hM=
X-Google-Smtp-Source: ABdhPJzynGBgr82RD3M+lxAamomNpXQ5ekacQfEH0OF7BVCgxF7Nxz0cDzq6pJsVZbFAmusefQY7Eg==
X-Received: by 2002:a63:e715:: with SMTP id b21mr10112577pgi.300.1615795052153; 
 Mon, 15 Mar 2021 00:57:32 -0700 (PDT)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id y9sm10166745pja.50.2021.03.15.00.57.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Mar 2021 00:57:31 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Subject: [PATCH v2 01/13] net: Add ETH_ZLEN define in eth.h
Date: Mon, 15 Mar 2021 15:57:06 +0800
Message-Id: <20210315075718.5402-2-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210315075718.5402-1-bmeng.cn@gmail.com>
References: <20210315075718.5402-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pf1-x434.google.com
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
Cc: Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a new macro ETH_ZLEN which represents the minimum size of an
Ethernet frame without FCS.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
---

 include/net/eth.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/net/eth.h b/include/net/eth.h
index 0671be6916..7c825ecb2f 100644
--- a/include/net/eth.h
+++ b/include/net/eth.h
@@ -31,6 +31,7 @@
 
 #define ETH_ALEN 6
 #define ETH_HLEN 14
+#define ETH_ZLEN 60     /* Min. octets in frame sans FCS */
 
 struct eth_header {
     uint8_t  h_dest[ETH_ALEN];   /* destination eth addr */
-- 
2.25.1


