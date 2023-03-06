Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A37B76AD1A5
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 23:34:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZJOk-0004RD-2x; Mon, 06 Mar 2023 17:33:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pZJOi-0004QJ-0i
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 17:33:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pZJOg-0003Yn-SO
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 17:33:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678142014;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Pmv4GODEo+jntdE66L5djocg5OACgVqeZY4tkfhD1zA=;
 b=Y06zmmNzwG+gr+01MxwuwalEFJYoPAG8LpJT8cXEU+ut4lDxsSXFAOWsouVcaB/JNkamMv
 Mhy9Qc3KrONbRd5UsZYK8lIm4Fiwn0t8lxcp+7jST0Z/RE0siFb2TvZvCwk4c57c3LW/Ua
 VPgJLLqWXrxhDuch/XooanWzWHP23mU=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-361-k3eCQ0DQOMiBi5PhIuGZMg-1; Mon, 06 Mar 2023 17:33:33 -0500
X-MC-Unique: k3eCQ0DQOMiBi5PhIuGZMg-1
Received: by mail-ed1-f72.google.com with SMTP id
 u10-20020a056402064a00b004c689813557so15672835edx.10
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 14:33:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678142011;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Pmv4GODEo+jntdE66L5djocg5OACgVqeZY4tkfhD1zA=;
 b=wUDtE7M7anfSgKeVtosrFVKZSrT2B/AmH+BUwTrPyw33QPFgdjwnOcDqTB9JnYSyHm
 YLndn8AniF+i/uyrNEZdsvzYJYZ5MUUyrkmByqxLHsLwJZY5s0N3Gq0Tsb+9WB5hooGe
 6KnnBT/w/3Yk1fkwcFu9D6ZTnvrf65W9FsUVKV+c9WwPyTr5lUcPmLMX7YEoZurKIElg
 DrDV8fFzS0TBhm+MVJDj0fo52Jtd+iBcLnV5QtnaBKrR8mg1hfj5CtIJ1HoJav6t5DpZ
 oGXy65il2QYc5VdF3dAqblaF+hy46cm9t00NXOhuRZ3Uu3EqWdL7jvyQ66L33cXCHhEU
 oq2w==
X-Gm-Message-State: AO0yUKXdILZ/gfFc2oE887J2vXN0eJC5gqH48e6RtqNX287MrAaEluwQ
 ifAusjlDNk8U4Q1tAsUm8R3iIjUTy4yGc7Tp+gOxArwyCzpa9/b4yPx7t2FrO/qe9ETwNlPT/ZZ
 cieP/JNs6HYizHo9QU9asQy9+oV7uYldJinitWdBS8kDd81TlrzITiFoDLzVHSR+RuBCiSVN+F+
 0=
X-Received: by 2002:a17:906:2b99:b0:8b1:fc59:a22b with SMTP id
 m25-20020a1709062b9900b008b1fc59a22bmr12399643ejg.34.1678142011619; 
 Mon, 06 Mar 2023 14:33:31 -0800 (PST)
X-Google-Smtp-Source: AK7set9O+Sd2aQ2n/uwaHBFSJPVhlzAoyF9CTajlunEWiYDWsMDBbe9c3vvxJzM3oiCmKwDcFChuUg==
X-Received: by 2002:a17:906:2b99:b0:8b1:fc59:a22b with SMTP id
 m25-20020a1709062b9900b008b1fc59a22bmr12399621ejg.34.1678142011395; 
 Mon, 06 Mar 2023 14:33:31 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 ca5-20020a170906a3c500b008bc2c2134c5sm5124489ejb.216.2023.03.06.14.33.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Mar 2023 14:33:30 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: gshan@redhat.com, eesposit@redhat.com, david@redhat.com,
 stefanha@redhat.com, cohuck@redhat.com, eauger@redhat.com,
 richard.henderson@linaro.org
Subject: [PATCH v2 7/9] physmem: add missing memory barrier
Date: Mon,  6 Mar 2023 23:33:04 +0100
Message-Id: <20230306223306.84383-8-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230306223306.84383-1-pbonzini@redhat.com>
References: <20230306223306.84383-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 softmmu/physmem.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index 47143edb4f6c..a6efd8e8dd11 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -2927,6 +2927,8 @@ void cpu_register_map_client(QEMUBH *bh)
     qemu_mutex_lock(&map_client_list_lock);
     client->bh = bh;
     QLIST_INSERT_HEAD(&map_client_list, client, link);
+    /* Write map_client_list before reading in_use.  */
+    smp_mb();
     if (!qatomic_read(&bounce.in_use)) {
         cpu_notify_map_clients_locked();
     }
@@ -3116,6 +3118,7 @@ void address_space_unmap(AddressSpace *as, void *buffer, hwaddr len,
     qemu_vfree(bounce.buffer);
     bounce.buffer = NULL;
     memory_region_unref(bounce.mr);
+    /* Clear in_use before reading map_client_list.  */
     qatomic_mb_set(&bounce.in_use, false);
     cpu_notify_map_clients();
 }
-- 
2.39.1


