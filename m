Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CBBE6BB410
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Mar 2023 14:13:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcQv9-0003uf-Kx; Wed, 15 Mar 2023 09:11:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1pcQv7-0003tx-Hi
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 09:11:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1pcQv5-0007qU-57
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 09:11:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678885914;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hqWxADMCs3E+QWliNkdvDSFenM2c5G0Cx5BgRidbgxY=;
 b=Ow5fAML7R3mFRYD4tgFuie1mqu89Yb369ZLBfRBhQjkle9NscaCY0HA19+4YjJ+N0jMSsR
 t7qFlCJacThm7Tor/cAg5Alwx69ceUYb2cDYYvWQZHofJGnzAu/QIOTecFeo+kitfmQ6wv
 0l2RKsMz7fUpl3euT1KWvwZCL37EssQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-573-OuG76TbUOKqgfJqVuxP2qw-1; Wed, 15 Mar 2023 09:11:49 -0400
X-MC-Unique: OuG76TbUOKqgfJqVuxP2qw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3238D2808E6E;
 Wed, 15 Mar 2023 13:11:49 +0000 (UTC)
Received: from localhost (unknown [10.39.192.173])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C449A202701E;
 Wed, 15 Mar 2023 13:11:48 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Carlos =?utf-8?Q?L=C3=B3pez?= <clopez@suse.de>, qemu-devel@nongnu.org
Cc: Halil Pasic <pasic@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Richard Henderson
 <richard.henderson@linaro.org>, David Hildenbrand <david@redhat.com>, Ilya
 Leoshkevich <iii@linux.ibm.com>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, Thomas Huth <thuth@redhat.com>, "open
 list:virtio-ccw" <qemu-s390x@nongnu.org>
Subject: Re: [PATCH] virtio: refresh vring region cache after updating a
 virtqueue size
In-Reply-To: <5eb8bbd4-2d02-002d-6e68-a123b2da2a70@suse.de>
Organization: Red Hat GmbH
References: <20230302101447.4499-1-clopez@suse.de>
 <875ybajjbx.fsf@redhat.com> <5eb8bbd4-2d02-002d-6e68-a123b2da2a70@suse.de>
User-Agent: Notmuch/0.37 (https://notmuchmail.org)
Date: Wed, 15 Mar 2023 14:11:47 +0100
Message-ID: <87jzzitazw.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Mon, Mar 13 2023, Carlos L=C3=B3pez <clopez@suse.de> wrote:

> On 9/3/23 11:43, Cornelia Huck wrote:
>> On Thu, Mar 02 2023, Carlos L=C3=B3pez <clopez@suse.de> wrote:
>>> Fix this by calling virtio_queue_update_rings() after
>>> virtio_queue_set_num() if we are not already calling
>>> virtio_queue_set_rings().
>>=20
>> Don't we instead need to call virtio_init_region_cache() to update the
>> caches? virtio_queue_set_rings() will calculate avail and used from
>> desc, which looks wrong for modern devices.
>
> I take it you meant virtio_queue_update_rings() instead of=20
> virtio_queue_set_rings()? Otherwise I'm not sure what you mean.

I think I had been looking at the code for too long :(

>
> If this is the case sure - there is this same kind of logic in=20
> virtio_load():
>
>              /*
>               * VIRTIO-1 devices migrate desc, used, and avail ring=20
> addresses so
>               * only the region cache needs to be set up.  Legacy=20
> devices need
>               * to calculate used and avail ring addresses based on the d=
esc
>               * address.
>               */
>              if (virtio_vdev_has_feature(vdev, VIRTIO_F_VERSION_1)) {
>                  virtio_init_region_cache(vdev, i);
>              } else {
>                  virtio_queue_update_rings(vdev, i);
>              }

Yes, I think we need to follow the same logic.

> This will require making virtio_init_region_cache() non static of course.
>
>>> diff --git a/hw/s390x/virtio-ccw.c b/hw/s390x/virtio-ccw.c
>>> index e33e5207ab..89891ac58a 100644
>>> --- a/hw/s390x/virtio-ccw.c
>>> +++ b/hw/s390x/virtio-ccw.c
>>> @@ -237,6 +237,7 @@ static int virtio_ccw_set_vqs(SubchDev *sch, VqInfo=
Block *info,
>>>                  return -EINVAL;
>>>              }
>>>              virtio_queue_set_num(vdev, index, num);
>>> +            virtio_queue_update_rings(vdev, index);
>>=20
>> Note that this is the non-legacy path.
>>
> So if I understand correctly, in virtio_mmio_write() we check via=20
> proxy->legacy, and in virtio_ccw_set_vqs() we are in the non-legacy=20
> path. What about virtio_pci_common_write()?

IIUC, only modern drivers will write to the modern bar.


