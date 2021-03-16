Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C594133CF70
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 09:14:55 +0100 (CET)
Received: from localhost ([::1]:40892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lM4qs-0003oK-QA
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 04:14:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lM4pM-0001zG-5s
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 04:13:20 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:42774)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lM4pG-0007is-66
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 04:13:19 -0400
Received: by mail-ej1-x62d.google.com with SMTP id c10so70527873ejx.9
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 01:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=zFD0OwTu4zg933ZUYHx0OWDYQrleMrwwHf8amxbXto8=;
 b=TjXAtEIezL69YD/82/M4vL/KKwrqA3Q6uVGD+2Lq0kBKycszUG+9GgVQp0Mq3JYjC5
 S1BrnKo/CH3Mp4kCnoR8L+phq470SYBuReqGBUL2KVDtO9snLEEVn6LobL0ZkggBXNnt
 Ul3z3KTD3+QYnFvThMrF1KgTbDUafFwQOa6xEjOnI559bw0nryZM8tbvFTFp6QEgAyvW
 3XIZQYdXfuBPS5ayu/k0SZk8oN2gbMm0qg4d9NDR8x47SpoAzSJFR2InQc3HHOKHc+yp
 uhqIzbngx8GdVgc8SHwBFt3gJjuBQRlDSvpip4tdQCZ+eQeTvLPnzUR2YoMUkY80Z1yJ
 A5tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zFD0OwTu4zg933ZUYHx0OWDYQrleMrwwHf8amxbXto8=;
 b=gG8d44CGJZ9dKQMbw+jmMYYYOmJcDxo6VldJynIjNg1et2PZ5vDm5UK9Ekw0naSE+B
 818F6AgtCvIYxnaVgLqmUONvtiIpBqQIZkEYdAYh3+2jua0X87J38xXSgYMz3r65serd
 l1qTDWx/KMLV/qBeButlXcwOILubXweRtYpnUUL47XBPIZKePbLGr0C2n8UWMg8RutTu
 NgOOBsAGA9ElQRsvzAkII322I9wZROk+PoV6EdN2R7BWpa0f+vEmbUZSp5ZkKVV3ZlPv
 kOy3OCMQ+AuhHvsDBMOrFzn4gKdZSXFB4yNCc8RBL3Ba3uisgmIA6QU39IQD0FdnOsJN
 ai7g==
X-Gm-Message-State: AOAM532t15kmjnZHvcnD4dtcKOxvlucL8cbM8W5pROcxy5wcsFBSl34w
 cCLSwK5XJGznn0t+xPJz/1/7/G6A+E4=
X-Google-Smtp-Source: ABdhPJzpqrzTySRm1UB4njLSouWTnq8IxOFiDdD5G7DaKMz/VjzNhChC95gZtp5B6Q9S5S30yvfmDg==
X-Received: by 2002:a17:906:d291:: with SMTP id
 ay17mr27819729ejb.308.1615882391578; 
 Tue, 16 Mar 2021 01:13:11 -0700 (PDT)
Received: from pek-vx-bsp9.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id a17sm5620333ejf.20.2021.03.16.01.13.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Mar 2021 01:13:11 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Subject: [PATCH v3 02/13] net: Add a 'do_not_pad" to NetClientState
Date: Tue, 16 Mar 2021 16:12:43 +0800
Message-Id: <20210316081254.72684-3-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210316081254.72684-1-bmeng.cn@gmail.com>
References: <20210316081254.72684-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x62d.google.com
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

This adds a flag in NetClientState, so that a net client can tell
its peer that the packets do not need to be padded to the minimum
size of an Ethernet frame (60 bytes) before sending to it.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

---

Changes in v3:
- add a comment to 'do_not_pad'

 include/net/net.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/net/net.h b/include/net/net.h
index 919facaad2..f944731c18 100644
--- a/include/net/net.h
+++ b/include/net/net.h
@@ -100,6 +100,7 @@ struct NetClientState {
     int vring_enable;
     int vnet_hdr_len;
     bool is_netdev;
+    bool do_not_pad; /* do not pad to the minimum ethernet frame length */
     QTAILQ_HEAD(, NetFilterState) filters;
 };
 
-- 
2.17.1


