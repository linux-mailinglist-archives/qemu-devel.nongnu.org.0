Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE7A53AB059
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 11:52:55 +0200 (CEST)
Received: from localhost ([::1]:45444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltohi-0006On-TB
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 05:52:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ltoNV-0002x7-DY
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 05:32:01 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:46747)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ltoNS-0006H7-QI
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 05:32:01 -0400
Received: by mail-ed1-x534.google.com with SMTP id s15so3015854edt.13
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 02:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=p85ZwP5+cUhD9A/9yct5lXRRYxAcgJOgoRto1Cj2xZA=;
 b=A1DTawweAGq6t/PFv/dFx3APT0MuoWPBaROZTAF+k9C//g/6ntqC+fMk816A7UUaVb
 DqR2i4Qh3ZGlBnxPujHA6b13KxkDY9lxV6jPZgOlNUt2s9uH4pkrEe0Ooi3k08NHT2Zl
 I+kdd2KkCeFkU1seuILee6wrvbt5AoEQDf1XFAwjPJdHlPZbJpQFpJt7n2KJJbA2sAfq
 ag+b6aoaCDy5/ugCja97AkPeMQ0wYWYgF2BLoiaaWJfMjOzCTRA36iuMErBQysoz440H
 g3aYwRV8B0JttNTmZ08kROdVPLN3YCVXwf/5qd7BkKPNTZJD6DcHyj8onMNvl8FR3F+z
 9/Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=p85ZwP5+cUhD9A/9yct5lXRRYxAcgJOgoRto1Cj2xZA=;
 b=DgZ/hiA5o66y82Kv2a9940z0n5B4umqaplDYov62/qDPrqw5BUhRUsYcuJOHWtw4Sh
 e0u7st9JX7Y92Gnr65kCbY84GE+UKRq0VZ5x4xC+6BixNn4QUxjgrrDNFui6dalcsSX5
 6+15FlZxXg+jXSpMrbD3EV4hiEIFeFxJhEb9cZEqHkoNhfJTK8rbCD/IkpStWQsOBqua
 dMhHTePI+hO0xQdeAy/GOSOTHfLNvN2wRpZcXKqKut8ZqZWp/ZDxobKcFaxUnsNxkxO0
 sq8cT2I2zBFd4XnQOt4l7s2Zu8j8qxr3z4sYlnhPlCmHggsmSFaTdMbkhWc7WtlXddXi
 USkg==
X-Gm-Message-State: AOAM532p8F9K+fWeVKAjRqSecugR0ZUrNs5k41YgVrpKXaH/V9YLRtL0
 PYB21ZU+Jmlv9DZMxvd5cniVwVFT1ds=
X-Google-Smtp-Source: ABdhPJxbEqVglmN9Az45fYz+BGrG2FWEIt0S9KHcCq6hS/A1XSmAhC8KQJ/o2awwJqJxsQ6vlyZPOg==
X-Received: by 2002:aa7:db49:: with SMTP id n9mr5131157edt.361.1623922316303; 
 Thu, 17 Jun 2021 02:31:56 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id m18sm3328140ejx.56.2021.06.17.02.31.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 02:31:55 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 28/45] qmp: Clarify memory backend properties returned via
 query-memdev
Date: Thu, 17 Jun 2021 11:31:17 +0200
Message-Id: <20210617093134.900014-29-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210617093134.900014-1-pbonzini@redhat.com>
References: <20210617093134.900014-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x534.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, David Hildenbrand <david@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Hildenbrand <david@redhat.com>

We return information on the currently configured memory backends and
don't configure them, so decribe what the currently set properties
express.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Suggested-by: Markus Armbruster <armbru@redhat.com>
Acked-by: Eduardo Habkost <ehabkost@redhat.com> for memory backend and machine core
Cc: Eric Blake <eblake@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
Message-Id: <20210510114328.21835-12-david@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 qapi/machine.json | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/qapi/machine.json b/qapi/machine.json
index 58a9c86b36..eb14364819 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -790,11 +790,11 @@
 #
 # @size: memory backend size
 #
-# @merge: enables or disables memory merge support
+# @merge: whether memory merge support is enabled
 #
-# @dump: includes memory backend's memory in a core dump or not
+# @dump: whether memory backend's memory is included in a core dump
 #
-# @prealloc: enables or disables memory preallocation
+# @prealloc: whether memory was preallocated
 #
 # @host-nodes: host nodes for its memory policy
 #
-- 
2.31.1



