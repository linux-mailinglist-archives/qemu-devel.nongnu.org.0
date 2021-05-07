Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE1AA376952
	for <lists+qemu-devel@lfdr.de>; Fri,  7 May 2021 19:12:32 +0200 (CEST)
Received: from localhost ([::1]:41580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lf41g-0007XX-0U
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 13:12:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lf3w9-0003iB-7s
 for qemu-devel@nongnu.org; Fri, 07 May 2021 13:06:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29427)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lf3w6-0008Pc-Ru
 for qemu-devel@nongnu.org; Fri, 07 May 2021 13:06:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620407206;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IQcNAA9tRjy6cgYfLgq5D4uU843TCcUWyjVEQXH6Mlc=;
 b=NkXVmIO21D5oSYI5DsIxfExyPH/WeekoIP1roO22x7BMRXH5lQ6r7FLvi/JIofr6eTfcUT
 4EKpl8bkjhpQW0hO3cqvZR3p/9/bHvS5DCXqjEgCKg9VZ7DQ1mKX48r29uzOwRk/bVSyXU
 Uj4TPIyAk1aoUzuzh9H7UNKwFKgrDm8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-46-dgGDY_wkNO-ksvXCxe2EzA-1; Fri, 07 May 2021 13:06:43 -0400
X-MC-Unique: dgGDY_wkNO-ksvXCxe2EzA-1
Received: by mail-wm1-f70.google.com with SMTP id
 t6-20020a1cc3060000b0290146ea8f8661so2450166wmf.4
 for <qemu-devel@nongnu.org>; Fri, 07 May 2021 10:06:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IQcNAA9tRjy6cgYfLgq5D4uU843TCcUWyjVEQXH6Mlc=;
 b=Mo4ESsTwZriW5qJqC2qu8VZywVY2L5UrezM+KP8GRWSkTzTbttRf+CQNkfsQR7mfg2
 7LhRoU690YJL+RGflSrPxo2Rpv+agell6GvLI/3jcPHmtLKDwYPdXg9muaCwrFxxV1rE
 GjK77hSCptpeHfG0M6huL4e6jU9vpvO6SLOPyVI1T9ufen053QPyzvelnymE0XjsSSSy
 uYKy2XTQSxgC9AyzI5v4HoVYExSqzAyC0K1AgXjqzAGHAX2Vjv8KntZS0dTEUB8VR7Fa
 OXvb43vai4OIWDL4yXh7v3R/Y1ZlFThKUeV9V7GZQoE3Rct2DxWdxeDaxsJ+axSiH9cb
 cE8A==
X-Gm-Message-State: AOAM533fx90+/he/3/UUvNMfKVy6qNBMQ3cVmBfdNwcMjMlgZuovG0cj
 YkNdMv7jGAXhe5vQP3LxzqoHPP8j702IndvCd51VSQ1mCF7CffYzHosyJ7TV7KZhbcwUURs8kbo
 ERv0GRm+I7kAL0hgi8WfnFoSoWn2//BUFm1WY/HfB4cuDnOdcKZamztPIXq+rPpP4
X-Received: by 2002:a7b:c1c5:: with SMTP id a5mr22037117wmj.63.1620407202308; 
 Fri, 07 May 2021 10:06:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwFAdms1v9lQvYAE+b4wDfhdOWIslvE9kh403/f8ZmkZXdFkfeQcaZ81vKyv82+MRMIALw0ng==
X-Received: by 2002:a7b:c1c5:: with SMTP id a5mr22037090wmj.63.1620407202121; 
 Fri, 07 May 2021 10:06:42 -0700 (PDT)
Received: from localhost.localdomain
 (astrasbourg-652-1-219-60.w90-40.abo.wanadoo.fr. [90.40.114.60])
 by smtp.gmail.com with ESMTPSA id p7sm8497070wrt.24.2021.05.07.10.06.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 May 2021 10:06:41 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/2] bitops.h: Improve find_xxx_bit() documentation
Date: Fri,  7 May 2021 19:06:33 +0200
Message-Id: <20210507170634.2058801-2-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210507170634.2058801-1-philmd@redhat.com>
References: <20210507170634.2058801-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Sergio Lopez <slp@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Max Reitz <mreitz@redhat.com>, Chai Wen <chaiwen@baidu.com>,
 qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Document the following functions return the bitmap size
if not matching bit is found:

- find_first_bit
- find_next_bit
- find_last_bit
- find_first_zero_bit
- find_next_zero_bit

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/qemu/bitops.h | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/include/qemu/bitops.h b/include/qemu/bitops.h
index 3acbf3384c6..eb0fc5416a9 100644
--- a/include/qemu/bitops.h
+++ b/include/qemu/bitops.h
@@ -140,7 +140,8 @@ static inline int test_bit(long nr, const unsigned long *addr)
  * @addr: The address to start the search at
  * @size: The maximum size to search
  *
- * Returns the bit number of the first set bit, or size.
+ * Returns the bit number of the last set bit,
+ * or @size if there is no set bit in the bitmap.
  */
 unsigned long find_last_bit(const unsigned long *addr,
                             unsigned long size);
@@ -150,6 +151,9 @@ unsigned long find_last_bit(const unsigned long *addr,
  * @addr: The address to base the search on
  * @offset: The bitnumber to start searching at
  * @size: The bitmap size in bits
+ *
+ * Returns the bit number of the next set bit,
+ * or @size if there is no set bit in the bitmap.
  */
 unsigned long find_next_bit(const unsigned long *addr,
                             unsigned long size,
@@ -160,6 +164,9 @@ unsigned long find_next_bit(const unsigned long *addr,
  * @addr: The address to base the search on
  * @offset: The bitnumber to start searching at
  * @size: The bitmap size in bits
+ *
+ * Returns the bit number of the next cleared bit,
+ * or @size if there is no clear bit in the bitmap.
  */
 
 unsigned long find_next_zero_bit(const unsigned long *addr,
@@ -171,7 +178,8 @@ unsigned long find_next_zero_bit(const unsigned long *addr,
  * @addr: The address to start the search at
  * @size: The maximum size to search
  *
- * Returns the bit number of the first set bit.
+ * Returns the bit number of the first set bit,
+ * or @size if there is no set bit in the bitmap.
  */
 static inline unsigned long find_first_bit(const unsigned long *addr,
                                            unsigned long size)
@@ -194,7 +202,8 @@ static inline unsigned long find_first_bit(const unsigned long *addr,
  * @addr: The address to start the search at
  * @size: The maximum size to search
  *
- * Returns the bit number of the first cleared bit.
+ * Returns the bit number of the first cleared bit,
+ * or @size if there is no clear bit in the bitmap.
  */
 static inline unsigned long find_first_zero_bit(const unsigned long *addr,
                                                 unsigned long size)
-- 
2.26.3


