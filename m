Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 348EA3471D9
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 07:49:12 +0100 (CET)
Received: from localhost ([::1]:57074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOxK8-0002ZK-Pq
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 02:49:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lOxIc-00028X-Lz
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 02:47:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55837)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lOxIR-0003r7-Pz
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 02:47:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616568433;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=s7WSF/HtbfExQF4O5vDNCd61cNVYKWAzeGkQrXTl/8I=;
 b=BZEUhIhJu84HxPi9jarZbjYIklE0xtMjNWc+eIS+rfDF+GI0CuMCA0iyrhF+XLmSDK8hmN
 gAIuCz2KqfhIjWRCMMBzWD5eCs/sOqGN8DDCX3FKW9D7WOhKxAdIlfU/VisjgGuNepiRq6
 QoBZLnAWUzfwc+NUzfj7AQAX3/PYsAY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-254-Vv1POjeJMYqSq_n9gRsYGg-1; Wed, 24 Mar 2021 02:47:11 -0400
X-MC-Unique: Vv1POjeJMYqSq_n9gRsYGg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 828CF107ACCA;
 Wed, 24 Mar 2021 06:47:10 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2864F10027C4;
 Wed, 24 Mar 2021 06:47:10 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id AFF2811327E1; Wed, 24 Mar 2021 07:47:08 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH V4 2/7] qapi/net.json: Add L4_Connection definition
References: <20210319035508.113741-1-chen.zhang@intel.com>
 <20210319035508.113741-3-chen.zhang@intel.com>
 <877dm3i1qk.fsf@dusky.pond.sub.org>
 <5b75057ecc784296aa271f5f6692906a@intel.com>
 <87k0pz4bg8.fsf@dusky.pond.sub.org>
 <4ffb0d8b135b40caba777a830b70ae18@intel.com>
 <871rc6urdc.fsf@dusky.pond.sub.org> <YFpML7sdeUiciL3B@work-vm>
Date: Wed, 24 Mar 2021 07:47:08 +0100
In-Reply-To: <YFpML7sdeUiciL3B@work-vm> (David Alan Gilbert's message of "Tue, 
 23 Mar 2021 20:14:39 +0000")
Message-ID: <87mtutf3pv.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Lukas Straub <lukasstraub2@web.de>, Li Zhijian <lizhijian@cn.fujitsu.com>,
 Jason Wang <jasowang@redhat.com>, qemu-dev <qemu-devel@nongnu.org>, "Zhang,
 Chen" <chen.zhang@intel.com>, Zhang Chen <zhangckid@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"Dr. David Alan Gilbert" <dgilbert@redhat.com> writes:

> * Markus Armbruster (armbru@redhat.com) wrote:
>> "Zhang, Chen" <chen.zhang@intel.com> writes:
>> 
>> >> -----Original Message-----
>> >> From: Markus Armbruster <armbru@redhat.com>
>> [...]
>> >> Naming the argument type L4_Connection is misleading.
>> >> 
>> >> Even naming the match arguments L4_Connection would be misleading.
>> >> "Connection" has a specific meaning in networking.  There are TCP
>> >> connections.  There is no such thing as an UDP connection.
>> >> 
>> >> A TCP connection is uniquely identified by a pair of endpoints, i.e. by source
>> >> address, source port, destination address, destination port.
>> >> Same for other connection-oriented protocols.  The protocol is not part of
>> >> the connection.  Thus, L4_Connection would be misleading even for the
>> >> connection-oriented case.
>> >> 
>> >> You need a named type for colo-passthrough-add's argument because you
>> >> share it with colo-passthrough-del.  I'm not sure that's what we want (I'm
>> >> going to write more on that in a moment).  If it is what we want, then please
>> >> pick a another, descriptive name.
>> >
>> > What do you think the "L4BypassRule" or "NetworkRule" ?
>> 
>> NetworkRule is too generic.
>> 
>> What about ColoPassthroughRule?
>
> Which is a bit specific; there's not actually anything Colo specific in
> there; can I suggest 'L4FlowSpec';

"A bit too specific" is mostly harmless, since we can rename types at
any time (they are not visible in external interfaces).

This is *not* an objection to less specific names.  All I want is names
that don't give me wrong ideas on the thing's purpose.  L4FlowSpec and
IPFlowSpec (below) feel fine in that regard.

>                                     I think there should also beb
> a separate type that represents an IP address+port, so that what you end
> up with is:
>
>   IPFlowSpec
>      ID
>      Protocol
>      Source
>      Dest

I understand the motivation.  Three drawbacks, though.

One, it gets us another level of nesting on the wire, i.e. something
like

    {"source": {"address": SRC-ADDR, "port": SRC-PORT},
     "destination": {"address": DST-ADDR, "port": DST-PORT}}

instead of

    {"source-address": SRC-ADDR, "source-port": SRC-PORT,
     "destination-address": DST-ADDR, "destination-port": DST-PORT}

QMP clients shouldn't care.

Two, we have many (address, port) pairs in the schema that don't use
nesting.  Adding nesting sometimes makes QMP less consistent.

Three, human-friendly interface wrappers tend to dislike nesting.  This
particular case seems okay; we end up with dotted keys like
source.address instead of source-address.  In a case where we need just
one (address, port), we'd get some-silly-name.address instead of just
address, though.

I've occasionally felt a mild need for letting me say "this struct
member should be unboxed on the wire", i.e. have its curlies peeled off.
Never enough to justify the additional generator complexity, though.


