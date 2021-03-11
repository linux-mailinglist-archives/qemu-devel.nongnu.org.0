Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD18336EDC
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 10:29:41 +0100 (CET)
Received: from localhost ([::1]:42088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKHdU-0003I2-Dx
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 04:29:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lKBnp-0001Mh-Gp
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 22:15:57 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:36241)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lKBnm-0000gO-MB
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 22:15:57 -0500
Received: by mail-wr1-x429.google.com with SMTP id y16so180946wrw.3
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 19:15:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9OkLTf4CKiZWR10cK4aZAq5cEfHZTpDd8uL6zLXXLlU=;
 b=qDznDRarfurg9MAanimfm6GqDSWZvc0CLRpqo//qBHeC3uI8ISboAzNvtDShOjYDwR
 YsOSAWXWGXPHDGh8fqufn2jo7VNTDEoBXo7lMaSY4xJp4meS+pI3V90cEkVEg99gB383
 zV6rZ/px5W7DRpyEGlgGWyKC9JFbvayyiiFJBaq4SL3AxTNtSByE0epr4FhfYSeU89wF
 oSKHFYmOg7S6qHmnEmgGKQhAKAj1DaQPtCQCs+wKqBY2DQfX18694s0MIneutm6iLSJm
 fOh9AL/gxOnBg112Pv65h0tfkWtuysVKQmGkkQQdW9NzPOqoP/vw0jA474Lmp7KCb9gV
 5rgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9OkLTf4CKiZWR10cK4aZAq5cEfHZTpDd8uL6zLXXLlU=;
 b=Ty3C0rB1bNkRf1GfoBkPPKRdaf/Ax6IZ0h440yJWMUFZ513OgoyXxg/AzkyBvyEMKW
 WuFw9swAeFRtOiSxSO3C3qAfPGj/wN5S/jc8V5kdhLfo0Jqxm4kudcWVK1b1JBlJjzc+
 4JhPX+eBBKdxbo8I8k8fVuzs3ZLmrBoCVWYSiWKmEQeFBZIIzW6zqfpE43HcO4TMhOm6
 jT01rLOViypZaVUjD4pOOgEaylTaf9pgb3a6LKEvmWSbf8btk9GfM/xDIfQ6Q+pmkPpQ
 8Q2SOUvjJK1ZftBTAvN/zRXuE2FfevdLEoOIzbWCT4n6PMFKpgY+S+swp2zihdyADyRz
 cpTw==
X-Gm-Message-State: AOAM531eg/O34oFp2LsSFTtg5XkL7sF5+cj7fhQUL4UnyELjGPD1WgL4
 vW5AElLsINKs2NxY4GnrErFIxcEjElHUrPL7iiE=
X-Google-Smtp-Source: ABdhPJylLvdD5K3XFIHCVF2MfTAPAUC/giOIHNUr+BebrXJ88SfiHNBsY+D5vwFTZqiJnvHV77n7lA==
X-Received: by 2002:a5d:4e85:: with SMTP id e5mr6543296wru.218.1615432552969; 
 Wed, 10 Mar 2021 19:15:52 -0800 (PST)
Received: from localhost.localdomain ([197.61.47.225])
 by smtp.googlemail.com with ESMTPSA id o188sm1450416wme.7.2021.03.10.19.15.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 19:15:52 -0800 (PST)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/9] char: Replaced a qemu_mutex_lock with QEMU_LOCK_GUARD
Date: Thu, 11 Mar 2021 05:15:32 +0200
Message-Id: <20210311031538.5325-4-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210311031538.5325-1-ma.mandourr@gmail.com>
References: <20210311031538.5325-1-ma.mandourr@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=ma.mandourr@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 11 Mar 2021 04:24:51 -0500
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Removed a pair of qemu_mutex_lock and its respective qemu_mutex_unlock
and used a QEMU_LOCK_GUARD instead. This improves readability by
removing the call to qemu_mutex_unlock.

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
---
 chardev/char.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/chardev/char.c b/chardev/char.c
index 97cafd6849..2b0bc1325c 100644
--- a/chardev/char.c
+++ b/chardev/char.c
@@ -115,7 +115,7 @@ static int qemu_chr_write_buffer(Chardev *s,
     int res = 0;
     *offset = 0;
 
-    qemu_mutex_lock(&s->chr_write_lock);
+    QEMU_LOCK_GUARD(&s->chr_write_lock);
     while (*offset < len) {
     retry:
         res = cc->chr_write(s, buf + *offset, len - *offset);
@@ -153,7 +153,6 @@ static int qemu_chr_write_buffer(Chardev *s,
          */
         qemu_chr_write_log(s, buf, len);
     }
-    qemu_mutex_unlock(&s->chr_write_lock);
 
     return res;
 }
-- 
2.25.1


