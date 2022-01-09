Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0EFC488835
	for <lists+qemu-devel@lfdr.de>; Sun,  9 Jan 2022 07:20:30 +0100 (CET)
Received: from localhost ([::1]:59954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6RZ7-0007mp-8f
	for lists+qemu-devel@lfdr.de; Sun, 09 Jan 2022 01:20:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1n6RWM-0006za-Ij
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 01:17:38 -0500
Received: from mailout07.t-online.de ([194.25.134.83]:37780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1n6RWK-0007Sb-II
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 01:17:38 -0500
Received: from fwd78.dcpf.telekom.de (fwd78.aul.t-online.de [10.223.144.104])
 by mailout07.t-online.de (Postfix) with SMTP id 135B7295A;
 Sun,  9 Jan 2022 07:17:32 +0100 (CET)
Received: from [192.168.211.200] ([46.86.48.20]) by fwd78.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1n6RWF-0GWrHF0; Sun, 9 Jan 2022 07:17:31 +0100
Message-ID: <2ebfb2e7-bd51-d5ee-7e17-7cec59a0f0d5@t-online.de>
Date: Sun, 9 Jan 2022 07:17:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PULL v3 12/55] virtio-pci: add support for configure interrupt
Content-Language: en-US
To: Cindy Lu <lulu@redhat.com>
References: <20220108003423.15830-1-mst@redhat.com>
 <20220108003423.15830-13-mst@redhat.com>
From: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>
In-Reply-To: <20220108003423.15830-13-mst@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TOI-EXPURGATEID: 150726::1641709051-0000AD4E-FEF565CB/0/0 CLEAN NORMAL
X-TOI-MSGID: 7ac2fbeb-809b-49c1-aac6-1bda2792251d
Received-SPF: none client-ip=194.25.134.83; envelope-from=vr_qemu@t-online.de;
 helo=mailout07.t-online.de
X-Spam_score_int: -60
X-Spam_score: -6.1
X-Spam_bar: ------
X-Spam_report: (-6.1 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-4.199, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

> From: Cindy Lu <lulu@redhat.com>
>
> Add support for configure interrupt, The process is used kvm_irqfd_assign
> to set the gsi to kernel. When the configure notifier was signal by
> host, qemu will inject a msix interrupt to guest
>
> Signed-off-by: Cindy Lu <lulu@redhat.com>
> Message-Id: <20211104164827.21911-11-lulu@redhat.com>
> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> ---
>   hw/virtio/virtio-pci.h |  4 +-
>   hw/virtio/virtio-pci.c | 92 ++++++++++++++++++++++++++++++++++++------
>   2 files changed, 83 insertions(+), 13 deletions(-)
>

Since this commit I see the following warnings.

With -drive 
if=virtio,id=disk1,file=/srv/cdimg/Linux/images/opensuse.qcow2,discard=unmap

qemu-system-x86_64: virtio-blk failed to set guest notifier (-16), 
ensure -accel kvm is set.
qemu-system-x86_64: virtio_bus_start_ioeventfd: failed. Fallback to 
userspace (slower).

With libvirt
     <controller type='pci' index='1' model='pcie-root-port'>
       <address type='pci' domain='0x0000' bus='0x00' slot='0x1c' 
function='0'
        multifunction='on'/>
     </controller>
     <controller type='pci' index='2' model='pcie-root-port'>
       <address type='pci' domain='0x0000' bus='0x00' slot='0x1c' 
function='1'/>
     </controller>
     <controller type='scsi' index='0' model='virtio-scsi'>
       <driver queues='4'/>
       <address type='pci' domain='0x0000' bus='0x01' slot='0x00' 
function='0'/>
     </controller>
     <disk type='block' device='disk'>
       <driver name='qemu' type='raw' cache='none' discard='unmap' 
io='io_uring'/>
       <source dev='/dev/vgtmp/lnxpowerm1'/>
       <target dev='sda' bus='scsi'/>
       <address type='drive' controller='0' bus='0' unit='0'/>
       <boot order='1'/>
     </disk>

2022-01-08T17:45:26.911491Z qemu-system-x86_64: virtio-scsi: Failed to 
set guest notifiers (-16), ensure -accel kvm is set.
2022-01-08T17:45:26.911505Z qemu-system-x86_64: 
virtio_bus_start_ioeventfd: failed. Fallback to userspace (slower).

The messages appear around the time the Linux guest initializes the drivers.

With best regards,
Volker

