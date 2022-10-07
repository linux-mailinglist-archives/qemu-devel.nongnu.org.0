Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF25C5F7E8A
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Oct 2022 22:15:08 +0200 (CEST)
Received: from localhost ([::1]:46120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogtkR-0006mw-Et
	for lists+qemu-devel@lfdr.de; Fri, 07 Oct 2022 16:15:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dave@stgolabs.net>) id 1ogtiv-000591-8d
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 16:13:33 -0400
Received: from bee.birch.relay.mailchannels.net ([23.83.209.14]:32879)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dave@stgolabs.net>) id 1ogtir-0006Fv-9G
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 16:13:32 -0400
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
Received: from relay.mailchannels.net (localhost [127.0.0.1])
 by relay.mailchannels.net (Postfix) with ESMTP id EB710260988;
 Fri,  7 Oct 2022 20:13:25 +0000 (UTC)
Received: from pdx1-sub0-mail-a282 (unknown [127.0.0.6])
 (Authenticated sender: dreamhost)
 by relay.mailchannels.net (Postfix) with ESMTPA id ED93426116C;
 Fri,  7 Oct 2022 20:13:24 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1665173605; a=rsa-sha256;
 cv=none;
 b=XN3v2on9PoFSdZPQKOtGyzrtKz7aVAZUlmGsLOH7t0VebHa5ga/vDh7BX7oI3D1KylC+Q+
 9lFZ0YFmjWoMlKBHa39j/uMfGzMxpoOKgnW9WRXBRNrmR02uTRetaK0NX16mKjpXUBr/9I
 IjJdN9EANDGA0kljR3XC2gHieBI3I6Hwin+Jmj4WYyFAg/lhG6nay3ljBwtBhc1GYfrTPD
 FPCPbYqXtngXCXVm5lpXc1ZUZ50eSPfRVNBbQdmhxrnPeTIF6coFn0jhXR0/2GxF1u0N80
 Wa92aEl8Cun8pegSvZMG066TI6OHR+2olsIaoUxy0irqm+D3VxIG+1oLQNcdSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net; s=arc-2022; t=1665173605;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:dkim-signature;
 bh=NAm1LUEGY44NNwjL2IJ/5MomV8aO8u78kjmZAIx7voU=;
 b=zPWPhJhzO+eI4WDB0uY9od8/UDNVxR6qFUNjoRge7dWnRYqxYq3072PgZsl/LYwIn0CcGe
 4qHMa3CsMnnFUgLrZmPTf+t7q9Xpp3fj9rXMMl+/Up1xW8XcoIibywUtOfxW6pj52GnRGj
 OKotVxr8biA0e17cTj6TXafZ1zqNO9doa40yH6AMqC8bom/Cy6qObPIw3jqs31pKItyi2d
 1DVm5JGi3stQAg9CTECXoIJ4VBKEBY1Sfam/ZLqb8jrwfAOH3WsptvuS0AcYAAYQ+6Y44l
 IwegDtey0nrZeXaeBkjAdx4zXhQcxwWTSw2CBafLq+THhNDVXXWV0GJj2vs6Zg==
ARC-Authentication-Results: i=1; rspamd-755f899884-2b47f;
 auth=pass smtp.auth=dreamhost smtp.mailfrom=dave@stgolabs.net
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|dave@stgolabs.net
X-MailChannels-Auth-Id: dreamhost
X-Bitter-Illegal: 25145ad5026fc4f2_1665173605286_648685402
X-MC-Loop-Signature: 1665173605286:3480309679
X-MC-Ingress-Time: 1665173605285
Received: from pdx1-sub0-mail-a282 (pop.dreamhost.com [64.90.62.162])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
 by 100.106.246.134 (trex/6.7.1); Fri, 07 Oct 2022 20:13:25 +0000
