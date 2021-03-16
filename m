Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B449533D3AB
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 13:19:08 +0100 (CET)
Received: from localhost ([::1]:36270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lM8fB-00051I-Oc
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 08:19:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lM8RQ-0002v5-3Z
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 08:04:52 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:35342)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lM8RO-0003s0-FF
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 08:04:51 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 ga23-20020a17090b0397b02900c0b81bbcd4so1267814pjb.0
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 05:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=McNoncbKLzrHCgZek44ykiwoAiw4bXEBjPK5hVmhdvs=;
 b=M5Z6PiZGeXHQgVut/atPHMCG7k7lIS6f0Qix4PJ4U6XO6JklhHNCtrFSc/F67Irq1P
 tIREBfQHS3FO1SG+51C8B9D9mZrGvEfoZZNMxDpk6SLtlZvC0x8CAVCyeVEzg5ov8iN5
 Q84EK1GhEb9SafqYNdNtXVzm2yeEP8ART2t0/K7/0LITaU52M9/PqYOEz3xOy0p5vB7J
 yn8z0EPF6vleqzTARlNsSCdFROFZXZWrqqa3Qx9hK0jdolh7/orx4yh4MF7EqOL7W7pP
 hgd3ZgFOVtc+VMaKWYgz6F4XQa9kSrQMXWp7KOOl8vS6DHh3nVoFeCKIdi/yFaTJm8bj
 a96A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=McNoncbKLzrHCgZek44ykiwoAiw4bXEBjPK5hVmhdvs=;
 b=UJxezpEoym8QFcIfDxz/PGhqWx0CPYcvi/M78YMCbR0sOu9Wyfx9K1rtLEqMQ+UP7V
 f1Gz20mSSCQGLT7rJNciZN6D8au/+roj/aWpv+0R5gamz/eh3/sr9yOFcnNmPrP7Vb8t
 exQfkqSeZjlXHnvjjxGoYpIKwwnyBuO/xQEUuKNCr/cEnjZVzKw9MIZM9vnVFuWi14u9
 oy8YlnOHnvPqRBFRZS1twLY+nFnWNvOwb2C6EYVD4dX1oJDqqp/FMYGRKT74K9sRENIo
 U7GtzpScJUm73a2Zw29144bRBpxGvQSMJJK8/d0mOWkAlRm/TKWsX/CzZpzZ1mpY6nQU
 UvJQ==
X-Gm-Message-State: AOAM532Egph8qtcYzeE952q+7SSLRnP1lmY+yWRVnoqPDbOJdidqjUvf
 4BDAE/e00bzRCP5fel3r1Eo=
X-Google-Smtp-Source: ABdhPJwSp/wyH4lQcz38xrUXU04T/XN4pdQ4GhZpwGXG5kNPik4rX+dONAHWomhNnageXyCq0hjtLw==
X-Received: by 2002:a17:902:24d:b029:e3:cfa7:e308 with SMTP id
 71-20020a170902024db02900e3cfa7e308mr16438703plc.82.1615896289265; 
 Tue, 16 Mar 2021 05:04:49 -0700 (PDT)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id d5sm2722166pjo.12.2021.03.16.05.04.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Mar 2021 05:04:48 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Subject: [PATCH v4 08/12] hw/net: ne2000: Remove the logic of padding short
 frames in the receive path
Date: Tue, 16 Mar 2021 20:04:16 +0800
Message-Id: <20210316120420.19658-9-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210316120420.19658-1-bmeng.cn@gmail.com>
References: <20210316120420.19658-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that we have implemented unified short frames padding in the
QEMU networking codes, remove the same logic in the NIC codes.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
---

(no changes since v1)

 hw/net/ne2000.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/hw/net/ne2000.c b/hw/net/ne2000.c
index 6c17ee1ae2..b0a120ece6 100644
--- a/hw/net/ne2000.c
+++ b/hw/net/ne2000.c
@@ -167,15 +167,12 @@ static int ne2000_buffer_full(NE2000State *s)
     return 0;
 }
 
-#define MIN_BUF_SIZE 60
-
 ssize_t ne2000_receive(NetClientState *nc, const uint8_t *buf, size_t size_)
 {
     NE2000State *s = qemu_get_nic_opaque(nc);
     size_t size = size_;
     uint8_t *p;
     unsigned int total_len, next, avail, len, index, mcast_idx;
-    uint8_t buf1[60];
     static const uint8_t broadcast_macaddr[6] =
         { 0xff, 0xff, 0xff, 0xff, 0xff, 0xff };
 
@@ -213,15 +210,6 @@ ssize_t ne2000_receive(NetClientState *nc, const uint8_t *buf, size_t size_)
         }
     }
 
-
-    /* if too small buffer, then expand it */
-    if (size < MIN_BUF_SIZE) {
-        memcpy(buf1, buf, size);
-        memset(buf1 + size, 0, MIN_BUF_SIZE - size);
-        buf = buf1;
-        size = MIN_BUF_SIZE;
-    }
-
     index = s->curpag << 8;
     if (index >= NE2000_PMEM_END) {
         index = s->start;
-- 
2.25.1


