Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E8694140EE
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 06:59:43 +0200 (CEST)
Received: from localhost ([::1]:48624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSuMA-0000yx-HI
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 00:59:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mSuJP-0006Y0-7o
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 00:56:51 -0400
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e]:42935)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mSuJN-0007ic-0b
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 00:56:50 -0400
Received: by mail-io1-xd2e.google.com with SMTP id b10so1715911ioq.9
 for <qemu-devel@nongnu.org>; Tue, 21 Sep 2021 21:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Bz9xxzOHeyZagtkOxaSrxkXtiVjb/9po0iv6mA9969Y=;
 b=ONKcw7XaOEBPT0Gu4E0hvXngAxk3iOrHWOdQxFZH6UO4vChfFiT4sd7shPppDVUlmI
 dx1N5PkvDmlHM1HwS3Yz7fyRGxeBm+/nwLWNWU6geFkadj/SEt0Fqe5Rbba0uOM96C9C
 dJassA4RjbKwYHD+/FtbIJki703/YYUIXUZ+GBBuaO+eGbpw7u82HwLznZAV+hEW8fDy
 1KeEaKLuJLY8qugodxas88JYE7DPfZD8Nml+PQdFkdc6P/YeBN+KbwACPOinSd0rPklN
 cb8U4mzIY1IhrkRUgo9nEzl+yM59YqPlYK3c48F+SLumSmp2N3vr67lzQpfI2y0llHV7
 x4sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Bz9xxzOHeyZagtkOxaSrxkXtiVjb/9po0iv6mA9969Y=;
 b=hb+8thndfLAUK+YUYes3L+q//hYW4YCu0UrCRIczSxF2KQpRHjXc5YS6EaIiB8/qaN
 D8bthqXz08orSDNG0EK39O/1D4wqv/747rzPyp5nKRh6U2syGSWeRE4vmm/5fc1Z72Ho
 JW4X/pAjvk8eswOCyFmUkOY/L5Ta8Do5ETf/hnBuuSmKEHS7DF6RiKni2zqkC0X5/PYe
 Zn6hbGfHKtgUzHP4lRywyE3QbqxIwx1hW0zabVjg7W1/3UDpdyrAAE7GP7vmSwjIo7X3
 ql2Y2eIid/UsAF5czmkIUWMQsQy5yTtKSpdPYK/1YDknwoURrdSAE5AQb4RqnSZYhLTq
 S+zA==
X-Gm-Message-State: AOAM530fTzTXf6+tPi0Oz4DsKq9oPlyjReXFYKay7OoLDwph56/IiI9o
 CsIcJ8EngWQrlU2FvzzU/DAnW5MmC9Bh7sS6kww=
X-Google-Smtp-Source: ABdhPJz5WqmY0N/5gEuNmFao7zhQ4u61viAd6zM0wIlsVqRFrBJpaKs/jDfpptFfLqAGxVM53t17Fg==
X-Received: by 2002:a05:6602:1346:: with SMTP id
 i6mr2829206iov.128.1632286607690; 
 Tue, 21 Sep 2021 21:56:47 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id j5sm512833ilk.58.2021.09.21.21.56.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Sep 2021 21:56:47 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 4/9] bsd-user/mmap.c: mmap return ENOMEM on overflow
Date: Tue, 21 Sep 2021 22:56:31 -0600
Message-Id: <20210922045636.25206-5-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210922045636.25206-1-imp@bsdimp.com>
References: <20210922045636.25206-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d2e;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2e.google.com
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
Cc: kevans@freebsd.org, richard.henderson@linaro.org, f4bug@amsat.org,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

mmap should return ENOMEM on len overflow rather than EINVAL. Return
EINVAL when len == 0 and ENOMEM when the rounded to a page length is 0.
Found by make check-tcg.

Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/mmap.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/bsd-user/mmap.c b/bsd-user/mmap.c
index c40059d7fc..0acc2db712 100644
--- a/bsd-user/mmap.c
+++ b/bsd-user/mmap.c
@@ -454,11 +454,18 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, int prot,
         goto fail;
     }
 
-    len = TARGET_PAGE_ALIGN(len);
     if (len == 0) {
         errno = EINVAL;
         goto fail;
     }
+
+    /* Check for overflows */
+    len = TARGET_PAGE_ALIGN(len);
+    if (len == 0) {
+        errno = ENOMEM;
+        goto fail;
+    }
+
     real_start = start & qemu_host_page_mask;
     host_offset = offset & qemu_host_page_mask;
 
-- 
2.32.0


