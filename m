Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B341548291
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jun 2022 10:58:04 +0200 (CEST)
Received: from localhost ([::1]:33254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0ftb-0002jF-4C
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 04:58:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <helei.sig11@bytedance.com>)
 id 1o0fis-0006n2-Rl
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 04:47:00 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:33630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <helei.sig11@bytedance.com>)
 id 1o0fiq-0001OW-3m
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 04:46:57 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 hv24-20020a17090ae41800b001e33eebdb5dso7845249pjb.0
 for <qemu-devel@nongnu.org>; Mon, 13 Jun 2022 01:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0d0Z4zhJVuD2nfsM6VtrO7Io61bTc2eXiMhVSlIsoyY=;
 b=t1HfGPuzpzT8TgSjwG1MIC2QfxybNM+2nXXNTup2wrxtBuErclT2QeeEwQrCH7UDoj
 LvZZul/7Qj0RkaWV0agf25OcGqSap60WWsc6Ja7J4MFEKL2wQU2yVyxdT5p7w9RBIqS9
 0ngpiptM/Fe/tfL0NrljpzPSz+3SEXy8THfKxma+M4+prdyC4Loq9Q2O0BJHDUgf8HbU
 Yjpc5NFcEJDHFK/DWfG/WCaav2CKTHR754y/v9IxgjuQig+pYDa2vfw6A3iJK9y4n0hB
 Eg7czJ/7KxpG1BVU9Nfm/v7SOoUPAtKMKXhinlShm7xqyLBYohqes3kNqZq9xM3t/gH2
 MwEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0d0Z4zhJVuD2nfsM6VtrO7Io61bTc2eXiMhVSlIsoyY=;
 b=PNfIszVYM2cij1XE6MXfA8FaAmF9PjxaHvT2ZKuIlkVPvpeKBhJNcUgtq2xhsihKMl
 WOKR9OzDRDLT7oKrf+ypzgwKo8qB8HbPYDiXQZlLRxV7ar6/bx35p9UxDklENrAJHMEL
 sj3516Uxfjn5+oTUymZiBlNuAgEWcHy5gIBmDzQKSWModdgMtoOaPVASFKm2u1+q92Qn
 6WsPAX2CKbZMBkUvojSiwyALJ41iBWNfs9Hgm8muHiCB33ZWf2zATBhrv1/SxZkxVvhh
 n02/sihWInnZV7j1tbp8WOr4/L4uonkdCE8shWPPl98nAAhmNzeiQb07HGjN6PYZ2zLk
 hMHw==
X-Gm-Message-State: AOAM531XghxB5Arib95uPYBNu7epWhsVgYG1723QhQ2ZoQw2uUELgwj/
 UhpEjUBx6/tkBHd0GRvvaUK6/2hA23zORQ==
X-Google-Smtp-Source: ABdhPJwYqt2z713jnqQRi72sHr4aq23S/322ejorQ8t59IzVc96W2QF4tMloKXs3KAIP0NtbZG87jw==
X-Received: by 2002:a17:903:20d3:b0:168:cca5:e79e with SMTP id
 i19-20020a17090320d300b00168cca5e79emr10182534plb.66.1655110014658; 
 Mon, 13 Jun 2022 01:46:54 -0700 (PDT)
Received: from FVFDK26JP3YV.usts.net ([139.177.225.251])
 by smtp.gmail.com with ESMTPSA id
 f27-20020aa79d9b000000b0050dc762814fsm4729196pfq.41.2022.06.13.01.46.51
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 13 Jun 2022 01:46:54 -0700 (PDT)
From: Lei He <helei.sig11@bytedance.com>
To: mst@redhat.com, arei.gonglei@huawei.com, berrange@redhat.com,
 qemu-devel@nongnu.org
Cc: helei.sig11@bytedance.com,
	pizhenwei@bytedance.com,
	jasowang@redhat.com
Subject: [PATCH 7/7] crypto: Add test suite for ECDSA algorithm
Date: Mon, 13 Jun 2022 16:45:31 +0800
Message-Id: <20220613084531.8086-8-helei.sig11@bytedance.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220613084531.8086-1-helei.sig11@bytedance.com>
References: <20220613084531.8086-1-helei.sig11@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=helei.sig11@bytedance.com; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

