Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A87932FC154
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 21:41:53 +0100 (CET)
Received: from localhost ([::1]:43970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1xp2-0006np-Nl
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 15:41:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l1wkW-0008Py-1B
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 14:33:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46385)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l1wkO-000129-Pv
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 14:33:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611084779;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fkTQ5/WXzd94MtjKQPpLZlXoufn3mUOMM/FnwJCjHqc=;
 b=Sbuy4aexW46Dp4//UzgEtegwDfgI4xA10OxkJM5fRhUY8vfK8ibX+jEn8MipZVQ2Ln5MuZ
 OS0bPVm2VDeEbKEArYeScFrtyXdBCQ+ozl66MX3Ns4GSvgGeVGueJuzlPssdG5wE+Ob8Jk
 39czR12AAdOWnXlHwkt0XSyDiMk8EOQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-179-BERvvOQTOdWguEnTQbpbpQ-1; Tue, 19 Jan 2021 14:32:57 -0500
X-MC-Unique: BERvvOQTOdWguEnTQbpbpQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0932859;
 Tue, 19 Jan 2021 19:32:56 +0000 (UTC)
Received: from [10.3.113.116] (ovpn-113-116.phx2.redhat.com [10.3.113.116])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 889F646;
 Tue, 19 Jan 2021 19:32:55 +0000 (UTC)
Subject: Re: [PATCH 1/3] qapi/net: Add new QMP command for COLO passthrough
To: Zhang Chen <chen.zhang@intel.com>, Jason Wang <jasowang@redhat.com>,
 qemu-dev <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
References: <20201224010918.19275-1-chen.zhang@intel.com>
 <20201224010918.19275-2-chen.zhang@intel.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <ae366160-74fe-ddbd-136b-d657a21007dd@redhat.com>
Date: Tue, 19 Jan 2021 13:32:54 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201224010918.19275-2-chen.zhang@intel.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.195,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Zhang Chen <zhangckid@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/23/20 7:09 PM, Zhang Chen wrote:
> From: Zhang Chen <chen.zhang@intel.com>
> 
> Since the real user scenario does not need to monitor all traffic.
> Add colo-passthrough-add and colo-passthrough-del to maintain
> a COLO network passthrough list.
> 
> Signed-off-by: Zhang Chen <chen.zhang@intel.com>

> --- a/qapi/net.json
> +++ b/qapi/net.json
> @@ -714,3 +714,49 @@
>  ##
>  { 'event': 'FAILOVER_NEGOTIATED',
>    'data': {'device-id': 'str'} }
> +
> +##
> +# @colo-passthrough-add:
> +#
> +# Add passthrough entry according to customer's needs in COLO-compare.
> +#
> +# @protocol: COLO passthrough just support TCP and UDP.
> +#
> +# @port: TCP or UDP port number.
> +#
> +# Returns: Nothing on success
> +#
> +# Since: 5.3

The next release is 6.0, not 5.3.

> +#
> +# Example:
> +#
> +# -> { "execute": "colo-passthrough-add",
> +#      "arguments": { "protocol": "tcp", "port": 3389 } }
> +# <- { "return": {} }
> +#
> +##
> +{ 'command': 'colo-passthrough-add',
> +     'data': {'protocol': 'str', 'port': 'uint32'} }

Should 'protocol' be an enum (finite set of values) rather than an
open-coded string (infinite number of values, even though you mentioned
in the docs above that only 'tcp' or 'udp' make sense)?  In fact, do we
already have existing QAPI types representing tcp/udp and a port number
that could be reused here, rather than open-coding yet another one?

> +
> +##
> +# @colo-passthrough-del:
> +#
> +# Delete passthrough entry according to customer's needs in COLO-compare.
> +#
> +# @protocol: COLO passthrough just support TCP and UDP.
> +#
> +# @port: TCP or UDP port number.
> +#
> +# Returns: Nothing on success
> +#
> +# Since: 5.3

another 6.0 spot

> +#
> +# Example:
> +#
> +# -> { "execute": "colo-passthrough-del",
> +#      "arguments": { "protocol": "tcp", "port": 3389 } }
> +# <- { "return": {} }
> +#
> +##
> +{ 'command': 'colo-passthrough-del',
> +     'data': {'protocol': 'str', 'port': 'uint32'} }
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


