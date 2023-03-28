Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 652616CBE55
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 14:01:59 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ph7zw-00057g-Im; Tue, 28 Mar 2023 08:00:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1ph7zn-00057G-RX
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 08:00:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1ph7zm-00088t-7O
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 08:00:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680004809;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hoIgBrKk8eyJMLHZLR+QuqHgX1JIBX5kx6kFTZx7Xo0=;
 b=FAKrdg8LDRYY3WbtSDxLJ1vnDxjVbYUHMvE5GWuBiD3oCEltW2pLm/T4ln4PTNcLghmD5I
 4H0KkahTwwUsblG+xozKotrSWxDdThrGgOkJGh/MAw02u0A+p88KsB3OdAxSNySHEhDgV3
 T1NBxNjBsaNW8qV/2tOpTA8LJjA3omI=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-66-hDwrOgZRMiWJnbQhxIx8EA-1; Tue, 28 Mar 2023 08:00:07 -0400
X-MC-Unique: hDwrOgZRMiWJnbQhxIx8EA-1
Received: by mail-ed1-f70.google.com with SMTP id
 a27-20020a50c31b000000b0050047ecf4bfso17228796edb.19
 for <qemu-devel@nongnu.org>; Tue, 28 Mar 2023 05:00:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680004806;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hoIgBrKk8eyJMLHZLR+QuqHgX1JIBX5kx6kFTZx7Xo0=;
 b=iISZS8l+LEA81bpSvR5qQJa8SjKNDjwIGwX4EV6+9zl7wXOBYjY4SLnF7y935lzoAx
 rue9fFsLzZ8IkuHcVWYD8v3yxb17ab6Sg6ZICzTFWSjIz6EKHllmxVoCLGb5Xr9YpFz6
 zbZIFPMaXKE4igheW49iXi11jQqe1Q18QbyvCiFOcNOQ1bjiFpPUcYLwr4lapWvtLCgm
 QZ4HhpLzku7EexoZeyaReq8WEX/3WwlKJwYGkiK4lK5wbEX5GP7Z2kkJryjnMJUB/01j
 42hkO3bwfEYByGwNkF5TTFUR6YqjeNqK44rdKyL0VJtXseHi3uYN1NWavfoC2kv+8pdD
 PE2Q==
X-Gm-Message-State: AAQBX9cq3VlocHw0u5c6KJZujEloSDSj6VWtGLZRM28GjDNDg24jDocH
 z4OzB/IWfi0gke5J2sCWAMiBsxgdNKneF96KFERUFGY91OjpB5qeCt1Og8M7XJgiLQfV7YEXJ6Y
 vuvv2Oxkmi4lJSCw=
X-Received: by 2002:aa7:cfd8:0:b0:4fd:1cf1:b7b0 with SMTP id
 r24-20020aa7cfd8000000b004fd1cf1b7b0mr13441042edy.7.1680004806379; 
 Tue, 28 Mar 2023 05:00:06 -0700 (PDT)
X-Google-Smtp-Source: AKy350YiKoQp+uH7fQ3ueMZyq2AnSXyn5wPNP7YUZSuA0Z+yOoF4Ove4hjNCNNurkPeAdbodFH4V7w==
X-Received: by 2002:aa7:cfd8:0:b0:4fd:1cf1:b7b0 with SMTP id
 r24-20020aa7cfd8000000b004fd1cf1b7b0mr13441030edy.7.1680004806109; 
 Tue, 28 Mar 2023 05:00:06 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 f17-20020a170906c09100b009306ebc79d3sm15236125ejz.59.2023.03.28.05.00.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Mar 2023 05:00:05 -0700 (PDT)
Date: Tue, 28 Mar 2023 14:00:05 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: qemu-devel@nongnu.org, Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Ira Weiny <ira.weiny@intel.com>, Michael Tsirkin <mst@redhat.com>, Ben
 Widawsky <bwidawsk@kernel.org>
Subject: Re: need help with ACPI generic port implementation for QEMU
Message-ID: <20230328140005.0d4776a3@imammedo.users.ipa.redhat.com>
In-Reply-To: <c021051b-feb5-04e7-c88c-135697276977@intel.com>
References: <c021051b-feb5-04e7-c88c-135697276977@intel.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.36; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
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

On Mon, 13 Mar 2023 14:58:42 -0700
Dave Jiang <dave.jiang@intel.com> wrote:

> I'm attempting to implement the support of ACPI "generic port" detailed 
> in the ACPI r6.5 spec in QEMU. The spec section 5.2.16.7 details the 
> Generi Port Affinity Structure where it ties a Device Handle to a 
> Proximity Domain. And with section 6.2.28.4 for the HMAT table, the 
> latency and bandwidth information are provided by the System Locality 
> Latency and Bandwidth Information Structure (SLLBIS) sub-table.
> 
> In the CXL world, a hotplugged type-3 device would not have the 
> approriate end to end latency and bandwidth data provided by the HMAT. 
> The QoS data needs to be computed from the CXL host bridge (HB) and the 
> endpoint device. Some parts of the data are supplemented by the CDAT 
> from the endpoint device and the CXL switch(es) if they exist in the 
> path. The component missing is the path between the CPU and the CXL HB 
> (generic port). The data provided by HMAT for generic port will fill 
> that gap.
> 
> In QEMU, the SRAT is generated by code and the table entry addition is a 
> somewhat straight forward implementation. The HMAT information is fed 
> through user parameter inputs and will require a new object to allow the 
> representation of generic port. The intention is to be able to do 
> something like:
> "-object genport,id=genport0"
> "-numa node,genport=genport0,nodeid=5,initiator=0"
> "-numa dist,src=0,dst=5,val=$dist"
> "-numa 
> hmat-lb,initiator=0,target=5,hierachy=memory,data-type=access-latency,latency=$lat"
> "-numa 
> hmat-lb,initiator=0,target=5,hierarchy=memory,data-type=access-bandwidth,bandwidth=$bw"
> 
> I put together a skeletal generic port device that seems to pass the 
> numa parsing code parts. However I'm hitting an error after that that I 
> can't figure out how to deal with:
> qemu-system-x86_64: ../hw/core/qdev.c:316: 
> qdev_assert_realized_properly_cb: Assertion `dev->realized' failed.
> 
> At what point is qdev_realize() being called for a device object? It 
> seems that this never happens for this generic port device. What am I 
> missing in terms of initialization or setup? Any assistance is 
> appreciated. Thanks in advance. Here's my latest code that I'm playing 
> with as reference:
> https://github.com/davejiang/qemu/tree/genport

Pls, send an RFC series to qemu-devel to start discussion