1. add test suite for ecdsa algorithm.
2. use qcrypto_akcihper_max_xxx_len to help create buffers in
test code.

Signed-off-by: lei he <helei.sig11@bytedance.com>
---
 tests/unit/test-crypto-akcipher.c | 227 +++++++++++++++++++++++++++++++++++---
 1 file changed, 212 insertions(+), 15 deletions(-)

diff --git a/tests/unit/test-crypto-akcipher.c b/tests/unit/test-crypto-akcipher.c
index 4f1f4214dd..7b0f5ac4d4 100644
--- a/tests/unit/test-crypto-akcipher.c
+++ b/tests/unit/test-crypto-akcipher.c
@@ -314,6 +314,100 @@ static const uint8_t rsa2048_public_key[] = {
     0xed, 0x02, 0x03, 0x01, 0x00, 0x01
 };
 
+static const uint8_t ecdsa_p192_public_key[] = {
+    0x04, 0xc4, 0x16, 0xb3, 0xff, 0xac, 0xd5, 0x87,
+    0x98, 0xf7, 0xd9, 0x45, 0xfe, 0xd3, 0x5c, 0x17,
+    0x9d, 0xb2, 0x36, 0x22, 0xcc, 0x07, 0xb3, 0x6d,
+    0x3c, 0x4e, 0x04, 0x5f, 0xeb, 0xb6, 0x52, 0x58,
+    0xfb, 0x36, 0x10, 0x52, 0xb7, 0x01, 0x62, 0x0e,
+    0x94, 0x51, 0x1d, 0xe2, 0xef, 0x10, 0x82, 0x88,
+    0x78,
+};
+
+static const uint8_t ecdsa_p192_private_key[] = {
+    0x30, 0x53, 0x02, 0x01, 0x01, 0x04, 0x18, 0xcb,
+    0xc8, 0x86, 0x0e, 0x66, 0x3c, 0xf7, 0x5a, 0x44,
+    0x13, 0xb8, 0xef, 0xea, 0x1d, 0x7b, 0xa6, 0x1c,
+    0xda, 0xf4, 0x1b, 0xc7, 0x67, 0x6b, 0x35, 0xa1,
+    0x34, 0x03, 0x32, 0x00, 0x04, 0xc4, 0x16, 0xb3,
+    0xff, 0xac, 0xd5, 0x87, 0x98, 0xf7, 0xd9, 0x45,
+    0xfe, 0xd3, 0x5c, 0x17, 0x9d, 0xb2, 0x36, 0x22,
+    0xcc, 0x07, 0xb3, 0x6d, 0x3c, 0x4e, 0x04, 0x5f,
+    0xeb, 0xb6, 0x52, 0x58, 0xfb, 0x36, 0x10, 0x52,
+    0xb7, 0x01, 0x62, 0x0e, 0x94, 0x51, 0x1d, 0xe2,
+    0xef, 0x10, 0x82, 0x88, 0x78,
+};
+
+static const uint8_t ecdsa_p256_private_key[] = {
+    0x30, 0x77, 0x02, 0x01, 0x01, 0x04, 0x20, 0xf6,
+    0x92, 0xdd, 0x29, 0x1c, 0x6e, 0xef, 0xb6, 0xb2,
+    0x73, 0x9f, 0x40, 0x1b, 0xb3, 0x2a, 0x28, 0xd2,
+    0x37, 0xd6, 0x4a, 0x5b, 0xe4, 0x40, 0x4c, 0x6a,
+    0x95, 0x99, 0xfa, 0xf7, 0x92, 0x49, 0xbe, 0xa0,
+    0x0a, 0x06, 0x08, 0x2a, 0x86, 0x48, 0xce, 0x3d,
+    0x03, 0x01, 0x07, 0xa1, 0x44, 0x03, 0x42, 0x00,
+    0x04, 0xed, 0x42, 0x9c, 0x67, 0x79, 0xbe, 0x46,
+    0x83, 0x88, 0x3e, 0x8c, 0xc1, 0x33, 0xf3, 0xc3,
+    0xf6, 0x2c, 0xf3, 0x13, 0x6a, 0x00, 0xc2, 0xc9,
+    0x3e, 0x87, 0x7f, 0x86, 0x39, 0xe6, 0xae, 0xe3,
+    0xb9, 0xba, 0x2f, 0x58, 0x63, 0x32, 0x62, 0x62,
+    0x54, 0x07, 0x27, 0xf9, 0x5a, 0x3a, 0xc7, 0x3a,
+    0x6b, 0x5b, 0xbc, 0x0d, 0x33, 0xba, 0xbb, 0xd4,
+    0xa3, 0xff, 0x4f, 0x9e, 0xdd, 0xf5, 0x59, 0xc0,
+    0xf6,
+};
+
+static const uint8_t ecdsa_p256_public_key[] = {
+    0x04, 0xed, 0x42, 0x9c, 0x67, 0x79, 0xbe, 0x46,
+    0x83, 0x88, 0x3e, 0x8c, 0xc1, 0x33, 0xf3, 0xc3,
+    0xf6, 0x2c, 0xf3, 0x13, 0x6a, 0x00, 0xc2, 0xc9,
+    0x3e, 0x87, 0x7f, 0x86, 0x39, 0xe6, 0xae, 0xe3,
+    0xb9, 0xba, 0x2f, 0x58, 0x63, 0x32, 0x62, 0x62,
+    0x54, 0x07, 0x27, 0xf9, 0x5a, 0x3a, 0xc7, 0x3a,
+    0x6b, 0x5b, 0xbc, 0x0d, 0x33, 0xba, 0xbb, 0xd4,
+    0xa3, 0xff, 0x4f, 0x9e, 0xdd, 0xf5, 0x59, 0xc0,
+    0xf6,
+};
+
+static const uint8_t ecdsa_p384_public_key[] = {
+    0x04, 0xab, 0xd5, 0xf8, 0x87, 0x1d, 0x23, 0x9b,
+    0x26, 0xb9, 0x57, 0x7e, 0x97, 0x78, 0x10, 0xcd,
+    0x13, 0xe3, 0x98, 0x25, 0xa8, 0xd6, 0xab, 0x66,
+    0x35, 0x26, 0x68, 0x8a, 0x0e, 0x49, 0xd9, 0x4a,
+    0x91, 0x7d, 0x6c, 0x94, 0x06, 0x06, 0x99, 0xf1,
+    0x8d, 0x2a, 0x25, 0x8d, 0xf9, 0xbf, 0x40, 0xfa,
+    0xb7, 0xcb, 0xe1, 0x14, 0x22, 0x0a, 0xa7, 0xfb,
+    0x0a, 0xb4, 0x02, 0x05, 0x8b, 0x98, 0xaa, 0x78,
+    0xcd, 0x53, 0x00, 0x1e, 0xd1, 0x79, 0x6a, 0x5f,
+    0x09, 0x01, 0x88, 0xb4, 0xbc, 0x32, 0x62, 0x83,
+    0x92, 0x84, 0x2d, 0xc6, 0xf8, 0xda, 0xc4, 0x7f,
+    0x10, 0xa3, 0x18, 0x1d, 0xae, 0x0d, 0xa4, 0x41,
+    0x9f,
+};
+
+static const uint8_t ecdsa_p384_private_key[] = {
+    0x30, 0x81, 0x9b, 0x02, 0x01, 0x01, 0x04, 0x30,
+    0xb6, 0x04, 0xef, 0xb1, 0x2c, 0x98, 0xdf, 0xcf,
+    0xd4, 0x16, 0x31, 0xd4, 0x69, 0x0c, 0x27, 0x81,
+    0x4a, 0xac, 0x1a, 0x83, 0x3c, 0xe4, 0xef, 0x65,
+    0xe1, 0x7a, 0x6a, 0xc6, 0xd6, 0xf7, 0xea, 0x79,
+    0xbe, 0xf1, 0x00, 0x3c, 0xdf, 0x6e, 0x9d, 0x10,
+    0x22, 0x61, 0x1b, 0x11, 0xcf, 0x49, 0x6e, 0x62,
+    0xa1, 0x64, 0x03, 0x62, 0x00, 0x04, 0xab, 0xd5,
+    0xf8, 0x87, 0x1d, 0x23, 0x9b, 0x26, 0xb9, 0x57,
+    0x7e, 0x97, 0x78, 0x10, 0xcd, 0x13, 0xe3, 0x98,
+    0x25, 0xa8, 0xd6, 0xab, 0x66, 0x35, 0x26, 0x68,
+    0x8a, 0x0e, 0x49, 0xd9, 0x4a, 0x91, 0x7d, 0x6c,
+    0x94, 0x06, 0x06, 0x99, 0xf1, 0x8d, 0x2a, 0x25,
+    0x8d, 0xf9, 0xbf, 0x40, 0xfa, 0xb7, 0xcb, 0xe1,
+    0x14, 0x22, 0x0a, 0xa7, 0xfb, 0x0a, 0xb4, 0x02,
+    0x05, 0x8b, 0x98, 0xaa, 0x78, 0xcd, 0x53, 0x00,
+    0x1e, 0xd1, 0x79, 0x6a, 0x5f, 0x09, 0x01, 0x88,
+    0xb4, 0xbc, 0x32, 0x62, 0x83, 0x92, 0x84, 0x2d,
+    0xc6, 0xf8, 0xda, 0xc4, 0x7f, 0x10, 0xa3, 0x18,
+    0x1d, 0xae, 0x0d, 0xa4, 0x41, 0x9f,
+};
+
 static const uint8_t test_sha1_dgst[] = {
     0x3c, 0x05, 0x19, 0x34, 0x29, 0x19, 0xc7, 0xe0,
     0x87, 0xb6, 0x24, 0xf9, 0x58, 0xac, 0xa4, 0xd4,
@@ -374,6 +468,45 @@ static const uint8_t exp_signature_rsa1024_pkcs1[] = {
     0xab, 0x0d, 0xc6, 0x59, 0x1d, 0xc7, 0x33, 0x7b,
 };
 
+static const uint8_t exp_signature_ecdsa_p192[] = {
+    0x30, 0x35, 0x02, 0x19, 0x00, 0xba, 0xf7, 0xc0,
+    0xc1, 0x7e, 0xf5, 0x69, 0xd5, 0xb7, 0x5d, 0x06,
+    0xcb, 0x92, 0x28, 0x57, 0x52, 0x96, 0x9a, 0xdc,
+    0xc9, 0xf9, 0xd5, 0x2c, 0x51, 0x02, 0x18, 0x26,
+    0x21, 0x5d, 0x16, 0xba, 0xff, 0x19, 0x74, 0x56,
+    0x8e, 0xdf, 0x51, 0x2b, 0x2c, 0xce, 0xc2, 0x7b,
+    0x5b, 0x03, 0x10, 0x56, 0x57, 0x63, 0x47,
+};
+
+static const uint8_t exp_signature_ecdsa_p256[] = {
+    0x30, 0x45, 0x02, 0x21, 0x00, 0xac, 0x09, 0xf3,
+    0x32, 0xb6, 0xf6, 0x7e, 0x12, 0x4f, 0x68, 0xdb,
+    0x10, 0x14, 0x61, 0xf6, 0x29, 0xbd, 0xdd, 0x72,
+    0x9f, 0x81, 0xf8, 0x83, 0x8a, 0xf3, 0x29, 0x87,
+    0x7b, 0xbb, 0xcf, 0xea, 0x64, 0x02, 0x20, 0x14,
+    0xfc, 0x2e, 0x2f, 0x3e, 0x06, 0xb1, 0xd0, 0xbb,
+    0x91, 0x44, 0xd5, 0x53, 0xb4, 0x72, 0xa1, 0x83,
+    0xc7, 0x3a, 0xa8, 0xfc, 0x43, 0x1b, 0x2e, 0xbb,
+    0xb0, 0xe9, 0xef, 0x0b, 0x03, 0x32, 0x74,
+};
+
+static const uint8_t exp_signature_ecdsa_p384[] = {
+    0x30, 0x64, 0x02, 0x30, 0x3c, 0x79, 0x7f, 0x5a,
+    0x91, 0x08, 0x79, 0xde, 0x6e, 0x03, 0x19, 0x39,
+    0xcb, 0x94, 0x9c, 0xc6, 0x09, 0x12, 0xfa, 0xbd,
+    0xa8, 0x35, 0x5e, 0x3f, 0x74, 0x05, 0x12, 0xd1,
+    0x8e, 0xd9, 0x3c, 0x79, 0x9d, 0x7c, 0x1a, 0xae,
+    0x96, 0x05, 0x0e, 0x35, 0x21, 0x73, 0xd8, 0xfe,
+    0x1b, 0x43, 0x06, 0xb9, 0x02, 0x30, 0x11, 0xdf,
+    0xa7, 0xba, 0x70, 0x84, 0x4b, 0x74, 0xab, 0x1e,
+    0x9e, 0x6a, 0xc1, 0x46, 0xe3, 0x98, 0x0a, 0x25,
+    0x82, 0xf5, 0xff, 0xb5, 0x6f, 0x04, 0xda, 0xc3,
+    0xfd, 0x3e, 0xea, 0x96, 0x03, 0x0c, 0x22, 0xf2,
+    0xda, 0x86, 0xeb, 0x91, 0x2f, 0x36, 0x13, 0xba,
+    0x37, 0xcd, 0xe7, 0x91, 0x85, 0xf3,
+};
+
+
 static const uint8_t test_plaintext[] = {
     0x00, 0x44, 0xbc, 0x6f, 0x77, 0xfb, 0xe2, 0xa4,
     0x98, 0x9e, 0xf5, 0x33, 0xa0, 0xbd, 0x81, 0xb9,
@@ -870,7 +1003,60 @@ static QCryptoAkCipherTestData akcipher_test_data[] = {
         .signature = exp_signature_rsa2048_pkcs1,
         .slen = sizeof(exp_signature_rsa2048_pkcs1),
     },
+    {
+        .path = "/crypto/akcipher/ecdsa-nist-p192",
+        .opt = {
+            .alg = QCRYPTO_AKCIPHER_ALG_ECDSA,
+            .u.ecdsa = {
+                .curve_id = QCRYPTO_CURVE_ID_NIST_P192,
+            },
+        },
+        .pub_key = ecdsa_p192_public_key,
+        .pub_key_len = sizeof(ecdsa_p192_public_key),
+        .priv_key = ecdsa_p192_private_key,
+        .priv_key_len = sizeof(ecdsa_p192_private_key),
 
+        .dgst = test_sha1_dgst,
+        .dlen = sizeof(test_sha1_dgst),
+        .signature = exp_signature_ecdsa_p192,
+        .slen = sizeof(exp_signature_ecdsa_p192),
+    },
+    {
+        .path = "/crypto/akcipher/ecdsa-nist-p256",
+        .opt = {
+            .alg = QCRYPTO_AKCIPHER_ALG_ECDSA,
+            .u.ecdsa = {
+                .curve_id = QCRYPTO_CURVE_ID_NIST_P256,
+            },
+        },
+        .pub_key = ecdsa_p256_public_key,
+        .pub_key_len = sizeof(ecdsa_p256_public_key),
+        .priv_key = ecdsa_p256_private_key,
+        .priv_key_len = sizeof(ecdsa_p256_private_key),
+
+        .dgst = test_sha1_dgst,
+        .dlen = sizeof(test_sha1_dgst),
+        .signature = exp_signature_ecdsa_p256,
+        .slen = sizeof(exp_signature_ecdsa_p256),
+    },
+    {
+        .path = "/crypto/akcipher/ecdsa-nist-p384",
+        .opt = {
+            .alg = QCRYPTO_AKCIPHER_ALG_ECDSA,
+            .u.ecdsa = {
+                .curve_id = QCRYPTO_CURVE_ID_NIST_P384,
+            },
+        },
+        .pub_key = ecdsa_p384_public_key,
+        .pub_key_len = sizeof(ecdsa_p384_public_key),
+        .priv_key = ecdsa_p384_private_key,
+        .priv_key_len = sizeof(ecdsa_p384_private_key),
+
+        .dgst = test_sha1_dgst,
+        .dlen = sizeof(test_sha1_dgst),
+        .signature = exp_signature_ecdsa_p384,
+        .slen = sizeof(exp_signature_ecdsa_p384),
+    },
 };
 
 static void test_akcipher(const void *opaque)
@@ -879,6 +1065,8 @@ static void test_akcipher(const void *opaque)
     g_autofree uint8_t *plaintext = NULL;
     g_autofree uint8_t *ciphertext = NULL;
     g_autofree uint8_t *signature = NULL;
+    int signature_len, ciphertext_len, plaintext_len;
+    int max_plen, max_slen, max_clen;
     QCryptoAkCipher *pub_key, *priv_key;
 
     if (!qcrypto_akcipher_supports((QCryptoAkCipherOptions *)&data->opt)) {
@@ -894,32 +1082,41 @@ static void test_akcipher(const void *opaque)
                                     data->priv_key, data->priv_key_len,
                                     &error_abort);
     g_assert(priv_key != NULL);
+    max_plen = qcrypto_akcipher_max_plaintext_len(pub_key);
+    max_clen = qcrypto_akcipher_max_plaintext_len(pub_key);
+    max_slen = qcrypto_akcipher_max_signature_len(priv_key);
 
     if (data->plaintext != NULL) {
 
-        ciphertext = g_new0(uint8_t, data->clen);
-        g_assert(qcrypto_akcipher_encrypt(pub_key, data->plaintext, data->plen,
-                                          ciphertext, data->clen,
-                                          &error_abort) > 0);
+        ciphertext = g_new0(uint8_t, max_clen);
+        ciphertext_len = qcrypto_akcipher_encrypt(pub_key,
+                                                  data->plaintext, data->plen,
+                                                  ciphertext, max_clen,
+                                                  &error_abort);
+        g_assert(ciphertext_len > 0);
 
         /**
          * In the asymmetric encryption algorithms, the ciphertext generated
          * each time may be different, here only compare the decrypted
          * plaintext
          */
-        plaintext = g_new0(uint8_t, data->clen);
-        g_assert(qcrypto_akcipher_decrypt(priv_key, ciphertext,
-                                          data->clen, plaintext,
-                                          data->plen,
-                                          &error_abort) == data->plen);
+        plaintext = g_new0(uint8_t, max_plen);
+        plaintext_len = qcrypto_akcipher_decrypt(priv_key,
+                                                 ciphertext, ciphertext_len,
+                                                 plaintext, max_plen,
+                                                 &error_abort);
+        g_assert(plaintext_len == data->plen);
         g_assert(!memcmp(plaintext, data->plaintext, data->plen));
     }
 
     if (data->signature != NULL) {
-        signature = g_new(uint8_t, data->slen);
-        g_assert(qcrypto_akcipher_sign(priv_key, data->dgst, data->dlen,
-                                       signature, data->slen,
-                                       &error_abort) > 0);
+        signature = g_new(uint8_t, max_slen);
+        signature_len = qcrypto_akcipher_sign(priv_key,
+                                              data->dgst, data->dlen,
+                                              signature, max_slen,
+                                              &error_abort);
+        g_assert(signature_len > 0);
+
         /**
          * The signature generated each time may be different, here only check
          * the verification.
@@ -927,12 +1124,12 @@ static void test_akcipher(const void *opaque)
         g_assert(qcrypto_akcipher_verify(pub_key, data->signature, data->slen,
                                          data->dgst, data->dlen,
                                          &error_abort) == 0);
-        g_assert(qcrypto_akcipher_verify(pub_key, signature, data->slen,
+        g_assert(qcrypto_akcipher_verify(pub_key, signature, signature_len,
                                          data->dgst, data->dlen,
                                          &error_abort) == 0);
         ++signature[0];
         /* Here error should be ignored */
-        g_assert(qcrypto_akcipher_verify(pub_key, signature, data->slen,
+        g_assert(qcrypto_akcipher_verify(pub_key, signature, signature_len,
                                          data->dgst, data->dlen, NULL) != 0);
     }
 
-- 
2.11.0


