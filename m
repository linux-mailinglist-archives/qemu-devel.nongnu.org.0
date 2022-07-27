Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18427582F18
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 19:21:04 +0200 (CEST)
Received: from localhost ([::1]:54500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGkiV-0007G9-4K
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 13:21:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1oGkbu-0003De-GI
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 13:14:14 -0400
Received: from smtp-out2.suse.de ([2001:67c:2178:6::1d]:45854)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1oGkbs-000502-Og
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 13:14:14 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 5CAC7205F5;
 Wed, 27 Jul 2022 17:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1658942051; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V/kQMgPjybgQV4/zkWEz5TISL3T7Q8l2hUUYcqniy4U=;
 b=OoxZNUC1c9lNacE18kG6SFWAjuafHJR5BhKgNk3PcCohrM7lYwe9EvxfWQD7PT/iCUTPYC
 rRjYCDRFRpBy2h2QJePHCgs/ymuz2ygOErB0uKfkB9BKrGr6h0lunMwcW/Zwtb4rwtX+jZ
 QtGwSPRuSbUVF0fGbGwamOZUlPm55Kg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1658942051;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V/kQMgPjybgQV4/zkWEz5TISL3T7Q8l2hUUYcqniy4U=;
 b=UZW5pOztO3lscIGUhvxKMxb/NY526VD4rsYgMaxy7id7RtWSrrpmTIDELx+4T7MkvSsDJ8
 6XUwjUojPgPi8tDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 39E0D13A8E;
 Wed, 27 Jul 2022 17:14:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id oxRCDGNy4WJlGQAAMHmgww
 (envelope-from <cfontana@suse.de>); Wed, 27 Jul 2022 17:14:11 +0000
Message-ID: <c458e6cd-a18e-88e9-dcdf-5e294713ad87@suse.de>
Date: Wed, 27 Jul 2022 19:14:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] virtio-pci: don't touch pci on virtio reset
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel@redhat.com>
References: <20220727161445.21428-1-mst@redhat.com>
From: Claudio Fontana <cfontana@suse.de>
In-Reply-To: <20220727161445.21428-1-mst@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:67c:2178:6::1d;
 envelope-from=cfontana@suse.de; helo=smtp-out2.suse.de
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

testing it now...

Thanks!

C


On 7/27/22 18:14, Michael S. Tsirkin wrote:
> virtio level reset should not affect pci express
> registers such as PM, error or link.
> 
> Fixes: 27ce0f3afc ("hw/virtio: fix Power Management Control Register for PCI Express virtio devices")
> Fixes: d584f1b9ca ("hw/virtio: fix Link Control Register for PCI Express virtio devices")
> Fixes: c2cabb3422 ("hw/virtio: fix error enabling flags in Device Control register")
> Cc: "Marcel Apfelbaum" <marcel@redhat.com>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> ---
>  hw/virtio/virtio-pci.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
> index 45327f0b31..3189ec014d 100644
> --- a/hw/virtio/virtio-pci.c
> +++ b/hw/virtio/virtio-pci.c
> @@ -1955,6 +1955,13 @@ static void virtio_pci_reset(DeviceState *qdev)
>          proxy->vqs[i].avail[0] = proxy->vqs[i].avail[1] = 0;
>          proxy->vqs[i].used[0] = proxy->vqs[i].used[1] = 0;
>      }
> +}
> +
> +static void virtio_pci_bus_reset(DeviceState *qdev)
> +{
> +    PCIDevice *dev = PCI_DEVICE(qdev);
> +
> +    virtio_pci_reset(qdev);
>  
>      if (pci_is_express(dev)) {
>          pcie_cap_deverr_reset(dev);
> @@ -2022,7 +2029,7 @@ static void virtio_pci_class_init(ObjectClass *klass, void *data)
>      k->class_id = PCI_CLASS_OTHERS;
>      device_class_set_parent_realize(dc, virtio_pci_dc_realize,
>                                      &vpciklass->parent_dc_realize);
> -    dc->reset = virtio_pci_reset;
> +    dc->reset = virtio_pci_bus_reset;
>  }
>  
>  static const TypeInfo virtio_pci_info = {


