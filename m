Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB6B6258D73
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Sep 2020 13:31:35 +0200 (CEST)
Received: from localhost ([::1]:44622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kD4Vi-0003Sx-M1
	for lists+qemu-devel@lfdr.de; Tue, 01 Sep 2020 07:31:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kD4Us-0002rI-US
 for qemu-devel@nongnu.org; Tue, 01 Sep 2020 07:30:42 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:50973
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kD4Uq-0008NN-3w
 for qemu-devel@nongnu.org; Tue, 01 Sep 2020 07:30:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598959838;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CducWV+BDMlTtoNZeD+hc0uuT8PCAjB1dLXIlWoL1rs=;
 b=iGGgzca3imAq0jq7E//zmiBKVvaAxQl7trePiwDVqYt1EncbpBImlL8+OiR46r8zPeX51v
 xPWIFrJxCstB5G8sdjxLxFo737xWAoQJf86u1cKEwxz0jjAP1mtw8BXY7TS4mJC0gKegfz
 jtO+rZIyn4IfKb0XNYgoIZ1egZ5ZBmg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-472-ZPwNIHTyOqavUFLHSRVNQA-1; Tue, 01 Sep 2020 07:30:36 -0400
X-MC-Unique: ZPwNIHTyOqavUFLHSRVNQA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 08E9210ABDBC;
 Tue,  1 Sep 2020 11:30:35 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-113-68.ams2.redhat.com
 [10.36.113.68])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7CEE4925BB;
 Tue,  1 Sep 2020 11:30:31 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id CFD85113C418; Tue,  1 Sep 2020 13:30:29 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Lukas Straub <lukasstraub2@web.de>
Subject: Re: [PATCH v8 1/8] Introduce yank feature
References: <cover.1598951375.git.lukasstraub2@web.de>
 <ab5c04766f270d53e90f17f76c0af7e5b66f8623.1598951375.git.lukasstraub2@web.de>
Date: Tue, 01 Sep 2020 13:30:29 +0200
In-Reply-To: <ab5c04766f270d53e90f17f76c0af7e5b66f8623.1598951375.git.lukasstraub2@web.de>
 (Lukas Straub's message of "Tue, 1 Sep 2020 11:15:07 +0200")
Message-ID: <87o8mpzqcq.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=205.139.110.120; envelope-from=armbru@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/01 05:11:36
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block <qemu-block@nongnu.org>, Juan Quintela <quintela@redhat.com>,
 "Dr. David
 Alan Gilbert" <dgilbert@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Lukas Straub <lukasstraub2@web.de> writes:

> The yank feature allows to recover from hanging qemu by "yanking"
> at various parts. Other qemu systems can register themselves and
> multiple yank functions. Then all yank functions for selected
> instances can be called by the 'yank' out-of-band qmp command.
> Available instances can be queried by a 'query-yank' oob command.
>
> Signed-off-by: Lukas Straub <lukasstraub2@web.de>
> Acked-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
[...]
> diff --git a/qapi/misc.json b/qapi/misc.json
> index 9d32820dc1..7de330416a 100644
> --- a/qapi/misc.json
> +++ b/qapi/misc.json
> @@ -1615,3 +1615,65 @@
>  ##
>  { 'command': 'query-vm-generation-id', 'returns': 'GuidInfo' }
>
> +##
> +# @YankInstances:
> +#
> +# @instances: List of yank instances.
> +#
> +# A yank instance can be yanked with the "yank" qmp command to recover from a
> +# hanging qemu.
> +#
> +# Yank instances are named after the following schema:
> +# "blockdev:<node-name>" refers to a block device. Currently only nbd block
> +# devices are implemented.
> +# "chardev:<chardev-name>" refers to a chardev. Currently only socket chardevs
> +# are implemented.

The two "Currently only ... are implemented" are redundant with ...

> +# "migration" refers to the migration currently in progress.
> +#
> +# Currently implemented yank instances:
> +#  -nbd block device:
> +#   Yanking it will shutdown the connection to the nbd server without
> +#   attempting to reconnect.
> +#  -socket chardev:
> +#   Yanking it will shutdown the connected socket.
> +#  -migration:
> +#   Yanking it will shutdown all migration connections.

... this list.  Not a blocker, but if you have to respin for some other
reason, consider deleting them.

> +#
> +# Since: 5.2
> +##
> +{ 'struct': 'YankInstances', 'data': {'instances': ['str'] } }
> +
> +##
> +# @yank:
> +#
> +# Recover from hanging qemu by yanking the specified instances. See
> +# "YankInstances" for more information.
> +#
> +# Takes @YankInstances as argument.
> +#
> +# Returns: nothing.
> +#
> +# Example:
> +#
> +# -> { "execute": "yank", "arguments": { "instances": ["blockdev:nbd0"] } }
> +# <- { "return": {} }
> +#
> +# Since: 5.2
> +##
> +{ 'command': 'yank', 'data': 'YankInstances', 'allow-oob': true }
> +
> +##
> +# @query-yank:
> +#
> +# Query yank instances. See "YankInstances" for more information.
> +#
> +# Returns: @YankInstances
> +#
> +# Example:
> +#
> +# -> { "execute": "query-yank" }
> +# <- { "return": { "instances": ["blockdev:nbd0"] } }
> +#
> +# Since: 5.2
> +##
> +{ 'command': 'query-yank', 'returns': 'YankInstances', 'allow-oob': true }

You addressed all my review comments nicely, except for the one
questioning the wisdom of encoding structured data into the instance
name.  Daniel and you pointed me to the spot where this was discussed
previously, in review of your v1.  I read the thread, and replied to it.
I'd like us to put this series on hold to give us time to discuss and
decide.

Thanks!

[...]


