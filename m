Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 889604571FE
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 16:46:37 +0100 (CET)
Received: from localhost ([::1]:38452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo660-0003BH-Jm
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 10:46:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mo63f-0001mc-JW
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 10:44:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43051)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mo63d-0004wl-AR
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 10:44:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637336647;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dtvnQgipxFq0IerI+u5gtAPm+n0R2itrRyJqZm3lcVo=;
 b=d1OnW8ctd46JhZONBdNfWEI8RV8vOixXIXikc50PvNMdU+iv35zaw5OI1Bsxo0g5S54Ydc
 6s5ucBjyH4Me2rfaFOxfTBPUZcC4HP2/N1UGpBSesC8cALYG7HXWAo6K85iJCyjWPRTL9M
 n4A52F8pt6oTAXzdhJ4SKUk/uQ+tj5c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-263-wR59SdtzOm2HD2WIxMqq3w-1; Fri, 19 Nov 2021 10:44:04 -0500
X-MC-Unique: wR59SdtzOm2HD2WIxMqq3w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 707E8871807;
 Fri, 19 Nov 2021 15:44:03 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0EF4260BF1;
 Fri, 19 Nov 2021 15:44:03 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 629D511380A7; Fri, 19 Nov 2021 16:44:01 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Zhang Chen <chen.zhang@intel.com>
Subject: Re: [PATCH for 7.0 V10 1/6] qapi/net: Add IPFlowSpec and QMP
 command for filter passthrough
References: <20211112031112.9303-1-chen.zhang@intel.com>
 <20211112031112.9303-2-chen.zhang@intel.com>
Date: Fri, 19 Nov 2021 16:44:01 +0100
In-Reply-To: <20211112031112.9303-2-chen.zhang@intel.com> (Zhang Chen's
 message of "Fri, 12 Nov 2021 11:11:07 +0800")
Message-ID: <87ee7c5ewu.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: "Daniel P. =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 Li Zhijian <lizhijian@cn.fujitsu.com>, Jason Wang <jasowang@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 qemu-dev <qemu-devel@nongnu.org>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Zhang Chen <chen.zhang@intel.com> writes:

> Since the real user scenario does not need to monitor all traffic.
> Add passthrough-filter-add and passthrough-filter-del to maintain
> a network passthrough list in object with network packet processing
> function. Add IPFlowSpec struct for all QMP commands.
> Most the fields of IPFlowSpec are optional,except object-name.

This is too much "how", and not enough "why".

Less "how": drop everything after "Add IPFlowSpec ..." sentence.

More "why": I guess you tried with "Since the real user scenario does
not need to monitor all traffic."  I don't understand.  Possible because
it's not a sentence :)  What problem of interest are you trying to solve
with this patch?  How do the QMP commands added in this patch help solve
it?  Keep it brief.

> Signed-off-by: Zhang Chen <chen.zhang@intel.com>
> ---
>  net/net.c     | 10 +++++++
>  qapi/net.json | 73 +++++++++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 83 insertions(+)
>
> diff --git a/net/net.c b/net/net.c
> index f0d14dbfc1..5d0d5914fb 100644
> --- a/net/net.c
> +++ b/net/net.c
> @@ -1215,6 +1215,16 @@ void qmp_netdev_del(const char *id, Error **errp)
>      }
>  }
>  
> +void qmp_passthrough_filter_add(IPFlowSpec *spec, Error **errp)
> +{
> +    /* TODO implement setup passthrough rule */
> +}
> +
> +void qmp_passthrough_filter_del(IPFlowSpec *spec, Error **errp)
> +{
> +    /* TODO implement delete passthrough rule */
> +}
> +
>  static void netfilter_print_info(Monitor *mon, NetFilterState *nf)
>  {
>      char *str;
> diff --git a/qapi/net.json b/qapi/net.json
> index 7fab2e7cd8..5194aedcf5 100644
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
> @@ -696,3 +697,75 @@
>  ##
>  { 'event': 'FAILOVER_NEGOTIATED',
>    'data': {'device-id': 'str'} }
> +
> +##
> +# @IPFlowSpec:
> +#
> +# IP flow specification.
> +#
> +# @protocol: Transport layer protocol like TCP/UDP, etc. This will be
> +#            passed to getprotobyname(3).
> +#
> +# @object-name: The @object-name means a QEMU object with network
> +#               packet processing function, for example colo-compare,
> +#               filter-redirector, filter-mirror, etc. QOM path to
> +#               a QOM object that implements their own passthrough
> +#               work in the original data processing flow. What is
> +#               exposed to the outside world is an operable
> +#               passthrough list.

I don't like @object-name, because it's a *path*, not a name.  We use
@qom-path elsewhere.

The documentation still makes no sense to me.  I suggested something
like

    # @qom-path: An object that implements the MUMBLE interface.

This assumes the thing the valid objects have in common is a QOM
interface (whose name I don't know, so I used MUMBLE).  If this is
incorrect, then replace "that implements..." by what they do have in
common.

Giving these kinds of objects a name will make the remainder of the
documentation *much* easier to write.  I can't, because I really have no
idea what this is all about, so I'll use MUMBLE as a placeholder name.

> +#
> +# @source: Source address and port.
> +#
> +# @destination: Destination address and port.
> +#
> +# Since: 7.0
> +##
> +{ 'struct': 'IPFlowSpec',
> +  'data': { '*protocol': 'str', 'object-name': 'str',
> +    '*source': 'InetSocketAddressBase',
> +    '*destination': 'InetSocketAddressBase' } }
> +
> +##
> +# @passthrough-filter-add:
> +#
> +# Add an entry to the QOM object own network passthrough list.

"to a MUMBLE object's network passthrough list"

> +# Absent protocol, host addresses and ports match anything.
> +#
> +# Returns: Nothing on success
> +#
> +# Since: 7.0
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
> +# Delete an entry from the QOM object own network passthrough list.

"from a MUMBLE object's network passthrough list"

> +# Deletes the entry with exactly this protocol, host addresses
> +# and ports.

I reiterate my strong dislike for selecting the object to delete with a
pattern match.  The common way to refer to objects is by ID.  Have you
considered this?

> +#
> +# Returns: Nothing on success
> +#
> +# Since: 7.0
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


