Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F482687417
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 04:45:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNQX7-0000os-LI; Wed, 01 Feb 2023 22:45:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pNQX5-0000of-Rk
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 22:45:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pNQX4-0003fC-6A
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 22:45:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675309505;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W73E5YahOwf53m6DEodYTWRnYKW3EpNRIwcnY79PmPQ=;
 b=TRVTPP4oe0Svbz5oIB9Ea16yfxOAQxIDsOvLhMJFNx9OujQxgZLZdl5ub6HsUOuWme7EcZ
 2YUy4Y4+pFMVjmfe2dE26+RiyRTj76GlzvKSnWwFfsnbMRtfLtNc4NY7UUVo5j17wcC/RM
 eUpCpMgNqdVstkGXNZ4HRpLxvGD3Rrc=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-474-Q0yWHboKMX2NzGTEmaUJdA-1; Wed, 01 Feb 2023 22:45:04 -0500
X-MC-Unique: Q0yWHboKMX2NzGTEmaUJdA-1
Received: by mail-pf1-f197.google.com with SMTP id
 x9-20020aa79409000000b00593a1f7c3d8so293895pfo.14
 for <qemu-devel@nongnu.org>; Wed, 01 Feb 2023 19:45:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=W73E5YahOwf53m6DEodYTWRnYKW3EpNRIwcnY79PmPQ=;
 b=jPsIHdTHj+9ocVUuZKeUioOxL8dll3K8QhbO2/HYv9twnG9eEvI0ria0UI1Y4tb38m
 Aa2kH0BFeZpCcsV007JOUm4VpjWC2Duv950doEqE9YtSUfN4KXTfJif65XQKieoP/sih
 WN/GGQYunx6IE0ax/PCfjgJXQJ6OxCj8RWVO5IzPgr4JhyH6e/XWJ1+3AWs97gQUGpwI
 or1M68tTud94DLgh+kNBFTH95MPN4JhhELSl+9jMZpMk/r1twuBrmt8LPtWvCGcs18WX
 Jwyw2KVXp8/NzNSmYvZYV7MPBFu8t74MAjiyv0mMZrH68YzuES5v8PAFIn7VIROAYyWk
 KkyA==
X-Gm-Message-State: AO0yUKUIZ3lfCkHi6ZPpMgvqNS/WaycHVJQzb+B/blEg58vKtCOmQgsU
 fZmeIwr7DkVIBaKoDzCkiLSaMBCg9rFWlITKMi3vHq9lwMSQ86Ti3zkfgGO1Ro3Zl3P+5tI9CRX
 r7MKF/gyiocdyz7U=
X-Received: by 2002:a17:902:dac8:b0:196:59a0:bffe with SMTP id
 q8-20020a170902dac800b0019659a0bffemr6924177plx.17.1675309503011; 
 Wed, 01 Feb 2023 19:45:03 -0800 (PST)
X-Google-Smtp-Source: AK7set9S0Zgo1VUUNO4c0RSuygwfTkQ6nF1zvDEvehZVgcaasU1bpCVankAX0gV6Pk6hUgGgCyfYMg==
X-Received: by 2002:a17:902:dac8:b0:196:59a0:bffe with SMTP id
 q8-20020a170902dac800b0019659a0bffemr6924153plx.17.1675309502701; 
 Wed, 01 Feb 2023 19:45:02 -0800 (PST)
Received: from [10.72.14.0] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 d2-20020a170903230200b001931c37da2dsm12551435plh.20.2023.02.01.19.44.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Feb 2023 19:45:02 -0800 (PST)
Message-ID: <7c076123-42e2-a041-2b5d-95d1afd82143@redhat.com>
Date: Thu, 2 Feb 2023 11:44:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: Emulating device configuration / max_virtqueue_pairs in
 vhost-vdpa and vhost-user
Content-Language: en-US
To: Eugenio Perez Martin <eperezma@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Cc: Maxime Coquelin <maxime.coquelin@redhat.com>, Cindy Lu <lulu@redhat.com>, 
 Stefano Garzarella <sgarzare@redhat.com>, qemu-level
 <qemu-devel@nongnu.org>, Laurent Vivier <lvivier@redhat.com>,
 Juan Quintela <quintela@redhat.com>
