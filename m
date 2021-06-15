Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 352873A819C
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 15:59:57 +0200 (CEST)
Received: from localhost ([::1]:44152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lt9bg-0007Ky-4y
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 09:59:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lt9Hv-0006D9-Iv
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 09:39:31 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:45869)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lt9Hs-0002st-4N
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 09:39:30 -0400
Received: by mail-ej1-x62c.google.com with SMTP id k7so22630441ejv.12
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 06:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Us6ggabPs2Iu/tknvpN9PEYNzI6F+zr6OhgzB6XQ6h8=;
 b=O1uqAMFpZ2/XiGZNbHV3UMLT6bTeuSVdsjB4d5pvg8HuXg4WdNT/qojuPo8mjghq/7
 izRbTbnvYDL4z5ySCsK9dsl9WuBciYOSCIN+unaoZPcojji6AIQYb0uWmLDJVj67s3+5
 PuYIQWN4Vn2XgN8Eshui+r0cqO3kyzZtPbonaGsJZtrwJnCYJYpTxUoph1l+JRERfXIq
 +O5dV1InQaD15S3fvBEt9VwjtWGgqwm/WSuRNhSc2lvWIJXylK28THDvEkFKFtUuJOxk
 fQKugoSlIQCm6CYq/R+pL7LDlmxP5sfYC7+9Q0lF+zTu2GLNjt/ruzZ1kWM5koo1HP9A
 XTew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Us6ggabPs2Iu/tknvpN9PEYNzI6F+zr6OhgzB6XQ6h8=;
 b=dKNgla6X8tTW1ymd4EuUYtmyXrhNmPutLx8NYNi6GsU0lX6MRsITKBJPeF4iVxPGK0
 CEf8HM85va7QlrMQjqTmuFjcBpsks7j2yOU3JS53R8HGJa6idmmXm3SeHo1tjIu1mXbB
 5xdswxpVusC9yUCyAmAJgfYG78mAIlvWWV/rD975Z+ety+2FnNz77WHupEZj3LqL+H+X
 8Z96tMIfyNLJG2X6v05Z8kHhJ+6iIwLe5LwoiRtm84Py0vtPABCjQX4XDV4dDUR1Ca6e
 w97PsgbK3neD/iFTwJxTBr3SaRzVuYhiV5zFBATOtm5kZWunheAG4KxGTYMRKQ8VRmz8
 Q0QA==
X-Gm-Message-State: AOAM530xqEy40ymJHYbSYZvyTCC4xTtT68yAnRCAzM3B7T0XGrxuMBqv
 4M0XLCOPGUeKqaMyo2OeLxgEE9Walkw=
X-Google-Smtp-Source: ABdhPJxmaaeCerAxi8ELxNKEcOIYlMoiMtTRAFU1g+wC/hVYIfvBeO4JveVZnOUcbyv+JL4M700Y6g==
X-Received: by 2002:a17:906:26db:: with SMTP id
 u27mr21030296ejc.532.1623764366613; 
 Tue, 15 Jun 2021 06:39:26 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id r17sm11843769edt.33.2021.06.15.06.39.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 06:39:26 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 32/33] hmp: Print "reserve" property of memory backends with
 "info memdev"
Date: Tue, 15 Jun 2021 15:38:54 +0200
Message-Id: <20210615133855.775687-33-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210615133855.775687-1-pbonzini@redhat.com>
References: <20210615133855.775687-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62c.google.com
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Hildenbrand <david@redhat.com>

Let's print the new property.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Acked-by: Eduardo Habkost <ehabkost@redhat.com> for memory backend and machine core
Cc: Markus Armbruster <armbru@redhat.com>
Cc: Eric Blake <eblake@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
Message-Id: <20210510114328.21835-16-david@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/core/machine-hmp-cmds.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/core/machine-hmp-cmds.c b/hw/core/machine-hmp-cmds.c
index 004a92b3d6..76b22b00d6 100644
--- a/hw/core/machine-hmp-cmds.c
+++ b/hw/core/machine-hmp-cmds.c
@@ -112,6 +112,10 @@ void hmp_info_memdev(Monitor *mon, const QDict *qdict)
                        m->value->prealloc ? "true" : "false");
         monitor_printf(mon, "  share: %s\n",
                        m->value->share ? "true" : "false");
+        if (m->value->has_reserve) {
+            monitor_printf(mon, "  reserve: %s\n",
+                           m->value->reserve ? "true" : "false");
+        }
         monitor_printf(mon, "  policy: %s\n",
                        HostMemPolicy_str(m->value->policy));
         visit_complete(v, &str);
-- 
2.31.1



