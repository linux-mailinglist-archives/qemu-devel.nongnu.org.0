Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43086420096
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Oct 2021 09:56:32 +0200 (CEST)
Received: from localhost ([::1]:52118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWwMJ-0006hl-8C
	for lists+qemu-devel@lfdr.de; Sun, 03 Oct 2021 03:56:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mWw9K-0003Y3-0w
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 03:43:06 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:37828)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mWw9F-0000q2-F9
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 03:43:05 -0400
Received: by mail-ed1-x52f.google.com with SMTP id ba1so51823195edb.4
 for <qemu-devel@nongnu.org>; Sun, 03 Oct 2021 00:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=O+L6LDgBylGhLfbTqHLm7sHl8WXqmG3KPJ3RVD1qdSM=;
 b=mmxw78likKF7v+hVArH1QvCe9J5jAhv+QNx37o99VOViWa1sPV1lCrjE+iCrJobMr4
 CAwod9tOoNdS1ap1+I32zIo6UajbzkF7DHLZ6hmz0RbA7qko7SH82dYXkun4U4S1Z17V
 gtoDjb6Idj5OQB72q3tkbZqGmW7WWpWkZ5XVypN03Kdj4L/K7OMKxzrtp8C0BmC3E6CX
 PQ8MaRfgwEz2YgZvUMOGnTppX+HG54FvvUzgJP4MyLOJiqc2s3eF813VoNQY9yIH9bsg
 H7eZpubd9A5Sa7Vc3bbryulV8ZPqrN8kZbRQyrychwjZjORIn7KrFu9P0tCP5oaP+o1q
 rVQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=O+L6LDgBylGhLfbTqHLm7sHl8WXqmG3KPJ3RVD1qdSM=;
 b=l5laIzknAy65Dht25LPqblC5ucxYe4z//FMeCG9xA8CbJ4lFs3oDWCMo+PyG2uOV7p
 ZDfHt55VGpUqTlG1JNl3iIoZa/dGc9CVg5WRaj1PtK5O5gwdxEmHlWEAxhjy4jZo0+em
 Tr4vVWdv3HsJIZxZh7HUn4u05Cc0aYPP6Mp/siLYGRHaTXPocNYDDe9XP7LAnELOS7ic
 1/jvUHLUUCNZAsPnSlq4AFo0pgIhs6U5e+jvXyr6kUPGW2JtrC6hQMqOnUL2IOCbdfvD
 o4ABqZcPa0u7PUwLYj4xNhkO7387aShIwq+XpTmfiwOcnwUm9kHSPQkusGaYqilKB2nw
 Guzg==
X-Gm-Message-State: AOAM532prV5ip6ISpcUakTI+XTzOuE/8qeg+S491C0b+kUwOQwbYLRiI
 PLlwo1UP9FkacynYqtzIsrQeqTmitPo=
X-Google-Smtp-Source: ABdhPJyi6Wv4OahNULtjDT4EQPVRvxVD72i5F2QNLVZEF6lyc6yMTmf7VCRG5ThU8G0QtsVJb7kdiA==
X-Received: by 2002:a17:907:984d:: with SMTP id
 jj13mr9368561ejc.211.1633246980159; 
 Sun, 03 Oct 2021 00:43:00 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id n6sm5560856eds.10.2021.10.03.00.42.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Oct 2021 00:42:59 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 10/30] machine: Use ms instead of global current_machine in
 sanity-check
Date: Sun,  3 Oct 2021 09:42:30 +0200
Message-Id: <20211003074250.60869-11-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211003074250.60869-1-pbonzini@redhat.com>
References: <20211003074250.60869-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: Andrew Jones <drjones@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Pankaj Gupta <pankaj.gupta@ionos.com>,
 Yanan Wang <wangyanan55@huawei.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Yanan Wang <wangyanan55@huawei.com>

In the sanity-check of smp_cpus and max_cpus against mc in function
machine_set_smp(), we are now using ms->smp.max_cpus for the check
but using current_machine->smp.max_cpus in the error message.
Tweak this by uniformly using the local ms.

Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
Reviewed-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Pankaj Gupta <pankaj.gupta@ionos.com>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210929025816.21076-11-wangyanan55@huawei.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/core/machine.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index f2a34d98c0..12d7416053 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -881,7 +881,7 @@ static void machine_set_smp(Object *obj, Visitor *v, const char *name,
     } else if (ms->smp.max_cpus > mc->max_cpus) {
         error_setg(errp, "Invalid SMP CPUs %d. The max CPUs "
                    "supported by machine '%s' is %d",
-                   current_machine->smp.max_cpus,
+                   ms->smp.max_cpus,
                    mc->name, mc->max_cpus);
     }
 
-- 
2.31.1



