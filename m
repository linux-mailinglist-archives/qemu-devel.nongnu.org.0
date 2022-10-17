Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1E1D6012AC
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 17:23:52 +0200 (CEST)
Received: from localhost ([::1]:58346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okRy3-0008Sw-2d
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 11:23:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1okRvc-0006hU-AR
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 11:21:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54232)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1okRvZ-0005Ey-Bu
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 11:21:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666020071;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=for7iQB1PGtbIUW0+HjjHWIA4Z9lpYnPXli5JtxSp0o=;
 b=OSZcIhH+nZ4AsyX4nLvxZMlTOpPUncA+NWtJPYeN8Z+TLskrniO/3fiphlpaLUX/HjxR5X
 QJ+S1aUSah1OxtkzRzm6Wg7UNcoxAnXPleOHSul7OQqHJVL5x2b+XH/MDL3jFrlDxLLa4O
 h0TQd4kvb2/eKvH5OoOXWqRHBgy13O0=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-86-8vDCLXI2MSegI1_S_l7swA-1; Mon, 17 Oct 2022 11:21:10 -0400
X-MC-Unique: 8vDCLXI2MSegI1_S_l7swA-1
Received: by mail-il1-f197.google.com with SMTP id
 f15-20020a056e020b4f00b002fa34db70f0so9170330ilu.2
 for <qemu-devel@nongnu.org>; Mon, 17 Oct 2022 08:21:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=for7iQB1PGtbIUW0+HjjHWIA4Z9lpYnPXli5JtxSp0o=;
 b=i57ZnwXBMdCXRRSyhOQs6JBsAz9EkKcIwPNaKO3qx1rgx1KqDCQQdX1O5TCyT2NTZE
 TDDAZ6H13PLz/4uk7PW8sYIhgUzG98hqGJV80vqXGOiC1MbtW378befUtjHLFJBLKncC
 nz06OqASuuhuhVN8tPeisFKHkQZNDpO6AjA6N47QRYziPmZr/qwpOhI3nZmyI6NFQ348
 uF/aJ9aKry/N0NVYNugQzZVxdyGgqbM2U+I+iN9EIZ1vYkZrtyaKfi3wI8y8fvoRj5SP
 dyq7tmiBAYuEQHKXlpOwyAIYh4ZEplVojefLuUd/0oxwpyaBZ0BPeQ0onOZO4Tak4xcg
 4IQg==
X-Gm-Message-State: ACrzQf2xnkgMHI44M4/x6AS3YpMe7aDO84FH9ITbhrhPhL61nxZXwsMZ
 2YlB+kIQNKCl4KvlwjSP1PsWqhB/78XjdZ2ALkKb3Mpyt0uRhXTDCYaJXOInJLAGn/T5CJyx84a
 oeqNMpgkb3YhfMaA=
X-Received: by 2002:a92:c265:0:b0:2f9:ec63:2e3e with SMTP id
 h5-20020a92c265000000b002f9ec632e3emr4963386ild.275.1666020069605; 
 Mon, 17 Oct 2022 08:21:09 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7HNsoVlk+hWpcTzVPOZyr9nt1H7xM14yq7UobSMU+VJwkUnPhpoRDNSWZHosFeTAfCr98kfQ==
X-Received: by 2002:a92:c265:0:b0:2f9:ec63:2e3e with SMTP id
 h5-20020a92c265000000b002f9ec632e3emr4963367ild.275.1666020069333; 
 Mon, 17 Oct 2022 08:21:09 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 g12-20020a056602072c00b006a514f67f38sm22081iox.28.2022.10.17.08.21.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Oct 2022 08:21:08 -0700 (PDT)
Date: Mon, 17 Oct 2022 09:21:05 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Andrey Ryabinin <arbn@yandex-team.com>
Cc: qemu-devel@nongnu.org, Steve Sistare <steven.sistare@oracle.com>,
 yc-core@yandex-team.ru, Tony Krowiak <akrowiak@linux.ibm.com>, Halil Pasic
 <pasic@linux.ibm.com>, Jason Herne <jjherne@linux.ibm.com>, Cornelia Huck
 <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>, Eric Farman
 <farman@linux.ibm.com>, Matthew Rosato <mjrosato@linux.ibm.com>, Paolo
 Bonzini <pbonzini@redhat.com>, "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?="
 <berrange@redhat.com>, Eduardo Habkost <eduardo@habkost.net>, Eric Blake
 <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>, Cleber Rosa
 <crosa@redhat.com>, Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?=
 <f4bug@amsat.org>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: Re: [PATCH 0/4] Allow to pass pre-created VFIO container/group to QEMU
