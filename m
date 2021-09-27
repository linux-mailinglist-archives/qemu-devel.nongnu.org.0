Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8751E419A5F
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 19:07:08 +0200 (CEST)
Received: from localhost ([::1]:54456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUu5r-0005Hu-Fs
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 13:07:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mUu1w-0002R6-FN
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 13:03:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50841)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mUu1t-000326-OA
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 13:03:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632762181;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kPn5GHEDutfKNKZw8lA1qzDG/9Zl78E1M/sfSpGJuu0=;
 b=ZdbA7+9lEXksLTGMGMaOzGNSSrBXbQIJFzCXo/O8KyrFUyrkeHkRW/yH+vHKcxoUbR7Mju
 z68Jmuv6Ss8Dw9ZI5+bWxmYPgOHXMzcHhuRwZvAZ00DWJ2I9AV6225ITe/fiiMdPB1mvwI
 tgLLtgLekdaa7EA5IH0iB0sMFFM1Ij0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-558-sAc426WxO32SVl7fPIuesA-1; Mon, 27 Sep 2021 13:02:57 -0400
X-MC-Unique: sAc426WxO32SVl7fPIuesA-1
Received: by mail-wm1-f71.google.com with SMTP id
 d12-20020a1c730c000000b0030b4e0ecf5dso175471wmb.9
 for <qemu-devel@nongnu.org>; Mon, 27 Sep 2021 10:02:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kPn5GHEDutfKNKZw8lA1qzDG/9Zl78E1M/sfSpGJuu0=;
 b=5WMSVAxojJbS6ZgndX5IQuVsa3bKDeegV7D8cNB8d6UTNwWiU/ihDWgKQV/L69856F
 5uzSaWIDtaLneOkVtPXYoMU/NGs42nkpXw/1zyoWMBmsS+mnGmTJ7100f1RMh2ahC/nO
 aX7uAMsmmXmCJxVv3CnXcjVMKM2qpbd1729XJngh0eup5FbIChCN/fulf5oCZVToAAZ5
 PyvdlwpT3hM1D8gLfSO43oP2MTa9Mbijg+uukqE08W7wX59GQY48keRpOnlJ+vbhs72z
 kC7e3nz746QalBvjXKT0TEJ5lNSlK+V3MxIqpC7WELrI/UmtTP4XN5riLfBkaNoyWobT
 lpXw==
X-Gm-Message-State: AOAM532jQnimkFTaxRr8pnUWFJg870cDul89lO33f+z5AS7xGge80m9H
 yQnb+brmn9H3kHOHrGZknrrVKFyidNsy5TodZL68i2oWaPOlskR1I9+uhg53UvdO2KScJTJmPA6
 7WKgCS/xy16p6YvrVrBN/eTFtbEcfcTEiQJbgzlBZle6LPNmB8wQqmz7dISZn9Fwq
X-Received: by 2002:adf:e74b:: with SMTP id c11mr1073449wrn.101.1632762176385; 
 Mon, 27 Sep 2021 10:02:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyO4h5vtep0WjRypFwTuyp631vpRY8xUV65e8biEejGGtrDoEQi72/xS3Sc4AK2gR00vzTbDg==
X-Received: by 2002:adf:e74b:: with SMTP id c11mr1073414wrn.101.1632762176159; 
 Mon, 27 Sep 2021 10:02:56 -0700 (PDT)
Received: from x1w.redhat.com (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id 189sm84643wmz.27.2021.09.27.10.02.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Sep 2021 10:02:55 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 06/21] Acceptance tests: add myself as a reviewer for the
 acceptance tests
Date: Mon, 27 Sep 2021 19:02:12 +0200
Message-Id: <20210927170227.2014482-7-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210927170227.2014482-1-philmd@redhat.com>
References: <20210927170227.2014482-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Willian Rampazzo <willianr@redhat.com>

Signed-off-by: Willian Rampazzo <willianr@redhat.com>
Acked-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210809192907.42138-1-willianr@redhat.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 069db6d2995..f98523cfe0f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3485,6 +3485,7 @@ W: https://trello.com/b/6Qi1pxVn/avocado-qemu
 R: Cleber Rosa <crosa@redhat.com>
 R: Philippe Mathieu-Daudé <philmd@redhat.com>
 R: Wainer dos Santos Moschetta <wainersm@redhat.com>
+R: Willian Rampazzo <willianr@redhat.com>
 S: Odd Fixes
 F: tests/acceptance/
 
-- 
2.31.1


