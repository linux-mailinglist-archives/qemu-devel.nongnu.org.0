Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD572D75AE
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 13:35:57 +0100 (CET)
Received: from localhost ([::1]:42254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knheO-0004D0-Tq
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 07:35:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1knhWH-0004gp-K6
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 07:27:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53512)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1knhWA-00014Z-1G
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 07:27:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607689645;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jtUp9vtnc+u7JbQj01yVV9NRE2Fs+OCcOxI2USyWlRs=;
 b=Q3p/gfyNs21XSkfLwfQ0fHnoXwQZwk9VD6maiOgQIhktLU6hRBSOL+UmH/o3twJoHqG/9k
 qWKEHJR60w8Jkj6b1g+uxVlgkpbsMxdFfO3UV1f5CS9VaZ7PCcFVB20uKCAs0aUO/umoKr
 7g47o72MePwmeeCFWKJhNevDZJt8Ej0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-499-_XqGtlTCOrGWXNvA7b10ww-1; Fri, 11 Dec 2020 07:27:21 -0500
X-MC-Unique: _XqGtlTCOrGWXNvA7b10ww-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CC4FB107ACF8;
 Fri, 11 Dec 2020 12:27:19 +0000 (UTC)
Received: from gondolin.redhat.com (ovpn-112-240.ams2.redhat.com
 [10.36.112.240])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A2A6310023B3;
 Fri, 11 Dec 2020 12:27:14 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 6/6] s390x/cpu: Use timer_free() in the finalize function to
 avoid memleaks
Date: Fri, 11 Dec 2020 13:26:58 +0100
Message-Id: <20201211122658.24481-7-cohuck@redhat.com>
In-Reply-To: <20201211122658.24481-1-cohuck@redhat.com>
References: <20201211122658.24481-1-cohuck@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 qemu-devel@nongnu.org, qemu-s390x@nongnu.org, Gan Qixin <ganqixin@huawei.com>,
 Euler Robot <euler.robot@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Gan Qixin <ganqixin@huawei.com>

When running device-introspect-test, a memory leak occurred in the s390_cpu_initfn
function, this patch use timer_free() in the finalize function to fix it.

ASAN shows memory leak stack:

Direct leak of 3552 byte(s) in 74 object(s) allocated from:
    #0 0xfffeb3d4e1f0 in __interceptor_calloc (/lib64/libasan.so.5+0xee1f0)
    #1 0xfffeb36e6800 in g_malloc0 (/lib64/libglib-2.0.so.0+0x56800)
    #2 0xaaad51a8f9c4 in timer_new_full qemu/include/qemu/timer.h:523
    #3 0xaaad51a8f9c4 in timer_new qemu/include/qemu/timer.h:544
    #4 0xaaad51a8f9c4 in timer_new_ns qemu/include/qemu/timer.h:562
    #5 0xaaad51a8f9c4 in s390_cpu_initfn qemu/target/s390x/cpu.c:304
    #6 0xaaad51e00f58 in object_init_with_type qemu/qom/object.c:371
    #7 0xaaad51e0406c in object_initialize_with_type qemu/qom/object.c:515
    #8 0xaaad51e042e0 in object_new_with_type qemu/qom/object.c:729
    #9 0xaaad51e3ff40 in qmp_device_list_properties qemu/qom/qom-qmp-cmds.c:153
    #10 0xaaad51910518 in qdev_device_help qemu/softmmu/qdev-monitor.c:283
    #11 0xaaad51911918 in qmp_device_add qemu/softmmu/qdev-monitor.c:801
    #12 0xaaad51911e48 in hmp_device_add qemu/softmmu/qdev-monitor.c:916

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Gan Qixin <ganqixin@huawei.com>
Reviewed-by: David Hildenbrand <david@redhat.com>
Message-Id: <20201204081209.360524-4-ganqixin@huawei.com>
Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 target/s390x/cpu.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
index 7b66718c4423..8a734c2f8c0a 100644
--- a/target/s390x/cpu.c
+++ b/target/s390x/cpu.c
@@ -313,6 +313,11 @@ static void s390_cpu_finalize(Object *obj)
 #if !defined(CONFIG_USER_ONLY)
     S390CPU *cpu = S390_CPU(obj);
 
+    timer_del(cpu->env.tod_timer);
+    timer_free(cpu->env.tod_timer);
+    timer_del(cpu->env.cpu_timer);
+    timer_free(cpu->env.cpu_timer);
+
     qemu_unregister_reset(s390_cpu_machine_reset_cb, cpu);
     g_free(cpu->irqstate);
 #endif
-- 
2.26.2


