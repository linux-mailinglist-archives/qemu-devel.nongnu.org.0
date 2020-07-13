Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86250219F59
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jul 2020 13:53:19 +0200 (CEST)
Received: from localhost ([::1]:52492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jtV78-0002fr-KC
	for lists+qemu-devel@lfdr.de; Thu, 09 Jul 2020 07:53:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lma@suse.de>) id 1jtV6O-0002CC-DU
 for qemu-devel@nongnu.org; Thu, 09 Jul 2020 07:52:32 -0400
Received: from mx2.suse.de ([195.135.220.15]:51314)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lma@suse.de>) id 1jtV6M-0005ZK-I1
 for qemu-devel@nongnu.org; Thu, 09 Jul 2020 07:52:32 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 89EA4ADD7;
 Thu,  9 Jul 2020 11:52:27 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date: Thu, 09 Jul 2020 11:52:27 +0000
From: Lin Ma <lma@suse.de>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: Questions about online resizing a lun passthrough disk with
 virtio-scsi
In-Reply-To: <a1d96da7-444e-d3b0-abd5-63cdab92e869@redhat.com>
References: <af3e33e4a5bb15d9f0b30c8de4941a37@suse.de>
 <a1d96da7-444e-d3b0-abd5-63cdab92e869@redhat.com>
User-Agent: Roundcube Webmail
Message-ID: <bb1050f276b9f0a6447f64f1e31b69c9@suse.de>
X-Sender: lma@suse.de
Received-SPF: pass client-ip=195.135.220.15; envelope-from=lma@suse.de;
 helo=mx2.suse.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/07 17:20:38
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x (no timestamps) [generic]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2020-07-08 15:11, Paolo Bonzini wrote:
> On 08/07/20 16:44, lma wrote:
>> 
>> Is the 'block_resize' mandatory to notify guest os after online 
>> resizing
>> a lun passed through disk? I'm curious it because I found there're 
>> couple
>> of ways can make guest os realize the disk capacity change.
>> e.g:
>> * run 'block_resize' via qmp to let virtio-scsi notify the frontend 
>> about
>>   capacity change.
>> * run 'rescan-scsi-bus.sh -s' inside guest.
>> * run 'sg_readcap --16 /dev/sda' inside guest.
>> 
>> I knew that the purpose of 'block_resize' is not only to notify guest 
>> os,
>> but also to update some internal structure's member, say 
>> bs->total_sectors.
>> What if I forgot to run 'block_resize', but run 'rescan-scsi-bus.sh 
>> -s'
>> in guest?
> 
> Request start and length are checked even for passthrough disks (see
> scsi_disk_dma_command in hw/scsi/scsi-disk.c, called by
> scsi_block_dma_command), but the maximum LBA is snooped from READ
> CAPACITY commands (see scsi_read_complete in hw/scsi/scsi-generic.c).
> So as long as rescan-scsi-bus.sh results in a READ CAPACITY command, it
> should work.

Yeah, the rescan-scsi-bus.sh does result in a READ CAPACITY command.

> It's not recommended however, because block_resize will report the
> change to the guest directly with a CAPACITY HAS CHANGED unit attention
> condition.

Got it, The 'block_resize' is the recommended or necessary step, Even 
for
passthrough disk online resizing.

Thanks for your information,
Lin

