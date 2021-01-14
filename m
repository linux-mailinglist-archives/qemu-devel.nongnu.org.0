Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C34212F6C69
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 21:45:14 +0100 (CET)
Received: from localhost ([::1]:38126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l09UX-0005Kt-6L
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 15:45:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1l09S8-0003ig-PN
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 15:42:44 -0500
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232]:44912)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1l09S6-0004is-J2
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 15:42:44 -0500
Received: by mail-lj1-x232.google.com with SMTP id m13so7950802ljo.11
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 12:42:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Qy2e9yCeCbLW2TyypLKklMLFEi/pzkwaSVzGs7kRXVI=;
 b=duBh0jhl05r81WiSzR7MXAmdoiUpYiU8YjzGV3in1XveyxenjDb+LfW7B4c6zqNdDW
 UfX2NThe4em8kCo/6F+YjaxKyPeAl1PP5uZTCv7EX1NokAsL/ByXpy2p3Jd+tgBfX8/S
 MdXnZyXNzy++qPzLCKiOKlpC5CmWqaHB+pvzlYW1y5/4Ebp1342IpK1XLmj34XA4Suz4
 THlH38FCiY2YZaFJecwHdQaEtg4tKD80822E84A+AEvEZIiz/bW15TXSLN2OZqkg0hIG
 8jvy5G2b4cp/MREpkzJ8qRp0Lp7KjHgpnKx5WKpECCz/FP7zsLWZmMwW/K8bKoSE+7l6
 qrlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Qy2e9yCeCbLW2TyypLKklMLFEi/pzkwaSVzGs7kRXVI=;
 b=DdFWFLBWyiigv2GRh3lG4Rckn43WORsEIxPZwvFncQr5L7k8SVDaAT8SP0+xVwx/Lb
 wbG/PoisYaSSazHZbyxhlJK8Wbu3k8wtnUgsw5zSpyJk4P0Z5f59v8Abuh/Z79nW6XD2
 il3ZThv6l3LzBBA3X4Tm7STpCy17zFnvpQ2YXM0M1hL9FJmsrrD1yaqWJVrNTwyJGIkm
 p67+dJ3ogcFIaR7/SkpEOACsjd4/o+ZbWkUq983LhQjZBYsfPHGUp1JEP4YToYBLzM22
 AR33OryPMYd3INTB9U90gHwDyWYkBspw3maIBK0eeFX1ZWx2drYtS6UlqBh66LLAB50E
 RhYQ==
X-Gm-Message-State: AOAM531f6S0Hl1d2BmDF1cA5dMlwAXTkbxDhWG7Xoao30ZRlD/hzbVKg
 F1XmOSbKmQDwkcYKk2a8ZEy8xA==
X-Google-Smtp-Source: ABdhPJwwR69IoK+iOe5auyqb4YvL8+mZEZheXqiYWhZvB3gaCsu8gWHkg3WLfLzUefglPF5QLwOrGQ==
X-Received: by 2002:a2e:7803:: with SMTP id t3mr3922026ljc.213.1610656960347; 
 Thu, 14 Jan 2021 12:42:40 -0800 (PST)
Received: from navi.cosmonova.net.ua ([95.67.24.131])
 by smtp.gmail.com with ESMTPSA id t20sm565833ljk.58.2021.01.14.12.42.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jan 2021 12:42:39 -0800 (PST)
From: Andrew Melnychenko <andrew@daynix.com>
To: jasowang@redhat.com,
	mst@redhat.com
Subject: [RFC PATCH v3 1/6] net/tap: Added TUNSETSTEERINGEBPF code.
Date: Thu, 14 Jan 2021 23:16:07 +0200
Message-Id: <20210114211612.387052-2-andrew@daynix.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210114211612.387052-1-andrew@daynix.com>
References: <20210114211612.387052-1-andrew@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2a00:1450:4864:20::232;
 envelope-from=andrew@daynix.com; helo=mail-lj1-x232.google.com
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

From: Andrew <andrew@daynix.com>

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
2.30.0


