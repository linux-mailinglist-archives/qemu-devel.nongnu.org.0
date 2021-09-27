Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3B56419A9D
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 19:09:06 +0200 (CEST)
Received: from localhost ([::1]:34502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUu7l-0002Sj-TH
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 13:09:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mUu1y-0002XD-OC
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 13:03:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55130)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mUu1w-00034M-8e
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 13:03:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632762183;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7mdXDk9PuuMhb2IWlDywxJ7KPADtZTFWFXw/QSSlAd8=;
 b=FUjsrz+zz+rmMBkUqxJ06qRRSv3TGpZTeVxvwa/QgiFMHvxOa93dvFC4LDAgrIwOiw2pgu
 POTQVYxDXUlNCjk2DtpPASX843sGMcDYyEFQ2e6QApPxYw+kmfXlOKM2YNVKxVEgB2qx81
 X+pKNH6TdEZVuqsJ9dpujjxUhaE73Bc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-202--ELMGv0YPraNYAxQlOVtdg-1; Mon, 27 Sep 2021 13:03:02 -0400
X-MC-Unique: -ELMGv0YPraNYAxQlOVtdg-1
Received: by mail-wm1-f70.google.com with SMTP id
 n30-20020a05600c3b9e00b002fbbaada5d7so461454wms.7
 for <qemu-devel@nongnu.org>; Mon, 27 Sep 2021 10:03:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7mdXDk9PuuMhb2IWlDywxJ7KPADtZTFWFXw/QSSlAd8=;
 b=wDgPOw7lFAaYbKLJXARjItXApMQRrjLhY/IjeUyl0Qlf2iiA+vED6pwcg6MiFN0APS
 nOiZWMcwGk+ii7sXcOsXJxBrvoYUKykoIrFTECFnLaxQJHWRvP3u2JKCdFgaoSOaZZzA
 QfT2Icd3Gp20rz6hCvaibhxXlZxihiU04NCGTYOue80EjFDjXmXdkx92iE/ikzAtT7Ah
 x594bLVCpkke1gTg2d/bq9uGe90ZIZRB7YuMgi8D0s3Y0lzlGAF4mVp29UspV3UfC92x
 Ob9WRG6x7VHTP/HBnGtHmbRs9gfSo4pG90uR/WbLtP/8Rf1QeuAnKgsdcEk2hGZ6zbeF
 s3xQ==
X-Gm-Message-State: AOAM532RJWY1JktkjR7FxXLjUDQ8kOBNnxi3cmAfBXfYXGRERvcwJQeg
 nHTQiYTmjl+8mBFK/fbcFAESLzhqz6+1AO2cTS7ybUSsR018c1GkVhTeVnBEdkewZuBIK9b0UpA
 RabDLuq6OmvIe2CbGEazFEcwDmkhiBDEBkhmbLhaUgp1p7z6t46EoheoOOg+i9Yve
X-Received: by 2002:a05:600c:17d8:: with SMTP id
 y24mr95678wmo.129.1632762181038; 
 Mon, 27 Sep 2021 10:03:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwbofEC0Wu+RW2QbQsNe1LdH7aLtvY8RHgmKPmQi/E1sMrJjz80xKkkazZkZ0OkKBFUr0cE3w==
X-Received: by 2002:a05:600c:17d8:: with SMTP id
 y24mr95648wmo.129.1632762180752; 
 Mon, 27 Sep 2021 10:03:00 -0700 (PDT)
Received: from x1w.redhat.com (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id 1sm115907wms.0.2021.09.27.10.02.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Sep 2021 10:03:00 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 07/21] Acceptance Tests: add standard clean up at test
 tearDown()
Date: Mon, 27 Sep 2021 19:02:13 +0200
Message-Id: <20210927170227.2014482-8-philmd@redhat.com>
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
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Cleber Rosa <crosa@redhat.com>

The avocado.Test class, used as the basis of the avocado_qemu.Test
class, performs a clean of temporary directories up as part of its own
tearDown() implementation.

But the avocado_qemu.Test class is currently missing the same clean
up, as it implemented its own tearDown() method without resorting to
the upper class behavior.

This brings avocado_qemu.Test behavior in sync with the standard
avocado.Test behavior and prevents temporary directories from
cluttering the test results directory (unless instructed to do so with
Avocado's "--keep-tmp" option).

Reported-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Cleber Rosa <crosa@redhat.com>
[willianr: respin to new Python super format]
Signed-off-by: Willian Rampazzo <willianr@redhat.com>
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210920204932.94132-2-willianr@redhat.com>
---
 tests/acceptance/avocado_qemu/__init__.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance/avocado_qemu/__init__.py
index 2c4fef3e149..d9e1b32aa16 100644
--- a/tests/acceptance/avocado_qemu/__init__.py
+++ b/tests/acceptance/avocado_qemu/__init__.py
@@ -276,6 +276,7 @@ def tearDown(self):
         for vm in self._vms.values():
             vm.shutdown()
         self._sd = None
+        super().tearDown()
 
     def fetch_asset(self, name,
                     asset_hash=None, algorithm=None,
-- 
2.31.1


