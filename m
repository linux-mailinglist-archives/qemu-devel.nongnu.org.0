Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B4AF68D2EF
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 10:36:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPKOO-0006RJ-M8; Tue, 07 Feb 2023 04:36:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pPKO1-0006FP-Ng
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 04:35:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pPKNz-0005dA-V7
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 04:35:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675762535;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Irnyd+9jSmIIdAMzzNU95eKMCZCCoLuNbh7KXBB/huk=;
 b=Qnaivn7WI3BE+z8XyQFG0b0m8UM+WcZVXcU9qx61+rTZkPY91Dl7QlfLCWqtgtpIxZYZnd
 iuR7EPTsZ328w41U1xmd/+jzZMCee5iYi+V8EBuiwHKZNLXeYWLULmFFob+mtK4KgeHed8
 NkqwK6dEM6LUqMIiZLncaEKY1qNvfdM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-483-VECQCvUQO_Gcbo_2MWlQyA-1; Tue, 07 Feb 2023 04:35:33 -0500
X-MC-Unique: VECQCvUQO_Gcbo_2MWlQyA-1
Received: by mail-wm1-f70.google.com with SMTP id
 k9-20020a05600c1c8900b003dc5dec2ac6so10324573wms.4
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 01:35:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Irnyd+9jSmIIdAMzzNU95eKMCZCCoLuNbh7KXBB/huk=;
 b=MNym/INzF9qjboQqh5zWTrpPWfOk+9FH0ewp8SMfq7T8q7QPm5puIhdTiv+wFa7+r5
 9YicxZn82n/P4njX0a1vzvGM8H5UG+jEX/J0MBqkIq9TfPAsrDwFnPsF+aIbXzF5hzlM
 /e34mjIXxa8qAxIWmv4hK81rhb4WgOaeaoytvNea+f4XqzFlttreXAzHkDjWoNQpvpEq
 z8iagHwl5heVOfxONE9HaZgrSnfvhjpLOdZPKa6Ra7+uKGXlYUz8fYQKAw2N2XJNHTrn
 vvpvebDXu5QbGTRMw+D0F9Rs0c5bn6xkVA4kGNkhhje7+pVeBwF+jwHDl8M1p5eJSuqK
 OxJg==
X-Gm-Message-State: AO0yUKUysImqA3b0e+HAVJqPZwlo3UqtvxJZaURShA/OwpCkHeHg3NEz
 2pdLtqLMMjMd/ZVE8mUynBknsg7cCRW9ojsv7jceX3sm8856NK+iLoYJbZCzeyIHAp6QOSuJ+XC
 PCHxKX0QrU6bg15g=
X-Received: by 2002:adf:e492:0:b0:2c3:f4bf:2977 with SMTP id
 i18-20020adfe492000000b002c3f4bf2977mr1883351wrm.63.1675762532483; 
 Tue, 07 Feb 2023 01:35:32 -0800 (PST)
X-Google-Smtp-Source: AK7set8/GoEthMfAnTv5L3UhyxJb/T4SvPirUXYnnemoX7DvgbX1bS3EAenuF/Qca+hLY/+bliaaMw==
X-Received: by 2002:adf:e492:0:b0:2c3:f4bf:2977 with SMTP id
 i18-20020adfe492000000b002c3f4bf2977mr1883324wrm.63.1675762532199; 
 Tue, 07 Feb 2023 01:35:32 -0800 (PST)
Received: from ?IPV6:2003:cf:d708:4b2c:f69d:dcc6:80c8:9f6f?
 (p200300cfd7084b2cf69ddcc680c89f6f.dip0.t-ipconnect.de.
 [2003:cf:d708:4b2c:f69d:dcc6:80c8:9f6f])
 by smtp.gmail.com with ESMTPSA id
 i3-20020a5d5223000000b002bfae1398bbsm10783801wra.42.2023.02.07.01.35.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Feb 2023 01:35:31 -0800 (PST)
