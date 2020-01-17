Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D1BF1408C4
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jan 2020 12:16:50 +0100 (CET)
Received: from localhost ([::1]:55620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1isPcP-0008He-KS
	for lists+qemu-devel@lfdr.de; Fri, 17 Jan 2020 06:16:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33281)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1isPbL-0007nB-3W
 for qemu-devel@nongnu.org; Fri, 17 Jan 2020 06:15:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1isPbG-00012M-FM
 for qemu-devel@nongnu.org; Fri, 17 Jan 2020 06:15:43 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:49206
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>) id 1isPbF-0000z3-UB
 for qemu-devel@nongnu.org; Fri, 17 Jan 2020 06:15:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579259737;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=d1PdSWMRtd6953JUHtBtID0euIUVVyV+EPPDgg/+qng=;
 b=UjC8e8fvWoBZbkBwIz9hv0xNlDGxKf7XXQ2PrYFORvl9ATpBHyyhnf6drCE/W/hvoTYrdg
 S2xt0oJI7GLpNcwSLLzJVjNub8ytXG7w8gtVgmB+m2gHPmTB0x19Gv+0yeVainPDvsRkgw
 IX4Shrlst/n7vWG8fQ41sEP2vNAwIDY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-279-TwIiJulLMt21rU-X2Aji6Q-1; Fri, 17 Jan 2020 06:15:36 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4C33E800D41;
 Fri, 17 Jan 2020 11:15:35 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-116-212.ams2.redhat.com [10.36.116.212])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CA3D260C87;
 Fri, 17 Jan 2020 11:15:31 +0000 (UTC)
Subject: Re: [PATCH v2] s390x: adapter routes error handling
To: Cornelia Huck <cohuck@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>
References: <20200117111147.5006-1-cohuck@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <206366f0-ac14-cead-8ebe-dc46aced83d4@redhat.com>
Date: Fri, 17 Jan 2020 12:15:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200117111147.5006-1-cohuck@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: TwIiJulLMt21rU-X2Aji6Q-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17/01/2020 12.11, Cornelia Huck wrote:
> If the kernel irqchip has been disabled, we don't want the
> {add,release}_adapter_routes routines to call any kvm_irqchip_*
> interfaces, as they may rely on an irqchip actually having been
> created. Just take a quick exit in that case instead.
> 
> Also initialize routes->gsi[] with -1 in the virtio-ccw handling,
> to make sure we don't trip over other errors, either. (Nobody
> else uses the gsi array in that structure.)
> 
> Fixes: d426d9fba8ea ("s390x/virtio-ccw: wire up irq routing and irqfds")
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> ---
> 
> v1->v2:
>   - also initialize the gsi array with -1
> 
> ---
>  hw/intc/s390_flic_kvm.c | 8 ++++++++
>  hw/s390x/virtio-ccw.c   | 4 ++++
>  2 files changed, 12 insertions(+)
> 
> diff --git a/hw/intc/s390_flic_kvm.c b/hw/intc/s390_flic_kvm.c
> index dddd33ea61c8..44b7960ebcc8 100644
> --- a/hw/intc/s390_flic_kvm.c
> +++ b/hw/intc/s390_flic_kvm.c
> @@ -331,6 +331,10 @@ static int kvm_s390_add_adapter_routes(S390FLICState *fs,
>      int ret, i;
>      uint64_t ind_offset = routes->adapter.ind_offset;
>  
> +    if (!kvm_gsi_routing_enabled()) {
> +        return -ENOSYS;
> +    }
> +
>      for (i = 0; i < routes->num_routes; i++) {
>          ret = kvm_irqchip_add_adapter_route(kvm_state, &routes->adapter);
>          if (ret < 0) {
> @@ -358,6 +362,10 @@ static void kvm_s390_release_adapter_routes(S390FLICState *fs,
>  {
>      int i;
>  
> +    if (!kvm_gsi_routing_enabled()) {
> +        return;
> +    }
> +
>      for (i = 0; i < routes->num_routes; i++) {
>          if (routes->gsi[i] >= 0) {
>              kvm_irqchip_release_virq(kvm_state, routes->gsi[i]);
> diff --git a/hw/s390x/virtio-ccw.c b/hw/s390x/virtio-ccw.c
> index 6580ce5907dd..13f57e7b67f1 100644
> --- a/hw/s390x/virtio-ccw.c
> +++ b/hw/s390x/virtio-ccw.c
> @@ -697,6 +697,7 @@ static void virtio_ccw_device_realize(VirtioCcwDevice *dev, Error **errp)
>      CCWDeviceClass *ck = CCW_DEVICE_GET_CLASS(ccw_dev);
>      SubchDev *sch;
>      Error *err = NULL;
> +    int i;
>  
>      sch = css_create_sch(ccw_dev->devno, errp);
>      if (!sch) {
> @@ -717,6 +718,9 @@ static void virtio_ccw_device_realize(VirtioCcwDevice *dev, Error **errp)
>      ccw_dev->sch = sch;
>      dev->indicators = NULL;
>      dev->revision = -1;
> +    for (i = 0; i < ADAPTER_ROUTES_MAX_GSI; i++) {
> +        dev->routes.gsi[i] = -1;
> +    }
>      css_sch_build_virtual_schib(sch, 0, VIRTIO_CCW_CHPID_TYPE);
>  
>      trace_virtio_ccw_new_device(
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>


