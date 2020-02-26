Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7310D1705AB
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Feb 2020 18:10:54 +0100 (CET)
Received: from localhost ([::1]:47488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j70Cz-0001jW-IQ
	for lists+qemu-devel@lfdr.de; Wed, 26 Feb 2020 12:10:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40727)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1j70Bi-0000zT-28
 for qemu-devel@nongnu.org; Wed, 26 Feb 2020 12:09:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1j70Bg-0006Zj-Mi
 for qemu-devel@nongnu.org; Wed, 26 Feb 2020 12:09:33 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:31216
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1j70Bg-0006Yj-JF
 for qemu-devel@nongnu.org; Wed, 26 Feb 2020 12:09:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582736972;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tbipDMXaSAJp7zG5J+AE8EDo2UW8S1OiLcsauThJr7s=;
 b=Fe2CAiTxKqYRRXsBADcCeAHb3esIK6OCqhy8MengBlP9qR8PyGUFU3rh0BIQ052RGRaoUR
 02UkxTKptwjgkuDpsyj90rJvgZb2epf4MuLx8IN0RwRX06uL9CVPrkKfDbWCy6FQZ5AJz0
 NR2Xxqx/jJoUeE4lunWMxWipeiMlVoI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-234-Bk8DxKsVPgGzUpCRct9uYg-1; Wed, 26 Feb 2020 12:09:23 -0500
X-MC-Unique: Bk8DxKsVPgGzUpCRct9uYg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 22612800D48;
 Wed, 26 Feb 2020 17:09:22 +0000 (UTC)
Received: from [10.36.116.59] (ovpn-116-59.ams2.redhat.com [10.36.116.59])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C3C3F27180;
 Wed, 26 Feb 2020 17:09:20 +0000 (UTC)
Subject: Re: [PATCH] hw/intc/arm_gic_kvm: Don't assume kernel can provide a
 GICv2
From: Auger Eric <eric.auger@redhat.com>
To: Andrew Jones <drjones@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
References: <20200225182435.1131-1-peter.maydell@linaro.org>
 <20200226085209.ni7oph6odt24warq@kamzik.brq.redhat.com>
 <CAFEAcA-Bhuy+2dU3joZoip5=tOkiTSoC+LzdNzyd+urUnoRNXw@mail.gmail.com>
 <20200226091750.mqkbqffod247bori@kamzik.brq.redhat.com>
 <85d78328-0843-3f11-7a79-6010aea3d3dd@redhat.com>
Message-ID: <a307e207-cf11-e664-1a3f-a2723a8b9852@redhat.com>
Date: Wed, 26 Feb 2020 18:09:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <85d78328-0843-3f11-7a79-6010aea3d3dd@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Cc: Marc Zyngier <maz@kernel.org>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Peter,

On 2/26/20 12:58 PM, Auger Eric wrote:
> Hi Peter,
> 
> On 2/26/20 10:17 AM, Andrew Jones wrote:
>> On Wed, Feb 26, 2020 at 08:56:03AM +0000, Peter Maydell wrote:
>>> On Wed, 26 Feb 2020 at 08:52, Andrew Jones <drjones@redhat.com> wrote:
>>>> Although, many QEMU command line users still won't know what to do
>>>> without an explicit "Try -machine gic-version=host" hint, so that
>>>> might be nice to add too.
>>>
>>> In the GIC code we don't know if the machine even has a
>>> gic-version property, so we're not in the right place to try to
>>> produce that message.
>>>
>>
>> Ah yes, we use qdev_init_nofail() in virt::create_gic(), so there's
>> no chance to append another hint at the machine level.
>>
>> And what about when machine.gic-version is not provided and KVM is
>> in use? Shouldn't we try version '2', as we do now, but then also
>> '3', if '2' fails, before erroring out?
> 
> In case of KVM accelerated mode we could effectively probe v2 first and
> if not supported choose v3, as mentioned by Drew.
> 
> Couldn't kvm_arm_vgic_probe() return a bitmap by calling
> kvm_create_device on both versions in dryrun mode?

I sent an RFC prototyping what we had in mind - I think - together with
Drew.

[RFC 0/2] hw/arm/virt: kvm: allow gicv3 by default if host does not
support v2

This was discussed earlier in that thread:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg674469.html.

It should not break any compatibility as the only case we are supposed
to change here was aborting before.

Thanks

Eric
> 
> Thanks
> 
> Eric
> 
>>
>> Thanks,
>> drew
>>
>>


