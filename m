Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E87393D4D5C
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Jul 2021 14:27:49 +0200 (CEST)
Received: from localhost ([::1]:46524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m7dES-00085e-VH
	for lists+qemu-devel@lfdr.de; Sun, 25 Jul 2021 08:27:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m7dBC-0000NG-2H
 for qemu-devel@nongnu.org; Sun, 25 Jul 2021 08:24:26 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:37621)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m7dBA-0003mv-Ic
 for qemu-devel@nongnu.org; Sun, 25 Jul 2021 08:24:25 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 a4-20020a17090aa504b0290176a0d2b67aso7275384pjq.2
 for <qemu-devel@nongnu.org>; Sun, 25 Jul 2021 05:24:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=jKT88FJaIPG7gZArl0HUCsFrykLbgFymcE0AdSiWRRE=;
 b=vXcKDBWKStWTi5GZZVyCE/pbQxstLGlu90bkIZdCapznmbZRHj7iSSao0QMDzFJ/vd
 sMpP3fTaLASqJ6fM/lmlMgOcYOKFrkXzzonNsuTut7sd6Ba9M3YbxccBaNPvwCDCbzyn
 o8sG8f606bMYcIQZbbKBMhil+8GaYi5kt4CvrFCN5vp7r+P9mm7QN47K5c6T1LiY0tPY
 WGeKz9wHacltN6h0Vk+3kDwfswuMWwqKjSVqGQO7VMr/etxm8kMAEVpNND5qqPbTm987
 Rus4I4nZhX5UvbLpxmCLG4QUw7/dNBbolrrkM6y018E4vNJzgsc6Q4tH+IihWUN99df6
 wONg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jKT88FJaIPG7gZArl0HUCsFrykLbgFymcE0AdSiWRRE=;
 b=Y0vdU8btJZ32dJPHzIsZUuu+XABvLNf4jpbwqwfS6H5StEtyirJo22pLvrH0J/FL5G
 LTcibCd+E/NfNHIISQccs7soHg/fdOrlglC4Jml8mckaVhrVuwRAyZUAavxyD3wRlBYE
 HtpR2EVKX9d+T0Wuk3+CZZmb7BIt16OiPOH1NPmIS257OF20YDv9sujy29/Tz9zd8Dqu
 4psQHthdVbD8dQlDqJRk98GMFMxxQontjFjODGBybx1ZrmzbdDMwRaSybthWWtQ9SGlb
 Lq7ARp3AqLjZt6qTffVOwRsTvbx0ZeipHZ0pNVODAVOeT48u8XHAeiLQIY6yoOMyP/10
 2Xxg==
X-Gm-Message-State: AOAM5312GHO7SFD4wk8rtTOiq1IwZrKFNmOoid/vG45OdqnE3UukugxI
 m8qd3Ls/LdxJxeTDNejck5ZqZCaIqSn2pQ==
X-Google-Smtp-Source: ABdhPJxgFUWeUlhPt3ZoG9NkOycU/5V6yPrE5xwLl2JQy1KRr/uGpJDqBSBvk7EiUuu44w3d0r2SAg==
X-Received: by 2002:a63:cc0c:: with SMTP id x12mr13337759pgf.1.1627215863384; 
 Sun, 25 Jul 2021 05:24:23 -0700 (PDT)
Received: from cloudburst.home
 (2603-800c-3202-ffa7-497b-6ae4-953c-7ad1.res6.spectrum.com.
 [2603:800c:3202:ffa7:497b:6ae4:953c:7ad1])
 by smtp.gmail.com with ESMTPSA id k37sm15005093pgm.84.2021.07.25.05.24.22
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jul 2021 05:24:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.1? v2 4/9] net/checksum: Remove unused variable in
 net_checksum_add_iov
Date: Sun, 25 Jul 2021 02:24:11 -1000
Message-Id: <20210725122416.1391332-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210725122416.1391332-1-richard.henderson@linaro.org>
References: <20210725122416.1391332-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From clang-13:
../qemu/net/checksum.c:189:23: error: variable 'buf_off' set but not used \
    [-Werror,-Wunused-but-set-variable]

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 net/checksum.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/net/checksum.c b/net/checksum.c
index 70f4eaeb3a..68245fd748 100644
--- a/net/checksum.c
+++ b/net/checksum.c
@@ -186,12 +186,11 @@ uint32_t
 net_checksum_add_iov(const struct iovec *iov, const unsigned int iov_cnt,
                      uint32_t iov_off, uint32_t size, uint32_t csum_offset)
 {
-    size_t iovec_off, buf_off;
+    size_t iovec_off;
     unsigned int i;
     uint32_t res = 0;
 
     iovec_off = 0;
-    buf_off = 0;
     for (i = 0; i < iov_cnt && size; i++) {
         if (iov_off < (iovec_off + iov[i].iov_len)) {
             size_t len = MIN((iovec_off + iov[i].iov_len) - iov_off , size);
@@ -200,7 +199,6 @@ net_checksum_add_iov(const struct iovec *iov, const unsigned int iov_cnt,
             res += net_checksum_add_cont(len, chunk_buf, csum_offset);
             csum_offset += len;
 
-            buf_off += len;
             iov_off += len;
             size -= len;
         }
-- 
2.25.1


