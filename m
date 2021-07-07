Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CF2E3BE932
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 16:02:20 +0200 (CEST)
Received: from localhost ([::1]:53186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1883-0005ii-Ln
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 10:02:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1m186B-00039X-4h
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 10:00:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32020)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1m1868-0007ak-NG
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 10:00:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625666418;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zEtz2ybv6tyNSdIo46+izCll5hiP571eoSA8Ty2MDcY=;
 b=K9jIBkZVXWdSIC1Hc1Uap6FQfh+VWoYwAnnvfZf5uxoIUQjsM3g6x6Gy1og37t6LiHPxN8
 hxrLvwzNu8a+UBlbnc1EAKQSPl4d2T86NVXKimLNKYsx/JUNUAgG10C77p3aTPj3TFvNjb
 XpquOv8uu814VDMxTq8W33QWIPvoUQc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-199-ypfTNVUuMimua7NhH8G6pw-1; Wed, 07 Jul 2021 10:00:17 -0400
X-MC-Unique: ypfTNVUuMimua7NhH8G6pw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 389CA362FD;
 Wed,  7 Jul 2021 14:00:16 +0000 (UTC)
Received: from localhost (ovpn-113-79.rdu2.redhat.com [10.10.113.79])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2C2D319C45;
 Wed,  7 Jul 2021 14:00:12 +0000 (UTC)
Date: Wed, 7 Jul 2021 10:00:11 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Vitaly Kuznetsov <vkuznets@redhat.com>
Subject: Re: [PATCH v8 0/9] i386: KVM: expand Hyper-V features early
Message-ID: <20210707140011.rnk3ixqrvnftcy5p@habkost.net>
References: <20210608120817.1325125-1-vkuznets@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210608120817.1325125-1-vkuznets@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.439,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-devel@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 08, 2021 at 02:08:08PM +0200, Vitaly Kuznetsov wrote:
> Changes since v7:
> - Make eVMCS version check future proof [Eduardo]
> - Collect R-b tags [Eduardo]
> - Drop 'if (!strcmp(arch, "i386") || !strcmp(arch, "x86_64"))' check from qtest
>  [Eduardo]
> - s/priviliges/privileges/ [Eric]
> 
> The last two functional patches are inspired by 'Fine-grained access check
> to Hyper-V hypercalls and MSRs' work for KVM:
> https://lore.kernel.org/kvm/20210521095204.2161214-1-vkuznets@redhat.com/
> 
> Original description:
> 
> Upper layer tools like libvirt want to figure out which Hyper-V features are
> supported by the underlying stack (QEMU/KVM) but currently they are unable to
> do so. We have a nice 'hv_passthrough' CPU flag supported by QEMU but it has
> no effect on e.g. QMP's 
> 
> query-cpu-model-expansion type=full model={"name":"host","props":{"hv-passthrough":true}}
> 
> command as we parse Hyper-V features after creating KVM vCPUs and not at
> feature expansion time. To support the use-case we first need to make 
> KVM_GET_SUPPORTED_HV_CPUID ioctl a system-wide ioctl as the existing
> vCPU version can't be used that early. This is what KVM part does. With
> that done, we can make early Hyper-V feature expansion (this series).

I'm finally queueing this (please ignore my reply to v7).
Thanks, and sorry for the delay!

-- 
Eduardo


