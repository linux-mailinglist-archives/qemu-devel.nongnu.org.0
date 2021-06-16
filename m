Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C1253A9BFB
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 15:28:31 +0200 (CEST)
Received: from localhost ([::1]:55660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltVan-0005w1-ON
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 09:28:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ltVYs-0003OD-8t
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 09:26:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30273)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ltVYm-0003ir-C5
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 09:26:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623849979;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FB7tPd0W444OoB3gmiXZgTBZAzNr5Vuk8bax19sSlVo=;
 b=jSnj67kMcIZ0epNlCQwd8yN3d3Mx5K63pYcHr8CqX3RKWUFtTMO3yBU9Yz0bssLy2Ew5fW
 ZdOXfzTKbkZGoB6WJeYeaBXBc0kZXuODXpDZ7EX/l/1QM3d1bTFcQ3YmhUqKB9C73XoPLd
 dizdFp4UR1Abd5w2XQWYOPx1b5uFAjc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-444-jUGQb0ykNJanIPTLUd3epg-1; Wed, 16 Jun 2021 09:26:17 -0400
X-MC-Unique: jUGQb0ykNJanIPTLUd3epg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8B617101258F;
 Wed, 16 Jun 2021 13:26:16 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-104.ams2.redhat.com
 [10.36.112.104])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9FD8010023B5;
 Wed, 16 Jun 2021 13:26:12 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 273FE113865F; Wed, 16 Jun 2021 15:26:11 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: "Zhang, Chen" <chen.zhang@intel.com>
Subject: Re: [PATCH V8 1/6] qapi/net: Add IPFlowSpec and QMP command for
 COLO passthrough
References: <20210615113740.2278015-1-chen.zhang@intel.com>
 <20210615113740.2278015-2-chen.zhang@intel.com>
 <87zgvrnq7w.fsf@dusky.pond.sub.org>
 <8f58a8dcb58849dd917deaea2a728358@intel.com>
 <874kdymjkk.fsf@dusky.pond.sub.org>
 <92b342dd48ca4b8c917ff6afd9574dcd@intel.com>
Date: Wed, 16 Jun 2021 15:26:11 +0200
In-Reply-To: <92b342dd48ca4b8c917ff6afd9574dcd@intel.com> (Chen Zhang's
 message of "Wed, 16 Jun 2021 06:45:01 +0000")
Message-ID: <87a6nqhrf0.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
 Daniel =?utf-8?Q?P=2EBerrang?= =?utf-8?Q?=C3=A9?= <berrange@redhat.com>,
 Li Zhijian <lizhijian@cn.fujitsu.com>, Jason Wang <jasowang@redhat.com>,
 qemu-dev <qemu-devel@nongnu.org>, "Dr. David Alan
 Gilbert" <dgilbert@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Zhang Chen <zhangckid@gmail.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"Zhang, Chen" <chen.zhang@intel.com> writes:

