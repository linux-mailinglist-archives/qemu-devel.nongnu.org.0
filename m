Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D45C3E352B
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Aug 2021 13:33:49 +0200 (CEST)
Received: from localhost ([::1]:34978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mCKaJ-0000oL-MA
	for lists+qemu-devel@lfdr.de; Sat, 07 Aug 2021 07:33:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mCKYt-00006K-Hp
 for qemu-devel@nongnu.org; Sat, 07 Aug 2021 07:32:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36446)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mCKYp-0000Y3-Ih
 for qemu-devel@nongnu.org; Sat, 07 Aug 2021 07:32:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628335933;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mqv2vj/KC8wS3PSnCa43YEjLvPVkj2IjZ8aJs+uTgQs=;
 b=ZcG0oy0p6JgMP4+kCZbvPIj5zFyYm+j6fpLmuFNTkekP5/DPWWrvqbuLSaLgV10v6qJFFi
 Cba3Z9oCfS50Ryj1P9k/JQ5v5Ar7pllOUgTi/mK19fAJLpDnBspaKZEW5VowruFSYUm6FA
 Jdm5eSxygLwLSc/nzD0eCDlC0hpvg4c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-319-ebfD4Rr7MJOfPnEKO-zMDQ-1; Sat, 07 Aug 2021 07:32:12 -0400
X-MC-Unique: ebfD4Rr7MJOfPnEKO-zMDQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 44C4D1006C80;
 Sat,  7 Aug 2021 11:32:11 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-12.ams2.redhat.com
 [10.36.112.12])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0620417CF0;
 Sat,  7 Aug 2021 11:32:06 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 8D70A11380A0; Sat,  7 Aug 2021 13:32:05 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Zhang Chen <chen.zhang@intel.com>
Subject: Re: [PULL V3 for 6.2 1/6] qapi/net: Add IPFlowSpec and QMP command
 for filter passthrough
References: <20210719090051.3824672-1-chen.zhang@intel.com>
 <20210719090051.3824672-2-chen.zhang@intel.com>
Date: Sat, 07 Aug 2021 13:32:05 +0200
In-Reply-To: <20210719090051.3824672-2-chen.zhang@intel.com> (Zhang Chen's
 message of "Mon, 19 Jul 2021 17:00:46 +0800")
Message-ID: <874kc1h4ne.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: Lukas Straub <lukasstraub2@web.de>,
 "Daniel P. =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 Li Zhijian <lizhijian@cn.fujitsu.com>, Jason Wang <jasowang@redhat.com>, "Dr.
 David Alan Gilbert" <dgilbert@redhat.com>, qemu-dev <qemu-devel@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I see Jason queued this while I was failing at keeping up with review.
I apologize for dropping the ball.

There still are a few unresolved issues I raised in prior review.  The
documentation is not ready, and there is no consensus on the design of
passthrough-filter-del.

If we merge this as is for 6.2, then I want my review to be addressed on
top.

Zhang Chen <chen.zhang@intel.com> writes:

> Since the real user scenario does not need to monitor all traffic.
> Add passthrough-filter-add and passthrough-filter-del to maintain
> a network passthrough list in object with network packet processing
> function. Add IPFlowSpec struct for all QMP commands.
> Most the fields of IPFlowSpec are optional,except object-name.
>
> Signed-off-by: Zhang Chen <chen.zhang@intel.com>
> ---

[...]

> diff --git a/qapi/net.json b/qapi/net.json
> index 7fab2e7cd8..bfe38faab5 100644
> --- a/qapi/net.json
> +++ b/qapi/net.json
> @@ -7,6 +7,7 @@
>  ##
>  
>  { 'include': 'common.json' }
> +{ 'include': 'sockets.json' }
>  
>  ##
>  # @set_link:
> @@ -696,3 +697,80 @@
>  ##
>  { 'event': 'FAILOVER_NEGOTIATED',
>    'data': {'device-id': 'str'} }
> +
> +##
> +# @IPFlowSpec:
> +#
> +# IP flow specification.
> +#
> +# @protocol: Transport layer protocol like TCP/UDP, etc. The protocol is the
> +#            string instead of enum, because it can be passed to getprotobyname(3)
> +#            and avoid duplication with /etc/protocols.

