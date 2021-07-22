Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD00A3D26D8
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 17:38:51 +0200 (CEST)
Received: from localhost ([::1]:51894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6amg-0003J9-VV
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 11:38:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m6akH-0000Z0-2C
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 11:36:21 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:46952)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m6akC-0002hA-3p
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 11:36:17 -0400
Received: by mail-ed1-x529.google.com with SMTP id t2so7282962edd.13
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 08:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=b+SyzHYFOk1E/GaAQ0K5wVgZaD0erJqoG+fb+9OgOB8=;
 b=SyLM4LH1/3aI1TAqz5g6IwvbxnX6dSiRj4C+AwFgEm2yg5uE5x/854ik4c3oN614sQ
 /MSeiDmMfTBnJtwqXpbyba2cqXwj254OxjxvkbS+Of0dL8MBOJaNW+PKwqmCtsWGO7x1
 bj7kStSco2EZbFqCzNKwurT8706a2MnGCFSdUbiii6VNd1CBtrazjvevizCHhUfFVf3n
 kyEwuDdPFE0CGBLo/87MgZ5QeQ/4pQas3OPpi9HokSipaDH2/MWLyao/1DfaJOBCrc8y
 UDyGM121A0rbVnouXRfQxlBsGzDng2/BKEPSC5UkYtKpn4+Wtsa8QzWaayvuTOQWJao9
 b68Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=b+SyzHYFOk1E/GaAQ0K5wVgZaD0erJqoG+fb+9OgOB8=;
 b=Bt630FxeF/09zd17ySUugE9qLeoAoFVpFTjUyLqlemoaYX/Ye9ZYQDKLY0BWnVyc4d
 awiGtIjP8Qz2QuTU9k3cVaOnoT93FbHiLs8Mfk4kUOgnGdqLOk02P80Vbix3V/JCOzl1
 3aZJZGU67PsMHjDP4PxhSV3sZ58npY8zZ9xWF9d3/jg3+4Ldd1aY1Nk1AbQsw/lKs/Kn
 cLOebpU4CLQAxkWf8Z+6ywAga/+ORJplH/cU7BT0Rso0ctMcfFCTDaeNAMBg2wvogIAa
 89M0xgSFkQsn5Z2x8AJ1yVV8NGI2QkIBja9dkbinC/QVzLorC/jyJVRniao/019Mz7rE
 eRBA==
X-Gm-Message-State: AOAM532xkDLNTbTi7zVG+OvS7WcKLdgWxcu+xx6QfgqjBubTpFm0h8AU
 jvLUkHDz+O3taxRHile+gxPgxRfF4Y8Cog==
X-Google-Smtp-Source: ABdhPJyfPiNj6aXf9EFn+srOsG+PQ8mMdAfIWmipvwwZ5LaZwOwZVX5JFWB4QVaQxJJ+gELRjA4oAg==
X-Received: by 2002:aa7:cb86:: with SMTP id r6mr230471edt.181.1626968174818;
 Thu, 22 Jul 2021 08:36:14 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id qo6sm9638628ejb.122.2021.07.22.08.36.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jul 2021 08:36:14 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 01/15] qemu-config: never call the callback after an error,
 fix leak
Date: Thu, 22 Jul 2021 17:35:58 +0200
Message-Id: <20210722153612.955537-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210722153612.955537-1-pbonzini@redhat.com>
References: <20210722153612.955537-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x529.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ensure that the callback to qemu_config_foreach is never called upon
an error, by moving the invocation before the "out" label.

Cc: armbru@redhat.com
Fixes: 3770141139 ("qemu-config: parse configuration files to a QDict", 2021-06-04)
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 util/qemu-config.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/util/qemu-config.c b/util/qemu-config.c
index 84ee6dc4ea..7db810f1e0 100644
--- a/util/qemu-config.c
+++ b/util/qemu-config.c
@@ -417,12 +417,12 @@ static int qemu_config_foreach(FILE *fp, QEMUConfigCB *cb, void *opaque,
         return res;
     }
     res = count;
-out:
     if (qdict) {
         cb(group, qdict, opaque, errp);
-        qobject_unref(qdict);
     }
+out:
     loc_pop(&loc);
+    qobject_unref(qdict);
     return res;
 }
 
-- 
2.31.1



