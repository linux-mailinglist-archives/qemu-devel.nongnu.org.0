Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9358247BDB5
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 10:50:08 +0100 (CET)
Received: from localhost ([::1]:42610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzbmZ-0001Js-Cv
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 04:50:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1mzblG-0000cs-Db
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 04:48:46 -0500
Received: from smtp-out2.suse.de ([195.135.220.29]:33090)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1mzblE-0004Jj-Kz
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 04:48:46 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B54F41F3A6;
 Tue, 21 Dec 2021 09:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1640080121; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AVwuqnDtkJzQ0w1pl+9OwwW2fyKRFrI+gJf1ZVsVA84=;
 b=qpHLErM1AhGJ6WC35BnDk5nqUkLYG7QG7fHvfzq9aD9rM2yuSePE6KgtD1g9Vm54k7QDgP
 hEO4dxybi79S9vR+G7z1MC3jvRtmkwStM2I+EmEqZuiAxMu5UGOfk3iRECFxMm3/d4BOPo
 iRW9fcGKKfcuhDI04StsUxD2xD277qk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1640080121;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AVwuqnDtkJzQ0w1pl+9OwwW2fyKRFrI+gJf1ZVsVA84=;
 b=DvNdqSA96aIRnXOcYrf6t5kdgRoqMO/rx/zR6pynyiajZDhqZf0FFIFNp0Ir9yWYJ5Aw0F
 hRxBzI3b7w5xRLBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7A9F513A5F;
 Tue, 21 Dec 2021 09:48:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id oyIDHPmiwWFHTAAAMHmgww
 (envelope-from <cfontana@suse.de>); Tue, 21 Dec 2021 09:48:41 +0000
Subject: Re: [PATCH] scsi-generic: replace logical block count of response of
 READ CAPACITY
To: pbonzini@redhat.com, fam@euphon.net
References: <20211120101512.7770-1-lma@suse.com>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <8ac2bf20-1dc4-7153-4287-ca01bd84d213@suse.de>
Date: Tue, 21 Dec 2021 10:48:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20211120101512.7770-1-lma@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.29; envelope-from=cfontana@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -63
X-Spam_score: -6.4
X-Spam_bar: ------
X-Spam_report: (-6.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.012,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: Hannes Reinecke <hare@suse.com>, qemu-devel@nongnu.org,
 Lin Ma <lma@suse.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Paolo, Hannes,

any thoughts on the following issue?

Introduction:

When using SAN storage for providing block devices to guests, configured as SCSI-passthrough devices, increasing the space available in the VM is a use case.

To do it, it is currently necessary to:

1) expand storage on the actual SAN,
2) run a "virsh blockresize" or equivalent command to make QEMU aware of the new size, and finally
3) do a "rescan-scsi-bus.sh" or equivalent operation in the guest to make the running guest aware of the increased disk size.

The problem:

As of now, the administrator needs to make sure that step 3 won't be done before step 2 has been executed, or the resulting state will be inconsistent.
In practice this creates organizational issues to try to sync up host/storage admins and guest OS admin, and is therefore error prone (due to these human factors).

The proposal:

The patch I replied to here from Ma Lin tries to avoid the inconsistent state, by having "rescan-scsi-bus.sh" still report the old size in the guest until QEMU itself is aware of the new disk size.

The patch:

Before the patch, the SCSI READ_CAPACITY command in the guest os directly receives the unmodified response from the storage backend.

After the patch, QEMU intercepts the READ_CAPACITY response and replaces the maximum LBA with the information which is saved in QEMU.

This means: after resizing the storage on the SAN backend, the host administrator must explicitly notify about CAPACITY HAS CHANGED by issuing a block resize command through QMP or libvirt,
even for SCSI passthrough disks.

Any ideas on this patch or on possible alternatives?

Thanks,

Claudio


