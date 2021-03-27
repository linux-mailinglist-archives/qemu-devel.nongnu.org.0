Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 628BE34B7BF
	for <lists+qemu-devel@lfdr.de>; Sat, 27 Mar 2021 15:37:53 +0100 (CET)
Received: from localhost ([::1]:41864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQA4W-0003ep-Fg
	for lists+qemu-devel@lfdr.de; Sat, 27 Mar 2021 10:37:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lQA1n-0001ru-0N
 for qemu-devel@nongnu.org; Sat, 27 Mar 2021 10:35:04 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:44597)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lQA1l-0003nP-K9
 for qemu-devel@nongnu.org; Sat, 27 Mar 2021 10:35:02 -0400
Received: by mail-wr1-x432.google.com with SMTP id c8so8371508wrq.11
 for <qemu-devel@nongnu.org>; Sat, 27 Mar 2021 07:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RMfAevnooMhaIGvSU49m3cMTBBQIJBKkJFBpkx6goL4=;
 b=boGE8DznyE8f/AckVYodkCW/XCgDKBWJr3afr3qH35khPyMfuv80ASgeb/Bt0FoILa
 HjAKjvr4bxhDnWH8hOo3qjpqN+50at/6hXwN2kYetN09/xrmdRcxQS0oOiL63Y54ufAm
 j9MY9jZWzHYzjPNt3ufYwfy4InSxr+z+eX9U/h6zTEYj1ovZE0uG/0uZb5Z6/UXX6Z79
 V8qS5DIUiYm7e6kqnTXbPGLY93wMt8aI2vA0pmPJn6NRg5P1xhZpNclUDiGwGvVur7Te
 SoGTqpcbEnHCRBeptjdCit1Gu5tC5XAROYdtF2cqBu702j6Ibq03vZ+iFJx7f85tCd5B
 pQnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=RMfAevnooMhaIGvSU49m3cMTBBQIJBKkJFBpkx6goL4=;
 b=RZHH0SNXr/tWZPrG03lWMzmK45zvvX8z0psiFWbam91xeJtiSpUFbM2TmwcjHoNCad
 xgMy63anjvvJhSptDMVqwKrJi5xA44RqgTLf+RJ+3kYat7zsSHms+LCELv1kf491ULdE
 hdQ4KHfa1rBqXGEXFIUWp1XvJfwgRP6OApFr9R5LVnimDGpOxNrDLgCFN/zo5oqdGDDq
 MnJNAmBuA0u591NANgSG1PYUqQ+0/GWpDhAcXOp3DITha2ofJHSYLxiLm4nyrazcRjyY
 wVL9k0byst1qlFplx2ChqyC30AGqcxLozdJ+5Twc9rODifohUkMNt7fpDZ3khzA+kamN
 U/ZA==
X-Gm-Message-State: AOAM532mu/Vsrv72q6L2IZ/yqq2kWrQDddiuiiO+Dw+j0wECLrecQ+WA
 zceU1FvxxseZEVhuYzRvV/AdB5iqLe8kbA==
X-Google-Smtp-Source: ABdhPJx2Bn57QbZacSAbk4hnd8atHrSm8PMkLNoGe762gm5JPB8CBwcbtW3R7DkROOwo+QscPjaGmg==
X-Received: by 2002:adf:f704:: with SMTP id r4mr19677382wrp.158.1616855699620; 
 Sat, 27 Mar 2021 07:34:59 -0700 (PDT)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id f2sm19588472wrq.34.2021.03.27.07.34.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Mar 2021 07:34:59 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-6.0 v3 1/5] memory: Fix memory_region 'priority' property
 sign
Date: Sat, 27 Mar 2021 15:34:48 +0100
Message-Id: <20210327143452.1514392-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210327143452.1514392-1-f4bug@amsat.org>
References: <20210327143452.1514392-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, Paolo Bonzini <pbonzini@redhat.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Priorities can be negative, fix this limitation.

Fixes: d33382da9ab ("memory: MemoryRegion: Add may-overlap and priority props")
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 softmmu/memory.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/softmmu/memory.c b/softmmu/memory.c
index d4493ef9e43..4fbeee02dc7 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -1257,7 +1257,7 @@ static void memory_region_initfn(Object *obj)
 
     object_property_add_uint64_ptr(OBJECT(mr), "addr",
                                    &mr->addr, OBJ_PROP_FLAG_READ);
-    object_property_add(OBJECT(mr), "priority", "uint32",
+    object_property_add(OBJECT(mr), "priority", "int32",
                         memory_region_get_priority,
                         NULL, /* memory_region_set_priority */
                         NULL, NULL);
-- 
2.26.2


