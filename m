Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD1034A281
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 08:26:26 +0100 (CET)
Received: from localhost ([::1]:56968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPgrR-0004mG-91
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 03:26:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lPgqE-0004Bk-Dr
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 03:25:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:49360)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lPgqB-0004Wj-Ei
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 03:25:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616743504;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UMOz22D/wLZchyycf0Tf745FSgR4hmlgIx9XeBqZFr8=;
 b=YwkmdbFZ2CajcNZyxuEKzDR/FfMLmgrS+r/I3uFE9iwxWYuY5R5kePi6kj7+gaf8F7vGQ4
 jx+nyN9SAsE/vIjp0GWegEMsFT9GcrfmopV9083rQubNaWmPDuvN8mtK1kAkNCo+W23cMz
 XfXutLvrxlWCdN4d9x6mIsLkjPlUECk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-576-0qLjHhocPXyymIDddRKLeQ-1; Fri, 26 Mar 2021 03:25:01 -0400
X-MC-Unique: 0qLjHhocPXyymIDddRKLeQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A671D87A82A;
 Fri, 26 Mar 2021 07:25:00 +0000 (UTC)
Received: from wangxiaodeMacBook-Air.local (ovpn-13-10.pek2.redhat.com
 [10.72.13.10])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 59B722B88A;
 Fri, 26 Mar 2021 07:24:48 +0000 (UTC)
Subject: Re: [PATCH 0/6] Add debug interface to kick/call on purpose
To: Dongli Zhang <dongli.zhang@oracle.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org
References: <20210326054433.11762-1-dongli.zhang@oracle.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <440216a8-821f-92dd-bc8b-fb2427bdc0e6@redhat.com>
Date: Fri, 26 Mar 2021 15:24:46 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210326054433.11762-1-dongli.zhang@oracle.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_CHARSET_FARAWAY=2.45, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, fam@euphon.net, berrange@redhat.com, ehabkost@redhat.com,
 mst@redhat.com, joe.jin@oracle.com, armbru@redhat.com, dgilbert@redhat.com,
 stefanha@redhat.com, pbonzini@redhat.com, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


ÔÚ 2021/3/26 ÏÂÎç1:44, Dongli Zhang Ð´µÀ:
> The virtio device/driver (e.g., vhost-scsi or vhost-net) may hang due to
> the loss of doorbell kick, e.g.,
>
> https://lists.gnu.org/archive/html/qemu-devel/2018-12/msg01711.html
>
> ... or due to the loss of IRQ, e.g., as fixed by linux kernel commit
> fe200ae48ef5 ("genirq: Mark polled irqs and defer the real handler").
>
> This patch introduces a new debug interface 'DeviceEvent' to DeviceClass
> to help narrow down if the issue is due to loss of irq/kick. So far the new
> interface handles only two events: 'call' and 'kick'. Any device (e.g.,
> virtio/vhost or VFIO) may implement the interface (e.g., via eventfd, MSI-X
> or legacy IRQ).
>
> The 'call' is to inject irq on purpose by admin for a specific device (e.g.,
> vhost-scsi) from QEMU/host to VM, while the 'kick' is to kick the doorbell
> on purpose by admin at QEMU/host side for a specific device.
>
>
> This device can be used as a workaround if call/kick is lost due to
> virtualization software (e.g., kernel or QEMU) issue.
>
> We may also implement the interface for VFIO PCI, e.g., to write to
> VFIOPCIDevice->msi_vectors[i].interrupt will be able to inject IRQ to VM
> on purpose. This is considered future work once the virtio part is done.
>
>
> Below is from live crash analysis. Initially, the queue=2 has count=15 for
> 'kick' eventfd_ctx. Suppose there is data in vring avail while there is no
> used available. We suspect this is because vhost-scsi was not notified by
> VM. In order to narrow down and analyze the issue, we use live crash to
> dump the current counter of eventfd for queue=2.
>
> crash> eventfd_ctx ffff8f67f6bbe700
> struct eventfd_ctx {
>    kref = {
>      refcount = {
>        refs = {
>          counter = 4
>        }
>      }
>    },
>    wqh = {
>      lock = {
>        {
>          rlock = {
>            raw_lock = {
>              val = {
>                counter = 0
>              }
>            }
>          }
>        }
>      },
>      head = {
>        next = 0xffff8f841dc08e18,
>        prev = 0xffff8f841dc08e18
>      }
>    },
>    count = 15, ---> eventfd is 15 !!!
>    flags = 526336
> }
>
> Now we kick the doorbell for vhost-scsi queue=2 on purpose for diagnostic
> with this interface.
>
> { "execute": "x-debug-device-event",
>    "arguments": { "dev": "/machine/peripheral/vscsi0",
>                   "event": "kick", "queue": 2 } }
>
> The counter is increased to 16. Suppose the hang issue is resolved, it
> indicates something bad is in software that the 'kick' is lost.


