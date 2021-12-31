Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55A38482425
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Dec 2021 14:19:16 +0100 (CET)
Received: from localhost ([::1]:59080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n3HoR-0003gG-87
	for lists+qemu-devel@lfdr.de; Fri, 31 Dec 2021 08:19:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n3HLb-00071n-MR
 for qemu-devel@nongnu.org; Fri, 31 Dec 2021 07:49:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44572)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n3HLZ-0000r4-It
 for qemu-devel@nongnu.org; Fri, 31 Dec 2021 07:49:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640954965;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X3dwL7UtUUj/bBavCjeaTxvYP5y2clkbdynk8B+7VuI=;
 b=XVSJYGF/CUWr6Wvm/ulEJ2XeG4ocoNmA+uTUdIQ2LmClPYrKY26zPz8CPqZbL3gg5e6z5/
 BORzvllgpxkIaFXwELZstZGokhOt+ieNNtIJcJoncbbY4KyNTuYdmYf9KBNig5KYX6ZPqc
 ABcpAe5O0QTJHNYvFp650+sH8y0Nz0Q=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-507-qkgqxQ4WO42zxbehnIxhdg-1; Fri, 31 Dec 2021 07:49:23 -0500
X-MC-Unique: qkgqxQ4WO42zxbehnIxhdg-1
Received: by mail-wm1-f69.google.com with SMTP id
 f202-20020a1c1fd3000000b00344f1cae317so4576038wmf.0
 for <qemu-devel@nongnu.org>; Fri, 31 Dec 2021 04:49:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=X3dwL7UtUUj/bBavCjeaTxvYP5y2clkbdynk8B+7VuI=;
 b=NpD/84vONaFstHh2PeFlQNuFYH04xyRaFNuBGIwp0cISGXMzzKRA62ca8+6DBfTXzx
 W3WC2zjdXJpcNJUQ0DYDclddjb/db06WvQJeuBjGkoL+8qPZfOnDuGnIdB88jz5nIJsf
 Q7uBgveRf+6vlxMo/8yO73IfRMriKUZJmuL/xe9xuahPxLRNv15WFpyryayj2PFCJG3V
 EOJvZ5BnYGZTOI6RDFBj5oMVg4ekilyJUmP3csj1C8dCdk7ebGJg0q39S37m0o5asKO8
 SVMoa5u8jWdqL+zB6Q+2I2iR+4Sy1c0f1nb2VmFX6dck9lQ8nF82bUvajlXtIeUSrQG7
 hCnw==
X-Gm-Message-State: AOAM530wGYOfxR0Qj7jr4KZSaYerWx2CR0sUQ3VBpG3a0r7YdYogFbi7
 e6gHbjnepr3DtCfgu34q5+L9dJa6mN2SJIlSu5iJUJuwDummDsG6DrYYd1UWty1SxQnYtludGPN
 cvjm5jHTWtgZyzQA8TcHeBRVe1JapSSRTQbQI3hBY3sjr2hEoI9yugXq/6YjRvNe/
X-Received: by 2002:adf:fbc1:: with SMTP id d1mr29563988wrs.648.1640954962616; 
 Fri, 31 Dec 2021 04:49:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJweyDImbM9rqmy0pSxNjJC0aepMxZCZ6hSBZkraB7FthuRAMPLQU6/PWHYLBHNy2QLBqWnirg==
X-Received: by 2002:adf:fbc1:: with SMTP id d1mr29563971wrs.648.1640954962368; 
 Fri, 31 Dec 2021 04:49:22 -0800 (PST)
Received: from x1w.redhat.com (26.red-83-50-86.dynamicip.rima-tde.net.
 [83.50.86.26])
 by smtp.gmail.com with ESMTPSA id b2sm29767671wrd.35.2021.12.31.04.49.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Dec 2021 04:49:22 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 20/20] MAINTAINERS: email address change
Date: Fri, 31 Dec 2021 13:47:54 +0100
Message-Id: <20211231124754.1005747-21-philmd@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211231124754.1005747-1-philmd@redhat.com>
References: <20211231124754.1005747-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) DKIMWL_WL_HIGH=-0.573, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Yanan Wang <wangyanan55@huawei.com>, Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Li Zhijian <lizhijian@cn.fujitsu.com>, Zhang Chen <chen.zhang@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Li Zhijian <lizhijian@cn.fujitsu.com>

Fujitsu's mail service has migrated to O365 months ago, the
lizhijian@cn.fujitsu.com address will stop working on 2022-06-01,
change it to my new email address lizhijian@fujitsu.com.

Signed-off-by: Li Zhijian <lizhijian@cn.fujitsu.com>
Acked-by: Zhang Chen <chen.zhang@intel.com>
Message-Id: <20211231050901.360-1-lizhijian@cn.fujitsu.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index ae6c74f3ff5..f871d759fdf 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2982,7 +2982,7 @@ F: docs/COLO-FT.txt
 
 COLO Proxy
 M: Zhang Chen <chen.zhang@intel.com>
-M: Li Zhijian <lizhijian@cn.fujitsu.com>
+M: Li Zhijian <lizhijian@fujitsu.com>
 S: Supported
 F: docs/colo-proxy.txt
 F: net/colo*
-- 
2.33.1


