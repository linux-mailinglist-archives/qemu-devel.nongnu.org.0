Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4E24362773
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 20:08:03 +0200 (CEST)
Received: from localhost ([::1]:42772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXSss-0003IJ-EV
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 14:08:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lXSpt-0001Sx-4q
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 14:04:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lXSpq-0005YY-QH
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 14:04:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618596293;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Nn+3eMPPGC3iB3ryJBJ4lcpqzF3GVbbBugIyDIxJ3dc=;
 b=L1TcinEGNiER4XkF3jRcumTODpiQmJ909uNhAInfXHom/jZjUBlFPP5usy/AOI/CpiDxhr
 Z3BGm9BWnJrXRnIG25E8xXPMECVrb6N4uIEJLQQI/wqrCGk/j3+6rGM3CUdFWOy/mHp/AZ
 rmzwgVKjyYcWSqG6mnOO9Mukyix8WWQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-224-WUdiusysOg2xZi-rGdNUug-1; Fri, 16 Apr 2021 14:04:51 -0400
X-MC-Unique: WUdiusysOg2xZi-rGdNUug-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 782C01922025;
 Fri, 16 Apr 2021 18:04:50 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-57.ams2.redhat.com [10.36.112.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 211E15D9C0;
 Fri, 16 Apr 2021 18:04:48 +0000 (UTC)
Subject: Re: [PATCH 2/4] Do not include hw/boards.h if it's not really
 necessary
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210416171314.2074665-1-thuth@redhat.com>
 <20210416171314.2074665-3-thuth@redhat.com>
 <e55a2cf6-2994-5318-0fa5-9a9057457e84@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <f877e682-7c9b-26d8-1ef5-b22b268bb29e@redhat.com>
Date: Fri, 16 Apr 2021 20:04:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <e55a2cf6-2994-5318-0fa5-9a9057457e84@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16/04/2021 19.53, Philippe Mathieu-Daudé wrote:
> Hi Thomas,
> 
> On 4/16/21 7:13 PM, Thomas Huth wrote:
>> Stop including hw/boards.h in files that don't need it.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   accel/tcg/tcg-accel-ops-icount.c | 1 -
>>   accel/tcg/tcg-accel-ops-rr.c     | 1 -
>>   accel/tcg/tcg-accel-ops.c        | 1 -
>>   hw/acpi/cpu.c                    | 1 -
>>   hw/acpi/memory_hotplug.c         | 1 -
>>   hw/alpha/typhoon.c               | 1 -
>>   hw/arm/aspeed.c                  | 1 -
> 
> It requires the macros declared by:
> 
> OBJECT_DECLARE_TYPE(MachineState, MachineClass, MACHINE)

"hw/boards.h" is already included in include/hw/arm/aspeed.h, that's why 
it's working ... Hmm, do we have a policy whether a header should be 
included again in the .c file if it's already included by a .h file?

>>   hw/arm/omap1.c                   | 1 -
>>   hw/arm/omap2.c                   | 1 -
>>   hw/arm/strongarm.c               | 1 -
>>   hw/arm/virt.c                    | 1 -
> 
> Ditto.

See include/hw/arm/virt.h

>>   hw/avr/arduino.c                 | 1 -
> 
> Ditto.

See hw/avr/boot.h

>>   hw/avr/atmega.c                  | 1 -
>>   hw/display/next-fb.c             | 1 -
>>   hw/hppa/machine.c                | 1 -
> 
> Ditto.

See hw/hppa/hppa_sys.h

>>   hw/i386/acpi-build.c             | 1 -
>>   hw/i386/acpi-microvm.c           | 1 -
>>   hw/i386/intel_iommu.c            | 1 -
>>   hw/i386/pc.c                     | 1 -
> 
> Ditto (MACHINE_CLASS macro).

See include/hw/i386/pc.h

>>   hw/i386/x86-iommu.c              | 1 -
>>   hw/intc/sifive_plic.c            | 1 -
>>   hw/mips/loongson3_virt.c         | 1 -
> 
> Ditto.

See hw/mips/fw_cfg.h

  Thomas


