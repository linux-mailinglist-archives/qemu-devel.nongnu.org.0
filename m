Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D69674AEFF3
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 12:29:50 +0100 (CET)
Received: from localhost ([::1]:53888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHlAT-0007KP-DB
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 06:29:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1nHkru-0000T6-ET
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 06:10:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54237)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1nHkrq-0007SL-1b
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 06:10:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644405033;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1+8rtkdXeA07JAyislkNLi4ukgOPiL8VegaTfkUEryc=;
 b=YHRfSgy6smSC6fX0gtYMD4dpkrYn4G9P5iD/nuXGP/AazsC4uWQh52PiC+kHuI36UasRpN
 tMUJ6q1d4xHUQI6QLlGulTNZlrZ0Gi7eHUl+J49MdsCrHRuc6MlD2Mt3Vjo3uedzZG26f/
 meQVQ0z5G9yIBgUHOLXqf5Dq8h3ZMFE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-627-KeSAEeneOrW27RhlCqXa5A-1; Wed, 09 Feb 2022 06:10:30 -0500
X-MC-Unique: KeSAEeneOrW27RhlCqXa5A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 29D1B84B9A4;
 Wed,  9 Feb 2022 11:10:29 +0000 (UTC)
Received: from localhost (unknown [10.39.194.43])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B70ED26E5F;
 Wed,  9 Feb 2022 11:10:28 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v2 2/4] virtio-iommu: Default to bypass during boot
In-Reply-To: <20220208160642-mutt-send-email-mst@kernel.org>
Organization: Red Hat GmbH
References: <20220127142940.671333-1-jean-philippe@linaro.org>
 <20220127142940.671333-3-jean-philippe@linaro.org>
 <87wni5tftq.fsf@redhat.com>
 <20220208160642-mutt-send-email-mst@kernel.org>
User-Agent: Notmuch/0.34 (https://notmuchmail.org)
Date: Wed, 09 Feb 2022 12:10:26 +0100
Message-ID: <87r18cthwd.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: lvivier@redhat.com, Jean-Philippe Brucker <jean-philippe@linaro.org>,
 thuth@redhat.com, qemu-devel@nongnu.org, pasic@linux.ibm.com,
 eric.auger@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 08 2022, "Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Tue, Feb 08, 2022 at 06:42:57PM +0100, Cornelia Huck wrote:
>> On Thu, Jan 27 2022, Jean-Philippe Brucker <jean-philippe@linaro.org> wrote:
>> 
>> > @@ -988,9 +1025,9 @@ static void virtio_iommu_device_realize(DeviceState *dev, Error **errp)
>> >      virtio_add_feature(&s->features, VIRTIO_IOMMU_F_INPUT_RANGE);
>> >      virtio_add_feature(&s->features, VIRTIO_IOMMU_F_DOMAIN_RANGE);
>> >      virtio_add_feature(&s->features, VIRTIO_IOMMU_F_MAP_UNMAP);
>> > -    virtio_add_feature(&s->features, VIRTIO_IOMMU_F_BYPASS);
>> >      virtio_add_feature(&s->features, VIRTIO_IOMMU_F_MMIO);
>> >      virtio_add_feature(&s->features, VIRTIO_IOMMU_F_PROBE);
>> > +    virtio_add_feature(&s->features, VIRTIO_IOMMU_F_BYPASS_CONFIG);
>> 
>> Hm. In the other patch, you say that you don't support cross-version
>> migration (I assume across QEMU versions?)
>
> I missed that ... where does it say this?

In bf447d9b-c039-ccdc-f24f-ab8b56c1b196@redhat.com and follow-ups
(unless I misread that; maybe it's more about this concrete boundary and
not generally?)

>
>> Because changing the feature
>> set will be guest-visible, and would need some compat handling if you
>> plan to support this.


