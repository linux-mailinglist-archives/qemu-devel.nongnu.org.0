Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D02D3AB05B
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 11:53:33 +0200 (CEST)
Received: from localhost ([::1]:47472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltoiK-0007jw-K3
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 05:53:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ltoNW-0002xw-1p
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 05:32:02 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:43673)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ltoNT-0006IC-DZ
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 05:32:01 -0400
Received: by mail-ej1-x630.google.com with SMTP id nb6so8666206ejc.10
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 02:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+EFladb3eqe0vt+VFB7TILa1exqZV921bqMeigXL0sY=;
 b=QAc99yJDdTfSI8gRcaBYAjM9QSt9La9SjTvwjU5W/AvCRPWunV5Q1L08hfsN5C+1SW
 Y9pZpxj6XSmxUQI8pz1e7yOc2SNCG+aafbqYqBGvyAUavBA9Bh7e5wT7tHMs6ghfDxWd
 aveUi5tXT1oTPrKYUd7Pd97KXA2YEjtmyjIs4oE8eg26StatO15eIVygh6rU6B+iKoQc
 9/yBSJwkkcn/ifnndacOWonjjj/4Oa3MR2yWAPQkVGGGlLzofWLTEllDeXw6NxxhkTcW
 EKpB7TvgMHvrxlGZ3rj7AvUyKBx0rEIo+tJAziJIt40kM2vttnoR3SqeP8PhFUiXGhJD
 d5wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=+EFladb3eqe0vt+VFB7TILa1exqZV921bqMeigXL0sY=;
 b=QnzovNac9fStRfCzH9wwfKhNma4pzMtqXPy7TQcSYMZSeALY/SbS+/OkdhS05TqHVf
 ZMDAZ194vrmpSWFDmFMAYT/oRVcPHewTmhxURj/ZnuRjay7HT7ZxL9OtKkJX7VZ4u4+A
 U7R37L1wUJgfipXzjDCMCoIUAx0lboWvFB2nrLzWfrJKrZ9rjCbT43w5+SdNBFhxT3cS
 dQl/T2pKqcALS5N5WVqtYHcLYTg+zk0yuygff4g94sreqxRyJqGh6sfWgR7A3LjeVA6E
 N7g2DRN3ptwbXpK04DkZKnrJOhB/8MuWKxBXuA1RlGacYJjv3r2uH8vGCcfuFupS+sEl
 Pn7Q==
X-Gm-Message-State: AOAM533lpi36e8b1k5Vh5JX8CUoeK5n7Z+MP96p5dUOPN47BBtvOX2kF
 M7Lc3+CjYusUUeTLI0Ow6eVkAKGuMYQ=
X-Google-Smtp-Source: ABdhPJyHlLAQkIwRnQwfyLhl+PrZc6ZePkeSh3pkhPSLy/H6BofESCZ6c45rfTWdRpA9pq464PFbow==
X-Received: by 2002:a17:907:1c13:: with SMTP id
 nc19mr4331932ejc.168.1623922317880; 
 Thu, 17 Jun 2021 02:31:57 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id m18sm3328140ejx.56.2021.06.17.02.31.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 02:31:57 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 30/45] hmp: Print "share" property of memory backends with
 "info memdev"
Date: Thu, 17 Jun 2021 11:31:19 +0200
Message-Id: <20210617093134.900014-31-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210617093134.900014-1-pbonzini@redhat.com>
References: <20210617093134.900014-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x630.google.com
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

Let's print the property.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Acked-by: Eduardo Habkost <ehabkost@redhat.com> for memory backend and machine core
Cc: Markus Armbruster <armbru@redhat.com>
Cc: Eric Blake <eblake@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
Message-Id: <20210510114328.21835-14-david@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/core/machine-hmp-cmds.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/core/machine-hmp-cmds.c b/hw/core/machine-hmp-cmds.c
index 58248cffa3..004a92b3d6 100644
--- a/hw/core/machine-hmp-cmds.c
+++ b/hw/core/machine-hmp-cmds.c
@@ -110,6 +110,8 @@ void hmp_info_memdev(Monitor *mon, const QDict *qdict)
                        m->value->dump ? "true" : "false");
         monitor_printf(mon, "  prealloc: %s\n",
                        m->value->prealloc ? "true" : "false");
+        monitor_printf(mon, "  share: %s\n",
+                       m->value->share ? "true" : "false");
         monitor_printf(mon, "  policy: %s\n",
                        HostMemPolicy_str(m->value->policy));
         visit_complete(v, &str);
-- 
2.31.1



