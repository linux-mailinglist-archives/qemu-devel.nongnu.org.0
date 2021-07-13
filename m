Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 683623C6871
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 04:17:24 +0200 (CEST)
Received: from localhost ([::1]:34462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m37z9-000173-Gj
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 22:17:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jandryuk@gmail.com>)
 id 1m37xq-00008T-Ik
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 22:16:02 -0400
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735]:36527)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jandryuk@gmail.com>)
 id 1m37xo-00084f-W6
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 22:16:02 -0400
Received: by mail-qk1-x735.google.com with SMTP id t185so790391qkd.3
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 19:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wdFnm7RRtRSFE80bwUaEsdN3yV2SV0vP3Z2kzFYnnlc=;
 b=KLvkyE6NIO+HnpW500TF1rsk7wL1s1nRmBBwARovCS6WsK/Pw7sUPDlVNr02S9m2OM
 boL6JgcMW9ffHlkUZEKbzWa5LdW3q45N35Bbltm8t7zZrE8N0tmd+NXugEhkCT3O14ZI
 zw5+ZugrmKpWbuh9ssrdLBKsWjis3lsLp95wu3ndVBDF2DrY81FYdiyvmp/HaLn00f9Z
 s4NAOJifObvuFtnVbNpfxvqxdlhOaK0jRytrSU9vv9TVBGg1jPW82Osd6DvdQjI0GQKe
 OyvZKri+ag4HbUvKPPYiQyYm4aGEN7rrzEdlU3qi7jyVugodmtKpeb/o08xXNqnFwlTE
 MYtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wdFnm7RRtRSFE80bwUaEsdN3yV2SV0vP3Z2kzFYnnlc=;
 b=pCRU+vNPkHEs5DoMa14GaourfyOnSqx4qBXbpL/2XLTvm0WXQmYFAANXfCJZZU54fx
 48j3ZWhWWiVDMxZWrSMTREZ1OqPu5FamYAhAhU+m8339zvcnn3jUWddwk293g67RBif3
 uKJVfdWqVxFlK9Ph2rp9pMWjXTe6O6eIxErCa957aNWyChT8lBVYcXKRZFfedXpQcUN1
 pIYuJbJGNN7inNyu956AE7QGRJSd71jNr/L6DcxFMfLs4RLgrjLSBVbsbWvVMLoJRXyr
 bTx9KGnmXUc6nqlGySFmrCrVXrVxU6Q5assZoWa+px0YQlhnvpQbbCBzu1zeZZsfT7bV
 sQJw==
X-Gm-Message-State: AOAM533k5iac3LmuEuGT8LlQRd6ANW0OpDr1pu0ABNaIgS0vwMpGH1Y/
 alWoMVof6PbvV6uL0A4TCWg=
X-Google-Smtp-Source: ABdhPJxh39sItlBbypn5s+6CpMU8gblLRgspg+iwxnB/h0Z++e0kBQYb+IZ7woPGm+m+cRaoBZWkFw==
X-Received: by 2002:a05:620a:15b:: with SMTP id
 e27mr1858216qkn.488.1626142558861; 
 Mon, 12 Jul 2021 19:15:58 -0700 (PDT)
Received: from shine.lan ([2001:470:8:67e:9378:603d:7cd:adab])
 by smtp.gmail.com with ESMTPSA id i2sm7373697qko.43.2021.07.12.19.15.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 19:15:58 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: jandryuk@gmail.com
Subject: [PATCH] vl: Parse legacy default_machine_opts
Date: Mon, 12 Jul 2021 22:15:52 -0400
Message-Id: <20210713021552.19110-1-jandryuk@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <CAKf6xps07sbk7MnehPTKes52sst0UyaHiHjjSdEX0bFjT+E_ag@mail.gmail.com>
References: <CAKf6xps07sbk7MnehPTKes52sst0UyaHiHjjSdEX0bFjT+E_ag@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::735;
 envelope-from=jandryuk@gmail.com; helo=mail-qk1-x735.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: anthony.perard@citrix.com, pbonzini@redhat.com, qemu-devel@nongnu.org,
 xen-devel@lists.xenproject.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

qemu can't start a xen vm after commit d8fb7d0969d5
"vl: switch -M parsing to keyval" with:

$ ./qemu-system-i386 -M xenfv
Unexpected error in object_property_find_err() at ../qom/object.c:1298:
qemu-system-i386: Property 'xenfv-3.1-machine.accel' not found
Aborted (core dumped)

The default_machine_opts handling doesn't process the legacy machine
options like "accel".  Call qemu_apply_legacy_machine_options to provide
the legacy handling.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
 softmmu/vl.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/softmmu/vl.c b/softmmu/vl.c
index 4df1496101..f4d8630fc6 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -2126,6 +2126,7 @@ static void qemu_create_machine(QDict *qdict)
         QDict *default_opts =
             keyval_parse(machine_class->default_machine_opts, NULL, NULL,
                          &error_abort);
+        qemu_apply_legacy_machine_options(default_opts);
         object_set_properties_from_keyval(OBJECT(current_machine), default_opts,
                                           false, &error_abort);
         qobject_unref(default_opts);
-- 
2.30.2


