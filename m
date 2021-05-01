Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A07653706AB
	for <lists+qemu-devel@lfdr.de>; Sat,  1 May 2021 11:37:51 +0200 (CEST)
Received: from localhost ([::1]:39254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcm4M-0007q7-L8
	for lists+qemu-devel@lfdr.de; Sat, 01 May 2021 05:37:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lclxK-0000V4-VE
 for qemu-devel@nongnu.org; Sat, 01 May 2021 05:30:35 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:33516)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lclxH-0005UR-9Y
 for qemu-devel@nongnu.org; Sat, 01 May 2021 05:30:32 -0400
Received: by mail-ed1-x532.google.com with SMTP id g10so861346edb.0
 for <qemu-devel@nongnu.org>; Sat, 01 May 2021 02:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=W0byWahx5yMOctAwKUijW0hvjeAo428m5s8AS5DrbDY=;
 b=jVmkUbIPSDAd/auZkVC2xOS8CnXwMHQWCcH5odGEoZnBvuWYdAGTR666GxibgDrk0A
 nt0p+Z+WwByaNW/SNWzW1b3ACH8Ba2JLJfLIkHtx+Hcmou5hF+MzrqEXT732XAl5Kx+b
 X7i/IbRLjYjBBgIRWm8nhwozPqQ6JHoXNlVfa49WlJV6YOSUu1J2Lpgw7a2w0LsB6WLO
 poHfe1afMaOHmVgvkNIRwZDzHgb/WR8OnNqFZX2g39oqEpHp4POEzXuNlsyBvA4YG88v
 Zcesy2SYob9zitpbWA5zOl3UV2csvkLf5c1720jAgAUIceyEqR5z317qpURodnOAL3+X
 dcRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=W0byWahx5yMOctAwKUijW0hvjeAo428m5s8AS5DrbDY=;
 b=OonqBEeEkqX7YtTnzHvSxXNu5xWIRjN6tyzz9v/Hybu0tJwlwHCZZZDp9kluUzMzNt
 EMmj9igC/4y0G0NgybrH3Ha9rN4Prnblc3cgg1BuKGzVONfchPpwtigoTGbhLjZFHzSp
 phcGDHZHkFdeAIJFzvaPOHAPMd/ejK2HfyXxo/dXIN3aNGhOmr0QjlQJR8YhOcIHwXHv
 BvOQGApunQiHJwoQLH0KGL+4etx8GtLkl0mcDHSa29iEUGT6lxx0hFFONfcGnt1jNkAI
 XcxM6cPE7UNl1vDqKaYZItjGuq8F6Owd9DFldZQSdEo+/tdTzDczmK3rQ6jlhPs+9Bno
 cdSw==
X-Gm-Message-State: AOAM532ZGiK+j3mxsJPW5hUv69nKrXXpFhpt9cSH+q6cGqt2A4jjGOl+
 SHrSL+dwFuk7nkzHmEtKBSUBvzlXhfo=
X-Google-Smtp-Source: ABdhPJxhD3JIUFQrBtu1M3ZGVZXVkWNNfOHPEJmSfEjqLO8s2XI4oodnO6kYRNOEILQEDvBMzjvttQ==
X-Received: by 2002:a50:cdd1:: with SMTP id h17mr10484518edj.178.1619861429994; 
 Sat, 01 May 2021 02:30:29 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id ga33sm4632721ejc.11.2021.05.01.02.30.29
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 May 2021 02:30:29 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 01/10] oslib-win32: do not rely on macro to get redefined
 function name
Date: Sat,  1 May 2021 11:30:17 +0200
Message-Id: <20210501093026.189429-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210501093026.189429-1-pbonzini@redhat.com>
References: <20210501093026.189429-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x532.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Windows with glib <2.50, g_poll is redefined to use the variant
defined in util/oslib-win32.c.  Use the same name in the declaration
and definition for ease of grepping.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 util/oslib-win32.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/util/oslib-win32.c b/util/oslib-win32.c
index f68b8012bb..13418f68c0 100644
--- a/util/oslib-win32.c
+++ b/util/oslib-win32.c
@@ -472,7 +472,7 @@ static int poll_rest(gboolean poll_msgs, HANDLE *handles, gint nhandles,
     return 0;
 }
 
-gint g_poll(GPollFD *fds, guint nfds, gint timeout)
+gint g_poll_fixed(GPollFD *fds, guint nfds, gint timeout)
 {
     HANDLE handles[MAXIMUM_WAIT_OBJECTS];
     gboolean poll_msgs = FALSE;
-- 
2.31.1