>> -----Original Message-----
>> From: Markus Armbruster <armbru@redhat.com>
>> Sent: Wednesday, June 16, 2021 2:04 PM
>> To: Zhang, Chen <chen.zhang@intel.com>
>> Cc: Lukas Straub <lukasstraub2@web.de>; Daniel P.Berrang=C3=A9
>> <berrange@redhat.com>; Li Zhijian <lizhijian@cn.fujitsu.com>; Jason Wang
>> <jasowang@redhat.com>; qemu-dev <qemu-devel@nongnu.org>; Dr. David
>> Alan Gilbert <dgilbert@redhat.com>; Gerd Hoffmann <kraxel@redhat.com>;
>> Zhang Chen <zhangckid@gmail.com>; Eric Blake <eblake@redhat.com>
>> Subject: Re: [PATCH V8 1/6] qapi/net: Add IPFlowSpec and QMP command
>> for COLO passthrough
>>=20
>> "Zhang, Chen" <chen.zhang@intel.com> writes:
>>=20
>> >> -----Original Message-----
>> >> From: Markus Armbruster <armbru@redhat.com>
>> >> Sent: Tuesday, June 15, 2021 10:43 PM
>> >> To: Zhang, Chen <chen.zhang@intel.com>
>> >> Cc: Jason Wang <jasowang@redhat.com>; qemu-dev <qemu-
>> >> devel@nongnu.org>; Eric Blake <eblake@redhat.com>; Dr. David Alan
>> >> Gilbert <dgilbert@redhat.com>; Daniel P.Berrang=C3=A9
>> >> <berrange@redhat.com>; Gerd Hoffmann <kraxel@redhat.com>; Li
>> Zhijian
>> >> <lizhijian@cn.fujitsu.com>; Lukas Straub <lukasstraub2@web.de>; Zhang
>> >> Chen <zhangckid@gmail.com>
>> >> Subject: Re: [PATCH V8 1/6] qapi/net: Add IPFlowSpec and QMP
>> command
>> >> for COLO passthrough
>> >>
>> >> Zhang Chen <chen.zhang@intel.com> writes:
>> >>
>> >> > Since the real user scenario does not need COLO to monitor all traf=
fic.
>> >> > Add colo-passthrough-add and colo-passthrough-del to maintain a
>> >> > COLO network passthrough list. Add IPFlowSpec struct for all QMP co=
mmands.
>> >> > All the fields of IPFlowSpec are optional.
>> >> >
>> >> > Signed-off-by: Zhang Chen <chen.zhang@intel.com>
>> >> > ---
>> >>
>> >> The QAPI schema looks good to me, but the interface documentation is
>> >> still not quite clear enough.  To make progress, I'm going to make
>> >> concrete suggestions wherever I can despite being quite clueless
>> >> about the subject matter.  Risks me writing something that's clearer,
>> >> but wrong.  Keep that in mind, please.
>> >>
>> >> >  net/net.c     | 10 +++++++
>> >> >  qapi/net.json | 74
>> >> > +++++++++++++++++++++++++++++++++++++++++++++++++++
>> >> >  2 files changed, 84 insertions(+)
>> >> >
>> >> > diff --git a/net/net.c b/net/net.c
>> >> > index 76bbb7c31b..f913e97983 100644
>> >> > --- a/net/net.c
>> >> > +++ b/net/net.c
>> >> > @@ -1195,6 +1195,16 @@ void qmp_netdev_del(const char *id, Error **=
errp)
>> >> >      }
>> >> >  }
>> >> >
>> >> > +void qmp_colo_passthrough_add(IPFlowSpec *spec, Error **errp) {
>> >> > +    /* TODO implement setup passthrough rule */ }
>> >> > +
>> >> > +void qmp_colo_passthrough_del(IPFlowSpec *spec, Error **errp) {
>> >> > +    /* TODO implement delete passthrough rule */ }
>> >> > +
>> >> >  static void netfilter_print_info(Monitor *mon, NetFilterState *nf)=
  {
>> >> >      char *str;
>> >> > diff --git a/qapi/net.json b/qapi/net.json index
>> >> > 7fab2e7cd8..91f2e1495a 100644
>> >> > --- a/qapi/net.json
>> >> > +++ b/qapi/net.json
>> >> > @@ -7,6 +7,7 @@
>> >> >  ##
>> >> >
>> >> >  { 'include': 'common.json' }
>> >> > +{ 'include': 'sockets.json' }
>> >> >
>> >> >  ##
>> >> >  # @set_link:
>> >> > @@ -696,3 +697,76 @@
>> >> >  ##
>> >> >  { 'event': 'FAILOVER_NEGOTIATED',
>> >> >    'data': {'device-id': 'str'} }
>> >> > +
>> >> > +##
>> >> > +# @IPFlowSpec:
>> >> > +#
>> >> > +# IP flow specification.
>> >> > +#
>> >> > +# @protocol: Transport layer protocol like TCP/UDP, etc. The proto=
col is the
>> >> > +#            string instead of enum, because it can be passed to g=
etprotobyname(3)
>> >> > +#            and avoid duplication with /etc/protocols.
>> >>
>> >> The rationale is good, but it doesn't really belong into the
>> >> interface documentation.  Suggest:
>> >>
>> >>    # @protocol: Transport layer protocol like TCP/UDP, etc.  This wil=
l be
>> >>    #            passed to getprotobyname(3).
>> >>
>> >
>> > OK.
>> >
>> >>
>> >> > +#
>> >> > +# @object-name: The @object-name means packet handler in Qemu. Bec=
ause not
>> >> > +#               all the network packet must pass the colo-compare =
module,
>> >> > +#               the net-filters are same situation. There modules =
attach to
>> >> > +#               netdev or chardev to work, VM can run multiple mod=
ules
>> >> > +#               at the same time. So it needs the object-name to s=
et
>> >> > +#               the effective module.
>> >>
>> >> I still don't understand this, and I'm too ignorant of COLO and
>> >> networking to suggest improvements.
>> >
>> > Let me use qemu boot parameter to clear it.
>> > For colo-compare, it needs chardev as the source to handle network pac=
ket.
>> > -object colo-compare,id=3Dcomp0,primary_in=3Dchardev-input0,secondary_=
in=3Dchardev-input1,outdev=3Dchardev-output0,iothread=3Diothread0.
>> >
>> > For net filters, it needs attached on netdev.
>> > -object filter-redirector,id=3Dred0,netdev=3Dhn0,queue=3Drx,outdev=3Dc=
hardev-output1
>> > -object filter-mirror,id=3Dmirror0,netdev=3Dhn0,queue=3Drx,outdev=3Dch=
ardev-output2
>> >
>> > And we can use -chardev socket combine the filter and the colo-compare=
.
>> >
>> > Back to the @object-name, One guest maybe have multi colo-compare as t=
he same time, with different object name from different source.
>> > So we need assign the IPFlowSpec to one object as the handler. Same as=
 the net-filters.
>> > Each object instance has its own passthrough list.
>>=20
>> So the @object-name here references one of the "packet handler objects"
>> (colo-compare, filter-redirector, filter-mirror) by @id.  Correct?
>
> Yes.
>
>>=20
>> In other words, @object-name is the ID of a QOM object, and the QOM
>> object must be of a certain kind (i.e. provide certain functionality).
>> Correct?
>
> Yes.

Got it.

>> What exactly makes a QOM object a "packet handler object?"
>>=20
>
> Firstly, the original object need have basic network packet input/output =
capability.
> It's a good question, maybe we need add a flag in general object structur=
e to show the capability.

A QOM interface might fit the bill: a QOM type is a packet handler if
and only if it implements the packet handler interface.
=20
>> Right now, the packet handler object types are colo-compare, filter-
>> redirector, filter-mirror, and that's all.  Correct?
>
> No, this series just make colo-compare become a packet handler, This is a=
 beginning, I plan to make other filters support it.

Okay.

Are these other filters similarly related to COLO?  I'm asking because
the commands are called colo-passthrough-FOO.  If this goes beyond COLO,
we may want to name them differently.

>> Another question the doc comment needs to answer: what happens when
>> @object-name is absent?
>
> Please see the explanation below.

You seem to consider making it mandatory there.  My question would be
moot then.

>> >> Jason or David, perhaps?
>> >>
>> >> > +#
>> >> > +# @source: Source address and port.
>> >> > +#
>> >> > +# @destination: Destination address and port.
>> >> > +#
>> >> > +# Since: 6.1
>> >> > +##
>> >> > +{ 'struct': 'IPFlowSpec',
>> >> > +  'data': { '*protocol': 'str', '*object-name': 'str',
>> >> > +    '*source': 'InetSocketAddressBase',
>> >> > +    '*destination': 'InetSocketAddressBase' } }
>> >> > +
>> >> > +##
>> >> > +# @colo-passthrough-add:
>> >> > +#
>> >> > +# Add passthrough entry IPFlowSpec to the COLO-compare instance.
>> >> > +# The protocol and source/destination IP/ports are optional. if
>> >> > +the user # only inputs part of the information, this will match al=
l traffic.
>> >>
>> >> Actually, all arguments are optional.
>> >>
>> >> Suggest:
>> >>
>> >>    # Add an entry to the COLO network passthrough list.
>> >>    # Absent protocol, host addresses and ports match anything.
>> >>
>> >> If there is more than one such list, then "to a COLO network passthro=
ugh list"
>> >> instead.
>> >
>> > Yes, more than one list.
>> >
>> >>
>> >> Still missing then: meaning of absent @object-name.  Does it select
>> >> the COLO network passthrough list, perhaps?
>> >
>> > Yes, Please see the explanation above. Each object instance has its ow=
n passthrough list.
>>=20
>> Got it now.
>>=20
>> >> > +#
>> >> > +# Returns: Nothing on success
>> >> > +#
>> >> > +# Since: 6.1
>> >> > +#
>> >> > +# Example:
>> >> > +#
>> >> > +# -> { "execute": "colo-passthrough-add",
>> >> > +#      "arguments": { "protocol": "tcp", "object-name": "object0",
>> >> > +#      "source": {"host": "192.168.1.1", "port": "1234"},
>> >> > +#      "destination": {"host": "192.168.1.2", "port": "4321"} } }
>> >> > +# <- { "return": {} }
>> >> > +#
>> >> > +##
>> >> > +{ 'command': 'colo-passthrough-add', 'boxed': true,
>> >> > +     'data': 'IPFlowSpec' }
>> >> > +
>> >> > +##
>> >> > +# @colo-passthrough-del:
>> >> > +#
>> >> > +# Delete passthrough entry IPFlowSpec to the COLO-compare instance=
.
>> >> > +# The protocol and source/destination IP/ports are optional. if
>> >> > +the user # only inputs part of the information, this will match al=
l traffic.
>> >>
>> >> I suspect this command doesn't actually match traffic, it matches
>> >> entries added with colo-passthrough-add.
>> >
>> > Yes.
>> >
>> >>
>> >> Can it delete more than one such entry?
>> >>
>> >
>> > Currently no, but it easy to match one more entry to delete.
>>=20
>> If the passthrough list entries had some unique ID, we could refer to on=
e
>> entry by its ID.  It's how things commonly work.
>>=20
>> Without an ID, we need to match by value, like you do.  I can see three
>> possible behaviors:
>>=20
>> 1. Select first entry that matches.
>>=20
>> 2. Select all entries that match.
>>=20
>> 3. If exactly one entry matches, select it.
>>=20
>> The second design choice is behavior when nothing gets selected:
>>=20
>> a. Silently do nothing
>>=20
>> b. Error
>>=20
>> Which one did you implement?  My guess based on your answers is 1a.
>
> Re-think about it,  If we want to match by value, we need know which obje=
ct have the capability and search in each object passthrough list.
> Obviously, we haven't such flag in object structure. So It more reasonabl=
e to make @object-name as a must at the beginning.
> Because the passthrough list always in the network handler object. Maybe =
we need a global passthrough list for each guest to handle it in the future=
.
> It will have two-level passthrough list to control network.

I'm not sure I understand.

If you make @object-name mandatory both for colo-passthrough-add and
colo-passthrough-del, then we can simply use @object-name to find the
object, check it implements the packet handler interface, use the packet
handler interface to get its passthrough list, then add to / delete from
that list.

If we find a use for making @object-name optional later, we can do so
without breaking compatibility.


