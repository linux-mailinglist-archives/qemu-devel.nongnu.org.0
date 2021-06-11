Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A3A43A3F32
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Jun 2021 11:38:38 +0200 (CEST)
Received: from localhost ([::1]:37886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrdca-0005WB-Ud
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 05:38:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lrdb6-0004nW-Oe
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 05:37:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lrdb2-0003CM-8E
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 05:37:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623404219;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dIcUuT+gvXDSQFvxukslWsiZWvy6eXwxSoZDRUmDH5E=;
 b=XPl2zTRekDLsLJcMS7vrsipEsfS9qBRhTCKYlviaww6Nbat1Gt8RLIlXfk7h5uUGfc/K65
 bLD5rpWaKX5DHFxvGoBElaL2zO06Bj/kK3s9wCARryIzoile1dqmVD34Ognu1Xcjkny3G9
 OjDYdYAn5yFXs6pnOgq5LN4V6wGRXJc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-250-2Gt2K8gaPj2-8iugiw2_yg-1; Fri, 11 Jun 2021 05:36:57 -0400
X-MC-Unique: 2Gt2K8gaPj2-8iugiw2_yg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 11ED2100C663;
 Fri, 11 Jun 2021 09:36:56 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-222.ams2.redhat.com
 [10.36.112.222])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 75C951980D;
 Fri, 11 Jun 2021 09:36:52 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 11B82113865F; Fri, 11 Jun 2021 11:36:51 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: "Zhang, Chen" <chen.zhang@intel.com>
Subject: Re: [PATCH V7 1/6] qapi/net: Add IPFlowSpec and QMP command for
 COLO passthrough
References: <20210526025424.1319994-1-chen.zhang@intel.com>
 <20210526025424.1319994-2-chen.zhang@intel.com>
 <20210604143521.ej6n7g5tlawkhwpj@redhat.com>
 <9a7a70304c304d2f99e5ee952eddf49f@intel.com>
Date: Fri, 11 Jun 2021 11:36:51 +0200
In-Reply-To: <9a7a70304c304d2f99e5ee952eddf49f@intel.com> (Chen Zhang's
 message of "Fri, 4 Jun 2021 15:57:27 +0000")
Message-ID: <87mtrwspxo.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
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
Cc: Lukas Straub <lukasstraub2@web.de>,
 "Daniel P. =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 Li Zhijian <lizhijian@cn.fujitsu.com>, Jason Wang <jasowang@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-dev <qemu-devel@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Zhang Chen <zhangckid@gmail.com>,
 Eric Blake <eblake@redhat.com>, "Dr.
 David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"Zhang, Chen" <chen.zhang@intel.com> writes:

>> -----Original Message-----
>> From: Eric Blake <eblake@redhat.com>
>> Sent: Friday, June 4, 2021 10:35 PM
>> To: Zhang, Chen <chen.zhang@intel.com>
>> Cc: Jason Wang <jasowang@redhat.com>; qemu-dev <qemu-
>> devel@nongnu.org>; Dr. David Alan Gilbert <dgilbert@redhat.com>; Markus
>> Armbruster <armbru@redhat.com>; Daniel P. Berrang=C3=A9
>> <berrange@redhat.com>; Gerd Hoffmann <kraxel@redhat.com>; Li Zhijian
>> <lizhijian@cn.fujitsu.com>; Zhang Chen <zhangckid@gmail.com>; Lukas
>> Straub <lukasstraub2@web.de>
>> Subject: Re: [PATCH V7 1/6] qapi/net: Add IPFlowSpec and QMP command
>> for COLO passthrough
>>=20
>> On Wed, May 26, 2021 at 10:54:19AM +0800, Zhang Chen wrote:
>> > Since the real user scenario does not need COLO to monitor all traffic=
.
>> > Add colo-passthrough-add and colo-passthrough-del to maintain a COLO
>> > network passthrough list. Add IPFlowSpec struct for all QMP commands.
>> > Except protocol field is necessary, other fields are optional.
>>=20
>> That last sentence reads awkwardly, and I don't see a protocol field in =
the
>> patch below.
>
> Oh, We move the protocol field to optional by Lukas's comments in V6.
> I will remove this comments here.
>
>>=20
>> >
>> > Signed-off-by: Zhang Chen <chen.zhang@intel.com>
>> > ---
>> >  net/net.c     | 10 ++++++++
>> >  qapi/net.json | 68
>> > +++++++++++++++++++++++++++++++++++++++++++++++++++
>> >  2 files changed, 78 insertions(+)
>> >
>>=20
>> > +++ b/qapi/net.json
>> > @@ -7,6 +7,7 @@
>> >  ##
>> >
>> >  { 'include': 'common.json' }
>> > +{ 'include': 'sockets.json' }
>> >
>> >  ##
>> >  # @set_link:
>> > @@ -694,3 +695,70 @@
>> >  ##
>> >  { 'event': 'FAILOVER_NEGOTIATED',
>> >    'data': {'device-id': 'str'} }
>> > +
>> > +##
>> > +# @IPFlowSpec:
>> > +#
>> > +# IP flow specification.
>> > +#
>> > +# @protocol: Transport layer protocol like TCP/UDP...
>>=20
>> Why is this open-coded as 'str' instead of an enum?
>
> The original code use enum, but we change it by Dave and Markus's comment=
s.
> Please check the history:
> https://lists.gnu.org/archive/html/qemu-devel/2021-04/msg03919.html

