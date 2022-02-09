Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F9DB4AF294
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 14:23:47 +0100 (CET)
Received: from localhost ([::1]:34912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHmwk-0001bV-OW
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 08:23:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1nHmOj-00021k-F9
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 07:48:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28064)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1nHmOf-0001YK-Q6
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 07:48:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644410905;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dLp4Cg1jv2YFe7xWjj0q79odDaNdA/q3J9Zn7C7YD1M=;
 b=ROkiDLFLXUN6Efyn06df+dBh7NTEwfAAEhXfNHKB72DJr6qghTc/o/nQkNytS8P3lLno0Y
 eIIrpIs8l0dKx75MYpvKYjN1cPEtSpUIcUn2+CbKyKXVj8ehHIjDgWzQhs03aHTFysUVrT
 2s+XFL/6roQLoilTGAhhwGWbx3JpE9c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-562-FF8RcTrUNYirMEEkSfmkYA-1; Wed, 09 Feb 2022 07:48:22 -0500
X-MC-Unique: FF8RcTrUNYirMEEkSfmkYA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7A6BF39382;
 Wed,  9 Feb 2022 12:48:21 +0000 (UTC)
Received: from localhost (unknown [10.39.194.43])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1CED77C0C9;
 Wed,  9 Feb 2022 12:48:20 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: eric.auger@redhat.com, "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v2 2/4] virtio-iommu: Default to bypass during boot
In-Reply-To: <6dbd9ef6-99da-850a-114d-53486c91a05f@redhat.com>
Organization: Red Hat GmbH
References: <20220127142940.671333-1-jean-philippe@linaro.org>
 <20220127142940.671333-3-jean-philippe@linaro.org>
 <87wni5tftq.fsf@redhat.com>
 <20220208160642-mutt-send-email-mst@kernel.org>
 <87r18cthwd.fsf@redhat.com>
 <6dbd9ef6-99da-850a-114d-53486c91a05f@redhat.com>
User-Agent: Notmuch/0.34 (https://notmuchmail.org)
Date: Wed, 09 Feb 2022 13:48:19 +0100
Message-ID: <87o83gtdd8.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
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
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 09 2022, Eric Auger <eric.auger@redhat.com> wrote:

> Hi,
>
> On 2/9/22 12:10 PM, Cornelia Huck wrote:
>> On Tue, Feb 08 2022, "Michael S. Tsirkin" <mst@redhat.com> wrote:
>>
>>> On Tue, Feb 08, 2022 at 06:42:57PM +0100, Cornelia Huck wrote:
>>>> On Thu, Jan 27 2022, Jean-Philippe Brucker <jean-philippe@linaro.org> wrote:
>>>>
>>>>> @@ -988,9 +1025,9 @@ static void virtio_iommu_device_realize(DeviceState *dev, Error **errp)
>>>>>      virtio_add_feature(&s->features, VIRTIO_IOMMU_F_INPUT_RANGE);
>>>>>      virtio_add_feature(&s->features, VIRTIO_IOMMU_F_DOMAIN_RANGE);
>>>>>      virtio_add_feature(&s->features, VIRTIO_IOMMU_F_MAP_UNMAP);
>>>>> -    virtio_add_feature(&s->features, VIRTIO_IOMMU_F_BYPASS);
>>>>>      virtio_add_feature(&s->features, VIRTIO_IOMMU_F_MMIO);
>>>>>      virtio_add_feature(&s->features, VIRTIO_IOMMU_F_PROBE);
>>>>> +    virtio_add_feature(&s->features, VIRTIO_IOMMU_F_BYPASS_CONFIG);
>>>> Hm. In the other patch, you say that you don't support cross-version
>>>> migration (I assume across QEMU versions?)
>>> I missed that ... where does it say this?
>> In bf447d9b-c039-ccdc-f24f-ab8b56c1b196@redhat.com and follow-ups
>> (unless I misread that; maybe it's more about this concrete boundary and
>> not generally?)
>
> We were considering the virtio-iommu QEMU device currently isn't used
> for production yet, as far as we know, because we were missing the ACPI
> integration.
> So we envisionned to not care about mig subsections and just add the new
> field in the VMState.
>
> would that make sense?

If people are currently mostly playing with this device, it would not
hurt too much, I guess. (Should we document expectations somewhere?)

Adding a compat prop for this feature would be easy enough, but juggling
subsections is a bit more involved, so I see the argument for not caring
about them.

>
> Thanks
>
> Eric
>
>>
>>>> Because changing the feature
>>>> set will be guest-visible, and would need some compat handling if you
>>>> plan to support this.


