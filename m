Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BC4C38F6DB
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 02:12:09 +0200 (CEST)
Received: from localhost ([::1]:55914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llKg3-0000Cp-Vo
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 20:12:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1llKeK-0007jN-L2
 for qemu-devel@nongnu.org; Mon, 24 May 2021 20:10:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21885)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1llKeH-0002TN-BI
 for qemu-devel@nongnu.org; Mon, 24 May 2021 20:10:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621901414;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e6wqYTslz1Li6XlXEzxiussdXIpHEFaOGVMFWIhbjr0=;
 b=e7/zMNjHd/JPU/vDeS5YjkVWUCbc1BM3CDmrlG01oqtV+2PzMm1M1dvK82V4S88k6ZADTk
 /901nvURlu9bh0uMry9TQd+9bew2Mr4EbWh+cGmROali+UzesEaajkJi2pHg3hWbjgwDhe
 ZL7/Bz+5Wf7LvCmsjpd/scEnNQbbw6s=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-41-NUYuB-mpNbOB1iUZ8Zusfw-1; Mon, 24 May 2021 20:10:10 -0400
X-MC-Unique: NUYuB-mpNbOB1iUZ8Zusfw-1
Received: by mail-pj1-f70.google.com with SMTP id
 me1-20020a17090b17c1b029015f8192660bso6865572pjb.7
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 17:10:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=e6wqYTslz1Li6XlXEzxiussdXIpHEFaOGVMFWIhbjr0=;
 b=cmXJ+MDEgTfayMI8fy5UvkzG0kmAE3wp/AyV4qeCVK5InHLXkR9ycpb9OpWJhxXsre
 L/XTA275bsER1gFhgtjkd5j/clMV8b776rqjD+36I+4LxiRF7weQ7LGGTb/9KnNkdlkq
 QvBFljF4DTjJTH1+uw4CnqcYC0WlDtlcHcAbtHXg2BSiww8ZFz/nBqYK7pwIXvDvf9RP
 qO5keiZDycW2GC9PvrDm1NDw1vhDTEhs4eV5Jwu/50BQYRQ8oT1dMD+R8mIMYGs2djVa
 Jj8vkkNZ6ZgE6Qp/375y+Dgxw3p5YKi3Jw9SemVid83B7Ce/+9jnqC945q9CIkkHLscy
 c5iA==
X-Gm-Message-State: AOAM5325BWqTb7cS6WseUd5RuHoVw69nECQAI4BLY+Ko7f6hH7Y0DT/v
 gcT/ClT52Am89Q4ZIpDxU8ACqsNsp3g6KKgqgwJivm0khs/2oLUDXxEZgv8Q8gyw63g3eG6OxkA
 s1d0kkBF63leLOo0=
X-Received: by 2002:a63:36ce:: with SMTP id
 d197mr11971596pga.151.1621901409408; 
 Mon, 24 May 2021 17:10:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwpLw3LCNM6Z/PYw+mfFsO8opvWSu4kqbw0H23T6aNpUx4nHDHYLq4KLLwuFfi5Ol2t4xQ5XQ==
X-Received: by 2002:a63:36ce:: with SMTP id
 d197mr11971569pga.151.1621901409126; 
 Mon, 24 May 2021 17:10:09 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id s2sm444708pjz.41.2021.05.24.17.10.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 May 2021 17:10:08 -0700 (PDT)
Subject: Re: [RFC v3 00/29] vDPA software assisted live migration
To: Eugenio Perez Martin <eperezma@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
References: <20210519162903.1172366-1-eperezma@redhat.com>
 <20210524053144-mutt-send-email-mst@kernel.org>
 <CAJaqyWcVm55qjaDpQsuLzaY0FCzjW2ARyvOWCdfS9RJNoOM7Aw@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <0f527c93-4683-480e-7c68-755637b56546@redhat.com>
Date: Tue, 25 May 2021 08:09:59 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <CAJaqyWcVm55qjaDpQsuLzaY0FCzjW2ARyvOWCdfS9RJNoOM7Aw@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Parav Pandit <parav@mellanox.com>, Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-level <qemu-devel@nongnu.org>,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eli Cohen <eli@mellanox.com>,
 virtualization@lists.linux-foundation.org, Michael Lilja <ml@napatech.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2021/5/24 下午6:37, Eugenio Perez Martin 写道:
> On Mon, May 24, 2021 at 11:38 AM Michael S. Tsirkin <mst@redhat.com> wrote:
>> On Wed, May 19, 2021 at 06:28:34PM +0200, Eugenio Pérez wrote:
>>> Commit 17 introduces the buffer forwarding. Previous one are for
>>> preparations again, and laters are for enabling some obvious
>>> optimizations. However, it needs the vdpa device to be able to map
>>> every IOVA space, and some vDPA devices are not able to do so. Checking
>>> of this is added in previous commits.
>> That might become a significant limitation. And it worries me that
>> this is such a big patchset which might yet take a while to get
>> finalized.
>>
> Sorry, maybe I've been unclear here: Latter commits in this series
> address this limitation. Still not perfect: for example, it does not
> support adding or removing guest's memory at the moment, but this
> should be easy to implement on top.
>
> The main issue I'm observing is from the kernel if I'm not wrong: If I
> unmap every address, I cannot re-map them again.


This looks like a bug.

Does this happen only on some specific device (e.g vp_vdpa) or it's a 
general issue of vhost-vdpa?


>   But code in this
> patchset is mostly final, except for the comments it may arise in the
> mail list of course.
>
>> I have an idea: how about as a first step we implement a transparent
>> switch from vdpa to a software virtio in QEMU or a software vhost in
>> kernel?
>>
>> This will give us live migration quickly with performance comparable
>> to failover but without dependance on guest cooperation.
>>
> I think it should be doable. I'm not sure about the effort that needs
> to be done in qemu to hide these "hypervisor-failover devices" from
> guest's view but it should be comparable to failover, as you say.


Yes, if we want to switch, I'd go to a fallback to vhost-vdpa network 
backend instead.

Thanks


>
> Networking should be ok by its nature, although it could require care
> on the host hardware setup. But I'm not sure how other types of
> vhost/vdpa devices may work that way. How would a disk/scsi device
> switch modes? Can the kernel take control of the vdpa device through
> vhost, and just start reporting with a dirty bitmap?
>
> Thanks!
>
>> Next step could be driving vdpa from userspace while still copying
>> packets to a pre-registered buffer.
>>
>> Finally your approach will be a performance optimization for devices
>> that support arbitrary IOVA.
>>
>> Thoughts?
>>
>> --
>> MST
>>


