Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D50966535DF
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 19:09:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p83Q2-0000bK-MM; Wed, 21 Dec 2022 13:02:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p83Pn-0000N4-4E
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 13:02:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p83Pl-0004GP-0O
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 13:02:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671645718;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZCil6Tgw9ufX/VtVVL5nS02IrjTCZZZWdCHHxmZxMPM=;
 b=Eqz5wP5/YOViYndUOZUPOBAwlX3ltSRbCcPjKfK1TKWXrQPQoIXhYOtuNm24IThxdA5Z6H
 wdKv0pOXQxSf4Nq5sbSz8V3hM9MS4/s36kJ7lNsiWpKcgYwRw6SA5MqlVFMnd6XZ5REjje
 WmiYV3JPA7KmKyu2eLF4HBsR/LYNkNE=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-505-4fvH47Y-NJqJj2mgJ2WvfQ-1; Wed, 21 Dec 2022 13:01:51 -0500
X-MC-Unique: 4fvH47Y-NJqJj2mgJ2WvfQ-1
Received: by mail-ej1-f69.google.com with SMTP id
 hd17-20020a170907969100b007c117851c81so11125046ejc.10
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 10:01:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZCil6Tgw9ufX/VtVVL5nS02IrjTCZZZWdCHHxmZxMPM=;
 b=grFkOb7E3v6rlQrCq4LxMCuvlYb9wMriuzygXH0azK9+/dsHHeatODGsm396xH9cKo
 5R004spnFcxOBye0FXHdKlbOIDJfUS3C1ScDj1LresHpBJ3An4XQY8zEIJP0JBBbUv/D
 owsA9HveFbO7SA6C3UnjesX38XY8cldazkeSq6YcPqaClhSbfJBdzu1BKUWp67ay59WH
 5mcfpIDrt8TPbbyIuHjuqqD1I+sraSeNeNHUONeeErM/Et8Htww8uwbETrQdFEH4+K7U
 pDlRf2AhqoWIXaxquVwIjJLAb2fiEIdw0onec9fVyl4qlSdnU5PHA+lJsMVSxhuLh0fq
 xYRQ==
X-Gm-Message-State: AFqh2koQyHr2hRSkrvkSlI9GHZ4ev7CgTsZ82V/WGQVRpWB/ZfS1O8FH
 /TNZj8wDr01SuVuETEd/fQ89cZmbPhHLy8C5TpnAtpfL88n28PmsQJyvBr5QqSAEg7JDCMOWaNb
 4Rlx5C/GRUQEMRj0fFtSS1HWvj3+E8ERy9K/Digh5BDGT5KvwPj3gNAHGsaUQFt0GRoM=
X-Received: by 2002:a17:907:c712:b0:7bd:6372:fdb4 with SMTP id
 ty18-20020a170907c71200b007bd6372fdb4mr2801577ejc.41.1671645710027; 
 Wed, 21 Dec 2022 10:01:50 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvjn+dymry1HqlaRzj+Z47i0CNt5GNoT0o25w7f5cS4zNMB+WMGkFI/hyVejFUWEHxwGxs/2A==
X-Received: by 2002:a17:907:c712:b0:7bd:6372:fdb4 with SMTP id
 ty18-20020a170907c71200b007bd6372fdb4mr2801540ejc.41.1671645709762; 
 Wed, 21 Dec 2022 10:01:49 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 c2-20020a17090618a200b008318e6d09easm3337576ejf.103.2022.12.21.10.01.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Dec 2022 10:01:49 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Fabiano Rosas <farosas@suse.de>
Subject: [PULL 02/24] hw: Reduce "qemu/accel.h" inclusion
Date: Wed, 21 Dec 2022 19:01:19 +0100
Message-Id: <20221221180141.839616-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221221180141.839616-1-pbonzini@redhat.com>
References: <20221221180141.839616-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PP_MIME_FAKE_ASCII_TEXT=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

From: Philippe Mathieu-Daudé <philmd@linaro.org>

Move "qemu/accel.h" include from the heavily included
"hw/boards.h" to hw/core/machine.c, the single file using
the AccelState definition.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Fabiano Rosas <farosas@suse.de>
Message-Id: <20221130135641.85328-3-philmd@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/core/machine.c   | 1 +
 include/hw/boards.h | 1 -
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index 644b34cd24d0..3e51a5d8eb2c 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -12,6 +12,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu/option.h"
+#include "qemu/accel.h"
 #include "qapi/qmp/qerror.h"
 #include "sysemu/replay.h"
 #include "qemu/units.h"
diff --git a/include/hw/boards.h b/include/hw/boards.h
index 90f1dd3aeb79..f00f74c5f40e 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -6,7 +6,6 @@
 #include "exec/memory.h"
 #include "sysemu/hostmem.h"
 #include "sysemu/blockdev.h"
-#include "qemu/accel.h"
 #include "qapi/qapi-types-machine.h"
 #include "qemu/module.h"
 #include "qom/object.h"
-- 
2.38.1


