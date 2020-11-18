Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B612B759D
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 06:19:10 +0100 (CET)
Received: from localhost ([::1]:59948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfFs5-0002OM-Ch
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 00:19:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1kfFr9-0001zF-Rc
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 00:18:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:55371)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1kfFr6-0001S6-Lu
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 00:18:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605676686;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H80xTT/If52xYm2Cf+wqujtNbekMdRf0VklelR0JXkw=;
 b=PkuCBtqN57f/ASBK/RqYBfis2JF/UhR/ylWY01J30TYDwpy+p5efOOEBbR/t8jp6vYJ6hH
 twDXPRa7sYnlWw/F36tdj1YMvViNuN0C7AWatS/7zNevBK9AHVuOogjzmt/iD5XrEmJcEG
 ho1M3kVwInlEuCmxN0fpf0btodtULww=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-562-8VjkYBvUMCmWoVECWtCZPw-1; Wed, 18 Nov 2020 00:18:03 -0500
X-MC-Unique: 8VjkYBvUMCmWoVECWtCZPw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C87DE804755;
 Wed, 18 Nov 2020 05:18:01 +0000 (UTC)
Received: from [10.72.13.172] (ovpn-13-172.pek2.redhat.com [10.72.13.172])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9B5F860C04;
 Wed, 18 Nov 2020 05:17:51 +0000 (UTC)
Subject: Re: [PATCH 00/10] vhost/qemu: thread per IO SCSI vq
To: Stefan Hajnoczi <stefanha@redhat.com>,
 Mike Christie <michael.christie@oracle.com>
References: <1605223150-10888-1-git-send-email-michael.christie@oracle.com>
 <20201117164043.GS131917@stefanha-x1.localdomain>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <bba47572-bec9-794f-5a70-d7f016267022@redhat.com>
Date: Wed, 18 Nov 2020 13:17:50 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201117164043.GS131917@stefanha-x1.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 19:41:43
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: fam@euphon.net, linux-scsi@vger.kernel.org, mst@redhat.com,
 qemu-devel@nongnu.org, virtualization@lists.linux-foundation.org,
 target-devel@vger.kernel.org, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2020/11/18 上午12:40, Stefan Hajnoczi wrote:
> On Thu, Nov 12, 2020 at 05:18:59PM -0600, Mike Christie wrote:
>> The following kernel patches were made over Michael's vhost branch:
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git/log/?h=vhost
>>
>> and the vhost-scsi bug fix patchset:
>>
>> https://lore.kernel.org/linux-scsi/20201112170008.GB1555653@stefanha-x1.localdomain/T/#t
>>
>> And the qemu patch was made over the qemu master branch.
>>
>> vhost-scsi currently supports multiple queues with the num_queues
>> setting, but we end up with a setup where the guest's scsi/block
>> layer can do a queue per vCPU and the layers below vhost can do
>> a queue per CPU. vhost-scsi will then do a num_queue virtqueues,
>> but all IO gets set on and completed on a single vhost-scsi thread.
>> After 2 - 4 vqs this becomes a bottleneck.
>>
>> This patchset allows us to create a worker thread per IO vq, so we
>> can better utilize multiple CPUs with the multiple queues. It
>> implments Jason's suggestion to create the initial worker like
>> normal, then create the extra workers for IO vqs with the
>> VHOST_SET_VRING_ENABLE ioctl command added in this patchset.
> How does userspace find out the tids and set their CPU affinity?
>
> What is the meaning of the new VHOST_SET_VRING_ENABLE ioctl? It doesn't
> really "enable" or "disable" the vq, requests are processed regardless.


Actually I think it should do the real "enable/disable" that tries to 
follow the virtio spec.

(E.g both PCI and MMIO have something similar).


>
> The purpose of the ioctl isn't clear to me because the kernel could
> automatically create 1 thread per vq without a new ioctl.


It's not necessarily to create or destroy kthread according to 
VRING_ENABLE but could be a hint.


>   On the other
> hand, if userspace is supposed to control worker threads then a
> different interface would be more powerful:
>
>    struct vhost_vq_worker_info {
>        /*
>         * The pid of an existing vhost worker that this vq will be
>         * assigned to. When pid is 0 the virtqueue is assigned to the
>         * default vhost worker. When pid is -1 a new worker thread is
>         * created for this virtqueue. When pid is -2 the virtqueue's
>         * worker thread is unchanged.
>         *
>         * If a vhost worker no longer has any virtqueues assigned to it
>         * then it will terminate.
>         *
>         * The pid of the vhost worker is stored to this field when the
>         * ioctl completes successfully. Use pid -2 to query the current
>         * vhost worker pid.
>         */
>        __kernel_pid_t pid;  /* in/out */
>
>        /* The virtqueue index*/
>        unsigned int vq_idx; /* in */
>    };
>
>    ioctl(vhost_fd, VHOST_SET_VQ_WORKER, &info);


This seems to leave the question to userspace which I'm not sure it's 
good since it tries to introduce another scheduling layer.

Per vq worker seems be good enough to start with.

Thanks


>
> Stefan