It's a string to be passed to getprotobyname(3).  Please mention that in
the doc string.

It's not an enum, because we don't want to duplicate /etc/protocols in
the QAPI schema.

>> > +#
>> > +# @object-name: Point out the IPflow spec effective range of object,

I have no idea what that means :)

It might be what was called @id in v4.  There, you explained

    The @id means packet hander in Qemu. Because not all the guest network =
packet into the colo-compare module, the net-filters are same cases.
    There modules attach to NIC or chardev socket to work, VM maybe have mu=
lti modules running. So we use the ID to set the rule to the specific modul=
e.=20

and I asked you to work it into the doc comment.

If you want help with working it into the doc comment, please explain
its intended use for dummies :)

>> > +#               If there is no such part, it means global spec.
>> > +#
>> > +# @source: Source address and port.
>> > +#
>> > +# @destination: Destination address and port.
>> > +#
>> > +# Since: 6.1
>> > +##
>> > +{ 'struct': 'IPFlowSpec',
>> > +  'data': { '*protocol': 'str', '*object-name': 'str',
>> > +    '*source': 'InetSocketAddressBase',
>> > +    '*destination': 'InetSocketAddressBase' } }
>> > +
>> > +##
>> > +# @colo-passthrough-add:
>> > +#
>> > +# Add passthrough entry according to user's needs in COLO-compare.
>> > +# Source IP/port and destination IP/port both optional, If user just
>> > +# input parts of infotmation, it will match all.
>>=20
>> information
>>=20
>> Grammar suggestion:
>>=20
>> The source and destination IP/ports are both optional; if the user only =
inputs
>> part of the information, this will match all traffic.
>>=20
>> except I'm not sure if my rewrite conveys the actual intent.
>
> Looks good to me, It should add the "protocol" to optional too.
> Sorry, I'm not a native speaker, I will fix it in next version.
>
>>=20
>> > +#
>> > +# Returns: Nothing on success
>> > +#
>> > +# Since: 6.1
>> > +#
>> > +# Example:
>> > +#
>> > +# -> { "execute": "colo-passthrough-add",
>> > +#      "arguments": { "protocol": "tcp", "object-name": "object0",
>> > +#      "source": {"host": "192.168.1.1", "port": "1234"},
>> > +#      "destination": {"host": "192.168.1.2", "port": "4321"} } }
>> > +# <- { "return": {} }
>> > +#
>> > +##
>> > +{ 'command': 'colo-passthrough-add', 'boxed': true,
>> > +     'data': 'IPFlowSpec' }
>> > +
>> > +##
>> > +# @colo-passthrough-del:
>> > +#
>> > +# Delete passthrough entry according to user's needs in COLO-compare.
>> > +# Source IP/port and destination IP/port both optional, If user just
>> > +# input parts of infotmation, it will match all.
>>=20
>> Same problems as above.
>
> OK.
>
> Thanks
> Chen
>
>>=20
>> > +#
>> > +# Returns: Nothing on success
>> > +#
>> > +# Since: 6.1
>> > +#
>> > +# Example:
>> > +#
>> > +# -> { "execute": "colo-passthrough-del",
>> > +#      "arguments": { "protocol": "tcp", "object-name": "object0",
>> > +#      "source": {"host": "192.168.1.1", "port": "1234"},
>> > +#      "destination": {"host": "192.168.1.2", "port": "4321"} } }
>> > +# <- { "return": {} }
>> > +#
>> > +##
>> > +{ 'command': 'colo-passthrough-del', 'boxed': true,
>> > +     'data': 'IPFlowSpec' }
>> > --
>> > 2.25.1
>> >
>>=20
>> --
>> Eric Blake, Principal Software Engineer
>> Red Hat, Inc.           +1-919-301-3266
>> Virtualization:  qemu.org | libvirt.org


