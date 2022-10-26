Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 771DF60DF4F
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 13:12:33 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oneJ0-0000j5-HT; Wed, 26 Oct 2022 07:10:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1oneIu-0000Sf-P7
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 07:10:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1oneIs-0006n0-Kh
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 07:10:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666782633;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2xHUCU3Hv8gzgJokIeUC/UBexVko28zT6yor1FdTAFM=;
 b=LUOXZNmuDsXEvyLFMMYzulkMNZuNjPbjXfmMl5kP8RuFkXiByqk+NxCHAd12iruNGzqa/9
 BXcQz0EOlCPKKhx+Dq/uJOmGT/6YzqVbTYPK8WoZWB4TLsXBYlamU9MCwTvYvLeIqnkL3v
 /mU9My5eL3j320EJc56Fno4hM4QKfr8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-632-HqGHKPfONh-ng_tkjdnrSg-1; Wed, 26 Oct 2022 07:10:29 -0400
X-MC-Unique: HqGHKPfONh-ng_tkjdnrSg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A13941C04B7C;
 Wed, 26 Oct 2022 11:10:23 +0000 (UTC)
Received: from localhost (unknown [10.39.193.29])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 61E7D477F55;
 Wed, 26 Oct 2022 11:10:18 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, maz@kernel.org, eric.auger@redhat.com,
 zhenyzha@redhat.com, richard.henderson@linaro.org,
 peter.maydell@linaro.org, shan.gavin@gmail.com
Subject: Re: [PATCH v6 7/7] hw/arm/virt: Add properties to disable high
 memory regions
In-Reply-To: <9472b6fc-00dd-bf92-ed23-0f5a9328c45f@redhat.com>
Organization: Red Hat GmbH
References: <20221024035416.34068-1-gshan@redhat.com>
 <20221024035416.34068-8-gshan@redhat.com> <874jvsfa1q.fsf@redhat.com>
 <9472b6fc-00dd-bf92-ed23-0f5a9328c45f@redhat.com>
User-Agent: Notmuch/0.37 (https://notmuchmail.org)
Date: Wed, 26 Oct 2022 13:10:16 +0200
Message-ID: <87r0yusuw7.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, Oct 26 2022, Gavin Shan <gshan@redhat.com> wrote:

> Hi Connie,
>
> On 10/25/22 6:54 PM, Cornelia Huck wrote:
>> On Mon, Oct 24 2022, Gavin Shan <gshan@redhat.com> wrote:
>> 
>>> These 3 high memory regions are usually enabled by default, but
>> 
>> s/These 3/The/ ?
>> 
>
> Ok.
>
>>> they may be not used. For example, VIRT_HIGH_GIC_REDIST2 isn't
>>> needed by GICv2. This leads to waste in the PA space.
>> 
>> When building the command line, do we have enough information on when
>> the regions provide something useful, and when they just waste space?
>> 
>
> I think the help messages are already indicative. For example, the help
> messages for 'highmem-redist2' indicate the region is only needed by
> GICv3 or GICv4. 'highmem-ecam' and 'highmem-mmio' are needed by PCI ECAM
> and MMIO and the key words 'high' indicates they're the corresponding
> second window.
>
> #./qemu-system-aarch64 -M virt,?
> highmem-ecam=<bool>    - Set on/off to enable/disable high memory region for PCI ECAM
> highmem-mmio=<bool>    - Set on/off to enable/disable high memory region for PCI MMIO
> highmem-redists=<bool> - Set on/off to enable/disable high memory region for GICv3 or GICv4 redistributor

OK, hopefully this is enough for anyone building a command line
directly. (Do we want to encourage management software like libvirt to
switch off regions that are not needed?)

>
>>>
>>> Add properties to allow users selectively disable them if needed:
>>> "highmem-redists", "highmem-ecam", "highmem-mmio".
>>>
>>> Suggested-by: Marc Zyngier <maz@kernel.org>
>>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>>> ---
>>>   docs/system/arm/virt.rst | 12 ++++++++
>>>   hw/arm/virt.c            | 64 ++++++++++++++++++++++++++++++++++++++++
>>>   2 files changed, 76 insertions(+)
>>>
>>> diff --git a/docs/system/arm/virt.rst b/docs/system/arm/virt.rst
>>> index 4454706392..a1668a969d 100644
>>> --- a/docs/system/arm/virt.rst
>>> +++ b/docs/system/arm/virt.rst
>>> @@ -98,6 +98,18 @@ compact-highmem
>>>     Set ``on``/``off`` to enable/disable the compact layout for high memory regions.
>>>     The default is ``on`` for machine types later than ``virt-7.2``.
>>>   
>>> +highmem-redists
>>> +  Set ``on``/``off`` to enable/disable the high memry region for GICv3/4
>> 
>> s/memry/memory/
>> 
>
> Ok, copy-and-paste error. Will be fixed.
>
>>> +  redistributor. The default is ``on``.
>> 
>> Do we need to add a note about what effects setting this to "off" may
>> have, e.g. "Setting this to ``off`` may limit the maximum number of
>> cpus." or so? And/or "Setting this to ``off`` when using GICv2 will save
>> some space."?
>> 
>
> We may not mention GICv2 since GICv3/v4 are already mentioned. It's a
> good idea to mention that the maximum number of CPUs is reduced when
> it's turned off. I will have something like below in next respin if
> you agree.
>
> highmem-redists
>    Set ``on``/``off`` to enable/disable the high memroy region for GICv3 or
>    GICv4 redistributor. The default is ``on``. Setting this to ``off`` will
>    limit the maximum number of CPUs when GICv3 or GICv4 is used.

OK, sounds reasonable to me.

>
> Since 'vms->highmem_redists' is changeable, the 'virt_max_cpus' in
> machvirt_init() needs to be recalculated based on that. The code change
> will be included into next respin. Besides, the follow-up error message
> will be improved to something like below.
>
>    error_report("Number of SMP CPUs requested (%d) exceeds max CPUs "
>                 "supported by machine 'mach-virt' (%d). The high memory "
>                 "region for GICv3 or GICv4 redistributor has been %s",
>                 max_cpus, virt_max_cpus,
>                 vms->highmem_redists ? "enabled" : "disabled");

Hm, the doc for error_report() states that "The resulting message should
be a single phrase, with no newline or trailing punctuation." Maybe

    if (max_cpus > virt_max_cpus) {
        error_report("Number of SMP CPUs requested (%d) exceeds max CPUs "
                     "supported by machine 'mach-virt' (%d)",
                     max_cpus, virt_max_cpus);
        if (vms->gic_version != VIRT_GIC_VERSION_2 &&
            !vms->higmem_redists) {
            error_printf("Try 'highmem-redists=on' for more CPUs\n");
        }
        exit(1);
    }


