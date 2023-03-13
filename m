Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E6B6B73AC
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 11:19:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbfGo-0005na-UT; Mon, 13 Mar 2023 06:19:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clopez@suse.de>)
 id 1pbfGn-0005nL-5r; Mon, 13 Mar 2023 06:19:09 -0400
Received: from smtp-out2.suse.de ([2001:67c:2178:6::1d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <clopez@suse.de>)
 id 1pbfGl-0005LD-IA; Mon, 13 Mar 2023 06:19:08 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 739761FD86;
 Mon, 13 Mar 2023 10:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1678702744; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5o9O9kHA8ttQmaRPTm2UOgL1cuysPDXDUINQW19l9M4=;
 b=w2nsLRvcbAhoub6sXI9KlY27V+woejbRxfZxEsISjGwngkdcMbVUcEe3e1TanvBPtCDccN
 CRGQY5X9OyPdM8rpLaIFsoCd5j31jk02brLIW/Id6dDtz1OobMt7iFWlSncst0YLU837z2
 WdG16FdJ6UYMYhxgGDlYcHfmL6cDmm4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1678702744;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5o9O9kHA8ttQmaRPTm2UOgL1cuysPDXDUINQW19l9M4=;
 b=VjBotcErGSof85q9fAcnCrqGH61mhalL09sBOIyfu9ugZFqLZ+19qsJoCuDsGM4TV59jsn
 9NkLhWkx3QycDrCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E5C0113582;
 Mon, 13 Mar 2023 10:19:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 1El6NZf4DmS2OgAAMHmgww
 (envelope-from <clopez@suse.de>); Mon, 13 Mar 2023 10:19:03 +0000
Message-ID: <5eb8bbd4-2d02-002d-6e68-a123b2da2a70@suse.de>
Date: Mon, 13 Mar 2023 11:19:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] virtio: refresh vring region cache after updating a
 virtqueue size
Content-Language: en-US
To: Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org
Cc: Halil Pasic <pasic@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, "open list:virtio-ccw"
 <qemu-s390x@nongnu.org>
References: <20230302101447.4499-1-clopez@suse.de> <875ybajjbx.fsf@redhat.com>
From: =?UTF-8?Q?Carlos_L=c3=b3pez?= <clopez@suse.de>
In-Reply-To: <875ybajjbx.fsf@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:67c:2178:6::1d; envelope-from=clopez@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 9/3/23 11:43, Cornelia Huck wrote:
> On Thu, Mar 02 2023, Carlos López <clopez@suse.de> wrote:
>> Fix this by calling virtio_queue_update_rings() after
>> virtio_queue_set_num() if we are not already calling
>> virtio_queue_set_rings().
> 
> Don't we instead need to call virtio_init_region_cache() to update the
> caches? virtio_queue_set_rings() will calculate avail and used from
> desc, which looks wrong for modern devices.

I take it you meant virtio_queue_update_rings() instead of 
virtio_queue_set_rings()? Otherwise I'm not sure what you mean.

If this is the case sure - there is this same kind of logic in 
virtio_load():

             /*
              * VIRTIO-1 devices migrate desc, used, and avail ring 
addresses so
              * only the region cache needs to be set up.  Legacy 
devices need
              * to calculate used and avail ring addresses based on the desc
              * address.
              */
             if (virtio_vdev_has_feature(vdev, VIRTIO_F_VERSION_1)) {
                 virtio_init_region_cache(vdev, i);
             } else {
                 virtio_queue_update_rings(vdev, i);
             }

This will require making virtio_init_region_cache() non static of course.

>> diff --git a/hw/s390x/virtio-ccw.c b/hw/s390x/virtio-ccw.c
>> index e33e5207ab..89891ac58a 100644
>> --- a/hw/s390x/virtio-ccw.c
>> +++ b/hw/s390x/virtio-ccw.c
>> @@ -237,6 +237,7 @@ static int virtio_ccw_set_vqs(SubchDev *sch, VqInfoBlock *info,
>>                  return -EINVAL;
>>              }
>>              virtio_queue_set_num(vdev, index, num);
>> +            virtio_queue_update_rings(vdev, index);
> 
> Note that this is the non-legacy path.
>
So if I understand correctly, in virtio_mmio_write() we check via 
proxy->legacy, and in virtio_ccw_set_vqs() we are in the non-legacy 
path. What about virtio_pci_common_write()?

-- 
Carlos López
Security Engineer
SUSE Software Solutions