What do you mean by "software" here? And it looks to me you're testing 
whether event_notifier_set() is called by virtio_queue_notify() here. If 
so, I'm not sure how much value could we gain from a dedicated debug 
interface like this consider there're a lot of exisinting general 
purpose debugging method like tracing or gdb. I'd say the path from 
virtio_queue_notify() to event_notifier_set() is only a very small 
fraction of the process of virtqueue kick which is unlikey to be buggy. 
Consider usually the ioeventfd will be offloaded to KVM, it's more a 
chance that something is wrong in setuping ioeventfd instead of here. 
Irq is even more complicated.

I think we could not gain much for introducing an dedicated mechanism 
for such a corner case.

Thanks


>
> crash> eventfd_ctx ffff8f67f6bbe700
> struct eventfd_ctx {
>    kref = {
>      refcount = {
>        refs = {
>          counter = 4
>        }
>      }
>    },
>    wqh = {
>      lock = {
>        {
>          rlock = {
>            raw_lock = {
>              val = {
>                counter = 0
>              }
>            }
>          }
>        }
>      },
>      head = {
>        next = 0xffff8f841dc08e18,
>        prev = 0xffff8f841dc08e18
>      }
>    },
>    count = 16, ---> eventfd incremented to 16 !!!
>    flags = 526336
> }
>
>
> Original RFC link:
>
> https://lists.nongnu.org/archive/html/qemu-devel/2021-01/msg03441.html
>
> Changed since RFC:
>    - add support for more virtio/vhost pci devices
>    - add log (toggled by DEBUG_VIRTIO_EVENT) to virtio.c to say that this
>      mischeivous command had been used
>    - fix grammer error (s/lost/loss/)
>    - change version to 6.1
>    - fix incorrect example in qapi/qdev.json
>    - manage event types with enum/array, instead of hard coding
>
>
> Dongli Zhang (6):
>     qdev: introduce qapi/hmp command for kick/call event
>     virtio: introduce helper function for kick/call device event
>     virtio-blk-pci: implement device event interface for kick/call
>     virtio-scsi-pci: implement device event interface for kick/call
>     vhost-scsi-pci: implement device event interface for kick/call
>     virtio-net-pci: implement device event interface for kick/call
>
>   hmp-commands.hx                 | 14 ++++++++
>   hw/block/virtio-blk.c           |  9 +++++
>   hw/net/virtio-net.c             |  9 +++++
>   hw/scsi/vhost-scsi.c            |  6 ++++
>   hw/scsi/virtio-scsi.c           |  9 +++++
>   hw/virtio/vhost-scsi-pci.c      | 10 ++++++
>   hw/virtio/virtio-blk-pci.c      | 10 ++++++
>   hw/virtio/virtio-net-pci.c      | 10 ++++++
>   hw/virtio/virtio-scsi-pci.c     | 10 ++++++
>   hw/virtio/virtio.c              | 64 ++++++++++++++++++++++++++++++++++++
>   include/hw/qdev-core.h          |  9 +++++
>   include/hw/virtio/vhost-scsi.h  |  3 ++
>   include/hw/virtio/virtio-blk.h  |  2 ++
>   include/hw/virtio/virtio-net.h  |  3 ++
>   include/hw/virtio/virtio-scsi.h |  3 ++
>   include/hw/virtio/virtio.h      |  3 ++
>   include/monitor/hmp.h           |  1 +
>   qapi/qdev.json                  | 30 +++++++++++++++++
>   softmmu/qdev-monitor.c          | 56 +++++++++++++++++++++++++++++++
>   19 files changed, 261 insertions(+)
>
>
> I did tests with below cases.
>
> - virtio-blk-pci (ioeventfd on/off, iothread, live migration)
> - virtio-scsi-pci (ioeventfd on/off)
> - vhost-scsi-pci
> - virtio-net-pci (ioeventfd on/off, vhost)
>
> Thank you very much!
>
> Dongli Zhang
>
>