Received: from offworld (ip72-199-50-187.sd.sd.cox.net [72.199.50.187])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 (Authenticated sender: dave@stgolabs.net)
 by pdx1-sub0-mail-a282 (Postfix) with ESMTPSA id 4MkfdH6N0jz2Z;
 Fri,  7 Oct 2022 13:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stgolabs.net;
 s=dreamhost; t=1665173604;
 bh=NAm1LUEGY44NNwjL2IJ/5MomV8aO8u78kjmZAIx7voU=;
 h=Date:From:To:Cc:Subject:Content-Type;
 b=hDJLtBvGgzAURSGTDeqeZUTHxKLK82jACUyxYz4ZwX4JKHko2poWa+HYRPoKnShqL
 +TWYFNBUFtp9lwvmG25trmodSlWQOCNcAtRNJ7fJPDZ/64/IcLcT+kUH8n579L25gs
 GCX9NSR7JTvKClvz5MFEkF5ErM3ZFxuxLXmWUF3iJRrc5K4aOhTWB09oVKS+cO01q5
 +ugTTOZCvxsAwna9DUzJ2fGIp5TRYsoAyMgz7HENU+rKHatLphclVV0kCsl+11WVCw
 h3iQPBON5BKfpiS6T2mYGQyc+RrnncXlyH2foOEvqhPfXRZ2XxkZzWFebjlSoenmTq
 ntDn/dk2LL8Qg==
Date: Fri, 7 Oct 2022 12:52:48 -0700
From: Davidlohr Bueso <dave@stgolabs.net>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Gourry <gourry.memverge@gmail.com>, qemu-devel@nongnu.org,
 Gourry <gregory.price@memverge.com>, linux-cxl@vger.kernel.org,
 Alison Schofield <alison.schofield@intel.com>,
 "a.manzanares@samsung.com" <a.manzanares@samsung.com>,
 Ben Widawsky <bwidawsk@kernel.org>
Subject: Re: [PATCH RFC] hw/cxl: type 3 devices can now present volatile or
 persistent memory
Message-ID: <20221007195248.2i7a44fuujpbfdof@offworld>
References: <20221006000103.49542-1-gregory.price@memverge.com>
 <20221006094557.000035ab@huawei.com>
 <20221006095007.00001271@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20221006095007.00001271@huawei.com>
User-Agent: NeoMutt/20220429
Received-SPF: pass client-ip=23.83.209.14; envelope-from=dave@stgolabs.net;
 helo=bee.birch.relay.mailchannels.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 06 Oct 2022, Jonathan Cameron wrote:

>One of the blockers for volatile support was that we had no means to poke
>it properly as the kernel doesn't yet support volatile capacity and
>no one has done the relevant work in EDK2 or similar to do it before the kernel boots.
>There has been some work on EDK2 support for ARM N2 FVPs from
>Saanta Pattanayak, but not upstream eyt.
>https://lpc.events/event/16/contributions/1254/

fwiw I had been trying to build some of the firmware bootup for the required
acpi tables that are particular to volatile capacity steps (srat/slit, hmat and
EFI Memory Map) by parameters, but got quickly out of hand. For example, the srat
could use a passed 'node' and have a cxl_build_srat(), etc. But yeah it would
be nice for the EDK2 work to advance on the x86 end.

Thanks,
Davidlohr

diff --git a/hw/acpi/cxl.c b/hw/acpi/cxl.c
index 2bf8c0799359..1c3c6d17c222 100644
--- a/hw/acpi/cxl.c
+++ b/hw/acpi/cxl.c
@@ -254,3 +255,46 @@ void build_cxl_osc_method(Aml *dev)
+static int cxl_device_list(Object *obj, void *opaque)
+{
+    GSList **list = opaque;
+
+    if (object_dynamic_cast(obj, TYPE_CXL_TYPE3)) {
+        *list = g_slist_append(*list, DEVICE(obj));
+    }
+
+    object_child_foreach(obj, cxl_device_list, opaque);
+    return 0;
+}
+
+static GSList *cxl_get_device_list(void)
+{
+    GSList *list = NULL;
+
+    object_child_foreach(qdev_get_machine(), cxl_device_list, &list);
+    return list;
+}
+
+void cxl_build_srat(GArray *table_data)
+{
+    GSList *device_list, *list = cxl_get_device_list();
+
+    for (device_list = list; device_list; device_list = device_list->next) {
+        DeviceState *dev = device_list->data;
+        Object *obj = OBJECT(dev);
+        CXLType3Dev *ct3d = CXL_TYPE3(dev);
+        MemoryRegion *mr;
+        int node;
+
+        mr = host_memory_backend_get_memory(ct3d->hostmem);
+        if (!mr) {
+            continue;
+        }
+        node = object_property_get_uint(obj, "node", &error_abort);
+
+        build_srat_memory(table_data, mr->addr, mr->size, node, MEM_AFFINITY_ENABLED);
+    }
+
+    g_slist_free(list);
+}

