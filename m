Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F8E23808E4
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 13:50:20 +0200 (CEST)
Received: from localhost ([::1]:39334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhWKh-0004I8-FQ
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 07:50:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1lhWJK-0002Ii-7O
 for qemu-devel@nongnu.org; Fri, 14 May 2021 07:48:54 -0400
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136]:39650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1lhWJH-0004nH-Bu
 for qemu-devel@nongnu.org; Fri, 14 May 2021 07:48:53 -0400
Received: by mail-lf1-x136.google.com with SMTP id g4so13279472lfv.6
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 04:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ibirWkv6uSYSQxoczRpL46TKKwuomQRszme/uUDeX18=;
 b=1yHnsuyTgBVZmSGCJMXmpjlZehpjGsUfbvJ6uqVTLllkSdp629sZOsVeEwCiCVXuic
 EmmxFU8DoYrihTev3+TlG7g6PiwDkU6Q2uSq+lFy046D/zq9AGaTFmucIaa6tw4syDgk
 +wVUo2c3StE+2MMaaSoeYZFPLVmTO1S4UughBhRObUfNkrlDlJ8dMRbqVWfg/+XqFPvH
 FTZHOjGazobQ3ztUgujIjnCa2HYXs13wWqg4maLuNL8+eB+BhfxSKxpi5GkGcPVmoOq3
 4D8V1+6/QCaa98l17J0Nzs7Ln/4P6/lBjCRu19dCRLhruxB6sEFcQL7MVy2Kq0P4abGg
 jApA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ibirWkv6uSYSQxoczRpL46TKKwuomQRszme/uUDeX18=;
 b=nPActJSejflysDOVgknMK/PuW2omgWIYGcGV4m+0hpSoBB2BKAoZ6Lqgty1DfTI28n
 a+q6ZHuOfSJvADzZPZXwHnLYTB7CHW8P+RgMa4Sr/nSvrmsU1OOtVTo3y160l92FdrWA
 GPnaAlXZzV3pUomCyenOEVK5ZoMYQV38Vbe+EQ54gQWzU8BgCCnvPRFrAa2rBM3AwxSW
 1nkKMpEC/PhqqUpK/4r0QGLcF7xd72i4hwEgNJpReEeGerZ3GgVrFiErXgwYrV58zTtc
 xHZ86J9ojD9pPqNYHXTRUGnFe+E/Dtl8oApeAWTcP/RA6cQff54Ms1RVYH+qJmaPFJPA
 JJpg==
X-Gm-Message-State: AOAM530akOvnB1f96OiqdzGIutZEgHPW+9W8uy6Rzs3ZlN3VRu361itd
 cba/jKOvy1bC2WYuMCYqdfAIFw==
X-Google-Smtp-Source: ABdhPJyDyxKmSMInKMxNTBoAf+L1jtRfTo1KrPRC0RzUqb7cn/aLmVEGy2kIPOOOPD5uy69kd6PtFQ==
X-Received: by 2002:ac2:43d1:: with SMTP id u17mr31264968lfl.462.1620992929547; 
 Fri, 14 May 2021 04:48:49 -0700 (PDT)
Received: from navi.cosmonova.net.ua ([95.67.24.131])
 by smtp.gmail.com with ESMTPSA id t13sm583421lfc.57.2021.05.14.04.48.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 May 2021 04:48:49 -0700 (PDT)
From: Andrew Melnychenko <andrew@daynix.com>
To: jasowang@redhat.com,
	mst@redhat.com
Subject: [PATCH v8 1/7] net/tap: Added TUNSETSTEERINGEBPF code.
Date: Fri, 14 May 2021 14:48:29 +0300
Message-Id: <20210514114835.267316-2-andrew@daynix.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210514114835.267316-1-andrew@daynix.com>
References: <20210514114835.267316-1-andrew@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2a00:1450:4864:20::136;
 envelope-from=andrew@daynix.com; helo=mail-lf1-x136.google.com
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