References: <CAJaqyWcU5i=caPbbALnV-GcnWH1bu-KVRj54XauDpUZaEfn4Wg@mail.gmail.com>
 <6684066f-452d-a8b3-58b2-b0db2a3c2015@redhat.com>
 <20230201061709-mutt-send-email-mst@kernel.org>
 <CAJaqyWcmxwKSVLY7sDTmYwLdzhVV78XDa5M4FAvmHq4X2Kin8Q@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <CAJaqyWcmxwKSVLY7sDTmYwLdzhVV78XDa5M4FAvmHq4X2Kin8Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


在 2023/2/1 19:48, Eugenio Perez Martin 写道:
> On Wed, Feb 1, 2023 at 12:20 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>> On Wed, Feb 01, 2023 at 12:14:18PM +0100, Maxime Coquelin wrote:
>>> Thanks Eugenio for working on this.
>>>
>>> On 1/31/23 20:10, Eugenio Perez Martin wrote:
>>>> Hi,
>>>>
>>>> The current approach of offering an emulated CVQ to the guest and map
>>>> the commands to vhost-user is not scaling well:
>>>> * Some devices already offer it, so the transformation is redundant.
>>>> * There is no support for commands with variable length (RSS?)
>>>>
>>>> We can solve both of them by offering it through vhost-user the same
>>>> way as vhost-vdpa do. With this approach qemu needs to track the
>>>> commands, for similar reasons as vhost-vdpa: qemu needs to track the
>>>> device status for live migration. vhost-user should use the same SVQ
>>>> code for this, so we avoid duplications.
>>>>
>>>> One of the challenges here is to know what virtqueue to shadow /
>>>> isolate. The vhost-user device may not have the same queues as the
>>>> device frontend:
>>>> * The first depends on the actual vhost-user device, and qemu fetches
>>>> it with VHOST_USER_GET_QUEUE_NUM at the moment.
>>>> * The qemu device frontend's is set by netdev queues= cmdline parameter in qemu
>>>>
>>>> For the device, the CVQ is the last one it offers, but for the guest
>>>> it is the last one offered in config space.
>>>>
>>>> To create a new vhost-user command to decrease that maximum number of
>>>> queues may be an option. But we can do it without adding more
>>>> commands, remapping the CVQ index at virtqueue setup. I think it
>>>> should be doable using (struct vhost_dev).vq_index and maybe a few
>>>> adjustments here and there.
>>>>
>>>> Thoughts?
>>> I am fine with both proposals.
>>> I think index remapping will require a bit more rework in the DPDK
>>> Vhost-user library, but nothing insurmountable.
>>>
>>> I am currently working on a PoC adding support for VDUSE in the DPDK
>>> Vhost library, and recently added control queue support. We can reuse it
>>> if we want to prototype your proposal.
>>>
>>> Maxime
>>>
>>>> Thanks!
>>>>
>>
>> technically backend knows how many vqs are there, last one is cvq...
>> not sure we need full blown remapping ...
>>
> The number of queues may not be the same between cmdline and the device.
>
> If vhost-user device cmdline wants more queues than offered by the
> device qemu will print an error. But the reverse (to offer the same
> number of queues or less than the device have) is valid at this
> moment.
>
> If we add cvq with this scheme, cvq index will not be the same between
> the guest and the device.
>
> vhost-vdpa totally ignores the queues parameter, so we're losing the
> opportunity to offer a consistent config space in the event of a
> migration. I suggest we should act the same way as I'm proposing here
> with vhost-user, so:
> * QEMU can block the migration in the case the destination cannot
> offer the same number of queues.
> * The guest will not see a change of the config space under its feets.


As we discussed in the past, it would be easier to fail the device 
initialization in this case.

Thanks


>
> Now there are other fields in the config space for sure (mtu, rss
> size, etc), but I think the most complex case is the number of queues
> because cvq.
>
> Is that clearer?
>
> Thanks!
>


