Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1113670B52
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 23:10:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHu9D-0008WR-GZ; Tue, 17 Jan 2023 17:09:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pHu95-0008Sf-2D
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 17:09:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pHu90-0007X8-Dh
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 17:09:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673993364;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nOS3CKEGPjANiM7I6HWXSEnAfE8Rh5Z/OAp17l2f8LQ=;
 b=U652nYRDeCvvefdpMLgugcXik88TigkO1GBylOw3L6/jmsGTzgKke2BlBPqdfl8Du75gk9
 Vd46c1V+ar5L0ATl5kccPtTKX2jYFT7il5hInVsq0gjW0wWkCxPty1Pm/sCAP6KFQNf7QR
 Q/MTZyTvIrmNYGm5tArfADi3a68n1pY=
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-509-OLqE4R94Pb6WvyGJo-8ErA-1; Tue, 17 Jan 2023 17:09:22 -0500
X-MC-Unique: OLqE4R94Pb6WvyGJo-8ErA-1
Received: by mail-vk1-f198.google.com with SMTP id
 d130-20020a1f9b88000000b003b87d0db0d9so9626334vke.15
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 14:09:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nOS3CKEGPjANiM7I6HWXSEnAfE8Rh5Z/OAp17l2f8LQ=;
 b=xlGZHz1TTeiQcAVJmQlVYWZYcf4NjwONbo+kPKN+DIF+c3/Ow0j+82wIryWmU5tQ7d
 SaMqUQm8dgHKsULAGm8vHYMz5HixEUlPA3qTjiUvZLkvB3UDNKMTfMih7mAu1wXb6SIK
 niLfVlC8sgrupcxNjxied19eJszfT/ZLqMo8NFLS/V3m3wO6D70GbQyODHfzwncFcBSA
 LWt/TYk3KkdMHh6/fI7R5GuDErgpui5HxKj2jTbq2sSImeW+TBfnPW4yjURlCEIq71GO
 Ak0TuWNRg6s4nShloCjOAz9w3HdalX4cmHt7wuNiqQLQ7G9L8ILhBvZcUwAj/KpUiWhu
 j2Ng==
X-Gm-Message-State: AFqh2koeNcWFuqoPfv/49K/qzXnJgzHmUWGBK6HWPYJG9wVjLwd6rN3/
 U9WcWt3aUJ9jV2UKn1bkGd7MQZ7zhq9Sbgm+DrER5JlSWkdg9cWlTAxaOi8tkVipfQ/MfJXwH2q
 7q0VYvb6Q2v0JUyfPl1uXO+9GUzqfuxSl6KoUvoAHCoPq2WOjrGBHefnQMmAGItAv
X-Received: by 2002:ac5:cd4e:0:b0:3bc:8a9a:2c70 with SMTP id
 n14-20020ac5cd4e000000b003bc8a9a2c70mr2904834vkm.1.1673993360893; 
 Tue, 17 Jan 2023 14:09:20 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvuXP1Ct3TMZdoYa/9m8Ky+NfDR+SbWufrlptlsK0CVyWkSL9vtSyQN9BJ8EfXrqSHBPBHL5g==
X-Received: by 2002:ac5:cd4e:0:b0:3bc:8a9a:2c70 with SMTP id
 n14-20020ac5cd4e000000b003bc8a9a2c70mr2904806vkm.1.1673993360591; 
 Tue, 17 Jan 2023 14:09:20 -0800 (PST)
Received: from x1n.redhat.com
 (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca. [70.30.145.63])
 by smtp.gmail.com with ESMTPSA id
 bm16-20020a05620a199000b006e16dcf99c8sm21142978qkb.71.2023.01.17.14.09.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 14:09:19 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 James Houghton <jthoughton@google.com>,
 Juan Quintela <quintela@redhat.com>, peterx@redhat.com,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Subject: [PATCH RFC 02/21] util: Include osdep.h first in util/mmap-alloc.c
Date: Tue, 17 Jan 2023 17:08:55 -0500
Message-Id: <20230117220914.2062125-3-peterx@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20230117220914.2062125-1-peterx@redhat.com>
References: <20230117220914.2062125-1-peterx@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Without it, we never have CONFIG_LINUX defined even if on linux, so
linux/mman.h is never really included.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 util/mmap-alloc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/util/mmap-alloc.c b/util/mmap-alloc.c
index 5ed7d29183..040599b0e3 100644
--- a/util/mmap-alloc.c
+++ b/util/mmap-alloc.c
@@ -9,6 +9,7 @@
  * This work is licensed under the terms of the GNU GPL, version 2 or
  * later.  See the COPYING file in the top-level directory.
  */
+#include "qemu/osdep.h"
 
 #ifdef CONFIG_LINUX
 #include <linux/mman.h>
@@ -17,7 +18,6 @@
 #define MAP_SHARED_VALIDATE   0x0
 #endif /* CONFIG_LINUX */
 
-#include "qemu/osdep.h"
 #include "qemu/mmap-alloc.h"
 #include "qemu/host-utils.h"
 #include "qemu/cutils.h"
-- 
2.37.3


