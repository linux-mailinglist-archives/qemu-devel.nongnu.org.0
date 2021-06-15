Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B3F33A8180
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 15:56:35 +0200 (CEST)
Received: from localhost ([::1]:59634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lt9YQ-0007IT-MF
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 09:56:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lt9Hu-0006D5-As
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 09:39:31 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:33341)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lt9Hq-0002r5-80
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 09:39:29 -0400
Received: by mail-ej1-x631.google.com with SMTP id g20so22743799ejt.0
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 06:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=p85ZwP5+cUhD9A/9yct5lXRRYxAcgJOgoRto1Cj2xZA=;
 b=pmjHxYVSZzLc/tQA7hCxQh+BlT4n6vmLRO0T4mYdrGnUBIU+fK9mcxSHEuc8KMvMjC
 R6Vo/13sqgQbQCcUN5AT/U2dvblZqa8Pbg0Z8CVdr8zhP6eK8mHxcdbweQXiKErNRjhF
 GisvrKru9K2YbKuroevRUGvKWh9XJhxMutofLYtVXq51zmY6uQsZuWLQ1R7m9YLGGLmU
 pBK6PRUQkyhECrFXNmEuT/XsL5Vzk/d2FwTPHz6WJ11wG72kwhk+46eBrA/Tbn169Tn1
 YaSMQ5UTTqs3xMl8+qkZEe1Ztxfr3NIY9/P9WTpyzXg/ArnP8+J/0TNqP9qO6JEYAQVV
 95aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=p85ZwP5+cUhD9A/9yct5lXRRYxAcgJOgoRto1Cj2xZA=;
 b=LzJASJ5leIOT3LtiAC5/qZ2fTMtxbc+pAeIRarIM095dy2dWKjKypgL4lF3T3NEqtL
 DXvr4DNngqigWOAYglYE9/qZLhsYu4e9OH5HZ6w84WzIevi3MSCDUvJd0cf/Bkl98hMr
 KPchfQp8LUXVSgom5tx8YOyDKhwObJh3mfGbRrDRumtca+FW7NjfX9zss98+ZXAXxNKJ
 QJofO8wujzy2oPR3FKJi8jEr6LOyTpMicmn6ik+bzAbaExXsUy2CAMPsG6f47xD4glSO
 XEoRX3JTxtu/H2SSZH23xVXjEG3lYyX6nEU3ZjgbcJefv1ZZ97kefSrabYiO2zoTqS9Z
 MJfQ==
X-Gm-Message-State: AOAM533cDUMxdo4T3/NBZRLYG2z6/4OJlBkFpHnniY7SBsCgF0rv9ipl
 clkI7WzaG7PKKLwyubJ74R7LRgN/TrM=
X-Google-Smtp-Source: ABdhPJyABa6mmbL1YrWwoAOYX5kRzQiXyN1TujD3DplViU/lcqXzZHTUvbNh0QKhqEwoURwuyDQhIQ==
X-Received: by 2002:a17:906:8041:: with SMTP id
 x1mr20374484ejw.81.1623764363250; 
 Tue, 15 Jun 2021 06:39:23 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id r17sm11843769edt.33.2021.06.15.06.39.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 06:39:22 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 28/33] qmp: Clarify memory backend properties returned via
 query-memdev
Date: Tue, 15 Jun 2021 15:38:50 +0200
Message-Id: <20210615133855.775687-29-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210615133855.775687-1-pbonzini@redhat.com>
References: <20210615133855.775687-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x631.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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



