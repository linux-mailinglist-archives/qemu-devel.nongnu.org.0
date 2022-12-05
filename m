Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B167E6425D2
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Dec 2022 10:32:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p27nd-0004GA-Nz; Mon, 05 Dec 2022 04:30:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1p27nb-0004Fv-Ku
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 04:30:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1p27nW-00017H-Sp
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 04:30:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670232601;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uiEu0PKdIg15NruQztkVXlJKWxzrJke+gdaEMKmnmxU=;
 b=M05gRxtXbjmq6chRt3o+S8PzWbkjK8Tm+uEBdQF0IzpKbMgHBwJafbWA394HqE9RNjIg6e
 c0LqX+QFhwuOsA7GsttKt83pdMyh7DR3DOeLlrc20XdklCwPUY7+pj5tdQw5r22wJuiN6e
 MIXpDSbb32cTH+EaK4TpOJnI6ZP9cQA=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-613-7EgnyiiDNH6LQrbp4C222g-1; Mon, 05 Dec 2022 04:29:59 -0500
X-MC-Unique: 7EgnyiiDNH6LQrbp4C222g-1
Received: by mail-qk1-f197.google.com with SMTP id
 bi42-20020a05620a31aa00b006faaa1664b9so15955015qkb.8
 for <qemu-devel@nongnu.org>; Mon, 05 Dec 2022 01:29:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uiEu0PKdIg15NruQztkVXlJKWxzrJke+gdaEMKmnmxU=;
 b=U7gutKjWKqBhgZQXFI8wdDRb/P5AZWGXZp3aeLoJKCth+ClAMxxkTDfDgoqGTfmq4h
 8R5XdTHWHrYV3N6bYmyc+RUbieZxWUR10V34T0ydFNfyCmlTNMhOZG9S6R2x3G8+L7Nn
 x997yz1mM7pZeRJ9l6jGroIalh5soFodiS6SpvczEe3y37XXys1qnbhttuOdvJ9LUGQZ
 CPXOGgMmvWV/R77dAkBWHc7fEbBWa2VPenWhVrg0hk7Z/q47bSRtYCePbhc8BOrxi0pG
 jPfe6Pj3lbC53CXxATJkLOyJRZiMUYsiqqRlonODU3AY2Z83ZvSNy7Lb/7zOBzOlLTko
 dQDg==
X-Gm-Message-State: ANoB5pmUllNMc64oYniM3sqGFkpn3f8NFnBhNR0f3BqnLvnA4XG2StvS
 qNmI+IztCbH57wu5MICHj7i8JO0O50L3t8Izzj0kU4Dh4c4mlfobB057VSxz+UUPZ7bio3UcUUl
 w7Q6i/xLXHywVNyM=
X-Received: by 2002:ad4:5288:0:b0:4c7:5f27:7966 with SMTP id
 v8-20020ad45288000000b004c75f277966mr6484309qvr.44.1670232599358; 
 Mon, 05 Dec 2022 01:29:59 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7ZcjJrJdKCfBdlJUV2ROrAl6e5+JiyXNy4UyjEZy3NjoRF3W6v1yDeuyLXJH4HXX5eOJl8Ag==
X-Received: by 2002:ad4:5288:0:b0:4c7:5f27:7966 with SMTP id
 v8-20020ad45288000000b004c75f277966mr6484294qvr.44.1670232599124; 
 Mon, 05 Dec 2022 01:29:59 -0800 (PST)
Received: from sgarzare-redhat (host-87-11-6-51.retail.telecomitalia.it.
 [87.11.6.51]) by smtp.gmail.com with ESMTPSA id
 i6-20020a05620a404600b006fc9fe67e34sm11709658qko.81.2022.12.05.01.29.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Dec 2022 01:29:58 -0800 (PST)
Date: Mon, 5 Dec 2022 10:29:49 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, virtio-fs@redhat.com,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Fam Zheng <fam@euphon.net>, Viresh Kumar <viresh.kumar@linaro.org>,
 German Maglione <gmaglione@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH for-7.2] vhost: enable vrings in vhost_dev_start() for
 vhost-user devices
Message-ID: <20221205092949.goyo76dy76u2d4ie@sgarzare-redhat>
References: <20221123131630.52020-1-sgarzare@redhat.com>
 <Y3+5rfnNmR7R/h6/@fedora>
 <20221125081243.a3q7ep32o6g4r2vd@sgarzare-redhat>
 <Y4fFICp5tBrEPud1@fedora>
 <20221201080250.s3cugnnkf5f4kqvo@sgarzare-redhat>
 <87k03bctrj.fsf@linaro.org>
 <20221201052647-mutt-send-email-mst@kernel.org>
 <874jufcnzi.fsf@linaro.org>
 <20221201164750-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221201164750-mutt-send-email-mst@kernel.org>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

On Thu, Dec 01, 2022 at 04:49:37PM -0500, Michael S. Tsirkin wrote:
>On Thu, Dec 01, 2022 at 12:21:21PM +0000, Alex Bennée wrote:
>>
>> "Michael S. Tsirkin" <mst@redhat.com> writes:
>>
>> > On Thu, Dec 01, 2022 at 10:14:39AM +0000, Alex Bennée wrote:
>> >> Do you think rust-vmm's vhost crates have enough of the state
>> >> management to manage vhost and vhost-user backends? Maybe it would be a
>> >> good experiment in replacing a (small well defined) piece of
>> >> functionality with rust?

I honestly don't know, but I think they are not 100% complete.
I do agree that an experiment would be nice though, maybe a GSoC?
Or maybe not, since it's not very clear whether we get to the end or not....

>> >>
>> >> That said there is a lot of deep magic in the vhost-net stuff which I
>> >> think is down to the interaction with things like vdpk and other network
>> >> optimisations that might be missing. For the rest of the devices most of
>> >> the code is basically boiler plate which has grown variations due to
>> >> code motion and change. This is the sort of thing that generics solves
>> >> well.
>> >
>> > Not sure what you want to replace with what though, libvhost-user or
>> > vhost-user bits in qemu?
>>
>> The vhost-user bits in the main QEMU binary. We already don't use
>> libvhost-user for most of our backends anyway ;-)
>
>Mixing C and Rust like this is far from trivial. I'd start with
>something much less ambitious that virtio.

We recently merged libblkio [1] support in QEMU [2], where we did
something similar.
libblkio provides a C API, but the library is totally written in Rust.
Writing the C interface was not too complicated.

The advantage here is that the Rust code is already part of the rust-vmm
crates.
I think it needs adjustments, but it's not a bad idea in my opinion.

Anyway, I don't think it's an easy job, though, so maybe GSoC could just
be about writing the C interface and adapting Rust crates. Touching QEMU
might require too much knowledge of the current code.

Thanks,
Stefano

[1] https://libblkio.gitlab.io/libblkio/
[2] https://lists.nongnu.org/archive/html/qemu-devel/2022-10/msg02215.html


