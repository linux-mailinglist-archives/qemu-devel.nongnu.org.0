Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69858687411
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 04:43:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNQTx-0008IG-UG; Wed, 01 Feb 2023 22:41:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pNQTw-0008I3-C6
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 22:41:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pNQTu-0003Hm-Eu
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 22:41:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675309305;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DczX1R3zViEuOvg4E7LNnVBVgiYDk9Eop0nr/BxNEcY=;
 b=YfQWnB01axyRLSt3US3sOrfOZL0fAl5S6TlC767yuedottkPsd5LkBxGRxyx92erW+Zpxq
 6cPY+BI1M5DBxLHFFu8Bx5YU5jr5D+Z4i8DjbIlImxPbfkV7Cm4Garw6VirSNCqwoEIc/b
 82sBh0q+6gvQMUc8O/3AVD7yg2OHrfk=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-3-els6OyXfM66A7Me6d0qZEQ-1; Wed, 01 Feb 2023 22:41:39 -0500
X-MC-Unique: els6OyXfM66A7Me6d0qZEQ-1
Received: by mail-pj1-f70.google.com with SMTP id
 s16-20020a17090aba1000b002303782fcd8so1877915pjr.9
 for <qemu-devel@nongnu.org>; Wed, 01 Feb 2023 19:41:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DczX1R3zViEuOvg4E7LNnVBVgiYDk9Eop0nr/BxNEcY=;
 b=lqGiIOzOUTXP1VHpTJMR0yQqm7LOBSXWudzhr6fM6TBC9sOueg8fWuFW2oHHhCpkgT
 Y0iY8tr1aoYdt3wHR1s15nT/l1dfUItq3nTD8pNRw8J+yq8PabOTFbKJYn8mshaifBvG
 5SG/OUldMOSdOtSnMc4dpsbh4pJlU62eWIZxCsp/qETFkAZRIyUfUaXuKiW9OS6ipdQv
 n+U34OptGCOQpewpWwamgslYC4dGvtIryj7jVHGT+3tq+Vz79RRagKI51vYzA87lcCBs
 m4nyarOOFGzR131XhKkoyHJUooCcdUbu0TzMuM7e56+/Du9o+gpGOdLP2qrZ0q4vuthG
 6I+Q==
X-Gm-Message-State: AO0yUKUpx8bnaql4258w5RjRIa+TvR6vSaQ91kwjQSXsLkXeoDbkI53k
 BG2OUcQT4MekixEffbFcOOhWA8SM273u9nQ54B+xXBv/Nrx1eR1LsPPnrRkX7DRr1T2nQGdo8Fu
 Wp7bFUJJX7ueDquI=
X-Received: by 2002:a05:6a00:1502:b0:592:528e:72a1 with SMTP id
 q2-20020a056a00150200b00592528e72a1mr5787754pfu.27.1675309298344; 
 Wed, 01 Feb 2023 19:41:38 -0800 (PST)
X-Google-Smtp-Source: AK7set8gpOTAQINnDv8E1LFc9dqWQZ0bB4J+vtC81lEx2wZognsseL8NYLA+5gcUDEz4GGKJ5tV8ZA==
X-Received: by 2002:a05:6a00:1502:b0:592:528e:72a1 with SMTP id
 q2-20020a056a00150200b00592528e72a1mr5787741pfu.27.1675309298021; 
 Wed, 01 Feb 2023 19:41:38 -0800 (PST)
Received: from [10.72.14.0] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 c197-20020a621cce000000b00593a612515dsm8385998pfc.167.2023.02.01.19.41.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Feb 2023 19:41:37 -0800 (PST)
Message-ID: <10256cb5-1e76-188c-189d-f8c917571550@redhat.com>
Date: Thu, 2 Feb 2023 11:41:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: Emulating device configuration / max_virtqueue_pairs in
 vhost-vdpa and vhost-user
Content-Language: en-US
To: Eugenio Perez Martin <eperezma@redhat.com>
Cc: Maxime Coquelin <maxime.coquelin@redhat.com>,
 Michael Tsirkin <mst@redhat.com>, Cindy Lu <lulu@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>, qemu-level
 <qemu-devel@nongnu.org>, Laurent Vivier <lvivier@redhat.com>,
 Juan Quintela <quintela@redhat.com>
References: <CAJaqyWcU5i=caPbbALnV-GcnWH1bu-KVRj54XauDpUZaEfn4Wg@mail.gmail.com>
 <CAJaqyWfZX2sgoOq+Poa2tQTc2VTRneaUvzozOdDS+7SoMUdNkg@mail.gmail.com>
 <CACGkMEuwVXTf6FQxShu6QL-BJdQLOYE5Xy-RVEcemmWg1WKAGQ@mail.gmail.com>
 <CAJaqyWdxL+9gvjawpFTMg_ut8WpcZErdipAMMCSXYdOTcYK61w@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <CAJaqyWdxL+9gvjawpFTMg_ut8WpcZErdipAMMCSXYdOTcYK61w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
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


