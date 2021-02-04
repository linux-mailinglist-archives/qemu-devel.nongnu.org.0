Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E71730F819
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 17:40:04 +0100 (CET)
Received: from localhost ([::1]:60610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7hfm-0006sm-RG
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 11:40:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1l7hbk-0002xM-Az
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 11:35:52 -0500
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c]:38379)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1l7hbi-0002T1-FS
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 11:35:52 -0500
Received: by mail-lf1-x12c.google.com with SMTP id m22so5458962lfg.5
 for <qemu-devel@nongnu.org>; Thu, 04 Feb 2021 08:35:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Qy2e9yCeCbLW2TyypLKklMLFEi/pzkwaSVzGs7kRXVI=;
 b=JxrWS/taYgEJYx/TwwjKbQEo/84rgFhKatuvH1oeqFtnZy+jT1Nm9kaKPeVXZQPJB0
 0mNcjDN2kag/HbQoZcYGCf51zusCEOubqW7h79saG8QGgJHC4aT9eO1TZBvCrPQRDXzF
 ZOe7WHK6ZI/h6owVKO7KU2pRdB5gWnGb+m96h3eXzDBh4Tx057LFhZPf+rGyDVyAewkO
 CANz2vQSWfHQi/WKaCjB1Y3/pCVbDPSHze84lnvSfdYD/zeyJHvjD3VAT8r4kVbOzU2K
 MRSmFAdYDgYdxrZry9FKtNQ0CcaQKsNblOHIBNQEyFApChIevnCLayQRHXqRFmNeYaGt
 qPrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Qy2e9yCeCbLW2TyypLKklMLFEi/pzkwaSVzGs7kRXVI=;
 b=F7wqPvotJwvcPAZNprEUG0049GCYCcKbxnRsFAx1tsSQgUJKPR1zWKsGVm+5qey0II
 jK0DNOkCwMX/eHf9ZgxiL5vZVrFpyvgYOHxDqAXmHguvW4WdzDc/YNHTqErGCFj8Btye
 W9Px1af6Ly+7Qd8UB2JoxcGAsNtQSUlVEtEM2gwZ28D+nnv4r3Cqyy9L8vC9zJ7P3YWq
 IXaDbE6l/6PqHM/kIu0YlLMpQ5AKz9gBCznuzICoOTTh5xx9sSide04xU69Q0B0dWE2h
 RyjFmcO7jmYNkGzY3c6rtWwj1uTeoBO2zoDpTK7hG48mXsHMFbJL8UEuUcu6Y8AuZXuw
 cfug==
X-Gm-Message-State: AOAM5325klcUoQnJ2TzZzUaTDl0PHQouPP6PoEqrfKCo2JSFTRJMzmXa
 6BIqqXFssFgRL/sbBYfvzP/0rQ==
X-Google-Smtp-Source: ABdhPJx3cNxqn27C4RbBqxVUPiXKdhTpaav9fno3Yb8azMotfci6lMK3bhW1P3cb5c1ahVNC9YYV6A==
X-Received: by 2002:a05:6512:516:: with SMTP id
 o22mr103585lfb.487.1612456544295; 
 Thu, 04 Feb 2021 08:35:44 -0800 (PST)
Received: from navi.cosmonova.net.ua ([95.67.24.131])
 by smtp.gmail.com with ESMTPSA id c123sm668172lfd.95.2021.02.04.08.35.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Feb 2021 08:35:43 -0800 (PST)
From: Andrew Melnychenko <andrew@daynix.com>
To: jasowang@redhat.com,
	mst@redhat.com
Subject: [RFC PATCH v4 1/7] net/tap: Added TUNSETSTEERINGEBPF code.
Date: Thu,  4 Feb 2021 19:09:45 +0200
Message-Id: <20210204170951.91805-2-andrew@daynix.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210204170951.91805-1-andrew@daynix.com>
References: <20210204170951.91805-1-andrew@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2a00:1450:4864:20::12c;
 envelope-from=andrew@daynix.com; helo=mail-lf1-x12c.google.com
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


