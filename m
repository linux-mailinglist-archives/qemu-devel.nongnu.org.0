Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2836A583146
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 19:53:57 +0200 (CEST)
Received: from localhost ([::1]:57704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGlEK-0005HJ-06
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 13:53:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1oGkte-0004sc-1w
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 13:32:34 -0400
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c]:46654)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1oGktc-0007xM-DN
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 13:32:33 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0E6C13EC78;
 Wed, 27 Jul 2022 17:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1658943150; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5tgx3ZeoonjHNLFfvxi4FaAkLYVWCI+M67CQIzn1QoU=;
 b=wXk3sdfHJ4+mhg5WKlGWLRzpoWAzDthFr4M2YlM3i7nHluP6Rj9EGHblT77okPaPyk/MXk
 XET2cccqYKdgKX0uwRlTKNuQe0cwpE99d7wGxZ8zLYbE3CwudZFKWrSo9KsWXWm0PQJnr3
 cSOOWcrEWbNQFSLXNPq7pjD6sI+9sc0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1658943150;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5tgx3ZeoonjHNLFfvxi4FaAkLYVWCI+M67CQIzn1QoU=;
 b=fjbUTNyzOUoeiViCmazNNFcNfSAEj6v3llV9+MOO57qWu3vgruWCFZmnpcSiOVniloTzk1
 AnjEH+1K6/ap7lAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D517113A8E;
 Wed, 27 Jul 2022 17:32:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id QL8FMq124WJ4IAAAMHmgww
 (envelope-from <cfontana@suse.de>); Wed, 27 Jul 2022 17:32:29 +0000
Message-ID: <c111d840-a10d-6374-6ee4-85d7b23b4967@suse.de>
Date: Wed, 27 Jul 2022 19:32:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] virtio-pci: don't touch pci on virtio reset
Content-Language: en-US
From: Claudio Fontana <cfontana@suse.de>
To: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <20220727161445.21428-1-mst@redhat.com>
 <c458e6cd-a18e-88e9-dcdf-5e294713ad87@suse.de>
In-Reply-To: <c458e6cd-a18e-88e9-dcdf-5e294713ad87@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:67c:2178:6::1c;
 envelope-from=cfontana@suse.de; helo=smtp-out1.suse.de
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

Hmm, no that's not it,
still segfault in ovs, but I'll try to see if I can merge that and the workaround I am currently using...


On 7/27/22 19:14, Claudio Fontana wrote:
> testing it now...
> 
> Thanks!
> 
> C
> 
> 
> On 7/27/22 18:14, Michael S. Tsirkin wrote:
>> virtio level reset should not affect pci express
>> registers such as PM, error or link.
>>
>> Fixes: 27ce0f3afc ("hw/virtio: fix Power Management Control Register for PCI Express virtio devices")
>> Fixes: d584f1b9ca ("hw/virtio: fix Link Control Register for PCI Express virtio devices")
>> Fixes: c2cabb3422 ("hw/virtio: fix error enabling flags in Device Control register")
>> Cc: "Marcel Apfelbaum" <marcel@redhat.com>
>> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
>> ---
>>  hw/virtio/virtio-pci.c | 9 ++++++++-
>>  1 file changed, 8 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
>> index 45327f0b31..3189ec014d 100644
>> --- a/hw/virtio/virtio-pci.c
>> +++ b/hw/virtio/virtio-pci.c
>> @@ -1955,6 +1955,13 @@ static void virtio_pci_reset(DeviceState *qdev)
>>          proxy->vqs[i].avail[0] = proxy->vqs[i].avail[1] = 0;
>>          proxy->vqs[i].used[0] = proxy->vqs[i].used[1] = 0;
>>      }
>> +}
>> +
>> +static void virtio_pci_bus_reset(DeviceState *qdev)
>> +{
>> +    PCIDevice *dev = PCI_DEVICE(qdev);
>> +
>> +    virtio_pci_reset(qdev);
>>  
>>      if (pci_is_express(dev)) {
>>          pcie_cap_deverr_reset(dev);
>> @@ -2022,7 +2029,7 @@ static void virtio_pci_class_init(ObjectClass *klass, void *data)
>>      k->class_id = PCI_CLASS_OTHERS;
>>      device_class_set_parent_realize(dc, virtio_pci_dc_realize,
>>                                      &vpciklass->parent_dc_realize);
>> -    dc->reset = virtio_pci_reset;
>> +    dc->reset = virtio_pci_bus_reset;
>>  }
>>  
>>  static const TypeInfo virtio_pci_info = {
> 
> 