在 2023/2/1 15:49, Eugenio Perez Martin 写道:
> On Wed, Feb 1, 2023 at 4:29 AM Jason Wang <jasowang@redhat.com> wrote:
>> On Wed, Feb 1, 2023 at 3:11 AM Eugenio Perez Martin <eperezma@redhat.com> wrote:
>>> On Tue, Jan 31, 2023 at 8:10 PM Eugenio Perez Martin
>>> <eperezma@redhat.com> wrote:
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
>>>>
>>>> Thanks!
>>>
>>> (Starting a separated thread to vhost-vdpa related use case)
>>>
>>> This could also work for vhost-vdpa if we ever decide to honor netdev
>>> queues argument. It is totally ignored now, as opposed to the rest of
>>> backends:
>>> * vhost-kernel, whose tap device has the requested number of queues.
>>> * vhost-user, that errors with ("you are asking more queues than
>>> supported") if the vhost-user parent device has less queues than
>>> requested (by vhost-user msg VHOST_USER_GET_QUEUE_NUM).
>>>
>>> One of the reasons for this is that device configuration space is
>>> totally passthrough, with the values for mtu, rss conditions, etc.
>>> This is not ideal, as qemu cannot check src and destination
>>> equivalence and they can change under the feets of the guest in the
>>> event of a migration.
>> This looks not the responsibility of qemu but the upper layer (to
>> provision the same config/features in src/dst).
> I think both share it. Or, at least, that it is inconsistent that QEMU
> is in charge of checking / providing consistency for virtio features,
> but not virtio-net config space.
>
> If we follow that to the extreme, we could simply delete the feature
> checks, right?


Just to make sure we are at the same page.

If you mean deleting the feature checks in Qemu, then I think we can't 
do that.

What I meant is.

Consider vDPA is provisioned (either netlink or other way) with featureX 
and configY. It would be sufficient to validate if the emulated device 
features and configs matches exactly what vDPA device had.

Technically, it should be possible to doing any mediation in the middle 
but it may cause a lot of troubles in the management and others, consider:

featureX is not provisioned but emulated by Qemu, then it's almost 
impossible for the management to check the migration compatibility. If 
feature X can be easily emulated, it should be done in the layer of vDPA 
parent not Qemu, then it could be recognized by the management.


>
>>> External tools are needed for this, duplicating
>>> part of the effort.
>>>
>>> Start intercepting config space accesses and offering an emulated one
>>> to the guest with this kind of adjustments is beneficial, as it makes
>>> vhost-vdpa more similar to the rest of backends, making the surprise
>>> on a change way lower.
>> This probably needs more thought, since vDPA already provides a kind
>> of emulation in the kernel. My understanding is that it would be
>> sufficient to add checks to make sure the config that guests see is
>> consistent with what host provisioned?
>>
> With host provisioned you mean with "vdpa" tool or with qemu?


Make sure the features and config of emulated device provided by Qemu 
matches the vDPA device provisioned via netlink or other mgmt API.


> Also, we
> need a way to communicate the guest values to it If those checks are
> added in the kernel.
>
> The reasoning here is the same as above: QEMU already filters features
> with its own emulated layer, so the operator can specify a feature
> that will never appear to the guest.


This needs to be done at the time of vDPA device provisioning. Otherwise 
we will end up with a lot of corner cases. E.g if 8 queue pairs is 
provisioned, do we allow starting a guest with 4 queue pairs?


>   It has other uses (abstract
> between transport for example), but feature filtering is definitely a
> thing there.
>
> A feature set to off in a VM (or that does not exist in that
> particular qemu version) will never appear as on even in the case of
> migration to modern qemu versions.
>
> We don't have the equivalent protection for device config space. QEMU
> could assure a consistent MTU, number of queues, etc for the guest in
> virtio_net_get_config (and equivalent for other kinds of devices).
> QEMU already has some transformations there. It shouldn't take a lot
> of code.
>
> Having said that:
> * I'm ok with starting just with checks there instead of
> transformations like the queues remap proposed here.


I think we need to keep thing easier. Technically, we could do any kind 
of the mediation/emulation via Qemu, but we need only implement the one 
that is really needed.

Queue remapping might complicate a lot stuffs like notification area 
mapping etc.

Thanks


> * If we choose not to implement it, I'm not proposing to actually
> delete the features checks, as I see them useful :).
>
> Thanks!
>


