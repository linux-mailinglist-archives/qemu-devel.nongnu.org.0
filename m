Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 109124200B0
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Oct 2021 10:11:15 +0200 (CEST)
Received: from localhost ([::1]:58926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWwaY-0005XO-4n
	for lists+qemu-devel@lfdr.de; Sun, 03 Oct 2021 04:11:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mWw9U-0004EW-8i
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 03:43:16 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:40739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mWw9S-00011k-NK
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 03:43:15 -0400
Received: by mail-ed1-x529.google.com with SMTP id g8so51965798edt.7
 for <qemu-devel@nongnu.org>; Sun, 03 Oct 2021 00:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/ujUSnNBKpCXdL3RYZdQBq1D09EmZbvIdkpR1zAPinc=;
 b=WvxNoc2NLXgV0ihjuxNB9befRhx2GKvz0LEq9rc7R41KJ2TELoYZY+kPf2huWzG9GL
 G0GDCMzyqb6O4NdPzG2v0GnZo9Gukufbt6hwHcsIk/BSQTWNVSwUG9whQbTsZAsqsQDH
 6sM7Zz+l/epRSou/EpJMJZjKvWiPk1XuTAmszHsnC91wuvLvZQqYikuvvhKfUiXM9MgY
 TANW6LJtXaaTbeUCI7DnT6Qe00XGhmGFSO626HiZU0a+tIm1mrLaxz+wugEXlwiJg4pe
 d6VuwxnNVtJywgJOn096vwQTHLZ/694UokoNCtKt1DBHfE1y8rOGHI+spW00Xz4g2vRJ
 g1sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=/ujUSnNBKpCXdL3RYZdQBq1D09EmZbvIdkpR1zAPinc=;
 b=xjeHOqM2rY0KrYpmfwd/XyMyemQNETEjXuhzGluFlM2JXjdsuJ7mX35Fi24SI8hE3u
 qNdZG6JhTL+qTlwB0DdNJvKhn+fNQsT4zBAzlYblCXu7HrLWCSc4VdJX36TpJC0wF9Yj
 GIoe0WcuTUMZ8JrEYBKiUvNv2dcSdYTFsuzcakAs1XnuhnN13iB8QfUSn5VgiIuxO06O
 C2vmm+S0u3onz+hZgv/6UqE8HgT9gZ/OnrYAgRCRV6w6kB4M/Hk+SHrlu+5LIFvjJkx3
 3hAV4crR51Q4XpnFaH/jZSxkRxumQ9hMpKk9NXRiRqqMdZQY661i71mpICfopvDyg57E
 WZhg==
X-Gm-Message-State: AOAM532JZy/WRfnFuONQ1oza5OzzZrLlRN16a+pwhYcW3WflmnJZuXrf
 vWNduaAWapVvzo+odPK2WLBkl0H8Jn4=
X-Google-Smtp-Source: ABdhPJzsXQoNMnXgYxHUtfjUGRrol7SMqJ6bGpsQOGOVfzj/UqNz8wke6jY3xE3LplPmC/0nyMyrLA==
X-Received: by 2002:a17:906:15cf:: with SMTP id
 l15mr9019193ejd.568.1633246993370; 
 Sun, 03 Oct 2021 00:43:13 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id n6sm5560856eds.10.2021.10.03.00.43.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Oct 2021 00:43:13 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 28/30] softmmu/memory_mapping: never merge ranges accross
 memory regions
Date: Sun,  3 Oct 2021 09:42:48 +0200
Message-Id: <20211003074250.60869-29-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211003074250.60869-1-pbonzini@redhat.com>
References: <20211003074250.60869-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x529.google.com
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Hildenbrand <david@redhat.com>

Let's make sure to not merge when different memory regions are involved.
Unlikely, but theoretically possible.

Acked-by: Stefan Berger <stefanb@linux.ibm.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
Cc: Marc-André Lureau <marcandre.lureau@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Eduardo Habkost <ehabkost@redhat.com>
Cc: Alex Williamson <alex.williamson@redhat.com>
Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>
Cc: Claudio Fontana <cfontana@suse.de>
Cc: Thomas Huth <thuth@redhat.com>
Cc: "Alex Bennée" <alex.bennee@linaro.org>
Cc: Peter Xu <peterx@redhat.com>
Cc: Laurent Vivier <lvivier@redhat.com>
Cc: Stefan Berger <stefanb@linux.ibm.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
Message-Id: <20210727082545.17934-3-david@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 softmmu/memory_mapping.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/softmmu/memory_mapping.c b/softmmu/memory_mapping.c
index e7af276546..d401ca7e31 100644
--- a/softmmu/memory_mapping.c
+++ b/softmmu/memory_mapping.c
@@ -229,7 +229,8 @@ static void guest_phys_blocks_region_add(MemoryListener *listener,
 
         /* we want continuity in both guest-physical and host-virtual memory */
         if (predecessor->target_end < target_start ||
-            predecessor->host_addr + predecessor_size != host_addr) {
+            predecessor->host_addr + predecessor_size != host_addr ||
+            predecessor->mr != section->mr) {
             predecessor = NULL;
         }
     }
-- 
2.31.1



