Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47A014680A5
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Dec 2021 00:35:47 +0100 (CET)
Received: from localhost ([::1]:50050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mtI5i-0007P2-Cf
	for lists+qemu-devel@lfdr.de; Fri, 03 Dec 2021 18:35:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1mtHts-0004XZ-Eb
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 18:23:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28086)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1mtHtp-0005dK-M9
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 18:23:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638573809;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=41tCSKwDDA9LyS9WdyvNz09tKz/OJIdMlzMLsp14Jgc=;
 b=ZAKTmB+fijiQ5vlxWpl5xM7onQ95u1XbYznzPpKCIeXGti1cOCo3WxwAcLydaoiNG6S6zG
 nYd9xcFQSW3IJ114QQ3wrtjrbqY1UDc37rhSKdzblo8Ukpxp22B3jo/AX7aPr6blJBaeKq
 2g9kER8eJdd4cgiSYAzn4tlV4WNjI+w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-98-wErlxduhOrWyfb47epXY1w-1; Fri, 03 Dec 2021 18:23:26 -0500
X-MC-Unique: wErlxduhOrWyfb47epXY1w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CFBE319253C0;
 Fri,  3 Dec 2021 23:23:24 +0000 (UTC)
Received: from [10.64.54.43] (vpn2-54-43.bne.redhat.com [10.64.54.43])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DCC2260843;
 Fri,  3 Dec 2021 23:23:14 +0000 (UTC)
Subject: Re: [PATCH v2 1/2] hw/arm/virt: Support for virtio-mem-pci
To: David Hildenbrand <david@redhat.com>, qemu-arm@nongnu.org
References: <20211203033522.27580-1-gshan@redhat.com>
 <20211203033522.27580-2-gshan@redhat.com>
 <e9a7760e-33bf-478f-50b2-830eaf35d1de@redhat.com>
From: Gavin Shan <gshan@redhat.com>
Message-ID: <d6ce755e-e3f3-ddf0-fdab-90819ca9ba55@redhat.com>
Date: Sat, 4 Dec 2021 10:23:08 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <e9a7760e-33bf-478f-50b2-830eaf35d1de@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=gshan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.938, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Reply-To: Gavin Shan <gshan@redhat.com>
Cc: peter.maydell@linaro.org, drjones@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, eric.auger@redhat.com, shan.gavin@gmail.com,
 Jonathan.Cameron@huawei.com, imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/4/21 5:18 AM, David Hildenbrand wrote:
> On 03.12.21 04:35, Gavin Shan wrote:
>> This supports virtio-mem-pci device on "virt" platform, by simply
>> following the implementation on x86.
>>
>>     * This implements the hotplug handlers to support virtio-mem-pci
>>       device hot-add, while the hot-remove isn't supported as we have
>>       on x86.
>>
>>     * The block size is 512MB on ARM64 instead of 128MB on x86.
>>
>>     * It has been passing the tests with various combinations like 64KB
>>       and 4KB page sizes on host and guest, different memory device
>>       backends like normal, transparent huge page and HugeTLB, plus
>>       migration.
>>
> 
> I would turn this patch into 2/2, reshuffling both patches.
> 
>> Co-developed-by: David Hildenbrand <david@redhat.com>
>> Co-developed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
>> Signed-off-by: Gavin Shan <gshan@redhat.com>
> 
> Reviewed-by: David Hildenbrand <david@redhat.com>
> 
> Thanks Gavin!
> 

Yup, I thought of it. The fixed issue doesn't exist if virtio-mem
isn't enabled on ARM64 with PATCH[1/2]. That's why I have this
patch as PATCH[2/2]. However, It's also sensible to me to reshuffle
the patches: to eliminate potential issues before enabling virtio-mem
on ARM64. v3 will have the changes :)

Thanks,
Gavin


