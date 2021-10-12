Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D4642A663
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 15:47:29 +0200 (CEST)
Received: from localhost ([::1]:35914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maI7r-0003QX-VB
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 09:47:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1maI6o-0002kI-1c
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 09:46:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59451)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1maI6j-0007Li-PS
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 09:46:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634046375;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NVvqd521Ii1s8DgIwrfrA0qa1qmgD5ocg4P6iv24kCE=;
 b=UHy0ldO5gViesrD/0EGPm5zmCdib9I4yD1ubAG70YQ/gIfund1ANVHihMOHRsQNVuvJzct
 EILCTkGuaTnlFo7c6z7IYsjhZQI3X8tgE0b28dA4Dg/XDNiffmQmZkI4tTYThvtZiwvRgJ
 l5qqS2qwEO+Yze/TN9E7sf9I4DD7KXM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-225-JAEE1L7uMGumKjh5O5Xg_g-1; Tue, 12 Oct 2021 09:46:12 -0400
X-MC-Unique: JAEE1L7uMGumKjh5O5Xg_g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 07EA218BDF00;
 Tue, 12 Oct 2021 13:46:11 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-14.ams2.redhat.com
 [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8390469217;
 Tue, 12 Oct 2021 13:45:48 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id B00A6113865F; Tue, 12 Oct 2021 15:45:37 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Eugenio Perez Martin <eperezma@redhat.com>
Subject: Re: [RFC PATCH v4 05/20] vhost: Add x-vhost-enable-shadow-vq qmp
References: <20211001070603.307037-1-eperezma@redhat.com>
 <20211001070603.307037-6-eperezma@redhat.com>
 <877deihlcd.fsf@dusky.pond.sub.org>
 <CAJaqyWcz6+ce+T3GYPa7durLEwxN8OdwK=7KCYbcD1o03uj4Xw@mail.gmail.com>
Date: Tue, 12 Oct 2021 15:45:37 +0200
In-Reply-To: <CAJaqyWcz6+ce+T3GYPa7durLEwxN8OdwK=7KCYbcD1o03uj4Xw@mail.gmail.com>
 (Eugenio Perez Martin's message of "Tue, 12 Oct 2021 15:08:44 +0200")
Message-ID: <87pmsa5pby.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
 Jason Wang <jasowang@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-level <qemu-devel@nongnu.org>,
 virtualization <virtualization@lists.linux-foundation.org>,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Eric Blake <eblake@redhat.com>, Michael Lilja <ml@napatech.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Eugenio Perez Martin <eperezma@redhat.com> writes:

> On Tue, Oct 12, 2021 at 7:18 AM Markus Armbruster <armbru@redhat.com> wro=
te:
>>
>> Eugenio P=C3=A9rez <eperezma@redhat.com> writes:
>>
>> > Command to enable shadow virtqueue.
>> >
>> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
>> > ---
>> >  qapi/net.json          | 23 +++++++++++++++++++++++
>> >  hw/virtio/vhost-vdpa.c |  8 ++++++++
>> >  2 files changed, 31 insertions(+)
>> >
>> > diff --git a/qapi/net.json b/qapi/net.json
>> > index 7fab2e7cd8..a2c30fd455 100644
>> > --- a/qapi/net.json
>> > +++ b/qapi/net.json
>> > @@ -79,6 +79,29 @@
>> >  { 'command': 'netdev_del', 'data': {'id': 'str'},
>> >    'allow-preconfig': true }
>> >
>> > +##
>> > +# @x-vhost-enable-shadow-vq:
>> > +#
>> > +# Use vhost shadow virtqueue.
>> > +#
>> > +# @name: the device name of the VirtIO device
>>
>> Is this a qdev ID?  A network client name?
>
> At this moment is the virtio device name, the one specified at the
> call of "virtio_init". But this should change, maybe the qdev id or
> something that can be provided by the command line fits better here.

To refer to a device backend, we commonly use a backend-specific ID.
For network backends, that's NetClientState member name.

To refer to a device frontend, we commonly use a qdev ID or a QOM path.

[...]


