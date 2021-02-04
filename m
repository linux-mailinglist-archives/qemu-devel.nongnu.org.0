Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D4B930F300
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 13:17:53 +0100 (CET)
Received: from localhost ([::1]:40572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7da4-0004jH-N0
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 07:17:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l7dYa-0003qA-BL
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 07:16:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l7dYX-0003m0-LV
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 07:16:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612440976;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZLjX9hzFEvNLdffyS6lE3UIqKKEcNIyzWScy5mwql9c=;
 b=Ai49GfT2cgmMOLHDrQ8FcGpMla8q+p7e5LAfysxA9A1BW/nwm+UbLBz0C+xZ+kn3g5i+i0
 2547x26L7uPSk/8B2o7P/0ZT0rJjjy8DvNmPJO7YP4DtyuqgOLUf0FY5gisfZe6TMfistQ
 BVJx6foAMXdPmtvyuRzP4Hi+Bz91qpc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-300-aOzyxub9MPuoDIRSekBQaw-1; Thu, 04 Feb 2021 07:16:13 -0500
X-MC-Unique: aOzyxub9MPuoDIRSekBQaw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5A6FF1020C2C;
 Thu,  4 Feb 2021 12:16:11 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-115-51.ams2.redhat.com
 [10.36.115.51])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 68FA65D6D7;
 Thu,  4 Feb 2021 12:16:04 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id EC6DD113865F; Thu,  4 Feb 2021 13:16:02 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Eugenio Perez Martin <eperezma@redhat.com>
Subject: Re: [RFC 08/10] vhost: Add x-vhost-enable-shadow-vq qmp
References: <20210129205415.876290-1-eperezma@redhat.com>
 <20210129205415.876290-9-eperezma@redhat.com>
 <4ab76cf6-401b-97de-6154-2e025cb1ebc6@redhat.com>
 <CAJaqyWc5_nmniTDsjCCpJpERvMq5RsB0xebeNuP8=oVnHQkovg@mail.gmail.com>
Date: Thu, 04 Feb 2021 13:16:02 +0100
In-Reply-To: <CAJaqyWc5_nmniTDsjCCpJpERvMq5RsB0xebeNuP8=oVnHQkovg@mail.gmail.com>
 (Eugenio Perez Martin's message of "Thu, 4 Feb 2021 10:01:09 +0100")
Message-ID: <87v9b8hvul.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
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
 Rob Miller <rob.miller@broadcom.com>, Michael Lilja <ml@napatech.com>,
 Jim Harford <jim.harford@broadcom.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Eugenio Perez Martin <eperezma@redhat.com> writes:

> On Tue, Feb 2, 2021 at 4:38 PM Eric Blake <eblake@redhat.com> wrote:
>>
>> On 1/29/21 2:54 PM, Eugenio P=C3=A9rez wrote:
[...]
>> > diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
>> > index 040f68ff2e..42836e45f3 100644
>> > --- a/hw/virtio/vhost.c
>> > +++ b/hw/virtio/vhost.c
>> > @@ -15,6 +15,7 @@
>> >
>> >  #include "qemu/osdep.h"
>> >  #include "qapi/error.h"
>> > +#include "qapi/qapi-commands-net.h"
>> >  #include "hw/virtio/vhost.h"
>> >  #include "qemu/atomic.h"
>> >  #include "qemu/range.h"
>> > @@ -1841,3 +1842,8 @@ int vhost_net_set_backend(struct vhost_dev *hdev=
,
>> >
>> >      return -1;
>> >  }
>> > +
>> > +void qmp_x_vhost_enable_shadow_vq(const char *name, bool enable, Erro=
r **errp)
>> > +{
>> > +    error_setg(errp, "Shadow virtqueue still not implemented.");
>>
>> error_setg() should not be passed a trailing '.'.
>>
>
> Oh, sorry I missed the comment in the error_setg doc.
>
> I copy&pasted from the call to error_setg "Migration disabled: vhost
> lacks VHOST_F_LOG_ALL feature.". I'm wondering if it's a good moment
> to delete the dot there too, since other tools could depend on parsing
> it.

It's pretty much always a good moment for patches improving error
messages :)


