Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72DE231BA53
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 14:28:24 +0100 (CET)
Received: from localhost ([::1]:42384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBdvL-00064L-Gi
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 08:28:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lBdk0-0005ec-Qs; Mon, 15 Feb 2021 08:16:40 -0500
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:41546)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lBdjz-0005Xw-F8; Mon, 15 Feb 2021 08:16:40 -0500
Received: by mail-ed1-x529.google.com with SMTP id v9so3592696edw.8;
 Mon, 15 Feb 2021 05:16:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FDZgxt19cep10sPenqmyiZgIQfpc+2ftCbZKz0i31KU=;
 b=OTG7zej3/E7m9SvlCi4yuWLr338QxHuAsMKXLcT2bfcUKlamoo8wE0Ki3u0JoFUVY1
 Vxvb1leoRzJ+xcJC7FvvAPRCg0fbrkraruookznB8oYhTBCJ/G+85RyF0pMnh4GSWR68
 A3DJweM+EYCQew2mJKkV8TJKsHxh05XyoXCKQ4+ypTKCEyVsMMnumWUbaBokDV6aOQn9
 RwwUZcNK/H+j3fQ69+EApBUYd13cQS7SRWR50bsLLZRsIPPmrOblG6X9eS1DxvnI3Hui
 HXcZYqTADa5nXB/L1XfYIQ1z/sJMTJYWRW2N/YK5XbgAqZaZIWxgqLJVsEjCoh6eYbLu
 ZeUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=FDZgxt19cep10sPenqmyiZgIQfpc+2ftCbZKz0i31KU=;
 b=Z4E+l/WdCgRA0/N5NrEeuZ/aoeMmaAhpTjYYdEK1HjF0WM2qzERFpOcfay1vZ2M+I0
 LZTAX+ZmPjJFy6A/AcWVGli+jBU/VZIMb8t1z4kAHb4JmjpEdkmCJ8RQb3gEoO0cuva6
 lPGn9UBz4NxEZwtDNh1c7ywXMh46EQVYlC1Rvg+2ByaCzVEwU+qoMxAtHMujyKt2rczZ
 qTIJEbnax7ljnwhZ48U4INwEojTT5caZF935YJoMOuybOIO5jKklQ7WvDejXlFNwXAk1
 ySkQv+9hoJFmI+FHoTzeJZ6YbfMNZP+/sDUkYtef1Hn08AIlzkeBOhPtT1fC/ZXBe+u4
 Pe1Q==
X-Gm-Message-State: AOAM5317BVngQPoCZpTVG+rwOXb8XgMfnkIG7Cc/xL71fBnHHWkUBJ6E
 eF0WT2PXa1uZVSyJqapIK1LA6zOCeWs=
X-Google-Smtp-Source: ABdhPJyPDj0sJJB4qDHZ42WxY1E1qiLmaFp7TgyAo6e30NJxszJjwWb/FRMsISiJ2wgPRYXnHMjOwg==
X-Received: by 2002:a05:6402:3514:: with SMTP id
 b20mr15205642edd.100.1613394997734; 
 Mon, 15 Feb 2021 05:16:37 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id o4sm9950184edw.78.2021.02.15.05.16.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Feb 2021 05:16:37 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 14/19] util/cutils: Skip "." when looking for next directory
 component
Date: Mon, 15 Feb 2021 14:16:21 +0100
Message-Id: <20210215131626.65640-15-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210215131626.65640-1-pbonzini@redhat.com>
References: <20210215131626.65640-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x529.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Stefan Weil <sw@weilnetz.de>, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefan Weil <sw@weilnetz.de>

When looking for the next directory component, a "." component is now skipped.

This fixes the path(s) used for firmware lookup for the prefix == bindir case
which is standard for QEMU on Windows and where the internally
used bindir value ends with "/.".

Signed-off-by: Stefan Weil <sw@weilnetz.de>
Message-Id: <20210208205752.2488774-1-sw@weilnetz.de>
Cc: qemu-stable@nongnu.org
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 util/cutils.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/util/cutils.c b/util/cutils.c
index 0b5073b330..70c7d6efbd 100644
--- a/util/cutils.c
+++ b/util/cutils.c
@@ -916,7 +916,8 @@ static inline bool starts_with_prefix(const char *dir)
 static inline const char *next_component(const char *dir, int *p_len)
 {
     int len;
-    while (*dir && G_IS_DIR_SEPARATOR(*dir)) {
+    while ((*dir && G_IS_DIR_SEPARATOR(*dir)) ||
+           (*dir == '.' && (G_IS_DIR_SEPARATOR(dir[1]) || dir[1] == '\0'))) {
         dir++;
     }
     len = 0;
-- 
2.29.2



