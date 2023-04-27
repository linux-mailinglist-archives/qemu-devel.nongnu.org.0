Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F28F6F0250
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 10:06:24 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prwdi-0002SF-4I; Thu, 27 Apr 2023 04:06:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1prwdW-0002R8-Dv
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 04:05:57 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1prwdT-0005yJ-Vi
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 04:05:53 -0400
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-1a6817adde4so84133925ad.0
 for <qemu-devel@nongnu.org>; Thu, 27 Apr 2023 01:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1682582750; x=1685174750;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=s7QuPv9Cjw69b25ArEIVw7D17NwJ5vGrJ89z54RxzmQ=;
 b=aH6Og+D3MqzXYC2vE/5v1g9GfWERe+tOBrLxa1fvn2v+M44eo7hRgSR75aU1k08H0u
 YnMz6V5I51IokTsCrsqgCAnP359TGMmSeZ54OZS3qMyNL7/Lt+vHRTFtBjnJTzNdSjlq
 NHweGPT+4To33o+B7iNecmmgcftvmcJzpYr0bS0FrZPY1WQmtrMOvfCF/MtWrp1kEyGn
 tvrhYXKW4o+V7XEsB697ahxAbjFpD9AlP1BwJCrm+AnoxmZJDSNrXLyBXtFQnEVuPm6o
 G8J0ucrMZEzd71kKVTV3F129ZUIwOc8u1alOw3v7aUMwGr4GaOqy3AhstWPsuYGQJPQP
 PEWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682582750; x=1685174750;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=s7QuPv9Cjw69b25ArEIVw7D17NwJ5vGrJ89z54RxzmQ=;
 b=QduQLVl+NeRfMmvCH8ZemUQQElKI166Ur4MDmZG/twn9aHJzQS9Sx7gzm6hJiLGh9o
 d/YXVmqAC6v1zJ8XtCgxU7Xz18x7qcqmA7esByoZjiuAfb5cL9mnHUUugGf1w9JbMmUS
 kjo+5JQGfoJb4hbN8xNyMN1QXA6DGRfIKUxx849U/A+30dNBv2VQD9icCXHIeJb/uhWu
 G5Ok3RihjPAwYE0rZPW1YEEqpr04EjC8i/58mGBqwS50bOsNbpeklO0N45c+hoc5N/5S
 9lVip3PxmOvtSCTwRALuLRKvaMIOnz+DTgYO+66hTJWbqjiXg+YTudz0U86SEbhpuk/z
 U5kg==
X-Gm-Message-State: AC+VfDzSwsf1gYODRAfzAlpR+ULSS4AxA/jEnxN0cV7zGH5dQ8BmW8aU
 TnRLHstqzsi0kpAnaxbIV2Ab8A==
X-Google-Smtp-Source: ACHHUZ6vDgibe3JCyGKxaWKJlu1yXOBL9y9WJSObCL31OT8wnzCgmGPkU6llX61roeFXi8Iv8gnO/Q==
X-Received: by 2002:a17:902:d4c9:b0:1a6:db0a:8005 with SMTP id
 o9-20020a170902d4c900b001a6db0a8005mr583474plg.68.1682582750170; 
 Thu, 27 Apr 2023 01:05:50 -0700 (PDT)
Received: from libai.bytedance.net ([61.213.176.11])
 by smtp.gmail.com with ESMTPSA id
 jc13-20020a17090325cd00b001993a1fce7bsm11124624plb.196.2023.04.27.01.05.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Apr 2023 01:05:49 -0700 (PDT)
From: zhenwei pi <pizhenwei@bytedance.com>
To: mst@redhat.com,
	arei.gonglei@huawei.com
Cc: qemu-devel@nongnu.org, zhenwei pi <pizhenwei@bytedance.com>,
 Mauro Matteo Cascella <mcascell@redhat.com>,
 Xiao Lei <nop.leixiao@gmail.com>, Yongkang Jia <kangel@zju.edu.cn>,
 Yiming Tao <taoym@zju.edu.cn>
Subject: [PATCH] cryptodev: Handle unexpected request to avoid crash
Date: Thu, 27 Apr 2023 16:05:09 +0800
Message-Id: <20230427080509.172477-1-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Generally guest side should discover which services the device is
able to offer, then do requests on device.

However it's also possible to break this rule in a guest. Handle
unexpected request here to avoid NULL pointer dereference.

Fixes: e7a775fd ('cryptodev: Account statistics')
Cc: Gonglei <arei.gonglei@huawei.com>
Cc: Mauro Matteo Cascella <mcascell@redhat.com>
Cc: Xiao Lei <nop.leixiao@gmail.com>
Cc: Yongkang Jia <kangel@zju.edu.cn>
Reported-by: Yiming Tao <taoym@zju.edu.cn>
Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
---
 backends/cryptodev.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/backends/cryptodev.c b/backends/cryptodev.c
index 94ca393cee..d3fe92d8c0 100644
--- a/backends/cryptodev.c
+++ b/backends/cryptodev.c
@@ -191,6 +191,11 @@ static int cryptodev_backend_account(CryptoDevBackend *backend,
     if (algtype == QCRYPTODEV_BACKEND_ALG_ASYM) {
         CryptoDevBackendAsymOpInfo *asym_op_info = op_info->u.asym_op_info;
         len = asym_op_info->src_len;
+
+        if (unlikely(!backend->asym_stat)) {
+            error_report("cryptodev: Unexpected asym operation");
+            return -VIRTIO_CRYPTO_NOTSUPP;
+        }
         switch (op_info->op_code) {
         case VIRTIO_CRYPTO_AKCIPHER_ENCRYPT:
             CryptodevAsymStatIncEncrypt(backend, len);
@@ -210,6 +215,11 @@ static int cryptodev_backend_account(CryptoDevBackend *backend,
     } else if (algtype == QCRYPTODEV_BACKEND_ALG_SYM) {
         CryptoDevBackendSymOpInfo *sym_op_info = op_info->u.sym_op_info;
         len = sym_op_info->src_len;
+
+        if (unlikely(!backend->sym_stat)) {
+            error_report("cryptodev: Unexpected sym operation");
+            return -VIRTIO_CRYPTO_NOTSUPP;
+        }
         switch (op_info->op_code) {
         case VIRTIO_CRYPTO_CIPHER_ENCRYPT:
             CryptodevSymStatIncEncrypt(backend, len);
-- 
2.34.1


