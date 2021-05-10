Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7DAD379824
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 22:10:44 +0200 (CEST)
Received: from localhost ([::1]:54140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgCEl-0004uG-W2
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 16:10:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lgCCI-00014I-Vi
 for qemu-devel@nongnu.org; Mon, 10 May 2021 16:08:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41090)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lgCCH-00062g-Dv
 for qemu-devel@nongnu.org; Mon, 10 May 2021 16:08:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620677288;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PY2uspWQizT0OsgRvnrGyb/uvN3JDAbEU0Ccc5/rcB0=;
 b=dbktCEfK6CGyaCLmfypC3S/qdO1D04Y8SQA2xA/DLg4Fgl0nsDa1bdTytqgYKtf+F9MC7t
 wvHVFlrCHGaD+z/MuYjFPeZDMFmtz5CiPnZCCkb7sFfS2u3i1wo6ABtsxGVqAmyn5QECNb
 uG3eVKKmOw+HKRs6+Z+sBOT2prh/2cw=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-58-ZM2oCpoaM4GpJs10-TUniA-1; Mon, 10 May 2021 16:08:07 -0400
X-MC-Unique: ZM2oCpoaM4GpJs10-TUniA-1
Received: by mail-ed1-f69.google.com with SMTP id
 f8-20020a0564020688b029038840895df2so9669288edy.17
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 13:08:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PY2uspWQizT0OsgRvnrGyb/uvN3JDAbEU0Ccc5/rcB0=;
 b=GQczBUUfIgg0QXp1NAJmISv7Cp0lP6mWs024pSLmjZ2XSivz7W4/u4dZC574qkRJc4
 /ejwh8RZnOPhk6u2bYCf4CtRW9r9b9w+dYNjKbrkW8TJV1m+LHJzXTpUSQPCp50ZeHKr
 pUwCI2MvNvxLox+IIcbIP2xS2tPT206Epeta53G3VThreROrD4dVRDcPquXnb8aiA9u3
 ZsT+0AmNjA7rCBtRsm8XtqoHtiNm5r8F7KfwSvsHtLS6ETbKc7R9cXmD1SIDbUQ12MlE
 YXb7RI+9wTO4/CZMA2j2ETtTZoRr+vjQkCuM+lGAxirRomCrS7skpbsf3FzN1xQY7K08
 Dzmg==
X-Gm-Message-State: AOAM533OW2aC4Y4Xwh6QqKSzTYZtVwWfdLKP2xypBoWKJdPeL/ivkRnn
 Ktu0XyjfAZmPq5s7YBt7EYFA1U1nlcY0E4BLziUh5xcdf7tKim0ygYa8tGshv2dbz+F3yWuq1Z2
 nKrujo2/XSoxsrBXgIsB7zqvbCA0EsB4wXA350x+pr2h6yF2jVK1p/wPgfN8ze+o1
X-Received: by 2002:a05:6402:234b:: with SMTP id
 r11mr31441286eda.137.1620677285778; 
 Mon, 10 May 2021 13:08:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx5e47iTwtxQbH1Q3pkRPqYKXp7ISyBVc++aS377RGFr245sMe6vqS42Uve0X4I9ajEC/zT/g==
X-Received: by 2002:a05:6402:234b:: with SMTP id
 r11mr31441243eda.137.1620677285556; 
 Mon, 10 May 2021 13:08:05 -0700 (PDT)
Received: from x1w.redhat.com (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id k26sm9870163eje.67.2021.05.10.13.08.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 May 2021 13:08:05 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/2] bitops.h: Improve find_xxx_bit() documentation
Date: Mon, 10 May 2021 22:07:57 +0200
Message-Id: <20210510200758.2623154-2-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210510200758.2623154-1-philmd@redhat.com>
References: <20210510200758.2623154-1-philmd@redhat.com>
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Sergio Lopez <slp@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Max Reitz <mreitz@redhat.com>, Chai Wen <chaiwen@baidu.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Document the following functions return the bitmap size
if no matching bit is found:

- find_first_bit
- find_next_bit
- find_last_bit
- find_first_zero_bit
- find_next_zero_bit

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/qemu/bitops.h | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/include/qemu/bitops.h b/include/qemu/bitops.h
index 3acbf3384c6..a72f69fea85 100644
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
+ * or @size if there are no further set bits in the bitmap.
  */
 unsigned long find_next_bit(const unsigned long *addr,
                             unsigned long size,
@@ -160,6 +164,9 @@ unsigned long find_next_bit(const unsigned long *addr,
  * @addr: The address to base the search on
  * @offset: The bitnumber to start searching at
  * @size: The bitmap size in bits
+ *
+ * Returns the bit number of the next cleared bit,
+ * or @size if there are no further clear bits in the bitmap.
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


