Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7A0313A33A
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jan 2020 09:49:28 +0100 (CET)
Received: from localhost ([::1]:34608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1irHt9-0006T5-Q7
	for lists+qemu-devel@lfdr.de; Tue, 14 Jan 2020 03:49:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51608)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1irHsK-0005wr-7B
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 03:48:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1irHsJ-0003zk-6O
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 03:48:36 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:22598
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1irHsJ-0003zW-3O
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 03:48:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578991714;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xebxu3XvDhe0sUPwQUHc0rBV9/6bWbH4tEvUxnUtBlc=;
 b=BpZJa9qQVqWXMtfVX7TYs7ftgLKQCIppWxcNkH96IuRmwQwVrTRi4USTPD8paeVPlpeWLn
 FbvgNZqlP5lvrCSWhp4th8nndB2BLyC4FjUYP5TG7WxAzIE48X7TTUgCkgFlrq7PebtF47
 CG0x2uWud9CUF3fvuROMPDiO0HtyTCM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-357-IVALv5cWOkS9MM6DZ0N--A-1; Tue, 14 Jan 2020 03:48:31 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6703D184C734;
 Tue, 14 Jan 2020 08:48:29 +0000 (UTC)
Received: from [10.36.117.108] (ovpn-117-108.ams2.redhat.com [10.36.117.108])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8796C675AF;
 Tue, 14 Jan 2020 08:48:21 +0000 (UTC)
Subject: Re: [PATCH v12 04/13] virtio-iommu: Add the iommu regions
To: Peter Xu <peterx@redhat.com>
References: <20200109144319.15912-1-eric.auger@redhat.com>
 <20200109144319.15912-5-eric.auger@redhat.com>
 <20200113200649.GC201624@xz-x1>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <638a595a-ff82-54f2-bc48-5750da3d38f8@redhat.com>
Date: Tue, 14 Jan 2020 09:48:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20200113200649.GC201624@xz-x1>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: IVALv5cWOkS9MM6DZ0N--A-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: peter.maydell@linaro.org, kevin.tian@intel.com, tnowicki@marvell.com,
 jean-philippe@linaro.org, quintela@redhat.com, qemu-devel@nongnu.org,
 dgilbert@redhat.com, bharatb.linux@gmail.com, qemu-arm@nongnu.org,
 mst@redhat.com, eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Peter,

On 1/13/20 9:06 PM, Peter Xu wrote:
> On Thu, Jan 09, 2020 at 03:43:10PM +0100, Eric Auger wrote:
>> +/**
>> + * The bus number is used for lookup when SID based operations occur.
>> + * In that case we lazily populate the IOMMUPciBus array from the bus hash
>> + * table. At the time the IOMMUPciBus is created (iommu_find_add_as), the bus
>> + * numbers may not be always initialized yet.
>> + */
>> +static IOMMUPciBus *iommu_find_iommu_pcibus(VirtIOIOMMU *s, uint8_t bus_num)
>> +{
>> +    IOMMUPciBus *iommu_pci_bus = s->iommu_pcibus_by_bus_num[bus_num];
>> +
>> +    if (!iommu_pci_bus) {
>> +        GHashTableIter iter;
>> +
>> +        g_hash_table_iter_init(&iter, s->as_by_busptr);
>> +        while (g_hash_table_iter_next(&iter, NULL, (void **)&iommu_pci_bus)) {
>> +            if (pci_bus_num(iommu_pci_bus->bus) == bus_num) {
>> +                s->iommu_pcibus_by_bus_num[bus_num] = iommu_pci_bus;
>> +                return iommu_pci_bus;
>> +            }
>> +        }
> 
> Btw, we may need to:
> 
>            return NULL;
Yes. By the way Yi's patch "intel_iommu: a fix to
vtd_find_as_from_bus_num()" also applies to SMMU code. I will send a patch.

Thanks

Eric
> 
> here.
> 
>> +    }
>> +    return iommu_pci_bus;
>> +}
> 


