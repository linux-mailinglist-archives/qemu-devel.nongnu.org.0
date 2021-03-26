Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 394D434AAC1
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 16:00:53 +0100 (CET)
Received: from localhost ([::1]:44038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPnxE-0001rT-6d
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 11:00:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lPnth-0006l5-90
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 10:57:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56503)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lPntf-00032J-IK
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 10:57:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616770630;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gLWBpRQXtsxyK7QaWANXpf0qwNi841FMjq4dOidtuMU=;
 b=PAFs8ixnCXM4G3xDKwbGepO0vjeVvDR4+N0Un1WgeN8tssv5mi//CmSmN5CC3FCeBlX6U7
 O1EtAVrwJRG1Z6IXZlRC34gtxEAZITf7J8aAl1PhUrMbRO2SQWg1rG4pP7tEsKxV7BwqfX
 tVxlURUGOL+UTGetekVQcnuu8Ul7mHo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-559--J5JBwBRNN2adJRvRw_1vQ-1; Fri, 26 Mar 2021 10:57:08 -0400
X-MC-Unique: -J5JBwBRNN2adJRvRw_1vQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 17108CC638
 for <qemu-devel@nongnu.org>; Fri, 26 Mar 2021 14:56:53 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7F0126C930;
 Fri, 26 Mar 2021 14:56:52 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 05A2711327E1; Fri, 26 Mar 2021 15:56:51 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v3 2/7] ui/vdagent: core infrastructure
References: <20210326092448.367016-1-kraxel@redhat.com>
 <20210326092448.367016-3-kraxel@redhat.com>
Date: Fri, 26 Mar 2021 15:56:50 +0100
In-Reply-To: <20210326092448.367016-3-kraxel@redhat.com> (Gerd Hoffmann's
 message of "Fri, 26 Mar 2021 10:24:43 +0100")
Message-ID: <87h7kyhsjx.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Gerd Hoffmann <kraxel@redhat.com> writes:

> The vdagent protocol allows the guest agent (spice-vdagent) and the
> spice client exchange messages to implement features which require
> guest cooperation, for example clipboard support.
>
> This is a qemu implementation of the spice client side.  This allows
> the spice guest agent talk to qemu directly when not using the spice
> protocol.
>
> usage: qemu \
>   -chardev vdagent,id=vdagent \
>   -device virtserialport,chardev=vdagent,name=com.redhat.spice.0
>
> This patch adds just the protocol basics: initial handshake and
> capability negotiation.
>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
[...]
> diff --git a/qapi/char.json b/qapi/char.json
> index 6413970fa73b..6e565ce42753 100644
> --- a/qapi/char.json
> +++ b/qapi/char.json
> @@ -390,6 +390,17 @@
>    'data': { '*size': 'int' },
>    'base': 'ChardevCommon' }
>  
> +##
> +# @ChardevVDAgent:
> +#
> +# Configuration info for vdagent.
> +#
> +# Since: 6.0
> +##
> +{ 'struct': 'ChardevVDAgent',
> +  'data': { },
> +  'base': 'ChardevCommon' }

ChardevVDAgent isn't strictly needed (it's identical to ChardevBackend),
but it may make the code easier to read or easier to change.  Okay.

Does it miss "'if': 'defined(CONFIG_SPICE)'"?

> +
>  ##
>  # @ChardevBackend:
>  #
> @@ -417,6 +428,8 @@
>                            'if': 'defined(CONFIG_SPICE)' },
>              'spiceport': { 'type': 'ChardevSpicePort',
>                             'if': 'defined(CONFIG_SPICE)' },
> +            'vdagent': { 'type': 'ChardevVDAgent',
> +                         'if': 'defined(CONFIG_SPICE)' },
>              'vc': 'ChardevVC',
>              'ringbuf': 'ChardevRingbuf',
>              # next one is just for compatibility


