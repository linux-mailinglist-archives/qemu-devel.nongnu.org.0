Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C76154200A3
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Oct 2021 10:03:21 +0200 (CEST)
Received: from localhost ([::1]:43784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWwSu-0003MI-Oe
	for lists+qemu-devel@lfdr.de; Sun, 03 Oct 2021 04:03:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mWw9S-00046N-7j
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 03:43:14 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:44567)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mWw9Q-00010B-L9
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 03:43:13 -0400
Received: by mail-ed1-x532.google.com with SMTP id v18so50892741edc.11
 for <qemu-devel@nongnu.org>; Sun, 03 Oct 2021 00:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=svEcy2fQeXi6q4rkfuuA5NEXM1FDvAAdImtJmYURyR8=;
 b=ihIyc8o4PAX2E4Wv3Alah3VQt/bXnrSlA9jO7yo3ayhfNFN4gmxURiWIgzUahjILbX
 ytVjP03xyKCFQ/dwTsEvxKdVcgLg/NlDFrRrYYHdXa1RGthizCoJ2yqrrrlCg4mgl7Q5
 gnhpmuTbtcS0SHo0ctLDy8c/Ff2oXyxQ1rShy3wGcq6EUsMaRw/Y1yW6+8YJUNd/V6TZ
 gcUouuWDC4gTWIYQhKZEsxRuRaM+EVJR3zOmekVGieJWVjl56BqSRsSrOb+nSAlJ4OZh
 xDIodtQ61Q2ujNJvu32IrdS+LUvUwF4RIVh75OChYhKikZYYkd3vPgRKhdq4qT2M+8t3
 LCLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=svEcy2fQeXi6q4rkfuuA5NEXM1FDvAAdImtJmYURyR8=;
 b=N3GZr/B7ObLrhclJOHYcVlSgbMYW2l+H4DNUXw0DeKShyOeM6XG8YW61loj44IeOEi
 kHrl+rVng7TVyWHb+T39niCKLj0XcfBEhD7mmL1+FOvZmvuR7huip/nJ1HLFsZHqmaxY
 1V9p06JPG3rGHMjQwizWyEecZ6bxqm30A9xhCcNIU6q82JMEKFoYTlcy8MGeCWyU6IsR
 DlnbRbBd9PWSkerEkwM1pfwKTjtIVrdPpNwapNxykosvV/8GMuTIO8/QSGj6BeqKjxcb
 SduyB0lgyiCrcIivA9oAyAL3A98iag9Uk5ed4b0abaY5yVsQATGB8IgVl6ArrVz7Bkay
 81bw==
X-Gm-Message-State: AOAM531dG7lYZiEwjluGRqnqQd0zgNQbW2LMCjHIBb5nhJW5JT87Bj5M
 Zw0dlSQimPUUommYj7jo9dvHa+qqylo=
X-Google-Smtp-Source: ABdhPJwrRZFreOA799SzNtq23mDfDoB1C7IYFL7PfalSUdfOknUyTdQDfdN2ylbkP19vEP/deTaHFw==
X-Received: by 2002:a17:906:848b:: with SMTP id
 m11mr9126096ejx.270.1633246991351; 
 Sun, 03 Oct 2021 00:43:11 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id n6sm5560856eds.10.2021.10.03.00.43.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Oct 2021 00:43:11 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 26/30] monitor: Rate-limit MEMORY_DEVICE_SIZE_CHANGE qapi
 events per device
Date: Sun,  3 Oct 2021 09:42:46 +0200
Message-Id: <20211003074250.60869-27-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211003074250.60869-1-pbonzini@redhat.com>
References: <20211003074250.60869-1-pbonzini@redhat.com>
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
Cc: Markus Armbruster <armbru@redhat.com>, David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Hildenbrand <david@redhat.com>

We want to rate-limit MEMORY_DEVICE_SIZE_CHANGE events per device,
otherwise we can lose some events for devices. We can now use the
qom-path to reliably map an event to a device and make rate-limiting
device-aware.

This was noticed by starting a VM with two virtio-mem devices that each
have a requested size > 0. The Linux guest will initialize both devices
in parallel, resulting in losing MEMORY_DEVICE_SIZE_CHANGE events for
one of the devices.

Fixes: 722a3c783ef4 ("virtio-pci: Send qapi events when the virtio-mem size changes")
Suggested-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
Message-Id: <20210929162445.64060-4-david@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 monitor/monitor.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/monitor/monitor.c b/monitor/monitor.c
index 46a171bca6..21c7a68758 100644
--- a/monitor/monitor.c
+++ b/monitor/monitor.c
@@ -474,6 +474,10 @@ static unsigned int qapi_event_throttle_hash(const void *key)
         hash += g_str_hash(qdict_get_str(evstate->data, "node-name"));
     }
 
+    if (evstate->event == QAPI_EVENT_MEMORY_DEVICE_SIZE_CHANGE) {
+        hash += g_str_hash(qdict_get_str(evstate->data, "qom-path"));
+    }
+
     return hash;
 }
 
@@ -496,6 +500,11 @@ static gboolean qapi_event_throttle_equal(const void *a, const void *b)
                        qdict_get_str(evb->data, "node-name"));
     }
 
+    if (eva->event == QAPI_EVENT_MEMORY_DEVICE_SIZE_CHANGE) {
+        return !strcmp(qdict_get_str(eva->data, "qom-path"),
+                       qdict_get_str(evb->data, "qom-path"));
+    }
+
     return TRUE;
 }
 
-- 
2.31.1