Message-ID: <ec3a9cf9-1e43-f91a-b64d-9bd57b93fc16@redhat.com>
Date: Tue, 7 Feb 2023 10:35:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: vhost-user (virtio-fs) migration: back end state
Content-Language: en-US
To: quintela@redhat.com, Stefan Hajnoczi <stefanha@gmail.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>,
 virtio-fs-list <virtio-fs@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>,
 Jason Wang <jasowang@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Dave Gilbert <dgilbert@redhat.com>
References: <fb523956-7a8c-608b-6db1-961686b73e9c@redhat.com>
 <CAJSP0QWnq6av7j6x_n-C2mLSPMYBhMeEthr6ayPN-cmsEB3UnA@mail.gmail.com>
 <87mt5qv76d.fsf@secure.mitica>
From: Hanna Czenczek <hreitz@redhat.com>
In-Reply-To: <87mt5qv76d.fsf@secure.mitica>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.148, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 06.02.23 22:02, Juan Quintela wrote:
> Stefan Hajnoczi <stefanha@gmail.com> wrote:
>> On Mon, 6 Feb 2023 at 07:36, Hanna Czenczek <hreitz@redhat.com> wrote:
>>> Hi Stefan,
>>>
>>> For true virtio-fs migration, we need to migrate the daemon’s (back
>>> end’s) state somehow.  I’m addressing you because you had a talk on this
>>> topic at KVM Forum 2021. :)
>>>
>>> As far as I understood your talk, the only standardized way to migrate a
>>> vhost-user back end’s state is via dbus-vmstate.  I believe that
>>> interface is unsuitable for our use case, because we will need to
>>> migrate more than 1 MB of state.  Now, that 1 MB limit has supposedly
>>> been chosen arbitrarily, but the introducing commit’s message says that
>>> it’s based on the idea that the data must be supplied basically
>>> immediately anyway (due to both dbus and qemu migration requirements),
>>> and I don’t think we can meet that requirement.
>> Yes, dbus-vmstate is the available today. It's independent of
>> vhost-user and VIRTIO.
> Once that we are here:
> - typical size of your starte (either vhost-user or whatever)

Difficult to say, completely depends on the use case.  When identifying 
files by path and organizing them in a tree structure, probably ~48 
bytes per indexed file, plus, say, 16 bytes per open file.

So for a small shared filesystem, the state can be very small, but we’ll 
also have to prepare for cases where it is in the range of several MB.

The main problem isn’t size but that (when identifying files by path) 
we’ll probably want to construct the paths when migrating, which won’t 
be done instantaneously.

> - what are the posibilities that you can enter the iterative stage
>    negotiation (i.e. that you can create a dirty bitmap about your state)

Very good.  We should know when parts of the state (information about a 
specific indexed or open file) changes.  (Exceptions apply, but they 
mostly come down to whether indexed files are identified by path or file 
handle, which is a choice the user will probably need to make.  Either 
one comes with caveats.)

[...]

>>> Of course, we could use a channel that completely bypasses qemu, but I
>>> think we’d like to avoid that if possible.  First, this would require
>>> adding functionality to virtiofsd to configure this channel.  Second,
>>> not storing the state in the central VM state means that migrating to
>>> file doesn’t work (well, we could migrate to a dedicated state file,
>>> but...).
> How much is migration to file used in practice?
> I would like to have some information here.
> It could be necessary probably to be able to encrypt it.  And that is a
> (different) whole can of worms.

I don’t think virtio-fs state needs to be encrypted any more than any 
other state.  It’ll basically just map FUSE inode IDs to a file in the 
shared directory, either via path or file handle; and then also track 
open(2) flags for opened files.  (At least that’s what’s currently on my 
radar.)  That information should actually be replicated in the guest, 
too (because it too will have mapped the filesystem paths to FUSE inode 
IDs), so isn’t more security relevant than guest memory.

Hanna


