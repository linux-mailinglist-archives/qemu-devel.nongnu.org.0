Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F5A39F8F8
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 16:24:39 +0200 (CEST)
Received: from localhost ([::1]:51182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqcek-0001kW-Ql
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 10:24:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lqcdq-0000Ri-1r
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 10:23:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36971)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lqcdm-0001sR-Ja
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 10:23:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623162217;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vS4C9I+815v3Nlwhu9/4hRyU+7WEptJxpvYJTy++NHE=;
 b=fbot8G2Gci2hb37oQk3yhh7G1bvMOxswNFOuW0ah8V/kN6YNlNpNn5L+u348B3LU1+j7Zy
 LmsqgQmlKVIO4KWLVN4KIcPhU1Sg56Lthxi2ZHQ7YiU0QvPeRkEnaOitXkXAGoh+a+4M4q
 Tb7S8MLrIVN355uzIQdvNlz/lnwH/wc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-541-Dbe23FSbNa6v2AXJx6xTug-1; Tue, 08 Jun 2021 10:23:34 -0400
X-MC-Unique: Dbe23FSbNa6v2AXJx6xTug-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D52181883526;
 Tue,  8 Jun 2021 14:23:32 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-222.ams2.redhat.com
 [10.36.112.222])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3627B10016FB;
 Tue,  8 Jun 2021 14:23:25 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 949FB113865F; Tue,  8 Jun 2021 16:23:23 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Eugenio Perez Martin <eperezma@redhat.com>
Subject: Re: [RFC v3 04/29] vhost: Add x-vhost-enable-shadow-vq qmp
References: <20210519162903.1172366-1-eperezma@redhat.com>
 <20210519162903.1172366-5-eperezma@redhat.com>
 <87y2c8pnx0.fsf@dusky.pond.sub.org>
 <CAJaqyWf9HZKb+Mtn_UNHZQj4EqzybPzwbLE7vcbCXJPK7wtXKw@mail.gmail.com>
Date: Tue, 08 Jun 2021 16:23:23 +0200
In-Reply-To: <CAJaqyWf9HZKb+Mtn_UNHZQj4EqzybPzwbLE7vcbCXJPK7wtXKw@mail.gmail.com>
 (Eugenio Perez Martin's message of "Mon, 24 May 2021 09:13:39 +0200")
Message-ID: <87k0n4xwo4.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
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
Cc: Parav Pandit <parav@mellanox.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-level <qemu-devel@nongnu.org>, virtualization@lists.linux-foundation.org,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Michael Lilja <ml@napatech.com>, Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Eugenio Perez Martin <eperezma@redhat.com> writes:

> On Fri, May 21, 2021 at 9:05 AM Markus Armbruster <armbru@redhat.com> wro=
te:
>>
>> Eugenio P=C3=A9rez <eperezma@redhat.com> writes:
>>
>> > Command to enable shadow virtqueue looks like:
>> >
>> > { "execute": "x-vhost-enable-shadow-vq",
>> >   "arguments": { "name": "dev0", "enable": true } }
>> >
>> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
>> > ---
>> >  qapi/net.json     | 22 ++++++++++++++++++++++
>> >  hw/virtio/vhost.c |  6 ++++++
>> >  2 files changed, 28 insertions(+)
>> >
>> > diff --git a/qapi/net.json b/qapi/net.json
>> > index c31748c87f..660feafdd2 100644
>> > --- a/qapi/net.json
>> > +++ b/qapi/net.json
>> > @@ -77,6 +77,28 @@
>> >  ##
>> >  { 'command': 'netdev_del', 'data': {'id': 'str'} }
>> >
>> > +##
>> > +# @x-vhost-enable-shadow-vq:
>> > +#
>> > +# Use vhost shadow virtqueue.
>> > +#
>> > +# @name: the device name of the VirtIO device
>> > +#
>> > +# @enable: true to use he alternate shadow VQ notification path

[...]

>> > +#
>> > +# Returns: Error if failure, or 'no error' for success. Not found if =
vhost is not enabled.
>>
>> This is confusing.  What do you mean by "Not found"?
>>
>> If you mean DeviceNotFound:
>>
>> 1. Not actually true: qmp_x_vhost_enable_shadow_vq() always fails with
>> GenericError.  Perhaps later patches will change that.

[...]

>> 2. Do you really need to distinguish "vhost is not enabled" from other
>> errors?
>>
>
> SVQ cannot work if the device backend is not vhost, like qemu VirtIO
> dev. What I meant is that "qemu will only look for its name in the set
> of vhost devices, so you will have a device not found if the device is
> not a vhost one", which may not be 100% clear at first glance. Maybe
> this wording is better?

We might be talking past each other.  Let me try again :)

The following question is *not* about the doc comment, it's about the
*code*: what practical problem is solved by using DeviceNotFound instead
of GenericError for some errors?

[...]


