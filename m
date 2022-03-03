Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 494E14CB569
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 04:27:50 +0100 (CET)
Received: from localhost ([::1]:33102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPc85-00017S-CJ
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 22:27:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1nPc5z-0006nN-Lk
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 22:25:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51846)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1nPc5w-00021G-Dz
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 22:25:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646277934;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n3azvZz8+sm7ie/t/QoMrplu38KLWw+jaHr920gf3pM=;
 b=HXVjetLSmYh943vgF2adxebGUZlnsjbWfKGzwbpbM76Irx2F4BPB7Axv98Tg4uiFrgX+hF
 y7GO5O55jGoF/8W24NZztqZOrb+V+1TZdNfFWrGLmj4bKcn+Jenay2cdhg6EmCA1xuXzm/
 nghbCIes9NwMiFspi3Yd+YSPHig0KiA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-557-eK6_FnP4Np-0-MbUVXuXpA-1; Wed, 02 Mar 2022 22:25:33 -0500
X-MC-Unique: eK6_FnP4Np-0-MbUVXuXpA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 64EF21006AA5;
 Thu,  3 Mar 2022 03:25:32 +0000 (UTC)
Received: from [10.72.13.119] (ovpn-13-119.pek2.redhat.com [10.72.13.119])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 182911006859;
 Thu,  3 Mar 2022 03:25:28 +0000 (UTC)
Subject: Re: [PATCH] hw/arm/virt: Validate memory size on the first NUMA node
To: Gerd Hoffmann <kraxel@redhat.com>
References: <20220228075203.60064-1-gshan@redhat.com>
 <20220228100820.477e2311@redhat.com>
 <41eb791c-a74a-7ed6-df05-cd1867ecbb5f@redhat.com>
 <20220301114257.2bppjnjqj7dgxztc@sirius.home.kraxel.org>
From: Gavin Shan <gshan@redhat.com>
Message-ID: <ee76dcac-8914-2f24-9920-9d93aa29c22d@redhat.com>
Date: Thu, 3 Mar 2022 11:25:25 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20220301114257.2bppjnjqj7dgxztc@sirius.home.kraxel.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=gshan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-To: Gavin Shan <gshan@redhat.com>
Cc: peter.maydell@linaro.org, drjones@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, Shan Gavin <shan.gavin@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Gerd,

On 3/1/22 7:42 PM, Gerd Hoffmann wrote:
>>> Unless it architecturally wrong thing i.e. (node size less than 128Mb)
>>> ,in which case limiting it in QEMU would be justified, I'd prefer
>>> firmware being fixed or it reporting more useful for user error message.
>>
>> [include EDK2 developers]
>>
>> I don't think 128MB node memory size is architecturally required.
>> I also thought EDK2 would be better place to provide a precise error
>> mesage and discussed it through with EDK2 developers. Lets see what
>> are their thoughts this time.
> 
> Useful error reporting that early in the firmware initialization is a
> rather hard problem, it's much easier for qemu to catch those problems
> and print a useful error message.
> 
> Fixing the firmware would be possible.  The firmware simply uses the
> memory of the first numa note in the early initialization phase, which
> could be changed to look for additional numa nodes.  It's IMHO simply
> not worth the trouble though.  numa nodes with less memory than 128M
> simply doesn't happen in practice, except when QE does questionable
> scaleability testing (scale up the number of numa nodes without also
> scaling up the total amount of memory, ending up with rather tiny
> numa nodes and a configuration nobody actually uses in practice).
> 

I still don't think QEMU is best place to have this kind of limitation,
which the first NUMA node should have 128MB memory at least. For example,
the limitation exists in EDK2-version-A.0 and the limitation is removed
in EDK2-version-A.1. The QEMU can't boot the guest using EDK2-version-A.1,
but we should succeed.

If it's not worthwhile to be fixed in EDK2, it might be doable to improve
the error message printed by EDK2. Otherwise, we would ignore this issue
because 128MB node memory size isn't used in practice. If the EDK2 error
message can be improved, we might have something like below:

ASSERT [MemoryInit] /home/lacos/src/upstream/qemu/roms/edk2/ArmVirtPkg/Library/QemuVirtMemInfoLib/QemuVirtMemInfoPeiLibConstructor.c(93): NewSize >= 0x08000000

to

The first NUMA node should have more than 128MB memory

Thanks,
Gavin