In review of v8, I wrote:

    The rationale is good, but it doesn't really belong into the interface
    documentation.  Suggest:

       # @protocol: Transport layer protocol like TCP/UDP, etc.  This will be
       #            passed to getprotobyname(3).

to which you replied "OK."  Please apply the change.

> +#
> +# @object-name: The @object-name means a qemu object with network packet
> +#               processing function, for example colo-compare, filtr-redirector
> +#               filtr-mirror, etc. VM can running with multi network packet

s/qemu/QEMU/

s/filtr/filter/ two times here, and more below.

s/VM/The VM/

s/multi/multiple/

Also, limit doc comment line length to 70 characters or so.

> +#               processing function objects. They can control different network
> +#               data paths from netdev or chardev. So it needs the object-name
> +#               to set the effective module.

Again, this is rationale, which doesn't really belong here.

What does belong here, but isn't: meaning of @object-name, i.e. how it
is resolved to a "qemu object with network packet processing function",
whatever that is.

I'm *guessing* it's the QOM path of a QOM object that provides a certain
interface.  Correct?

If yes, which interface exactly?  Is it a QOM interface?

The comment could then look like

  # QOM path to a QOM object that implements the MUMBLE interface.

with the details corrected / fleshed out.

> +#
> +# @source: Source address and port.
> +#
> +# @destination: Destination address and port.
> +#
> +# Since: 6.1
> +##
> +{ 'struct': 'IPFlowSpec',
> +  'data': { '*protocol': 'str', 'object-name': 'str',
> +    '*source': 'InetSocketAddressBase',
> +    '*destination': 'InetSocketAddressBase' } }
> +
> +##
> +# @passthrough-filter-add:
> +#
> +# Add passthrough entry IPFlowSpec to a qemu object with network packet
> +# processing function, for example filtr-mirror, COLO-compare, etc.
> +# The object-name is necessary. The protocol and source/destination IP and
> +# source/destination ports are optional. if only inputs part of the

Start your sentences with a capital letter, please.

More importantly, the paragraph is confusing.  I suggested

   # Add an entry to the COLO network passthrough list.
   # Absent protocol, host addresses and ports match anything.

> +# information, it will match all traffic.
> +#
> +# Returns: Nothing on success
> +#
> +# Since: 6.1
> +#
> +# Example:
> +#
> +# -> { "execute": "passthrough-filter-add",
> +#      "arguments": { "protocol": "tcp", "object-name": "object0",
> +#      "source": {"host": "192.168.1.1", "port": "1234"},
> +#      "destination": {"host": "192.168.1.2", "port": "4321"} } }
> +# <- { "return": {} }
> +#
> +##
> +{ 'command': 'passthrough-filter-add', 'boxed': true,
> +     'data': 'IPFlowSpec' }
> +
> +##
> +# @passthrough-filter-del:
> +#
> +# Delete passthrough entry IPFlowSpec to a qemu object with network packet
> +# processing function, for example filtr-mirror, COLO-compare, etc.
> +# The object-name is necessary. The protocol and source/destination IP and
> +# source/destination ports are optional. if only inputs part of the

Likewise.  I suggested

   # Delete an entry from the COLO network passthrough list.

as first sentence.  The remainder needs to explain how the arguments are
used to select the entry to delete.  Something like

   # Deletes the entry with exactly this protocol, host addresses and
   # ports.
     
assuming that's what it actually does.

I reiterate my strong dislike for selecting the object to delete with a
pattern match.  The common way to refer to objects is by ID.

> +# information, only the exact same rule will be deleted.
> +#
> +# Returns: Nothing on success
> +#
> +# Since: 6.1
> +#
> +# Example:
> +#
> +# -> { "execute": "passthrough-filter-del",
> +#      "arguments": { "protocol": "tcp", "object-name": "object0",
> +#      "source": {"host": "192.168.1.1", "port": "1234"},
> +#      "destination": {"host": "192.168.1.2", "port": "4321"} } }
> +# <- { "return": {} }
> +#
> +##
> +{ 'command': 'passthrough-filter-del', 'boxed': true,
> +     'data': 'IPFlowSpec' }