On 11/20/21 11:15 AM, Lin Ma wrote:
> While using SCSI passthrough, Following scenario makes qemu doesn't
> realized the capacity change of remote scsi target:
> 1. online resize the scsi target.
> 2. issue 'rescan-scsi-bus.sh -s ...' in host.
> 3. issue 'rescan-scsi-bus.sh -s ...' in vm.
> 
> In above scenario I used to experienced errors while accessing the
> additional disk space in vm. I think the reasonable operations should
> be:
> 1. online resize the scsi target.
> 2. issue 'rescan-scsi-bus.sh -s ...' in host.
> 3. issue 'block_resize' via qmp to notify qemu.
> 4. issue 'rescan-scsi-bus.sh -s ...' in vm.
> 
> The errors disappear once I notify qemu by block_resize via qmp.
> 
> So this patch replaces the number of logical blocks of READ CAPACITY
> response from scsi target by qemu's bs->total_sectors. If the user in
> vm wants to access the additional disk space, The administrator of
> host must notify qemu once resizeing the scsi target.
> 
> Bonus is that domblkinfo of libvirt can reflect the consistent capacity
> information between host and vm in case of missing block_resize in qemu.
> E.g:
> ...
>     <disk type='block' device='lun'>
>       <driver name='qemu' type='raw'/>
>       <source dev='/dev/sdc' index='1'/>
>       <backingStore/>
>       <target dev='sda' bus='scsi'/>
>       <alias name='scsi0-0-0-0'/>
>       <address type='drive' controller='0' bus='0' target='0' unit='0'/>
>     </disk>
> ...
> 
> Before:
> 1. online resize the scsi target.
> 2. host:~  # rescan-scsi-bus.sh -s /dev/sdc
> 3. guest:~ # rescan-scsi-bus.sh -s /dev/sda
> 4  host:~  # virsh domblkinfo --domain $DOMAIN --human --device sda
> Capacity:       4.000 GiB
> Allocation:     0.000 B
> Physical:       8.000 GiB
> 
> 5. guest:~ # lsblk /dev/sda
> NAME   MAJ:MIN RM SIZE RO TYPE MOUNTPOINT
> sda      8:0    0   8G  0 disk
> └─sda1   8:1    0   2G  0 part
> 
> After:
> 1. online resize the scsi target.
> 2. host:~  # rescan-scsi-bus.sh -s /dev/sdc
> 3. guest:~ # rescan-scsi-bus.sh -s /dev/sda
> 4  host:~  # virsh domblkinfo --domain $DOMAIN --human --device sda
> Capacity:       4.000 GiB
> Allocation:     0.000 B
> Physical:       8.000 GiB
> 
> 5. guest:~ # lsblk /dev/sda
> NAME   MAJ:MIN RM SIZE RO TYPE MOUNTPOINT
> sda      8:0    0   4G  0 disk
> └─sda1   8:1    0   2G  0 part
> 
> Signed-off-by: Lin Ma <lma@suse.com>
> ---
>  hw/scsi/scsi-generic.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/scsi/scsi-generic.c b/hw/scsi/scsi-generic.c
> index 0306ccc7b1..343b51c2c0 100644
> --- a/hw/scsi/scsi-generic.c
> +++ b/hw/scsi/scsi-generic.c
> @@ -315,11 +315,17 @@ static void scsi_read_complete(void * opaque, int ret)
>      if (r->req.cmd.buf[0] == READ_CAPACITY_10 &&
>          (ldl_be_p(&r->buf[0]) != 0xffffffffU || s->max_lba == 0)) {
>          s->blocksize = ldl_be_p(&r->buf[4]);
> -        s->max_lba = ldl_be_p(&r->buf[0]) & 0xffffffffULL;
> +        BlockBackend *blk = s->conf.blk;
> +        BlockDriverState *bs = blk_bs(blk);
> +        s->max_lba = bs->total_sectors - 1;
> +        stl_be_p(&r->buf[0], s->max_lba);
>      } else if (r->req.cmd.buf[0] == SERVICE_ACTION_IN_16 &&
>                 (r->req.cmd.buf[1] & 31) == SAI_READ_CAPACITY_16) {
>          s->blocksize = ldl_be_p(&r->buf[8]);
> -        s->max_lba = ldq_be_p(&r->buf[0]);
> +        BlockBackend *blk = s->conf.blk;
> +        BlockDriverState *bs = blk_bs(blk);
> +        s->max_lba = bs->total_sectors - 1;
> +        stq_be_p(&r->buf[0], s->max_lba);
>      }
>      blk_set_guest_block_size(s->conf.blk, s->blocksize);
>  
> 


