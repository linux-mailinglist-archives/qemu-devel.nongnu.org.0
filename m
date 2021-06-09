Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A1943A135C
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 13:48:38 +0200 (CEST)
Received: from localhost ([::1]:46612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqwhI-0004S2-SD
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 07:48:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lqwfQ-0003dR-80
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 07:46:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51386)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lqwfK-000597-61
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 07:46:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623239192;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mhprUE01D0JDPxbnietNL5+I4GgBphOyY54hcIu2OAQ=;
 b=WfZsBNew0ZrwZYsb4xjo3i4VYumDZ8fufYH6fIxFeibqnDaF3zfbZicQTemRAsKuh4uQxc
 gaU6RCSeZml/Csbx/+F49splhnQACgTUDgMic8E5O9MUfgYze3N8gy5MJmkodrnEG+o8dM
 sFJ2pdMVw+ZPeWEImJS/kJF4geSAww0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-347-5HRlb4qCOhqXbNzD7CNZ_A-1; Wed, 09 Jun 2021 07:46:30 -0400
X-MC-Unique: 5HRlb4qCOhqXbNzD7CNZ_A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0A5AFDF8AD;
 Wed,  9 Jun 2021 11:46:29 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-222.ams2.redhat.com
 [10.36.112.222])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0BAFB5C22A;
 Wed,  9 Jun 2021 11:46:21 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 407FA113865F; Wed,  9 Jun 2021 13:46:20 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Eugenio Perez Martin <eperezma@redhat.com>
Subject: Re: [RFC v3 04/29] vhost: Add x-vhost-enable-shadow-vq qmp
References: <20210519162903.1172366-1-eperezma@redhat.com>
 <20210519162903.1172366-5-eperezma@redhat.com>
 <87y2c8pnx0.fsf@dusky.pond.sub.org>
 <CAJaqyWf9HZKb+Mtn_UNHZQj4EqzybPzwbLE7vcbCXJPK7wtXKw@mail.gmail.com>
 <87k0n4xwo4.fsf@dusky.pond.sub.org>
 <CAJaqyWcmpZxdSv9SKi0yFY5UNsdMKzRGFSW_4pUZicqCP7Gkdg@mail.gmail.com>
Date: Wed, 09 Jun 2021 13:46:20 +0200
In-Reply-To: <CAJaqyWcmpZxdSv9SKi0yFY5UNsdMKzRGFSW_4pUZicqCP7Gkdg@mail.gmail.com>
 (Eugenio Perez Martin's message of "Tue, 8 Jun 2021 17:26:18 +0200")
Message-ID: <87wnr3p8fn.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Jason Wang <jasowang@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-level <qemu-devel@nongnu.org>, virtualization@lists.linux-foundation.org,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Michael Lilja <ml@napatech.com>, Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Eugenio Perez Martin <eperezma@redhat.com> writes:

> On Tue, Jun 8, 2021 at 4:23 PM Markus Armbruster <armbru@redhat.com> wrot=
e:
>>
>> Eugenio Perez Martin <eperezma@redhat.com> writes:
>>
>> > On Fri, May 21, 2021 at 9:05 AM Markus Armbruster <armbru@redhat.com> =
wrote:
>> >>
>> >> Eugenio P=C3=A9rez <eperezma@redhat.com> writes:
>> >>
>> >> > Command to enable shadow virtqueue looks like:
>> >> >
>> >> > { "execute": "x-vhost-enable-shadow-vq",
>> >> >   "arguments": { "name": "dev0", "enable": true } }
>> >> >
>> >> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
>> >> > ---
>> >> >  qapi/net.json     | 22 ++++++++++++++++++++++
>> >> >  hw/virtio/vhost.c |  6 ++++++
>> >> >  2 files changed, 28 insertions(+)
>> >> >
>> >> > diff --git a/qapi/net.json b/qapi/net.json
>> >> > index c31748c87f..660feafdd2 100644
>> >> > --- a/qapi/net.json
>> >> > +++ b/qapi/net.json
>> >> > @@ -77,6 +77,28 @@
>> >> >  ##
>> >> >  { 'command': 'netdev_del', 'data': {'id': 'str'} }
>> >> >
>> >> > +##
>> >> > +# @x-vhost-enable-shadow-vq:
>> >> > +#
>> >> > +# Use vhost shadow virtqueue.
>> >> > +#
>> >> > +# @name: the device name of the VirtIO device
>> >> > +#
>> >> > +# @enable: true to use he alternate shadow VQ notification path
>>
>> [...]
>>
>> >> > +#
>> >> > +# Returns: Error if failure, or 'no error' for success. Not found =
if vhost is not enabled.
>> >>
>> >> This is confusing.  What do you mean by "Not found"?
>> >>
>> >> If you mean DeviceNotFound:
>> >>
>> >> 1. Not actually true: qmp_x_vhost_enable_shadow_vq() always fails wit=
h
>> >> GenericError.  Perhaps later patches will change that.
>>
>> [...]
>>
>> >> 2. Do you really need to distinguish "vhost is not enabled" from othe=
r
>> >> errors?
>> >>
>> >
>> > SVQ cannot work if the device backend is not vhost, like qemu VirtIO
>> > dev. What I meant is that "qemu will only look for its name in the set
>> > of vhost devices, so you will have a device not found if the device is
>> > not a vhost one", which may not be 100% clear at first glance. Maybe
>> > this wording is better?
>>
>> We might be talking past each other.  Let me try again :)
>>
>> The following question is *not* about the doc comment, it's about the
>> *code*: what practical problem is solved by using DeviceNotFound instead
>> of GenericError for some errors?
>>
>
> Sorry, I'm not sure if I follow you :). At risk of being circular in
> this topic, the only use case I can think is to actually tell the
> difference between "the device does not exists, or is not a vhost
> device" and "the device does not support SVQ because X", where X can
> be "it uses a packed ring", "it uses event idx", ...
>
> I can only think of one practical use case, "if you see this error,
> you probably forgot to set vhost=3Don in the command line, or something
> is forbidding this device to be a vhost one". Having said that, I'm
> totally fine with using GenericError always, but I see the more
> fine-grained the error the better. What would be the advantage of also
> using GenericError here?

In the initial design of the Error API, every error had its own distinct
class.  This provided for fine-grained errors.

Adding a new error was bothersome: you had to define a new class, in
qerror.h.  Recompile the world.  Conflict magnet.  Constant temptation
to reuse an existing error even when its error message is suboptimal,
and the reuse of the class for another error conflates errors.

After a bit under three years, we had 70 classes, used in almost 400
places.  Management applications actually cared for just six classes.

Bad error messages and development friction had turned out to be a real
problem.  Conflating errors pretty much not.

We concluded that providing for fine-grained errors when next to nothing
uses them was not worth the pain.  So we ditched them:

    https://lists.nongnu.org/archive/html/qemu-devel/2012-08/msg01958.html
    Commit ac839ccd8c3..adb2072ed0f

Since them, we recommend to use GenericError unless there is a
compelling reason not to.  "Something might care someday" doesn't
qualify.

Learning by doing the wrong thing is painful and expensive, but at least
the lessons tends to stick ;)

Today, we have more than 4000 callers of error_setg(), and less than 40
of error_set().

> Just to be sure that we are on the same page, I think this is better
> seen from PATCH 07/39: vhost: Route guest->host notification through
> shadow virtqueue.
>
>> [...]
>>


