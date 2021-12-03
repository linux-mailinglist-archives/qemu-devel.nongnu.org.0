Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A5F046802D
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Dec 2021 00:09:21 +0100 (CET)
Received: from localhost ([::1]:40530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mtHg7-0003Te-UL
	for lists+qemu-devel@lfdr.de; Fri, 03 Dec 2021 18:09:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1mtHeK-00029h-Fk
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 18:07:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48105)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1mtHeG-0007L1-NC
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 18:07:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638572842;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E1PqSQCgSBZSyeFtBCxTlhhTodq9lOn37h2qobTUok8=;
 b=iHG8vtxxUy1lAF7HfmG/vxQmUX9SZj/Gi8MdTqI0aeIFembzuM5Qpqm1DtWHvHUFxYB0iI
 /CIZ3jAmiGBqr+Hg477FHAFVBARKqKPONAC0Q0KuibS20HFSeDdRSzsF7qz3dzFgqmFXWG
 M2FPAgLROX9jzIyGuyb6R9pIN5tcoIA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-585--W1jDEo8MYuKgVvyTUJU0w-1; Fri, 03 Dec 2021 18:07:21 -0500
X-MC-Unique: -W1jDEo8MYuKgVvyTUJU0w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EF3B683DD20;
 Fri,  3 Dec 2021 23:07:19 +0000 (UTC)
Received: from [10.64.54.43] (vpn2-54-43.bne.redhat.com [10.64.54.43])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 48CF460843;
 Fri,  3 Dec 2021 23:07:00 +0000 (UTC)
Subject: Re: [PATCH v2 0/2] hw/arm/virt: Support for virtio-mem-pci
To: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
References: <20211203033522.27580-1-gshan@redhat.com>
 <20211203141058.00006079@Huawei.com>
From: Gavin Shan <gshan@redhat.com>
Message-ID: <e6159135-6bbc-7f2f-2226-e25e29ba3c67@redhat.com>
Date: Sat, 4 Dec 2021 10:06:56 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20211203141058.00006079@Huawei.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=gshan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.938, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Reply-To: Gavin Shan <gshan@redhat.com>
Cc: peter.maydell@linaro.org, drjones@redhat.com, david@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, eric.auger@redhat.com,
 qemu-arm@nongnu.org, shan.gavin@gmail.com, imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Jonathan,

On 12/4/21 1:10 AM, Jonathan Cameron wrote:
> On Fri,  3 Dec 2021 11:35:20 +0800
> Gavin Shan <gshan@redhat.com> wrote:
> 
>> This series supports virtio-mem-pci device, by simply following the
>> implementation on x86. The exception is the block size is 512MB on
>> ARM64 instead of 128MB on x86, compatible with the memory section
>> size in linux guest.
>>
>> The work was done by David Hildenbrand and then Jonathan Cameron. I'm
>> taking the patch and putting more efforts, which is all about testing
>> to me at current stage.
> 
> Thanks for taking this forwards.  What you have here looks good to me, but
> I've not looked at this for a while, so I'll go with whatever David and
> others say :)
> 

[...]

I would translate this as your reviewed-by tag, which will be added to v3.
However, it shouldn't stop you from further reviewing :)

Thanks,
Gavin


