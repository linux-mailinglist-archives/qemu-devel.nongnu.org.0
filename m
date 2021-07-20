Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A50D73CFE18
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 17:46:31 +0200 (CEST)
Received: from localhost ([::1]:54946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5rx0-0006lA-Ln
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 11:46:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m5rsX-0007J8-L1
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 11:41:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22533)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m5rsV-0004fd-Il
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 11:41:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626795710;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ntka8v41Zy5onalJgxtnwBqwcN06N2wRrhCeomWWnn0=;
 b=PsZq5c0cR0HEv5n9/9IrvDTvTDr5f/48UYJdyx46EJ+z4rw7ZjJESW/pSRJyfNvBjUKZp7
 LT1WKsNRsMrLMcUzWwZTeAtWkUu8DZgb4qxufJO+ocGT5QbUhYzxdr5lsccn5lpoXgdqI0
 B6P0vnXa4u80dJbfMD2az17kWcDbIw0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-387-u0VZIpUmOGKry18UGpIOMA-1; Tue, 20 Jul 2021 11:41:49 -0400
X-MC-Unique: u0VZIpUmOGKry18UGpIOMA-1
Received: by mail-wr1-f72.google.com with SMTP id
 r9-20020a5d49890000b02901524df25ad7so780151wrq.8
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 08:41:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ntka8v41Zy5onalJgxtnwBqwcN06N2wRrhCeomWWnn0=;
 b=NBIWy3n0opEaEvnxtpMBUIRY/2vKhEXsRsIV2QPirWxG6M/azJlzHg8Eq9OXTkDvCb
 lTTcUcKfXFrClY0MI7tJ6WNlG/DT+ZnvUM2y8lM8ylRvijqy1wFBegu3aRr8jRQ9avay
 JVzcCxoL9Mu5VyajIZwRVg/rhVonUdmUKLA0SC4877aE4l6IdS4bL7nr4MWjBXWH1bzR
 J50U1f+k7JQjd4FAzNr79hwQPRUT690ujnvETdxclY2jRcsnaTGqEoWbIjkYDvql1Rv/
 fW7IN/YPLoZSGvsyAmz3MWZ/FKM7pSOJ3hQNqyzrsOOVvw2dwK4ytuDdn3iNB443mWe6
 vY0Q==
X-Gm-Message-State: AOAM533mSfPYy7d9q3wlN507p5/JssvUP8nO/ViJF2JjqUSJqRkq6eRX
 Ni87pQhAO9JqivHjWe7yiUEnw10QOe2NFm6GxeSbBkOhKzzKVSMhNSMSZjaOb50xIgQBR4tHrq1
 XLKe/6nMwbtX+AfKISwuCywjvTu4nYkeq8U5WS2cu9T1/CjIUzehzB8BjuDoA6v8c
X-Received: by 2002:a5d:6d88:: with SMTP id l8mr28710648wrs.301.1626795707895; 
 Tue, 20 Jul 2021 08:41:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwRxhQEwGYr8mlkFYD/mnHGnX73BF/iJRYr2aEp6qXfuJeoTGbtEAjwiDwIXbvDwXc+uW+AYA==
X-Received: by 2002:a5d:6d88:: with SMTP id l8mr28710625wrs.301.1626795707564; 
 Tue, 20 Jul 2021 08:41:47 -0700 (PDT)
Received: from x1w.. (122.red-83-42-66.dynamicip.rima-tde.net. [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id
 z6sm11222949wrw.9.2021.07.20.08.41.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 08:41:47 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 01/17] hw/mips: Add dependency MIPS_CPS -> MIPS_ITU
Date: Tue, 20 Jul 2021 17:41:25 +0200
Message-Id: <20210720154141.3919817-2-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210720154141.3919817-1-philmd@redhat.com>
References: <20210720154141.3919817-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.474,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The Inter-Thread Communication Unit (ITU, introduced in commit
34fa7e83e11) is part of the Coherent Processing System (CPS),
as describe in commit 408294352ad:

    Make ITU available in the system if CPU supports multithreading
    and is part of CPS.

Have CPS select ITU in Kconfig to avoid the following build failure:

  /usr/bin/ld: libqemu-mips64el-softmmu.fa.p/hw_mips_cps.c.o: in function `mips_cps_realize':
  hw/mips/cps.c:104: undefined reference to `mips_itu_get_tag_region'

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20190311005618.19007-5-philmd@redhat.com>
---
 hw/mips/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/mips/Kconfig b/hw/mips/Kconfig
index c245e881a2b..1d4051fcf07 100644
--- a/hw/mips/Kconfig
+++ b/hw/mips/Kconfig
@@ -47,6 +47,7 @@ config LOONGSON3V
 config MIPS_CPS
     bool
     select PTIMER
+    select MIPS_ITU
 
 config MIPS_BOSTON
     bool
-- 
2.31.1


