Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B56A94045EE
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 09:05:40 +0200 (CEST)
Received: from localhost ([::1]:46938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOE7v-0002wh-OI
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 03:05:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hare@suse.de>)
 id 1mOE5T-0000hI-FL; Thu, 09 Sep 2021 03:03:07 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:54118)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hare@suse.de>)
 id 1mOE5P-0002xa-CT; Thu, 09 Sep 2021 03:03:07 -0400
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 3C2191FDD5;
 Thu,  9 Sep 2021 07:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1631170980; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JiDLNTmOPJW1NKzieJqO7dJLa4BxN9E9mqOfKBlPpR8=;
 b=WO/rpFOmT4o6A7/OhY5rpuLKWFD1Vdco4GNygfnxLlan3Kx+DAg964Mka/mAtzi0lfzWBf
 LYElVORlDUUN5zXmKUc29dTk9qQlV88DQeeSwgeYZ4RQrM70k8CXqvsFDNCroegcSk03vx
 MzZGN1yvv+2nUFqyrPyNDmve7TVdGqg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1631170980;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JiDLNTmOPJW1NKzieJqO7dJLa4BxN9E9mqOfKBlPpR8=;
 b=wpzSk8uoW1+HgjCZ019SFxy1yhqYgqmPysM2Sf+vQcgu5qleZKXuwJ7sPvHJQcB7t0exND
 WwVvqIhr9UfV5UCQ==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 0DFEE13A61;
 Thu,  9 Sep 2021 07:03:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id rK7HAqSxOWHZYgAAGKfGzw
 (envelope-from <hare@suse.de>); Thu, 09 Sep 2021 07:03:00 +0000
Subject: Re: [PULL for-6.1 06/11] hw/nvme: fix controller hot unplugging
To: Klaus Jensen <its@irrelevant.dk>, Peter Maydell
 <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20210726191901.4680-1-its@irrelevant.dk>
 <20210726191901.4680-7-its@irrelevant.dk>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <699ace8a-4d92-c9ee-d844-0e5d80edc4d6@suse.de>
Date: Thu, 9 Sep 2021 09:02:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210726191901.4680-7-its@irrelevant.dk>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.29; envelope-from=hare@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -62
X-Spam_score: -6.3
X-Spam_bar: ------
X-Spam_report: (-6.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.922,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/26/21 9:18 PM, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
> 
> Prior to this patch the nvme-ns devices are always children of the
> NvmeBus owned by the NvmeCtrl. This causes the namespaces to be
> unrealized when the parent device is removed. However, when subsystems
> are involved, this is not what we want since the namespaces may be
> attached to other controllers as well.
> 
> This patch adds an additional NvmeBus on the subsystem device. When
> nvme-ns devices are realized, if the parent controller device is linked
> to a subsystem, the parent bus is set to the subsystem one instead. This
> makes sure that namespaces are kept alive and not unrealized.
> 
> Reviewed-by: Hannes Reinecke <hare@suse.de>
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> ---
>   hw/nvme/nvme.h   | 15 ++++++++-------
>   hw/nvme/ctrl.c   | 14 ++++++--------
>   hw/nvme/ns.c     | 18 ++++++++++++++++++
>   hw/nvme/subsys.c |  3 +++
>   4 files changed, 35 insertions(+), 15 deletions(-)
> 
Finally got around to test this; sadly, with mixed results.
On the good side: controller hotplug works.
Within qemu monitor I can do:

device_del <devname>
device_add <device description>

and OS reports:
[   56.564447] pcieport 0000:00:09.0: pciehp: Slot(0-2): Attention 
button pressed
[   56.564460] pcieport 0000:00:09.0: pciehp: Slot(0-2): Powering off 
due to button press
[  104.293335] pcieport 0000:00:09.0: pciehp: Slot(0-2): Attention 
button pressed
[  104.293347] pcieport 0000:00:09.0: pciehp: Slot(0-2) Powering on due 
to button press
[  104.293540] pcieport 0000:00:09.0: pciehp: Slot(0-2): Card present
[  104.293544] pcieport 0000:00:09.0: pciehp: Slot(0-2): Link Up
[  104.428961] pci 0000:03:00.0: [1b36:0010] type 00 class 0x010802
[  104.429298] pci 0000:03:00.0: reg 0x10: [mem 0x00000000-0x00003fff 64bit]
[  104.431442] pci 0000:03:00.0: BAR 0: assigned [mem 
0xc1200000-0xc1203fff 64bit]
[  104.431580] pcieport 0000:00:09.0: PCI bridge to [bus 03]
[  104.431604] pcieport 0000:00:09.0:   bridge window [io  0x7000-0x7fff]
[  104.434815] pcieport 0000:00:09.0:   bridge window [mem 
0xc1200000-0xc13fffff]
[  104.436685] pcieport 0000:00:09.0:   bridge window [mem 
0x804000000-0x805ffffff 64bit pref]
[  104.441896] nvme nvme2: pci function 0000:03:00.0
[  104.442151] nvme 0000:03:00.0: enabling device (0000 -> 0002)
[  104.455821] nvme nvme2: 1/0/0 default/read/poll queues

So that works.
But: the namespace is not reconnected.

# nvme list-ns /dev/nvme2

draws a blank. So guess some fixup patch is in order...

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                Kernel Storage Architect
hare@suse.de                              +49 911 74053 688
SUSE Software Solutions GmbH, Maxfeldstr. 5, 90409 Nürnberg
HRB 36809 (AG Nürnberg), Geschäftsführer: Felix Imendörffer

