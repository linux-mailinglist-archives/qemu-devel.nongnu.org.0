Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F09B2A6D68
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Nov 2020 20:03:48 +0100 (CET)
Received: from localhost ([::1]:41616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kaO4R-0000ps-L0
	for lists+qemu-devel@lfdr.de; Wed, 04 Nov 2020 14:03:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kaNmW-0006Oi-8v
 for qemu-devel@nongnu.org; Wed, 04 Nov 2020 13:45:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47405)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kaNmU-0002Lk-Fb
 for qemu-devel@nongnu.org; Wed, 04 Nov 2020 13:45:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604515513;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kxx7KBtrm7vYLNNi8ILRStjcIKIqdM/KqZjCc2FDurE=;
 b=TdqkMUuwHa3BSofhcpwNkMHW+2L3g84agcwxrfxRK9OaqqHPtedilpKxOf3fujiWEn2xp/
 25AKQ5B6zU3NVxOn1FZH7M6ZjPAlUaVX7AhBZnI1kIUis4GmEl2VR2zfDlFjuhOQDZS1RV
 Gt9FQXx4P1gSucvNVfSsl3sIZx5xK6g=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-256-e6qEdUAWNMelND6yoi6pnQ-1; Wed, 04 Nov 2020 13:41:49 -0500
X-MC-Unique: e6qEdUAWNMelND6yoi6pnQ-1
Received: by mail-wr1-f70.google.com with SMTP id w3so7464224wrt.11
 for <qemu-devel@nongnu.org>; Wed, 04 Nov 2020 10:41:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=kxx7KBtrm7vYLNNi8ILRStjcIKIqdM/KqZjCc2FDurE=;
 b=TvnFwjqRG2X0szWqq3I0tX1lZfeEwzVHb73RRWfzMxTsVlsNO457P4oVzixEUi79DJ
 v1nQkGkQeIne7pqPCTDWKWFVz9JPBgFaUw70FOYESyzBjAaAQ8ymbOQ2I3ULwqY3gSuP
 wbh1UFE2CbeSs9jz8LIXLC1wW3XdwPodjm3wH5mmxWO1wtRgotO0atcdstta9h9cJ1ha
 KDVWZFDG5qBwDoP153imaPOctXyIB4LSaXJfGH+0WjBoG07VoDgBJHAtQtSl1bboxKUJ
 XlE8KUx3e0B0449cKchzqWD9b4e5U4tC7D78OViITq6E4vorB2ojFEdiqTnPMhuEuW7m
 ZVew==
X-Gm-Message-State: AOAM530jEr9CnnG/dtU1zp12nR4pnGnFOvkbL1RRCygY3RZ+x9TD3zzg
 z5jTjbZ4gBAeUvd9pwlxdFNbYFY6+Ic9nMKc7sqDdudUARHBoPkgfG+AI7RkFL0ACyIldR7l/d7
 I/u2zVxlcEqY7Kxg=
X-Received: by 2002:a5d:4a4b:: with SMTP id v11mr4991421wrs.364.1604515308323; 
 Wed, 04 Nov 2020 10:41:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzfwnDOViGTq5wQ3OuZ0qzf8RSJNybaKD314ntar/NDYKJx3NbK1KJRPQZKq/HvZaRGWJAgEA==
X-Received: by 2002:a5d:4a4b:: with SMTP id v11mr4991398wrs.364.1604515308126; 
 Wed, 04 Nov 2020 10:41:48 -0800 (PST)
Received: from redhat.com (bzq-79-176-118-93.red.bezeqint.net. [79.176.118.93])
 by smtp.gmail.com with ESMTPSA id e25sm4060413wrc.76.2020.11.04.10.41.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2020 10:41:47 -0800 (PST)
Date: Wed, 4 Nov 2020 13:41:45 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v3 10/31] hw/acpi : add spaces around operator
Message-ID: <20201104184040.285057-11-mst@redhat.com>
References: <20201104184040.285057-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201104184040.285057-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/03 00:03:41
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Kai Deng <dengkai1@huawei.com>,
 Xinhao Zhang <zhangxinhao1@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Xinhao Zhang <zhangxinhao1@huawei.com>

Fix code style. Operator needs spaces both sides.

Signed-off-by: Xinhao Zhang <zhangxinhao1@huawei.com>
Signed-off-by: Kai Deng <dengkai1@huawei.com>
Message-Id: <20201103102634.273021-3-zhangxinhao1@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/acpi/pcihp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
index 32ae8b2c0a..17c32e0ffd 100644
--- a/hw/acpi/pcihp.c
+++ b/hw/acpi/pcihp.c
@@ -400,7 +400,7 @@ void acpi_pcihp_init(Object *owner, AcpiPciHpState *s, PCIBus *root_bus,
     s->io_len = ACPI_PCIHP_SIZE;
     s->io_base = ACPI_PCIHP_ADDR;
 
-    s->root= root_bus;
+    s->root = root_bus;
     s->legacy_piix = !bridges_enabled;
 
     memory_region_init_io(&s->io, owner, &acpi_pcihp_io_ops, s,
-- 
MST