Message-ID: <20221017092105.0476385c.alex.williamson@redhat.com>
In-Reply-To: <20221017105407.3858-1-arbn@yandex-team.com>
References: <20221017105407.3858-1-arbn@yandex-team.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 17 Oct 2022 13:54:03 +0300
Andrey Ryabinin <arbn@yandex-team.com> wrote:

> These patches add possibility to pass VFIO device to QEMU using file
> descriptors of VFIO container/group, instead of creating those by QEMU.
> This allows to take away permissions to open /dev/vfio/* from QEMU and
> delegate that to managment layer like libvirt.
> 
> The VFIO API doen't allow to pass just fd of device, since we also need to have
> VFIO container and group. So these patches allow to pass created VFIO container/group
> to QEMU via command line/QMP, e.g. like this:
>             -object vfio-container,id=ct,fd=5 \
>             -object vfio-group,id=grp,fd=6,container=ct \
>             -device vfio-pci,host=05:00.0,group=grp

This suggests that management tools need to become intimately familiar
with container and group association restrictions for implicit
dependencies, such as device AddressSpace.  We had considered this
before and intentionally chosen to allow QEMU to manage that
relationship.  Things like PCI bus type and presence of a vIOMMU factor
into these relationships.

In the above example, what happens in a mixed environment, for example
if we then add '-device vfio-pci,host=06:00.0' to the command line?
Isn't QEMU still going to try to re-use the container if it exists in
the same address space?  Potentially this device could also be a member
of the same group.  How would the management tool know when to expect
the provided fds be released?

We also have an outstanding RFC for iommufd that already proposes an fd
passing interface, where iommufd removes many of the issues of the vfio
container by supporting multiple address spaces within a single fd
context, avoiding the duplicate locked page accounting issues between
containers, and proposing a direct device fd interface for vfio.  Why at
this point in time would we choose to expand the QEMU vfio interface in
this way?  Thanks,

Alex

> A bit more detailed example can be found in the test:
> tests/avocado/vfio.py
> 
>  *Possible future steps*
> 
> Also these patches could be a step for making local migration (within one host)
> of the QEMU with VFIO devices.
> I've built some prototype on top of these patches to try such idea.
> In short the scheme of such migration is following:
>  - migrate source VM to file.
>  - retrieve fd numbers of VFIO container/group/device via new property and qom-get command
>  - get the actual file descriptor via SCM_RIGHTS using new qmp command 'returnfd' which
>    sends fd from QEMU by the number: { 'command': 'returnfd', 'data': {'fd': 'int'}}
>  - shutdown source VM
>  - launch destination VM, plug VFIO devices using obtained file descriptors.
>  - PCI device reset duriing plugging the device avoided with the help of new parameter
>     on vfio-pci device.
> This is alternative to 'cpr-exec' migration scheme proposed here:
>    https://lore.kernel.org/qemu-devel/1658851843-236870-1-git-send-email-steven.sistare@oracle.com/
> Unlike cpr-exec it doesn't require new kernel flags VFIO_DMA_UNMAP_FLAG_VADDR/VFIO_DMA_MAP_FLAG_VADDR
> And doesn't require new migration mode, just some additional steps from management layer.
> 
> 
> Andrey Ryabinin (4):
>   vfio: add vfio-container user createable object
>   vfio: add vfio-group user createable object
>   vfio: Add 'group' property to 'vfio-pci' device
>   tests/avocado/vfio: add test for vfio devices
> 
>  hw/vfio/ap.c                  |   2 +-
>  hw/vfio/ccw.c                 |   2 +-
>  hw/vfio/common.c              | 471 +++++++++++++++++++++++-----------
>  hw/vfio/pci.c                 |  10 +-
>  hw/vfio/platform.c            |   2 +-
>  hw/vfio/trace-events          |   4 +-
>  include/hw/vfio/vfio-common.h |  10 +-
>  qapi/qom.json                 |  29 +++
>  tests/avocado/vfio.py         | 156 +++++++++++
>  9 files changed, 525 insertions(+), 161 deletions(-)
>  create mode 100644 tests/avocado/vfio.py
> 


