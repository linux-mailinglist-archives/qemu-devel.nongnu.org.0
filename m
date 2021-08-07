Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A073E3563
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Aug 2021 14:56:30 +0200 (CEST)
Received: from localhost ([::1]:49138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mCLsL-0001aT-9G
	for lists+qemu-devel@lfdr.de; Sat, 07 Aug 2021 08:56:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mCLqe-0000tR-0m
 for qemu-devel@nongnu.org; Sat, 07 Aug 2021 08:54:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42432)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mCLqc-00008e-8c
 for qemu-devel@nongnu.org; Sat, 07 Aug 2021 08:54:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628340881;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qlf1CxCABtK+0PWlbOiWO0C3oeizPXzfhL0bczRuSpI=;
 b=K4CPVSwVF11tov3iBl3GayZtilB0ZkobenZKNn5mZQ6W+xnBET/mYehk41Bz9Ey7u0WofS
 hY8tLus1uFsx06HrKr8DKv7T0BwE/T3tdKZC2sdfg4L5YcScvM/uoJA6HqWdAJbP/GBLvL
 Tc+HY33sBNQTTC/TspdE3cSPnaqJQz8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-135-4bPBXFHsMcSL2pw7brIW6A-1; Sat, 07 Aug 2021 08:54:40 -0400
X-MC-Unique: 4bPBXFHsMcSL2pw7brIW6A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0BE55107ACF5;
 Sat,  7 Aug 2021 12:54:39 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-12.ams2.redhat.com
 [10.36.112.12])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 263CA5B826;
 Sat,  7 Aug 2021 12:54:35 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id AA25011380A0; Sat,  7 Aug 2021 14:54:33 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Andrew Melnychenko <andrew@daynix.com>
Subject: Re: [PATCH 5/5] qmp: Added qemu-ebpf-rss-path command.
References: <20210713153758.323614-1-andrew@daynix.com>
 <20210713153758.323614-6-andrew@daynix.com>
Date: Sat, 07 Aug 2021 14:54:33 +0200
In-Reply-To: <20210713153758.323614-6-andrew@daynix.com> (Andrew Melnychenko's
 message of "Tue, 13 Jul 2021 18:37:58 +0300")
Message-ID: <87y29dct4m.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
Cc: berrange@redhat.com, mst@redhat.com, jasowang@redhat.com,
 qemu-devel@nongnu.org, yuri.benditovich@daynix.com, yan@daynix.com,
 eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Andrew Melnychenko <andrew@daynix.com> writes:

> New qmp command to query ebpf helper.
> It's crucial that qemu and helper are in sync and in touch.
> Technically helper should pass eBPF fds that qemu may accept.
> And different qemu's builds may have different eBPF programs and helpers.
> Qemu returns helper that should "fit" to virtio-net.
>
> Signed-off-by: Andrew Melnychenko <andrew@daynix.com>

[...]

> diff --git a/qapi/misc.json b/qapi/misc.json
> index 156f98203e..9aaf8fbcca 100644
> --- a/qapi/misc.json
> +++ b/qapi/misc.json
> @@ -519,3 +519,36 @@
>   'data': { '*option': 'str' },
>   'returns': ['CommandLineOptionInfo'],
>   'allow-preconfig': true }
> +
> +##
> +# @HelperPath:
> +#
> +# Name of the helper and binary location.
> +##
> +{ 'struct': 'HelperPath',
> +  'data': {'name': 'str', 'path': 'str'} }
> +
> +##
> +# @query-helper-paths:
> +#
> +# Query helper paths. Initially, this command was added for
> +# qemu-ebpf-rss-helper. The qemu would check "the stamp" and
> +# returns proper helper.
> +#
> +# Returns: list of object that contains name and path for helper.
> +#
> +# Since: 6.1
> +#
> +# Example:
> +#
> +# -> { "execute": "query-helper-paths" }
> +# <- { "return": [
> +#        {
> +#          "name": "qemu-ebpf-rss-helper",
> +#          "path": "/usr/local/libexec/qemu-ebpf-rss-helper"
> +#        }
> +#      ]
> +#    }
> +#
> +##
> +{ 'command': 'query-helper-paths', 'returns': ['HelperPath'] }


Hmm.

I understand the desire to help management applications to use the right
helper.  But I'm not sure this command is actually useful.  The helper
may or may not be installed at the path compiled into QEMU.

What happens when you use the wrong helper?

Even if we conclude this is the right approach for this helper, we still
need to review the other helpers to see which of them we should have
query-helper-paths cover.


