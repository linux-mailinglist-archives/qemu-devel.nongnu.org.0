Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 715613AB022
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 11:48:46 +0200 (CEST)
Received: from localhost ([::1]:60794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltodh-0005sy-H5
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 05:48:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ltoNa-0003AO-R3
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 05:32:07 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:36836)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ltoNV-0006KR-4V
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 05:32:06 -0400
Received: by mail-ej1-x634.google.com with SMTP id nd37so8770463ejc.3
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 02:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Us6ggabPs2Iu/tknvpN9PEYNzI6F+zr6OhgzB6XQ6h8=;
 b=nfdpN6o/siNbFJvX+C6aXLhNZJM1XMRDqjzQnFh1rCLzOqfxSTasr6WhBrZp2pn/eB
 PvO7LBTP7di2I0lN4FVJ7gDyNqjEnfW/5xdEhhC+I7IO9coA7q6WrVcxeDLoXFLrj2TD
 rvsVCXAPpAwM9dP7w/vWbh1wIbaUA5owNMyKuNfRtCZAwlGGH1Dr72FH0NFMHzGyeN8v
 vMSEl7ogIn2fI7a7gjc8g/s5JwG19PldrRxu0WRVM6YvF5GZ6lA0q5Wszq3uyCoYBXjT
 f1w2kv9/EJaa1Ork8DOvtgXll0vzpoDWzUhqQ9jVjRR1g7dCgAY4PWMfNuq730ZQPIra
 M1gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Us6ggabPs2Iu/tknvpN9PEYNzI6F+zr6OhgzB6XQ6h8=;
 b=rJmnte0IIUrdSTtQ/7/nIJDzxGKfGw17IJQCVrAQnYws08mGjTuiynyzX4smDiuBHp
 kLx0ZWQ8+C/MfTkq7eDXKnthCQAiNYn3jeegDWuf56NyKUsaMHb4RSdPqkfhE9rp0TzK
 VEbsg1DKhKimANdYpAIocLiBivndAWyzJOhzXaSPyFbrsF82fqhWsPJ4Vm+mfhmVubVo
 2OYyTg8EVXf07+X7hR3RAXaPB5D+VYEw1Ih30HzA0vq1th0UujOAr60r5OXeY6NBwGSv
 ThToar0sO3d8CeRuxF5s2eThxmYK17BMxlwRBwsxsAWzzGL57mLO0jI8xm3ZhoYPg7qg
 85kw==
X-Gm-Message-State: AOAM530LC8NlUw1KNer3udFQrj4lwq5A41PHyvdxkDcW3rC2kEawXi+U
 tgcXzfMnSEjxW1SEmQNhPFgedHVTDww=
X-Google-Smtp-Source: ABdhPJyCdHT3qVHQK8DW0x3aBNAcck9vCyfn8nTZ7SwBypVat8z7VSo5dpDiYhADqD5AkQW2gC9tig==
X-Received: by 2002:a17:907:2636:: with SMTP id
 aq22mr4307111ejc.48.1623922319654; 
 Thu, 17 Jun 2021 02:31:59 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id m18sm3328140ejx.56.2021.06.17.02.31.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 02:31:59 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 32/45] hmp: Print "reserve" property of memory backends with
 "info memdev"
Date: Thu, 17 Jun 2021 11:31:21 +0200
Message-Id: <20210617093134.900014-33-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210617093134.900014-1-pbonzini@redhat.com>
References: <20210617093134.900014-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x634.google.com
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



